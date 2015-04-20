--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-20 16:01:21 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 224 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2648 (class 0 OID 0)
-- Dependencies: 224
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 525587)
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
-- TOC entry 223 (class 1259 OID 526069)
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
-- TOC entry 222 (class 1259 OID 526052)
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
-- TOC entry 215 (class 1259 OID 525968)
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
-- TOC entry 191 (class 1259 OID 525752)
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
-- TOC entry 194 (class 1259 OID 525793)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 525714)
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
-- TOC entry 210 (class 1259 OID 525918)
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
-- TOC entry 189 (class 1259 OID 525739)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 525787)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 179 (class 1259 OID 525607)
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
-- TOC entry 199 (class 1259 OID 525836)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 203 (class 1259 OID 525861)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 525688)
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
-- TOC entry 178 (class 1259 OID 525596)
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
-- TOC entry 182 (class 1259 OID 525658)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 525561)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 525580)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 525868)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 525898)
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
-- TOC entry 219 (class 1259 OID 526010)
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
-- TOC entry 181 (class 1259 OID 525637)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid,
    sifra character varying(4) NOT NULL,
    tipkli character varying(1) DEFAULT NULL::character varying,
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
    zamejstvo character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 525680)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 525842)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 525665)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    klient_id uuid,
    drzava_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    nazivdva character varying(50) DEFAULT NULL::character varying,
    ulica character varying(50) DEFAULT NULL::character varying,
    ulicadva character varying(50) DEFAULT NULL::character varying,
    posta character varying(50) DEFAULT NULL::character varying,
    postanaziv character varying(50) DEFAULT NULL::character varying,
    pokrajina character varying(50) DEFAULT NULL::character varying,
    jeeu character varying(1) DEFAULT NULL::character varying,
    privzeti boolean
);


--
-- TOC entry 188 (class 1259 OID 525731)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 525854)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 525959)
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
-- TOC entry 218 (class 1259 OID 526003)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 525883)
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
-- TOC entry 198 (class 1259 OID 525827)
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
-- TOC entry 197 (class 1259 OID 525817)
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
-- TOC entry 217 (class 1259 OID 525993)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 525949)
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
-- TOC entry 171 (class 1259 OID 525533)
-- Name: revizije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE revizije (
    id integer NOT NULL,
    razred character varying(100) NOT NULL,
    objectid uuid NOT NULL,
    upor uuid,
    datum timestamp(0) without time zone NOT NULL,
    tip character varying(3) NOT NULL,
    data text NOT NULL
);


--
-- TOC entry 170 (class 1259 OID 525531)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2649 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 525892)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 525570)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 525554)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 525906)
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
-- TOC entry 201 (class 1259 OID 525848)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 525798)
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
-- TOC entry 180 (class 1259 OID 525630)
-- Name: telefonska; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE telefonska (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    vrsta character varying(20) NOT NULL,
    stevilka character varying(30) NOT NULL,
    privzeta character varying(255) NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 525804)
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
-- TOC entry 216 (class 1259 OID 525984)
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
-- TOC entry 186 (class 1259 OID 525700)
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
-- TOC entry 172 (class 1259 OID 525542)
-- Name: uporabniki; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uporabniki (
    id uuid NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    username character varying(10) NOT NULL,
    password character varying(90) DEFAULT NULL::character varying,
    enabled boolean,
    expires date,
    defaultroute text,
    defaultrouteparams text,
    email character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 526034)
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
-- TOC entry 190 (class 1259 OID 525746)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 205 (class 1259 OID 525875)
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
-- TOC entry 212 (class 1259 OID 525941)
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
-- TOC entry 192 (class 1259 OID 525774)
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
-- TOC entry 220 (class 1259 OID 526024)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 525931)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2093 (class 2604 OID 525536)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2595 (class 0 OID 525587)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 526069)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 526052)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 525968)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2609 (class 0 OID 525752)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2612 (class 0 OID 525793)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2605 (class 0 OID 525714)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5535-06a7-06b0-ebb6b1cf7d25	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5535-06a7-8e88-a0159aa53469	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5535-06a7-ce74-b6bb3454c79d	AL	ALB	008	Albania 	Albanija	\N
00040000-5535-06a7-a616-a72d3a1f7e6f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5535-06a7-f389-cdd99dcb9387	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5535-06a7-31f8-4132a1a54b9a	AD	AND	020	Andorra 	Andora	\N
00040000-5535-06a7-af0f-62d0e37f923f	AO	AGO	024	Angola 	Angola	\N
00040000-5535-06a7-4182-226b2c4bc673	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5535-06a7-2ebe-5298ceb7efb9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5535-06a7-15de-f8f7a74a453a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5535-06a7-607c-9dd5e9e3e2a2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5535-06a7-a753-605276dfb259	AM	ARM	051	Armenia 	Armenija	\N
00040000-5535-06a7-170a-0c2b69b029b8	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5535-06a7-5692-6ee45061fbf3	AU	AUS	036	Australia 	Avstralija	\N
00040000-5535-06a7-a9c3-91178adc3816	AT	AUT	040	Austria 	Avstrija	\N
00040000-5535-06a7-980d-77e22a02ffbf	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5535-06a7-63d4-ce4aa6514c98	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5535-06a7-620d-589ce858dd28	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5535-06a7-f067-6a24b7a76d07	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5535-06a7-d5f0-f17f8c4c4180	BB	BRB	052	Barbados 	Barbados	\N
00040000-5535-06a7-5c1c-ed4146224fb0	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5535-06a7-ebe9-c9b3c3768a89	BE	BEL	056	Belgium 	Belgija	\N
00040000-5535-06a7-c215-1e289fa37395	BZ	BLZ	084	Belize 	Belize	\N
00040000-5535-06a7-c131-ce67c076a394	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5535-06a7-425f-256d49e49ff1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5535-06a7-38e4-631ca8662d8c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5535-06a7-ee1c-eea1c59c22f0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5535-06a7-25dd-74d7eec05f7a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5535-06a7-94e9-79c65abacd67	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5535-06a7-4d01-98d730809e1d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5535-06a7-3827-1f5a3d9db6f8	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5535-06a7-e799-52237d2219fe	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5535-06a7-b1b8-a52e85003be7	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5535-06a7-fb73-c52159bb6d5d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5535-06a7-3df0-6f94a27b2737	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5535-06a7-eb0b-65d9f900728d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5535-06a7-618d-e3dcef7cffd3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5535-06a7-9da1-294d3a78af70	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5535-06a7-e55b-3daaecba0fc8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5535-06a7-8e0b-d3ee302562a5	CA	CAN	124	Canada 	Kanada	\N
00040000-5535-06a7-694d-20a6d944d36e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5535-06a7-0989-61cc654ee458	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5535-06a7-29a9-7bfdfb4d3498	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5535-06a7-f5ac-d42956735c01	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5535-06a7-11f2-80caf128393d	CL	CHL	152	Chile 	Čile	\N
00040000-5535-06a7-111f-03c376911b13	CN	CHN	156	China 	Kitajska	\N
00040000-5535-06a7-4888-407c554db4e8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5535-06a7-104c-0a1492626e53	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5535-06a7-83f4-4eca26fa3e9f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5535-06a7-d3f4-0974baaa45fa	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5535-06a7-fd23-1e0a5b714faa	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5535-06a7-d664-9bfa6715fd05	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5535-06a7-d942-87b4ec17b87b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5535-06a7-449a-fb9614f5bee1	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5535-06a7-432a-213a123c246e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5535-06a7-e627-d2c2f740a1c1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5535-06a7-b433-6a1a2df589bd	CU	CUB	192	Cuba 	Kuba	\N
00040000-5535-06a7-3e7b-e2743bf21925	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5535-06a7-4683-80adb2db1f79	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5535-06a7-a8fc-452d6a33d435	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5535-06a7-24f7-adf8afb45a1d	DK	DNK	208	Denmark 	Danska	\N
00040000-5535-06a7-110e-38f5aea74130	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5535-06a7-d150-5740b31e5727	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5535-06a7-11f3-1942a0fb4f83	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5535-06a7-1b39-ec7833a8b797	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5535-06a7-b7bf-47dec514365e	EG	EGY	818	Egypt 	Egipt	\N
00040000-5535-06a7-72f9-806d4e2e4764	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5535-06a7-df21-1893187af643	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5535-06a7-97ed-f12097587ca0	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5535-06a7-411b-913a9a766058	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5535-06a7-17b5-fe548af91096	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5535-06a7-37d6-880eaa3f53ae	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5535-06a7-e652-15daf4a246db	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5535-06a7-0206-e427b9117f57	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5535-06a7-b71d-bedf0112c633	FI	FIN	246	Finland 	Finska	\N
00040000-5535-06a7-12dc-e4065055d42b	FR	FRA	250	France 	Francija	\N
00040000-5535-06a7-0f78-4965784caee8	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5535-06a7-51cd-6f0ecbcb340c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5535-06a7-f8bc-26df4eb3613c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5535-06a7-5855-39c3f5f81be5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5535-06a7-e3ae-c4f067089847	GA	GAB	266	Gabon 	Gabon	\N
00040000-5535-06a7-609a-b434d7f906ca	GM	GMB	270	Gambia 	Gambija	\N
00040000-5535-06a7-d3c8-63481d6660a1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5535-06a7-a4fe-80db77d0cbaa	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5535-06a7-34b6-49acfd427207	GH	GHA	288	Ghana 	Gana	\N
00040000-5535-06a7-0f49-886788daae7c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5535-06a7-53b8-b2844be1b4b6	GR	GRC	300	Greece 	Grčija	\N
00040000-5535-06a7-5b09-3c2512fa7fd4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5535-06a7-26d4-51262662ef5d	GD	GRD	308	Grenada 	Grenada	\N
00040000-5535-06a7-494d-daa69f6633e2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5535-06a7-f69d-360fb6ca0c5c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5535-06a7-a654-9a12a36d97ce	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5535-06a7-7a6a-96d8eeacbb11	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5535-06a7-1f17-0b7c3a228d43	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5535-06a7-7973-1d31a970f2d7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5535-06a7-47d3-382cdfaec295	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5535-06a7-4bf0-b179dd4125cc	HT	HTI	332	Haiti 	Haiti	\N
00040000-5535-06a7-a886-cceb20aa5746	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5535-06a7-0a0a-e34472de5cf5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5535-06a7-f607-13310a9937d5	HN	HND	340	Honduras 	Honduras	\N
00040000-5535-06a7-ba5b-4ad7fb03f264	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5535-06a7-aa58-529d48f6affc	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5535-06a7-8137-955d5c2e46e3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5535-06a7-aa55-1dfeee1e01b1	IN	IND	356	India 	Indija	\N
00040000-5535-06a7-609e-2ce20a465a5c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5535-06a7-3476-2fd1b299b8c3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5535-06a7-6d60-d36dd2ee72b9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5535-06a7-423a-aec0d350c2b8	IE	IRL	372	Ireland 	Irska	\N
00040000-5535-06a7-101b-d27c77b8f3df	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5535-06a7-d884-24612caf8564	IL	ISR	376	Israel 	Izrael	\N
00040000-5535-06a7-0cab-7d807bcdc910	IT	ITA	380	Italy 	Italija	\N
00040000-5535-06a7-887f-89c638bf6d38	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5535-06a7-1a42-6309f6947032	JP	JPN	392	Japan 	Japonska	\N
00040000-5535-06a7-fb74-0d00b01179e9	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5535-06a7-19bd-7b9f5889f675	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5535-06a7-ceab-42f2ea2a9401	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5535-06a7-3315-647ec11f1e81	KE	KEN	404	Kenya 	Kenija	\N
00040000-5535-06a7-adef-cfc02660a950	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5535-06a7-e58a-fd27d4d256c9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5535-06a7-42d5-3f111c92907a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5535-06a7-619b-4b10ddb96b36	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5535-06a7-fa0b-84e96d762022	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5535-06a7-726e-e3dabef440c9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5535-06a7-e11e-fbc93a09f13c	LV	LVA	428	Latvia 	Latvija	\N
00040000-5535-06a7-71a1-69c187145313	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5535-06a7-1b8f-9e076b945317	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5535-06a7-8077-b2f7cda4f55b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5535-06a7-91e6-120055c477de	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5535-06a7-3788-2025fea6a50c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5535-06a7-72c2-1dcff3075aa7	LT	LTU	440	Lithuania 	Litva	\N
00040000-5535-06a7-2314-8fb360589298	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5535-06a7-bad8-718cd645c020	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5535-06a7-a3a2-1df6358bc1f5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5535-06a7-9917-141bcdd47420	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5535-06a7-454e-6720e8b89124	MW	MWI	454	Malawi 	Malavi	\N
00040000-5535-06a7-a480-82b54e9da234	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5535-06a7-9f0b-4acd3b482448	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5535-06a7-2257-b750ee90afc9	ML	MLI	466	Mali 	Mali	\N
00040000-5535-06a7-1238-2797da5d5bde	MT	MLT	470	Malta 	Malta	\N
00040000-5535-06a7-6e1c-b2857111712b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5535-06a7-e3b0-c0b15b56719f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5535-06a7-4684-b746d6b38c9d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5535-06a7-f472-43cd436113df	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5535-06a7-e2be-eac0042fa07a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5535-06a7-3dd0-23f4b52f6a12	MX	MEX	484	Mexico 	Mehika	\N
00040000-5535-06a7-4a54-3994b311d0da	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5535-06a7-1553-16733d77cd58	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5535-06a7-4bc0-2db060a282a3	MC	MCO	492	Monaco 	Monako	\N
00040000-5535-06a7-af67-8bd435c9feae	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5535-06a7-dcf0-29ddac0c411b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5535-06a7-49dd-9f744a9f1597	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5535-06a7-09a2-efd4ea7c14fd	MA	MAR	504	Morocco 	Maroko	\N
00040000-5535-06a7-0a0e-835f01f5ba1c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5535-06a7-801d-2af1cc31b153	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5535-06a7-1161-f0593d01bf74	NA	NAM	516	Namibia 	Namibija	\N
00040000-5535-06a7-c705-c75da90148f8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5535-06a7-e227-577f3e2a2844	NP	NPL	524	Nepal 	Nepal	\N
00040000-5535-06a7-ffce-441250c475a2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5535-06a7-2997-54958a4f09f9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5535-06a7-90be-469047a45387	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5535-06a7-075e-c7a134ce37dd	NE	NER	562	Niger 	Niger 	\N
00040000-5535-06a7-b243-d487e06029c6	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5535-06a7-f4cc-2d420dc247be	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5535-06a7-539a-233352c0c471	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5535-06a7-c57b-dfe2f0296a1a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5535-06a7-1359-db461c862bf2	NO	NOR	578	Norway 	Norveška	\N
00040000-5535-06a7-0571-e2125e9367e6	OM	OMN	512	Oman 	Oman	\N
00040000-5535-06a7-26f2-ea8e027c584e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5535-06a7-f965-208b47933360	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5535-06a7-b646-296194bdef33	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5535-06a7-2384-d7731c27ff0c	PA	PAN	591	Panama 	Panama	\N
00040000-5535-06a7-e69b-0c1ac3fa9bd9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5535-06a7-c5da-b70d8c339f65	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5535-06a7-022e-f17ad9e81b17	PE	PER	604	Peru 	Peru	\N
00040000-5535-06a7-6e74-14407502f6c4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5535-06a7-04c5-14822eec3614	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5535-06a7-b5ea-903644d12daf	PL	POL	616	Poland 	Poljska	\N
00040000-5535-06a7-23c3-daa24a9442c3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5535-06a7-1a33-069d53d2d696	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5535-06a7-fbb0-e8e82c84f06e	QA	QAT	634	Qatar 	Katar	\N
00040000-5535-06a7-af91-eae9a2df21da	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5535-06a7-ba27-65b13c184ae1	RO	ROU	642	Romania 	Romunija	\N
00040000-5535-06a7-cfb1-d5791f59fbbd	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5535-06a7-aac4-bf600efce3fb	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5535-06a7-bacb-a83b05876ed9	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5535-06a7-329d-3fee3e150143	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5535-06a7-3563-d098abe5f243	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5535-06a7-c6f9-2d0740d981e7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5535-06a7-e68d-1b214e827b3d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5535-06a7-8978-853e83c38a44	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5535-06a7-ab29-46f33d3efbad	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5535-06a7-36b1-bcadda1162a6	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5535-06a7-941e-847b508945be	SM	SMR	674	San Marino 	San Marino	\N
00040000-5535-06a7-0def-dd79901bbc1a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5535-06a7-7d56-6a76dcb57ea5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5535-06a7-eb99-a063d3304e18	SN	SEN	686	Senegal 	Senegal	\N
00040000-5535-06a7-0711-d4903d051fc2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5535-06a7-2886-434d1031ae64	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5535-06a7-b147-a9ff2b9211f8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5535-06a7-393e-a8e20baca672	SG	SGP	702	Singapore 	Singapur	\N
00040000-5535-06a7-13c2-25da3eb75080	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5535-06a7-82f4-f93b04bdbfe7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5535-06a7-a08d-df1cbe61db58	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5535-06a7-cbda-9f8dc49e443c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5535-06a7-7dcc-3949e69390dd	SO	SOM	706	Somalia 	Somalija	\N
00040000-5535-06a7-4b31-138797001f9f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5535-06a7-b8d6-12b474a6910f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5535-06a7-6d33-fe4162791f1e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5535-06a7-512e-bdbb6c2bddbc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5535-06a7-4bc0-75432a08e2a7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5535-06a7-687f-709ce65ca31b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5535-06a7-ed25-f0fb45d04732	SR	SUR	740	Suriname 	Surinam	\N
00040000-5535-06a7-8531-9dc1b31e0c75	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5535-06a7-af90-bfb5cae50755	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5535-06a7-6515-8383cdf660a2	SE	SWE	752	Sweden 	Švedska	\N
00040000-5535-06a7-afc6-50b27c177170	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5535-06a7-084f-664cbcbb7dc1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5535-06a7-9492-fae4ca02a561	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5535-06a7-8b58-63e47d0fb265	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5535-06a7-8fff-d309fe8780a0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5535-06a7-f313-e5ea30ff6b90	TH	THA	764	Thailand 	Tajska	\N
00040000-5535-06a7-d53f-c23f1fe9d524	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5535-06a7-a6ec-4a59ab4c7172	TG	TGO	768	Togo 	Togo	\N
00040000-5535-06a7-d372-775c5b91d4ae	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5535-06a7-687e-8fb98b0a09e8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5535-06a7-b445-9d3c2868438c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5535-06a7-e1e0-6f267735f7cf	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5535-06a7-1fd3-4092fcff3b29	TR	TUR	792	Turkey 	Turčija	\N
00040000-5535-06a7-a574-0573273ec10a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5535-06a7-b081-8e433130948d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5535-06a7-4e65-296f2eec93a2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5535-06a7-5b7e-90c743af6b23	UG	UGA	800	Uganda 	Uganda	\N
00040000-5535-06a7-9500-277b69017459	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5535-06a7-1a0f-2e23d4eb6da0	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5535-06a7-f9d2-8bbd5f74c0aa	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5535-06a7-c717-2f0ce7a0d6e1	US	USA	840	United States 	Združene države Amerike	\N
00040000-5535-06a7-ce27-5e243a2bfae8	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5535-06a7-2d50-8207358b8395	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5535-06a7-41f5-4934d3f62c40	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5535-06a7-236b-078eee787c6f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5535-06a7-ad42-f96ff60ca02d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5535-06a7-307f-2cc87ac1246e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5535-06a7-c2f4-301e5b90477a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5535-06a7-9f79-3753f7200f22	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5535-06a7-a8aa-1175dffc37e9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5535-06a7-7028-c6fd859051eb	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5535-06a7-7a0e-cd5a9225cfde	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5535-06a7-2bde-ca65526f9641	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5535-06a7-bc0c-acbdeaf462e1	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2628 (class 0 OID 525918)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2607 (class 0 OID 525739)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2611 (class 0 OID 525787)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2597 (class 0 OID 525607)
-- Dependencies: 179
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2617 (class 0 OID 525836)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2621 (class 0 OID 525861)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2603 (class 0 OID 525688)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5535-06a9-4b44-52e0a72da150	privzetInspicient	entity	N;	f	t	f	\N	Privzeti inspicient
00000000-5535-06a9-9088-be4c11c35ba2	dogodek-status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5535-06a9-3f77-fb60f1be5fc4	popa.Maxkli	array	a:3:{i:0;a:2:{s:3:"key";i:1;s:5:"value";s:5:"odprt";}i:1;a:2:{s:3:"key";i:2;s:5:"value";s:5:"zaprt";}i:2;a:2:{s:3:"key";i:3;s:5:"value";s:6:"blabla";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5535-06a9-a68f-6de68ccafdf5	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5535-06a9-3fb7-3c59f42bd91c	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"moški";}i:1;a:2:{s:3:"key";s:2:"Ž";s:5:"value";s:7:"ženska";}}	f	t	f	\N	spol osebe
00000000-5535-06a9-85bd-5a95e0843347	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
\.


--
-- TOC entry 2596 (class 0 OID 525596)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5535-06a9-c599-93d7cf1a3c6c	00000000-5535-06a9-85bd-5a95e0843347	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5535-06a9-4458-4bba02846238	00000000-5535-06a9-85bd-5a95e0843347	00010000-5535-06a9-60c3-192aba517e71	a:1:{i:0;a:2:{s:3:"key";s:1:"z";s:5:"value";s:6:"zelena";}}	f
00000000-5535-06a9-16ba-e9aa835b1e7a	00000000-5535-06a9-85bd-5a95e0843347	00010000-5535-06a9-84c6-ddb7594ea055	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
\.


--
-- TOC entry 2600 (class 0 OID 525658)
-- Dependencies: 182
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2592 (class 0 OID 525561)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5535-06a8-4100-48bbd3789505	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-de85-b3c9b6513c28	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-c1a3-c3251c483211	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-c9c6-27dcea8052c9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-91db-693a2b975b19	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-fb2a-016224c3d40c	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-e580-c5ec34c3dc1c	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-5704-87613b27de0f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-5de6-556922b75cc5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-73e1-3178ac55b97b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-99e6-848f565e9142	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-13ac-c32f34446637	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-1b55-45e7e4af83ab	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-916e-c61e08885aa6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-53a2-ff676a9d3ec1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-0be2-65fc01fcc699	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-8610-17e0f855e44f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-5b7f-6b6b57bced58	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-878d-601e8f4b16e6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-a2f7-369c91f2b9b9	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-c8b9-5add81e4730d	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-ffd9-c618e419e435	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-e3a2-9c16ae0190a3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-589c-8402e75fc4da	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-968f-65a9f7050c4d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-e5c9-ee8ad20d9c2d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-73a2-a92d84105d73	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-079a-7fcb6dc32ba4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-c74b-e65edefb5142	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-17d4-2c2aff11281e	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-4d55-ae789d279fa9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-3795-f846aa01c366	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-1c95-f1f78ed8ba4c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-2e53-b25a392b75f4	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-c807-53b4d0d0bd5e	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-012b-e3eb46507ec4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-a6c2-dd1fec25bb5b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-9f8b-6125b835cada	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-2742-53148317cc6d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-8fbb-915ac4940ef1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-b0ba-d1ca354bacc3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-f721-406611007364	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-828e-1ba43229fd3b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-30b9-94cd27749bb9	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-0828-7717794cffa1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-6943-e50275f65446	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-1d8e-727fa74c4f93	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-713f-49d6d32a5e4d	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-2565-b34324e61484	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-7a69-7e6855bba581	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-f508-5609c244da95	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-28a7-15872a517d6f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-a950-0a5e11461883	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-5c31-62cd47c7ed0b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-c94d-5fc622f91732	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-fbb6-08d948673dcf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-ea8e-78c615bd14a8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-69ca-c99f1bfcfcc3	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-22e7-87e1b115219a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-10d9-4a4702c331aa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-4222-08592cf33379	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-847a-3b441fb36b7e	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-3873-cf98e3aacb26	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-d392-b9502e1b6ab3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-a4b0-6af32d1ff769	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-abe7-f16ceed7c5d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-fc34-7cbf99026c52	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-37f0-7121dce97772	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-5ffa-0f2774a5b3a2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-7ef3-9b8af06e7a82	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-8dcf-260a3ae31cea	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-27ab-c07b387136c3	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-9857-f97ca86a748d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-6580-0379b855684e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-3060-c6ba552e2926	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-4bdf-e40fcf23644c	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-f55d-d2ee06c67dee	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-a639-e0dee34f2296	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-d4c7-036092689815	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-5677-36a098fb4239	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-f7bf-cf2e2fb29036	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-d3f6-b46e5922f285	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-4a8b-fa10de38141c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-c3f6-b8da211185c1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-bfcb-bc99baecb18e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-455f-5f20bfc847f2	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-f31c-a153c4a80ca7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-c27a-ed882028c81c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-f0d2-f7b609c6e1bb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-9a8f-9f73cee4cf22	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-40cb-dd595fbd74e1	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-6376-6ef74adf14bc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-2211-8d24b2a3c11b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-7744-58436a26dfac	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-0cf2-3f3736e5a54e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-1718-063b1112134e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-d0c9-c30ac6ff0a71	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-5ad3-6919fc99f7e7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-0ea0-936e47d0b2bd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-e5fe-59a0eca6d99e	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-78cc-551244c72c19	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-c85b-ae46c1acf048	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-8da6-29dd0897dd8f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-aa02-21b887a04655	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-9d89-0b50191210ac	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-0a68-f77b1107d1d8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-8a21-f8dd14923610	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-43b0-59d5578d392a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-8612-1c003299c7f2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-15c2-75bb87aebe46	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-8e6c-3f20f41dc1e5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-e802-4c0f9cde1313	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-bd25-78dd6d532e99	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-68ff-12c05ffd3e9a	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-9bf1-a9ea86f39a72	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-a069-d648fb7c2391	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-8f63-8bda371e1b9b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-daca-78c83ffa3500	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-d2fd-394aedf8275f	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-3de6-55421d263cc7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-c902-5895f040999f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-5564-f9ce75036fd6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-5d77-56ffdf4554c0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-2d8f-5b5a4155525b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-af51-3e5391ce7f17	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-f014-6b2177c5904b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-b9ee-cc39d286d8bf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-a1c7-044c2395607f	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-ced7-4a3c870a50f0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-e09a-28e5033d0ddf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-c834-fa2e548c558e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-d6b9-8d42232b6c4c	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-229c-85519d8d8d7d	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-3c85-5e14b59575cd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-f989-c085e674f55b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-3d51-517119344a0c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-1a76-8c8abe2d5963	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-d8e6-7fac9c9e7716	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-54e9-bc2f9cb9aa40	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-f2fa-07c9ec6d71e2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-7595-9538af44bbbf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-e9da-b4b04cc6a558	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-9b24-84c12c3cc44c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-d7c7-516afcdc97d2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-0658-595e299ef677	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-be79-5166db48fe0c	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-4ae4-af94a66114f5	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-dee7-3cbfc843ee95	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-9bc9-7679f023ba67	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-21be-bdde4983ff32	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-f625-6f4c42153af9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-a6ee-727d5673bbd5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-446e-3f833475a372	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-d5a7-2851c663be18	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-a5b0-f604fe7333e0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-a23f-2e155f25dc01	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-e2f8-06901f4fa4dc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-b392-6fd5fbe69703	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-669d-6422b56112c9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-49fe-ab973c81d0cd	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-2194-77c5d7cc60c9	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-24e1-524b8ea3babf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-ad8e-a65f574926f8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-ba6c-96b9bc3b9d52	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-53c2-9e5d4a5fcbf9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-7118-01b7c5d2e771	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-4872-24b74f299fcb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-a29f-61a56a7cfba8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-5e4a-0a34a68cad2e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-fd89-339d271edc65	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-5321-0bebc1532a4a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-9829-af8c1b3d9a47	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-c207-c51b9a052792	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-851c-7b2f9ff8ff61	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-89ed-1970daff0d01	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-1aab-7010df9c00ff	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-08fe-8a7240f56cdf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-52f9-3cb1f0c274b0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-3044-64a51446812d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-0c23-d6c4f53b959f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-de0c-356ed69fbf0f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-5b60-45d85555bac7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-fad1-a2b1b67321d2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-da0a-26ee352eed28	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-5d14-b1b73b0c6dd8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-cb26-ce43cca58c0d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-2822-47a40204e295	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-e967-7d6bf6e2393d	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-c70e-aff7dd72e7ea	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-46f2-a963e2a0623d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-6da9-f24937423258	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-ec06-26d86c8e244a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-5ba1-b4c6c744d37d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-40ac-88a3720f9599	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-d9c3-75918fc15149	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-c13e-505a8ca473b0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-83d1-1ecb87ef2c5d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-6073-01769ea0c562	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-4f3e-87fcdcd29b3f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-1dbb-14448396199d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-aabf-38602c950422	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-4e2c-fb251adabb8c	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-6fcc-0740613e025f	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-e273-f050cc004222	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-ac3b-89fa8200ce22	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-7abd-10c62c1298d2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-d496-6eb12afdcb3f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-e326-fa4bc0cbcbf2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-3900-7a51bb2a3e53	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-f4ec-00cb7e69442d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-9067-611abaf082b7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-5718-7fbaa116caf2	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-ae6a-f054a985d00b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-e040-6fdff8e1237e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-b0ad-365a699c6d5a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-9bff-669960f79172	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-af8f-e463096c3f4b	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-3518-b15b9a1ec761	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-29ec-cf823825e89e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-a8b1-aeb7d912cb14	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-5395-bd722603d1cb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-aa70-b0d59841341d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-9756-55747cb62f29	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-8ee6-eadbcd7ea9c5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-3852-4b061b7e4871	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-724b-5cae5bca04fd	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-81ed-626c2cb1289e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-275a-213668705d60	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-59e9-56fc70eaec4a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-9bf1-04c55cba6612	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-511a-d38d4c7c53a8	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-e3a9-d888b7284bf5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-6661-31e4dcf7c5a7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-14b7-662d9cfe4149	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-83ea-f1a9d24c1765	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-a6e6-9a3fe9341461	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-7860-ce993e741521	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-66e7-a209bbd07704	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-a699-efc583cbc5d3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-1ad5-72bda7ea6e35	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-440d-e40e3080c2ac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-1b03-1fc26b0ba43f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-e23d-86ef8b5b836c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-fddc-f659f2f66040	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-c759-03ac8aea5fa2	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-d182-2b92d858c26c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-6f81-80f52224bd0f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-e531-151cefd0f865	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-22c8-98eb48c9ea8f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-36dc-0546e306200b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-c906-88cf7dd354d4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-9082-9d94a26eca21	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-a765-d1d96ff23eb3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-c628-5e0a8707983a	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-e2db-2696c5aa6a25	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-d90c-6059ce80ba79	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-a020-155466d92272	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-576a-1f1cb1ea6ac9	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-7722-3c8aebd00dbf	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-7d38-b9ab9a71c58b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-ae56-b83a8a773d8a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-7f73-7db4e667483c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-8e76-d787ed4001ff	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-b6c4-4bb74f5f914d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-26f6-04b4ef411795	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-2c39-236e36422b23	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-5f83-c2de3d662a86	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-d8e6-108a7a020976	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-610f-0ab22fd2eef3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-1bfd-823d11a61815	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-7f73-a4b9ad0c4da6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-2e91-4ad712f93ced	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-a032-3fe256b03ac3	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-3e7e-2f6de2e26c00	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-18f8-acb2c6016a31	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-2f5e-1d18d50f852a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-5a5c-31553edd3b82	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-dfbf-1b469a6eaa33	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-b370-a758cb0ce782	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-f5cb-87ec43298abc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-1339-6d1462be6f09	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-4f27-e6495a26a4cd	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-42d5-aea9e3495e11	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-7b7b-cbd15a763b6f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-68ec-c15a79d76f85	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-7733-5a1eb30186ae	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-e828-3da709159ba1	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-9326-3d4a84a1e367	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-5961-50b5d0455f91	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-8ac0-b2cbfeb8293e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-4a77-35b10a95052a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-e0dd-2115261308b1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-425b-9e94f49ca922	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-2e98-3de32f4c5201	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-1217-f2e3aec229b5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-f3c8-68b560c75a51	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-cca3-f161a9d91d74	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-9fdd-5a0b8938aef5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-babd-a5cd8c834ec4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-5912-89735366a9b1	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-e1f0-c0f1e8cec6d1	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-1e3d-c0536e8a685f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-2de4-89801838bf39	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-403b-ffb0b44b37dd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-7a45-d12935185bfb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-ff8a-4e3c2257049c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-a8ac-36793de8b216	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-00c7-6420e992c6f0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-8a46-fed554eb4fec	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-7922-c1f8fe553c8b	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-e12b-7e7da6cc370a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-39da-a1f3ee332e62	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-1204-9a13cc1fbd27	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-8482-2c42c24c3e6e	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-13a3-f84db13b8db3	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-ec64-f90bc3fc5b20	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-800f-1948a32c467d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-c1cc-014dc09d1261	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-6137-465bb1217dfb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-4aad-a481e1d44724	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-d07d-636d131ee9b3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-ca45-d6981d08e2aa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-a37c-a76a7643a645	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-33e7-855e24054fa5	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-6ccb-6e8ad698cc1d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-fbad-a325be8667c3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-abbf-13fa4641877f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-1ae9-5693ae1ccee4	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-a2f1-ae6a4ad746c8	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-eae1-99ddfd2682b7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-a927-c9887c118509	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-4cfe-105648215b23	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-65d7-6fe19d2b5f11	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-f5d2-b77014ef406d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-f2b7-ad7c3ff488c5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-e6c6-a2721b601c12	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-dd0c-0691a18ae4b4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-f760-bb4dc8c87264	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-d36e-0f9ed5282e1b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-860f-f6653ef824d7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-ba92-5e32b7dcdb30	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-9778-27aed5572b36	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-395e-9cc9865704b0	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-8574-5d479b2d14ff	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-d14a-ff03d79e9d51	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-ef62-a3d76877de5a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-7b71-582e5b82dbad	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-e6c0-ad053695fb77	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-096e-da8d0e77e965	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-bca3-2e5986edfb9c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-4bfb-52ce4cb34f37	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-3284-6db3b72ad80e	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-6099-fbbe57135472	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-2996-ff244f971dd7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-6b2d-8845fe503fc5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-6c75-b7fa65b3545a	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-4923-61718312a9bb	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-097b-a28d88ef2a8c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-d42f-e05ddc88e00d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-97e8-9d3e67a36702	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-d150-33df0cf7d62a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-d4c3-26efc316b2d2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-d4db-cd6d0e7fbe1b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-4693-d070d8f6ac00	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-ffbc-ed87ccfab775	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-a6a8-442a842005bd	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-2c08-636ecf0edeab	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-c5ca-3beff0a2e147	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-058d-9fa3b0208906	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-2bc5-869db7b2bc8d	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-43a7-866237a35265	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-d7ef-6a17ac9899aa	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-5e4e-f61702e4cab8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-085e-cd091052ed1e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-8578-ede335ab06f5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-b1f2-54362de990b9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-5dff-6956ea404929	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-c055-1288289a0a5b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-f494-d97fb5b39359	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-d444-a507b3d700f5	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-3af2-974aa385fc90	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-a50e-28ce906baa86	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-d5d7-6b7256d43d4d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-fcee-5f024b9f622d	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-5c5a-fa70cc2f2524	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-2ade-7b771b929e09	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-0515-7d780cded70d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-52ec-62c787ba81e4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-fd9e-0863dda45b4e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-f869-8b627d728fe9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-f50e-7016cc5aa6a3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-31b2-9952899bea83	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-40ce-2766f4c215b2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-44e4-59c737b6d1da	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-e6b2-3ca633da34db	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-d349-0d9c7d7aa0cf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-ace9-ffe525a7d703	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-8b22-d8e3c7675005	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-0fd8-e98d2920eee4	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-71f2-a9d917686642	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-3244-bf3c0fbc3bc4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-fd1e-72a595ddfc61	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-0549-5ae7852ccf6a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-8a36-310bae0d4079	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-e572-c00420824f8a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-7cb5-0e17729d30b8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-2db8-49dc230c3ba4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-0c42-68b404f76876	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-7d2d-5500ad5a8baa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-8135-b715c96b4349	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-91a4-f6746b6d3ec2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-3841-80665d875f97	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-e7b4-7741c3c1e0d5	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-8852-66b21d64e87c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-7e66-cf2cdccf6d93	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-9c2e-7ad865929842	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-c0c4-95c683f25594	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-fd91-e3735c070802	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-afc5-d0d8ed0b7b15	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-149f-c7cc85dba822	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-1325-d5bcd24d3650	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-fcfd-4321df801904	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-a983-fbe82dffe65b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-0447-2b8793de7a02	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-98a3-092740b2bba3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-1ef3-4380432c1ee1	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-f58e-45b519c73a27	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-11d8-38541cff4b6c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-5830-ea73b2fdbdd2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-c976-78306d301cfb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-a4db-820c9370dd16	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-84b9-831507374692	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-767e-ac5ff23abeaa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-3bf8-4136d5fbda16	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-6cab-e85e5126de04	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-9de5-b996e6864a64	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-2100-5f417980b5c1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-569d-5f4a44afe65a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-92f9-c20de26ffcfd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-ac71-76727fd92058	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-022b-c4960e559764	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-8edc-1ee1011f02a0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-0b30-1bfd5e8adcd5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-f3e5-d442dd106233	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-9bb0-b5e05b4c1659	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-04c7-5a3f94cd7775	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-bdf6-9e46da396a2b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-52ce-c4e22f4dc643	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-3be6-dd633cd61850	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-e88a-ac805887af91	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-fb5a-052611f3fcc4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-a3e9-7f892b8feef4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-dea5-12d06905292d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-8500-1702ff7970c2	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-0e55-162faa663b18	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-014b-fa560c9a03f8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-2add-d0acfb58b370	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-d695-1a79602027ef	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-8a39-5341f4599e5d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-a975-c6f87932dc55	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-756f-9044fdc10f17	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-7da2-26152adc8a5c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-c527-56afa2a51bcb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-af34-847ed1cd3d87	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-a1d3-5776a3830fe9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-6e9e-8990a18a4ce9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-f628-2db55a6e8917	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-2cbd-7f5db780ac87	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-5661-06cad5d2c91f	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-172d-b09538361d9b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-9dba-18b8a44c05d2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-9f32-c1f110ff8087	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-1419-36550e0e210e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-4cba-6377bf1b593c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-7f16-fde864bf866e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-516a-6b64d03e43d7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-8144-bfb9babada63	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-6f5c-2205a742da18	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-c8ba-55bf949cf231	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-4921-7e32da6d730f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-5f3c-536c2390e741	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-473c-099290651251	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-15ed-ab109f46a0cd	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-1fa0-fc0caed76588	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-ed73-733b178ca51f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-9fb6-bf3effe5fec8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-43e3-c1874d19889e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-51d6-e0ae053dba81	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-d0a7-ec1dbb02c66a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-2024-724441fd6490	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-8b68-339b069caa9b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-817e-6a3b2ccc113a	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-2d8a-3c1da7ca3646	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-c65f-a8902c2532b5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-bc2f-698731008955	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-5333-648cc536a55f	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-5484-29d35b21421d	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-8e7c-40acfb0f5506	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-4e03-d9cffcab71d4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-6e04-88fe33330c0b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-9992-c33fb9fe4dc1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-e38d-a5505deb2162	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-4fdf-1974f1c11f11	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-b154-5e98d76439d5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-7a16-80683d8d5ab9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-e353-11b6b5acbc27	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-0fbc-a074d70d79a1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-52d0-6cd2a353aba4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-8b4e-c66f9905ca11	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-d30a-9d7a4c0c1e2d	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-cbfe-f3230966d961	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-0f7e-d6a0665d5d1e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-a747-ab08f59a4516	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-881d-20b8a86b7dfd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-6b88-b51d4151d497	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-f57d-1a4f1f02c537	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-1620-9c6f36f7893a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-2cdf-9d09e2f43e63	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-9b23-961413943f29	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-919b-0cc20e00b2dc	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-779a-78971021de76	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-3ab1-7b750e6a52d0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-fba9-54506962da38	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-a9f5-c3c762fb41e4	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-7998-4dc632edb921	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-c9b3-c591d340a0b1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-3983-7d7bc81788bf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-46c2-10ca9b9643cc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-dbee-727045218a2a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-7777-5a452f04cbd1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-4a7c-062065bb2404	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-6f85-4671363cc62c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-c4a8-0d538507457f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-32fb-e85ed3654fe1	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-ac09-0cf17abfe9a9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-3e65-65c219b11437	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-a5cd-fa63d983d802	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-3139-bf0f0f28e8b1	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-1834-e56c543bc2f4	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-cdc2-0d8f09513fe9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-7dd2-724c6456d6c0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-7048-0edc51eee589	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-9753-54cc4233fc38	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-dce9-444015c5b2d5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-b6df-23249bcdc50b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-5dc5-31be47f990b0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-5f66-788fcbcea597	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-fc35-7e3d795013c9	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-f312-15d94fdd2772	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-5d05-4d9eb13b2bf8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-6965-e12435f50b39	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-475e-e78e36dc6da6	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-9f8e-07e6eaf4e71b	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-cf68-67a3da6e5d28	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-cf99-c3a262958e14	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-d4a6-1e029adeec7d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-6dca-314642064969	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-1c51-6a0fac8900c4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-4df9-6d34d77872e5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-81f4-51c92ca80c87	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-e972-8242c9ee9d9a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-cdbf-47f061564437	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-7577-65c0d9479a6b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-76e8-7d1664386d55	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-900a-5c7b1fb9294c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-2758-61af746e5b52	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-6fac-6b9ff5aaefa5	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-0f5b-8bce6ce81a73	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-0e5d-294e4e97b0ea	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-7d4a-c3a32acfa25a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-9b4e-094f7b5e59c5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-742f-a44e8da6ce4c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-7b80-541213b4b629	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-5b01-56acceb39526	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-cfb4-aa1e01af90f3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-b2c7-c387dceddad5	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-01f2-d770a011bbbd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-7a0e-a40c3d89821d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-147f-cd75f44deedd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-07d7-a574c7da6426	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-e6e1-d352d2c4c66e	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-cdd9-5829041868a3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-f8f4-2e7c129e70bf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-4e79-9199177e4635	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-7380-82adc2961f78	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-dddc-6980007c81c5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-e808-f2320fea3986	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-9065-4bfd9e98cbbb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-df33-04f474eecca6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-021d-0b7699499905	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-1a50-6c74898a56e2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-a1cd-f649f54b1387	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-80ae-770538a661f2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-eda8-2aed0a1da881	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-ab56-7e1fe8db71a1	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-c9f4-4eb86f6c9cb9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-bd76-ab8be1e0fc0d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-7da3-e3c507f3bd95	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-ee39-af8a176fc6b0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-e171-cfdff2c8aeda	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-c1ab-adff601630b3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-33e7-dd10e7a758ea	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-36b4-0c338acbae85	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-3859-131b8c82379f	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-4087-471a524b88ef	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-5206-a4f2c65d955e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-90db-28cc1e9135f7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-44c4-6f2feae00509	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-507b-2c1ee6f5e46c	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-db8b-fa733fac269c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-2230-4de068bedffa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-4cea-f8ed34e4d4fb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-80af-c2f6c3be520b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-48f1-9488f2be86fc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-2df5-1db74b982ab7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-504a-1f067110fbba	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-017f-e2c48a795387	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-649b-9ad68d4d1c4b	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-0b52-65f75fa82e34	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-8f44-eb4ebadfb685	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-1ff0-d8aea30c5422	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-0ef1-fd99a919a13a	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-da14-771f92bb177d	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-a10e-e12e8266e6cd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-84ba-b1c65abeaa04	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-12d7-e152ffda3224	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-b5e1-3c4454120cf3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-9e22-b6287ae0da2f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-6fdc-a9090e8fc038	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-b55f-0276ef82fda6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-bbf2-1ea2b78adc13	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-03ec-ab66f8a045c8	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-9077-71c152936c65	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-2aec-254a3f3eb88a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-3ce9-03dd04713bdb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-2a96-080201212c3c	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-0177-9626d6b3a37d	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-47c7-7b2e3c4873f1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-d04d-c61ee6e7fd66	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-433f-0d242d31b634	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-318d-7e3a9b018af8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-9a2f-0a9938bc8bc8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-1dc6-62558218c6dd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-143e-1fd393bf2d4c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-b965-eb71076435eb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-43bf-10c800942e01	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-4c47-03f2eff37078	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-1245-7c4ad3bb22e6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-971c-5d1cda10f92c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-90ab-e70da60bafe7	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-2fca-c2ac9e02f996	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-b143-b949c7927f7e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-c2cf-4a638a04f16b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-d4cb-8f58c49024c3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-0379-8d1810a7a3e9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-af9c-742be596ed80	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-873d-1c9d9bd41357	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-5a69-7ee99df44e1e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-c94c-f9fff7a27ef2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-9a30-d703ac49c699	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-859c-42e0c0dcb634	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-8b7d-55be3b2a5576	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-c20f-a71c41ef15fa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-ff1a-6d9be992db0b	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-7a0e-34ecbcbc6a6f	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-98cc-da82d505a64c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-835b-276a2d76b90d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-e0a1-0c456c9ddbad	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-c27d-4be2732b61cd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-dd59-b31fa7f1743d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-034e-1349fdb4a9e4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-a444-b275eb3c40fb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-851d-2a7455b7a3b9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-2aec-50483b932d38	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-3de9-f7bfe72f4ec0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-de2e-a5ee01a5a987	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-1571-702945b27445	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-8634-9dd5cd2f2d60	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-7b79-0b0e5dad2475	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-6630-803705911308	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-280c-7d6711b8d391	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-cdd0-c5b7bf96415d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-ee01-47e0d4fc0da6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-09d3-8aabf27acf9f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-ea9c-73534df0a087	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-3f6b-7833c71b8186	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-1108-c4c743e54e52	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-5bc4-4819dedd5d4b	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-78c0-4d2e3e901420	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-b248-b467d50e9332	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-89be-67a7b3594bcf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-eaf1-d630795a16eb	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-91b1-b2f498191db4	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-673e-d4f5f06964a4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-512e-361c3d8e6572	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-ffa1-7a91be3c735d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-76df-44e0e9ac6d93	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-c519-cee4bb9ea3ba	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-00dd-fd54a8b790ad	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-7459-5df9bab2105d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-3ccf-f75e1ee92918	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-ceed-c5ad8ce3e2ec	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-80e0-308753094e38	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-1c64-65e81c156b69	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-0fff-fc57ccd88c94	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-db06-af97c6d099ea	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-2181-cb724b4496f1	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-33f0-9d7e6c2fa55e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-a59e-b22ba850bef9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-1415-4ef200873525	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-9053-076046278651	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-6155-6e036a661261	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-64cc-f18a49de647a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-b049-cfe2012f83ae	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-09ac-067e1fdac6fe	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-21b8-af04e3214029	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-53e7-c2b9fe4255f6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-9046-07423153a4b1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-988c-622aec5dcb7e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-8f2b-632891e5e719	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-8a60-2d6dfe1ff120	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-4396-91a356991809	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-d9d7-ecaf3d5b764e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-70d1-6d84ee34b36c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-1489-6900c1357361	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-3fd1-3bba0e6b05b2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-c43c-6fa2b1032713	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-e20e-403c810eb726	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-a16a-03a0f3da22c7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-12f7-d975044ed604	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-0631-4cee8c8924e6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-dfcb-6163222969a6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-1234-d4709eb269c6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-f8fd-35aab0951fdd	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-649e-d5d074c01415	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-7bf0-f99db049b6d5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-4452-a1a3efb1e229	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-7625-6fb02859a9db	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-6bd4-49da06b85bfa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-52c1-ed9a128f96e4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-c342-298017db53be	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-4bf2-1d21ad60bbe9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-29c2-0f01b3732d48	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-ffc4-9d00deef4688	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-749d-ee8a1314ae86	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-be88-78785762f946	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-e610-c513e154809f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-0bad-1e226c90b13e	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-818c-4ae9c9713ca4	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-4425-abc4cee2376f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-8ede-b548e98e5abe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-a26a-9ed233afafe7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-e763-4c6642547de2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-9a1f-ccc3f4050e17	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-7ea6-d265920f524a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-085f-91c33bcb5362	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-a9cc-ec2526b02206	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-f2fa-632d0fd96060	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-d267-c4be0c40dad1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-6bb3-10718a30b690	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-2a6e-18642caad0a9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-74f5-36d9c022b997	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-f78b-c6c32d6259cf	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-15d9-1200a13b7ff8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-4cd8-d82f742af15a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-689a-ec29f248ea05	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-7b9d-6d0f856b757c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-723e-0d13bdbfc143	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-a75c-5b4806ce22e9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-3c31-962245dc54c3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-7670-12f3f727b5df	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-429f-d049f22f606e	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-7358-78999011584f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-61e3-d4de5d4e2247	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-a084-b03b3678dc0d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-f239-e18a8b8435d0	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-9803-8beec1933971	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-3657-b4717ab755d5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-a5c0-a8445a3c0818	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-37f5-492b79e3cad3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-cf3d-8b8ba2205028	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-496e-67786710ca68	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-f179-be9585c4e63a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-6de5-55d7b3c552ff	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-464b-8ef6b662f1c9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-f75b-69ca9f1ab795	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-a543-4698d2d6c09b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-124a-f3a91e4879f8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-3135-b94419b3947f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-94bb-58631fe45d91	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-1eaa-35d93dcfc889	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-e551-118381ea8801	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-aa51-fc543b4d9f81	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-1716-548352f2cab8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-eb65-2914b8395d73	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-3692-400accb8071a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-9fac-524da40954e6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-1a5b-f6b13ffb0804	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-01c1-08782ecbc693	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-dd2c-7d6e6dd00cee	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-4158-73a56bfb22f4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-1e93-6852daac7eb4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-2ef3-e88f11266d0d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-ed07-6e2439082670	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-fede-9b9964c325a1	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-94bd-0c2c1644a5cd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-e419-d1266d60d7ef	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-9d94-56383e1c0380	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-5ea7-39af24717b3e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-9d4e-91d109445c3a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-99db-fbe726a254d6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-02db-2cae2ce06007	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-a0b1-26ef98326798	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-e91b-4ffb82dbba0b	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-d286-36460930f560	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-f39e-b929c674404c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-0dc0-11e9e2c620cf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-f5bc-2db4799181b3	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-e873-a6b45b415115	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-1a11-66c2b78e1522	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-b82b-3f0881389995	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-b176-3d072f24facb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-3b99-54aea31af18f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-7e65-0c3cc463a013	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-ed42-c312c2db8879	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-e522-c8a9eeaddeeb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-8afb-d7fe74d948aa	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-ef9c-2cbcb4feca08	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-c55b-4ecc6a9bcbe4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-afe5-6e233345dcc5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-d491-0cb8b58d189f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-3be6-a1e58624ad66	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-11ee-05ac585bed68	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-6788-14d9c5ee74df	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-6199-b5e8b526ce18	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-48b2-7fc4e13417f4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-d4b1-95d4f0f26357	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-5e9f-e578dac7bf92	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-c980-924315a4fd70	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-de4d-fe0ad0360486	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-b814-615df79556bf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-6de8-c705002e0937	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-9857-fb23b12531ec	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-6a23-6527f1733092	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-1250-8c946f90509c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-3f56-703e793a1457	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-1bc7-e87a2c66315d	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-6c8a-20ad8dbd7380	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-59d1-79cf8ec701dc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-3f95-4f72deaef37d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-24a0-87699812a896	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-9327-639a50bd2c8d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-0167-de7b5ceaa1ce	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-b890-3d2d9b5a861f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-c3d4-9af39589e796	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-50f5-3a9fa993daf6	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-c6dd-44fc1378fbd0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-68ca-e005dd04d5af	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-d23e-b971e6443be6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-6fcd-5d6ad74f7431	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-d090-92668c68d475	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-c41b-4df8c710838b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-7c4c-63b244a0dcb1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-03c5-4ce19df5d1e6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-a3e8-25f6b1a4ee23	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-4381-d6bf90a6e2ff	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-60e7-cf49150ad6bd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-200e-11de0b9bbd6f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-5f37-a8bb38166961	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-9049-5744c4f398b9	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-d8c0-f5386a0e450b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-12f9-d72b0659d5bb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-8b2b-ce5a55c2f43b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-0946-f2579e1d7d3e	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-4e67-656302a03cdc	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-b3fb-390824c5e6a6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-927e-8dbc5e9409c0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-4875-96204fcb8489	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-f844-19fc79107d8d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-6e48-b47188f7af52	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-9581-8ad5176a7d9e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-62fe-eb61225f06d0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-4f6b-358d9156d9cf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-2e0e-3e5d142bde0c	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-0c72-c107967e9cb7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-450b-72c1fcac29cb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-24b6-aea27231df00	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-6e62-b8902cd1c77f	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-8b1b-f4aea667be0a	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-936c-dee8cc6376d4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-c85c-7dcec4bbfc1c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-70c4-9f7d7f21a37d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-340a-cc531c430a2c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-a940-26db9fc54762	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-0c36-fecf011570f0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-1c66-99a0f2ed69d3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-8149-95f3eb0c8d7c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-c08c-a96565fe6e81	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-3899-d84d3b4b04d1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-4cf1-27b55d955093	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-29b2-24ddae721855	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-93b5-778af03fd9bc	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-8914-4e44093798dc	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-0950-04a36ec1738e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-5b90-66c362e72ae1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-7bb2-d30a38c3ee07	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-f832-1d7239466d1c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-652f-6bf93bb7ecc6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-2259-fb883eb8a9ad	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-8682-2349aeb4dc8e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-9285-2c9291d9e820	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-c1d8-0505f2412fc1	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-a7aa-636a15221591	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-9798-ed0f1f149680	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-5328-74c803fd1c37	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-cd08-7e6c5d721969	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-287e-e25ec034a586	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-b1fe-1da3ddb01da9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-f787-605d4c033c33	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-1757-770b4b04d6be	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-5a7f-08c31ff4b4e8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-c436-bdeee207c795	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-0b57-46c504b343c0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-1dfd-09b489767ca6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-8a55-fe845fa11e4b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-98f5-7b1c33c0b785	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-6cf8-33e146499666	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-2cf4-c327fe75eb4b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-ce18-738ea7accba9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-73bb-d66abf60b3b5	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-0c11-5b0c28249c82	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-df46-042559f241de	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-0048-fe06e3e9a035	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-05f6-6da7a0d4af3c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-e357-5ebdcbfde874	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-d98b-ff32f10c9e22	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-b77a-38881c203fe8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-a946-e44eca7e04c3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-5ec2-666165016168	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-cd95-207e884bb95d	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-4cc6-3490fbac50ce	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-abbf-ea31df9ce842	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-59e4-0e6ec88d9ffe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-75f2-17b6c4d95941	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-78f1-06f9e409e576	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-9a20-bc7aea4d8e5f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-1ef8-0208265806b1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-5b71-f99d0d888ffb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-eb58-7f6f9187c1c6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-970d-bbfad253703c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-981d-ac31b2aa0698	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-a327-0c8e4e16d55c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-8dda-63a9a8eb0b69	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-4bb4-ce9294eb3345	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-3c29-321a0f00470c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-34a6-3f657c8e3f73	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-c852-6b48eb8b42e4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-b4f3-1b110843f4a5	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-8192-878c00275f3d	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-3ad8-1b98e8614d38	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-3e27-b163ee64fde5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-4ec1-6277931ea79f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-f05b-585a19a75532	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-ba4c-75280b3b3eb2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-808a-f25f70cfa755	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-0ce6-6c37bddeb6a5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-da6a-61f790d4e4af	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-0aec-ddf3419e285b	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-5eff-47fb6aea95b5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-9a1a-352e4f6a0df4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-134f-9e63f9aca366	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-97c7-dc5a1fa0172f	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-2709-abf6e0713513	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-190f-b17d2e2654bf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-20b7-a7b4cb54df84	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-414d-30a007ad236e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-d2df-db8e55242210	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-e7e8-56f860cf112b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-f151-9688c1b4c19e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-8f42-b0f20c33f3f3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-b3b3-934655ae1c92	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-9790-7269e6c17305	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-4758-cd33bb67d800	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-4f5a-d34119e9f930	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-1591-4f08fa72bf94	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-86aa-e5c73ade937a	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-7c8d-af221790a560	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-8b9a-3738e2d83553	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-a5ec-133d721e637c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-6286-429bc1a2ae79	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-8723-c89479638f33	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-26bb-52efff386431	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-c781-479769206292	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-5394-a3430fa5c7a0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-b786-5f724ae6c84c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-2441-59024c98013b	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-a695-b36cd97895f8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-af11-598f068a7ddc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-ce66-ed9ec0092320	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-5861-a5b6c68d0030	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-9e19-121069149fa6	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-2d5f-70dbc5e10c4f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-d829-3e881e2fa319	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-9781-435f464ae363	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-4278-e8f0235de20a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-f7c5-11a513054433	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-4e71-bb5a78f7c208	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-2d1f-113ea155da0c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-7e9f-af93ce8f4d43	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-1e01-09af53456971	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-512b-572f21f7f84b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-ae51-1d0a829c44cf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-48ed-4e157afd0a81	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-dd17-c52cec118dfe	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-3ed8-c6eccbe563d6	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-b011-28c5c852fa70	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-4681-85c885412f6d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-d9af-f2021ace9e96	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-0324-dc0fddef6910	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-60a3-224472d0bcea	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-8950-2c2d6728e9da	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-bc9e-550b9e09f7f3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-cc7f-e613eb43a495	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-2d2b-03ffd9a66faf	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-e2d2-2a5ba064a162	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-58b1-984c7260dbb4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-893f-0ec74fbc9fbc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-1909-2b73e0a05343	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-6fdc-a0e6b7f286fa	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-435f-5edcd3c76308	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-74a3-5e33ce44a586	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-1300-39d0046b930b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-0e30-7d408fe5002b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-79a0-2a8ffdfc22a1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-b13a-8094c700799d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-1b6b-c66c120c2174	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-0b6d-61fc7da6e3fe	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-31e7-f27e185d6b52	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-1b5e-8e7d2acd560f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-a108-aa83db8f34a3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-737f-296d6b741a38	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-6ef2-bac72226c241	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-ccfa-c93acf89601e	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-8b94-c2ce6e794f0a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-d5b1-b89253cc8ec7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-19ae-337277d24c0c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-3c48-78a4c06a6957	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-1d1a-b65d89024fe3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-257d-1ea01f5c9751	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-8c6e-79545871e27a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-3a2f-f756c5daf7d9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-d26a-5eb1651ee47b	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-a009-cc985bf22966	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-c990-0071b8fa0254	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-a501-2d2817f3bfd3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-d1a5-66b2eff59125	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-bd4e-f258ec1030ca	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-e132-03c49f6da315	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-a5dc-c86947b091ce	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-4e32-b61ae606acde	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-0b22-ea51185bbeab	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-79c9-cee581e9310c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-6359-4c14f39d71e9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-21e7-a12f79a4d1c5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-93ef-748092a26fe8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-e9e5-286515ff330a	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-a7f2-edccd3272e95	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-dc2c-e0e72874564a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-8efb-701160be53a2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-f926-30f194e4f4b8	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-73b6-b64f124b5d59	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-a05a-72b177a1eeb2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-62f9-5b7dce400539	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-1693-80bc624ca9bb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-50c5-0090c15e9598	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-4a9b-360b301c2443	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-ca1a-5c5b17ca279e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-da86-b9a794fa1c91	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-22ec-528bb2a1085a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-1e8e-06abdeb27c42	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-d987-fe8e764b9fda	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-a7d6-4bb0aee51059	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-1505-0bf03a365f3d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-9008-75f69a804f16	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-fc6b-e70a67369026	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-1d44-49c393d603f2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-4ab3-d59757450d57	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-7d05-c6ede96f02f3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-89f7-98334e81e712	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-efe6-3327f747d0e3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-878b-ec003a2102ff	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-90b2-c54a07381996	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-cade-3a0250584efa	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-16f2-62f30d90be29	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-b955-2256928aa937	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-88a7-63228b0decf6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-300b-ddd5c41842bd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-cec1-2631881e427b	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-1e56-b180e30176b3	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-5f36-d46ee000012f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-1d61-8a78d26c1a0d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-98e4-ef6b978b27e1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-be11-9fca649e65bb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-7764-b1ed16796255	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-ff93-7cde045812c3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-8f59-e27f0acfd8fa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-75ae-87741d3d6875	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-f7ff-304ca362ec7c	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-df51-0751c16b8160	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-1370-d4f078add566	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-6ae8-f63eba1b4187	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-4655-8c9881397617	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-6694-af25e8400a98	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-75ed-da3cdd231388	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-87a1-adbd525b0046	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-fb6b-4e35dab0b864	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-6d99-70c5d8f90b62	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-534c-a0df393adef8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-4447-b854860f6eb1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-5411-db2606064071	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-29ce-4b2dcc5b1658	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-9acf-a2f308b0c98f	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-bff6-f45f9f28e22e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-6674-a2d3f5d4d9ac	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-c35d-40cfb6ff91d4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-10bc-67307deb8339	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-e7e9-f241d17d3336	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-0cf3-bd944af288ff	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-9eda-c6667104ad51	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-54da-4a3514f635dd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-e0a0-a073896a0926	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-e8d7-fef284755972	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-e237-6543559c97d6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-8e9c-a606a1d9cb6c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-d71f-58e443d6dc59	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-9b6a-51884eaf7717	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-5861-c904170103fd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-19ba-a92c11fbcbb7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-b036-3875d8c67483	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-a0d6-0f58a066415b	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-5f65-293d8978775b	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-f01e-4508e20c8523	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-81aa-2297c1cbdf04	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-addc-3a6314ad442b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-5411-275b4472195c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-968f-445ce437e818	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-2a9f-3b5d3a0a6c71	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-2798-1ad7ca2c7199	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-89ea-017cd94a3333	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-76c4-2d7ba49b23d9	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-e15c-f7cb466f0442	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-dc1f-06cd6c4c7374	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-ba5b-abdae65a498c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-70f3-d1c5551faed8	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-dbaf-83bd89c510c8	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-4c0f-b825c850e544	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-d680-9e6aefa02a46	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-7794-f9c0d4b52fcc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-a71d-5b35c1c2daba	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-e6f4-ba128c89d62a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-d952-e50c105debab	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-ff84-e464ebd3ac2d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-c3a8-6d3e17d2eb00	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-d2ef-618260b9d1b9	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-7e2d-3afbe217b076	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-71fe-25da8726d2c5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-8cb0-32a669b351a5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-22b7-484fa9d12794	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-1840-ba872a63d9d3	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-4ff2-36af3f8fb04e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-18e4-5e0cbcf52040	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-3510-85406d4aba2b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-6d42-3a981eb335ff	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-a267-21e044c42479	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-9305-f130e35f0f21	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-94cc-29728bbacf4e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-b444-6078352649dd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-e439-91df8a2d2efe	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-bb3e-00db650b8a04	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-90f5-0b06f6d80426	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-d2dc-7d0ce0f2d709	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-c6e0-fc375df3e602	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-00c5-4ff616fa2236	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-4704-13dc5f4101c4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-d4ad-0237b0f978dc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-82e1-87f3dc097dac	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-cb01-41cc63848ad8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-e279-85fbbcdc2657	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-63bd-0b0015036eba	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-ee0d-55cffce7c104	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-39cc-e7a0db3baad1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-7c69-39c0e2057ff4	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-c911-1552ae55ee0b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-87b3-4033e1f673a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-c7a1-6026bc9981fc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-035e-05bb30e49200	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-cf9a-39b310844768	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-df54-4ac9cb9931d5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-c606-410eb42c4442	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-57c9-23fd814059f3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-52fd-6c2d2c2ee42d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-557e-406d2eff7c09	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-c714-dbda56c4ecda	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-790a-c3d10da6c3be	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-ada6-5c05bef25119	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-4be9-4e91487ab9b5	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-72d0-407426be4294	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-ad65-54ef66273d65	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-11fa-cbb0a37672f3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-4992-67f4067d25e7	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-e1c4-e845ae0fb583	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-0586-8d0bc138ab83	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-e372-d2b7e30e8a8d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-7b2a-f0a395b23006	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-3c13-1677f37a7ec1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-d5dc-67f153266523	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-c44a-bf192fc8fad6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-4a5b-6bb2f17eaa30	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-4c50-dd015926ce5c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-5c91-40d024b9046b	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-b255-e036411f0635	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-0c61-336659b69997	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-18d2-06fa4390bdc4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-3421-d577c26f8385	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-40ad-5ab8a3fb06b5	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-b57d-30fdba8cd107	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-9692-c0ee65ebdda0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-6f63-2fb68277c118	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-1bab-5f87e08503a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-5cbc-eaee6355be22	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-d4e3-9c50abbf2304	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-faf0-a7e46bd5abf5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-591d-34bfb80ea9bf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a8-4d4e-2135c2d03778	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a8-27cd-749a2fc8bbe7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a8-2048-e36ec99d9ddd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a8-18e5-b584bc4e94e4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a8-c006-a1acbdd5aec9	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a8-8cc7-3e61b100aeaa	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a8-044a-5b7a1e1c4f87	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a8-c505-cd2ee3b0e582	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a8-f359-09a9e42244ca	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a8-fd85-43061a0568b3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a8-64ff-f84365ec602a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a8-fc1a-f7020780d80f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a8-c2e8-388726881a5e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a8-d574-e97c42819862	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-46ad-af8ab817274d	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-0d64-090142e1da07	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-b8cf-abae50fa72cf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-a033-5e3cbe383839	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-7b8e-d2d3ca29b754	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-1704-1bfc21ab56ff	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-19fd-b2e41fc6c346	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-bb5a-f51ac1a5adf6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-f3ef-1469a55909c6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-9b22-07ecaa53dbd4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-b251-6f132b43b49c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-84c6-0ef21e9f5dbf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-5da3-3ff34698829d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-f3f2-9ef8fac0ff6a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-bac2-abbd41d31248	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-75ad-147ba4bc770d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-ee0e-c96fe0984633	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-3c84-df939e3d19d2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-6844-5f58ef67ee22	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-5c0b-ac0e7ef2cdcf	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-31c0-77183fa04fda	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-febd-052846221314	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-db57-0a018c5f8b40	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-7d25-f1bed00ad618	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-f365-f6bcb30e0594	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-00b1-482d15df0b68	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-3076-64b346b8f625	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-cbe1-58aacc151fc0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-a4c4-eafe3d3eae6f	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-fe94-bbf19480357f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-54a7-3a92d1b5d65e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-849b-82624dc84c2e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-0749-6b2fdc168cfb	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-ee46-278bbc67e978	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-1c37-369128cbcfa9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-3041-b07aec3f1120	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-2314-32e0adff7c12	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-4b89-4a2c8c6d65f0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-9f14-cbcfd668e4da	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-7d9a-c847f7627438	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-8fbb-e8f008fb09e6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-8b61-3c5c0f8dd6aa	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-1da0-8be06882d86c	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-3060-5fd632191f3e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-1d66-6f4bbd8bae86	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-085f-275c431d3d37	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-06ac-16b3dcc22178	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-e403-1e7307ab2d58	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-3b93-ac8303cf797b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-5b30-82c20bb16f31	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-73c7-9cb49b4be52c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-ff6a-2b4e0ed8efd2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-fcb6-b04d1a537128	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-1335-7b6c2ab8594f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-3f50-bbb705535b88	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-0154-c5251029e461	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-c93c-e05c5e40524d	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-bc4c-d5dced4a9830	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-e126-7ad03698ed6b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-a0a7-988747e450b6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-3434-8489fa4775b7	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-d68a-06909ddb4969	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-bb91-c4d67643225e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-11ce-823a4cdf8a58	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-6cb2-673e5c1c7a98	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-b670-d6c662d4a168	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-3189-2d54f152a109	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-5d02-87bb58c57e1d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-d14d-cc7155188e23	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-aec8-25d0c2e38397	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-f8ee-201813958830	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-c0b2-58afc208a302	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-fbe6-b785f1cb5569	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-96db-31144f21ae50	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-b89d-a4aead6a13e3	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-bb7b-d20415566f64	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-1ae1-1460b4875bc8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-989f-d68eedb7c491	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-f36a-ec075d924c20	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-e839-f3a0e76f1579	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-c35b-f596ef3231f4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-5ca6-654429a321c1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-1cf7-e388f762b3a3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-63b5-33d395f21f8a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-1403-aae9654af587	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-d8fe-c271b846113d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-ed89-0e48c23e906f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-1b9a-381610a4b601	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-58f5-0279e6782a36	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-9f95-9e32678ad926	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-c255-5482906a36c3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-9054-6c00f35cd161	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-a444-74aed7812ea9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-894e-4ca5c31bd264	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-e17e-ce560d3a7987	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-752c-42938a595892	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-1da0-69e0b9f3067e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-193e-ba71a37335f7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-25d5-c980dac79012	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-a132-b9027598fee4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-8a6b-5e94cd181786	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-afd7-be30b8a26312	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-9a3d-a3d9ea81b24b	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-3eb3-bb5ae7fcefcb	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-3f7d-10813cb63702	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-3a2b-a074280c3397	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-e05d-b5b493c58bc2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-b372-53daed26e31b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-1193-b93c459d129e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-bf64-86c5682c176c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-79ec-70edb7b33191	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-bddc-8bff9d735366	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-7cb8-0c5d7424a02f	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-3e91-835f2efc7ab8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-8ada-f21d8287ba3c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-1bd9-bbbbd15da712	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-9287-3339512e9f79	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-bbd3-886a5fcabe4a	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-2087-331453feb5df	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-c6cd-64ee222d1530	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-81a2-cfbfca29db70	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-3554-bece78cba4a8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-9378-c2080547ecb0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-6586-cb3194709556	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-b000-d52373c9a84e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-930c-67958df361af	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-92b7-ee9f33a1befa	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-7107-3a727f120bad	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-2b95-b2e7f5e30427	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-cfce-8651aad003ec	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-661b-efd283839be2	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-316f-db8f9558f821	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-38d9-f49958206283	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-4900-745a1c6c910a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-4311-023899a33c66	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-b56a-401887542d51	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-c576-bfb4e8b70431	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-f4cd-b9ecdb933e25	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-11d8-a44ff75acceb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-453d-dc056132281f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-6ffa-3e2f9a2233d6	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-970a-ad10c284d597	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-7fd5-c031fdedb267	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-5be5-8fe4385fda79	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-01f9-1f3064fd0ea5	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-d04d-e6f64aafff42	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-1a00-f46f5b4dd7ce	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-0449-e521c64a3049	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-5276-3672bc0c4c5e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-729a-468c292e072e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-332b-f7eec37f24f4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-d86c-e8680aee1f85	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-76f1-87790f9f349e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-7147-b8b0865d1805	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-a293-e557f55d1138	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-b5e8-d87c8aad4273	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-0ead-e59b9e7cee6c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-209a-6ad1fb431a18	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-3a2b-74ceed83b3e7	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-4494-465c06888248	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-0718-e32e1715dc58	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-b52e-520763ea360c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-b2e8-cd7deab6745c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-2d81-1eac2606e263	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-848c-8c35f354e92d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-0c79-fedac2479710	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-2144-33f2ca3a1755	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-6b44-3e9ee4729c2f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-a615-a3acf955b35d	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-31a3-dd5072c2beb3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-de86-1bdd44c61b2d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-d96d-4e66f01e377a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-38b4-52e8c6418b09	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-6993-f6d328e34629	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-80c7-27da5bae6b53	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-c419-9e41b2e1e3b7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-4063-d7018d4052e5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-42fb-950efbe2c01c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-ea3f-736bb39ae902	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-f8e4-26c60e2afafd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-0acc-5cca8d798db7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-11ba-697156a1ee2b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-9688-a39ce4f8dbbf	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-7765-63ca31f9fd0e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-7a29-160b4e75a6d9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-cc13-1ddc88e9e773	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-fa96-d400266a1872	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-ece9-72bcb4380ae2	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-4fd8-148e720d5545	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-3467-4137b6badc46	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-1aec-3791d5dedb8a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-0761-766da8f4cd52	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-19dd-58c53e5305e1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-ffc2-21c3ab259bc1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-5eb1-92ef8389eaee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-8457-230c96b44847	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-291b-e6adf20183ec	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-837f-f25a07e1c405	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-79a6-0f3e12a40dac	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-f591-61fee4b6c6b1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-8cc5-b23a6e96b68c	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-df3e-bd5ad1a97d9b	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-645b-4bd3bca94dc1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-4a32-ec30d50878d0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-7c23-f0665bef7762	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-d11f-f6b264d068b2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-1190-f7b03578dcd5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-196f-f9908e503cc4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-a912-41bf59f909db	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-eff6-bbd70ac0975e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-a59b-ced7fe2cf9ea	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-5181-17ac98d1673b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-6091-916e725325d6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-701f-17c08efd8b0a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-fde8-1d2bb132de84	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-237f-76780f539be8	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-f243-59a9b7d944f4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-7f1c-357d64160d98	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-0309-5c87e7bf3d84	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-f3d1-d67560f00183	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-b70e-800eeb2491b6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-bd95-8bbb6a7b4c84	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-317b-214b2585f874	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-d2d2-f89b9c9f0f24	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-bc22-386257ada7d1	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-cefc-9b086809965e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-a2d5-417f4f76fe52	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-568d-065f8e39ed38	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-0d60-a8d2e8a10b21	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-fedd-3d1ec4d0fc70	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-0c96-05e283831cbe	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-a14c-4117d577b5fe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-b99f-2a18d2640f88	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-fba7-182ecb588d80	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-5104-73f2d63b5a48	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-94a3-77d3250bfa34	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-4806-b3b504385829	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-31f8-4873f21e2dc3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-f1ae-8ed04ebea66c	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-c45c-5120b0d6be86	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-57e3-6022e458017c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-7da8-380da96549bd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-dadd-a4f22e9e337a	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-ec6d-87e194b87858	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-815e-3dc4d994554d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-48d4-321f2bfa3225	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-42b8-511b4eac647e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-929b-7e6730550e43	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-dc2b-60541e17fd8d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-cefe-78a6ea2cf8d0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-3e73-7448266e36dd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-3712-77f7ee78d345	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-4164-c785a38529e6	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-8674-ffeda2d97806	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-1443-16ff1ae418ed	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-a9de-feb95a47f78c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-ca1a-8c24b7bfe730	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-8d22-8d65275d174f	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-dd1b-67e3fe55a87c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-aa17-53b391d3970c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-91e5-085818530176	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-0083-b16a56f9dca0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-ac02-3332684f26c2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-cbfa-2c162705835a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-669c-dd6a0de47426	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-fbf7-120ad65cd4f5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-a6df-d7a3ea7ae123	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-70de-94c93d751ac7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-09a0-a5b2a0702e39	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-6449-e55f34d64daf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-6a12-e3ea268c381c	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-393c-9326ba112e74	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-9763-5a8fc0984e27	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-0dab-93958de2831d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-ee46-125e1a66e0dd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-a49b-25191a1bfd12	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-0d54-18d2e54d680a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-094b-55ac23f68397	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-451f-4cd08197fffe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-95d8-f0c2860714e2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-7347-ad10d31e6da4	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-d76b-b8bd00d13a8e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-b19a-22e42d931746	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-9f55-fabfaee391ea	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-4dae-0b4d693d8224	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-c9e7-c638485003f2	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-a2ec-fda66cd97821	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-e3d0-6b0a35fe0370	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-53da-e2a0359df94e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-58e9-29269553015d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-cd9c-442fbac97b59	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-d503-0acc6b6a2d24	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-efec-21d05fae75e4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-f91e-6f5e7e2116ef	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-503e-b8ed9191bb9b	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-ee87-3a3c54109ebe	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-b7e5-ade487c6c336	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-68ff-96ae888a4751	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-b994-b8b2a3d0f21f	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-4818-fd1af1510a86	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-d285-e3a5fae3f6c9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-1d35-c7bdda108d67	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-7e80-23941db7d85a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-9e92-d605439b31d1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-1a4b-a908d811db9e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-7b6d-c55ece875c25	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-349e-232038bd3520	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-9921-d70bf8e5284e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-a5d8-ee1c3bde93b2	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-f118-d39ed2cc36be	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-1da3-74eedd650d94	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-718c-4bd7857aa2bc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-165d-edf3333a58a6	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-92f6-69cc7ab43300	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-648f-7174c533f086	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-00d7-545a57e7fbdc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-91be-2b3abe97e020	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-b827-82e3d63d7bc3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-d075-45415e998d90	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-eaef-ac602830a80e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-c76a-576d8e876817	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-3b0f-2ccda6174e99	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-8296-10737835a4a8	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-c313-a77c401e23b0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-9757-6e05161ed2ab	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-637d-2813e0aab0fe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-7e45-8171a120bd5c	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-888a-47c231a09da7	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-3163-9b646d51a390	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-fc11-9131305b0e05	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-5625-14eda60e200e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-5440-cc7a1759e78c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-4d74-9b4cd02ea53c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-3a06-ef7ad979a4ed	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-5d0e-93f1bce7235b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-1d37-9493a56c641f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-6c49-72cb75b6d7ce	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-8c55-9197e34e3ab4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-e448-4b9ff405829e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-3dcf-33f81bbfca30	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-f3d1-e8ec6a0ba320	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-c2eb-2844dfa17d07	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-1478-3c23a4a81959	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-0179-2a710785eb6f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-7d33-b1a71d4560c1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-2992-20cf172a9a27	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-d49b-84f31f523ffe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-68ea-315c6b642084	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-febf-8364789dc17a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-d427-9e4f7678ad2f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-f715-ff9e948914c5	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-1af9-7a3f376727fd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-4066-a9967b84a98f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-e827-65f755c34144	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-2cda-1090b5c6477d	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-e40b-01a1da9d00e1	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-0319-75ad18ab603b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-bea0-48a176d29f81	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-2d95-4e4e1901ea43	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-78d9-c572a28cc482	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-6050-0283535a813f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-6982-aeb8544c4ce9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-5262-144ca9af4b9c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-77f0-f63f25d697fe	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-0c1e-e6aedd45f562	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-25f6-65a7f6d71116	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-1462-705be27d2b0b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-2d05-0b57eb721229	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-098d-e5d05bafc97a	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-3722-097ee45fde79	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-31ae-ed5d50ca53b6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-3cc6-006725158201	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-6a01-93fab5089697	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-7f20-0df5701c0a5a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-fe2d-9e3a806069d2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-54bc-7ca0b3222bf6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-5ec4-fe868a674723	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-ae66-7b18900338fb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-b223-b434b683a4e0	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-880f-4e7bd3b25521	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-0401-9a137f79ad80	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-76a4-0f8a2dd829d3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-c94d-ad5665ea7ee7	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-85bc-b87347b8f7bf	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-9076-de9efadcf017	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-3c30-8bad54b8a14d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-24a8-de6a348ec0b0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-707c-e54913b0b0fd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-4dbb-87f99f4b94ba	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-1670-b3e44ee1ddc2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-a813-86f6fdb7f942	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-f3e9-af2b48c6e92a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5535-06a9-5303-48e85790b717	User-read	Aaa - Uporabnik - Beri	f
00020000-5535-06a9-3ac5-6841962c6f0e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5535-06a9-f4a6-ca1b343a225e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5535-06a9-1590-f695f8ed619d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5535-06a9-2b22-b5be73ab0a5b	Role-delete	Aaa - Vloga - Briši	f
00020000-5535-06a9-2a5b-858e42c9b71a	Role-read	Aaa - Vloga - Beri	f
00020000-5535-06a9-16e5-96c1f906e745	Role-update	Aaa - Vloga - Posodobi	f
00020000-5535-06a9-1e93-80cb0a9dd036	Role-create	Aaa - Vloga - Ustvari	f
00020000-5535-06a9-d9e9-2d362d4ebc03	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5535-06a9-cd31-54ff0d415066	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5535-06a9-f072-6cdf04dd7229	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5535-06a9-a442-aee5b61c3b01	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5535-06a9-7ba2-9c81fe73cd20	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5535-06a9-cfeb-88e3fa1c1074	Drzava-read	Seznam držav	f
00020000-5535-06a9-cca0-3ee4dece1a15	Drzava-write	Urejanje držav	f
00020000-5535-06a9-5ea4-c1e8f752528a	Popa-delete	Poslovni partner - Briši	f
00020000-5535-06a9-0100-95a3329ab67c	Popa-list	Poslovni partner - Beri	f
00020000-5535-06a9-9ff1-001d9ec627df	Popa-update	Poslovni partner - Posodobi	f
00020000-5535-06a9-9a78-4d6812d214dd	Popa-create	Poslovni partner - Ustvari	f
00020000-5535-06a9-4d32-f81097e67c1b	Posta-delete	Pošta - Briši	f
00020000-5535-06a9-f31e-8cce663ade2d	Posta-list	Pošta - Beri	f
00020000-5535-06a9-c999-8eb043e45a06	Posta-update	Pošta - Posodobi	f
00020000-5535-06a9-087c-feef2778ab54	Posta-create	Pošta - Ustvari	f
00020000-5535-06a9-62f2-57884bfb1678	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5535-06a9-9696-f5f090530be7	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5535-06a9-b367-d56f6e94da7c	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5535-06a9-6043-90ae050ba438	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2594 (class 0 OID 525580)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5535-06a9-178b-77ddbc75f13e	00020000-5535-06a9-cfeb-88e3fa1c1074
00000000-5535-06a9-178b-77ddbc75f13e	00020000-5535-06a8-916e-c61e08885aa6
00000000-5535-06a9-cab9-d0fa0c8069db	00020000-5535-06a9-cca0-3ee4dece1a15
00000000-5535-06a9-cab9-d0fa0c8069db	00020000-5535-06a9-cfeb-88e3fa1c1074
\.


--
-- TOC entry 2622 (class 0 OID 525868)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 525898)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 526010)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2599 (class 0 OID 525637)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2602 (class 0 OID 525680)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5535-06a7-bf9f-53d0e65f971a	8341	Adlešiči
00050000-5535-06a7-1591-408036e021ae	5270	Ajdovščina
00050000-5535-06a7-1802-dfba4d4278c4	6280	Ankaran/Ancarano
00050000-5535-06a7-0313-6163b1bba109	9253	Apače
00050000-5535-06a7-d59f-978d596970a8	8253	Artiče
00050000-5535-06a7-6081-a1938d340ab9	4275	Begunje na Gorenjskem
00050000-5535-06a7-aed6-34de3af50fdd	1382	Begunje pri Cerknici
00050000-5535-06a7-626b-4c1ba176f645	9231	Beltinci
00050000-5535-06a7-34e7-380b9dd14816	2234	Benedikt
00050000-5535-06a7-f68b-f65dd4ecbd5d	2345	Bistrica ob Dravi
00050000-5535-06a7-06e4-631e2f350b4b	3256	Bistrica ob Sotli
00050000-5535-06a7-b916-9f9a92f15bfd	8259	Bizeljsko
00050000-5535-06a7-38da-17c3af058a10	1223	Blagovica
00050000-5535-06a7-ae0f-5524a7e3c486	8283	Blanca
00050000-5535-06a7-a940-d75843e02d2c	4260	Bled
00050000-5535-06a7-df06-21eff2eac5b4	4273	Blejska Dobrava
00050000-5535-06a7-d9df-2cd12efd3418	9265	Bodonci
00050000-5535-06a7-34e1-a06d6f7e9e33	9222	Bogojina
00050000-5535-06a7-3f1f-d68d6eb8f448	4263	Bohinjska Bela
00050000-5535-06a7-f1b7-3b27e012951c	4264	Bohinjska Bistrica
00050000-5535-06a7-a233-f2934e52870e	4265	Bohinjsko jezero
00050000-5535-06a7-144e-afde490aa18e	1353	Borovnica
00050000-5535-06a7-ab05-6f308a7e4e6b	8294	Boštanj
00050000-5535-06a7-ef5f-911721d77b3a	5230	Bovec
00050000-5535-06a7-a72c-415ccd919ab2	5295	Branik
00050000-5535-06a7-6994-a7011460952d	3314	Braslovče
00050000-5535-06a7-1255-431a58660925	5223	Breginj
00050000-5535-06a7-8b4b-a515e1f75d0b	8280	Brestanica
00050000-5535-06a7-4a47-4b8b5bf5bbd8	2354	Bresternica
00050000-5535-06a7-229c-8471f725b307	4243	Brezje
00050000-5535-06a7-f117-03468b50ff71	1351	Brezovica pri Ljubljani
00050000-5535-06a7-e747-9a39f9236b09	8250	Brežice
00050000-5535-06a7-a3e7-a9b931281baf	4210	Brnik - Aerodrom
00050000-5535-06a7-e09c-557bfb1715f2	8321	Brusnice
00050000-5535-06a7-2afa-51a9802477cd	3255	Buče
00050000-5535-06a7-5e1c-3f63c37d4a39	8276	Bučka 
00050000-5535-06a7-8b41-4c7d1481eb90	9261	Cankova
00050000-5535-06a7-66fc-fe323e0ac32c	3000	Celje 
00050000-5535-06a7-2de9-8f39dbc1451e	3001	Celje - poštni predali
00050000-5535-06a7-96b3-4a81a6f5a808	4207	Cerklje na Gorenjskem
00050000-5535-06a7-5ad9-4b6c5d94b72e	8263	Cerklje ob Krki
00050000-5535-06a7-6904-95101f51e6cb	1380	Cerknica
00050000-5535-06a7-ab48-ea7b4ab34763	5282	Cerkno
00050000-5535-06a7-56ef-9433007ce338	2236	Cerkvenjak
00050000-5535-06a7-e37b-15690f5f4576	2215	Ceršak
00050000-5535-06a7-56d2-f3ab3a0230f0	2326	Cirkovce
00050000-5535-06a7-c55f-05fb8e3c6d9d	2282	Cirkulane
00050000-5535-06a7-919c-2eba92fffed8	5273	Col
00050000-5535-06a7-f76d-88a3edd509b3	8251	Čatež ob Savi
00050000-5535-06a7-e9fe-30762524165b	1413	Čemšenik
00050000-5535-06a7-8f3b-af968432a8cf	5253	Čepovan
00050000-5535-06a7-82a7-e2a7722b765c	9232	Črenšovci
00050000-5535-06a7-6269-1a6c79903f57	2393	Črna na Koroškem
00050000-5535-06a7-4e1f-38204d84b19e	6275	Črni Kal
00050000-5535-06a7-0c21-2e05b15402b5	5274	Črni Vrh nad Idrijo
00050000-5535-06a7-d512-f2d9637f45e2	5262	Črniče
00050000-5535-06a7-538c-1a3e5d2a76d5	8340	Črnomelj
00050000-5535-06a7-803f-67d7ff7dcb02	6271	Dekani
00050000-5535-06a7-00d9-a318f831406c	5210	Deskle
00050000-5535-06a7-7010-31208a764793	2253	Destrnik
00050000-5535-06a7-2e3a-612ba63fe21e	6215	Divača
00050000-5535-06a7-dd93-1b6c094377dd	1233	Dob
00050000-5535-06a7-9d47-4d7c11e43343	3224	Dobje pri Planini
00050000-5535-06a7-ec37-ef7350778b11	8257	Dobova
00050000-5535-06a7-ce6a-08eeec77ad79	1423	Dobovec
00050000-5535-06a7-6cc4-a52fd232c229	5263	Dobravlje
00050000-5535-06a7-de51-dfb7bd2850b6	3204	Dobrna
00050000-5535-06a7-6f72-c015e7a95fbd	8211	Dobrnič
00050000-5535-06a7-53e1-fc870f2fc102	1356	Dobrova
00050000-5535-06a7-9104-b9a0e39e30d2	9223	Dobrovnik/Dobronak 
00050000-5535-06a7-8cc6-6185ca18f561	5212	Dobrovo v Brdih
00050000-5535-06a7-6769-1d049d606e93	1431	Dol pri Hrastniku
00050000-5535-06a7-b9c3-4dc195844fa5	1262	Dol pri Ljubljani
00050000-5535-06a7-a50e-6b3383940f8e	1273	Dole pri Litiji
00050000-5535-06a7-9363-2f3268dc818a	1331	Dolenja vas
00050000-5535-06a7-3e82-88cd454521ad	8350	Dolenjske Toplice
00050000-5535-06a7-74ea-305ea3bfd399	1230	Domžale
00050000-5535-06a7-f0f6-0ed81d24c164	2252	Dornava
00050000-5535-06a7-ae75-c70fb6b8b529	5294	Dornberk
00050000-5535-06a7-7d87-399c087124db	1319	Draga
00050000-5535-06a7-8063-fde7554c86c2	8343	Dragatuš
00050000-5535-06a7-a46a-e2cb7e5c4805	3222	Dramlje
00050000-5535-06a7-f452-b2fdec3ebd5c	2370	Dravograd
00050000-5535-06a7-bb86-e5201bee2b9b	4203	Duplje
00050000-5535-06a7-6f1c-85b187632ac8	6221	Dutovlje
00050000-5535-06a7-c4aa-2dae1efbb636	8361	Dvor
00050000-5535-06a7-fc7f-70ee9a6ba3a9	2343	Fala
00050000-5535-06a7-3a87-576985084dbe	9208	Fokovci
00050000-5535-06a7-1287-6786d098c464	2313	Fram
00050000-5535-06a7-86d7-c1d42e8127c8	3213	Frankolovo
00050000-5535-06a7-5e72-25640d4125e0	1274	Gabrovka
00050000-5535-06a7-781c-c6339f6a41c9	8254	Globoko
00050000-5535-06a7-9ba9-e7785cf99257	5275	Godovič
00050000-5535-06a7-78d5-6fd46c9e3922	4204	Golnik
00050000-5535-06a7-cde5-8be854c1e32b	3303	Gomilsko
00050000-5535-06a7-efc5-a112ffe1b0ee	4224	Gorenja vas
00050000-5535-06a7-2ce5-3eaabb81049c	3263	Gorica pri Slivnici
00050000-5535-06a7-b0fa-89c5886a9d91	2272	Gorišnica
00050000-5535-06a7-3a1e-70634e52dfd7	9250	Gornja Radgona
00050000-5535-06a7-1887-d3b624c044b1	3342	Gornji Grad
00050000-5535-06a7-874e-eef0411515ff	4282	Gozd Martuljek
00050000-5535-06a7-d4cc-266ed26e2915	6272	Gračišče
00050000-5535-06a7-48f4-3dae084398ca	9264	Grad
00050000-5535-06a7-a4cb-b7f012cb03b0	8332	Gradac
00050000-5535-06a7-2c0b-42c9597d9344	1384	Grahovo
00050000-5535-06a7-f8c7-0585c3fbdf20	5242	Grahovo ob Bači
00050000-5535-06a7-4238-3057007350f3	5251	Grgar
00050000-5535-06a7-f8f6-a4e93d7ed5f5	3302	Griže
00050000-5535-06a7-796b-79c0f68f9f44	3231	Grobelno
00050000-5535-06a7-7d52-76ee15fc374d	1290	Grosuplje
00050000-5535-06a7-5fa7-b73a50a9c4a7	2288	Hajdina
00050000-5535-06a7-b39d-545a16d59153	8362	Hinje
00050000-5535-06a7-eb8a-4694baaf751d	2311	Hoče
00050000-5535-06a7-d2ab-71bb185aa3ef	9205	Hodoš/Hodos
00050000-5535-06a7-c167-f6abfe8d27a3	1354	Horjul
00050000-5535-06a7-4893-3da2b6865313	1372	Hotedršica
00050000-5535-06a7-1150-c64b8ee9da9a	1430	Hrastnik
00050000-5535-06a7-9224-6a060214e75e	6225	Hruševje
00050000-5535-06a7-26b7-a310dce8ae86	4276	Hrušica
00050000-5535-06a7-d722-9df801fd6e8c	5280	Idrija
00050000-5535-06a7-1fa6-6cec8a261da4	1292	Ig
00050000-5535-06a7-e02d-03ae641b2819	6250	Ilirska Bistrica
00050000-5535-06a7-1e17-c32d575f2f35	6251	Ilirska Bistrica-Trnovo
00050000-5535-06a7-5882-bc20b5e70f2e	1295	Ivančna Gorica
00050000-5535-06a7-6478-aaf2dd06c7e0	2259	Ivanjkovci
00050000-5535-06a7-cc2d-f6cd3133071f	1411	Izlake
00050000-5535-06a7-a817-c5ab608bb592	6310	Izola/Isola
00050000-5535-06a7-59ef-2c388702d7e5	2222	Jakobski Dol
00050000-5535-06a7-4270-5eae8192be63	2221	Jarenina
00050000-5535-06a7-f4ab-470286ba2601	6254	Jelšane
00050000-5535-06a7-a56b-1a1b4d21e9ad	4270	Jesenice
00050000-5535-06a7-1507-e273eceb0b19	8261	Jesenice na Dolenjskem
00050000-5535-06a7-3304-f74e427b3204	3273	Jurklošter
00050000-5535-06a7-1b4c-c0a13d7f9640	2223	Jurovski Dol
00050000-5535-06a7-b077-2829481827b1	2256	Juršinci
00050000-5535-06a7-6a4a-00405f9eafe0	5214	Kal nad Kanalom
00050000-5535-06a7-b3c1-22a7d7eef020	3233	Kalobje
00050000-5535-06a7-088b-77a4842c982b	4246	Kamna Gorica
00050000-5535-06a7-8087-3e4c182de319	2351	Kamnica
00050000-5535-06a7-34f2-6adee6bd53f0	1241	Kamnik
00050000-5535-06a7-7e69-70f5988bee71	5213	Kanal
00050000-5535-06a7-310d-81cc20ae1c90	8258	Kapele
00050000-5535-06a7-fecf-62dc3f03625b	2362	Kapla
00050000-5535-06a7-0e13-65a91e92b82f	2325	Kidričevo
00050000-5535-06a7-7bee-bee7729d0e5f	1412	Kisovec
00050000-5535-06a7-0d46-e84ec32d3b81	6253	Knežak
00050000-5535-06a7-8f7d-9fe44e47d050	5222	Kobarid
00050000-5535-06a7-31fc-342786a6be8a	9227	Kobilje
00050000-5535-06a7-260b-accea9f7160c	1330	Kočevje
00050000-5535-06a7-7965-5f15fa14ac0b	1338	Kočevska Reka
00050000-5535-06a7-9001-f82a4bb13bac	2276	Kog
00050000-5535-06a7-a409-07f8e37046e3	5211	Kojsko
00050000-5535-06a7-e0e5-9a4e483e4ae6	6223	Komen
00050000-5535-06a7-9130-9d6150c3ff07	1218	Komenda
00050000-5535-06a7-b454-8d1a6d7d85ac	6000	Koper/Capodistria 
00050000-5535-06a7-b37e-37da425e8fe1	6001	Koper/Capodistria - poštni predali
00050000-5535-06a7-a50a-9e7dd9b6aec7	8282	Koprivnica
00050000-5535-06a7-b341-9bb2fd2c91a3	5296	Kostanjevica na Krasu
00050000-5535-06a7-5bf2-78683f135113	8311	Kostanjevica na Krki
00050000-5535-06a7-54f1-0f997915ec50	1336	Kostel
00050000-5535-06a7-e085-5fca6cf9452d	6256	Košana
00050000-5535-06a7-da52-d4687e4d1543	2394	Kotlje
00050000-5535-06a7-e203-2af0623eb00f	6240	Kozina
00050000-5535-06a7-dace-3558b48ef385	3260	Kozje
00050000-5535-06a7-0505-490df8643f26	4000	Kranj 
00050000-5535-06a7-a70c-349852d115cd	4001	Kranj - poštni predali
00050000-5535-06a7-0c2b-6795ee62ba1b	4280	Kranjska Gora
00050000-5535-06a7-4828-2fd2236be2cc	1281	Kresnice
00050000-5535-06a7-4132-7a43849a45d8	4294	Križe
00050000-5535-06a7-b8da-de66fe68d223	9206	Križevci
00050000-5535-06a7-e0d6-d161dcfc2fc1	9242	Križevci pri Ljutomeru
00050000-5535-06a7-bd91-5d2a30792337	1301	Krka
00050000-5535-06a7-620c-e83172ad3b02	8296	Krmelj
00050000-5535-06a7-d5ab-252fb4439cdb	4245	Kropa
00050000-5535-06a7-0d2a-92709d51055e	8262	Krška vas
00050000-5535-06a7-3078-a93945bcece5	8270	Krško
00050000-5535-06a7-ddaf-0363ed515d09	9263	Kuzma
00050000-5535-06a7-dc6e-df6daf458c58	2318	Laporje
00050000-5535-06a7-2b53-7a72f1239bb7	3270	Laško
00050000-5535-06a7-0fbb-19a4ac86a171	1219	Laze v Tuhinju
00050000-5535-06a7-ca6c-32664e8b95ab	2230	Lenart v Slovenskih goricah
00050000-5535-06a7-2bfa-38d38b429c12	9220	Lendava/Lendva
00050000-5535-06a7-b918-0f15d4568ac0	4248	Lesce
00050000-5535-06a7-e500-43ddf3456390	3261	Lesično
00050000-5535-06a7-0e81-0924784667ff	8273	Leskovec pri Krškem
00050000-5535-06a7-21d1-814b77a66f95	2372	Libeliče
00050000-5535-06a7-163b-37782a0a49f4	2341	Limbuš
00050000-5535-06a7-c2f4-8f0d2969e747	1270	Litija
00050000-5535-06a7-9938-cf3f4e8b18a9	3202	Ljubečna
00050000-5535-06a7-e9c4-cba6cbe5957d	1000	Ljubljana 
00050000-5535-06a7-76b2-d50404079bfc	1001	Ljubljana - poštni predali
00050000-5535-06a7-0b00-325fef2a1592	1231	Ljubljana - Črnuče
00050000-5535-06a7-4d16-bc27e5b407d9	1261	Ljubljana - Dobrunje
00050000-5535-06a7-7667-88da81af32ea	1260	Ljubljana - Polje
00050000-5535-06a7-b3bf-3fcef3bba755	1210	Ljubljana - Šentvid
00050000-5535-06a7-3cc0-e017e1ca4e29	1211	Ljubljana - Šmartno
00050000-5535-06a7-ab31-403b39ce63a2	3333	Ljubno ob Savinji
00050000-5535-06a7-1ba3-f65de33acd9b	9240	Ljutomer
00050000-5535-06a7-1248-cae3dcf4edef	3215	Loče
00050000-5535-06a7-2ebc-22f2724637ad	5231	Log pod Mangartom
00050000-5535-06a7-8588-b572070f891f	1358	Log pri Brezovici
00050000-5535-06a7-99a2-6a52fe5eec1f	1370	Logatec
00050000-5535-06a7-f0e5-4006b8dc0412	1371	Logatec
00050000-5535-06a7-ab33-2625ddfc208b	1434	Loka pri Zidanem Mostu
00050000-5535-06a7-9b3d-869e0bc1cf5d	3223	Loka pri Žusmu
00050000-5535-06a7-8de9-867e9658a92b	6219	Lokev
00050000-5535-06a7-257c-7900c4d4e56a	1318	Loški Potok
00050000-5535-06a7-f9e2-fb03f9fc9b94	2324	Lovrenc na Dravskem polju
00050000-5535-06a7-d099-d312ba4d62c7	2344	Lovrenc na Pohorju
00050000-5535-06a7-844f-1ea4aa0d83c7	3334	Luče
00050000-5535-06a7-a8e8-5a0354f3b02d	1225	Lukovica
00050000-5535-06a7-fb1f-2c513f254f36	9202	Mačkovci
00050000-5535-06a7-0477-8d56d94fa178	2322	Majšperk
00050000-5535-06a7-ff35-ec91216e0f5c	2321	Makole
00050000-5535-06a7-b162-d8f2c63632b3	9243	Mala Nedelja
00050000-5535-06a7-7eb3-327b2717e53e	2229	Malečnik
00050000-5535-06a7-c8eb-eb1cf1aa5e28	6273	Marezige
00050000-5535-06a7-5ac3-876aec205b52	2000	Maribor 
00050000-5535-06a7-2f2b-f88732ad5003	2001	Maribor - poštni predali
00050000-5535-06a7-149f-a626fa6626d7	2206	Marjeta na Dravskem polju
00050000-5535-06a7-4b61-6fcc1b228f48	2281	Markovci
00050000-5535-06a7-d5fc-2c06013ed512	9221	Martjanci
00050000-5535-06a7-2fe2-c28a6a0a7ab0	6242	Materija
00050000-5535-06a7-32f8-c53d8a518664	4211	Mavčiče
00050000-5535-06a7-d744-6e6a56a7d7c9	1215	Medvode
00050000-5535-06a7-5c5a-c1bdf0c0f9e8	1234	Mengeš
00050000-5535-06a7-159e-733918258d2d	8330	Metlika
00050000-5535-06a7-3a8c-dc9efa1e8830	2392	Mežica
00050000-5535-06a7-9a54-e92b80315681	2204	Miklavž na Dravskem polju
00050000-5535-06a7-8a5d-f700eb951c79	2275	Miklavž pri Ormožu
00050000-5535-06a7-8dc2-5736a00b9d18	5291	Miren
00050000-5535-06a7-1967-01b85fe48bae	8233	Mirna
00050000-5535-06a7-88d6-6064bde0ca1e	8216	Mirna Peč
00050000-5535-06a7-89f4-bbd0e4f0f58d	2382	Mislinja
00050000-5535-06a7-ccf3-7589260296b5	4281	Mojstrana
00050000-5535-06a7-5258-dbe65693f3d5	8230	Mokronog
00050000-5535-06a7-9ed3-d56dafc8046a	1251	Moravče
00050000-5535-06a7-956b-391ace705fde	9226	Moravske Toplice
00050000-5535-06a7-2057-3a83d7880ea0	5216	Most na Soči
00050000-5535-06a7-6528-0cc2b6efcdf9	1221	Motnik
00050000-5535-06a7-ce51-6240e0f46245	3330	Mozirje
00050000-5535-06a7-2070-3be95d040ae7	9000	Murska Sobota 
00050000-5535-06a7-627e-ce8710afb3fa	9001	Murska Sobota - poštni predali
00050000-5535-06a7-e839-ad9c23c8a3b8	2366	Muta
00050000-5535-06a7-e51b-057dd6867b44	4202	Naklo
00050000-5535-06a7-93c0-f1184b95dad2	3331	Nazarje
00050000-5535-06a7-1c8b-ae787d35a726	1357	Notranje Gorice
00050000-5535-06a7-4ee3-005267a0e359	3203	Nova Cerkev
00050000-5535-06a7-8ed0-8d07327421f1	5000	Nova Gorica 
00050000-5535-06a7-fec3-5bf170a9fbf3	5001	Nova Gorica - poštni predali
00050000-5535-06a7-ba63-170a709b8fcb	1385	Nova vas
00050000-5535-06a7-866c-05eec34ce3b4	8000	Novo mesto
00050000-5535-06a7-e26e-961105a5d0fb	8001	Novo mesto - poštni predali
00050000-5535-06a7-cc72-f486923fb03c	6243	Obrov
00050000-5535-06a7-1367-f74b2b2b4bb8	9233	Odranci
00050000-5535-06a7-2229-39d13ee96b15	2317	Oplotnica
00050000-5535-06a7-3b79-b73918f19946	2312	Orehova vas
00050000-5535-06a7-e8c7-dae27bc6b788	2270	Ormož
00050000-5535-06a7-3364-cb4676459813	1316	Ortnek
00050000-5535-06a7-3a1c-5c466dac9e32	1337	Osilnica
00050000-5535-06a7-d513-543d1406754e	8222	Otočec
00050000-5535-06a7-d191-545b81b63b18	2361	Ožbalt
00050000-5535-06a7-9f1c-33b97f4bb775	2231	Pernica
00050000-5535-06a7-e5cc-e342a2a5e2ad	2211	Pesnica pri Mariboru
00050000-5535-06a7-6a1f-f50b62d19bab	9203	Petrovci
00050000-5535-06a7-0bf1-34b9118a5940	3301	Petrovče
00050000-5535-06a7-ee8b-5c413d19d5c8	6330	Piran/Pirano
00050000-5535-06a7-75b4-cf12525168a4	8255	Pišece
00050000-5535-06a7-ab04-edb7b1cb5cb6	6257	Pivka
00050000-5535-06a7-7af6-9c72f199ef5c	6232	Planina
00050000-5535-06a7-17d6-d088b65c5a44	3225	Planina pri Sevnici
00050000-5535-06a7-c1ad-cd9f228cde13	6276	Pobegi
00050000-5535-06a7-35a8-9896c9d9ac40	8312	Podbočje
00050000-5535-06a7-69bc-34390bf7bd76	5243	Podbrdo
00050000-5535-06a7-0e10-ecb62a86b1f9	3254	Podčetrtek
00050000-5535-06a7-02aa-4700b2ded3bc	2273	Podgorci
00050000-5535-06a7-cf60-a034a4a7b0bc	6216	Podgorje
00050000-5535-06a7-3425-6a9d06e2d8fb	2381	Podgorje pri Slovenj Gradcu
00050000-5535-06a7-3862-2675506fbc05	6244	Podgrad
00050000-5535-06a7-bb3a-bd4a41e56224	1414	Podkum
00050000-5535-06a7-077d-70da6e3c11d4	2286	Podlehnik
00050000-5535-06a7-5ba3-e68ecdb4fd6b	5272	Podnanos
00050000-5535-06a7-a614-de365d6fc63b	4244	Podnart
00050000-5535-06a7-b057-cf9a94fedfa7	3241	Podplat
00050000-5535-06a7-2c7f-822b43c582c0	3257	Podsreda
00050000-5535-06a7-a759-8460679b5346	2363	Podvelka
00050000-5535-06a7-3cd6-7fa4983e66c9	2208	Pohorje
00050000-5535-06a7-8f27-ce467dfd5abc	2257	Polenšak
00050000-5535-06a7-92b1-20fbfed266d0	1355	Polhov Gradec
00050000-5535-06a7-0edc-3d01c40a4d0f	4223	Poljane nad Škofjo Loko
00050000-5535-06a7-d4f3-ae740ae0aba4	2319	Poljčane
00050000-5535-06a7-73eb-52c54fae8999	1272	Polšnik
00050000-5535-06a7-31ca-9a5d8ad554cf	3313	Polzela
00050000-5535-06a7-a158-522659b405cf	3232	Ponikva
00050000-5535-06a7-97cc-29e24f0bfbc1	6320	Portorož/Portorose
00050000-5535-06a7-f917-e9695c26535b	6230	Postojna
00050000-5535-06a7-8354-c1df3ec6893d	2331	Pragersko
00050000-5535-06a7-8943-934e03a4e37d	3312	Prebold
00050000-5535-06a7-977d-0e6a80dec97d	4205	Preddvor
00050000-5535-06a7-bdce-ac28bb91554a	6255	Prem
00050000-5535-06a7-9812-6ff45d4fa0a9	1352	Preserje
00050000-5535-06a7-f770-e6c7c0e2ca27	6258	Prestranek
00050000-5535-06a7-8ef6-a0cf97ca0409	2391	Prevalje
00050000-5535-06a7-3a45-8e2f5c14955c	3262	Prevorje
00050000-5535-06a7-e325-56032ac59cb7	1276	Primskovo 
00050000-5535-06a7-c514-b70f8cb9c310	3253	Pristava pri Mestinju
00050000-5535-06a7-0c68-8b03afbbe083	9207	Prosenjakovci/Partosfalva
00050000-5535-06a7-c2b3-fa3fd3b4082f	5297	Prvačina
00050000-5535-06a7-434c-042d29fdc06a	2250	Ptuj
00050000-5535-06a7-77d3-70ee4e4d27e0	2323	Ptujska Gora
00050000-5535-06a7-6dd1-84da9a666a04	9201	Puconci
00050000-5535-06a7-c9c0-201101976590	2327	Rače
00050000-5535-06a7-2b85-d47af50ff232	1433	Radeče
00050000-5535-06a7-8c25-4caf3ad0c491	9252	Radenci
00050000-5535-06a7-d1c3-680a3800f377	2360	Radlje ob Dravi
00050000-5535-06a7-c900-d016f0c1499f	1235	Radomlje
00050000-5535-06a7-9348-53622a221637	4240	Radovljica
00050000-5535-06a7-697e-997b71387708	8274	Raka
00050000-5535-06a7-47a9-3cbdf38caa06	1381	Rakek
00050000-5535-06a7-7c71-a7cf9ab3691e	4283	Rateče - Planica
00050000-5535-06a7-c7f0-1720a896e688	2390	Ravne na Koroškem
00050000-5535-06a7-8abf-ca279c439b9f	9246	Razkrižje
00050000-5535-06a7-c5ca-f0efe33cc6f8	3332	Rečica ob Savinji
00050000-5535-06a7-3ae0-599e038bc55a	5292	Renče
00050000-5535-06a7-7224-026fcb046c90	1310	Ribnica
00050000-5535-06a7-9e13-99798cbceef1	2364	Ribnica na Pohorju
00050000-5535-06a7-694e-f1cbeb7edb41	3272	Rimske Toplice
00050000-5535-06a7-8393-381111a084fa	1314	Rob
00050000-5535-06a7-3975-970eed8027c1	5215	Ročinj
00050000-5535-06a7-ca52-ec6b9d5b8684	3250	Rogaška Slatina
00050000-5535-06a7-be26-1bf86edad988	9262	Rogašovci
00050000-5535-06a7-16e1-17a152ee1767	3252	Rogatec
00050000-5535-06a7-8c97-3d92a1536473	1373	Rovte
00050000-5535-06a7-615b-d7c00efe995c	2342	Ruše
00050000-5535-06a7-a4ff-d15b8127c3ff	1282	Sava
00050000-5535-06a7-7936-40219fd43a5e	6333	Sečovlje/Sicciole
00050000-5535-06a7-8534-5ddb044e3e59	4227	Selca
00050000-5535-06a7-7424-4e927e367a4a	2352	Selnica ob Dravi
00050000-5535-06a7-3d30-597bded4d623	8333	Semič
00050000-5535-06a7-479b-74fe40f716b0	8281	Senovo
00050000-5535-06a7-0b44-cab444cdc6cb	6224	Senožeče
00050000-5535-06a7-5596-1312790be73c	8290	Sevnica
00050000-5535-06a7-1455-2f0fbae3f3e0	6210	Sežana
00050000-5535-06a7-94d7-50bbff3acc9b	2214	Sladki Vrh
00050000-5535-06a7-027b-1a559389d37d	5283	Slap ob Idrijci
00050000-5535-06a7-80ee-ceabeb231364	2380	Slovenj Gradec
00050000-5535-06a7-5f87-9bae6f3e3450	2310	Slovenska Bistrica
00050000-5535-06a7-44d9-badaf8ba2a11	3210	Slovenske Konjice
00050000-5535-06a7-5bf6-b978b87f885e	1216	Smlednik
00050000-5535-06a7-2385-21522e6941cf	5232	Soča
00050000-5535-06a7-2715-3ebaf64ba62c	1317	Sodražica
00050000-5535-06a7-eb44-bc0d29892ca7	3335	Solčava
00050000-5535-06a7-2dfb-e5ce931d16b6	5250	Solkan
00050000-5535-06a7-3cb1-5b0d763ff6de	4229	Sorica
00050000-5535-06a7-cb29-d081b0d99a4d	4225	Sovodenj
00050000-5535-06a7-c6d4-4e54b81ba413	5281	Spodnja Idrija
00050000-5535-06a7-d876-543b83489b81	2241	Spodnji Duplek
00050000-5535-06a7-0a8a-cdf4e92b4fe6	9245	Spodnji Ivanjci
00050000-5535-06a7-1c51-aef443690248	2277	Središče ob Dravi
00050000-5535-06a7-4839-875df30b644a	4267	Srednja vas v Bohinju
00050000-5535-06a7-9c4e-bb13fa9e5f3a	8256	Sromlje 
00050000-5535-06a7-de01-b6f829b08a91	5224	Srpenica
00050000-5535-06a7-98ec-f18a5c299b45	1242	Stahovica
00050000-5535-06a7-c510-cdc652889cd8	1332	Stara Cerkev
00050000-5535-06a7-c06a-158280634d2f	8342	Stari trg ob Kolpi
00050000-5535-06a7-b60b-eab2648f1dda	1386	Stari trg pri Ložu
00050000-5535-06a7-4bef-5754e7487846	2205	Starše
00050000-5535-06a7-34e7-5901fe1b152a	2289	Stoperce
00050000-5535-06a7-5751-179ff9980888	8322	Stopiče
00050000-5535-06a7-43c2-d1ae0105304a	3206	Stranice
00050000-5535-06a7-4b4e-29a0b48d70eb	8351	Straža
00050000-5535-06a7-df4b-93423499ca19	1313	Struge
00050000-5535-06a7-caaa-473b62098d40	8293	Studenec
00050000-5535-06a7-d7b2-01bd8ae84ea2	8331	Suhor
00050000-5535-06a7-0663-f419a4a478fe	2233	Sv. Ana v Slovenskih goricah
00050000-5535-06a7-37bb-e5a59d5e5279	2235	Sv. Trojica v Slovenskih goricah
00050000-5535-06a7-1a5f-3ef3c51b6dee	2353	Sveti Duh na Ostrem Vrhu
00050000-5535-06a7-c001-2f9a842daef4	9244	Sveti Jurij ob Ščavnici
00050000-5535-06a7-385e-00d824fe9b60	3264	Sveti Štefan
00050000-5535-06a7-b214-0d8237f98edf	2258	Sveti Tomaž
00050000-5535-06a7-7fb3-cfdf67b51519	9204	Šalovci
00050000-5535-06a7-785d-f2249aa9e3df	5261	Šempas
00050000-5535-06a7-8eb8-fc6f6ec0fed3	5290	Šempeter pri Gorici
00050000-5535-06a7-acc1-cb22c5666063	3311	Šempeter v Savinjski dolini
00050000-5535-06a7-89a5-1011b211fe6b	4208	Šenčur
00050000-5535-06a7-9fbb-c722c5cd6237	2212	Šentilj v Slovenskih goricah
00050000-5535-06a7-4926-e3960a06fce1	8297	Šentjanž
00050000-5535-06a7-c2e1-6e2f5dae1ac3	2373	Šentjanž pri Dravogradu
00050000-5535-06a7-cbf8-9350b07982e0	8310	Šentjernej
00050000-5535-06a7-535d-973154acafea	3230	Šentjur
00050000-5535-06a7-d797-7c7d5a6f41d3	3271	Šentrupert
00050000-5535-06a7-dd32-237171f772c3	8232	Šentrupert
00050000-5535-06a7-eafb-e174a2b3db12	1296	Šentvid pri Stični
00050000-5535-06a7-f13c-546e3ff11ede	8275	Škocjan
00050000-5535-06a7-2c68-9d955564e69f	6281	Škofije
00050000-5535-06a7-5547-23457203d4ed	4220	Škofja Loka
00050000-5535-06a7-81d1-689973fa3ac2	3211	Škofja vas
00050000-5535-06a7-e9a6-76cd3557cc4a	1291	Škofljica
00050000-5535-06a7-ec10-b53015a1d4ed	6274	Šmarje
00050000-5535-06a7-86d2-bcb9f3e069de	1293	Šmarje - Sap
00050000-5535-06a7-6089-f990c90f935d	3240	Šmarje pri Jelšah
00050000-5535-06a7-d80f-79c6b433f6e8	8220	Šmarješke Toplice
00050000-5535-06a7-2ada-bd1c90f79355	2315	Šmartno na Pohorju
00050000-5535-06a7-f992-9fcdffc3a9e7	3341	Šmartno ob Dreti
00050000-5535-06a7-fbac-5635a23e3a88	3327	Šmartno ob Paki
00050000-5535-06a7-cc5c-c37a79b2abd1	1275	Šmartno pri Litiji
00050000-5535-06a7-c6a4-e9cce99dcecd	2383	Šmartno pri Slovenj Gradcu
00050000-5535-06a7-0133-188a1bcef78a	3201	Šmartno v Rožni dolini
00050000-5535-06a7-a7a2-a2f26883d1ff	3325	Šoštanj
00050000-5535-06a7-e921-ad67bdb51f74	6222	Štanjel
00050000-5535-06a7-87b8-b6e2ebceff35	3220	Štore
00050000-5535-06a7-c5f8-0bc3d7fe45aa	3304	Tabor
00050000-5535-06a7-a7d2-ec1b7ace11ee	3221	Teharje
00050000-5535-06a7-4f7d-d3dfd22f2218	9251	Tišina
00050000-5535-06a7-c7db-a58532ca611f	5220	Tolmin
00050000-5535-06a7-e7c8-23f8fc20d0c1	3326	Topolšica
00050000-5535-06a7-4a53-f12cec923633	2371	Trbonje
00050000-5535-06a7-45e4-1ae9087b9c2b	1420	Trbovlje
00050000-5535-06a7-6e87-368c0fd0fa0c	8231	Trebelno 
00050000-5535-06a7-035e-753538f4b8d7	8210	Trebnje
00050000-5535-06a7-1a40-82241fde4c67	5252	Trnovo pri Gorici
00050000-5535-06a7-325b-5dba0ff9b111	2254	Trnovska vas
00050000-5535-06a7-7364-3a7558362934	1222	Trojane
00050000-5535-06a7-e31f-862daec21616	1236	Trzin
00050000-5535-06a7-fb7e-fbb3a0bd97cf	4290	Tržič
00050000-5535-06a7-7bcc-26037d068937	8295	Tržišče
00050000-5535-06a7-8614-41478d23ca9c	1311	Turjak
00050000-5535-06a7-a9a7-2f00cfb772dd	9224	Turnišče
00050000-5535-06a7-4aed-190939ecc8be	8323	Uršna sela
00050000-5535-06a7-be90-6ea015b8c133	1252	Vače
00050000-5535-06a7-2f26-be3ef892187e	3320	Velenje 
00050000-5535-06a7-5f89-8c68dc999396	3322	Velenje - poštni predali
00050000-5535-06a7-2385-c1771610c8fb	8212	Velika Loka
00050000-5535-06a7-adcc-e03a739f7764	2274	Velika Nedelja
00050000-5535-06a7-602d-68a44f776d9d	9225	Velika Polana
00050000-5535-06a7-7d96-2eb43866a0dd	1315	Velike Lašče
00050000-5535-06a7-5ca1-2b8ef0f1a7d2	8213	Veliki Gaber
00050000-5535-06a7-119f-ccec12f05c7c	9241	Veržej
00050000-5535-06a7-b78a-e884ea369eeb	1312	Videm - Dobrepolje
00050000-5535-06a7-4cbd-01444d811fb4	2284	Videm pri Ptuju
00050000-5535-06a7-387a-a1a99eb94f73	8344	Vinica
00050000-5535-06a7-4fda-79f0d55a51af	5271	Vipava
00050000-5535-06a7-6808-31741ddcd4a0	4212	Visoko
00050000-5535-06a7-dc89-028d8cb3cf48	1294	Višnja Gora
00050000-5535-06a7-f222-a834f2842d35	3205	Vitanje
00050000-5535-06a7-b84a-f76a2ce8884e	2255	Vitomarci
00050000-5535-06a7-1174-8855a99365c9	1217	Vodice
00050000-5535-06a7-c748-f4fce6e6c065	3212	Vojnik\t
00050000-5535-06a7-a662-3b7ee325f013	5293	Volčja Draga
00050000-5535-06a7-76e2-587f9c24b4f8	2232	Voličina
00050000-5535-06a7-21cf-ac40b09ab097	3305	Vransko
00050000-5535-06a7-d2fd-f31eb15a08c2	6217	Vremski Britof
00050000-5535-06a7-dff9-465735ee3b63	1360	Vrhnika
00050000-5535-06a7-85e4-f376e22eac88	2365	Vuhred
00050000-5535-06a7-6432-359948cb7101	2367	Vuzenica
00050000-5535-06a7-3b47-ca564df67fb2	8292	Zabukovje 
00050000-5535-06a7-5245-9621e906a463	1410	Zagorje ob Savi
00050000-5535-06a7-5e1a-f57695d6f68e	1303	Zagradec
00050000-5535-06a7-d22b-eb47dd81bed4	2283	Zavrč
00050000-5535-06a7-2232-3fea806c3669	8272	Zdole 
00050000-5535-06a7-3989-1f4c4b5e2b54	4201	Zgornja Besnica
00050000-5535-06a7-d8c6-3c83a12d129b	2242	Zgornja Korena
00050000-5535-06a7-8835-f9a5a92f5d63	2201	Zgornja Kungota
00050000-5535-06a7-6b91-4bb683e373aa	2316	Zgornja Ložnica
00050000-5535-06a7-6d32-c6e976b035d9	2314	Zgornja Polskava
00050000-5535-06a7-9b4e-20ec42d70642	2213	Zgornja Velka
00050000-5535-06a7-1082-e4f88b810589	4247	Zgornje Gorje
00050000-5535-06a7-ef83-d84ea12611a0	4206	Zgornje Jezersko
00050000-5535-06a7-4072-0b567ef9d101	2285	Zgornji Leskovec
00050000-5535-06a7-5d67-d575e3008bd4	1432	Zidani Most
00050000-5535-06a7-9fad-d15f85787024	3214	Zreče
00050000-5535-06a7-4584-8269380f3b3b	4209	Žabnica
00050000-5535-06a7-42f0-662bf305ed89	3310	Žalec
00050000-5535-06a7-28cd-68bc26aa59af	4228	Železniki
00050000-5535-06a7-71df-b316b3b75c31	2287	Žetale
00050000-5535-06a7-5215-1fc5a11a526a	4226	Žiri
00050000-5535-06a7-b3e5-46471487de56	4274	Žirovnica
00050000-5535-06a7-b100-c405a546fc0e	8360	Žužemberk
\.


--
-- TOC entry 2618 (class 0 OID 525842)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2601 (class 0 OID 525665)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2606 (class 0 OID 525731)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2620 (class 0 OID 525854)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 525959)
-- Dependencies: 214
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 526003)
-- Dependencies: 218
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 525883)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2616 (class 0 OID 525827)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2615 (class 0 OID 525817)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 525993)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 525949)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2589 (class 0 OID 525533)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5535-06a9-84c6-ddb7594ea055	00010000-5535-06a9-40d4-0897d23a3d71	2015-04-20 16:01:14	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROgYBpBxmu3hw75StrcRC/nHchipMZdPW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2625 (class 0 OID 525892)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2593 (class 0 OID 525570)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5535-06a9-2a7f-73c22b84bfea	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5535-06a9-ced5-883e11651222	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5535-06a9-178b-77ddbc75f13e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5535-06a9-1253-a042b9765436	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5535-06a9-86c1-f989d8b6b749	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5535-06a9-cab9-d0fa0c8069db	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2591 (class 0 OID 525554)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5535-06a9-84c6-ddb7594ea055	00000000-5535-06a9-1253-a042b9765436
00010000-5535-06a9-60c3-192aba517e71	00000000-5535-06a9-178b-77ddbc75f13e
\.


--
-- TOC entry 2627 (class 0 OID 525906)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2619 (class 0 OID 525848)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2613 (class 0 OID 525798)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2598 (class 0 OID 525630)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2614 (class 0 OID 525804)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 525984)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2604 (class 0 OID 525700)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2590 (class 0 OID 525542)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-5535-06a9-40d4-0897d23a3d71	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxROVb8eMwd7rGjsokAf0VIpiLlOkCFA8/S	t	\N	\N	\N	rootmail@max.si
00010000-5535-06a9-60c3-192aba517e71	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxROVI6D0zIYyd9PA/IdlcSGYVlIQbBwUz6	t	\N	\N	\N	noreply@max.si
00010000-5535-06a9-84c6-ddb7594ea055	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2639 (class 0 OID 526034)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2608 (class 0 OID 525746)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2623 (class 0 OID 525875)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 525941)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2610 (class 0 OID 525774)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 526024)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 525931)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2236 (class 2606 OID 525595)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 526073)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 526066)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 525983)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 525764)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 525797)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 525726)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 525927)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 525744)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 525791)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 525627)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 525840)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 525867)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 525698)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 525604)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 525662)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2234 (class 2606 OID 525584)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2227 (class 2606 OID 525569)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 525873)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 525905)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 526020)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 525655)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 525686)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 525846)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 525677)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 525735)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 525858)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 525965)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 526008)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 525890)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 2606 OID 525831)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 525822)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 526002)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 525956)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 525541)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 525896)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 525558)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2229 (class 2606 OID 525578)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 525914)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 525853)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 525803)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 525634)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 525813)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 525992)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 525711)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 525552)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 526048)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 525750)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 525881)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 525947)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 525786)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 526033)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 525940)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 1259 OID 525771)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2249 (class 1259 OID 525657)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2339 (class 1259 OID 525874)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2333 (class 1259 OID 525860)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2334 (class 1259 OID 525859)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2285 (class 1259 OID 525751)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2360 (class 1259 OID 525930)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2361 (class 1259 OID 525928)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2362 (class 1259 OID 525929)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2385 (class 1259 OID 526021)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2386 (class 1259 OID 526022)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 526023)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2392 (class 1259 OID 526051)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2393 (class 1259 OID 526050)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2394 (class 1259 OID 526049)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2267 (class 1259 OID 525713)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2268 (class 1259 OID 525712)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2253 (class 1259 OID 525664)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2254 (class 1259 OID 525663)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 525897)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2303 (class 1259 OID 525792)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2231 (class 1259 OID 525585)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2232 (class 1259 OID 525586)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2353 (class 1259 OID 525917)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2354 (class 1259 OID 525916)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2355 (class 1259 OID 525915)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2277 (class 1259 OID 525736)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2278 (class 1259 OID 525738)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2279 (class 1259 OID 525737)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2313 (class 1259 OID 525826)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2314 (class 1259 OID 525824)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2315 (class 1259 OID 525823)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2316 (class 1259 OID 525825)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2222 (class 1259 OID 525559)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2223 (class 1259 OID 525560)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2342 (class 1259 OID 525882)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2328 (class 1259 OID 525847)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2368 (class 1259 OID 525957)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2369 (class 1259 OID 525958)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2257 (class 1259 OID 525678)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2258 (class 1259 OID 525679)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2372 (class 1259 OID 525966)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2373 (class 1259 OID 525967)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2403 (class 1259 OID 526076)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 526075)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2405 (class 1259 OID 526078)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 526074)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2407 (class 1259 OID 526077)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2365 (class 1259 OID 525948)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2319 (class 1259 OID 525835)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2320 (class 1259 OID 525834)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2321 (class 1259 OID 525832)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2322 (class 1259 OID 525833)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2241 (class 1259 OID 525628)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2399 (class 1259 OID 526068)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 526067)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2284 (class 1259 OID 525745)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2237 (class 1259 OID 525606)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2238 (class 1259 OID 525605)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2245 (class 1259 OID 525635)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2246 (class 1259 OID 525636)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 525816)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2309 (class 1259 OID 525815)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2310 (class 1259 OID 525814)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2291 (class 1259 OID 525773)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2292 (class 1259 OID 525769)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2293 (class 1259 OID 525766)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2294 (class 1259 OID 525767)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2295 (class 1259 OID 525765)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2296 (class 1259 OID 525770)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2297 (class 1259 OID 525768)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2252 (class 1259 OID 525656)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2273 (class 1259 OID 525727)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2274 (class 1259 OID 525729)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2275 (class 1259 OID 525728)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2276 (class 1259 OID 525730)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2327 (class 1259 OID 525841)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2266 (class 1259 OID 525699)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2219 (class 1259 OID 525553)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2347 (class 1259 OID 525891)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2244 (class 1259 OID 525629)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2263 (class 1259 OID 525687)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2384 (class 1259 OID 526009)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2230 (class 1259 OID 525579)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2298 (class 1259 OID 525772)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2432 (class 2606 OID 526209)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2435 (class 2606 OID 526194)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2434 (class 2606 OID 526199)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2430 (class 2606 OID 526219)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2436 (class 2606 OID 526189)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2431 (class 2606 OID 526214)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2433 (class 2606 OID 526204)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2418 (class 2606 OID 526129)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2453 (class 2606 OID 526304)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2451 (class 2606 OID 526299)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2452 (class 2606 OID 526294)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2429 (class 2606 OID 526184)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2459 (class 2606 OID 526344)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2461 (class 2606 OID 526334)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 526339)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2449 (class 2606 OID 526284)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2470 (class 2606 OID 526379)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2469 (class 2606 OID 526384)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2468 (class 2606 OID 526389)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2471 (class 2606 OID 526404)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2472 (class 2606 OID 526399)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2473 (class 2606 OID 526394)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2423 (class 2606 OID 526159)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2424 (class 2606 OID 526154)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2419 (class 2606 OID 526139)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2420 (class 2606 OID 526134)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 526314)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2437 (class 2606 OID 526224)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2411 (class 2606 OID 526089)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2410 (class 2606 OID 526094)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2456 (class 2606 OID 526329)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2457 (class 2606 OID 526324)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2458 (class 2606 OID 526319)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2427 (class 2606 OID 526164)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2425 (class 2606 OID 526174)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2426 (class 2606 OID 526169)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2441 (class 2606 OID 526259)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2443 (class 2606 OID 526249)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2444 (class 2606 OID 526244)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2442 (class 2606 OID 526254)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2409 (class 2606 OID 526079)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2408 (class 2606 OID 526084)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2454 (class 2606 OID 526309)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2450 (class 2606 OID 526289)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2464 (class 2606 OID 526354)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2463 (class 2606 OID 526359)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2422 (class 2606 OID 526144)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2421 (class 2606 OID 526149)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2466 (class 2606 OID 526364)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 526369)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2478 (class 2606 OID 526429)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2479 (class 2606 OID 526424)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2476 (class 2606 OID 526439)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2480 (class 2606 OID 526419)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2477 (class 2606 OID 526434)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2462 (class 2606 OID 526349)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2445 (class 2606 OID 526279)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2446 (class 2606 OID 526274)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2448 (class 2606 OID 526264)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2447 (class 2606 OID 526269)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2415 (class 2606 OID 526109)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2414 (class 2606 OID 526114)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2474 (class 2606 OID 526414)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2475 (class 2606 OID 526409)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2428 (class 2606 OID 526179)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2467 (class 2606 OID 526374)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2412 (class 2606 OID 526104)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2413 (class 2606 OID 526099)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2417 (class 2606 OID 526119)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2416 (class 2606 OID 526124)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2438 (class 2606 OID 526239)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2439 (class 2606 OID 526234)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2440 (class 2606 OID 526229)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-20 16:01:21 CEST

--
-- PostgreSQL database dump complete
--

