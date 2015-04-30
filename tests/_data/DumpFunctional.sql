--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-30 12:24:44 CEST

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
-- TOC entry 179 (class 1259 OID 1772438)
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
-- TOC entry 225 (class 1259 OID 1772920)
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
-- TOC entry 224 (class 1259 OID 1772903)
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
-- TOC entry 217 (class 1259 OID 1772819)
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
-- TOC entry 193 (class 1259 OID 1772603)
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
-- TOC entry 196 (class 1259 OID 1772644)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1772565)
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
-- TOC entry 212 (class 1259 OID 1772769)
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
-- TOC entry 191 (class 1259 OID 1772590)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1772638)
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
-- TOC entry 201 (class 1259 OID 1772687)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1772712)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1772539)
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
-- TOC entry 180 (class 1259 OID 1772447)
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
-- TOC entry 181 (class 1259 OID 1772458)
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
-- TOC entry 184 (class 1259 OID 1772509)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1772412)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1772431)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1772719)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1772749)
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
-- TOC entry 221 (class 1259 OID 1772861)
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
-- TOC entry 183 (class 1259 OID 1772489)
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
-- TOC entry 186 (class 1259 OID 1772531)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1772693)
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
-- TOC entry 185 (class 1259 OID 1772516)
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
-- TOC entry 190 (class 1259 OID 1772582)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1772705)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1772810)
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
-- TOC entry 220 (class 1259 OID 1772854)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1772734)
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
-- TOC entry 200 (class 1259 OID 1772678)
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
-- TOC entry 199 (class 1259 OID 1772668)
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
-- TOC entry 219 (class 1259 OID 1772844)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1772800)
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
-- TOC entry 173 (class 1259 OID 1772382)
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
-- TOC entry 172 (class 1259 OID 1772380)
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
-- TOC entry 209 (class 1259 OID 1772743)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1772422)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1772405)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1772757)
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
-- TOC entry 203 (class 1259 OID 1772699)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1772649)
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
-- TOC entry 182 (class 1259 OID 1772481)
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
-- TOC entry 198 (class 1259 OID 1772655)
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
-- TOC entry 218 (class 1259 OID 1772835)
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
-- TOC entry 188 (class 1259 OID 1772551)
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
-- TOC entry 174 (class 1259 OID 1772391)
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
-- TOC entry 223 (class 1259 OID 1772885)
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
-- TOC entry 192 (class 1259 OID 1772597)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1772726)
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
-- TOC entry 214 (class 1259 OID 1772792)
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
-- TOC entry 194 (class 1259 OID 1772625)
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
-- TOC entry 222 (class 1259 OID 1772875)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1772782)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1772385)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 1772438)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1772920)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 1772903)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1772819)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1772603)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1772644)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1772565)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5542-02eb-2a8d-2e6512619382	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5542-02eb-c9a1-21d46d04f7ff	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5542-02eb-9e34-6ce37d0c97c7	AL	ALB	008	Albania 	Albanija	\N
00040000-5542-02eb-c978-ffb2cbe047e2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5542-02eb-bcff-2084153b743c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5542-02eb-21f0-d98e6017ba9d	AD	AND	020	Andorra 	Andora	\N
00040000-5542-02eb-f952-c12af48af911	AO	AGO	024	Angola 	Angola	\N
00040000-5542-02eb-69b2-2f645187255c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5542-02eb-6def-0fd4074cd736	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5542-02eb-7120-85dd3c70ec53	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5542-02eb-99e0-07ed87909653	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5542-02eb-f9f3-86967a37ac88	AM	ARM	051	Armenia 	Armenija	\N
00040000-5542-02eb-9771-754b2f11f123	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5542-02eb-4178-8e2ae76ee380	AU	AUS	036	Australia 	Avstralija	\N
00040000-5542-02eb-dcb8-5a85909c5368	AT	AUT	040	Austria 	Avstrija	\N
00040000-5542-02eb-8493-995f076ac6fe	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5542-02eb-3ec0-0e4b4caf148d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5542-02eb-dd33-cfdff63cbabe	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5542-02eb-33be-019d7a57e3ec	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5542-02eb-6ee4-95d52acbc424	BB	BRB	052	Barbados 	Barbados	\N
00040000-5542-02eb-b464-2aae28a5d7f0	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5542-02eb-daf3-278360f5c116	BE	BEL	056	Belgium 	Belgija	\N
00040000-5542-02eb-fd7c-9fe02057e187	BZ	BLZ	084	Belize 	Belize	\N
00040000-5542-02eb-c828-6a48500f7672	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5542-02eb-294c-8ef29068a2f1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5542-02eb-da75-2900d1801bb9	BT	BTN	064	Bhutan 	Butan	\N
00040000-5542-02eb-2f12-c8663e250fab	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5542-02eb-931b-d232202b9d37	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5542-02eb-8076-16ad46c92f93	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5542-02eb-14dc-4c8376730148	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5542-02eb-dad0-9ef28b7e5032	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5542-02eb-6e57-be920db42938	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5542-02eb-be05-4d9606170644	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5542-02eb-e233-ca6a0190fce9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5542-02eb-5f10-6588fdb31a8e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5542-02eb-9d64-bce35472c58f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5542-02eb-c647-d5f6be863dfd	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5542-02eb-990c-aba3f2c59a04	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5542-02eb-0ac2-ec0498a3ec9b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5542-02eb-0b1a-b60e41f14e85	CA	CAN	124	Canada 	Kanada	\N
00040000-5542-02eb-e591-08e0b21fa440	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5542-02eb-a301-77e673eb23c2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5542-02eb-0702-8bf4c89b2d3e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5542-02eb-5a10-d0430ce84a94	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5542-02eb-0e64-a6ec64ea7f85	CL	CHL	152	Chile 	Čile	\N
00040000-5542-02eb-7694-4fe3b83d42fe	CN	CHN	156	China 	Kitajska	\N
00040000-5542-02eb-1121-287c957f5a41	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5542-02eb-ab4f-88ea02174b2e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5542-02eb-ce48-d6f7b903e0b5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5542-02eb-f096-5e2fde4263d3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5542-02eb-3dea-1af6fce2295c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5542-02eb-7376-f3f6e4b67d4b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5542-02eb-5253-4f0c9d6989c5	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5542-02eb-eaad-cbb9886a9d27	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5542-02eb-2553-0983cd531556	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5542-02eb-6c10-cb2853ea762e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5542-02eb-97ad-758a285f9def	CU	CUB	192	Cuba 	Kuba	\N
00040000-5542-02eb-8191-f7b06823b10e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5542-02eb-9ce3-67eb210bcfb1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5542-02eb-5655-95a66a90634b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5542-02eb-6298-2edaf98cd93a	DK	DNK	208	Denmark 	Danska	\N
00040000-5542-02eb-7f11-ac9a90dae85a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5542-02eb-74e9-af2bb5bd4a3b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5542-02eb-3298-d6b3d1086882	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5542-02eb-f93e-0de8f23b4694	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5542-02eb-5895-77bc1dda0ad1	EG	EGY	818	Egypt 	Egipt	\N
00040000-5542-02eb-0dde-5ec1942baac1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5542-02eb-34bc-5bc02b4670b4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5542-02eb-600d-8d8ff54d0735	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5542-02eb-2398-20bfe87f9512	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5542-02eb-d6f1-103955a5d684	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5542-02eb-c6dd-4a63cba7a594	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5542-02eb-7225-5c05e71b2f99	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5542-02eb-7bd3-42316343cba2	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5542-02eb-fd24-8a5d70197576	FI	FIN	246	Finland 	Finska	\N
00040000-5542-02eb-f374-76e48ade3b66	FR	FRA	250	France 	Francija	\N
00040000-5542-02eb-306a-4c728d2e1118	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5542-02eb-1bc1-b874fdc0a98b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5542-02eb-232b-ef92033aab14	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5542-02eb-3ace-75e12dbdc75a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5542-02eb-bc77-9f04b48a2edc	GA	GAB	266	Gabon 	Gabon	\N
00040000-5542-02eb-974d-32bbe44c8967	GM	GMB	270	Gambia 	Gambija	\N
00040000-5542-02eb-54b1-4f9870a197ac	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5542-02eb-45ce-1aa955246e31	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5542-02eb-d8c4-2da35030f281	GH	GHA	288	Ghana 	Gana	\N
00040000-5542-02eb-7b37-e410d3a2b6b3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5542-02eb-3b5e-75e8059be9bd	GR	GRC	300	Greece 	Grčija	\N
00040000-5542-02eb-a8c1-bb2b73447f7d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5542-02eb-735e-2f54c95098e5	GD	GRD	308	Grenada 	Grenada	\N
00040000-5542-02eb-a326-a8097704f793	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5542-02eb-2816-0419a62c79e3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5542-02eb-7c7f-73cc2e50ccf5	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5542-02eb-88a7-0fefeaa51b8d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5542-02eb-f9a1-28fab0a35a36	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5542-02eb-0f45-ed3b122fa3d9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5542-02eb-afa6-c185366637c5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5542-02eb-d944-4865187dbbb6	HT	HTI	332	Haiti 	Haiti	\N
00040000-5542-02eb-e109-8d0861f27820	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5542-02eb-d1c6-6b143c310037	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5542-02eb-38f3-2b50167dac38	HN	HND	340	Honduras 	Honduras	\N
00040000-5542-02eb-3e14-43670e008f95	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5542-02eb-b4c8-a89f706a52da	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5542-02eb-d7f8-ff4e69c28fc9	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5542-02eb-2110-b42eadc975ad	IN	IND	356	India 	Indija	\N
00040000-5542-02eb-40e8-4c674a0dd8bd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5542-02eb-7b78-ce0e544dba39	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5542-02eb-317e-3d0fc4f6d5ed	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5542-02eb-23d7-8e5bf3b6b57b	IE	IRL	372	Ireland 	Irska	\N
00040000-5542-02eb-04dd-86b078f66e3a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5542-02eb-cf72-9077f2b1aeaa	IL	ISR	376	Israel 	Izrael	\N
00040000-5542-02eb-4898-3dff01b77591	IT	ITA	380	Italy 	Italija	\N
00040000-5542-02eb-c1a7-32ba7c7071ad	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5542-02eb-55c2-7bc77806d4f4	JP	JPN	392	Japan 	Japonska	\N
00040000-5542-02eb-185d-298b00728c38	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5542-02eb-be65-dd19b8190117	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5542-02eb-9aba-16fe4a22c2af	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5542-02eb-7f53-898ff63d1c77	KE	KEN	404	Kenya 	Kenija	\N
00040000-5542-02eb-cf7f-ac749c863745	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5542-02eb-ef13-d0db7abcedf6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5542-02eb-ab7e-b0cb66937bb9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5542-02eb-e1ec-6ea023376bf1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5542-02eb-3878-a429062b4bfc	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5542-02eb-b4c9-c9c70cb89580	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5542-02eb-e73d-ce920e74673f	LV	LVA	428	Latvia 	Latvija	\N
00040000-5542-02eb-13c9-f15c0459faeb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5542-02eb-84c3-bbdc5f9eeade	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5542-02eb-70a0-ebefb7e95bd1	LR	LBR	430	Liberia 	Liberija	\N
00040000-5542-02eb-76dc-dcb8e1a88603	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5542-02eb-c416-75967587c368	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5542-02eb-3489-d2e971e7de68	LT	LTU	440	Lithuania 	Litva	\N
00040000-5542-02eb-399b-8eca6ae670c3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5542-02eb-64fc-1eed91a2d894	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5542-02eb-61d7-0db78e175f9a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5542-02eb-e6ec-eff02dd8c3c7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5542-02eb-20f8-6077672e2d73	MW	MWI	454	Malawi 	Malavi	\N
00040000-5542-02eb-7d61-f02c895bd1f1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5542-02eb-09e8-20d237d28ef0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5542-02eb-7195-a4a0bfaf685c	ML	MLI	466	Mali 	Mali	\N
00040000-5542-02eb-a4fc-34dc280f2b03	MT	MLT	470	Malta 	Malta	\N
00040000-5542-02eb-70a7-756dad485d92	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5542-02eb-ea82-9f9d6ab56606	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5542-02eb-1199-7707ca4c1aa0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5542-02eb-5fb0-967a8822a03c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5542-02eb-39ad-497fea8d4c7b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5542-02eb-386b-df6ec92677a2	MX	MEX	484	Mexico 	Mehika	\N
00040000-5542-02eb-bfcc-207d8ba84135	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5542-02eb-d699-b3923498766d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5542-02eb-26c5-1ea41753e101	MC	MCO	492	Monaco 	Monako	\N
00040000-5542-02eb-ea77-d37d64717e94	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5542-02eb-0986-d32c85413e8c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5542-02eb-100d-a9095163487b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5542-02eb-a29a-3f6dcde3694e	MA	MAR	504	Morocco 	Maroko	\N
00040000-5542-02eb-3ddf-fc51d4c52326	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5542-02eb-6d40-8f7a8580f79a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5542-02eb-1e80-93a3ca8473e5	NA	NAM	516	Namibia 	Namibija	\N
00040000-5542-02eb-47c6-e2a71c29221f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5542-02eb-203f-7ec40586f7e3	NP	NPL	524	Nepal 	Nepal	\N
00040000-5542-02eb-0e3b-06569dbae75d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5542-02eb-0399-3dac406929ae	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5542-02eb-c547-4935e7abb454	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5542-02eb-35de-edd0a63cf4d5	NE	NER	562	Niger 	Niger 	\N
00040000-5542-02eb-c81d-6dde4ca1bc55	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5542-02eb-6dcf-7d929dee1f79	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5542-02eb-c289-a5ae36cd337e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5542-02eb-ad47-c1b67393b60c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5542-02eb-6540-91c51c4d94e3	NO	NOR	578	Norway 	Norveška	\N
00040000-5542-02eb-ca0c-c054c72b4719	OM	OMN	512	Oman 	Oman	\N
00040000-5542-02eb-15ab-8316fd92e522	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5542-02eb-5730-36580b77b031	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5542-02eb-4f2a-c1865689fdac	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5542-02eb-834b-bb5fdd9192fb	PA	PAN	591	Panama 	Panama	\N
00040000-5542-02eb-a542-a77bca6b0ed6	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5542-02eb-f0b2-4419e8811c3f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5542-02eb-575c-50755cd6ab0a	PE	PER	604	Peru 	Peru	\N
00040000-5542-02eb-fe4a-d826edfe8823	PH	PHL	608	Philippines 	Filipini	\N
00040000-5542-02eb-d449-dd7210c0b91a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5542-02eb-bb5d-a2290aebe65d	PL	POL	616	Poland 	Poljska	\N
00040000-5542-02eb-5d91-269dbcb7fa2a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5542-02eb-c225-621c8f023a4a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5542-02eb-1755-36dc3287b06e	QA	QAT	634	Qatar 	Katar	\N
00040000-5542-02eb-81c4-5dbde16b8068	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5542-02eb-b26d-3438e4224c50	RO	ROU	642	Romania 	Romunija	\N
00040000-5542-02eb-92d7-f7040ea975cc	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5542-02eb-a49a-220c11a07b55	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5542-02eb-cbb6-ccefc59afd50	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5542-02eb-36a9-2d48667f0e89	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5542-02eb-e226-2bc1e818b529	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5542-02eb-1815-3aa8187f3799	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5542-02eb-1c82-f3f721729577	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5542-02eb-8d7b-76dd3f888541	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5542-02eb-491c-ed294dbb09dd	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5542-02eb-ccac-0afffcfd9ec2	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5542-02eb-8f14-93ae039c324d	SM	SMR	674	San Marino 	San Marino	\N
00040000-5542-02eb-3146-e4fb4535d735	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5542-02eb-c637-759fca74e58b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5542-02eb-eed5-2a3e73ed2cd1	SN	SEN	686	Senegal 	Senegal	\N
00040000-5542-02eb-6492-684e66a7330b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5542-02eb-ef86-7e45090101b9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5542-02eb-a591-8af8d98bd1e6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5542-02eb-ec6b-9a98cd06798d	SG	SGP	702	Singapore 	Singapur	\N
00040000-5542-02eb-0c14-52bdc0527942	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5542-02eb-8ecb-8a5c5361c0e1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5542-02eb-e46e-05bb9ab8f426	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5542-02eb-b1d5-f75a10b5a7b3	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5542-02eb-ddeb-8fd43514db2d	SO	SOM	706	Somalia 	Somalija	\N
00040000-5542-02eb-9599-30215b87b034	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5542-02eb-1c7b-cbac7aabba93	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5542-02eb-cc31-f29ad22d7186	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5542-02eb-2320-bb0c7ecfca28	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5542-02eb-5187-1d84999916b4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5542-02eb-0fa5-7f791bf00ecc	SD	SDN	729	Sudan 	Sudan	\N
00040000-5542-02eb-a439-48e7f0fe9ea3	SR	SUR	740	Suriname 	Surinam	\N
00040000-5542-02eb-9754-1a52f99f3d75	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5542-02eb-6a8d-07ea40262871	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5542-02eb-2caf-cb1e57438fea	SE	SWE	752	Sweden 	Švedska	\N
00040000-5542-02eb-c74b-0c7681d00db5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5542-02eb-defe-5b3b6fd8d1d4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5542-02eb-63d4-61fa361ec55f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5542-02eb-3bcb-ed5311b69619	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5542-02eb-560a-5d94e596548c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5542-02eb-2494-2d0cd46de382	TH	THA	764	Thailand 	Tajska	\N
00040000-5542-02eb-a7ee-75b1f482141d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5542-02eb-59ab-63213810f987	TG	TGO	768	Togo 	Togo	\N
00040000-5542-02eb-b120-33111b3eaa59	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5542-02eb-a381-6acaf66774be	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5542-02eb-060e-11650acc124b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5542-02eb-ffa9-39a828144b22	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5542-02eb-ba0a-7217ed85205e	TR	TUR	792	Turkey 	Turčija	\N
00040000-5542-02eb-0ba1-561a1d91f17e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5542-02eb-6655-01c8700e860a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5542-02eb-1f84-092dcffa2928	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5542-02eb-1c90-33cce5866473	UG	UGA	800	Uganda 	Uganda	\N
00040000-5542-02eb-0d06-6c19cab6328f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5542-02eb-38c7-2e16f16b3a27	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5542-02eb-c413-ee7d2532d6be	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5542-02eb-a757-207185043688	US	USA	840	United States 	Združene države Amerike	\N
00040000-5542-02eb-9003-8a55cfe98183	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5542-02eb-5e09-efc652512cf2	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5542-02eb-aa50-e754672e5dc7	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5542-02eb-3cf5-726896b3a4b1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5542-02eb-f3a3-b41133abb979	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5542-02eb-44de-e59b11469971	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5542-02eb-32f2-fbe57f175086	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5542-02eb-784e-8f76e01e38ae	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5542-02eb-2614-db74d4555f14	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5542-02eb-d815-dc482850a4d6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5542-02eb-a6f7-bb41c143e3d3	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5542-02eb-a1ef-a43abfb328b7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5542-02eb-ab23-28ffaa76293c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 1772769)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1772590)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1772638)
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
-- TOC entry 2658 (class 0 OID 1772687)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1772712)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1772539)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5542-02ec-592f-be3fe5f1e417	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5542-02ec-5e4e-2c901ea93f66	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5542-02ec-83a2-7c163029580f	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5542-02ec-608a-a6d08e8422b8	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5542-02ec-cc93-3e36727a5142	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5542-02ec-0cc1-18706faf439e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5542-02ec-26d1-f7e20f257777	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5542-02ec-9420-beaf4d3d34e6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5542-02ec-2ca6-72dd250e44b6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5542-02ec-f0fe-7d88a4a52bfb	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 1772447)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5542-02ec-d9c9-adc5104dc9b2	00000000-5542-02ec-cc93-3e36727a5142	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5542-02ec-562d-e6bcda632be2	00000000-5542-02ec-cc93-3e36727a5142	00010000-5542-02ec-64be-e8784ad59317	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5542-02ec-cc9b-8c800bcb6de4	00000000-5542-02ec-0cc1-18706faf439e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 1772458)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1772509)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 1772412)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5542-02eb-a9a0-0ddfc5859122	Ass-read	Aaa (User,Role,Permission) - branje	f
00030000-5542-02eb-8872-8d56839d8199	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5542-02eb-aa5e-4dbdc9f5a6c2	Abonma-read	Abonma - branje	f
00030000-5542-02eb-e564-d655acb2875b	Abonma-write	Abonma - spreminjanje	f
00030000-5542-02eb-4c5b-8c9de164f1ec	Alternacija-read	Alternacija - branje	f
00030000-5542-02eb-36fd-d72d029287eb	Alternacija-write	Alternacija - spreminjanje	f
00030000-5542-02eb-adf2-cd4a1bcad827	Arhivalija-read	Arhivalija - branje	f
00030000-5542-02eb-83af-3313fbbb16a8	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5542-02eb-5aa1-73c2d004cc6d	Besedilo-read	Besedilo - branje	f
00030000-5542-02eb-9357-a36f99b4e6a5	Besedilo-write	Besedilo - spreminjanje	f
00030000-5542-02eb-0b99-17c4a827789c	DogodekIzven-read	DogodekIzven - branje	f
00030000-5542-02eb-1ffb-5dcf25d1134a	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5542-02eb-7dc6-7ef978bcfbdc	Dogodek-read	Dogodek - branje	f
00030000-5542-02eb-be31-2a60ab4a9981	Dogodek-write	Dogodek - spreminjanje	f
00030000-5542-02eb-eddc-25ea087b63da	Drzava-read	Drzava - branje	f
00030000-5542-02eb-0d3b-4f91cb107de9	Drzava-write	Drzava - spreminjanje	f
00030000-5542-02eb-f4f6-950428886632	Funkcija-read	Funkcija - branje	f
00030000-5542-02eb-b9d4-f879fa173539	Funkcija-write	Funkcija - spreminjanje	f
00030000-5542-02eb-58fd-3b2c7b476a7e	Gostovanje-read	Gostovanje - branje	f
00030000-5542-02eb-e39a-1c1bc93ea58d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5542-02eb-4716-9b11fbf2ff9e	Gostujoca-read	Gostujoca - branje	f
00030000-5542-02eb-39e6-74e0d53f2c8a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5542-02eb-6ad0-91ac1635306f	Kupec-read	Kupec - branje	f
00030000-5542-02eb-ef83-68e625671aa6	Kupec-write	Kupec - spreminjanje	f
00030000-5542-02eb-bfc5-679e64744cf5	NacinPlacina-read	NacinPlacina - branje	f
00030000-5542-02eb-c158-92ed6c4d18c9	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5542-02eb-6ca2-e891a1ab29ef	Option-read	Option - branje	f
00030000-5542-02eb-155a-d41855a89e4b	Option-write	Option - spreminjanje	f
00030000-5542-02eb-2ae6-21120d4b4458	OptionValue-read	OptionValue - branje	f
00030000-5542-02eb-59ef-6e687108450f	OptionValue-write	OptionValue - spreminjanje	f
00030000-5542-02eb-7105-3a6a4216cff4	Oseba-read	Oseba - branje	f
00030000-5542-02eb-e586-26c01e06c106	Oseba-write	Oseba - spreminjanje	f
00030000-5542-02eb-901b-3b5ce62f06cf	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5542-02eb-5359-1d67f5fa7b44	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5542-02eb-cdb0-e5fd65232b75	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5542-02eb-821f-2949621be50f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5542-02eb-3a4c-3f5d389f40c7	Pogodba-read	Pogodba - branje	f
00030000-5542-02eb-1795-d58867040393	Pogodba-write	Pogodba - spreminjanje	f
00030000-5542-02eb-8fe4-e33f512e8bca	Popa-read	Popa - branje	f
00030000-5542-02eb-3dd6-e6e1cd32ea9a	Popa-write	Popa - spreminjanje	f
00030000-5542-02eb-b4e0-d3bf27c5c540	Posta-read	Posta - branje	f
00030000-5542-02eb-cf77-bbec4066a86d	Posta-write	Posta - spreminjanje	f
00030000-5542-02eb-5991-7210043b1fbb	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5542-02eb-d5c4-9ee9622dfe13	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5542-02eb-8bcc-daf7c3ba2f04	PostniNaslov-read	PostniNaslov - branje	f
00030000-5542-02eb-aa9f-ab34143962a0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5542-02eb-03af-f9368b668c87	Predstava-read	Predstava - branje	f
00030000-5542-02eb-27f3-ced0a8917b98	Predstava-write	Predstava - spreminjanje	f
00030000-5542-02eb-50a8-799de30783bc	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5542-02eb-f2cd-7afe5b456836	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5542-02eb-d5d5-3bc3fa86d6af	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5542-02eb-da91-9e94bc5e8809	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5542-02eb-9a38-c16b2aa0d589	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5542-02eb-233d-b5ee1c9b1164	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5542-02eb-42e2-57db37edc3eb	Prostor-read	Prostor - branje	f
00030000-5542-02eb-edf7-03067cc79ddc	Prostor-write	Prostor - spreminjanje	f
00030000-5542-02eb-8dc3-4d91d37fea4c	Racun-read	Racun - branje	f
00030000-5542-02eb-d302-c0923a2dc060	Racun-write	Racun - spreminjanje	f
00030000-5542-02eb-6692-8b4b59b49828	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5542-02eb-2280-2819f5e22189	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5542-02eb-c500-fecde5bb658a	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5542-02eb-5ff6-f2a107d9643f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5542-02eb-c242-43e8bbd8dc4a	Rekvizit-read	Rekvizit - branje	f
00030000-5542-02eb-188c-08f1ae4761d6	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5542-02eb-95c0-55ead87a9af8	Rezervacija-read	Rezervacija - branje	f
00030000-5542-02eb-3122-349f7e2fefe6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5542-02eb-7818-d0286150b7ec	SedezniRed-read	SedezniRed - branje	f
00030000-5542-02eb-67ab-9ce00666bccc	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5542-02eb-eed4-a685e5c6e42a	Sedez-read	Sedez - branje	f
00030000-5542-02eb-fcba-b9333eff0571	Sedez-write	Sedez - spreminjanje	f
00030000-5542-02eb-53f5-8f7530f0c7b4	Sezona-read	Sezona - branje	f
00030000-5542-02eb-bccb-dbb70d6571b0	Sezona-write	Sezona - spreminjanje	f
00030000-5542-02eb-e01f-7fe1f18955bb	Telefonska-read	Telefonska - branje	f
00030000-5542-02eb-a1fd-71b92eeff0da	Telefonska-write	Telefonska - spreminjanje	f
00030000-5542-02eb-3e2d-7fd9a8ea7849	TerminStoritve-read	TerminStoritve - branje	f
00030000-5542-02eb-819f-b6ceca68ea82	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5542-02eb-8382-b6ac739848f9	TipFunkcije-read	TipFunkcije - branje	f
00030000-5542-02eb-112f-db1b2dcacb30	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5542-02eb-1207-c1edce783a52	Trr-read	Trr - branje	f
00030000-5542-02eb-f2c1-0cc2a28ebcb6	Trr-write	Trr - spreminjanje	f
00030000-5542-02eb-cf3e-e67401d7bc1d	Uprizoritev-read	Uprizoritev - branje	f
00030000-5542-02eb-537b-9e1f0fb35e08	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5542-02eb-55e8-fa014dd7a130	Vaja-read	Vaja - branje	f
00030000-5542-02eb-2abb-dbe125ebd6fc	Vaja-write	Vaja - spreminjanje	f
00030000-5542-02eb-1207-840040283270	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5542-02eb-85fc-89e6ad9b6d53	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5542-02eb-6f39-17a3178820a9	Zaposlitev-read	Zaposlitev - branje	f
00030000-5542-02eb-848c-1300f767570f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5542-02eb-164d-9606fc64facd	Zasedenost-read	Zasedenost - branje	f
00030000-5542-02eb-5c05-74fb01e8fd7e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5542-02eb-6e7f-5763fdcb8f0a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5542-02eb-7e11-cef6fa63390c	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5542-02eb-7342-02784b8fbc82	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5542-02eb-4d99-e905128330f9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 1772431)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5542-02ec-fcb7-d3a5b21366bc	00030000-5542-02eb-eddc-25ea087b63da
00020000-5542-02ec-d72c-9368221f032c	00030000-5542-02eb-0d3b-4f91cb107de9
00020000-5542-02ec-d72c-9368221f032c	00030000-5542-02eb-eddc-25ea087b63da
\.


--
-- TOC entry 2663 (class 0 OID 1772719)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 1772749)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1772861)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1772489)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1772531)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5542-02eb-c310-39b41b3e572b	8341	Adlešiči
00050000-5542-02eb-bb99-e27ea1de2315	5270	Ajdovščina
00050000-5542-02eb-05de-4240e7a27e48	6280	Ankaran/Ancarano
00050000-5542-02eb-06b1-cea41167de93	9253	Apače
00050000-5542-02eb-024c-ac83b4086f51	8253	Artiče
00050000-5542-02eb-6058-f975e7a4adbf	4275	Begunje na Gorenjskem
00050000-5542-02eb-c10a-e33fc51c7552	1382	Begunje pri Cerknici
00050000-5542-02eb-8a82-7b227242d497	9231	Beltinci
00050000-5542-02eb-5654-8d93b70cb3f0	2234	Benedikt
00050000-5542-02eb-b63c-a3b65f7308d8	2345	Bistrica ob Dravi
00050000-5542-02eb-9d4c-58b64f608fac	3256	Bistrica ob Sotli
00050000-5542-02eb-f7ea-c47d32feb256	8259	Bizeljsko
00050000-5542-02eb-eb79-d1d60191c0fa	1223	Blagovica
00050000-5542-02eb-25be-c582cecd8e63	8283	Blanca
00050000-5542-02eb-5132-28d3dcecef5a	4260	Bled
00050000-5542-02eb-efb7-c14c1608dbd4	4273	Blejska Dobrava
00050000-5542-02eb-78a1-d020950a48c2	9265	Bodonci
00050000-5542-02eb-af62-01044ac0bd11	9222	Bogojina
00050000-5542-02eb-99e5-fc2a787dfa51	4263	Bohinjska Bela
00050000-5542-02eb-230f-f73e7d613845	4264	Bohinjska Bistrica
00050000-5542-02eb-751e-5ef5a6d551cf	4265	Bohinjsko jezero
00050000-5542-02eb-c98e-af02d9f69a55	1353	Borovnica
00050000-5542-02eb-4bc7-9b7255363a5f	8294	Boštanj
00050000-5542-02eb-ce4b-b3a57b82f3e5	5230	Bovec
00050000-5542-02eb-4e9a-b8d7accaf89e	5295	Branik
00050000-5542-02eb-81a3-432a08a1978f	3314	Braslovče
00050000-5542-02eb-4183-03f0cc9fc3d6	5223	Breginj
00050000-5542-02eb-f4eb-caeff6a65c8b	8280	Brestanica
00050000-5542-02eb-2664-cee12863f29e	2354	Bresternica
00050000-5542-02eb-f095-787dea75ff0f	4243	Brezje
00050000-5542-02eb-bd75-36d4560abacf	1351	Brezovica pri Ljubljani
00050000-5542-02eb-d4c7-f74f483d595f	8250	Brežice
00050000-5542-02eb-fc12-c1069f90e212	4210	Brnik - Aerodrom
00050000-5542-02eb-0c15-9ecbb984e3c0	8321	Brusnice
00050000-5542-02eb-ecb1-84a59e235ac6	3255	Buče
00050000-5542-02eb-ae3a-f6ce51037a18	8276	Bučka 
00050000-5542-02eb-6fe5-2365225b22f3	9261	Cankova
00050000-5542-02eb-28a3-f88d5fa11a0f	3000	Celje 
00050000-5542-02eb-1928-f64a6d269e03	3001	Celje - poštni predali
00050000-5542-02eb-67e7-c748b806bf0c	4207	Cerklje na Gorenjskem
00050000-5542-02eb-d7c7-89cbe30dc889	8263	Cerklje ob Krki
00050000-5542-02eb-bd16-943bef679645	1380	Cerknica
00050000-5542-02eb-0aa9-1de6e65265a8	5282	Cerkno
00050000-5542-02eb-d566-6b5279619c4a	2236	Cerkvenjak
00050000-5542-02eb-ae7e-9243a362fe91	2215	Ceršak
00050000-5542-02eb-dee7-eef6713b7d63	2326	Cirkovce
00050000-5542-02eb-3b20-8657941f248f	2282	Cirkulane
00050000-5542-02eb-fbfc-77640edaffb3	5273	Col
00050000-5542-02eb-6874-3fc9ffb81aec	8251	Čatež ob Savi
00050000-5542-02eb-1693-7c5c8808128d	1413	Čemšenik
00050000-5542-02eb-6156-3eb677f3aaaf	5253	Čepovan
00050000-5542-02eb-78e8-4bb46a4029f0	9232	Črenšovci
00050000-5542-02eb-dd5d-e6908b6fbdef	2393	Črna na Koroškem
00050000-5542-02eb-60d9-8d86742b2039	6275	Črni Kal
00050000-5542-02eb-4257-91ca0a72b207	5274	Črni Vrh nad Idrijo
00050000-5542-02eb-12c7-3f5527991cb1	5262	Črniče
00050000-5542-02eb-cc72-906856f26967	8340	Črnomelj
00050000-5542-02eb-edfb-afc89c46a5b6	6271	Dekani
00050000-5542-02eb-28c2-943e8819b906	5210	Deskle
00050000-5542-02eb-0014-9a766f91766c	2253	Destrnik
00050000-5542-02eb-1f72-f8769f6934be	6215	Divača
00050000-5542-02eb-837a-c501f93b58d6	1233	Dob
00050000-5542-02eb-b51a-777ba2b8d599	3224	Dobje pri Planini
00050000-5542-02eb-f1fc-c3790e6a9334	8257	Dobova
00050000-5542-02eb-cd3d-07d1dc14acc7	1423	Dobovec
00050000-5542-02eb-9b95-4fc5dd93aa8d	5263	Dobravlje
00050000-5542-02eb-04a0-e34371289912	3204	Dobrna
00050000-5542-02eb-2c11-a2afe11aff9f	8211	Dobrnič
00050000-5542-02eb-8ffd-caded79d1d93	1356	Dobrova
00050000-5542-02eb-40ec-16fc22ad5b3d	9223	Dobrovnik/Dobronak 
00050000-5542-02eb-4dab-0fc1e624390a	5212	Dobrovo v Brdih
00050000-5542-02eb-66ca-4ceb55f45d9b	1431	Dol pri Hrastniku
00050000-5542-02eb-080f-95428e701a9d	1262	Dol pri Ljubljani
00050000-5542-02eb-c7e2-0da095e18e65	1273	Dole pri Litiji
00050000-5542-02eb-2352-43ab426f834b	1331	Dolenja vas
00050000-5542-02eb-7905-ffd9e0074b72	8350	Dolenjske Toplice
00050000-5542-02eb-af63-f4dae988af58	1230	Domžale
00050000-5542-02eb-d5c8-0fb4bafa59cc	2252	Dornava
00050000-5542-02eb-702c-44164fa44679	5294	Dornberk
00050000-5542-02eb-e83b-a12a757e3d9a	1319	Draga
00050000-5542-02eb-983e-8212934bd586	8343	Dragatuš
00050000-5542-02eb-3f11-87be3640951f	3222	Dramlje
00050000-5542-02eb-a187-ef9b33b65b0a	2370	Dravograd
00050000-5542-02eb-346f-8dfa5716b549	4203	Duplje
00050000-5542-02eb-1262-2d06f4a36c41	6221	Dutovlje
00050000-5542-02eb-b06b-6031be8dd487	8361	Dvor
00050000-5542-02eb-4dac-f34610b65d4a	2343	Fala
00050000-5542-02eb-e44a-b7dc802d29c5	9208	Fokovci
00050000-5542-02eb-9917-0548d5718148	2313	Fram
00050000-5542-02eb-f55e-096d1f079218	3213	Frankolovo
00050000-5542-02eb-6281-597cbdb559bd	1274	Gabrovka
00050000-5542-02eb-a978-4a1a907ea6d3	8254	Globoko
00050000-5542-02eb-6907-67b55575268a	5275	Godovič
00050000-5542-02eb-eecf-1b2e13112e4b	4204	Golnik
00050000-5542-02eb-495e-9d29ce6695db	3303	Gomilsko
00050000-5542-02eb-331d-2c92e214f885	4224	Gorenja vas
00050000-5542-02eb-808f-ead5b5158617	3263	Gorica pri Slivnici
00050000-5542-02eb-ada1-5b000e1b9e99	2272	Gorišnica
00050000-5542-02eb-44d5-c7b41d68c8b1	9250	Gornja Radgona
00050000-5542-02eb-50e6-49e8acf61441	3342	Gornji Grad
00050000-5542-02eb-9aab-4aa3a66f1bae	4282	Gozd Martuljek
00050000-5542-02eb-b29a-bb63d8d14439	6272	Gračišče
00050000-5542-02eb-3353-3f5f6d104db2	9264	Grad
00050000-5542-02eb-d48e-53b8f0ff8064	8332	Gradac
00050000-5542-02eb-7abd-83bfdfabc65b	1384	Grahovo
00050000-5542-02eb-5eb1-0501bbfc810a	5242	Grahovo ob Bači
00050000-5542-02eb-e20d-cd9a313e31ff	5251	Grgar
00050000-5542-02eb-cf64-c8158ffe25a2	3302	Griže
00050000-5542-02eb-3e95-d7727d947506	3231	Grobelno
00050000-5542-02eb-0cf4-9e96d63fc6b5	1290	Grosuplje
00050000-5542-02eb-db9d-29448dfc2be4	2288	Hajdina
00050000-5542-02eb-0e1f-5ee5f2ddedde	8362	Hinje
00050000-5542-02eb-ad92-d6c5ce415973	2311	Hoče
00050000-5542-02eb-f9b1-5e50d9e4e5d7	9205	Hodoš/Hodos
00050000-5542-02eb-44b3-049d647d32a2	1354	Horjul
00050000-5542-02eb-dcb2-a452a684cd00	1372	Hotedršica
00050000-5542-02eb-c061-9cce95098c2e	1430	Hrastnik
00050000-5542-02eb-f0be-0f5c4c4ffafe	6225	Hruševje
00050000-5542-02eb-6451-7dd6f671c7e5	4276	Hrušica
00050000-5542-02eb-71f0-a76ec884490a	5280	Idrija
00050000-5542-02eb-7c7e-c6a857033753	1292	Ig
00050000-5542-02eb-0e7a-4a9474d44ec5	6250	Ilirska Bistrica
00050000-5542-02eb-7ab6-e8afff48cd91	6251	Ilirska Bistrica-Trnovo
00050000-5542-02eb-3e44-919d3a8a2fdf	1295	Ivančna Gorica
00050000-5542-02eb-9c52-18eb42d79c4b	2259	Ivanjkovci
00050000-5542-02eb-e908-2a8e9c04cdaa	1411	Izlake
00050000-5542-02eb-6388-dee3fc74f95c	6310	Izola/Isola
00050000-5542-02eb-fa51-f385a65eedcc	2222	Jakobski Dol
00050000-5542-02eb-8a61-74863f7f8ef9	2221	Jarenina
00050000-5542-02eb-e766-b40853f6f7c5	6254	Jelšane
00050000-5542-02eb-83e1-0a44c2f95a5c	4270	Jesenice
00050000-5542-02eb-bd6e-b5d90c6e27ef	8261	Jesenice na Dolenjskem
00050000-5542-02eb-f9b8-19b1b26f844a	3273	Jurklošter
00050000-5542-02eb-23a2-95f554c4e81c	2223	Jurovski Dol
00050000-5542-02eb-7f00-ed7fa077fb9d	2256	Juršinci
00050000-5542-02eb-20ac-d0b54cc1d5f5	5214	Kal nad Kanalom
00050000-5542-02eb-88b2-b400e39129da	3233	Kalobje
00050000-5542-02eb-4a61-daf3f445d25a	4246	Kamna Gorica
00050000-5542-02eb-40a0-7ff6e0c759d6	2351	Kamnica
00050000-5542-02eb-0cfb-d3b39d33ae22	1241	Kamnik
00050000-5542-02eb-b367-6697f0caabcc	5213	Kanal
00050000-5542-02eb-a550-d6f2d5b6ef80	8258	Kapele
00050000-5542-02eb-5bbc-ea967216c8f6	2362	Kapla
00050000-5542-02eb-794a-f1492c195019	2325	Kidričevo
00050000-5542-02eb-c85c-6f6ef870aa20	1412	Kisovec
00050000-5542-02eb-f5b0-436dc350bd88	6253	Knežak
00050000-5542-02eb-b045-46474191aaf7	5222	Kobarid
00050000-5542-02eb-ec5b-c5632861b26b	9227	Kobilje
00050000-5542-02eb-db61-55eb1dbd8693	1330	Kočevje
00050000-5542-02eb-c98e-786338c4c7d2	1338	Kočevska Reka
00050000-5542-02eb-8379-139df4ae677c	2276	Kog
00050000-5542-02eb-6e13-132489b663d6	5211	Kojsko
00050000-5542-02eb-8eef-17ec72ad238e	6223	Komen
00050000-5542-02eb-0d28-f3819d7be9a3	1218	Komenda
00050000-5542-02eb-7956-fe3335ac8152	6000	Koper/Capodistria 
00050000-5542-02eb-930d-b830c9880abd	6001	Koper/Capodistria - poštni predali
00050000-5542-02eb-47d5-6f25637aa9c7	8282	Koprivnica
00050000-5542-02eb-335f-308d71856ba1	5296	Kostanjevica na Krasu
00050000-5542-02eb-df61-9e5e6e0fb093	8311	Kostanjevica na Krki
00050000-5542-02eb-a334-ef60cf818196	1336	Kostel
00050000-5542-02eb-b909-109b17dad2a1	6256	Košana
00050000-5542-02eb-489b-96dd947a5e88	2394	Kotlje
00050000-5542-02eb-c44d-a2fa4461f014	6240	Kozina
00050000-5542-02eb-895c-d4a4e4e25d5e	3260	Kozje
00050000-5542-02eb-7655-da4965b6ecad	4000	Kranj 
00050000-5542-02eb-4497-91c2a103c7b4	4001	Kranj - poštni predali
00050000-5542-02eb-0533-fafa02c00d13	4280	Kranjska Gora
00050000-5542-02eb-cfbe-484e87cfa17a	1281	Kresnice
00050000-5542-02eb-6e55-fb6ab2caddfe	4294	Križe
00050000-5542-02eb-7be0-69d3b9b4404d	9206	Križevci
00050000-5542-02eb-bf1c-081ca591a6b7	9242	Križevci pri Ljutomeru
00050000-5542-02eb-3cf3-9c400d534156	1301	Krka
00050000-5542-02eb-7e35-5a0128f70ece	8296	Krmelj
00050000-5542-02eb-3b2b-014409c77845	4245	Kropa
00050000-5542-02eb-e5e9-9fd2e1c76d03	8262	Krška vas
00050000-5542-02eb-c69e-5ee2099a1544	8270	Krško
00050000-5542-02eb-caad-557e45344a05	9263	Kuzma
00050000-5542-02eb-09c2-3588ea7de942	2318	Laporje
00050000-5542-02eb-da4b-56842b238744	3270	Laško
00050000-5542-02eb-a045-3b9a829429cb	1219	Laze v Tuhinju
00050000-5542-02eb-2888-510cd1222a4f	2230	Lenart v Slovenskih goricah
00050000-5542-02eb-2b15-d865feeb2f59	9220	Lendava/Lendva
00050000-5542-02eb-95b8-8af43b3dd14d	4248	Lesce
00050000-5542-02eb-23f4-0a5e64930f54	3261	Lesično
00050000-5542-02eb-be72-b09d0fad4062	8273	Leskovec pri Krškem
00050000-5542-02eb-0f07-d00b2f7fd852	2372	Libeliče
00050000-5542-02eb-65bd-302bff69612b	2341	Limbuš
00050000-5542-02eb-a658-97f4d0c298b5	1270	Litija
00050000-5542-02eb-6eab-15169e8f78fb	3202	Ljubečna
00050000-5542-02eb-c194-aaa3c3c23d89	1000	Ljubljana 
00050000-5542-02eb-a75a-8158909065d3	1001	Ljubljana - poštni predali
00050000-5542-02eb-db36-da14a10ec46d	1231	Ljubljana - Črnuče
00050000-5542-02eb-1289-dee3f847bb74	1261	Ljubljana - Dobrunje
00050000-5542-02eb-7321-e1039db36abd	1260	Ljubljana - Polje
00050000-5542-02eb-f581-62516bf9f421	1210	Ljubljana - Šentvid
00050000-5542-02eb-a223-ee33b24e7937	1211	Ljubljana - Šmartno
00050000-5542-02eb-5d00-1d8cfec51565	3333	Ljubno ob Savinji
00050000-5542-02eb-b2bb-3403e72222cc	9240	Ljutomer
00050000-5542-02eb-b3dd-022d9ef38673	3215	Loče
00050000-5542-02eb-13ca-2476bb169b84	5231	Log pod Mangartom
00050000-5542-02eb-e2fc-ce8f4062476a	1358	Log pri Brezovici
00050000-5542-02eb-55af-5cddea32a845	1370	Logatec
00050000-5542-02eb-b7da-07650285f59c	1371	Logatec
00050000-5542-02eb-a2f2-ab552a683342	1434	Loka pri Zidanem Mostu
00050000-5542-02eb-a70b-d0791c9e588e	3223	Loka pri Žusmu
00050000-5542-02eb-ca71-02fc1c40dcde	6219	Lokev
00050000-5542-02eb-12df-f18539a24500	1318	Loški Potok
00050000-5542-02eb-2672-1f4ca212fa6e	2324	Lovrenc na Dravskem polju
00050000-5542-02eb-d879-f608d0a7733d	2344	Lovrenc na Pohorju
00050000-5542-02eb-4c97-f3cb734108c6	3334	Luče
00050000-5542-02eb-33ae-f548a7ea39ef	1225	Lukovica
00050000-5542-02eb-6a31-ba1f0f61ad3a	9202	Mačkovci
00050000-5542-02eb-5242-e63ca8b74cd9	2322	Majšperk
00050000-5542-02eb-1b58-95b47347feba	2321	Makole
00050000-5542-02eb-481f-82829f699484	9243	Mala Nedelja
00050000-5542-02eb-a8d3-239832b01e88	2229	Malečnik
00050000-5542-02eb-f3eb-06fcc1d2716c	6273	Marezige
00050000-5542-02eb-36b0-16c0bc17cd0e	2000	Maribor 
00050000-5542-02eb-2532-50db0e374611	2001	Maribor - poštni predali
00050000-5542-02eb-8f10-9022fc7324fa	2206	Marjeta na Dravskem polju
00050000-5542-02eb-6e80-b31cf06cef8d	2281	Markovci
00050000-5542-02eb-8016-47090ff2e129	9221	Martjanci
00050000-5542-02eb-ac59-e5085fa76d70	6242	Materija
00050000-5542-02eb-cc42-2facf020a2f1	4211	Mavčiče
00050000-5542-02eb-a844-fabc476057a2	1215	Medvode
00050000-5542-02eb-62fb-d2888333f5f8	1234	Mengeš
00050000-5542-02eb-6285-a09861ceb633	8330	Metlika
00050000-5542-02eb-d9be-8b4f8a90baaf	2392	Mežica
00050000-5542-02eb-6bc8-2427261f1bc9	2204	Miklavž na Dravskem polju
00050000-5542-02eb-326c-3bb40d59593f	2275	Miklavž pri Ormožu
00050000-5542-02eb-5cbd-7e22a982cf4a	5291	Miren
00050000-5542-02eb-1188-216e09edccf2	8233	Mirna
00050000-5542-02eb-a1bc-6230744c3779	8216	Mirna Peč
00050000-5542-02eb-9183-767bc6527829	2382	Mislinja
00050000-5542-02eb-a92d-0cbc50beecc8	4281	Mojstrana
00050000-5542-02eb-1d31-eaa19a68b091	8230	Mokronog
00050000-5542-02eb-662a-beb6f953d740	1251	Moravče
00050000-5542-02eb-ada0-ecb32d3bc01e	9226	Moravske Toplice
00050000-5542-02eb-d127-f18490108cd3	5216	Most na Soči
00050000-5542-02eb-9430-4bbeb1478641	1221	Motnik
00050000-5542-02eb-dfef-16c26ee8a87d	3330	Mozirje
00050000-5542-02eb-03b0-549ce577c1c7	9000	Murska Sobota 
00050000-5542-02eb-d11c-1d0fef936111	9001	Murska Sobota - poštni predali
00050000-5542-02eb-0b34-d643223f45a7	2366	Muta
00050000-5542-02eb-848b-e0c6fbc424db	4202	Naklo
00050000-5542-02eb-52bc-0d2874f0c721	3331	Nazarje
00050000-5542-02eb-a00f-b8a380c4fb77	1357	Notranje Gorice
00050000-5542-02eb-4610-a384e212c9b9	3203	Nova Cerkev
00050000-5542-02eb-af7f-9a7d756d5971	5000	Nova Gorica 
00050000-5542-02eb-7192-2fed7fdbc579	5001	Nova Gorica - poštni predali
00050000-5542-02eb-bf49-c249fca38595	1385	Nova vas
00050000-5542-02eb-a64d-531fddec4055	8000	Novo mesto
00050000-5542-02eb-bf6b-7423ed1909c2	8001	Novo mesto - poštni predali
00050000-5542-02eb-71b2-e9fc5e08357c	6243	Obrov
00050000-5542-02eb-e808-1d773eb94cc1	9233	Odranci
00050000-5542-02eb-a979-206d79959831	2317	Oplotnica
00050000-5542-02eb-4c5e-af2f0b99fd6f	2312	Orehova vas
00050000-5542-02eb-3277-74448fb99c60	2270	Ormož
00050000-5542-02eb-9bf9-2a615f2311c5	1316	Ortnek
00050000-5542-02eb-6c10-82daede58ec4	1337	Osilnica
00050000-5542-02eb-1414-550ac0117d7d	8222	Otočec
00050000-5542-02eb-e049-493268a4c1ae	2361	Ožbalt
00050000-5542-02eb-2659-1601ea1a04eb	2231	Pernica
00050000-5542-02eb-c6a4-00cdc233991f	2211	Pesnica pri Mariboru
00050000-5542-02eb-dd69-8dc18fda27c0	9203	Petrovci
00050000-5542-02eb-2b65-5aa774f11844	3301	Petrovče
00050000-5542-02eb-524d-a712beb86dc0	6330	Piran/Pirano
00050000-5542-02eb-ca3f-5b019c255cfc	8255	Pišece
00050000-5542-02eb-001f-a5624a0cb1a9	6257	Pivka
00050000-5542-02eb-cfb8-d0398d33f660	6232	Planina
00050000-5542-02eb-bc7e-f01de34307d4	3225	Planina pri Sevnici
00050000-5542-02eb-b8c8-5b70974da639	6276	Pobegi
00050000-5542-02eb-051b-156e5dfbdf06	8312	Podbočje
00050000-5542-02eb-071a-e808bbfd3c2b	5243	Podbrdo
00050000-5542-02eb-94e8-9dada958d282	3254	Podčetrtek
00050000-5542-02eb-9822-bec5a7b5245e	2273	Podgorci
00050000-5542-02eb-03a6-29a1642ee99d	6216	Podgorje
00050000-5542-02eb-5645-ee4d5a4f5392	2381	Podgorje pri Slovenj Gradcu
00050000-5542-02eb-58c8-3e71f19665b8	6244	Podgrad
00050000-5542-02eb-7f04-e41c08bfa595	1414	Podkum
00050000-5542-02eb-afa5-47de1ed13767	2286	Podlehnik
00050000-5542-02eb-d916-ac58bf01857a	5272	Podnanos
00050000-5542-02eb-60be-2bdba1e41455	4244	Podnart
00050000-5542-02eb-add4-d31e3d533e66	3241	Podplat
00050000-5542-02eb-0f1a-17693520f7dc	3257	Podsreda
00050000-5542-02eb-5883-afe5f2047ed9	2363	Podvelka
00050000-5542-02eb-2b5d-0a7d1bfa5814	2208	Pohorje
00050000-5542-02eb-82dc-fc17c9160190	2257	Polenšak
00050000-5542-02eb-7514-48523f3b390e	1355	Polhov Gradec
00050000-5542-02eb-1f1d-9a4107dea37a	4223	Poljane nad Škofjo Loko
00050000-5542-02eb-94d1-a3357eeef45b	2319	Poljčane
00050000-5542-02eb-4884-68869309df6e	1272	Polšnik
00050000-5542-02eb-abed-4b87f2ac0093	3313	Polzela
00050000-5542-02eb-7b22-2b95a49f69df	3232	Ponikva
00050000-5542-02eb-8840-2714b4b21ee6	6320	Portorož/Portorose
00050000-5542-02eb-3391-fb0509064429	6230	Postojna
00050000-5542-02eb-5695-7f95ccf732c8	2331	Pragersko
00050000-5542-02eb-5696-8b925c76403b	3312	Prebold
00050000-5542-02eb-fdd7-3b35d6e91134	4205	Preddvor
00050000-5542-02eb-e1c2-fbb754a9bd52	6255	Prem
00050000-5542-02eb-9865-bb5b094ee493	1352	Preserje
00050000-5542-02eb-44d1-a0d11dca5209	6258	Prestranek
00050000-5542-02eb-2a89-6f04497fdf60	2391	Prevalje
00050000-5542-02eb-5fc1-f33e2e9346d7	3262	Prevorje
00050000-5542-02eb-49e7-a1f890d871b4	1276	Primskovo 
00050000-5542-02eb-efd4-b02138775c57	3253	Pristava pri Mestinju
00050000-5542-02eb-9e07-b9f8008d6a18	9207	Prosenjakovci/Partosfalva
00050000-5542-02eb-5cd2-8be7826e3029	5297	Prvačina
00050000-5542-02eb-c6a5-38826ab407a6	2250	Ptuj
00050000-5542-02eb-de8a-ab721c366512	2323	Ptujska Gora
00050000-5542-02eb-644a-5d866fc25849	9201	Puconci
00050000-5542-02eb-ae43-f0f9e7f4619d	2327	Rače
00050000-5542-02eb-93e0-1a43a339f2e2	1433	Radeče
00050000-5542-02eb-9ce5-a50efcc31c89	9252	Radenci
00050000-5542-02eb-2cee-94f72cb52589	2360	Radlje ob Dravi
00050000-5542-02eb-3cdb-45b12cc1f805	1235	Radomlje
00050000-5542-02eb-c920-71cc9cf2780c	4240	Radovljica
00050000-5542-02eb-08b8-9b464a3fa026	8274	Raka
00050000-5542-02eb-756f-bd325684038b	1381	Rakek
00050000-5542-02eb-06cf-3e3c83f1b262	4283	Rateče - Planica
00050000-5542-02eb-40a0-7278a2e0dcf7	2390	Ravne na Koroškem
00050000-5542-02eb-ac62-6c8d283e3548	9246	Razkrižje
00050000-5542-02eb-442b-c69463d0856e	3332	Rečica ob Savinji
00050000-5542-02eb-7ae2-f226698af5a2	5292	Renče
00050000-5542-02eb-38f7-fde66fe4d2a8	1310	Ribnica
00050000-5542-02eb-2574-1ff95d9abf94	2364	Ribnica na Pohorju
00050000-5542-02eb-84a2-e7b5131167f2	3272	Rimske Toplice
00050000-5542-02eb-d22c-489f73b7e9f3	1314	Rob
00050000-5542-02eb-de4e-f97ede4be0b0	5215	Ročinj
00050000-5542-02eb-41f1-25a8a9733727	3250	Rogaška Slatina
00050000-5542-02eb-fb9b-37319bd4729f	9262	Rogašovci
00050000-5542-02eb-813a-687f7cf26198	3252	Rogatec
00050000-5542-02eb-4d2c-26fddcb29372	1373	Rovte
00050000-5542-02eb-ee5b-2b41a2d59c03	2342	Ruše
00050000-5542-02eb-bf3c-391a7ca3d7d4	1282	Sava
00050000-5542-02eb-c3b5-549e7f9218ec	6333	Sečovlje/Sicciole
00050000-5542-02eb-88ba-311657ffe174	4227	Selca
00050000-5542-02eb-7c30-180ee6f9a360	2352	Selnica ob Dravi
00050000-5542-02eb-5ddb-8404f3aba4c1	8333	Semič
00050000-5542-02eb-1404-c2973a6b3470	8281	Senovo
00050000-5542-02eb-6b28-e5454350e6a1	6224	Senožeče
00050000-5542-02eb-9da5-734b370c1ecc	8290	Sevnica
00050000-5542-02eb-8bc3-2ddc716bd844	6210	Sežana
00050000-5542-02eb-4d94-d5e887715651	2214	Sladki Vrh
00050000-5542-02eb-42f2-8dd77660ca38	5283	Slap ob Idrijci
00050000-5542-02eb-6a91-5030f444e05e	2380	Slovenj Gradec
00050000-5542-02eb-8efe-a84c07ddec9c	2310	Slovenska Bistrica
00050000-5542-02eb-207f-39dbba3a1dc2	3210	Slovenske Konjice
00050000-5542-02eb-0704-f06bec8da146	1216	Smlednik
00050000-5542-02eb-0981-a5562c5ee034	5232	Soča
00050000-5542-02eb-f5b0-2c12d0ae2b9e	1317	Sodražica
00050000-5542-02eb-8e2d-a46923639c98	3335	Solčava
00050000-5542-02eb-ee1a-4226b34bb206	5250	Solkan
00050000-5542-02eb-8a45-206cdfef00c5	4229	Sorica
00050000-5542-02eb-ff1b-a6d413929144	4225	Sovodenj
00050000-5542-02eb-5328-fdfdd0a5927e	5281	Spodnja Idrija
00050000-5542-02eb-e279-8a79e38e5f26	2241	Spodnji Duplek
00050000-5542-02eb-9a95-4ce25f078205	9245	Spodnji Ivanjci
00050000-5542-02eb-e234-b9335328f937	2277	Središče ob Dravi
00050000-5542-02eb-75f1-e90cca6f36c3	4267	Srednja vas v Bohinju
00050000-5542-02eb-fca6-9fb6e45c03b0	8256	Sromlje 
00050000-5542-02eb-bb4e-146fd9868270	5224	Srpenica
00050000-5542-02eb-0ac3-acc8a4473846	1242	Stahovica
00050000-5542-02eb-7dc8-38190256e495	1332	Stara Cerkev
00050000-5542-02eb-ac6f-59b7394db2b5	8342	Stari trg ob Kolpi
00050000-5542-02eb-3261-c6a450735604	1386	Stari trg pri Ložu
00050000-5542-02eb-4362-572f55ff741e	2205	Starše
00050000-5542-02eb-1283-74b43cc52646	2289	Stoperce
00050000-5542-02eb-ce96-34ac4a03d37b	8322	Stopiče
00050000-5542-02eb-132d-75df63b70191	3206	Stranice
00050000-5542-02eb-e7ce-b18931b99bb4	8351	Straža
00050000-5542-02eb-151c-9a1acd91e006	1313	Struge
00050000-5542-02eb-de0f-24711c92f37b	8293	Studenec
00050000-5542-02eb-04a4-59e1cb92563b	8331	Suhor
00050000-5542-02eb-e361-dad710952a56	2233	Sv. Ana v Slovenskih goricah
00050000-5542-02eb-40f9-c62ec33eb065	2235	Sv. Trojica v Slovenskih goricah
00050000-5542-02eb-0a32-1156166c24ea	2353	Sveti Duh na Ostrem Vrhu
00050000-5542-02eb-8439-f1f66573c36b	9244	Sveti Jurij ob Ščavnici
00050000-5542-02eb-b27f-65cbd2a7850f	3264	Sveti Štefan
00050000-5542-02eb-c620-c442d9f5ceaa	2258	Sveti Tomaž
00050000-5542-02eb-04a7-1038f4c479e2	9204	Šalovci
00050000-5542-02eb-2f13-84e72a67f9b4	5261	Šempas
00050000-5542-02eb-0ebe-801eac60c889	5290	Šempeter pri Gorici
00050000-5542-02eb-97cf-03e68a5d7376	3311	Šempeter v Savinjski dolini
00050000-5542-02eb-e562-c232faa01ff0	4208	Šenčur
00050000-5542-02eb-1649-4acb20e71a50	2212	Šentilj v Slovenskih goricah
00050000-5542-02eb-4509-d1b489b0026f	8297	Šentjanž
00050000-5542-02eb-3ba1-77704a8d268d	2373	Šentjanž pri Dravogradu
00050000-5542-02eb-ce27-98e641dda07d	8310	Šentjernej
00050000-5542-02eb-1d7d-22d7e071c15c	3230	Šentjur
00050000-5542-02eb-4584-38b50d246044	3271	Šentrupert
00050000-5542-02eb-0429-9a7dfcc028f5	8232	Šentrupert
00050000-5542-02eb-7057-3a6c9ed8fb46	1296	Šentvid pri Stični
00050000-5542-02eb-e7d3-767cff965fbc	8275	Škocjan
00050000-5542-02eb-af6c-9a7695787129	6281	Škofije
00050000-5542-02eb-049b-1322c15a4459	4220	Škofja Loka
00050000-5542-02eb-c636-8c78953760ed	3211	Škofja vas
00050000-5542-02eb-cb87-d6b0dd5ede4d	1291	Škofljica
00050000-5542-02eb-172f-b7d3c32a9663	6274	Šmarje
00050000-5542-02eb-9301-ab8c82438f71	1293	Šmarje - Sap
00050000-5542-02eb-c58d-f1aea6275368	3240	Šmarje pri Jelšah
00050000-5542-02eb-71a0-5cceb466e2a3	8220	Šmarješke Toplice
00050000-5542-02eb-2c00-119e131c3579	2315	Šmartno na Pohorju
00050000-5542-02eb-3fef-fa3511c54eb1	3341	Šmartno ob Dreti
00050000-5542-02eb-6dce-ca57822cb73c	3327	Šmartno ob Paki
00050000-5542-02eb-5bfc-460e06bfd96e	1275	Šmartno pri Litiji
00050000-5542-02eb-df1f-2f438bf5e3ba	2383	Šmartno pri Slovenj Gradcu
00050000-5542-02eb-fb17-f21768ebffb8	3201	Šmartno v Rožni dolini
00050000-5542-02eb-5e93-5848f44348c5	3325	Šoštanj
00050000-5542-02eb-cb68-fdf188e50684	6222	Štanjel
00050000-5542-02eb-53c2-493ba5bbd974	3220	Štore
00050000-5542-02eb-ca61-543b8402a12d	3304	Tabor
00050000-5542-02eb-469f-f982f827bf68	3221	Teharje
00050000-5542-02eb-2121-0d1a59dfe6b3	9251	Tišina
00050000-5542-02eb-2e7e-4a65a920f8e1	5220	Tolmin
00050000-5542-02eb-f1ac-20ce54874a29	3326	Topolšica
00050000-5542-02eb-25a4-db86fde300fa	2371	Trbonje
00050000-5542-02eb-da63-85b46f37bcc3	1420	Trbovlje
00050000-5542-02eb-1fda-57cba9b034ce	8231	Trebelno 
00050000-5542-02eb-affa-b17e5af39142	8210	Trebnje
00050000-5542-02eb-71bc-084dc102659b	5252	Trnovo pri Gorici
00050000-5542-02eb-2afd-300b2d9b1bf7	2254	Trnovska vas
00050000-5542-02eb-8a1f-f474bb22a122	1222	Trojane
00050000-5542-02eb-6be2-e7ef40535a08	1236	Trzin
00050000-5542-02eb-b823-5922564c707a	4290	Tržič
00050000-5542-02eb-2014-2468aef58eea	8295	Tržišče
00050000-5542-02eb-b7af-be0eaf2fb6bf	1311	Turjak
00050000-5542-02eb-f9bc-bdaf086154bc	9224	Turnišče
00050000-5542-02eb-7f77-0146403c4ce3	8323	Uršna sela
00050000-5542-02eb-e475-854e8af1c613	1252	Vače
00050000-5542-02eb-e15a-d259acccb5cf	3320	Velenje 
00050000-5542-02eb-0892-ac7dfaec58b7	3322	Velenje - poštni predali
00050000-5542-02eb-9fdf-bb624d996043	8212	Velika Loka
00050000-5542-02eb-2e32-63e6bd26f300	2274	Velika Nedelja
00050000-5542-02eb-2675-46c6852636d6	9225	Velika Polana
00050000-5542-02eb-ab60-747bf44019cd	1315	Velike Lašče
00050000-5542-02eb-30de-c9fa51c8b538	8213	Veliki Gaber
00050000-5542-02eb-f63f-558acfca39ed	9241	Veržej
00050000-5542-02eb-4c70-36d56d5e4a04	1312	Videm - Dobrepolje
00050000-5542-02eb-dd20-bd447e310d7d	2284	Videm pri Ptuju
00050000-5542-02eb-1bb2-42b3d8ccaf2f	8344	Vinica
00050000-5542-02eb-fb65-fd6d45d041ad	5271	Vipava
00050000-5542-02eb-fe6e-ea4153e63cc1	4212	Visoko
00050000-5542-02eb-d2a8-aa6e76d60573	1294	Višnja Gora
00050000-5542-02eb-5d23-40fd81c6f2c9	3205	Vitanje
00050000-5542-02eb-1e1d-dfdab8b6f897	2255	Vitomarci
00050000-5542-02eb-c7f2-695e4272b17d	1217	Vodice
00050000-5542-02eb-7754-b909a4409716	3212	Vojnik\t
00050000-5542-02eb-f504-e161b1db5bad	5293	Volčja Draga
00050000-5542-02eb-4317-f43517e1062f	2232	Voličina
00050000-5542-02eb-4e14-5e8a326615b2	3305	Vransko
00050000-5542-02eb-e8e3-71bad371c377	6217	Vremski Britof
00050000-5542-02eb-2a25-74b5d2365e02	1360	Vrhnika
00050000-5542-02eb-f51c-4fd6a4bd8134	2365	Vuhred
00050000-5542-02eb-e769-cd34985ee9e8	2367	Vuzenica
00050000-5542-02eb-163a-11784f4df4b6	8292	Zabukovje 
00050000-5542-02eb-50d6-c89bf07097cf	1410	Zagorje ob Savi
00050000-5542-02eb-565d-8e58578b56ac	1303	Zagradec
00050000-5542-02eb-ed97-67b6357a9151	2283	Zavrč
00050000-5542-02eb-a8c9-626975679a43	8272	Zdole 
00050000-5542-02eb-7907-79d803f44dad	4201	Zgornja Besnica
00050000-5542-02eb-398f-3ba051889d9c	2242	Zgornja Korena
00050000-5542-02eb-8c50-a43750424356	2201	Zgornja Kungota
00050000-5542-02eb-f702-0627c433c870	2316	Zgornja Ložnica
00050000-5542-02eb-0a25-5e8c679cc07a	2314	Zgornja Polskava
00050000-5542-02eb-2958-7de7c4f0c4b7	2213	Zgornja Velka
00050000-5542-02eb-6ca1-ef521359d5db	4247	Zgornje Gorje
00050000-5542-02eb-1e2b-d2a083eb6468	4206	Zgornje Jezersko
00050000-5542-02eb-c74e-b92cd57ee254	2285	Zgornji Leskovec
00050000-5542-02eb-07bc-3d96e094a2ee	1432	Zidani Most
00050000-5542-02eb-9e08-2ed9de6c4d94	3214	Zreče
00050000-5542-02eb-0e61-c347bc1124ab	4209	Žabnica
00050000-5542-02eb-310f-3a1b22772313	3310	Žalec
00050000-5542-02eb-a3bc-f4eb53f35dea	4228	Železniki
00050000-5542-02eb-eacd-870c923b90e0	2287	Žetale
00050000-5542-02eb-8505-809edaf2fc06	4226	Žiri
00050000-5542-02eb-117e-6b1e0be79e9e	4274	Žirovnica
00050000-5542-02eb-d9da-c2d924d4bb2f	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 1772693)
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
-- TOC entry 2642 (class 0 OID 1772516)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1772582)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1772705)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1772810)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1772854)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1772734)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1772678)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1772668)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1772844)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1772800)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 1772382)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5542-02ec-64be-e8784ad59317	00010000-5542-02ec-c7fb-e8c5ec4291c5	2015-04-30 12:24:44	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROdcvOy1mmRVAfVBGoPdmpKqT4O5pDDyW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 1772743)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1772422)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5542-02ec-bfd5-79094bb6d5ba	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5542-02ec-8efb-429b3ee2be94	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5542-02ec-fcb7-d3a5b21366bc	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5542-02ec-6e02-899e22b9fbaf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5542-02ec-67c6-3be06512e68a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5542-02ec-d72c-9368221f032c	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 1772405)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5542-02ec-64be-e8784ad59317	00020000-5542-02ec-6e02-899e22b9fbaf
00010000-5542-02ec-c7fb-e8c5ec4291c5	00020000-5542-02ec-6e02-899e22b9fbaf
\.


--
-- TOC entry 2668 (class 0 OID 1772757)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 1772699)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1772649)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 1772481)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1772655)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1772835)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1772551)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1772391)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5542-02ec-c7fb-e8c5ec4291c5	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO0KHyoAjf1k858qUoDSpHEK.Dv46Wp3a	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5542-02ec-64be-e8784ad59317	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 1772885)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1772597)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 1772726)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1772792)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1772625)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1772875)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 1772782)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 1772446)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 1772924)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 1772917)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 1772834)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 1772615)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 1772648)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 1772577)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 1772778)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 1772595)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 1772642)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 1772691)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 1772718)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 1772549)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 1772455)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 1772513)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 1772479)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 1772435)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 1772420)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 1772724)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 1772756)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 1772871)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 1772506)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 1772537)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 1772697)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2254 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 1772527)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 1772586)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 1772709)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 1772816)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 1772859)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 1772741)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 1772682)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 1772673)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 1772853)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 1772807)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 1772390)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 1772747)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 1772409)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 1772429)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 1772765)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 1772704)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 1772654)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 1772486)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 1772664)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 1772843)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 1772562)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 1772403)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 1772899)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 1772601)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 1772732)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 1772798)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 1772637)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 1772884)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 1772791)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 1772622)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 1772508)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2250 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2251 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2252 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2378 (class 1259 OID 1772725)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 1772711)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 1772710)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 1772602)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 1772781)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 1772779)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 1772780)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 1772872)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 1772873)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 1772874)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 1772902)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 1772901)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 1772900)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 1772564)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 1772563)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 1772515)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 1772514)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 1772748)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 1772643)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 1772436)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 1772437)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 1772768)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 1772767)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 1772766)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 1772587)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 1772589)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 1772588)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 1772677)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 1772675)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 1772674)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 1772676)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 1772410)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 1772411)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 1772733)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 1772698)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 1772808)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 1772809)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 1772529)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 1772528)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 1772530)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 1772817)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 1772818)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 1772927)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 1772926)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 1772929)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 1772925)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 1772928)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 1772799)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 1772686)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 1772685)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 1772683)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 1772684)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2246 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 1772919)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 1772918)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 1772596)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 1772457)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 1772456)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 1772487)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 1772488)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 1772667)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 1772666)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 1772665)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 1772624)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 1772620)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 1772617)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 1772618)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 1772616)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 1772621)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 1772619)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 1772507)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 1772578)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1772580)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 1772579)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 1772581)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 1772692)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 1772480)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 1772550)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2257 (class 1259 OID 1772404)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2386 (class 1259 OID 1772742)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2266 (class 1259 OID 1772421)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2249 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 1772538)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 1772860)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 1772430)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 1772623)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 1773060)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 1773045)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 1773050)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 1773070)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 1773040)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 1773065)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 1773055)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 1772975)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 1773155)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 1773150)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 1773145)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 1773035)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 1773195)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 1773185)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1773190)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 1773135)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 1773230)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 1773235)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 1773240)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 1773255)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 1773250)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 1773245)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 1773010)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 1773005)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 1772985)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 1772980)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 1772960)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 1773165)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 1773075)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 1772940)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 1772945)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 1773180)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 1773175)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 1773170)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 1773015)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 1773025)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 1773020)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 1773110)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 1773100)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 1773095)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 1773105)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 1772930)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 1772935)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 1773160)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 1773140)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 1773205)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 1773210)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 1772995)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 1772990)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 1773000)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 1773215)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 1773220)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 1773280)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 1773275)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 1773290)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 1773270)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 1773285)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 1773200)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 1773130)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 1773125)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 1773115)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 1773120)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 1773265)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 1773260)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 1773030)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1773225)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 1772955)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 1772950)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 1772965)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 1772970)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 1773090)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 1773085)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 1773080)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-30 12:24:44 CEST

--
-- PostgreSQL database dump complete
--

