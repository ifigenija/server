--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-21 10:31:08 CEST

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
-- TOC entry 179 (class 1259 OID 4303230)
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
-- TOC entry 225 (class 1259 OID 4303709)
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
-- TOC entry 224 (class 1259 OID 4303692)
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
-- TOC entry 217 (class 1259 OID 4303605)
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
-- TOC entry 193 (class 1259 OID 4303396)
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
-- TOC entry 196 (class 1259 OID 4303430)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4303355)
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
-- TOC entry 212 (class 1259 OID 4303555)
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
-- TOC entry 191 (class 1259 OID 4303380)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4303424)
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
-- TOC entry 201 (class 1259 OID 4303473)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4303498)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4303329)
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
-- TOC entry 180 (class 1259 OID 4303239)
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
-- TOC entry 181 (class 1259 OID 4303250)
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
-- TOC entry 184 (class 1259 OID 4303300)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4303204)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4303223)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4303505)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4303535)
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
-- TOC entry 221 (class 1259 OID 4303648)
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
-- TOC entry 183 (class 1259 OID 4303280)
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
-- TOC entry 186 (class 1259 OID 4303321)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4303479)
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
-- TOC entry 185 (class 1259 OID 4303307)
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
-- TOC entry 190 (class 1259 OID 4303372)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4303491)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4303596)
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
-- TOC entry 220 (class 1259 OID 4303641)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4303520)
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
-- TOC entry 200 (class 1259 OID 4303464)
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
-- TOC entry 199 (class 1259 OID 4303454)
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
-- TOC entry 219 (class 1259 OID 4303631)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4303586)
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
-- TOC entry 173 (class 1259 OID 4303175)
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
-- TOC entry 172 (class 1259 OID 4303173)
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
-- TOC entry 209 (class 1259 OID 4303529)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4303213)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4303197)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4303543)
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
-- TOC entry 203 (class 1259 OID 4303485)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4303435)
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
-- TOC entry 182 (class 1259 OID 4303272)
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
-- TOC entry 198 (class 1259 OID 4303441)
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
-- TOC entry 218 (class 1259 OID 4303619)
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
-- TOC entry 188 (class 1259 OID 4303341)
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
-- TOC entry 174 (class 1259 OID 4303184)
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
-- TOC entry 223 (class 1259 OID 4303673)
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
-- TOC entry 192 (class 1259 OID 4303387)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4303512)
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
-- TOC entry 214 (class 1259 OID 4303578)
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
-- TOC entry 194 (class 1259 OID 4303419)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4303663)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4303568)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4303178)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2632 (class 0 OID 4303230)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4303709)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4303692)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4303605)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4303396)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4303430)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4303355)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555d-97cb-6237-714482603bfa	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555d-97cb-cec8-b659f52558e5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555d-97cb-e4ad-d812f0e7ca55	AL	ALB	008	Albania 	Albanija	\N
00040000-555d-97cb-9a95-93e04cd24ab0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555d-97cb-fdeb-c2d6b12c9742	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555d-97cb-7b52-98198fff814a	AD	AND	020	Andorra 	Andora	\N
00040000-555d-97cb-aa26-7aca542c437f	AO	AGO	024	Angola 	Angola	\N
00040000-555d-97cb-d38e-1d9f7bb655c4	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555d-97cb-e537-8e22d11c31a7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555d-97cb-63bc-c958a9d87440	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-97cb-c94a-a951e5049d01	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555d-97cb-0b59-94e385a0bfc6	AM	ARM	051	Armenia 	Armenija	\N
00040000-555d-97cb-5257-0de028b76fac	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555d-97cb-8387-5ab26e944888	AU	AUS	036	Australia 	Avstralija	\N
00040000-555d-97cb-1e83-f08bfc379e56	AT	AUT	040	Austria 	Avstrija	\N
00040000-555d-97cb-df0b-fd05340817e7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555d-97cb-4287-54b04cf1633c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555d-97cb-a981-ebbe4d9d02d4	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555d-97cb-93e6-4e294c2dcdc3	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555d-97cb-ec1b-bfe229cc5d21	BB	BRB	052	Barbados 	Barbados	\N
00040000-555d-97cb-d58c-a701fce2f33b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555d-97cb-327c-2092b506746b	BE	BEL	056	Belgium 	Belgija	\N
00040000-555d-97cb-0ab6-daf4fcea16cd	BZ	BLZ	084	Belize 	Belize	\N
00040000-555d-97cb-2fdb-a08dc25d3c21	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555d-97cb-a7c7-0151ae8d8602	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555d-97cb-b62c-c8ad972db34f	BT	BTN	064	Bhutan 	Butan	\N
00040000-555d-97cb-6e7d-5c065f5c749c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555d-97cb-e199-a663ca0db191	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555d-97cb-2725-7395c1bb945e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555d-97cb-a22b-9cc68f9af91d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555d-97cb-18e5-0f334f4bd074	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555d-97cb-d4ee-4563f1eaae64	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555d-97cb-0f42-ef180adc4c2d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555d-97cb-14fd-354d9578b307	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555d-97cb-076e-98f64de12fbb	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555d-97cb-cc13-7425e0817e88	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555d-97cb-d121-443878b3152c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555d-97cb-287a-df678b30ea2c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555d-97cb-4baf-5614b712497e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555d-97cb-4676-864bd889f343	CA	CAN	124	Canada 	Kanada	\N
00040000-555d-97cb-e3fe-f87a8ee8873a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555d-97cb-64a1-bd6aec9c0214	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555d-97cb-3cbf-c27092cd8a98	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555d-97cb-e9c6-d591190a3b49	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555d-97cb-329d-daf983968ff4	CL	CHL	152	Chile 	Čile	\N
00040000-555d-97cb-c12f-0517fd4c180d	CN	CHN	156	China 	Kitajska	\N
00040000-555d-97cb-80bd-799304a064ab	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555d-97cb-8d64-965f7a8c6a82	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555d-97cb-e717-ea1809cf7d54	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555d-97cb-6114-a65d879c415a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555d-97cb-59a5-d32abd90a9e1	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555d-97cb-2860-c49c931c6dc1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555d-97cb-2b69-362c21b32d45	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555d-97cb-3bc7-ed518d7b50f0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555d-97cb-8204-03b13d8e7270	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555d-97cb-5995-9a1c5de4953d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555d-97cb-65c5-a68eda58962a	CU	CUB	192	Cuba 	Kuba	\N
00040000-555d-97cb-71b6-65f8e7c1e799	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555d-97cb-d561-30a5ba6135e1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555d-97cb-fb42-9c3e7b88fb8c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555d-97cb-05a5-db5fb6c233ae	DK	DNK	208	Denmark 	Danska	\N
00040000-555d-97cb-fdd4-19c5c7e56485	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555d-97cb-ceaf-95ced79665aa	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-97cb-06a8-91806664f421	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555d-97cb-7a6b-fa41eab4e2e8	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555d-97cb-a854-aad575b1d2b4	EG	EGY	818	Egypt 	Egipt	\N
00040000-555d-97cb-ebf6-cebbdf6baa45	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555d-97cb-98b0-d449de44c68c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555d-97cb-f2c1-88a0aa857516	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555d-97cb-fb3c-1ebf0e19a922	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555d-97cb-20d6-1467fc4d5af7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555d-97cb-e69b-aecbe5ab310a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555d-97cb-d3f4-4a4545b8751c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555d-97cb-86b8-376e52be58b8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555d-97cb-84c7-dd53deb85e62	FI	FIN	246	Finland 	Finska	\N
00040000-555d-97cb-b887-fac1dd1980c7	FR	FRA	250	France 	Francija	\N
00040000-555d-97cb-bf14-bf8b8f68424e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555d-97cb-9ac6-3c83cb3a0767	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555d-97cb-6710-f0b3705bffb7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555d-97cb-c128-a2f0cad91723	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555d-97cb-acbc-60f40c306309	GA	GAB	266	Gabon 	Gabon	\N
00040000-555d-97cb-eba8-d1edcef15773	GM	GMB	270	Gambia 	Gambija	\N
00040000-555d-97cb-cbd7-50daaa2334d1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555d-97cb-f956-41f0775d8c70	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555d-97cb-ecab-0b66c0a52e97	GH	GHA	288	Ghana 	Gana	\N
00040000-555d-97cb-34e1-7c1ab89c4612	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555d-97cb-a2a2-5290faf2551a	GR	GRC	300	Greece 	Grčija	\N
00040000-555d-97cb-2536-540c64920c23	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555d-97cb-46ec-d6d8c749ceab	GD	GRD	308	Grenada 	Grenada	\N
00040000-555d-97cb-e418-bc3b9b496906	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555d-97cb-5b20-2f851bf351fc	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555d-97cb-118e-0869cae8b2e8	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555d-97cb-e4d8-ea84e1da5313	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555d-97cb-1156-ae66243c5353	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555d-97cb-c0e4-654bd830a15e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555d-97cb-f35c-568ef8b1f2a3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555d-97cb-e2f6-2a83eeea0686	HT	HTI	332	Haiti 	Haiti	\N
00040000-555d-97cb-19c3-c736b8e5f321	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555d-97cb-5d57-83dd17fea985	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555d-97cb-9601-0165a59c7db5	HN	HND	340	Honduras 	Honduras	\N
00040000-555d-97cb-852d-a2deb28f3827	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555d-97cb-a2af-71f62e840334	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555d-97cb-dcf4-f68b5c8f4740	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555d-97cb-f06b-4a2b225ea55e	IN	IND	356	India 	Indija	\N
00040000-555d-97cb-e367-96dcfc5f5b17	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555d-97cb-a818-e7b4f95d855a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555d-97cb-e5b7-ced9012ac269	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555d-97cb-ba13-7aab569f590d	IE	IRL	372	Ireland 	Irska	\N
00040000-555d-97cb-ad5a-fda28deb7381	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555d-97cb-7a68-b3cbfa7ef88d	IL	ISR	376	Israel 	Izrael	\N
00040000-555d-97cb-e8b6-bd0ba10f43ff	IT	ITA	380	Italy 	Italija	\N
00040000-555d-97cb-2f17-b61684f245f0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555d-97cb-c5de-04d738977dcc	JP	JPN	392	Japan 	Japonska	\N
00040000-555d-97cb-8fcd-2ca4d0d42c2a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555d-97cb-6916-87cbe1151831	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555d-97cb-2e6e-1e50a0ab79ce	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555d-97cb-52b7-a779a1770b29	KE	KEN	404	Kenya 	Kenija	\N
00040000-555d-97cb-9988-6e38f2c11943	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555d-97cb-2d09-1e8daab3b7ff	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555d-97cb-dfb4-fbb008aab86e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555d-97cb-ef1a-2a032acc1d90	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555d-97cb-bb17-adfc63512f2a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555d-97cb-6fba-d6c626013aae	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555d-97cb-3e47-67d0852f4952	LV	LVA	428	Latvia 	Latvija	\N
00040000-555d-97cb-52cb-8e2f19b403d5	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555d-97cb-7640-e662535ac700	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555d-97cb-83fd-90cce231212e	LR	LBR	430	Liberia 	Liberija	\N
00040000-555d-97cb-ae08-a4361f3a1be0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555d-97cb-94e5-83de7d732af5	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555d-97cb-d16f-1876566a0b33	LT	LTU	440	Lithuania 	Litva	\N
00040000-555d-97cb-7517-8ee4674a5aad	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555d-97cb-e012-f57adcb15c28	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555d-97cb-df63-7b16da1db88a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555d-97cb-901e-299da43e4ac8	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555d-97cb-78ff-2bce5cedc76e	MW	MWI	454	Malawi 	Malavi	\N
00040000-555d-97cb-4f9a-e9715bc26a1e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555d-97cb-2247-671504510c89	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555d-97cb-d4ac-7732fb1e10ab	ML	MLI	466	Mali 	Mali	\N
00040000-555d-97cb-f3e2-de68fc845f82	MT	MLT	470	Malta 	Malta	\N
00040000-555d-97cb-f66a-0940f853c9c8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555d-97cb-31e1-8728fbc6991e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555d-97cb-621b-b50cb056d8cf	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555d-97cb-d29f-f58bbaaf4b62	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555d-97cb-61a4-2335bdcd5342	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555d-97cb-24e2-5d31081535e5	MX	MEX	484	Mexico 	Mehika	\N
00040000-555d-97cb-bc9b-3972c045a4b8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555d-97cb-ef78-f9e74a081946	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555d-97cb-183d-01c657e8a05e	MC	MCO	492	Monaco 	Monako	\N
00040000-555d-97cb-54d1-92953b21b475	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555d-97cb-b9f0-bd35f2ecd300	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555d-97cb-b18e-5da1ae1ae799	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555d-97cb-4d74-b9aada8398c0	MA	MAR	504	Morocco 	Maroko	\N
00040000-555d-97cb-b22c-13b4f05a87fa	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555d-97cb-5668-06df86236474	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555d-97cb-d8b2-f96f71547f25	NA	NAM	516	Namibia 	Namibija	\N
00040000-555d-97cb-3579-46b5d11271d6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555d-97cb-6827-9b924ea6e4e8	NP	NPL	524	Nepal 	Nepal	\N
00040000-555d-97cb-5ead-b618da2e622c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555d-97cb-153c-68e86c0656b7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555d-97cb-5ee6-44eaa74038e1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555d-97cb-dad6-7ea6755b311a	NE	NER	562	Niger 	Niger 	\N
00040000-555d-97cb-29cf-54208c6bd0ea	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555d-97cb-cc86-18970b2480bb	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555d-97cb-4fe2-1900d5094799	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555d-97cb-26cb-4128f2a8973f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555d-97cb-5ece-0efea63538ab	NO	NOR	578	Norway 	Norveška	\N
00040000-555d-97cb-841c-bb3401d3d6d6	OM	OMN	512	Oman 	Oman	\N
00040000-555d-97cb-b101-764af276ab67	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555d-97cb-fdde-0351815351fa	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555d-97cb-1405-6de3254d8446	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555d-97cb-b192-546294726b5f	PA	PAN	591	Panama 	Panama	\N
00040000-555d-97cb-c082-7f3ec6f07d12	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555d-97cb-0384-859aa1001475	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555d-97cb-8e62-ac6b8fbd28d1	PE	PER	604	Peru 	Peru	\N
00040000-555d-97cb-e723-a10ff0fe83d8	PH	PHL	608	Philippines 	Filipini	\N
00040000-555d-97cb-63c1-ed3819845711	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555d-97cb-471d-c9c9cfa5e994	PL	POL	616	Poland 	Poljska	\N
00040000-555d-97cb-3e5d-6cbd9159a3c8	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555d-97cb-59cd-3642dd329bd2	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555d-97cb-83dc-840e5c3d3465	QA	QAT	634	Qatar 	Katar	\N
00040000-555d-97cb-80cb-641abad7097e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555d-97cb-fc21-963e125f411a	RO	ROU	642	Romania 	Romunija	\N
00040000-555d-97cb-7374-4c2ff85e7203	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555d-97cb-c3c4-1c4de9c7a6d7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555d-97cb-283e-871820190079	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555d-97cb-6874-44f1111d889c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555d-97cb-f862-d3759b02feb8	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555d-97cb-7495-03c900c580c4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555d-97cb-757d-4a3b9c16dc05	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555d-97cb-de0a-5314ddf9918b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555d-97cb-4365-7c222ef8b306	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555d-97cb-87bc-7f12cfca8c48	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555d-97cb-bea9-5e561b0517ac	SM	SMR	674	San Marino 	San Marino	\N
00040000-555d-97cb-2869-416ae1792671	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555d-97cb-27e4-5cb0ccaf4e51	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555d-97cb-2694-7e2289560797	SN	SEN	686	Senegal 	Senegal	\N
00040000-555d-97cb-7989-c35fc158aba6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555d-97cb-19e8-90f79ff89a3a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555d-97cb-1283-9eb4790cf8fc	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555d-97cb-614b-629450bb3b80	SG	SGP	702	Singapore 	Singapur	\N
00040000-555d-97cb-a1e8-2a1045c140f0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555d-97cb-903b-e26cb2439cd6	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555d-97cb-e76e-5698c211459d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555d-97cb-cd32-07333caf00fe	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555d-97cb-7cb5-7005e54b35bc	SO	SOM	706	Somalia 	Somalija	\N
00040000-555d-97cb-df0e-a740f95f364b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555d-97cb-9886-dd0b40ce5193	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555d-97cb-2321-81f034713aad	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555d-97cb-0ae7-fcaf61c2340b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555d-97cb-f4cd-78c9b6d60489	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555d-97cb-3a61-5c995649f7ab	SD	SDN	729	Sudan 	Sudan	\N
00040000-555d-97cb-543a-dad9bbcad1e7	SR	SUR	740	Suriname 	Surinam	\N
00040000-555d-97cb-b5bb-787b415b2c5c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555d-97cb-018e-19b29812d0c3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555d-97cb-47ea-30dfa524eb26	SE	SWE	752	Sweden 	Švedska	\N
00040000-555d-97cb-8f31-34225b8d42ac	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555d-97cb-1def-9818808cd0ed	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555d-97cb-aad2-d56e804650cb	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555d-97cb-2ccc-c313e600f930	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555d-97cb-f132-43a8a3c115f3	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555d-97cb-7faa-c20f9c9c8b61	TH	THA	764	Thailand 	Tajska	\N
00040000-555d-97cb-f344-c285eee685f8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555d-97cb-b27c-572df62be36b	TG	TGO	768	Togo 	Togo	\N
00040000-555d-97cb-b871-0724ef50a4e2	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555d-97cb-f456-d7b22239adc7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555d-97cb-80c3-2758517a5872	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555d-97cb-c05b-c61fd17c0218	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555d-97cb-8638-cded894d880c	TR	TUR	792	Turkey 	Turčija	\N
00040000-555d-97cb-1d9e-c436f696c726	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555d-97cb-2b9b-6af48114f554	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-97cb-27d1-24069a50fcc6	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555d-97cb-1f0f-77392da510dc	UG	UGA	800	Uganda 	Uganda	\N
00040000-555d-97cb-224e-8fa6c1a4e872	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555d-97cb-f261-e8c9cb8b2626	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555d-97cb-9d63-f9c658dff4e9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555d-97cb-7203-512a2b2d28a3	US	USA	840	United States 	Združene države Amerike	\N
00040000-555d-97cb-f3c1-35ac3128b3b1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555d-97cb-1f74-29470158aa2f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555d-97cb-7fc3-ca9a5107e901	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555d-97cb-6ac6-9f71d93282c8	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555d-97cb-2c23-7a5ad93abaf0	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555d-97cb-b39c-7b8e96492927	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555d-97cb-65a9-794b88740b21	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-97cb-2b43-b6d46081a714	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555d-97cb-2a88-343c4b18e4a0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555d-97cb-a765-3d7f60db3b34	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555d-97cb-11bf-989403e0b95e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555d-97cb-d42e-60f1c21204ab	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555d-97cb-8c41-7444ab4bc83d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2665 (class 0 OID 4303555)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4303380)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4303424)
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
-- TOC entry 2654 (class 0 OID 4303473)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4303498)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4303329)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555d-97cb-c1ce-8ac2d0ab0291	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555d-97cb-e949-5305f979c8d0	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555d-97cb-6248-f4e4a959f57f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555d-97cb-ef51-4a9576bf3017	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555d-97cb-55e8-69ec50701bc4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555d-97cb-d588-8d6d4f38f714	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555d-97cb-9b63-6a39057dbc7c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555d-97cb-eadb-159875c5840e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555d-97cb-4131-af4f4725ea48	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555d-97cb-4875-e48c3c2773b4	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555d-97cb-e4fe-54e732614347	uprizoritev.faza	array	a:5:{s:7:"osnutek";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:4:"plan";a:1:{s:5:"label";s:14:"Predprodukcija";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
\.


--
-- TOC entry 2633 (class 0 OID 4303239)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555d-97cb-7807-84fb68ae6684	00000000-555d-97cb-55e8-69ec50701bc4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555d-97cb-162b-b7532a35d0cf	00000000-555d-97cb-55e8-69ec50701bc4	00010000-555d-97cb-5f43-a1990a39025c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555d-97cb-67a0-b13c69c00cbf	00000000-555d-97cb-d588-8d6d4f38f714	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2634 (class 0 OID 4303250)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4303300)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4303204)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555d-97cb-6210-9ed384bd8855	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555d-97cb-ee8b-3e12ab68a3d1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555d-97cb-e40b-98d2343b3e74	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555d-97cb-9ab8-e00c80906817	Abonma-read	Abonma - branje	f
00030000-555d-97cb-2d89-09008c8ac6fd	Abonma-write	Abonma - spreminjanje	f
00030000-555d-97cb-8e70-67751fe84619	Alternacija-read	Alternacija - branje	f
00030000-555d-97cb-d055-20549234ee1b	Alternacija-write	Alternacija - spreminjanje	f
00030000-555d-97cb-5a7a-e40897e9b275	Arhivalija-read	Arhivalija - branje	f
00030000-555d-97cb-1ff4-656a0df373e1	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555d-97cb-ba3d-c70d60934ccd	Besedilo-read	Besedilo - branje	f
00030000-555d-97cb-f29a-8af09f1d89ee	Besedilo-write	Besedilo - spreminjanje	f
00030000-555d-97cb-44cd-55b7a2d06250	DogodekIzven-read	DogodekIzven - branje	f
00030000-555d-97cb-1f4e-10c6b9186231	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555d-97cb-1a1d-284b3524516a	Dogodek-read	Dogodek - branje	f
00030000-555d-97cb-189e-2ea6c9e4d96e	Dogodek-write	Dogodek - spreminjanje	f
00030000-555d-97cb-92d2-0c3bdc254551	Drzava-read	Drzava - branje	f
00030000-555d-97cb-534d-5fe5b2e18ffd	Drzava-write	Drzava - spreminjanje	f
00030000-555d-97cb-6cf6-ed15d8d775ed	Funkcija-read	Funkcija - branje	f
00030000-555d-97cb-777c-dd450645008f	Funkcija-write	Funkcija - spreminjanje	f
00030000-555d-97cb-7b49-d8aeba95ca49	Gostovanje-read	Gostovanje - branje	f
00030000-555d-97cb-38ed-5dd8d734fd78	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555d-97cb-6c3a-c419ad309338	Gostujoca-read	Gostujoca - branje	f
00030000-555d-97cb-ed0d-aa4e5fd8c10f	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555d-97cb-0d01-d01ad699c2a0	Kupec-read	Kupec - branje	f
00030000-555d-97cb-08c2-8e2b29ec0a24	Kupec-write	Kupec - spreminjanje	f
00030000-555d-97cb-ccbd-ca6df9d5adcb	NacinPlacina-read	NacinPlacina - branje	f
00030000-555d-97cb-f221-a7fbbeed0ab4	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555d-97cb-3b40-1e60a236fcc7	Option-read	Option - branje	f
00030000-555d-97cb-6a33-2c17dc2ae115	Option-write	Option - spreminjanje	f
00030000-555d-97cb-c1c6-08986e1fb59a	OptionValue-read	OptionValue - branje	f
00030000-555d-97cb-8f8d-9ae853cafca7	OptionValue-write	OptionValue - spreminjanje	f
00030000-555d-97cb-3201-785f1f53aff9	Oseba-read	Oseba - branje	f
00030000-555d-97cb-91a7-8244e1f6c754	Oseba-write	Oseba - spreminjanje	f
00030000-555d-97cb-c70f-f6d8aec8d1a3	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555d-97cb-b1cf-6f9a3f42c260	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555d-97cb-8c6e-bf96b705dcd6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555d-97cb-7e37-cb4c91bddccd	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555d-97cb-bd69-a747b355962c	Pogodba-read	Pogodba - branje	f
00030000-555d-97cb-581f-e77466374ae5	Pogodba-write	Pogodba - spreminjanje	f
00030000-555d-97cb-73a1-ac5bd24ee553	Popa-read	Popa - branje	f
00030000-555d-97cb-4975-96d295ec2322	Popa-write	Popa - spreminjanje	f
00030000-555d-97cb-6f3e-51a9173725b2	Posta-read	Posta - branje	f
00030000-555d-97cb-6f67-ad9cca839dd9	Posta-write	Posta - spreminjanje	f
00030000-555d-97cb-8854-941cada0cabc	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555d-97cb-54b7-bee90d4c71ce	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555d-97cb-7ea7-91115f9f35a1	PostniNaslov-read	PostniNaslov - branje	f
00030000-555d-97cb-eda9-53a4df6b8eb9	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555d-97cb-3daf-202d81e5929e	Predstava-read	Predstava - branje	f
00030000-555d-97cb-8e9c-0a86e98202c2	Predstava-write	Predstava - spreminjanje	f
00030000-555d-97cb-5039-4e8b724f1d52	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555d-97cb-08cd-4d1532fe9d65	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555d-97cb-34b6-b6d7b09c40d7	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555d-97cb-7b82-535f48460d0d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555d-97cb-a449-8b9876331b99	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555d-97cb-68e3-a4183529e7e2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555d-97cb-871d-fe9a2ecdcc84	Prostor-read	Prostor - branje	f
00030000-555d-97cb-7e55-02bc06b84eba	Prostor-write	Prostor - spreminjanje	f
00030000-555d-97cb-2997-8c303458ddbf	Racun-read	Racun - branje	f
00030000-555d-97cb-6e3b-042173768440	Racun-write	Racun - spreminjanje	f
00030000-555d-97cb-8081-1d4ffc3d5d41	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555d-97cb-9b4a-81c7f5ce9275	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555d-97cb-df16-8ab5c0f4ef9d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555d-97cb-6dbc-7a530d6712f1	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555d-97cb-bc0b-3476297fd8dc	Rekvizit-read	Rekvizit - branje	f
00030000-555d-97cb-64e1-4f2ec776eddc	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555d-97cb-b41c-15da439ecb59	Rezervacija-read	Rezervacija - branje	f
00030000-555d-97cb-a267-57ce8a859014	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555d-97cb-a180-edecbbc12846	SedezniRed-read	SedezniRed - branje	f
00030000-555d-97cb-e905-4d6b2b4c205c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555d-97cb-dcbd-69ab18ebe56c	Sedez-read	Sedez - branje	f
00030000-555d-97cb-76d7-a897e9b09c4d	Sedez-write	Sedez - spreminjanje	f
00030000-555d-97cb-39f5-3d1a45182578	Sezona-read	Sezona - branje	f
00030000-555d-97cb-27aa-710bf25c0dbb	Sezona-write	Sezona - spreminjanje	f
00030000-555d-97cb-f07b-b0e5a3c60095	Telefonska-read	Telefonska - branje	f
00030000-555d-97cb-9905-e05f980a7184	Telefonska-write	Telefonska - spreminjanje	f
00030000-555d-97cb-a77e-3c00b5bd2ab4	TerminStoritve-read	TerminStoritve - branje	f
00030000-555d-97cb-7fb8-b7a6409f83b3	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555d-97cb-7939-6301ab149672	TipFunkcije-read	TipFunkcije - branje	f
00030000-555d-97cb-e1d6-7a34b62cd2b4	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555d-97cb-fbf4-2ab37a2b21df	Trr-read	Trr - branje	f
00030000-555d-97cb-a1fa-378d079d89bc	Trr-write	Trr - spreminjanje	f
00030000-555d-97cb-4308-c3406152425d	Uprizoritev-read	Uprizoritev - branje	f
00030000-555d-97cb-b317-9527e47f49df	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555d-97cb-8277-21b4cc7babc0	Vaja-read	Vaja - branje	f
00030000-555d-97cb-5196-ad126989b0ca	Vaja-write	Vaja - spreminjanje	f
00030000-555d-97cb-ca47-1c4feaebf03e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555d-97cb-9926-b910f81f2443	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555d-97cb-279f-c0c355516cda	Zaposlitev-read	Zaposlitev - branje	f
00030000-555d-97cb-a838-4a49b99ed6bc	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555d-97cb-1fe9-85cb11f5a8df	Zasedenost-read	Zasedenost - branje	f
00030000-555d-97cb-a33c-afc17f1c6246	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555d-97cb-3ae2-2908220144f5	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555d-97cb-91f5-64c76d797a65	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555d-97cb-c92d-b85e6f1b746d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555d-97cb-48d3-fd99635fea2d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2631 (class 0 OID 4303223)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555d-97cb-59b9-b79ae4cc1cb0	00030000-555d-97cb-92d2-0c3bdc254551
00020000-555d-97cb-8253-e3a6b66791a0	00030000-555d-97cb-534d-5fe5b2e18ffd
00020000-555d-97cb-8253-e3a6b66791a0	00030000-555d-97cb-92d2-0c3bdc254551
\.


--
-- TOC entry 2659 (class 0 OID 4303505)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4303535)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4303648)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 4303280)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4303321)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555d-97cb-285d-79bb63382882	8341	Adlešiči
00050000-555d-97cb-0ffe-6d29b5343dee	5270	Ajdovščina
00050000-555d-97cb-4758-52e830867e5f	6280	Ankaran/Ancarano
00050000-555d-97cb-8bef-9b494f36b5f9	9253	Apače
00050000-555d-97cb-aaa6-8f5447a567ff	8253	Artiče
00050000-555d-97cb-fc11-f8434fe83c6a	4275	Begunje na Gorenjskem
00050000-555d-97cb-95a7-7061c29c0543	1382	Begunje pri Cerknici
00050000-555d-97cb-cf82-2eed6dc6af9b	9231	Beltinci
00050000-555d-97cb-d25a-d4c23e1553f4	2234	Benedikt
00050000-555d-97cb-641a-5172f071dbd5	2345	Bistrica ob Dravi
00050000-555d-97cb-5503-f5ffe5eed34c	3256	Bistrica ob Sotli
00050000-555d-97cb-9be8-833c96915f5d	8259	Bizeljsko
00050000-555d-97cb-c1bc-340f899577e6	1223	Blagovica
00050000-555d-97cb-3bbf-e2123908e355	8283	Blanca
00050000-555d-97cb-8e1a-98b151c682e9	4260	Bled
00050000-555d-97cb-9f57-a2c4b87fd7cd	4273	Blejska Dobrava
00050000-555d-97cb-5e34-3dfe3f8c9a19	9265	Bodonci
00050000-555d-97cb-e26d-1a93ab36918c	9222	Bogojina
00050000-555d-97cb-fdae-ea6c373f9005	4263	Bohinjska Bela
00050000-555d-97cb-6d2b-13ec6db1ae24	4264	Bohinjska Bistrica
00050000-555d-97cb-d0f5-4fdc0fde6c93	4265	Bohinjsko jezero
00050000-555d-97cb-1088-2789fedac97b	1353	Borovnica
00050000-555d-97cb-ff5e-4776e5cda125	8294	Boštanj
00050000-555d-97cb-0a41-a5ba8813a02a	5230	Bovec
00050000-555d-97cb-518a-b02b7e40c485	5295	Branik
00050000-555d-97cb-b408-b7426ef7259e	3314	Braslovče
00050000-555d-97cb-53a3-b538f26f6558	5223	Breginj
00050000-555d-97cb-3528-350eb3723f99	8280	Brestanica
00050000-555d-97cb-ddc9-c164603bd864	2354	Bresternica
00050000-555d-97cb-784e-86447b40fd55	4243	Brezje
00050000-555d-97cb-07da-15e0faf37109	1351	Brezovica pri Ljubljani
00050000-555d-97cb-959b-a53842ee4b04	8250	Brežice
00050000-555d-97cb-88f3-ca08214dcaac	4210	Brnik - Aerodrom
00050000-555d-97cb-c240-ceaa5863bd38	8321	Brusnice
00050000-555d-97cb-c227-d62f655c6adc	3255	Buče
00050000-555d-97cb-c90e-34f17fee8f8d	8276	Bučka 
00050000-555d-97cb-687a-b3818f52e606	9261	Cankova
00050000-555d-97cb-d0c8-73e81ace873b	3000	Celje 
00050000-555d-97cb-222c-2495be25d24f	3001	Celje - poštni predali
00050000-555d-97cb-a7bb-e5da7833808a	4207	Cerklje na Gorenjskem
00050000-555d-97cb-0728-9aab218195e0	8263	Cerklje ob Krki
00050000-555d-97cb-707c-61377a6d59b7	1380	Cerknica
00050000-555d-97cb-71a2-4cd3ed1ebeb1	5282	Cerkno
00050000-555d-97cb-9e1d-703a7ab4fc06	2236	Cerkvenjak
00050000-555d-97cb-001c-b04657493ad2	2215	Ceršak
00050000-555d-97cb-057b-627ff18889af	2326	Cirkovce
00050000-555d-97cb-d787-59f71a235362	2282	Cirkulane
00050000-555d-97cb-b91b-8cb50279c239	5273	Col
00050000-555d-97cb-ead7-9a0b227c3165	8251	Čatež ob Savi
00050000-555d-97cb-f997-7791ff35f77b	1413	Čemšenik
00050000-555d-97cb-39c9-2bc960d150a3	5253	Čepovan
00050000-555d-97cb-5f37-71d1770654f8	9232	Črenšovci
00050000-555d-97cb-943e-afe023af7d92	2393	Črna na Koroškem
00050000-555d-97cb-9ea4-4d1b61df4c63	6275	Črni Kal
00050000-555d-97cb-17cc-f6b1eb36bac1	5274	Črni Vrh nad Idrijo
00050000-555d-97cb-b8b7-c17205d8df5c	5262	Črniče
00050000-555d-97cb-1149-fef0bf322667	8340	Črnomelj
00050000-555d-97cb-8fee-32d9ff4a1fc0	6271	Dekani
00050000-555d-97cb-5d41-91932fd3b2f5	5210	Deskle
00050000-555d-97cb-f8ed-bff7d983c410	2253	Destrnik
00050000-555d-97cb-8f9b-6783775a41ea	6215	Divača
00050000-555d-97cb-2660-f576d7a1ea03	1233	Dob
00050000-555d-97cb-ad1d-e12f1fda9fd4	3224	Dobje pri Planini
00050000-555d-97cb-3ab2-190029f862bc	8257	Dobova
00050000-555d-97cb-63cf-b5954b108e7c	1423	Dobovec
00050000-555d-97cb-f508-0601971a838e	5263	Dobravlje
00050000-555d-97cb-b267-fe2065610de0	3204	Dobrna
00050000-555d-97cb-fa64-0d09ae164247	8211	Dobrnič
00050000-555d-97cb-7d04-95eb6f3ba126	1356	Dobrova
00050000-555d-97cb-1784-87034c597c58	9223	Dobrovnik/Dobronak 
00050000-555d-97cb-7c71-bb91150a3d2a	5212	Dobrovo v Brdih
00050000-555d-97cb-eca2-4d6ad6ca4679	1431	Dol pri Hrastniku
00050000-555d-97cb-6d94-96a7b7223163	1262	Dol pri Ljubljani
00050000-555d-97cb-394e-2d85d4a552bd	1273	Dole pri Litiji
00050000-555d-97cb-d81b-cf66e9ad7485	1331	Dolenja vas
00050000-555d-97cb-0d70-5c321930f1d2	8350	Dolenjske Toplice
00050000-555d-97cb-f7c6-d4799fe0b071	1230	Domžale
00050000-555d-97cb-b1b9-7e925caa82e7	2252	Dornava
00050000-555d-97cb-79d1-fdfff5c4d1eb	5294	Dornberk
00050000-555d-97cb-9821-ea533dca9be0	1319	Draga
00050000-555d-97cb-dfb2-307120f6dfe5	8343	Dragatuš
00050000-555d-97cb-7712-d75997495086	3222	Dramlje
00050000-555d-97cb-3c4d-7281c6ab7d54	2370	Dravograd
00050000-555d-97cb-8a11-5ababd2ad299	4203	Duplje
00050000-555d-97cb-59e4-df09b6f79b6b	6221	Dutovlje
00050000-555d-97cb-4308-701e00e959dc	8361	Dvor
00050000-555d-97cb-9f6a-461d18b95a30	2343	Fala
00050000-555d-97cb-bfb7-66b79b8820cb	9208	Fokovci
00050000-555d-97cb-b709-1404f13ebce9	2313	Fram
00050000-555d-97cb-f603-8a71c036eda1	3213	Frankolovo
00050000-555d-97cb-1415-717ed5427fe0	1274	Gabrovka
00050000-555d-97cb-0ca6-6fb83bddf1ea	8254	Globoko
00050000-555d-97cb-0493-4f215cc93587	5275	Godovič
00050000-555d-97cb-225e-89e5e43169bf	4204	Golnik
00050000-555d-97cb-a580-5a68b627a557	3303	Gomilsko
00050000-555d-97cb-fd28-8118d462cb97	4224	Gorenja vas
00050000-555d-97cb-054c-6387d0d999d7	3263	Gorica pri Slivnici
00050000-555d-97cb-faef-5fbb14d53da1	2272	Gorišnica
00050000-555d-97cb-1e56-c9288380caa3	9250	Gornja Radgona
00050000-555d-97cb-4805-809ef664345b	3342	Gornji Grad
00050000-555d-97cb-9d4b-f2023e9d0c08	4282	Gozd Martuljek
00050000-555d-97cb-1f81-ebf7d0cdb563	6272	Gračišče
00050000-555d-97cb-b0af-210a45c7c83b	9264	Grad
00050000-555d-97cb-0818-5ee4e19d5368	8332	Gradac
00050000-555d-97cb-9630-551635b74fe0	1384	Grahovo
00050000-555d-97cb-a066-6ca447ef6c91	5242	Grahovo ob Bači
00050000-555d-97cb-30aa-b9667c410857	5251	Grgar
00050000-555d-97cb-ffa1-ffb523188d77	3302	Griže
00050000-555d-97cb-e60d-92c94fddbf80	3231	Grobelno
00050000-555d-97cb-ddac-d9179c982ed2	1290	Grosuplje
00050000-555d-97cb-6c92-e59b44acd6e0	2288	Hajdina
00050000-555d-97cb-4ea3-a66132f38d4b	8362	Hinje
00050000-555d-97cb-2ad5-367500d4619c	2311	Hoče
00050000-555d-97cb-5981-4e9dce4b6c2c	9205	Hodoš/Hodos
00050000-555d-97cb-ae43-9d8a7a54f863	1354	Horjul
00050000-555d-97cb-3c56-13d098a77d38	1372	Hotedršica
00050000-555d-97cb-4993-69d22c039e8d	1430	Hrastnik
00050000-555d-97cb-017f-24c65277d62e	6225	Hruševje
00050000-555d-97cb-5ccf-66aa4bea1f3f	4276	Hrušica
00050000-555d-97cb-c961-af658608a6d8	5280	Idrija
00050000-555d-97cb-102e-c87470bc76b9	1292	Ig
00050000-555d-97cb-2038-46d342361060	6250	Ilirska Bistrica
00050000-555d-97cb-6771-ea8c24ab298c	6251	Ilirska Bistrica-Trnovo
00050000-555d-97cb-ef99-915c9ad67cd0	1295	Ivančna Gorica
00050000-555d-97cb-0540-2f33f49207b5	2259	Ivanjkovci
00050000-555d-97cb-4903-7f5d46f63a65	1411	Izlake
00050000-555d-97cb-0b7f-23fe3127ee2c	6310	Izola/Isola
00050000-555d-97cb-4007-bb050fd34037	2222	Jakobski Dol
00050000-555d-97cb-4ba9-71e37cc7869b	2221	Jarenina
00050000-555d-97cb-7532-c05a9bb7ce35	6254	Jelšane
00050000-555d-97cb-9d24-f37ca1bd0a92	4270	Jesenice
00050000-555d-97cb-c023-9e1a2511702a	8261	Jesenice na Dolenjskem
00050000-555d-97cb-8db7-6274a239c3f6	3273	Jurklošter
00050000-555d-97cb-4fc1-b77bcd5bda2e	2223	Jurovski Dol
00050000-555d-97cb-1559-2f33d3328e69	2256	Juršinci
00050000-555d-97cb-1ff4-f77fde594c5c	5214	Kal nad Kanalom
00050000-555d-97cb-db42-409805f3dafb	3233	Kalobje
00050000-555d-97cb-ecec-2d5f1dcc99c3	4246	Kamna Gorica
00050000-555d-97cb-cab5-b1948ddda6a0	2351	Kamnica
00050000-555d-97cb-c4b5-e858724a236a	1241	Kamnik
00050000-555d-97cb-9aa3-3cb140cf587c	5213	Kanal
00050000-555d-97cb-4b38-38198739ab22	8258	Kapele
00050000-555d-97cb-b146-c918851253a9	2362	Kapla
00050000-555d-97cb-848e-56f9f1ceb6ea	2325	Kidričevo
00050000-555d-97cb-ad41-659d713747b3	1412	Kisovec
00050000-555d-97cb-ad7d-c36e8ebd9a1b	6253	Knežak
00050000-555d-97cb-a816-ae7c77f3c230	5222	Kobarid
00050000-555d-97cb-44b7-bcab8cee3241	9227	Kobilje
00050000-555d-97cb-d447-0a7e8af439f9	1330	Kočevje
00050000-555d-97cb-2498-67caf8c8724e	1338	Kočevska Reka
00050000-555d-97cb-ce9e-5f6790a5e5f5	2276	Kog
00050000-555d-97cb-0944-25499545bb88	5211	Kojsko
00050000-555d-97cb-2aca-4708bde8c6e6	6223	Komen
00050000-555d-97cb-4634-3e8e61f264c2	1218	Komenda
00050000-555d-97cb-0cb6-85383aa2991f	6000	Koper/Capodistria 
00050000-555d-97cb-82b7-05023a52c5aa	6001	Koper/Capodistria - poštni predali
00050000-555d-97cb-e87c-abc82b127d62	8282	Koprivnica
00050000-555d-97cb-a701-b23c546fa8fc	5296	Kostanjevica na Krasu
00050000-555d-97cb-939e-cd4e3657b42c	8311	Kostanjevica na Krki
00050000-555d-97cb-a791-6987949340e6	1336	Kostel
00050000-555d-97cb-fcb4-235d8a7c4812	6256	Košana
00050000-555d-97cb-80ef-9dbdc32b3c06	2394	Kotlje
00050000-555d-97cb-c2e5-28482614313e	6240	Kozina
00050000-555d-97cb-d0f6-f58a38842304	3260	Kozje
00050000-555d-97cb-1221-36c629ffcf26	4000	Kranj 
00050000-555d-97cb-f8c6-c570a5893d0c	4001	Kranj - poštni predali
00050000-555d-97cb-2aa2-710ebb9e2722	4280	Kranjska Gora
00050000-555d-97cb-ec4d-7b2e20ff4daf	1281	Kresnice
00050000-555d-97cb-e945-55b75b2eb23e	4294	Križe
00050000-555d-97cb-ac11-d49fa1780f22	9206	Križevci
00050000-555d-97cb-d056-a4b204249716	9242	Križevci pri Ljutomeru
00050000-555d-97cb-e3aa-56f8ebcea7b4	1301	Krka
00050000-555d-97cb-91a8-bcf2e3c38fcc	8296	Krmelj
00050000-555d-97cb-b4ab-55284afcb172	4245	Kropa
00050000-555d-97cb-891c-28140b1ceec0	8262	Krška vas
00050000-555d-97cb-fe56-09dfda931259	8270	Krško
00050000-555d-97cb-7b9f-067ee2da7ba8	9263	Kuzma
00050000-555d-97cb-1a32-012f08d535dc	2318	Laporje
00050000-555d-97cb-e2ad-95e3c89edc34	3270	Laško
00050000-555d-97cb-40a0-84ac52607bbf	1219	Laze v Tuhinju
00050000-555d-97cb-da36-bfeddd468ab6	2230	Lenart v Slovenskih goricah
00050000-555d-97cb-80dc-793bf8d3e242	9220	Lendava/Lendva
00050000-555d-97cb-e43b-2992b7a9a689	4248	Lesce
00050000-555d-97cb-daa4-27c5a0e1d0b8	3261	Lesično
00050000-555d-97cb-a10b-1bbc3d019dc8	8273	Leskovec pri Krškem
00050000-555d-97cb-3a60-5c735abea620	2372	Libeliče
00050000-555d-97cb-3e59-b1edba813d6d	2341	Limbuš
00050000-555d-97cb-d84f-56fcc645d40a	1270	Litija
00050000-555d-97cb-a7d4-dacf40f1dc28	3202	Ljubečna
00050000-555d-97cb-1f70-6d0678f929b9	1000	Ljubljana 
00050000-555d-97cb-b527-3be182e9e02d	1001	Ljubljana - poštni predali
00050000-555d-97cb-eae0-51c866e4abe0	1231	Ljubljana - Črnuče
00050000-555d-97cb-2930-24de917b434d	1261	Ljubljana - Dobrunje
00050000-555d-97cb-24f9-b62d7c2a3fca	1260	Ljubljana - Polje
00050000-555d-97cb-b6f4-df52c3c2556a	1210	Ljubljana - Šentvid
00050000-555d-97cb-7efc-4ea1f6d162df	1211	Ljubljana - Šmartno
00050000-555d-97cb-fe38-e84e6757c0de	3333	Ljubno ob Savinji
00050000-555d-97cb-fc16-6bc3d6b3ad44	9240	Ljutomer
00050000-555d-97cb-0fe7-edf7ce0a1f87	3215	Loče
00050000-555d-97cb-d67a-e8e191a01e7d	5231	Log pod Mangartom
00050000-555d-97cb-c7fc-01a4a6349643	1358	Log pri Brezovici
00050000-555d-97cb-747c-7a19a822f162	1370	Logatec
00050000-555d-97cb-7cb2-68e031b9c1dd	1371	Logatec
00050000-555d-97cb-d417-ee717b28a610	1434	Loka pri Zidanem Mostu
00050000-555d-97cb-b4c8-60f454df9bc6	3223	Loka pri Žusmu
00050000-555d-97cb-be3e-42344235122b	6219	Lokev
00050000-555d-97cb-dfcd-0584d2c850be	1318	Loški Potok
00050000-555d-97cb-b63b-d3774979d80e	2324	Lovrenc na Dravskem polju
00050000-555d-97cb-f870-c12bde92761c	2344	Lovrenc na Pohorju
00050000-555d-97cb-b952-cca76d1bf66d	3334	Luče
00050000-555d-97cb-b0f1-ddca650b782a	1225	Lukovica
00050000-555d-97cb-c3de-a2be95c0886e	9202	Mačkovci
00050000-555d-97cb-894f-5c913757772d	2322	Majšperk
00050000-555d-97cb-d41d-c5870b61d3ee	2321	Makole
00050000-555d-97cb-f542-922828aea896	9243	Mala Nedelja
00050000-555d-97cb-d402-2bb375ac32b4	2229	Malečnik
00050000-555d-97cb-35e7-41f788efa881	6273	Marezige
00050000-555d-97cb-ef0d-894ee4c6f100	2000	Maribor 
00050000-555d-97cb-5532-a655c76495a2	2001	Maribor - poštni predali
00050000-555d-97cb-79ee-a475fef44671	2206	Marjeta na Dravskem polju
00050000-555d-97cb-284e-620c1e06ce68	2281	Markovci
00050000-555d-97cb-c3b0-34220baadded	9221	Martjanci
00050000-555d-97cb-d3ae-a5e44481e18a	6242	Materija
00050000-555d-97cb-c855-fc519342a2ae	4211	Mavčiče
00050000-555d-97cb-6525-3767841a4d36	1215	Medvode
00050000-555d-97cb-39f3-2c9acdbebfcc	1234	Mengeš
00050000-555d-97cb-de07-187cfd5af35e	8330	Metlika
00050000-555d-97cb-00d2-519f64e07de6	2392	Mežica
00050000-555d-97cb-d170-a52f71606c57	2204	Miklavž na Dravskem polju
00050000-555d-97cb-5ff2-f5814641d18b	2275	Miklavž pri Ormožu
00050000-555d-97cb-5bf1-c1709b562ff9	5291	Miren
00050000-555d-97cb-7668-748aff11b25b	8233	Mirna
00050000-555d-97cb-2cce-960db24d2c04	8216	Mirna Peč
00050000-555d-97cb-6e20-523763c4374a	2382	Mislinja
00050000-555d-97cb-9254-b4e5642e5158	4281	Mojstrana
00050000-555d-97cb-5279-ff408a96156d	8230	Mokronog
00050000-555d-97cb-2198-2c102e85edf6	1251	Moravče
00050000-555d-97cb-6850-dd848757f5c9	9226	Moravske Toplice
00050000-555d-97cb-3265-be64752d14a4	5216	Most na Soči
00050000-555d-97cb-c4f1-9e053d1af9c1	1221	Motnik
00050000-555d-97cb-5340-aa03adbaa97f	3330	Mozirje
00050000-555d-97cb-fe96-29d555a78461	9000	Murska Sobota 
00050000-555d-97cb-559b-79e061046c61	9001	Murska Sobota - poštni predali
00050000-555d-97cb-7859-ac0225ac864e	2366	Muta
00050000-555d-97cb-6940-177c29a70e91	4202	Naklo
00050000-555d-97cb-14cf-a56d42092433	3331	Nazarje
00050000-555d-97cb-f68d-7f8acb6c1a0a	1357	Notranje Gorice
00050000-555d-97cb-3ddf-d64ec296f092	3203	Nova Cerkev
00050000-555d-97cb-1b9e-e4676afb6c92	5000	Nova Gorica 
00050000-555d-97cb-730e-c01fb2b82fa7	5001	Nova Gorica - poštni predali
00050000-555d-97cb-e53a-773b5e31ab9a	1385	Nova vas
00050000-555d-97cb-c834-cee22e13d235	8000	Novo mesto
00050000-555d-97cb-3160-f68344685b36	8001	Novo mesto - poštni predali
00050000-555d-97cb-5b87-f77adf81f1a3	6243	Obrov
00050000-555d-97cb-e255-06bb54dce2e1	9233	Odranci
00050000-555d-97cb-08e3-464865a6dcd5	2317	Oplotnica
00050000-555d-97cb-c031-56926617e8f8	2312	Orehova vas
00050000-555d-97cb-7b20-b46ef2f56805	2270	Ormož
00050000-555d-97cb-874b-042fd698207f	1316	Ortnek
00050000-555d-97cb-fc95-9d4748733b60	1337	Osilnica
00050000-555d-97cb-79bf-7d8aeaef7db7	8222	Otočec
00050000-555d-97cb-e114-384b051022c0	2361	Ožbalt
00050000-555d-97cb-8882-3f17f0f51073	2231	Pernica
00050000-555d-97cb-06aa-0273034d33b2	2211	Pesnica pri Mariboru
00050000-555d-97cb-594e-168b9499a991	9203	Petrovci
00050000-555d-97cb-e0c8-8686aa8e6a6d	3301	Petrovče
00050000-555d-97cb-c593-6525d3880dbf	6330	Piran/Pirano
00050000-555d-97cb-18e2-b103b2c6dcad	8255	Pišece
00050000-555d-97cb-559f-c8282984432e	6257	Pivka
00050000-555d-97cb-3406-033ac6ccb9c2	6232	Planina
00050000-555d-97cb-f1d1-99b7c15024bf	3225	Planina pri Sevnici
00050000-555d-97cb-af96-9e3bafe51d47	6276	Pobegi
00050000-555d-97cb-b90e-eda506e9d5f4	8312	Podbočje
00050000-555d-97cb-d95c-1a1b15b80ffd	5243	Podbrdo
00050000-555d-97cb-87ec-9a81b0c73b6e	3254	Podčetrtek
00050000-555d-97cb-ec08-333ac08ccf70	2273	Podgorci
00050000-555d-97cb-0468-74d81749dc2f	6216	Podgorje
00050000-555d-97cb-33a5-e6a7d3c8542a	2381	Podgorje pri Slovenj Gradcu
00050000-555d-97cb-eb97-220e5f2ecc61	6244	Podgrad
00050000-555d-97cb-b058-8a420f5343b5	1414	Podkum
00050000-555d-97cb-4109-8b0c7cc5daf8	2286	Podlehnik
00050000-555d-97cb-ba36-17ebea0ec62f	5272	Podnanos
00050000-555d-97cb-b709-e41e34dedd36	4244	Podnart
00050000-555d-97cb-8cec-fc0f3b18ff3e	3241	Podplat
00050000-555d-97cb-6437-4ffb145ec8d0	3257	Podsreda
00050000-555d-97cb-27ea-e6d5c9bf6781	2363	Podvelka
00050000-555d-97cb-4768-a5d1c46b7273	2208	Pohorje
00050000-555d-97cb-a640-a779d784134f	2257	Polenšak
00050000-555d-97cb-e9c4-d2181436a2d2	1355	Polhov Gradec
00050000-555d-97cb-6d8d-162c019db989	4223	Poljane nad Škofjo Loko
00050000-555d-97cb-bdea-e7c0c1932fee	2319	Poljčane
00050000-555d-97cb-342f-94e9769ca857	1272	Polšnik
00050000-555d-97cb-9da5-aae8256b16ea	3313	Polzela
00050000-555d-97cb-c056-b7661b22d103	3232	Ponikva
00050000-555d-97cb-e42d-9f87440d5455	6320	Portorož/Portorose
00050000-555d-97cb-673a-f039a15cbc57	6230	Postojna
00050000-555d-97cb-cf3c-c03139a3c6be	2331	Pragersko
00050000-555d-97cb-66ea-b5b0b4de2869	3312	Prebold
00050000-555d-97cb-df6c-556bc8c5b371	4205	Preddvor
00050000-555d-97cb-7589-01afb92544c6	6255	Prem
00050000-555d-97cb-afaa-d6ddb0e4ade7	1352	Preserje
00050000-555d-97cb-0314-e53c044dfc4a	6258	Prestranek
00050000-555d-97cb-3f33-75e9f14524ed	2391	Prevalje
00050000-555d-97cb-97e6-4cad6b52d824	3262	Prevorje
00050000-555d-97cb-2fae-445872cc7db9	1276	Primskovo 
00050000-555d-97cb-0e69-d1cd0105106d	3253	Pristava pri Mestinju
00050000-555d-97cb-3015-e7af7c4cf4db	9207	Prosenjakovci/Partosfalva
00050000-555d-97cb-db1a-329b44896280	5297	Prvačina
00050000-555d-97cb-7c39-449d2e429c78	2250	Ptuj
00050000-555d-97cb-2443-e3d393761de3	2323	Ptujska Gora
00050000-555d-97cb-feb8-5c96b4d4b14e	9201	Puconci
00050000-555d-97cb-c6d1-345e1d145ea1	2327	Rače
00050000-555d-97cb-4e7d-697542792efb	1433	Radeče
00050000-555d-97cb-32b2-b754caee28d5	9252	Radenci
00050000-555d-97cb-bcd6-bfc26fec41a2	2360	Radlje ob Dravi
00050000-555d-97cb-43fe-5b2c8d8cc984	1235	Radomlje
00050000-555d-97cb-c4d8-5e370b10f637	4240	Radovljica
00050000-555d-97cb-e9c2-52450996989e	8274	Raka
00050000-555d-97cb-96b8-97fbbe72fa10	1381	Rakek
00050000-555d-97cb-ed3f-6802b7373d37	4283	Rateče - Planica
00050000-555d-97cb-4eeb-e84c54699a62	2390	Ravne na Koroškem
00050000-555d-97cb-3e22-9aa3a91fb43c	9246	Razkrižje
00050000-555d-97cb-f963-a2f138372c68	3332	Rečica ob Savinji
00050000-555d-97cb-7a3e-314288a4caf5	5292	Renče
00050000-555d-97cb-ca72-542b5cd1b303	1310	Ribnica
00050000-555d-97cb-aa49-91a41f0d204a	2364	Ribnica na Pohorju
00050000-555d-97cb-337c-320c5a0c7d80	3272	Rimske Toplice
00050000-555d-97cb-876d-924a487f7e4c	1314	Rob
00050000-555d-97cb-952b-897cc0d54762	5215	Ročinj
00050000-555d-97cb-831f-99025846d2ea	3250	Rogaška Slatina
00050000-555d-97cb-e0e9-38a094a173b0	9262	Rogašovci
00050000-555d-97cb-a4fb-9b838b81ba86	3252	Rogatec
00050000-555d-97cb-8000-e29695f4b72e	1373	Rovte
00050000-555d-97cb-ce8e-3c8c432a3cdf	2342	Ruše
00050000-555d-97cb-2124-8917b472977e	1282	Sava
00050000-555d-97cb-6a6f-a95e6b7e88ca	6333	Sečovlje/Sicciole
00050000-555d-97cb-d3df-130f394d407c	4227	Selca
00050000-555d-97cb-c033-bdeb5f38bc2b	2352	Selnica ob Dravi
00050000-555d-97cb-e0ad-5c4a309834fd	8333	Semič
00050000-555d-97cb-bde7-bad505b5cf14	8281	Senovo
00050000-555d-97cb-911c-52dc11221a45	6224	Senožeče
00050000-555d-97cb-2ba9-d366c19bd0a6	8290	Sevnica
00050000-555d-97cb-5771-382f5f53713e	6210	Sežana
00050000-555d-97cb-3121-d226c93b1f69	2214	Sladki Vrh
00050000-555d-97cb-df09-6401b9960729	5283	Slap ob Idrijci
00050000-555d-97cb-d853-c5e8c0fc6709	2380	Slovenj Gradec
00050000-555d-97cb-1e06-c4c0f67e016d	2310	Slovenska Bistrica
00050000-555d-97cb-8114-106558de7be8	3210	Slovenske Konjice
00050000-555d-97cb-a201-c52318229268	1216	Smlednik
00050000-555d-97cb-920b-cf71d99e5354	5232	Soča
00050000-555d-97cb-c831-3e3b63512b5d	1317	Sodražica
00050000-555d-97cb-16cd-44a098126d62	3335	Solčava
00050000-555d-97cb-1862-a487c6874998	5250	Solkan
00050000-555d-97cb-5fac-986e16325885	4229	Sorica
00050000-555d-97cb-047f-c8c9a2c662f3	4225	Sovodenj
00050000-555d-97cb-bf45-419fa8c3e02c	5281	Spodnja Idrija
00050000-555d-97cb-4f7d-a9dc6e102d5d	2241	Spodnji Duplek
00050000-555d-97cb-bdee-6b7b45fbc035	9245	Spodnji Ivanjci
00050000-555d-97cb-7072-46c67f40089d	2277	Središče ob Dravi
00050000-555d-97cb-6930-ef83335a9c6e	4267	Srednja vas v Bohinju
00050000-555d-97cb-4e5e-e1430fea3114	8256	Sromlje 
00050000-555d-97cb-abd5-b9fc843086d7	5224	Srpenica
00050000-555d-97cb-1966-491a1cd03d5c	1242	Stahovica
00050000-555d-97cb-4fd1-5884b7386c98	1332	Stara Cerkev
00050000-555d-97cb-5473-82f9100dfc89	8342	Stari trg ob Kolpi
00050000-555d-97cb-2695-34dcd97206f1	1386	Stari trg pri Ložu
00050000-555d-97cb-92b2-29e3ec346c85	2205	Starše
00050000-555d-97cb-9cee-5408a7777af4	2289	Stoperce
00050000-555d-97cb-bd70-caa420d84638	8322	Stopiče
00050000-555d-97cb-56ba-91ce00188f46	3206	Stranice
00050000-555d-97cb-f815-5271b62c5237	8351	Straža
00050000-555d-97cb-2396-59289ad5a94c	1313	Struge
00050000-555d-97cb-2bf9-f573425d122d	8293	Studenec
00050000-555d-97cb-878d-beda8ca81913	8331	Suhor
00050000-555d-97cb-1fa5-fcf670672d81	2233	Sv. Ana v Slovenskih goricah
00050000-555d-97cb-bab8-6dc77abf235b	2235	Sv. Trojica v Slovenskih goricah
00050000-555d-97cb-1215-a459c69d9cee	2353	Sveti Duh na Ostrem Vrhu
00050000-555d-97cb-50ce-b5598788aaa8	9244	Sveti Jurij ob Ščavnici
00050000-555d-97cb-e609-930218e14484	3264	Sveti Štefan
00050000-555d-97cb-7c51-7e4998bca9b9	2258	Sveti Tomaž
00050000-555d-97cb-cb41-7aa863fb07cf	9204	Šalovci
00050000-555d-97cb-9b76-f6a6e95f4af0	5261	Šempas
00050000-555d-97cb-7ee4-afc117bee17c	5290	Šempeter pri Gorici
00050000-555d-97cb-9e9e-b6ff1d980eb4	3311	Šempeter v Savinjski dolini
00050000-555d-97cb-885c-bf5feb2d8754	4208	Šenčur
00050000-555d-97cb-b8c6-dbaeeca24695	2212	Šentilj v Slovenskih goricah
00050000-555d-97cb-c41a-93675bf3e4a1	8297	Šentjanž
00050000-555d-97cb-865c-03fe23f70ee9	2373	Šentjanž pri Dravogradu
00050000-555d-97cb-dcbf-a462b303710b	8310	Šentjernej
00050000-555d-97cb-1169-a4efc8a4226e	3230	Šentjur
00050000-555d-97cb-823a-efc8806796bd	3271	Šentrupert
00050000-555d-97cb-4888-544acd9f519f	8232	Šentrupert
00050000-555d-97cb-5521-65954385db49	1296	Šentvid pri Stični
00050000-555d-97cb-afb4-3f6006daf4ad	8275	Škocjan
00050000-555d-97cb-992c-2ec8dd79168a	6281	Škofije
00050000-555d-97cb-cf7b-a3c3b0afb5b6	4220	Škofja Loka
00050000-555d-97cb-0343-28fdee0b6184	3211	Škofja vas
00050000-555d-97cb-7f19-cfb3288197eb	1291	Škofljica
00050000-555d-97cb-32fa-e56e6c24c87f	6274	Šmarje
00050000-555d-97cb-448f-605665dff17d	1293	Šmarje - Sap
00050000-555d-97cb-7fce-430ad0381dc9	3240	Šmarje pri Jelšah
00050000-555d-97cb-9e9e-12f1001a3126	8220	Šmarješke Toplice
00050000-555d-97cb-990f-54ef0b45d7f8	2315	Šmartno na Pohorju
00050000-555d-97cb-8910-92a10ce45383	3341	Šmartno ob Dreti
00050000-555d-97cb-a5fd-687251b81e32	3327	Šmartno ob Paki
00050000-555d-97cb-6c13-fccfd5cd8c8a	1275	Šmartno pri Litiji
00050000-555d-97cb-a215-b1f071a3752c	2383	Šmartno pri Slovenj Gradcu
00050000-555d-97cb-1803-fd99ac1b3993	3201	Šmartno v Rožni dolini
00050000-555d-97cb-17a1-35f2dfbc223f	3325	Šoštanj
00050000-555d-97cb-7981-d65fe3e6c25c	6222	Štanjel
00050000-555d-97cb-bdc3-9c2e6ddb45b7	3220	Štore
00050000-555d-97cb-7979-90af1e4673f5	3304	Tabor
00050000-555d-97cb-1a56-89c799ff78ed	3221	Teharje
00050000-555d-97cb-cc8b-ba8e687cf527	9251	Tišina
00050000-555d-97cb-f4e6-88cc53555b6b	5220	Tolmin
00050000-555d-97cb-3a89-7032dd5f210e	3326	Topolšica
00050000-555d-97cb-ec07-ba7efeaa0b3f	2371	Trbonje
00050000-555d-97cb-e483-08993d997383	1420	Trbovlje
00050000-555d-97cb-39e7-b2ac9c15f1b4	8231	Trebelno 
00050000-555d-97cb-a698-5141ca5966e4	8210	Trebnje
00050000-555d-97cb-9aaf-326839910038	5252	Trnovo pri Gorici
00050000-555d-97cb-cf30-7b27c6fe8b72	2254	Trnovska vas
00050000-555d-97cb-e94f-a200a8d740e2	1222	Trojane
00050000-555d-97cb-c3ed-fe8e52f6175a	1236	Trzin
00050000-555d-97cb-58e7-14b0ce656717	4290	Tržič
00050000-555d-97cb-aa7a-02e05433eab3	8295	Tržišče
00050000-555d-97cb-c3cb-f1790cf25a87	1311	Turjak
00050000-555d-97cb-1594-827a916f3c56	9224	Turnišče
00050000-555d-97cb-9600-a44e8c66f449	8323	Uršna sela
00050000-555d-97cb-4010-a55f50514aae	1252	Vače
00050000-555d-97cb-2f3c-419b4c26b6f6	3320	Velenje 
00050000-555d-97cb-602d-17b83e021824	3322	Velenje - poštni predali
00050000-555d-97cb-56fb-ae2d1e472fe0	8212	Velika Loka
00050000-555d-97cb-d17e-b9bf1dbf5008	2274	Velika Nedelja
00050000-555d-97cb-7359-23475b1256f1	9225	Velika Polana
00050000-555d-97cb-236f-695d4e295db8	1315	Velike Lašče
00050000-555d-97cb-d033-3fe80703eb4a	8213	Veliki Gaber
00050000-555d-97cb-69e7-c07bd2a96318	9241	Veržej
00050000-555d-97cb-fa82-23b0880cdbcd	1312	Videm - Dobrepolje
00050000-555d-97cb-d39b-4d54273d4457	2284	Videm pri Ptuju
00050000-555d-97cb-6540-8f2a28871020	8344	Vinica
00050000-555d-97cb-b9f0-afeba28c64fc	5271	Vipava
00050000-555d-97cb-cf3e-5fd651b591b7	4212	Visoko
00050000-555d-97cb-804e-082cc8da691b	1294	Višnja Gora
00050000-555d-97cb-b5fa-fe0cd808ed56	3205	Vitanje
00050000-555d-97cb-e928-f15a4ab58e1b	2255	Vitomarci
00050000-555d-97cb-2802-6d72a7d83e52	1217	Vodice
00050000-555d-97cb-8047-1bd462eb7364	3212	Vojnik\t
00050000-555d-97cb-2017-9fe672c94a0b	5293	Volčja Draga
00050000-555d-97cb-314d-bfadcf8f8f09	2232	Voličina
00050000-555d-97cb-cb8c-dcf78f2395ca	3305	Vransko
00050000-555d-97cb-851e-41ca2b18ad95	6217	Vremski Britof
00050000-555d-97cb-b35b-c55d319fb537	1360	Vrhnika
00050000-555d-97cb-11d4-23128087b155	2365	Vuhred
00050000-555d-97cb-61e2-38a33f29a919	2367	Vuzenica
00050000-555d-97cb-d6ad-a511ab78c859	8292	Zabukovje 
00050000-555d-97cb-6b6f-f2f230935b5b	1410	Zagorje ob Savi
00050000-555d-97cb-b1e1-b9c558fe4d88	1303	Zagradec
00050000-555d-97cb-0e4b-928a09f9b6db	2283	Zavrč
00050000-555d-97cb-ce0d-811afb61f97c	8272	Zdole 
00050000-555d-97cb-73d0-b339644fa194	4201	Zgornja Besnica
00050000-555d-97cb-247a-23a800e7f447	2242	Zgornja Korena
00050000-555d-97cb-8be8-27d2e08ed1f5	2201	Zgornja Kungota
00050000-555d-97cb-9c54-8c53ae2e883d	2316	Zgornja Ložnica
00050000-555d-97cb-aa1a-73a703cc8412	2314	Zgornja Polskava
00050000-555d-97cb-90bf-fefa0ec05ad0	2213	Zgornja Velka
00050000-555d-97cb-15f8-d9b59de7af27	4247	Zgornje Gorje
00050000-555d-97cb-0a93-e3be75cdf46e	4206	Zgornje Jezersko
00050000-555d-97cb-5ccd-ee114288eab2	2285	Zgornji Leskovec
00050000-555d-97cb-061e-ee2dff592d34	1432	Zidani Most
00050000-555d-97cb-d86b-259d68745f4a	3214	Zreče
00050000-555d-97cb-c1f7-2848ff1ed275	4209	Žabnica
00050000-555d-97cb-19c8-da1be2200d4f	3310	Žalec
00050000-555d-97cb-daaa-1b15264f7eac	4228	Železniki
00050000-555d-97cb-feb5-18526d77773f	2287	Žetale
00050000-555d-97cb-bd56-4f3838a1eea2	4226	Žiri
00050000-555d-97cb-b7f8-da55eec8b905	4274	Žirovnica
00050000-555d-97cb-d56a-3f46434e5e7b	8360	Žužemberk
\.


--
-- TOC entry 2655 (class 0 OID 4303479)
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
-- TOC entry 2638 (class 0 OID 4303307)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4303372)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4303491)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4303596)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4303641)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4303520)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4303464)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4303454)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4303631)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4303586)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 4303175)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555d-97cb-5f43-a1990a39025c	00010000-555d-97cb-98ad-d16c39306557	2015-05-21 10:31:08	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROgvKVXohCzjF3/ph1U56Ir2.9AmmwE1W";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2662 (class 0 OID 4303529)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4303213)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555d-97cb-42ed-857a95ddecbb	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555d-97cb-07dd-d6e55d33db6e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555d-97cb-59b9-b79ae4cc1cb0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555d-97cb-9386-a71ae6530270	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555d-97cb-37bf-efbf311e34ad	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555d-97cb-8253-e3a6b66791a0	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2628 (class 0 OID 4303197)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555d-97cb-5f43-a1990a39025c	00020000-555d-97cb-9386-a71ae6530270
00010000-555d-97cb-98ad-d16c39306557	00020000-555d-97cb-9386-a71ae6530270
\.


--
-- TOC entry 2664 (class 0 OID 4303543)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4303485)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4303435)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 4303272)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4303441)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4303619)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4303341)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 4303184)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555d-97cb-98ad-d16c39306557	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROXQma6ygh/90n9xvMPFZci4HLP0GVh7a	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555d-97cb-5f43-a1990a39025c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2676 (class 0 OID 4303673)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4303387)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4303512)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4303578)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4303419)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4303663)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 4303568)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4303238)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4303713)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4303706)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4303618)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4303409)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4303434)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4303367)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4303564)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4303385)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4303428)
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
-- TOC entry 2360 (class 2606 OID 4303477)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4303504)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4303339)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4303247)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4303304)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4303270)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4303227)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4303212)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4303510)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4303542)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4303658)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4303297)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4303327)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4303483)
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
-- TOC entry 2294 (class 2606 OID 4303317)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4303376)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4303495)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4303602)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4303646)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4303527)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4303468)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4303459)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4303640)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4303593)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4303183)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4303533)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4303201)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4303221)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4303551)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4303490)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4303440)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4303277)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4303450)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4303630)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4303352)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4303196)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4303688)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4303394)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4303518)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4303584)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4303423)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4303672)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4303577)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4303416)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4303299)
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
-- TOC entry 2373 (class 1259 OID 4303511)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4303497)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4303496)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4303395)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4303567)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4303565)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4303566)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4303660)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4303661)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4303662)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4303691)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4303690)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2429 (class 1259 OID 4303689)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4303354)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4303353)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4303306)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4303305)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4303534)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4303429)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4303228)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4303229)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4303554)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4303553)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4303552)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4303377)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4303379)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4303378)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4303463)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4303461)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4303460)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4303462)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4303202)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4303203)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4303519)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4303484)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4303594)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4303595)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4303319)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4303318)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4303320)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4303603)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4303604)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2438 (class 1259 OID 4303716)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 4303715)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2440 (class 1259 OID 4303718)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2441 (class 1259 OID 4303714)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2442 (class 1259 OID 4303717)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4303585)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4303472)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4303471)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4303469)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4303470)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2434 (class 1259 OID 4303708)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 4303707)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4303386)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4303249)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4303248)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4303278)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4303279)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4303453)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4303452)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4303451)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4303418)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4303414)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4303411)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4303412)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4303410)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4303415)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4303413)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4303298)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4303368)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4303370)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4303369)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4303371)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4303478)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4303659)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4303271)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4303340)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4303528)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4303328)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4303647)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4303222)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4303417)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2467 (class 2606 OID 4303849)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 4303834)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2469 (class 2606 OID 4303839)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2465 (class 2606 OID 4303859)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2471 (class 2606 OID 4303829)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2466 (class 2606 OID 4303854)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2468 (class 2606 OID 4303844)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2452 (class 2606 OID 4303764)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2488 (class 2606 OID 4303944)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2486 (class 2606 OID 4303939)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2487 (class 2606 OID 4303934)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2464 (class 2606 OID 4303824)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2494 (class 2606 OID 4303984)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2496 (class 2606 OID 4303974)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4303979)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2484 (class 2606 OID 4303924)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2505 (class 2606 OID 4304019)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2504 (class 2606 OID 4304024)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2503 (class 2606 OID 4304029)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2506 (class 2606 OID 4304044)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2507 (class 2606 OID 4304039)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2508 (class 2606 OID 4304034)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2458 (class 2606 OID 4303799)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 4303794)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4303774)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4303769)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2449 (class 2606 OID 4303749)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2490 (class 2606 OID 4303954)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2472 (class 2606 OID 4303864)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2446 (class 2606 OID 4303729)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2445 (class 2606 OID 4303734)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2491 (class 2606 OID 4303969)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2492 (class 2606 OID 4303964)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2493 (class 2606 OID 4303959)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2462 (class 2606 OID 4303804)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4303814)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2461 (class 2606 OID 4303809)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2476 (class 2606 OID 4303899)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2478 (class 2606 OID 4303889)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2479 (class 2606 OID 4303884)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2477 (class 2606 OID 4303894)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2444 (class 2606 OID 4303719)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 4303724)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2489 (class 2606 OID 4303949)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2485 (class 2606 OID 4303929)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2499 (class 2606 OID 4303994)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2498 (class 2606 OID 4303999)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 4303784)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 4303779)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 4303789)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2501 (class 2606 OID 4304004)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 4304009)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2513 (class 2606 OID 4304069)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4304064)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2511 (class 2606 OID 4304079)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 4304059)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2512 (class 2606 OID 4304074)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2497 (class 2606 OID 4303989)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 4303919)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2481 (class 2606 OID 4303914)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2483 (class 2606 OID 4303904)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2482 (class 2606 OID 4303909)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2509 (class 2606 OID 4304054)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 4304049)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2463 (class 2606 OID 4303819)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4304014)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2447 (class 2606 OID 4303744)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 4303739)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2451 (class 2606 OID 4303754)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2450 (class 2606 OID 4303759)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2473 (class 2606 OID 4303879)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2474 (class 2606 OID 4303874)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2475 (class 2606 OID 4303869)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-21 10:31:08 CEST

--
-- PostgreSQL database dump complete
--

