--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-22 18:16:07 CEST

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
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 4729347)
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
-- TOC entry 225 (class 1259 OID 4729827)
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
-- TOC entry 224 (class 1259 OID 4729810)
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
-- TOC entry 217 (class 1259 OID 4729723)
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
-- TOC entry 193 (class 1259 OID 4729513)
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
-- TOC entry 196 (class 1259 OID 4729547)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4729472)
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
-- TOC entry 212 (class 1259 OID 4729672)
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
    pomembna boolean,
    sort integer
);


--
-- TOC entry 191 (class 1259 OID 4729497)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4729541)
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
-- TOC entry 201 (class 1259 OID 4729590)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4729615)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4729446)
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
-- TOC entry 180 (class 1259 OID 4729356)
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
-- TOC entry 181 (class 1259 OID 4729367)
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
-- TOC entry 184 (class 1259 OID 4729417)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4729321)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4729340)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4729622)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4729652)
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
-- TOC entry 221 (class 1259 OID 4729765)
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
-- TOC entry 183 (class 1259 OID 4729397)
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
-- TOC entry 186 (class 1259 OID 4729438)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4729596)
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
-- TOC entry 185 (class 1259 OID 4729424)
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
-- TOC entry 190 (class 1259 OID 4729489)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4729608)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4729714)
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
-- TOC entry 220 (class 1259 OID 4729758)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4729637)
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
-- TOC entry 200 (class 1259 OID 4729581)
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
-- TOC entry 199 (class 1259 OID 4729571)
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
-- TOC entry 219 (class 1259 OID 4729748)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4729704)
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
-- TOC entry 173 (class 1259 OID 4729292)
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
-- TOC entry 172 (class 1259 OID 4729290)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2688 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 4729646)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4729330)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4729314)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4729660)
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
-- TOC entry 203 (class 1259 OID 4729602)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4729552)
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
-- TOC entry 182 (class 1259 OID 4729389)
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
-- TOC entry 198 (class 1259 OID 4729558)
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
-- TOC entry 218 (class 1259 OID 4729737)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    dovoliprekrivanje boolean,
    maxprekrivanj integer,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 4729458)
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
-- TOC entry 174 (class 1259 OID 4729301)
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
-- TOC entry 223 (class 1259 OID 4729790)
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
-- TOC entry 192 (class 1259 OID 4729504)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4729629)
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
-- TOC entry 214 (class 1259 OID 4729696)
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
-- TOC entry 194 (class 1259 OID 4729536)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4729780)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4729686)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4729295)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2634 (class 0 OID 4729347)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 4729827)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 4729810)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4729723)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4729513)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4729547)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4729472)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555f-5646-a0fd-6a64d0e2ca05	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555f-5646-ff46-61e20b09ac82	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555f-5646-3a83-c65f851f5735	AL	ALB	008	Albania 	Albanija	\N
00040000-555f-5646-081e-b74e837c2d2e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555f-5646-624c-138dadfa9747	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555f-5646-8579-9ebe70dacf55	AD	AND	020	Andorra 	Andora	\N
00040000-555f-5646-d8bb-d8d359ba68fe	AO	AGO	024	Angola 	Angola	\N
00040000-555f-5646-bf99-069397fbe294	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555f-5646-2154-9260574e1ea2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555f-5646-393e-1c67c5c1881f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555f-5646-ebf4-43fc725ed36e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555f-5646-2652-b96a9799ec42	AM	ARM	051	Armenia 	Armenija	\N
00040000-555f-5646-bf88-27fa1bafab54	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555f-5646-c940-3356042565d6	AU	AUS	036	Australia 	Avstralija	\N
00040000-555f-5646-c704-878769d1c785	AT	AUT	040	Austria 	Avstrija	\N
00040000-555f-5646-905c-bd7469bb17c3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555f-5646-5d5a-c971e9d21080	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555f-5646-4719-d2fd403eab2a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555f-5646-e2fe-86fb26f1df34	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555f-5646-d85d-325f0ce855ea	BB	BRB	052	Barbados 	Barbados	\N
00040000-555f-5646-8191-93c3c1cf11d0	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555f-5646-781a-bff6ee853cc0	BE	BEL	056	Belgium 	Belgija	\N
00040000-555f-5646-ab92-2b9f456a55c5	BZ	BLZ	084	Belize 	Belize	\N
00040000-555f-5646-4059-c1180bf866f5	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555f-5646-a2e6-6641d71b84fb	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555f-5646-0eda-f7989413f70d	BT	BTN	064	Bhutan 	Butan	\N
00040000-555f-5646-1019-e92d2ff08033	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555f-5646-68d2-bab2077f8ca1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555f-5646-9c2f-1e179f4dfc36	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555f-5646-e67a-9d9badf6e093	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555f-5646-70ba-9874ba843186	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555f-5646-5595-90a4af3e6147	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555f-5646-f169-d6726272fab1	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555f-5646-e2c1-a0c38805bd5f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555f-5646-85bf-b7be0416db46	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555f-5646-f53f-80a6e56779fe	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555f-5646-5429-77a69ca4aa85	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555f-5646-2d30-6493d860c786	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555f-5646-2a24-1920ac3bb72b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555f-5646-b5f9-5da3db94ca88	CA	CAN	124	Canada 	Kanada	\N
00040000-555f-5646-d589-70f5e9fa0bac	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555f-5646-6678-4f1ea1a1e256	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555f-5646-6c9c-b9b7f61a8cbe	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555f-5646-8e17-36a60fd635d3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555f-5646-3d7c-db1f99509ad8	CL	CHL	152	Chile 	Čile	\N
00040000-555f-5646-1f0e-74bf0afb0391	CN	CHN	156	China 	Kitajska	\N
00040000-555f-5646-cc1d-b2971a520e97	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555f-5646-4a2d-444bba0eaebf	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555f-5646-c2ca-d299b314db28	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555f-5646-58ca-6e235b920624	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555f-5646-d45f-4e0cf17bbda5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555f-5646-2b43-44ffb2db7a96	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555f-5646-afdc-33d1803e9b7e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555f-5646-06cd-4cc36d7e3077	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555f-5646-6e09-617ef3f73ba3	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555f-5646-1fbe-ec112c105fe9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555f-5646-0d02-e6c1efd778f7	CU	CUB	192	Cuba 	Kuba	\N
00040000-555f-5646-144f-396f856d5b39	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555f-5646-d5cb-67bb2e12b592	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555f-5646-7a25-78e45efcaff5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555f-5646-4ef5-49136b9aa207	DK	DNK	208	Denmark 	Danska	\N
00040000-555f-5646-e0b1-2bc0b9226d1c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555f-5646-ff67-474ea5b10792	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555f-5646-e171-b69b50fc8e82	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555f-5646-ab20-ab963695bd78	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555f-5646-1631-cb13eeb2cf3e	EG	EGY	818	Egypt 	Egipt	\N
00040000-555f-5646-0965-31e7b0387064	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555f-5646-658d-1dfdcceee203	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555f-5646-33a6-fbc072f2575a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555f-5646-32af-f54322092ceb	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555f-5646-40d5-4d0f8e0405ee	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555f-5646-0e65-41485ea52969	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555f-5646-66b4-674a8bc503ef	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555f-5646-821c-069fdaf2a62e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555f-5646-2ec1-de98ff38afc7	FI	FIN	246	Finland 	Finska	\N
00040000-555f-5646-25c4-0f5bb10d5a99	FR	FRA	250	France 	Francija	\N
00040000-555f-5646-fa0a-08777ae4c103	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555f-5646-f482-dd11d9ba6a62	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555f-5646-77aa-1691c66fd69d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555f-5646-ecd5-2c9c50f5574b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555f-5646-4ed4-2a86b56ce5e1	GA	GAB	266	Gabon 	Gabon	\N
00040000-555f-5646-6f5e-540becee2e4a	GM	GMB	270	Gambia 	Gambija	\N
00040000-555f-5646-63e4-c4bc81e2a604	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555f-5646-1dea-59df078b7627	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555f-5646-f1fc-63291303f8fd	GH	GHA	288	Ghana 	Gana	\N
00040000-555f-5646-66c6-e1c66fbdf3e0	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555f-5646-016c-a8f4f585fd33	GR	GRC	300	Greece 	Grčija	\N
00040000-555f-5646-14d8-b0ae1928ee5e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555f-5646-cad5-fabdeaef2628	GD	GRD	308	Grenada 	Grenada	\N
00040000-555f-5646-fbc6-ad0a6676f2bd	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555f-5646-92c0-b000dc27a79a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555f-5646-cc9f-9e6f65350ab6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555f-5646-939e-aaad960d035d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555f-5646-b0f1-363ecfdd8784	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555f-5646-5ba9-6f730f3f14ab	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555f-5646-93a7-055325c6b80d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555f-5646-fda2-bf8c9ea88b5c	HT	HTI	332	Haiti 	Haiti	\N
00040000-555f-5646-44e0-1f8272f1e53d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555f-5646-1136-78a08fa0b886	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555f-5646-71cf-f989173561d6	HN	HND	340	Honduras 	Honduras	\N
00040000-555f-5646-f3e5-50b9828a8a38	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555f-5646-7cd3-487381e2600d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555f-5646-a641-22839496697d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555f-5646-5275-10af01156dd1	IN	IND	356	India 	Indija	\N
00040000-555f-5646-36c6-74c753a6e425	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555f-5646-b745-881639e3f026	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555f-5646-fff2-6983769d70af	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555f-5646-1119-83805a674785	IE	IRL	372	Ireland 	Irska	\N
00040000-555f-5646-8762-8678586b2970	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555f-5646-cbf3-68725b1a4cf0	IL	ISR	376	Israel 	Izrael	\N
00040000-555f-5646-39f7-65f0908bee75	IT	ITA	380	Italy 	Italija	\N
00040000-555f-5646-ee01-921d4b66d362	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555f-5646-7f49-2e753428d76a	JP	JPN	392	Japan 	Japonska	\N
00040000-555f-5646-d575-40b1f569100d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555f-5646-7c64-bf1c87c7255a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555f-5646-31ee-2e4638be3965	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555f-5646-518f-0b9f53fbba19	KE	KEN	404	Kenya 	Kenija	\N
00040000-555f-5646-6855-7046b9b0c765	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555f-5646-403e-d9181e85a33c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555f-5646-8b66-0fe0476b256d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555f-5646-d99a-1731249e189b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555f-5646-7e58-c35746c56d68	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555f-5646-f36a-2b32f5963847	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555f-5646-1c1d-59fc1b991e26	LV	LVA	428	Latvia 	Latvija	\N
00040000-555f-5646-ce55-f7ef5b72ed06	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555f-5646-983d-1118c702a007	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555f-5646-43fc-c18a4df7f364	LR	LBR	430	Liberia 	Liberija	\N
00040000-555f-5646-8e9e-f9e3ce11a0b7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555f-5646-f442-e15b9efc7902	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555f-5646-9e4a-6c190617ff8f	LT	LTU	440	Lithuania 	Litva	\N
00040000-555f-5646-732b-93f652da8c5d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555f-5646-debc-a8aa015ec63b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555f-5646-f1e0-1759a5d386a9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555f-5646-2040-e109e58d7ed0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555f-5646-24c9-16f28490ca14	MW	MWI	454	Malawi 	Malavi	\N
00040000-555f-5646-9fa8-489d214a876e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555f-5646-87e6-15174e46f0d2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555f-5646-a4e2-76b90dec4a65	ML	MLI	466	Mali 	Mali	\N
00040000-555f-5646-fa48-bb4343e05622	MT	MLT	470	Malta 	Malta	\N
00040000-555f-5646-a8e9-67785313231a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555f-5646-1228-70a47f4318ff	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555f-5646-811c-30bf209ad23c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555f-5646-c4ce-e1a09a36fe3b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555f-5646-9bd4-043d289cbe9d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555f-5646-f632-3880e2e7f2c8	MX	MEX	484	Mexico 	Mehika	\N
00040000-555f-5646-9144-f44939061883	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555f-5646-2c24-2b02cd30fbc3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555f-5646-95ec-2f86951ebc91	MC	MCO	492	Monaco 	Monako	\N
00040000-555f-5646-de12-45a9e5436862	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555f-5646-76a7-7168f3becb46	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555f-5646-e506-831ba9b8ca6c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555f-5646-0508-0e003794ef6f	MA	MAR	504	Morocco 	Maroko	\N
00040000-555f-5646-953f-da082c0b6c14	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555f-5646-db05-7679cfed97bd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555f-5646-241c-f4dabe42544b	NA	NAM	516	Namibia 	Namibija	\N
00040000-555f-5646-b323-e4322dd89800	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555f-5646-1ce6-4ec28f2267f6	NP	NPL	524	Nepal 	Nepal	\N
00040000-555f-5646-c292-e753787d3626	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555f-5646-cbc4-9f736a34271c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555f-5646-374a-f336e4980cce	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555f-5646-6b47-52bd2becb9dd	NE	NER	562	Niger 	Niger 	\N
00040000-555f-5646-5673-35beefea6d6f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555f-5646-4dae-1fd7afc72ab9	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555f-5646-b573-d18df47854d4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555f-5646-62ef-a2e91a106c94	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555f-5646-9d31-bf752854fd75	NO	NOR	578	Norway 	Norveška	\N
00040000-555f-5646-08af-9b3fd0af6403	OM	OMN	512	Oman 	Oman	\N
00040000-555f-5646-779a-e4c3f1c7bd1a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555f-5646-47b0-f82edc103e1d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555f-5646-ed4a-225fbb3f1adf	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555f-5646-4d41-cda358e40871	PA	PAN	591	Panama 	Panama	\N
00040000-555f-5646-597b-ff1c2cdeeb2e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555f-5646-6c41-12c0600220ea	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555f-5646-baa3-7ff8d87a9c4e	PE	PER	604	Peru 	Peru	\N
00040000-555f-5646-ffa7-8e6c88b5e998	PH	PHL	608	Philippines 	Filipini	\N
00040000-555f-5646-d1c8-4511e0e05698	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555f-5646-a9f8-c0ff65979a2a	PL	POL	616	Poland 	Poljska	\N
00040000-555f-5646-eb00-816f78aff386	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555f-5646-c791-6999e9b6a17c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555f-5646-8b87-4f6ca927be9a	QA	QAT	634	Qatar 	Katar	\N
00040000-555f-5646-7554-cb3fc294acfd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555f-5646-c239-cc7810ccf692	RO	ROU	642	Romania 	Romunija	\N
00040000-555f-5646-4518-a1941ab03ff8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555f-5646-8c4e-e8e724fc182b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555f-5646-16ff-9f13272db854	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555f-5646-0821-ce6fd98e729a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555f-5646-4962-19249c061be6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555f-5646-11d5-4795fe0c7970	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555f-5646-e7f1-ab2f9ad7d4ea	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555f-5646-a717-d7feb5446278	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555f-5646-059f-84c9e4e2f03d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555f-5646-3052-2c03c310f7ca	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555f-5646-ab27-7902d7ef4d00	SM	SMR	674	San Marino 	San Marino	\N
00040000-555f-5646-1e3d-6a7d82addddf	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555f-5646-f945-da9924384299	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555f-5646-0923-bda5db73a092	SN	SEN	686	Senegal 	Senegal	\N
00040000-555f-5646-7b09-1ea5b4f283ee	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555f-5646-5bf6-7ef82ad0b6ed	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555f-5646-6e26-4d00f6ff6447	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555f-5646-71ce-694fa76893d9	SG	SGP	702	Singapore 	Singapur	\N
00040000-555f-5646-1abc-d16eaa4160ce	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555f-5646-4367-481763c540ad	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555f-5646-4815-d2ad5de956e5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555f-5646-2132-2a396f36015d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555f-5646-068d-6426887d805c	SO	SOM	706	Somalia 	Somalija	\N
00040000-555f-5646-9306-a6c30cd3d3f0	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555f-5646-4dd3-c79a32f75d68	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555f-5646-080f-a7e535b79e55	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555f-5646-8010-f2b8efe31935	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555f-5646-8ded-315c05375eb3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555f-5646-f3e9-1e1e3054e967	SD	SDN	729	Sudan 	Sudan	\N
00040000-555f-5646-e687-905f83708e30	SR	SUR	740	Suriname 	Surinam	\N
00040000-555f-5646-09cc-67fd3b9c1a35	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555f-5646-30af-2ce109b4e9bd	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555f-5646-1805-64701adb1ae4	SE	SWE	752	Sweden 	Švedska	\N
00040000-555f-5646-01e8-e40a37a91be8	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555f-5646-585a-00da92d64fd3	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555f-5646-60a6-ad502b6bc1d0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555f-5646-2530-d374082a34de	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555f-5646-e69a-08cb58fdc3e3	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555f-5646-e398-5e97d2f14706	TH	THA	764	Thailand 	Tajska	\N
00040000-555f-5646-58e5-cb49120cae00	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555f-5646-5678-81b381bb66b2	TG	TGO	768	Togo 	Togo	\N
00040000-555f-5646-287b-2875b61ed6a4	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555f-5646-0cc7-b178fec5b423	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555f-5646-afb3-eeb74a402d80	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555f-5646-8611-a245c6b2a0bc	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555f-5646-a1b1-92b8fcebda0f	TR	TUR	792	Turkey 	Turčija	\N
00040000-555f-5646-a1d2-7f7f9365fcb6	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555f-5646-3248-48c5bc60028d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555f-5646-c912-e4588ab45b8c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555f-5646-72b9-bae99c564bae	UG	UGA	800	Uganda 	Uganda	\N
00040000-555f-5646-d970-3beccf01ee0c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555f-5646-0ce0-db48062e5e57	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555f-5646-d941-52e604d4aabb	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555f-5646-6209-17c4adc8e92f	US	USA	840	United States 	Združene države Amerike	\N
00040000-555f-5646-f752-f636405a1c22	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555f-5646-9317-378a16aaf719	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555f-5646-dcbb-0d67da9fe939	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555f-5646-87fc-3b4fa75135f9	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555f-5646-0734-105aca59d448	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555f-5646-5427-18545540a567	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555f-5646-a13d-21f79097164f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555f-5646-33c7-e8e21034f25d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555f-5646-f8d6-8d050c5406b5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555f-5646-24e3-1e06c17978c1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555f-5646-eade-9ff21dd8fc92	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555f-5646-0725-9870aa267453	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555f-5646-688e-851b9c9eed30	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2667 (class 0 OID 4729672)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4729497)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4729541)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2625 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4729590)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4729615)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4729446)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555f-5646-686c-db39cd58afc7	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555f-5646-591d-faf467c4b914	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555f-5646-9d60-056e5bf4a799	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555f-5646-eef4-87fd6f9d5f07	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555f-5646-dc24-732bedb8bff2	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555f-5646-230a-0f12500e454c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555f-5646-17be-7e0975b1933b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555f-5646-7378-580d6531da1d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555f-5646-2eb2-5d2725fe1040	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555f-5646-acd4-239c17e4998c	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555f-5646-7745-9a82eaa4a6e4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-555f-5646-477f-628b7a1e17bf	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-555f-5646-006e-1295db7c6c8c	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-555f-5646-18fe-5d25110aaf9c	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2635 (class 0 OID 4729356)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555f-5646-5f42-ffa5c4ad50e9	00000000-555f-5646-dc24-732bedb8bff2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555f-5646-d30d-3f057db2b712	00000000-555f-5646-dc24-732bedb8bff2	00010000-555f-5646-54ac-44e35bf90c1a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555f-5646-8cce-de12564ca6dc	00000000-555f-5646-230a-0f12500e454c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2636 (class 0 OID 4729367)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4729417)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 4729321)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555f-5646-ff54-c7670dea43ab	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555f-5646-c30c-9c8d41851904	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555f-5646-b56a-3b0969cb6834	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555f-5646-efd3-e750d4268d22	Abonma-read	Abonma - branje	f
00030000-555f-5646-cf77-5ffab414bae7	Abonma-write	Abonma - spreminjanje	f
00030000-555f-5646-29b1-b0a07868e707	Alternacija-read	Alternacija - branje	f
00030000-555f-5646-8cd2-35d4e0bd5b81	Alternacija-write	Alternacija - spreminjanje	f
00030000-555f-5646-3687-b1691fe25026	Arhivalija-read	Arhivalija - branje	f
00030000-555f-5646-88cf-bfa15dbfadb5	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555f-5646-32de-1d3c2a15da3a	Besedilo-read	Besedilo - branje	f
00030000-555f-5646-047d-9bc0f8d827d1	Besedilo-write	Besedilo - spreminjanje	f
00030000-555f-5646-854e-2338fef5dcce	DogodekIzven-read	DogodekIzven - branje	f
00030000-555f-5646-a84b-d39cfa8ef8bb	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555f-5646-da8b-fbe3f4fc4c67	Dogodek-read	Dogodek - branje	f
00030000-555f-5646-0b8e-40bb3a51ea04	Dogodek-write	Dogodek - spreminjanje	f
00030000-555f-5646-c421-d96763951e18	Drzava-read	Drzava - branje	f
00030000-555f-5646-f44f-d2548365dec9	Drzava-write	Drzava - spreminjanje	f
00030000-555f-5646-a9b3-e7c0a33d6a89	Funkcija-read	Funkcija - branje	f
00030000-555f-5646-ef1f-e6062e547c3b	Funkcija-write	Funkcija - spreminjanje	f
00030000-555f-5646-8fc9-ecf5d0ae1cbd	Gostovanje-read	Gostovanje - branje	f
00030000-555f-5646-e875-0d57995c4af4	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555f-5646-3777-1a40dfca70ca	Gostujoca-read	Gostujoca - branje	f
00030000-555f-5646-9ebd-32060c9fa323	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555f-5646-2686-acd48ed01030	Kupec-read	Kupec - branje	f
00030000-555f-5646-53ed-f270e11e6c90	Kupec-write	Kupec - spreminjanje	f
00030000-555f-5646-23ea-4936e3698b52	NacinPlacina-read	NacinPlacina - branje	f
00030000-555f-5646-23e3-cf1ff4c4fab3	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555f-5646-a104-0e42de269338	Option-read	Option - branje	f
00030000-555f-5646-bcd2-2e8e8451f77b	Option-write	Option - spreminjanje	f
00030000-555f-5646-fb7a-f619cf034f80	OptionValue-read	OptionValue - branje	f
00030000-555f-5646-2e62-44f09a57a0a1	OptionValue-write	OptionValue - spreminjanje	f
00030000-555f-5646-8307-6697a10245f6	Oseba-read	Oseba - branje	f
00030000-555f-5646-bf2f-9b2f14591ff1	Oseba-write	Oseba - spreminjanje	f
00030000-555f-5646-0a01-f4bac40ad21e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555f-5646-fedb-da6347881e36	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555f-5646-457d-3fc23d411c1e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555f-5646-fee3-d046de22511a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555f-5646-a90b-4ee5ae9a3936	Pogodba-read	Pogodba - branje	f
00030000-555f-5646-4e1f-27185b83d19c	Pogodba-write	Pogodba - spreminjanje	f
00030000-555f-5646-de82-1cbec5777b71	Popa-read	Popa - branje	f
00030000-555f-5646-b87d-f940ecf1b5ca	Popa-write	Popa - spreminjanje	f
00030000-555f-5646-6202-dc8046c8317f	Posta-read	Posta - branje	f
00030000-555f-5646-b1a3-638dfc22176c	Posta-write	Posta - spreminjanje	f
00030000-555f-5646-5be6-ce268105e239	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555f-5646-a9a6-3dfff1173bbd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555f-5646-010b-9b7aee3f5c2a	PostniNaslov-read	PostniNaslov - branje	f
00030000-555f-5646-23cd-71ee33c82b1a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555f-5646-da8b-0bf1a4208931	Predstava-read	Predstava - branje	f
00030000-555f-5646-f71c-ffded4b39d2b	Predstava-write	Predstava - spreminjanje	f
00030000-555f-5646-2979-89457d6862ca	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555f-5646-d506-d89c9977bdb0	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555f-5646-14c3-4c16f0662132	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555f-5646-ceb7-d4a18dff31c4	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555f-5646-bccb-a91d4706cdc5	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555f-5646-3b46-28a4f61a5ca6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555f-5646-de2b-5374c4dad029	Prostor-read	Prostor - branje	f
00030000-555f-5646-916f-f51af072635c	Prostor-write	Prostor - spreminjanje	f
00030000-555f-5646-f2b1-7d0618d78ef4	Racun-read	Racun - branje	f
00030000-555f-5646-26e2-3ea9af69a9b9	Racun-write	Racun - spreminjanje	f
00030000-555f-5646-1e1c-aa8ec2617cac	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555f-5646-1859-afe60ab6640f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555f-5646-0849-3077e42e781d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555f-5646-85ea-b8afe9f6a7c9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555f-5646-26b4-ce54c2f22fdb	Rekvizit-read	Rekvizit - branje	f
00030000-555f-5646-daf0-b4ee9d60ee15	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555f-5646-ef6a-534fd28b4daa	Rezervacija-read	Rezervacija - branje	f
00030000-555f-5646-0ef4-d23e7116bdf8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555f-5646-7f51-c1c7bdc1c741	SedezniRed-read	SedezniRed - branje	f
00030000-555f-5646-457b-231608747bf4	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555f-5646-8b9f-6345317d8bb5	Sedez-read	Sedez - branje	f
00030000-555f-5646-868e-9a9c741b2272	Sedez-write	Sedez - spreminjanje	f
00030000-555f-5646-d63f-82fd383858bb	Sezona-read	Sezona - branje	f
00030000-555f-5646-f7bb-9cde38dd7e02	Sezona-write	Sezona - spreminjanje	f
00030000-555f-5646-ad5d-466c4a75276c	Telefonska-read	Telefonska - branje	f
00030000-555f-5646-b69f-0ce75bcefb0e	Telefonska-write	Telefonska - spreminjanje	f
00030000-555f-5646-c691-a3a3885dae76	TerminStoritve-read	TerminStoritve - branje	f
00030000-555f-5646-4f45-53d2705927dc	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555f-5646-c47c-f66beadb1045	TipFunkcije-read	TipFunkcije - branje	f
00030000-555f-5646-6cc6-58b6ce8f1513	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555f-5646-8c4d-8881b0ecd4e7	Trr-read	Trr - branje	f
00030000-555f-5646-d89e-cf79fb46ab2f	Trr-write	Trr - spreminjanje	f
00030000-555f-5646-518c-6247d40104fd	Uprizoritev-read	Uprizoritev - branje	f
00030000-555f-5646-0f4c-fec901fd01dd	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555f-5646-dba1-fd8d9b17e6cf	Vaja-read	Vaja - branje	f
00030000-555f-5646-ffcc-b71a7873733f	Vaja-write	Vaja - spreminjanje	f
00030000-555f-5646-adc4-f836dd83d279	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555f-5646-4cba-f9dc27a18ef0	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555f-5646-c433-449beaff8c67	Zaposlitev-read	Zaposlitev - branje	f
00030000-555f-5646-b7b5-349c0ac6e023	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555f-5646-75cc-2521e4145377	Zasedenost-read	Zasedenost - branje	f
00030000-555f-5646-798c-78c1e84e9c5e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555f-5646-b194-2ed64a31a055	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555f-5646-7185-044c708428f3	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555f-5646-f45a-3a894fbd8317	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555f-5646-866b-71b2bacda1d4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2633 (class 0 OID 4729340)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555f-5646-3c42-1dc245c7a41b	00030000-555f-5646-c421-d96763951e18
00020000-555f-5646-d316-4ae63ab6fb62	00030000-555f-5646-f44f-d2548365dec9
00020000-555f-5646-d316-4ae63ab6fb62	00030000-555f-5646-c421-d96763951e18
\.


--
-- TOC entry 2661 (class 0 OID 4729622)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 4729652)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 4729765)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 4729397)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-555f-5646-1fcb-7c7df80fb0ea	00040000-555f-5646-a0fd-6a64d0e2ca05	1000	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-555f-5646-57b3-3882259b56eb	00040000-555f-5646-a0fd-6a64d0e2ca05	1001	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2641 (class 0 OID 4729438)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555f-5645-89c9-5a7cc3c86650	8341	Adlešiči
00050000-555f-5645-a8dd-51da2c9f96d1	5270	Ajdovščina
00050000-555f-5645-9b28-6725b05e2b38	6280	Ankaran/Ancarano
00050000-555f-5645-e89e-75b6871b0857	9253	Apače
00050000-555f-5645-9725-b5319094d676	8253	Artiče
00050000-555f-5645-fad5-799f75902741	4275	Begunje na Gorenjskem
00050000-555f-5645-5c6e-2a100291546d	1382	Begunje pri Cerknici
00050000-555f-5645-2b4f-0b02e02d20fc	9231	Beltinci
00050000-555f-5645-b835-10c9a37ac3b5	2234	Benedikt
00050000-555f-5645-9062-f4df997b5d6a	2345	Bistrica ob Dravi
00050000-555f-5645-7f1c-fac4f50a590b	3256	Bistrica ob Sotli
00050000-555f-5645-2f9f-df201605ac84	8259	Bizeljsko
00050000-555f-5645-9d4c-43adfcad7f82	1223	Blagovica
00050000-555f-5645-0f41-c98cad0e7932	8283	Blanca
00050000-555f-5645-8688-8b8bc6096943	4260	Bled
00050000-555f-5645-f71b-6bf608fa0a50	4273	Blejska Dobrava
00050000-555f-5645-733b-f9ffdb0b08f0	9265	Bodonci
00050000-555f-5645-3a54-86fbe4c0cc0b	9222	Bogojina
00050000-555f-5645-b9ce-f5c978c6b8a4	4263	Bohinjska Bela
00050000-555f-5645-a663-babe7c3a7d8d	4264	Bohinjska Bistrica
00050000-555f-5645-75a0-3e7de6b82452	4265	Bohinjsko jezero
00050000-555f-5645-d65c-095b8a120e5b	1353	Borovnica
00050000-555f-5645-b63b-86d55daaa0c1	8294	Boštanj
00050000-555f-5645-ac4c-b6f69516c5ab	5230	Bovec
00050000-555f-5645-d04e-d54176c5c47b	5295	Branik
00050000-555f-5645-3324-7577e98aced9	3314	Braslovče
00050000-555f-5645-a496-abc3caa2cddd	5223	Breginj
00050000-555f-5645-4afe-fd3a69d5ad3e	8280	Brestanica
00050000-555f-5645-feb1-827828c4d225	2354	Bresternica
00050000-555f-5645-103d-b1be8c536e50	4243	Brezje
00050000-555f-5645-2bee-97c5c149cd93	1351	Brezovica pri Ljubljani
00050000-555f-5645-dedb-2399786fae49	8250	Brežice
00050000-555f-5645-0436-108269dfdd71	4210	Brnik - Aerodrom
00050000-555f-5645-2039-9d7831661bb4	8321	Brusnice
00050000-555f-5645-f6ad-494af721ba17	3255	Buče
00050000-555f-5645-1e1b-aba3d653f281	8276	Bučka 
00050000-555f-5645-9302-c768168abd3f	9261	Cankova
00050000-555f-5645-97cc-807c18eb5b39	3000	Celje 
00050000-555f-5645-5744-53cd932bfb5e	3001	Celje - poštni predali
00050000-555f-5645-1170-bab78c210feb	4207	Cerklje na Gorenjskem
00050000-555f-5645-1be9-2070c8d9e260	8263	Cerklje ob Krki
00050000-555f-5645-8566-1404fbfd993b	1380	Cerknica
00050000-555f-5645-2b61-e61b03a4ac82	5282	Cerkno
00050000-555f-5645-8ae6-d5377174d98b	2236	Cerkvenjak
00050000-555f-5645-3173-5a3a5d9a4e4c	2215	Ceršak
00050000-555f-5645-ba17-08648adf9175	2326	Cirkovce
00050000-555f-5645-c111-117091a21291	2282	Cirkulane
00050000-555f-5645-ead9-6764ceac906a	5273	Col
00050000-555f-5645-2900-6e4779462018	8251	Čatež ob Savi
00050000-555f-5645-5489-28a3dc7ca27d	1413	Čemšenik
00050000-555f-5645-d7e9-f9dbf257876c	5253	Čepovan
00050000-555f-5645-b426-fb15281d7eb6	9232	Črenšovci
00050000-555f-5645-dd0c-d66219fec1f8	2393	Črna na Koroškem
00050000-555f-5645-6b24-98d04beb3d28	6275	Črni Kal
00050000-555f-5645-0188-c0c2cf5ba32c	5274	Črni Vrh nad Idrijo
00050000-555f-5645-4167-ae4ba9036352	5262	Črniče
00050000-555f-5645-8249-6695708fc779	8340	Črnomelj
00050000-555f-5645-fe8c-f9a81374e07d	6271	Dekani
00050000-555f-5645-f45f-bcf90a4be489	5210	Deskle
00050000-555f-5645-d441-c0f2c3a06f19	2253	Destrnik
00050000-555f-5645-42fd-6f89ed5a18cc	6215	Divača
00050000-555f-5645-b007-df20218409db	1233	Dob
00050000-555f-5645-fab6-a0729f62240c	3224	Dobje pri Planini
00050000-555f-5645-87d4-9a32aa639607	8257	Dobova
00050000-555f-5645-5b33-1adb10bae4c9	1423	Dobovec
00050000-555f-5645-8dec-6333dace6257	5263	Dobravlje
00050000-555f-5645-71c7-4a5eb781aefd	3204	Dobrna
00050000-555f-5645-e472-40b1d8a77b84	8211	Dobrnič
00050000-555f-5645-8001-bda34b5b7d9a	1356	Dobrova
00050000-555f-5645-9078-6d807c545aab	9223	Dobrovnik/Dobronak 
00050000-555f-5645-62dd-4206bc1d0c2c	5212	Dobrovo v Brdih
00050000-555f-5645-f16a-b3fbf80017f3	1431	Dol pri Hrastniku
00050000-555f-5645-d408-1c0fa50b6823	1262	Dol pri Ljubljani
00050000-555f-5645-abb0-9787cefa2f47	1273	Dole pri Litiji
00050000-555f-5645-e498-dfe9673ed89e	1331	Dolenja vas
00050000-555f-5645-def2-bd4abeb5f872	8350	Dolenjske Toplice
00050000-555f-5645-e663-7091c3c5db7b	1230	Domžale
00050000-555f-5645-a856-659ba28b3096	2252	Dornava
00050000-555f-5645-b980-5711b4b368ff	5294	Dornberk
00050000-555f-5645-9414-f07427995f3b	1319	Draga
00050000-555f-5645-aff7-9f11727fa8d4	8343	Dragatuš
00050000-555f-5645-02ac-0335a3e388fe	3222	Dramlje
00050000-555f-5645-c183-c05a34914352	2370	Dravograd
00050000-555f-5645-44e7-db3ff149723a	4203	Duplje
00050000-555f-5645-8db3-8da1e03d9717	6221	Dutovlje
00050000-555f-5645-f7b3-b4ba671b5504	8361	Dvor
00050000-555f-5645-248e-db6cf42868f2	2343	Fala
00050000-555f-5645-0459-c0198d2f5e4d	9208	Fokovci
00050000-555f-5645-7ada-2b3009336432	2313	Fram
00050000-555f-5645-47f5-81095e844f47	3213	Frankolovo
00050000-555f-5645-fa44-fa23ed24d80a	1274	Gabrovka
00050000-555f-5645-e3e5-7243d61387b0	8254	Globoko
00050000-555f-5645-18c0-736633f587ce	5275	Godovič
00050000-555f-5645-f8d9-84350c0f13d7	4204	Golnik
00050000-555f-5645-2f53-ad409a70251e	3303	Gomilsko
00050000-555f-5645-79c2-bf1ebb4351ec	4224	Gorenja vas
00050000-555f-5645-472f-7b5c2f7bfdc7	3263	Gorica pri Slivnici
00050000-555f-5645-6fb0-c1e290423a94	2272	Gorišnica
00050000-555f-5645-1e24-1212445f5976	9250	Gornja Radgona
00050000-555f-5645-4133-2dadaa0c65b5	3342	Gornji Grad
00050000-555f-5645-cf9f-3b34243283d5	4282	Gozd Martuljek
00050000-555f-5645-a91c-811c5d2f69db	6272	Gračišče
00050000-555f-5645-e77a-653031677fe8	9264	Grad
00050000-555f-5645-c771-95b6ccbaf585	8332	Gradac
00050000-555f-5645-a760-7f31455d2aec	1384	Grahovo
00050000-555f-5645-b5a7-f0dc10a96a20	5242	Grahovo ob Bači
00050000-555f-5645-9379-753b21c01955	5251	Grgar
00050000-555f-5645-e82c-ba018977c565	3302	Griže
00050000-555f-5645-444d-8c968c53842c	3231	Grobelno
00050000-555f-5645-212b-597abc1e07a3	1290	Grosuplje
00050000-555f-5645-f501-c99fc0436505	2288	Hajdina
00050000-555f-5645-8e68-e97ec5e2554a	8362	Hinje
00050000-555f-5645-927a-0ecb8e2e7ccf	2311	Hoče
00050000-555f-5645-a1ff-f85e4f730c2c	9205	Hodoš/Hodos
00050000-555f-5645-a792-41b306b25ec8	1354	Horjul
00050000-555f-5645-6575-8cc0cd2b4408	1372	Hotedršica
00050000-555f-5645-c7c6-d83a9489862c	1430	Hrastnik
00050000-555f-5645-1f54-198a69f50a89	6225	Hruševje
00050000-555f-5645-10e6-0ec99c725607	4276	Hrušica
00050000-555f-5645-e716-5657bc384c39	5280	Idrija
00050000-555f-5645-114c-ec4fd6bbd677	1292	Ig
00050000-555f-5645-c071-c501ddb74d76	6250	Ilirska Bistrica
00050000-555f-5645-8ef5-a4ef4afc8ce6	6251	Ilirska Bistrica-Trnovo
00050000-555f-5645-9627-fff84358cb4f	1295	Ivančna Gorica
00050000-555f-5645-4a91-381f89c84214	2259	Ivanjkovci
00050000-555f-5645-531d-b8f5f5aedb09	1411	Izlake
00050000-555f-5645-3c98-2d6ba66c4161	6310	Izola/Isola
00050000-555f-5645-3163-3b47298e928b	2222	Jakobski Dol
00050000-555f-5645-59a8-fc10397c53b2	2221	Jarenina
00050000-555f-5645-9756-a706023de322	6254	Jelšane
00050000-555f-5645-9a20-db573ab81e13	4270	Jesenice
00050000-555f-5645-ca37-a1f144cc98c5	8261	Jesenice na Dolenjskem
00050000-555f-5645-bce9-fb4844e294e2	3273	Jurklošter
00050000-555f-5645-dfc5-a769b7a9b4cb	2223	Jurovski Dol
00050000-555f-5645-7258-2c031a49bb79	2256	Juršinci
00050000-555f-5645-22d9-4296284bf3a7	5214	Kal nad Kanalom
00050000-555f-5645-adbc-f557c53bc55a	3233	Kalobje
00050000-555f-5645-c223-60aceaf37969	4246	Kamna Gorica
00050000-555f-5645-4fd9-994635a4083a	2351	Kamnica
00050000-555f-5645-7783-d3a211d3978c	1241	Kamnik
00050000-555f-5645-8692-66d0ec29b01b	5213	Kanal
00050000-555f-5645-6296-b751512336b6	8258	Kapele
00050000-555f-5645-45a9-e16ae3bc6d3a	2362	Kapla
00050000-555f-5645-4dc8-f2341e2f8356	2325	Kidričevo
00050000-555f-5645-cfd0-d6be33cb73be	1412	Kisovec
00050000-555f-5645-0fd4-d94b07ec78dc	6253	Knežak
00050000-555f-5645-bcb2-4a40f4934835	5222	Kobarid
00050000-555f-5645-fd3a-793063cefa8d	9227	Kobilje
00050000-555f-5645-fde2-4b86848637ce	1330	Kočevje
00050000-555f-5645-6c20-0eb65f822ed8	1338	Kočevska Reka
00050000-555f-5645-565b-fc5cd24fc01e	2276	Kog
00050000-555f-5645-1019-96f6163872ad	5211	Kojsko
00050000-555f-5645-05de-e006cc4983ac	6223	Komen
00050000-555f-5645-5a6b-9b9a1f9daaa9	1218	Komenda
00050000-555f-5645-5e11-023b4301fc7a	6000	Koper/Capodistria 
00050000-555f-5645-723a-95762b34f7c0	6001	Koper/Capodistria - poštni predali
00050000-555f-5645-9929-bf8a6fad2ae1	8282	Koprivnica
00050000-555f-5645-074e-25b859d15518	5296	Kostanjevica na Krasu
00050000-555f-5645-66b4-6e0ec6967084	8311	Kostanjevica na Krki
00050000-555f-5645-8f2c-976bbc87f460	1336	Kostel
00050000-555f-5645-e895-9bb153f7127d	6256	Košana
00050000-555f-5645-f358-f9b9ed4c6946	2394	Kotlje
00050000-555f-5645-5125-26dc1ffa3ae0	6240	Kozina
00050000-555f-5645-ffc0-b4c544ddbe47	3260	Kozje
00050000-555f-5645-9110-f0185e9321b2	4000	Kranj 
00050000-555f-5645-136a-8da669d84582	4001	Kranj - poštni predali
00050000-555f-5645-4397-3d6a1b6c24ce	4280	Kranjska Gora
00050000-555f-5645-6c93-05aa6c03c666	1281	Kresnice
00050000-555f-5645-718b-530a34182804	4294	Križe
00050000-555f-5645-2e5e-43d150118674	9206	Križevci
00050000-555f-5645-8665-0b11d9bcb239	9242	Križevci pri Ljutomeru
00050000-555f-5645-b455-c489283613c2	1301	Krka
00050000-555f-5645-fa86-9d21a6fba125	8296	Krmelj
00050000-555f-5645-94b9-9597eb5d28d5	4245	Kropa
00050000-555f-5645-8939-d6a65042ae8b	8262	Krška vas
00050000-555f-5645-0cc0-95cbf78b17eb	8270	Krško
00050000-555f-5645-3cf5-d8636d2ee51b	9263	Kuzma
00050000-555f-5645-c575-bae220342d14	2318	Laporje
00050000-555f-5645-256d-815f4bee8a2b	3270	Laško
00050000-555f-5645-3eda-aa2b0ec63fd8	1219	Laze v Tuhinju
00050000-555f-5645-d272-409055e2427d	2230	Lenart v Slovenskih goricah
00050000-555f-5645-d82c-33c75c272e2b	9220	Lendava/Lendva
00050000-555f-5645-cacb-a12244986fec	4248	Lesce
00050000-555f-5645-db04-de8092d57023	3261	Lesično
00050000-555f-5645-5d00-df4b3b4b1089	8273	Leskovec pri Krškem
00050000-555f-5645-7900-7bb5fce94598	2372	Libeliče
00050000-555f-5645-dad3-d3946aa5da19	2341	Limbuš
00050000-555f-5645-c88b-38533874681a	1270	Litija
00050000-555f-5645-ac21-c3d8f8ec6497	3202	Ljubečna
00050000-555f-5645-d61a-59c22e97d3e7	1000	Ljubljana 
00050000-555f-5645-09ef-75da95e560a0	1001	Ljubljana - poštni predali
00050000-555f-5645-0ee4-eb2ebf5a0a31	1231	Ljubljana - Črnuče
00050000-555f-5645-ad1c-968d2e3f6663	1261	Ljubljana - Dobrunje
00050000-555f-5645-66e4-0bc888a9c05d	1260	Ljubljana - Polje
00050000-555f-5645-c669-7e6810baccbd	1210	Ljubljana - Šentvid
00050000-555f-5645-540f-2f67b7af5b94	1211	Ljubljana - Šmartno
00050000-555f-5645-d23b-ca1f717bf8a0	3333	Ljubno ob Savinji
00050000-555f-5645-32a6-21e1a14f2510	9240	Ljutomer
00050000-555f-5645-730a-ee27dd249b60	3215	Loče
00050000-555f-5645-5260-76ed3b8b9269	5231	Log pod Mangartom
00050000-555f-5645-930d-9434c5ecbde2	1358	Log pri Brezovici
00050000-555f-5645-179c-03adcff13caf	1370	Logatec
00050000-555f-5645-2580-5af6f45d7fe8	1371	Logatec
00050000-555f-5645-60d4-6e633edda7d1	1434	Loka pri Zidanem Mostu
00050000-555f-5645-d01b-62aae85717ff	3223	Loka pri Žusmu
00050000-555f-5645-af05-de810152df09	6219	Lokev
00050000-555f-5645-63b1-5f1d32d9fe00	1318	Loški Potok
00050000-555f-5645-c83b-c0a3f448e8af	2324	Lovrenc na Dravskem polju
00050000-555f-5645-a4a7-776d245f8b3c	2344	Lovrenc na Pohorju
00050000-555f-5645-13c8-23bd0fdc4e99	3334	Luče
00050000-555f-5645-5fd9-e67055dd3bd8	1225	Lukovica
00050000-555f-5645-55fa-187859167b55	9202	Mačkovci
00050000-555f-5645-ae4e-8a0aa2528f41	2322	Majšperk
00050000-555f-5645-f70f-d07727c1e5ad	2321	Makole
00050000-555f-5645-87d7-55ebd2606753	9243	Mala Nedelja
00050000-555f-5645-4b9a-d6a05acf672a	2229	Malečnik
00050000-555f-5645-1047-d2b1a96a3592	6273	Marezige
00050000-555f-5645-83fe-726628334145	2000	Maribor 
00050000-555f-5645-7537-4c6ed5ba4641	2001	Maribor - poštni predali
00050000-555f-5645-fb3a-d91fa27eeebb	2206	Marjeta na Dravskem polju
00050000-555f-5645-6616-4d35894015a1	2281	Markovci
00050000-555f-5645-7a4c-3821a177120f	9221	Martjanci
00050000-555f-5645-faf4-3439f9665dc5	6242	Materija
00050000-555f-5645-256b-ce92c4347c6a	4211	Mavčiče
00050000-555f-5645-1714-bcfc1e5b1683	1215	Medvode
00050000-555f-5645-8193-9043730f900a	1234	Mengeš
00050000-555f-5645-0f52-fe8a591abba5	8330	Metlika
00050000-555f-5645-c40f-f819ab7c360d	2392	Mežica
00050000-555f-5645-a6bd-7bf6b9d03981	2204	Miklavž na Dravskem polju
00050000-555f-5645-95dd-54a84e971a4a	2275	Miklavž pri Ormožu
00050000-555f-5645-3277-eaaf1db913a8	5291	Miren
00050000-555f-5645-d2af-175d932cc57f	8233	Mirna
00050000-555f-5645-06d7-1ecae279e2dd	8216	Mirna Peč
00050000-555f-5645-aaae-175d68ed2127	2382	Mislinja
00050000-555f-5645-b79a-ed7f4f693392	4281	Mojstrana
00050000-555f-5645-3c68-5e261893647d	8230	Mokronog
00050000-555f-5645-50de-c9e671fea9c8	1251	Moravče
00050000-555f-5645-cdbb-1c1159ad3a00	9226	Moravske Toplice
00050000-555f-5645-7f02-027d7d2e4f3d	5216	Most na Soči
00050000-555f-5645-310e-e96fb17b3724	1221	Motnik
00050000-555f-5645-0ad9-c09e8e95bff3	3330	Mozirje
00050000-555f-5645-8bfe-01e1033080f2	9000	Murska Sobota 
00050000-555f-5645-dcf5-0650056265eb	9001	Murska Sobota - poštni predali
00050000-555f-5645-cdf1-9ca76dcf53b0	2366	Muta
00050000-555f-5645-363a-4f852a6e7ebe	4202	Naklo
00050000-555f-5645-0a4c-e1ce134d0755	3331	Nazarje
00050000-555f-5645-f71f-53ef5c6a89ea	1357	Notranje Gorice
00050000-555f-5645-06f7-75a484bbcc4b	3203	Nova Cerkev
00050000-555f-5645-1a30-b678ffe488f5	5000	Nova Gorica 
00050000-555f-5645-1a28-a47f9813198e	5001	Nova Gorica - poštni predali
00050000-555f-5645-61f0-d3e1efa2d5d3	1385	Nova vas
00050000-555f-5645-d5b6-a4d45740328d	8000	Novo mesto
00050000-555f-5645-0f7c-864f1ca75c40	8001	Novo mesto - poštni predali
00050000-555f-5645-34a5-36e32b3a70f3	6243	Obrov
00050000-555f-5645-7587-bcd83da0dc8f	9233	Odranci
00050000-555f-5645-145f-5d764a896152	2317	Oplotnica
00050000-555f-5645-e328-441d2d6e017f	2312	Orehova vas
00050000-555f-5645-cc12-e9f1d04867e5	2270	Ormož
00050000-555f-5645-d93d-598c5c928339	1316	Ortnek
00050000-555f-5645-0959-0e5ed20baed0	1337	Osilnica
00050000-555f-5645-ceef-c9588f499f00	8222	Otočec
00050000-555f-5645-dc6c-dc267b016a07	2361	Ožbalt
00050000-555f-5645-3bc0-b4a6451969a6	2231	Pernica
00050000-555f-5645-d82a-485ca12b9180	2211	Pesnica pri Mariboru
00050000-555f-5645-69c7-2aaab49166cb	9203	Petrovci
00050000-555f-5645-323a-44435c60a9fa	3301	Petrovče
00050000-555f-5645-934b-a049f53d7e01	6330	Piran/Pirano
00050000-555f-5645-f5fe-fc652639bb26	8255	Pišece
00050000-555f-5645-0a33-8ba717e743b4	6257	Pivka
00050000-555f-5645-b172-b08fda061fb3	6232	Planina
00050000-555f-5645-c8e9-3a517cd72efc	3225	Planina pri Sevnici
00050000-555f-5645-1388-03eefd39afd6	6276	Pobegi
00050000-555f-5645-d6fa-3eed3c69d1a6	8312	Podbočje
00050000-555f-5645-3b82-40effd662559	5243	Podbrdo
00050000-555f-5645-49b6-4bfb4a2c3910	3254	Podčetrtek
00050000-555f-5645-2703-0b7a6394fec6	2273	Podgorci
00050000-555f-5645-e601-9c6a950e4231	6216	Podgorje
00050000-555f-5645-8fed-9f03e73b056d	2381	Podgorje pri Slovenj Gradcu
00050000-555f-5645-602a-ef22b08cbead	6244	Podgrad
00050000-555f-5645-6827-f4d9d9bee695	1414	Podkum
00050000-555f-5645-b442-7beb7b2e42da	2286	Podlehnik
00050000-555f-5645-0ce9-e31b99deeb94	5272	Podnanos
00050000-555f-5645-b8bc-4ce293271e2f	4244	Podnart
00050000-555f-5645-1051-f8ce9335329d	3241	Podplat
00050000-555f-5645-e096-4d456a5d9a35	3257	Podsreda
00050000-555f-5645-bc0a-4e535fc15f50	2363	Podvelka
00050000-555f-5645-6372-f05d1141ea21	2208	Pohorje
00050000-555f-5645-81eb-213179a31e7c	2257	Polenšak
00050000-555f-5645-d665-fc705db8c2e0	1355	Polhov Gradec
00050000-555f-5645-d95d-a099d3fae323	4223	Poljane nad Škofjo Loko
00050000-555f-5645-2a46-5b1013eb00f2	2319	Poljčane
00050000-555f-5645-506c-be43153eb8c1	1272	Polšnik
00050000-555f-5645-a7c4-7372593e6959	3313	Polzela
00050000-555f-5645-7fe8-012a65b16896	3232	Ponikva
00050000-555f-5645-c661-0f0f19fab638	6320	Portorož/Portorose
00050000-555f-5645-00c1-dbca5d0b6844	6230	Postojna
00050000-555f-5645-74f8-82148c64dbc8	2331	Pragersko
00050000-555f-5645-f562-f65bf39cf23e	3312	Prebold
00050000-555f-5645-c506-3816fb26781e	4205	Preddvor
00050000-555f-5645-59a5-1a58c61aea48	6255	Prem
00050000-555f-5645-acc0-b765bff6ad89	1352	Preserje
00050000-555f-5645-b08e-0c54245d3635	6258	Prestranek
00050000-555f-5645-ad61-165d4fc122f8	2391	Prevalje
00050000-555f-5645-4c4d-d3d3202ffc3b	3262	Prevorje
00050000-555f-5645-9b07-67bfc0993ff8	1276	Primskovo 
00050000-555f-5645-506d-ca53c3fc1f65	3253	Pristava pri Mestinju
00050000-555f-5645-1a5a-573933feaf19	9207	Prosenjakovci/Partosfalva
00050000-555f-5645-6a9f-2fc48e5aff82	5297	Prvačina
00050000-555f-5645-fa98-f0f221a174b0	2250	Ptuj
00050000-555f-5645-272d-8d049c2edf96	2323	Ptujska Gora
00050000-555f-5645-0806-6e1139d5d6f0	9201	Puconci
00050000-555f-5645-05b3-eff802272ca8	2327	Rače
00050000-555f-5645-efef-88550cc2bb9e	1433	Radeče
00050000-555f-5645-c10b-c6eff3e6d9d0	9252	Radenci
00050000-555f-5645-9e0a-2d5567878dc1	2360	Radlje ob Dravi
00050000-555f-5645-1a37-e1ddfe96a373	1235	Radomlje
00050000-555f-5645-c636-92f7af9ff9d4	4240	Radovljica
00050000-555f-5645-84bb-c4a6be61dcc8	8274	Raka
00050000-555f-5645-6328-33d5808cba88	1381	Rakek
00050000-555f-5645-1183-54a5e7439afe	4283	Rateče - Planica
00050000-555f-5645-c0e5-1fed09529591	2390	Ravne na Koroškem
00050000-555f-5645-f267-1f6dea2fcea8	9246	Razkrižje
00050000-555f-5645-c5a4-7db9e05003f9	3332	Rečica ob Savinji
00050000-555f-5645-ae37-30b6681afe45	5292	Renče
00050000-555f-5645-2d77-d4b27b2e78d3	1310	Ribnica
00050000-555f-5645-6c87-cc033a075f22	2364	Ribnica na Pohorju
00050000-555f-5645-36d1-cf163b871912	3272	Rimske Toplice
00050000-555f-5645-9226-6a943d71b929	1314	Rob
00050000-555f-5645-9726-dd0fb1f3a2e0	5215	Ročinj
00050000-555f-5645-244b-d34b33d9da1b	3250	Rogaška Slatina
00050000-555f-5645-f308-83653fbea193	9262	Rogašovci
00050000-555f-5645-d253-6a8695092a71	3252	Rogatec
00050000-555f-5645-9dde-b037aa7282cd	1373	Rovte
00050000-555f-5645-a09d-d66745c1a30a	2342	Ruše
00050000-555f-5645-1b0b-3f2de740fcd6	1282	Sava
00050000-555f-5645-dd4b-4a7be022194e	6333	Sečovlje/Sicciole
00050000-555f-5645-2a54-f69184368538	4227	Selca
00050000-555f-5645-6815-249fe7810594	2352	Selnica ob Dravi
00050000-555f-5645-f7c1-7e366f8b9dc3	8333	Semič
00050000-555f-5645-525f-3dc2a867d2f6	8281	Senovo
00050000-555f-5645-825d-4310ad7943f4	6224	Senožeče
00050000-555f-5645-720c-89ce4ed485cf	8290	Sevnica
00050000-555f-5645-f445-1f206334b276	6210	Sežana
00050000-555f-5645-d3da-0f1c029d2616	2214	Sladki Vrh
00050000-555f-5645-67dd-8404d698ab27	5283	Slap ob Idrijci
00050000-555f-5645-117a-bc6576601c0d	2380	Slovenj Gradec
00050000-555f-5645-4ff9-1fd46693be74	2310	Slovenska Bistrica
00050000-555f-5645-7e82-ef4de17d012b	3210	Slovenske Konjice
00050000-555f-5645-d6f8-71ef4fc3857c	1216	Smlednik
00050000-555f-5645-45c6-3171e82eab6a	5232	Soča
00050000-555f-5645-7ec5-38d5d4ea5653	1317	Sodražica
00050000-555f-5645-88cb-533269a29cbd	3335	Solčava
00050000-555f-5645-3d84-56fb2a7da77a	5250	Solkan
00050000-555f-5645-7604-abdd9da70248	4229	Sorica
00050000-555f-5645-85c1-9679a3062e9c	4225	Sovodenj
00050000-555f-5645-7998-b3ddf6535112	5281	Spodnja Idrija
00050000-555f-5645-8dfa-39d86fec76b6	2241	Spodnji Duplek
00050000-555f-5645-e96f-36b27a83fd25	9245	Spodnji Ivanjci
00050000-555f-5645-2613-a4eef7660314	2277	Središče ob Dravi
00050000-555f-5645-c7c2-5a67530e3498	4267	Srednja vas v Bohinju
00050000-555f-5645-5d14-d0ea9bab5dcf	8256	Sromlje 
00050000-555f-5645-bfc4-6645e026a665	5224	Srpenica
00050000-555f-5645-4eb6-58ffd5484744	1242	Stahovica
00050000-555f-5645-e828-83afc4b98ebd	1332	Stara Cerkev
00050000-555f-5645-15b0-909e09da5351	8342	Stari trg ob Kolpi
00050000-555f-5645-8997-02596a909c1d	1386	Stari trg pri Ložu
00050000-555f-5645-0d0c-c2201005de8c	2205	Starše
00050000-555f-5645-b31e-df3781e39b48	2289	Stoperce
00050000-555f-5645-8db0-784e024e277e	8322	Stopiče
00050000-555f-5645-d8e7-044c735bfb76	3206	Stranice
00050000-555f-5645-505d-d5c230448e50	8351	Straža
00050000-555f-5645-9b17-5359fd3b3cfe	1313	Struge
00050000-555f-5645-355a-769b5439426b	8293	Studenec
00050000-555f-5645-c296-50a5b78586d8	8331	Suhor
00050000-555f-5645-f2b4-02270e85b532	2233	Sv. Ana v Slovenskih goricah
00050000-555f-5645-9c7e-9437cbccc561	2235	Sv. Trojica v Slovenskih goricah
00050000-555f-5645-5ea0-5a7040932190	2353	Sveti Duh na Ostrem Vrhu
00050000-555f-5645-3688-98467ef5f13a	9244	Sveti Jurij ob Ščavnici
00050000-555f-5645-a50f-77f1718b7227	3264	Sveti Štefan
00050000-555f-5645-9dce-d19809bd9c0f	2258	Sveti Tomaž
00050000-555f-5645-1736-918cbcc23f71	9204	Šalovci
00050000-555f-5645-a16c-5849d82ca9c1	5261	Šempas
00050000-555f-5645-b9a5-f636a0ae105e	5290	Šempeter pri Gorici
00050000-555f-5645-a5c6-4bb2325e0d50	3311	Šempeter v Savinjski dolini
00050000-555f-5645-a43f-bec87c2cf7a4	4208	Šenčur
00050000-555f-5645-2f5a-961c92a4743d	2212	Šentilj v Slovenskih goricah
00050000-555f-5645-5481-538d2ec7547e	8297	Šentjanž
00050000-555f-5645-67ad-0a97d77b2acb	2373	Šentjanž pri Dravogradu
00050000-555f-5645-643e-9ef64f0c6ae4	8310	Šentjernej
00050000-555f-5645-526e-776c60d4c3b1	3230	Šentjur
00050000-555f-5645-78cf-76666fa38c52	3271	Šentrupert
00050000-555f-5645-9f7a-bd351a29a9ac	8232	Šentrupert
00050000-555f-5645-fd80-eb13753ceee8	1296	Šentvid pri Stični
00050000-555f-5645-41bf-51b5a500019b	8275	Škocjan
00050000-555f-5645-be3d-fbefca41cf42	6281	Škofije
00050000-555f-5645-d5fb-3d6f57452fed	4220	Škofja Loka
00050000-555f-5645-98e5-5278a7c5352b	3211	Škofja vas
00050000-555f-5645-89d5-bb2426020809	1291	Škofljica
00050000-555f-5645-6a08-6ea5269b7a96	6274	Šmarje
00050000-555f-5645-7519-1af6c22ddc5f	1293	Šmarje - Sap
00050000-555f-5645-3dd3-7e93c9d9b9c0	3240	Šmarje pri Jelšah
00050000-555f-5645-a436-991d9f8afd8c	8220	Šmarješke Toplice
00050000-555f-5645-bce5-dc1fcae28562	2315	Šmartno na Pohorju
00050000-555f-5645-7090-ecb581bda250	3341	Šmartno ob Dreti
00050000-555f-5645-cf21-b57979a462b7	3327	Šmartno ob Paki
00050000-555f-5645-e317-90394807c813	1275	Šmartno pri Litiji
00050000-555f-5645-472b-327d4721f057	2383	Šmartno pri Slovenj Gradcu
00050000-555f-5645-50ef-528a5e991a97	3201	Šmartno v Rožni dolini
00050000-555f-5645-d929-478223da9f29	3325	Šoštanj
00050000-555f-5645-db03-3ef0ac2e1d80	6222	Štanjel
00050000-555f-5645-2f2b-9922b443383a	3220	Štore
00050000-555f-5645-9c11-43022bd1759a	3304	Tabor
00050000-555f-5645-e10f-0b39d2ed7c91	3221	Teharje
00050000-555f-5645-afab-63089ad7180d	9251	Tišina
00050000-555f-5645-a45f-842493abfa7c	5220	Tolmin
00050000-555f-5645-6e2f-8b3e112db4ad	3326	Topolšica
00050000-555f-5645-9c60-6767abdf6970	2371	Trbonje
00050000-555f-5645-6bd8-47b7e8627918	1420	Trbovlje
00050000-555f-5645-e14c-e91c3c08cba6	8231	Trebelno 
00050000-555f-5645-26f7-f8e6fc97b3b7	8210	Trebnje
00050000-555f-5645-5e42-5810d2f5ad6e	5252	Trnovo pri Gorici
00050000-555f-5645-fdea-51d5e77dac2f	2254	Trnovska vas
00050000-555f-5645-b44e-5c5167050ff5	1222	Trojane
00050000-555f-5645-9b4b-39bb80b62cd1	1236	Trzin
00050000-555f-5645-f503-4c76d0488a62	4290	Tržič
00050000-555f-5645-aa37-69683b3a2933	8295	Tržišče
00050000-555f-5645-6774-5f1be0b20780	1311	Turjak
00050000-555f-5645-1e3b-d3ef2279e26b	9224	Turnišče
00050000-555f-5645-2b3d-ed89152612dc	8323	Uršna sela
00050000-555f-5645-d198-ebe0efe05ac5	1252	Vače
00050000-555f-5645-c22a-bc11be14e8d4	3320	Velenje 
00050000-555f-5645-da74-bba9e9763cf5	3322	Velenje - poštni predali
00050000-555f-5645-291b-feebb4ec1362	8212	Velika Loka
00050000-555f-5645-2aff-0323cd1135a1	2274	Velika Nedelja
00050000-555f-5645-4382-6a49618a4ebf	9225	Velika Polana
00050000-555f-5645-9e84-a13d689780b7	1315	Velike Lašče
00050000-555f-5645-d8c0-9c4fb463a74d	8213	Veliki Gaber
00050000-555f-5645-f8e1-08c21caf3729	9241	Veržej
00050000-555f-5645-7edf-1bd28fb59e91	1312	Videm - Dobrepolje
00050000-555f-5645-9a58-f88c77bc7172	2284	Videm pri Ptuju
00050000-555f-5645-5837-cf578954be4d	8344	Vinica
00050000-555f-5645-2622-f97a7c780170	5271	Vipava
00050000-555f-5645-cc75-510e6ddbee2a	4212	Visoko
00050000-555f-5645-47f2-a662a1d35498	1294	Višnja Gora
00050000-555f-5645-318d-8d6546768125	3205	Vitanje
00050000-555f-5645-ffc7-998079a09b7d	2255	Vitomarci
00050000-555f-5645-18b9-da8ebb3f5e91	1217	Vodice
00050000-555f-5645-9ac9-30db332962cc	3212	Vojnik\t
00050000-555f-5645-71e0-8c5ab0372056	5293	Volčja Draga
00050000-555f-5645-c92b-d6432bdb84df	2232	Voličina
00050000-555f-5645-15ce-bc033be0b1d1	3305	Vransko
00050000-555f-5645-6269-707cea79747d	6217	Vremski Britof
00050000-555f-5645-0669-16453a11118f	1360	Vrhnika
00050000-555f-5645-959a-f00000198fbd	2365	Vuhred
00050000-555f-5645-a59d-122458b27a35	2367	Vuzenica
00050000-555f-5645-14e1-9364a36adcce	8292	Zabukovje 
00050000-555f-5645-d879-a6002eee583f	1410	Zagorje ob Savi
00050000-555f-5645-64d2-f95eb40df97b	1303	Zagradec
00050000-555f-5645-3d36-c632244c7c12	2283	Zavrč
00050000-555f-5645-8fe3-a6c4319c197a	8272	Zdole 
00050000-555f-5645-f09c-ee8e9104e31d	4201	Zgornja Besnica
00050000-555f-5645-e352-21d7a13f60b3	2242	Zgornja Korena
00050000-555f-5645-a843-567346a9eb62	2201	Zgornja Kungota
00050000-555f-5645-a7bd-a0022d8dbde2	2316	Zgornja Ložnica
00050000-555f-5645-9ed2-22b46679a0f5	2314	Zgornja Polskava
00050000-555f-5645-b5b0-54b358e428a4	2213	Zgornja Velka
00050000-555f-5645-f26c-30cb8ac0f66d	4247	Zgornje Gorje
00050000-555f-5645-ff7a-5711a5cab6ee	4206	Zgornje Jezersko
00050000-555f-5645-9ae4-eea27ed5e4ab	2285	Zgornji Leskovec
00050000-555f-5645-eec8-c19182f1c907	1432	Zidani Most
00050000-555f-5645-c39c-022ae6300c08	3214	Zreče
00050000-555f-5645-64e9-6567da99d625	4209	Žabnica
00050000-555f-5645-c281-e7f73cc115c5	3310	Žalec
00050000-555f-5645-282b-bc9eb2cf5bea	4228	Železniki
00050000-555f-5645-02d1-199ae81b0439	2287	Žetale
00050000-555f-5645-3107-5a8b4df45119	4226	Žiri
00050000-555f-5645-5746-c9a9625e1b17	4274	Žirovnica
00050000-555f-5645-62c1-e069c778a788	8360	Žužemberk
\.


--
-- TOC entry 2657 (class 0 OID 4729596)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4729424)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4729489)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 4729608)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4729714)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4729758)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4729637)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 4729581)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 4729571)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4729748)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4729704)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2628 (class 0 OID 4729292)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555f-5646-54ac-44e35bf90c1a	00010000-555f-5646-61ce-986896ec528d	2015-05-22 18:16:07	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROXlZMN3/opYkIc1HnfEmXdKyzyRp9ib2";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2664 (class 0 OID 4729646)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 4729330)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555f-5646-eb0c-f621a0aa6b76	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555f-5646-2288-0cd9b1e22c5c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555f-5646-3c42-1dc245c7a41b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555f-5646-9532-880826f8d79b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555f-5646-1e49-b3da8de54751	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555f-5646-d316-4ae63ab6fb62	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2630 (class 0 OID 4729314)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555f-5646-54ac-44e35bf90c1a	00020000-555f-5646-9532-880826f8d79b
00010000-555f-5646-61ce-986896ec528d	00020000-555f-5646-9532-880826f8d79b
\.


--
-- TOC entry 2666 (class 0 OID 4729660)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4729602)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4729552)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4729389)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4729558)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4729737)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, imezenski, podrocje) FROM stdin;
000f0000-555f-5646-e4e9-7f76fea21fa1	Igralec ali animator	Igralci in animatorji	t	1	Igralka ali animatorka	igralec
000f0000-555f-5646-39c3-edf5cab5a74c	Igralec ali animator	Igralci in animatorji	t	1	Igralka ali animatorka	igralec
000f0000-555f-5646-0477-ea13872b61e4	Baletnik ali plesalec	Baletniki in plesalci	t	1	Baletnica ali plesalka	igralec
000f0000-555f-5646-84ee-b03f60a56da8	Avtor	Avtorji	t	1	Avtorka	umetnik
000f0000-555f-5646-210d-37ec2f95a996	Režiser	Režiserji	t	1	Režiserka	umetnik
000f0000-555f-5646-6913-c2c9ee36142f	Scenograf	Scenografi	t	1	Scenografka	tehnik
000f0000-555f-5646-27fa-e5f4e1a55d88	Kostumograf	Kostumografi	t	1	Kostumografinja	tehnik
000f0000-555f-5646-66d7-c79364d3c474	Oblikovalec maske	Oblikovalci maske	t	1	Oblikovalka maske	tehnik
000f0000-555f-5646-14fe-2b2134d49ef0	Avtor glasbe	Avtorji glasbe	t	1	Avtorica glasbe	umetnik
000f0000-555f-5646-99cc-647c7bbf3129	Oblikovalec svetlobe	Oblikovalci svetlobe	t	1	Oblikovalka svetlobe	tehnik
000f0000-555f-5646-062e-04ea2c9b916d	Koreograf	Koreografi	t	1	Koreografinja	umetnik
000f0000-555f-5646-d380-44b4d1a97910	Dramaturg	Dramaturgi	t	1	Dramaturginja	umetnik
000f0000-555f-5646-ca4e-53da39209d9b	Lektorj	Lektorji	t	1	Lektorica	umetnik
000f0000-555f-5646-2ebf-ce1c15418e29	Prevajalec	Prevajalci	t	1	Prevajalka	umetnik
000f0000-555f-5646-bf39-674a04582e5c	Oblikovalec videa	Oblikovalci videa	t	1	Oblikovalka videa	umetnik
000f0000-555f-5646-5cfb-0cd3df48abca	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	1	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2643 (class 0 OID 4729458)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4729301)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555f-5646-61ce-986896ec528d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROoraoPQPzwthL3UffgdTp917MKc4ZJfi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555f-5646-54ac-44e35bf90c1a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2678 (class 0 OID 4729790)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4729504)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 4729629)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4729696)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4729536)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4729780)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4729686)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4729355)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 4729831)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 4729824)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4729736)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4729526)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4729551)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4729484)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4729682)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4729502)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4729545)
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
-- TOC entry 2360 (class 2606 OID 4729594)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4729621)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4729456)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4729364)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4729387)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4729344)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4729329)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4729627)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4729659)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4729775)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4729414)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4729444)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4729600)
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
-- TOC entry 2294 (class 2606 OID 4729434)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4729493)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4729612)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4729720)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4729763)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4729644)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4729585)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4729576)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4729757)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4729711)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4729300)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4729650)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4729318)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4729338)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4729668)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4729607)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4729557)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4729394)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4729567)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4729747)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4729469)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4729313)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 4729805)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4729511)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4729635)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4729702)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4729540)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4729789)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4729695)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4729533)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4729416)
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
-- TOC entry 2373 (class 1259 OID 4729628)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4729614)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4729613)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4729512)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4729685)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4729683)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4729684)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4729777)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4729778)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4729779)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4729809)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4729806)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2429 (class 1259 OID 4729808)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2430 (class 1259 OID 4729807)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4729471)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4729470)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4729651)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4729546)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4729345)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4729346)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4729671)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4729670)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4729669)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4729494)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4729496)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4729495)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4729580)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4729578)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4729577)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4729579)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4729319)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4729320)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4729636)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4729601)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4729712)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4729713)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4729436)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4729435)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4729437)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4729721)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4729722)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2439 (class 1259 OID 4729834)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2440 (class 1259 OID 4729833)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2441 (class 1259 OID 4729836)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2442 (class 1259 OID 4729832)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2443 (class 1259 OID 4729835)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4729703)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4729589)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4729588)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4729586)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4729587)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2435 (class 1259 OID 4729826)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 4729825)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4729503)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4729366)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4729365)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4729395)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4729396)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4729570)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4729569)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4729568)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4729535)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4729531)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4729528)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4729529)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4729527)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4729532)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4729530)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4729415)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4729485)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4729487)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4729486)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4729488)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4729595)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4729776)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4729388)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4729457)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4729645)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4729445)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4729764)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4729339)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4729534)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2468 (class 2606 OID 4729967)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2471 (class 2606 OID 4729952)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2470 (class 2606 OID 4729957)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2466 (class 2606 OID 4729977)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2472 (class 2606 OID 4729947)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2467 (class 2606 OID 4729972)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2469 (class 2606 OID 4729962)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2453 (class 2606 OID 4729882)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2489 (class 2606 OID 4730062)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 4730057)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2488 (class 2606 OID 4730052)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2465 (class 2606 OID 4729942)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4730102)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2497 (class 2606 OID 4730092)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2496 (class 2606 OID 4730097)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2485 (class 2606 OID 4730042)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2506 (class 2606 OID 4730137)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2505 (class 2606 OID 4730142)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2504 (class 2606 OID 4730147)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2507 (class 2606 OID 4730167)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2510 (class 2606 OID 4730152)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2508 (class 2606 OID 4730162)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2509 (class 2606 OID 4730157)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2459 (class 2606 OID 4729917)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2460 (class 2606 OID 4729912)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 4729892)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 4729887)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2450 (class 2606 OID 4729867)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2491 (class 2606 OID 4730072)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2473 (class 2606 OID 4729982)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2447 (class 2606 OID 4729847)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2446 (class 2606 OID 4729852)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2492 (class 2606 OID 4730087)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2493 (class 2606 OID 4730082)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2494 (class 2606 OID 4730077)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2463 (class 2606 OID 4729922)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2461 (class 2606 OID 4729932)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2462 (class 2606 OID 4729927)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2477 (class 2606 OID 4730017)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2479 (class 2606 OID 4730007)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2480 (class 2606 OID 4730002)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2478 (class 2606 OID 4730012)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2445 (class 2606 OID 4729837)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2444 (class 2606 OID 4729842)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2490 (class 2606 OID 4730067)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2486 (class 2606 OID 4730047)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2500 (class 2606 OID 4730112)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2499 (class 2606 OID 4730117)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2457 (class 2606 OID 4729902)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 4729897)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2456 (class 2606 OID 4729907)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4730122)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2501 (class 2606 OID 4730127)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2515 (class 2606 OID 4730192)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 4730187)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2513 (class 2606 OID 4730202)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2517 (class 2606 OID 4730182)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2514 (class 2606 OID 4730197)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2498 (class 2606 OID 4730107)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2481 (class 2606 OID 4730037)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2482 (class 2606 OID 4730032)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2484 (class 2606 OID 4730022)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2483 (class 2606 OID 4730027)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2511 (class 2606 OID 4730177)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2512 (class 2606 OID 4730172)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2464 (class 2606 OID 4729937)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2503 (class 2606 OID 4730132)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2448 (class 2606 OID 4729862)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2449 (class 2606 OID 4729857)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2452 (class 2606 OID 4729872)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2451 (class 2606 OID 4729877)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2474 (class 2606 OID 4729997)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2475 (class 2606 OID 4729992)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2476 (class 2606 OID 4729987)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-22 18:16:07 CEST

--
-- PostgreSQL database dump complete
--

