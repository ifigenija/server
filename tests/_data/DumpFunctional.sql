--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-04-22 11:46:40 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 2800867)
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
-- TOC entry 212 (class 1259 OID 2801200)
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
-- TOC entry 213 (class 1259 OID 2801210)
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
-- TOC entry 214 (class 1259 OID 2801227)
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
-- TOC entry 190 (class 1259 OID 2801013)
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
-- TOC entry 191 (class 1259 OID 2801035)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 180 (class 1259 OID 2800876)
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
-- TOC entry 215 (class 1259 OID 2801243)
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
-- TOC entry 192 (class 1259 OID 2801040)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 2801047)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 171 (class 1259 OID 2798066)
-- Name: kose; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kose (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
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
-- TOC entry 199 (class 1259 OID 2801099)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 200 (class 1259 OID 2801105)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 181 (class 1259 OID 2800893)
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
-- TOC entry 182 (class 1259 OID 2800905)
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
-- TOC entry 183 (class 1259 OID 2800916)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
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
-- TOC entry 185 (class 1259 OID 2800961)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 172 (class 1259 OID 2800810)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 2800840)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 2801112)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 2801119)
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
-- TOC entry 216 (class 1259 OID 2801256)
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
-- TOC entry 184 (class 1259 OID 2800941)
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
-- TOC entry 186 (class 1259 OID 2800968)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 2801127)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 170 (class 1259 OID 2789301)
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
-- TOC entry 187 (class 1259 OID 2800976)
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
-- TOC entry 194 (class 1259 OID 2801053)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 2801133)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 2801270)
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
-- TOC entry 218 (class 1259 OID 2801279)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 2801140)
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
-- TOC entry 206 (class 1259 OID 2801149)
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
-- TOC entry 207 (class 1259 OID 2801158)
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
-- TOC entry 219 (class 1259 OID 2801286)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 2801296)
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
-- TOC entry 174 (class 1259 OID 2800821)
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
-- TOC entry 173 (class 1259 OID 2800819)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 208 (class 1259 OID 2801168)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 2800830)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 2800860)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 2801174)
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
-- TOC entry 210 (class 1259 OID 2801186)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 2801061)
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
-- TOC entry 188 (class 1259 OID 2800991)
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
-- TOC entry 198 (class 1259 OID 2801086)
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
-- TOC entry 221 (class 1259 OID 2801306)
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
-- TOC entry 189 (class 1259 OID 2800999)
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
-- TOC entry 177 (class 1259 OID 2800847)
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
-- TOC entry 222 (class 1259 OID 2801315)
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
-- TOC entry 196 (class 1259 OID 2801067)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 211 (class 1259 OID 2801192)
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
-- TOC entry 223 (class 1259 OID 2801333)
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
-- TOC entry 197 (class 1259 OID 2801073)
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
-- TOC entry 224 (class 1259 OID 2801341)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 2801351)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2350 (class 2604 OID 2800824)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2866 (class 0 OID 2800867)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 2801200)
-- Dependencies: 212
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2900 (class 0 OID 2801210)
-- Dependencies: 213
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 2801227)
-- Dependencies: 214
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 2801013)
-- Dependencies: 190
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 2801035)
-- Dependencies: 191
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 2800876)
-- Dependencies: 180
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5537-6df7-1912-4be67907a395	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5537-6df7-8ff5-6a4447fcdd8c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5537-6df7-08fb-205ab3a7cdbe	AL	ALB	008	Albania 	Albanija	\N
00040000-5537-6df7-0829-0de3092628ab	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5537-6df7-a7ed-ee1b8473ff70	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5537-6df7-5efd-0f8ca2f878cc	AD	AND	020	Andorra 	Andora	\N
00040000-5537-6df7-500e-fdcf67a4c60f	AO	AGO	024	Angola 	Angola	\N
00040000-5537-6df7-2139-53def0085757	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5537-6df7-20f7-f3dc21dc0481	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5537-6df7-768a-41ed32e56205	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5537-6df7-0d02-aac481195407	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5537-6df7-4b19-b4d86016a081	AM	ARM	051	Armenia 	Armenija	\N
00040000-5537-6df7-336f-2e305233ddd5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5537-6df7-0f14-e2bd89197167	AU	AUS	036	Australia 	Avstralija	\N
00040000-5537-6df7-e111-ed53aaecca2f	AT	AUT	040	Austria 	Avstrija	\N
00040000-5537-6df7-3fe3-4973e63a7f30	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5537-6df7-eeff-9876eb759ed3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5537-6df7-8dc0-0758c6ef4e28	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5537-6df7-857d-8460e15ddca8	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5537-6df7-7f7e-f15363f5bb1c	BB	BRB	052	Barbados 	Barbados	\N
00040000-5537-6df7-b519-58ba476b4067	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5537-6df7-b119-05c40991fe9d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5537-6df7-c922-569c38619d11	BZ	BLZ	084	Belize 	Belize	\N
00040000-5537-6df7-f767-c9199ae104fb	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5537-6df7-e879-d05b91ac917e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5537-6df7-3601-2764718175d8	BT	BTN	064	Bhutan 	Butan	\N
00040000-5537-6df7-c560-ab377d3ceb92	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5537-6df7-31d0-3f5b51269e9b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5537-6df7-547a-5018e8777455	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5537-6df7-ad1d-801641c75b36	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5537-6df7-3f35-c40a00078303	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5537-6df7-b559-7d101772cd3c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5537-6df7-d33d-e805bce3b934	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5537-6df7-5285-63ca3b0d0d57	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5537-6df7-e24b-7f87c36f6b2c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5537-6df7-2c6e-0b3d59e6d82e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5537-6df7-1594-89d5b57efc8c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5537-6df7-67cc-3664b37d1b57	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5537-6df7-3858-2b10d9a63736	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5537-6df7-024d-c1f209bf3721	CA	CAN	124	Canada 	Kanada	\N
00040000-5537-6df7-8d9d-057f00cca3a5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5537-6df7-d46d-3023be532f78	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5537-6df7-3047-4f59f18d568f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5537-6df7-3896-90ed43a03ecb	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5537-6df7-3294-7277150434c7	CL	CHL	152	Chile 	Čile	\N
00040000-5537-6df7-cb56-d4a7abbdc965	CN	CHN	156	China 	Kitajska	\N
00040000-5537-6df7-b49a-21bf891e0af6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5537-6df7-1fe9-b71b0869d2b9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5537-6df7-bfa1-055b6a483b9b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5537-6df7-31f0-7dcfda6ef289	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5537-6df7-636a-22960b0c9b9d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5537-6df7-592f-0d83b3703d8d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5537-6df7-b605-1c09605e2c7c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5537-6df7-2c44-76cc5bfae1f2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5537-6df7-e656-6fd86a526305	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5537-6df7-5f93-bd4234657040	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5537-6df7-0cf8-5d50f1260652	CU	CUB	192	Cuba 	Kuba	\N
00040000-5537-6df7-1a13-40f6defcf8d9	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5537-6df7-2692-b23f37e36ae4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5537-6df7-ae5c-baaa3359f0f7	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5537-6df7-7893-fc301e7e96b8	DK	DNK	208	Denmark 	Danska	\N
00040000-5537-6df7-98cd-248b335a78fd	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5537-6df7-767d-8ccae9a9277e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5537-6df7-d07f-683352a0e708	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5537-6df7-2713-72c05aca4e78	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5537-6df7-1f81-ba4b2332598f	EG	EGY	818	Egypt 	Egipt	\N
00040000-5537-6df7-8548-902404d467c8	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5537-6df7-b2d7-93e0b5ccc39b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5537-6df7-519d-e17109459a9f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5537-6df7-83c0-07cddffc1a7a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5537-6df7-9840-6c381f8a0d4c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5537-6df7-2be6-1a874a40cd87	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5537-6df7-37f4-3739e0ea3da3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5537-6df7-2a2f-94bf86632bb1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5537-6df7-4a45-06b85a231eef	FI	FIN	246	Finland 	Finska	\N
00040000-5537-6df7-dc9b-a5e751ff8265	FR	FRA	250	France 	Francija	\N
00040000-5537-6df7-b6f2-6f79c1f1d61d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5537-6df7-1aa8-733beef7c5cd	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5537-6df7-f745-8a6d2f443701	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5537-6df7-b103-91381b738827	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5537-6df7-750c-1679c0aa7d11	GA	GAB	266	Gabon 	Gabon	\N
00040000-5537-6df7-e73d-a9bcca436621	GM	GMB	270	Gambia 	Gambija	\N
00040000-5537-6df7-b901-c1338a1f6715	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5537-6df7-9b98-3df150e87fb1	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5537-6df7-e716-680a71023ed4	GH	GHA	288	Ghana 	Gana	\N
00040000-5537-6df7-be03-4882e1cb0ebe	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5537-6df7-3340-a7b5d132dbeb	GR	GRC	300	Greece 	Grčija	\N
00040000-5537-6df7-ef03-3b05318eecf8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5537-6df7-989c-91956b09efaa	GD	GRD	308	Grenada 	Grenada	\N
00040000-5537-6df7-1e5c-d4e80698a560	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5537-6df7-1585-b99b89f81114	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5537-6df7-6e35-cb6c8326dfe0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5537-6df7-8e3e-ca9626f4bd0f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5537-6df7-a25f-3f1c40156934	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5537-6df7-17e4-d6219a3a5271	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5537-6df7-9c0d-468137d41b86	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5537-6df7-e7d1-1144f237d682	HT	HTI	332	Haiti 	Haiti	\N
00040000-5537-6df7-5e5f-39b044f40a01	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5537-6df7-1041-734b6019bc48	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5537-6df7-48d1-6e8ebfafec64	HN	HND	340	Honduras 	Honduras	\N
00040000-5537-6df7-0235-b915a3bbe37a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5537-6df7-e03a-c2f9f1f20997	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5537-6df7-56c9-e8137bdfa71b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5537-6df7-1832-c71fdff29fd0	IN	IND	356	India 	Indija	\N
00040000-5537-6df7-462c-8b8afd839643	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5537-6df7-215f-e3f6fcb3d1be	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5537-6df7-c356-443785d2629b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5537-6df7-577f-f435b16343b2	IE	IRL	372	Ireland 	Irska	\N
00040000-5537-6df7-3955-86554e2c7736	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5537-6df7-04d7-9d7f6b4e9d16	IL	ISR	376	Israel 	Izrael	\N
00040000-5537-6df7-34df-d050135be8b9	IT	ITA	380	Italy 	Italija	\N
00040000-5537-6df7-3fdb-d767a6509539	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5537-6df7-66a8-183f3b0b6057	JP	JPN	392	Japan 	Japonska	\N
00040000-5537-6df7-c615-8fc9496b3bb5	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5537-6df7-e26b-b75fe035973a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5537-6df7-880d-de8b70d5efb9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5537-6df7-4757-c72339b15f72	KE	KEN	404	Kenya 	Kenija	\N
00040000-5537-6df7-c0f8-d20293810bb9	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5537-6df7-13ed-bb01d6dab237	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5537-6df7-d113-cb9f4ce59333	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5537-6df7-5acc-f3315735d8d4	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5537-6df7-0c4e-57d9ceca506d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5537-6df7-ca7c-03aefdd8743f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5537-6df7-6841-5d5f249ae4c1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5537-6df7-9a81-20f61b630d73	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5537-6df7-e04c-10b765fc8d76	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5537-6df7-b573-99042e036d78	LR	LBR	430	Liberia 	Liberija	\N
00040000-5537-6df7-9a87-94f963ac603b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5537-6df7-6e01-850642c8c548	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5537-6df7-33fd-1a85d3e43bb4	LT	LTU	440	Lithuania 	Litva	\N
00040000-5537-6df7-fe81-affbc30e31e5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5537-6df7-12d2-b1544d11be4f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5537-6df7-db6a-ffb1a2f8756a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5537-6df7-292d-09046fec615b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5537-6df7-ceec-229cde3c7ea7	MW	MWI	454	Malawi 	Malavi	\N
00040000-5537-6df7-69b5-eb1e5d634b17	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5537-6df7-2509-83f89f701b42	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5537-6df7-410b-e19d3d9f546e	ML	MLI	466	Mali 	Mali	\N
00040000-5537-6df7-dc3c-74b39e6c591f	MT	MLT	470	Malta 	Malta	\N
00040000-5537-6df7-3b14-723c4611bfd7	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5537-6df7-40ba-a351ae5c3dce	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5537-6df7-ecf8-5506b709d64f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5537-6df7-4ffd-b391b5d9d19f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5537-6df7-7d0a-114a04edeed4	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5537-6df7-dd1e-d92fc7cb5d0a	MX	MEX	484	Mexico 	Mehika	\N
00040000-5537-6df7-2236-4f9246c7acc8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5537-6df7-1c3b-537f2bccc8db	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5537-6df7-75aa-fb4533b61985	MC	MCO	492	Monaco 	Monako	\N
00040000-5537-6df7-b779-461fca038f9c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5537-6df7-dfdf-a6b3f1c65f71	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5537-6df7-9264-92db9a8dd377	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5537-6df7-3a65-4b0538f35c7e	MA	MAR	504	Morocco 	Maroko	\N
00040000-5537-6df7-e068-76a3fab553d8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5537-6df7-7906-9a663dd8ec47	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5537-6df7-4d0a-da5c35e6bd1b	NA	NAM	516	Namibia 	Namibija	\N
00040000-5537-6df7-775e-3dae7d006acc	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5537-6df7-f1b9-9bc687072513	NP	NPL	524	Nepal 	Nepal	\N
00040000-5537-6df7-fb5c-c879c76d942d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5537-6df7-5f74-4244b6967505	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5537-6df7-0f14-d075fcb74b5d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5537-6df7-bdea-fcaff9ca6704	NE	NER	562	Niger 	Niger 	\N
00040000-5537-6df7-0011-be607e288550	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5537-6df7-f252-de73dc247fa5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5537-6df7-3f44-5261b4b71580	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5537-6df7-2cce-9b6a5d0853c7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5537-6df7-06a1-ebaefafc7575	NO	NOR	578	Norway 	Norveška	\N
00040000-5537-6df7-650e-5b6725993362	OM	OMN	512	Oman 	Oman	\N
00040000-5537-6df7-69af-c28b82785e00	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5537-6df7-ddc7-366e4026f576	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5537-6df7-7d0b-78ae7dcdacf9	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5537-6df7-87e9-20c5cd3ca503	PA	PAN	591	Panama 	Panama	\N
00040000-5537-6df7-5bcc-6cbdd2dc04b1	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5537-6df7-b872-935a98bc2225	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5537-6df7-79d5-7b9bd30011f3	PE	PER	604	Peru 	Peru	\N
00040000-5537-6df7-72d3-15d977a4fde5	PH	PHL	608	Philippines 	Filipini	\N
00040000-5537-6df7-ee3a-8f60caaad591	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5537-6df7-df8b-b335d5a6814d	PL	POL	616	Poland 	Poljska	\N
00040000-5537-6df7-1b38-261b4326a47e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5537-6df7-4565-6dbbf047f10d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5537-6df7-5cb9-8f3318486bb1	QA	QAT	634	Qatar 	Katar	\N
00040000-5537-6df7-cd45-2df2780b8fe1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5537-6df7-6aa9-f3f239b6eb72	RO	ROU	642	Romania 	Romunija	\N
00040000-5537-6df7-80df-8d24a78c1dbd	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5537-6df7-e489-944897d677b0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5537-6df7-4713-f6ead91fb39c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5537-6df7-cacc-a5466e210af3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5537-6df7-1f8e-ad8512c0e7d4	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5537-6df7-17c7-81ae5de9840f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5537-6df7-7e84-026a8c1fec1f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5537-6df7-5996-a5f379cfe3f5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5537-6df7-7278-62c8de8198d7	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5537-6df7-62f9-eec747c40672	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5537-6df7-04ce-e95db26c5119	SM	SMR	674	San Marino 	San Marino	\N
00040000-5537-6df7-964b-fd48cbce5f44	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5537-6df7-a5d8-dbbca5025d74	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5537-6df7-d1cd-0ce0446c02e1	SN	SEN	686	Senegal 	Senegal	\N
00040000-5537-6df7-6b9b-e6761971cc3c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5537-6df7-11f0-2e6c0d6f45df	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5537-6df7-590b-297aa5a419ad	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5537-6df7-9b9d-2c3261de967d	SG	SGP	702	Singapore 	Singapur	\N
00040000-5537-6df7-824b-dd7f048db106	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5537-6df7-dc43-c753e7a43c50	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5537-6df7-4ddc-935987f56df5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5537-6df7-8152-47854ccda8c0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5537-6df7-8168-b08a82353857	SO	SOM	706	Somalia 	Somalija	\N
00040000-5537-6df7-c4f8-f4bf2006b9cd	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5537-6df7-a8ea-5b3863245241	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5537-6df7-4010-baa353f3ba73	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5537-6df7-68eb-7c4c58ef12d9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5537-6df7-8ce0-f129caeaab76	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5537-6df7-fb40-d7dafee4b0c0	SD	SDN	729	Sudan 	Sudan	\N
00040000-5537-6df7-2490-8ffcca1ad69f	SR	SUR	740	Suriname 	Surinam	\N
00040000-5537-6df7-cf69-92f2649cc1ef	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5537-6df7-876f-5a8b428b0b7b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5537-6df7-1169-3ec71805d599	SE	SWE	752	Sweden 	Švedska	\N
00040000-5537-6df7-2c8b-f6d32b2fb436	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5537-6df7-e276-4758b5058afa	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5537-6df7-11ff-98d9185e7b4e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5537-6df7-6e1a-ad59c7b81cdb	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5537-6df7-ed2e-960b28fcced8	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5537-6df7-6889-0d5b0e0b57c6	TH	THA	764	Thailand 	Tajska	\N
00040000-5537-6df7-2bd2-8798ddc232b2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5537-6df7-47f1-253f8108e781	TG	TGO	768	Togo 	Togo	\N
00040000-5537-6df7-d4b6-0abf52da50bc	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5537-6df7-e2a0-9f90ef673c33	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5537-6df7-a82b-95519e70159d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5537-6df7-1a49-349d557c9a6b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5537-6df7-ccd4-29ddefc18a27	TR	TUR	792	Turkey 	Turčija	\N
00040000-5537-6df7-b876-2c51640e3e50	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5537-6df7-2dee-cd5c37c01141	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5537-6df7-bb2c-40d22e6c0aa7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5537-6df7-110e-c630ef4f8e76	UG	UGA	800	Uganda 	Uganda	\N
00040000-5537-6df7-8eed-05ce855f52ee	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5537-6df7-7bde-0f1012106398	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5537-6df7-83ae-39e7381d3208	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5537-6df7-d2e7-3804f6dcda52	US	USA	840	United States 	Združene države Amerike	\N
00040000-5537-6df7-8b5e-0552ad454055	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5537-6df7-2d1b-6532667bba7e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5537-6df7-8149-8034fa6c7cc2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5537-6df7-1e6f-4512b76204f0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5537-6df7-01c4-5b10ef80845c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5537-6df7-32dc-7e221ff33592	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5537-6df7-f011-e9c831c4a5eb	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5537-6df7-3f62-13d969dd71a6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5537-6df7-e067-55320be60e7c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5537-6df7-da4f-55bf4cd5c53e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5537-6df7-764c-e9b876160c0d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5537-6df7-9c25-cf3d66bfc220	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5537-6df7-cc9d-f65b238ed3b9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 2801243)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 2801040)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 2801047)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 2798066)
-- Dependencies: 171
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, user_id, naslov_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 2801099)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 2801105)
-- Dependencies: 200
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 2800893)
-- Dependencies: 181
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5537-6df9-b281-90294c9849cb	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5537-6df9-9b78-f6a78c331951	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5537-6df9-e1e8-f540fd208776	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5537-6df9-4d6e-fa3f2afa61fa	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5537-6df9-a30e-50f805d66037	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5537-6df9-739b-a828b416b472	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5537-6df9-c9a3-370250b82621	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5537-6df9-9248-221419ab857c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5537-6df9-35ad-9871f31e7ecc	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5537-6df9-7b41-4a98ff54b9b7	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2869 (class 0 OID 2800905)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5537-6df9-0d7f-28e67cde1684	00000000-5537-6df9-a30e-50f805d66037	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5537-6df9-2fdf-399fb32ec7d5	00000000-5537-6df9-a30e-50f805d66037	00010000-5537-6df9-7b09-ef0ef0dda63a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5537-6df9-c6e4-c8eb213dc6bb	00000000-5537-6df9-739b-a828b416b472	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2870 (class 0 OID 2800916)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 2800961)
-- Dependencies: 185
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 2800810)
-- Dependencies: 172
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5537-6df8-2094-5026a6de1904	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-48a6-c95333a563f0	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-f64b-eb159172932e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-bc3a-d8114c1a4233	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-afe6-258392945584	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-a2fb-2196fef127a0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-6080-306123cc0227	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-7e40-969c94590ae3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-9a50-0e124794c479	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-451d-cd43e822c86c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-c435-4c426e1e1a2f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-95db-d5c634bd0638	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-b820-17ba432248d5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-711b-627967ad57db	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-5454-dfce64633a77	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-06cd-d0a476c15d04	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-2be9-d1d2c231174d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-846c-9e2e27d2e1f4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-b877-00ca5b7a3ce8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-7069-de10e922f4b9	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-51a2-25a4b9b22dcd	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-311c-f327d74ec0c5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-265f-0477e134ec97	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-0e11-065199b96fe1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-ea3d-5b1d7ed2df28	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-65e5-6b15862b0e04	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-3a1d-5f6243834a9f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-7773-3aa8fe424c16	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-5199-427a746dca81	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-e9ac-7b8af047b644	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-dc33-85c9c3820a36	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-1d6f-37a8a7b1f17c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-af70-726bdcf160dc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-e4b7-5581ead5299e	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-4187-f9c289a87286	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-0c93-651349efd46b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-6c13-d29cd6c3830a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-d423-6cf96592c256	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-74f7-279289615dbb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-0805-76c828b255cb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-8b25-138a4319da7a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-c411-c3747abf8743	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-65f1-1e8731a46b5a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-6f72-29d597d58cd9	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-863a-e4830eaf98de	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-7de5-b4a758a1cba8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-651e-2711c33b492a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-7ff7-e80e2f3f5abf	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-5fa6-f2a5ebddf088	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-b37f-49bf575c1655	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-5ef3-a57177bf6882	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-106f-0824794d200c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-bea3-0c41646a9231	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-95c6-44f82d562511	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-ba3d-89b6608be35a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-a6b3-5e58c39d90ba	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-46ba-72c3e3fd3838	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-b3dc-ad70c0532b96	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-1b28-2695a56dd22f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-9d98-e222e32a4034	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-3fc3-f65dda114c4b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-a20a-6d6413dde81d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-436c-66d58924ffc8	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-cdc6-99c3db9b7da4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-d119-c84c5803cc28	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-ec48-664599624ea1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-5f56-39ad56f6961b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-a5b5-974c72a66915	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-825f-e908806d0c9b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-4c99-6f3ca4e9cda7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-33d1-0b9eda379b0c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-4f82-289c36058c9f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-3cd8-5a42693e5f7c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-4097-6c0f87431080	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-d28e-3f6518ced4ad	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-d723-40b7fad9d7cc	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-6581-83635932128c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-52ac-7a2ab4fb55e4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-bd86-22d3cdb844b7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-0532-8e9f802c8382	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-8011-b5dbab790147	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-4ca1-edfee586ea8d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-6754-529d2d07a06d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-6986-2770fed585f4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-aa64-fc013f0cfa8c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-d325-c6c1472a35b1	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-caa1-70b56149f7e6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-f39f-b72baa4ee719	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-e394-92989c526f32	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-bfc3-f19ba3c32bc2	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-cd65-73a901094093	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-b802-6e01ed70612d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-225b-b8e81eafe04b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-ac35-3d33d354e37f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-1746-10f3513e222d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-fc0a-48ab4f0fbbc1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-0a4b-c8439994046c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-215b-b492f4a2caca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-58f5-0fcd474e80ef	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-e651-c3942714da88	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-57ae-cf782543e36b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-417e-3e3e80bd9806	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-83a0-c6a738d86a8c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-211d-b8640a44772b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-5dc9-fd0eb38da6f7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-66c0-f1b8dc320f04	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-4458-811c871a722a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-64ea-3d76b63f3682	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-bb44-b1a112729122	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-ce5e-df4fba6b1cdd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-d672-adeae61ce21b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-f6d5-fc18269a253f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-0691-5c1c1f13efd4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-0ee2-74817938e1eb	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-fc6c-4bc39003dd82	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-e64e-3db3231d0d88	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-0df8-e7c942b18f5b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-4566-f2b75bb092b6	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-619c-7e73a6b2ab12	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-eb21-ce0e76864501	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-35d3-0e9554628339	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-2799-5b52c2c260b0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-f4a9-d5caaa569b3f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-4b6b-96aa7a2de676	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-83e3-70f192982e1d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-4a38-77d145dd93da	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-e92e-6b8e45eaee94	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-4e6c-b3ce3fedd1d7	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-235d-7e202f950bf3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-26f2-bacdd617a24c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-82b4-3ce34ef0886d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-970d-63a2c563cc91	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-ae15-2ca4b0955c93	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-6263-68a1268203e2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-350c-3e7ef92b83bf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-2e93-1dd71ecd3dc9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-6400-af53f5c849b8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-dafc-0d094b1592d4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-740b-ad57c8fde173	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-9cb5-c53ceb0fbc20	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-22c8-43a9a7cc6c8e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-d203-c6a66e57de29	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-fc91-591d1a48a7e6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-3d7f-b24801a630d3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-b373-1341f10cab64	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-ef98-a3f45bffb07e	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-0ce8-ebd7c4f26d1c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-5840-9add3f2081d3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-ec4d-a3d264baf5c9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-c7d7-d06b91ad304c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-c262-be82fd0deff6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-24f0-dc253d1e9331	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-2a6e-c6471b046967	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-bd1e-590170f80201	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-4c0a-2cf870f575c2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-c144-5b89fcaa7d11	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-8b4b-fb275eea7d8e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-4fa7-4602dac1801d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-3816-3d879bb7145b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-43cd-ec9f5a369846	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-a567-8f85d27a170a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-dbd5-9d92a953f364	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-a804-98b3c51857aa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-8f2d-72b5f4109cd0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-a1a0-88f7052c4224	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-270d-d1ad2aaf41d5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-5166-3e0388bfcb5e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-ecea-05198985ed03	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-5b08-c81f2f532fe6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-3a2f-3d824c4eeacf	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-025b-056a778d6ab2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-34e6-99e117b4c427	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-4962-39accccc06ea	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-6f41-3888af7ba084	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-0c71-e465d6c62e5e	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-ed84-2ba763592e34	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-24ed-3d9865ad4a86	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-16e5-56c43b5ad6cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-293e-510964a31b41	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-3e41-42aab5327185	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-b7bb-680f8ae41b98	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-d996-79ec1046bec9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-e3cf-a70665fe26c7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-c60c-8783933c59cd	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-cf77-ef3c18390ca1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-6034-f7d44ab800ce	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-a9c5-a6167c6a65cc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-0031-598a90afc90a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-2513-7b1b41ab46fa	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-5804-7b4737e38298	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-fdb3-7c2f6bacfa5a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-5a7a-fc57c4fb0315	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-c3ad-f7c55fc617b2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-e42b-2f3ee86a7670	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-18e4-aa4f824ac972	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-b7cf-c6d400afbbec	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-91e4-7e7a587a415d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-4521-98d22bb803a4	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-b137-569bf26381bc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-ab21-114e1fec9523	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-2a44-80b77072b2a3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-bf9a-91d5a00056b1	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-26d4-b593d1ae5fdf	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-acd4-e378750e3b28	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-d1a8-c29eff3b19c7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-c4c4-263de471901a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-74f7-5add6f155693	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-07f6-6fa9a01f2300	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-821f-3b45cbfcabb9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-4c35-5d45c80f5aa2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-d4b2-61e1ce620293	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-392d-072692373216	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-6324-923b143dd204	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-c6cf-3e9b600c4456	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-81e8-4aa54ea103a4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-6ce2-ee92ae7581fc	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-6a67-f2a3cbef8585	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-897b-c3189b9c97a8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-15c1-c16edfcf3279	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-5eae-feb641a16a31	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-fa0f-c190f843259c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-a7e6-d8c86e588b0f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-74f0-153ab27c5302	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-991a-97bfdb2d0028	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-e65e-2421ea4846bf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-da33-f57ec9bdf52d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-9aa0-f4d746d8d632	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-a04f-708fb23e74d4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-6b66-2841d7adaa44	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-60ac-0b9c30ffd688	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-d21a-ae8727fdf9c8	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-2c20-52c2290cb12a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-b406-4d6b408988cb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-229f-1e6f771e9ef0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-4636-4fa111aae7a2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-5d84-4d1af66b14ff	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-90bc-9c7cb326da98	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-d376-8fdb4e1b226d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-2278-770576c1e235	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-e3fa-b73b1f5272f9	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-bf10-901e46ad1675	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-5d62-9fcdda22e6ee	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-1768-7fe4a16e6d4e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-3441-7f82df0494d4	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-1ecb-10e0e9c15486	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-89da-cdd173a9b864	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-d33b-7da6766ff7b6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-1fd7-75dc41eb5452	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-a9fc-5846cb98fae8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-a96b-b92c65478417	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-808c-041f1d4d3afc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-a6c2-7f8e055b1f25	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-0808-b59ba1db883a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-8e44-2646c265e9ef	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-1117-88245e8a3e4a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-7a66-f334489e81da	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-66ee-25aa84592857	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-65fa-ab75f44d9264	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-3bfc-03bf9b9cb1e5	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-563d-530383a1c90a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-6835-88d06a42d8f6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-60aa-63509786f933	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-3845-1ea0d435d923	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-7514-7c955661ad22	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-056f-1772c7ae102a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-7176-19a33386257d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-5e42-c4fe754c72ca	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-0926-d8fbf7e65715	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-57af-ee8e9e73f8c5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-21c8-5754a185c49d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-4f75-dcdf48661b97	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-eacc-8ee3b1584b6d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-8d6b-437da6e47c56	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-deee-dffe3d0730b9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-af40-739942619249	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-8391-5995c495aa91	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-ba72-a9ba31189e49	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-7f48-56d4b0fcc9f7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-52be-31807e3b989b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-e865-139b60d3da72	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-172c-2a247744b36b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-89f6-754de691db20	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-4b4d-12ef2b24cdc0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-7d45-ec9c52527238	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-c8b1-10505e95191f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-d7a9-d9bff9f057c9	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-ccc7-9d7e9f600685	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-358a-8a4827e079d9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-b27f-8b3267eba3e2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-0e8e-88ee3b6c213a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-0050-eaac2cf3aa71	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-5709-3c0ae7492815	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-a325-7ca121549c7e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-4ec9-986399cd8c9c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-e4f7-2607293364ca	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-38cd-693c5cd6d424	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-5e47-8d161b894a1f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-70d9-a1437c03bbbc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-f0e0-434dd3391dd8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-7afd-aba663fa4049	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-f197-47791d3c4a63	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-f90c-5eaa7189e1cc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-1466-7ae81980dbb9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-3d65-c00802bae5b2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-fa65-388983064ecf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-b56f-81145ff3f753	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-7bb8-efbcbf8e5257	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-7dd4-8e7a51cdb67f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-d3e4-fa8eceb356e8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-980d-509058c20aa4	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-5611-8b5d084d8ca9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-a0e8-90a7a91f8b63	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-7612-1de61791e640	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-fdd8-b1d45a17aa7a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-3617-8dbf655c7f43	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-69f3-141075ca1203	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-d5c8-acf68b0321ef	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-9f48-d14736bf8f3e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-bc81-34fdabe93c44	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-af23-a01bcecd18d9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-2af3-3f282f8b31f4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-b36c-e1ca894f7eab	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-fd45-0a9e51694c82	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-03e6-659f8bb4c1a2	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-d5fb-c7b94f1874dd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-38bd-80535d7a1ccf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-230d-3fa25dd02b78	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-e53b-c03832de9a0b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-ae64-ce5f6e64489d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-13f7-cd129a72d225	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-1370-a9209471bde2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-52ba-d552bedb38e6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-e2a4-a91f768f86f7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-6445-46e9b30f0b85	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-08f3-b2e8726fe395	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-d8bf-9380eed1ea00	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-57e4-5b520236ec15	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-32bc-d146030ec6c2	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-c05d-a6b149a6926f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-0452-90a29f808f8e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-1a97-7f8c843fb45f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-88fc-658e7f4f2a0a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-5780-17da2669a753	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-d525-ffef8e96cd53	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-b6f5-144e0879bd17	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-7bb8-16722a14f5a1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-4420-8d7f7e87f815	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-69e3-6dff408af032	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-febe-958e263adda3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-70be-9c64583146db	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-2bf1-276b2f2c07db	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-0cef-2d34c67cccfe	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-aadf-f9269b858fcf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-bb49-9e85b7bc1179	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-9176-4d33736b0abe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-46fc-7cd3b046b7cf	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-5d3e-96b513bec8ff	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-73de-98849044c194	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-7135-b1c97b690ea7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-3fe8-07575e486edb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-763b-0402c886ef0c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-064e-cbe15b9b189f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-a7f7-b02e5a8ce012	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-9982-0b527718d138	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-f9b0-099cbaf8679d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-6c5f-66648e1cdf2c	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-ac37-f114f10953a5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-e56f-87349b2e77ea	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-d306-7060344702c7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-e06c-0b34697c82bb	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-b7a9-1ad38b28b80b	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-1a4a-6f7d74f92dbb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-bef4-fdbb210b75ff	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-ce73-4f107405c9a8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-c3f8-5e49783df6d1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-97c5-4ea21c2e1b8a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-fc0f-bbecccb9e7f2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-55a9-db216a3b8b5d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-87cd-a8792db8851e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-8196-0df40dcf0efc	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-e74b-4e92dacbf71c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-5ea2-721aa77f6557	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-d20a-3e619ed3d106	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-10b5-719b47d3558f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-b0ec-a164b35d546d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-54b4-f0bc32188227	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-46c6-1cbfb7511a1c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-27a9-08ecc7aa6da5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-f834-b48889a7e579	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-6c33-936a06d79f2b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-8731-5435eb8ebd0c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-4514-e32c07bab0df	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-2ce5-c6a701b195a5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-ce53-d7905ea7f210	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-8eca-a2530fa2131e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-4c72-83306ab26397	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-9bfe-024e8f8f6a96	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-efaf-ab3b520f81c2	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-6cea-f0f80292b29d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-5a66-e9a8c141081f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-cba7-ed848f2153c0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-6b2d-694a1d005b66	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-efd0-4abd49dd5343	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-0c9e-289d55e18f5f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-2fb0-c231b3d6a8f3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-5b15-ce2b81cd3019	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-df4c-eca4a24baa07	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-1a2a-f413237a1d15	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-8cf3-e91ac42a23b7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-ca60-5d38b3d22288	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-f8cf-648c8c92b0e1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-9a14-2627d6cfe50a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-4bf9-fa073d57464d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-75bd-77cb1a4858a2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-8d62-022c96ae630f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-b044-a41f2f316fde	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-cb73-0231597f5277	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-9b49-b43917b83d45	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-212a-622b64dcaa3b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-b557-c2e064df4652	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-f475-03b6c0a800e3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-6da4-6d26cc7f79bf	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-de46-e655e58f5fd4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-002c-5d3b453005a9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-9947-2083f99ba374	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-da2a-f466de351aa3	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-bb49-e506a8284e71	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-bf60-a7a5319dc92b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-a557-6b83c64809df	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-f5ca-2a15382adb4f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-9145-dfe5ab1986a6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-ddb8-f746c6277278	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-d4b9-c5702a5ec455	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-d332-8e445eaf26fc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-e58e-913c74c1ce12	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-8b3e-656bbf0ce477	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-3026-8785b189338d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-9283-b36fa6c6de99	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-b9d6-95884c921122	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-9a0e-1c2471bf0fb6	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-d130-e9dc4cf00b97	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-83d1-081339a63d07	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-8114-71aa68cb909c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-144f-130d20009f73	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-354c-8e0173242abc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-2631-7f6299ae0654	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-4758-c3d3bca78fb6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-3323-010bc13160f2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-f2bb-36bcc5273cbc	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-d1e1-9f6989626b83	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-863a-39cd9b21abb3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-4989-fd278042c670	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-a0ce-40d1192f56c2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-4933-0c27be06eb22	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-3673-7040449dec42	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-6334-7910f1d9386b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-9654-a70023f5e423	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-250f-033f696317f8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-b7ab-165b138ed53d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-d233-6cdf13504bcc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-4e32-8de9186c0007	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-14cc-a95338134fa3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-9a3d-800a5b5bf981	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-6138-56d709a0685e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-9c86-2087c4a620ca	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-f786-8a5d8666ee7b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-9528-7c3e28a300d0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-6cf5-adf57d69ce6f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-d9f0-f2b54802fffa	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-e108-9e560b2aff71	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-2bc7-1e7711f4bd95	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-69f2-fcc25344fe5c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-dfa5-5039179c3aa7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-c3c3-58421995ca52	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-be82-555b90680f37	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-3111-2cbfb6666722	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-20bd-86f7850d1b9f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-7fb9-5e802e95fb07	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-1740-cd47b4d0d480	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-bc94-abdcc8d14094	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-af01-8d8efe606a1b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-390b-b735efd4dc56	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-9374-93161ea8a646	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-9505-7dcea8381453	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-f059-8e477c1058cc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-0db8-1236ad9c1d2c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-f342-6f579f24d7bf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-5985-000ede996c5a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-f6f9-2fc607a7247a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-3d95-a017eeb541f4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-7a0f-0928a2ff2758	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-8b8e-6f82b0dcc6b8	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-c1e8-45720d29f43f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-57fb-8987cfad2de7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-d481-578d34139e0e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-b39e-24b3352d5466	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-ded3-a9718b38bbd4	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-603e-1a1bf456b133	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-8f5f-b09635bd3da7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-6ae4-dd97cf466210	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-ad80-d4aa6f9d648f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-c219-a39cc0355d85	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-6a19-bf146afc2f22	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-03f6-473324b9fadb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-253e-bfada22ff030	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-1c36-1e38065df9a5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-a512-7bfc692c50b4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-84f1-4e5008c0c4a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-363b-9a0ed5a956f3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-1e43-b11463b15b97	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-f32e-6026f8710eb7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-3c5b-0588f061eac2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-edde-23cf3c37dc8b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-51d1-2afaecb1f3ac	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-c275-bef466407028	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-5e3a-2265891857cc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-7b0e-4229695da5d6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-81b1-41c7743303f7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-336e-d6a12efb25eb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-b942-bbbb5bc6a875	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-bdd0-aa9625d39313	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-698e-1e1c21ac3219	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-28b3-92d20a1e9e56	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-0baa-15d640a46b7e	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-bd7a-ebf0db53d092	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-06be-bfb272ef07f7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-276d-320823a84317	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-3db6-ffc955eddb2f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-b700-cafbee57ce08	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-4a91-17a85223180d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-7836-33a68155fd9c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-3fac-976330dcc16e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-c224-f45434e55304	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-62c6-2eee29948a89	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-ce84-5cd10014ffee	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-aa76-bd7278759e74	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-3fa3-893921cfcd83	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-486c-dde8e9edd57d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-7ff7-355ceff5e828	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-f1d5-35489a9ecc88	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-2ecf-37d6a89d8485	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-b283-bc4fb86ce917	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-0155-873baf49bcd1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-f22a-1cb6a7b68096	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-b878-17c5e372966e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-41bc-71d800379296	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-dd92-95ee47926113	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-7afc-e39c481d70d5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-a7bf-7562cb9a4b7a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-ec89-9b7efe26a9ce	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-455b-4f866d891b60	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-ce1a-ba4ea57ed999	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-cf36-0e5117939035	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-f0bb-6f82cae4931f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-60f2-7dcc618d5053	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-dc89-86937194ef39	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-d68d-bb82bcd6ce19	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-cb86-3c870bb44563	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-21d4-56543da27366	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-eac3-00d785854ea3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-a13c-313dbd018806	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-da90-20d61cc5ae83	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-4a39-5b27635c374c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-7e43-ea0f3d2ac460	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-5d5a-afbfc21fcd12	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-4783-aef730e968e4	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-c929-961bae6fa18b	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-180d-8a8d71cc6c09	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-e07e-1ef3efbe4dcb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-40a7-0736c287d145	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-729b-b8652d19082d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-bc20-b333b4bc977f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-1b69-bc8aee1e76f4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-ed4d-502a8aea5e25	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-77da-542060bcfca4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-d68b-b1a8304ac4ad	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-e6a5-a4148725a23c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-da54-409c973064ab	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-163a-01317f3f095a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-5b85-72e918f61c65	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-3073-52a687b3d62d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-1ff3-00d093c613f6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-e820-f340bea1d3a7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-710e-e129fd6e7f3e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-c4c0-2a47f1087cc1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-3fa2-d213156e4207	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-e73f-8be99c9efced	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-a067-5be6edf5acf1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-50bf-50a8e3cb7e15	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-5696-18304a42e1ee	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-2ee7-99b3e6729a29	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-ec61-7b8dd16139fd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-d128-5802256d8bc7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-225e-bae0d0951f8f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-eb58-0cb8485c6c5c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-46a4-831e23175de7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-60f2-b0e4550c9b4e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-d55a-cece3b0ef82a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-3744-5cec37d7cfa1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-0f49-d977a8c75bba	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-7990-e38df13ffb70	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-fa21-86f78b841c5f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-e9aa-6df9c68df1a4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-f39c-d223cf5705c1	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-3704-ffef077eba2f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-8115-a35f48ec7854	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-7bf1-464a368128dc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-13dd-ebcd21826162	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-e92e-1da2dbb8e500	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-e82b-33980b8ac0ac	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-099a-7c7963892b6f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-d1a6-133f60590b6e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-e984-6391d0231348	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-67a3-43ae037d2fe0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-0b30-19fa2811e9aa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-ab24-3c94f8071370	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-c832-4557f875f43d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-0216-1595b7681667	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-6f83-cc8cac0a07a6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-8219-e87e84789716	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-eb47-de68bbad93c4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-798c-52613dc0e9e9	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-0f13-0aa4ce9b4559	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-352b-b7edd8c00cb5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-7d18-b5be9a6b4c21	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-cc9a-a004a3f7b685	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-7394-70421c5854c6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-f35e-936cba2c2176	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-3601-ddc449dca225	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-32db-378da2c2fa67	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-66da-5325812b76f1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-905f-a924f2300712	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-0a05-084212a7a98c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-3633-c57a025c6893	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-5803-e3daac6856b2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-391a-bb8a785fcc02	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-67e5-0215018aab67	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-454d-1164cb8f6233	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-70c6-750229bd2efd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-58cb-f8a1769ee10f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-5236-b0dd738b18c6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-f461-73dace7aef64	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-78b2-25a6510e5a5b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-0b42-9bfcd690790d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-4708-03e26e5b1225	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-e364-6b19893ddf1e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-c0bb-633348f79619	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-9673-810fd845c6c6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-f7b6-a7c18b883082	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-1207-2342239bdd83	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-797d-a29b47d97477	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-8c60-4ae635623ad5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-36c8-2509e9ca7116	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-ea81-d76665b962b5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-0c23-6de455a2e1a0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-4e68-204bb3a42cc8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-bec0-a299f33ab3a8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-0d3d-15820cf0dd75	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-c0e7-165b836c6665	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-c613-dddcb114ba7b	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-9a3c-3f2a83b97c25	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-93cd-441740448370	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-c867-80eac59edd03	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-3257-af250301e2e6	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-9058-637e2e872755	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-93e8-528d14651bf4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-b6c8-ed4ea39d1cfa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-6f3c-45073b0b235e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-edfd-d07a3084b4dc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-b25e-1f7ef69016c6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-6843-a32011aa57b0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-41e3-fc0d40052f81	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-95f1-517ff777443c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-94a8-54190e3c4562	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-66bf-9c1d734d503a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-3686-c808bd2a8daa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-f9dd-167d6d151bf5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-b9aa-a307492d9c6d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-20cc-300a3ec6e288	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-f245-0328390e8bfa	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-a703-8c1e9bbb5631	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-da8c-cc479b582005	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-624c-00248915df9e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-e358-93bcf0401686	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-1925-6c1c50fe40d1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-4e39-7394f7b03bad	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-6573-5607f51c9858	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-60b2-d92e96a20134	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-c410-ec3eb89d7f94	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-bd28-212fba5ef024	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-e0ff-d2968702e118	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-03f9-bf7ece526f68	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-b897-fb4db82075d9	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-b23f-30aeba683510	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-eaae-862f9ed7ff53	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-481b-a13edcd0b555	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-be58-348ff9baf98f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-cbb7-5b336ab0e61b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-3d02-bca6c7aeb0fa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-ad33-1f8791c9c8fc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-2b57-76214212621d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-f186-c16533b228dd	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-c8e1-e9c0207e5ce2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-eaef-1f08018269dd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-ffa4-d5f0ef6f4a2c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-378d-f515926c0f3b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-46c2-e39573b3c1fc	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-c748-45458bd782cd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-993b-7f0d7d483cf8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-843d-c922748d8397	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-9f34-19dadc6eaaf8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-a8e7-65d328f1d523	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-bb07-c672f0e33907	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-c110-ddbc86568aba	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-fa8f-b85af5d0e83c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-9211-35c7410d9899	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-d178-d3346379d9d0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-4e59-63946e9ae222	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-0a5b-c6c32b8bfb97	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-6971-aa94c838b5ba	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-dfd9-125e5798f0f5	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-6843-50f50bf8c0c4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-d2af-71b8e965ae5e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-fa83-b4bd76e18b45	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-ea4c-207632b94ff3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-f53c-2865e150eec0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-238b-3dcdf53a4c8e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-d246-7ebe702748f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-1569-9f8a5ec7f19e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-c19b-6db894f07521	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-569b-dbf5bbf98b87	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-bf8f-199d09fdc17f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-63b7-73040e5b2136	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-190a-fc314b276660	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-a029-5b9f2aef6b72	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-5b4a-1336c025d1ce	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-6f6d-a26495e764bd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-9316-b5a544760a55	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-4eb8-fa8029e26aca	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-c66e-2f3c48f5c6dc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-72ce-e06cf95d33b4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-b005-09ab97e565dc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-58ac-8d5dbcc688ab	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-af13-7f9909270b5f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-439c-221becc98a84	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-ed67-e6afe443b9cc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-0a6d-d45f4e2bc38e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-6263-f0f8eadfb4bf	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-c242-158e5c36ed1f	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-243e-e3bbe1544a49	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-8bfb-c575160f585b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-581a-80941c981c4b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-de92-e9bf80f41330	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-6287-688c86bb0f55	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-c09b-a3f5854d723a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-f947-8d0cc45107a4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-5f25-b11922611d23	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-3e87-26126d36ff90	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-4070-fb9ab43acedb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-a127-06b290efb105	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-db10-c4caa0111402	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-7f64-f73a96722be6	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-a4d0-571796818a4f	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-d41f-d090f27006b7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-1f07-bbacb311fd6f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-a298-ade65a8d2390	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-601c-c91f193fa924	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-44e4-afbfd4fdf9dd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-66b4-14906fd655e9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-bd4b-073305a4e5d9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-c7d9-5f55d6ad1b8b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-73ad-8c79bb32b3d2	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-ce76-ed7c0ae4cb48	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-0810-2c375ed42be0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-5823-be17e1f4ea24	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-48b1-b9795aade862	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-4a29-2f5b82833aca	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-c508-f8c23ca10ef9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-af7f-8c8b3ac605f6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-00b5-f99fca98d406	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-7924-601b613adc5b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-3acb-39bd559169e1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-ef9a-5c5aa7681ea9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-0519-cc0cca285021	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-d1ee-bff002a0367e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-128f-8e21f6cc1f06	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-25b0-1848201b69da	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-3d2d-3b8de97f36ed	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-6f1e-a5f188ac3452	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-41ef-87cb73eb067d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-780d-5cbd8a16480c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-1ec7-1f84286fc56e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-d12e-46d41a25e014	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-1b18-c04a35ef83eb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-b0a3-854a62b00e73	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-ce4e-1540e900a0e6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-b86f-71c71aaf6c2e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-a8ac-8ab95a560ba3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-3b89-6cee0f7ae65c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-5790-e6ec2b519276	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-ab2a-06d0f976e6ad	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-2318-2551550f5125	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-cb64-c92f5fe41075	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-0095-ef3d56d2013c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-bd5a-78f665bef6e7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-bdfe-250a7447f2f5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-2ab5-be43c28613b0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-a680-313e9177477e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-e89a-4a4f0eae27db	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-e9ee-36c237456572	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-29e5-04e28ca19b5e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-8049-d952b404b358	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-2cc9-0663dcb700c0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-c6a0-f1a68be12de6	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-6a57-a78e96ad5487	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-73e0-df6fdd7c80c1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-1c3a-5857c9a4ffaf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-ef72-79c1c5ac600f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-4b1d-bc0c96afe15a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-81cc-d95c7c81cd6f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-0c48-6193c22f5d09	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-3072-8f515534fd3a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-087f-df9a2a10d09a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-bd2e-e08bb1da06b3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-3b3e-e4e1f094e5a7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-ec08-06581e6c16ab	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-0e2b-7a1ec53f89c1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-8e07-6507acbb98be	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-7020-80314b4fe66c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-5dad-c029f1a21caf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-9680-c33008ef2e73	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-cc7f-4b2d79e5aea3	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-499f-ef93fa80f6a9	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-05d8-46cc433ce11d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-101b-4a239dc5317d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-5d3b-a6d29e86987d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-a232-13c7bac52f7a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-145c-6a42cd546bf2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-c3a3-b7875a7d8604	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-da26-92bfbce22630	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-feb5-6c8240cbdb1a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-7409-4209bacaa4ef	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-9758-cb190f5e5326	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-0a98-462af8647172	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-8775-3806576b8b82	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-1ba1-4678f17a3bd2	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-40c2-5910156faf00	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-c228-85e96be8c9b2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-cbb0-262797f3cb4a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-6862-bc5b3dfdde82	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-001d-7ab494a91f80	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-759f-c1219f09c323	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-6e3b-c01e4290ad28	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-13d4-51a512ae2a1c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-4493-68940ba23dcd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-58cd-13f32e3120e2	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-42ca-0dcaa1a77771	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-18a6-72800a0c9c48	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-eae3-3efc302a586f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-7e92-97a6d91cf5ce	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-66b6-720f80794a2a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-b092-fcff318d44ea	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-494e-45ea0865c24c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-fe19-45111544f59c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-3086-13a1073d626e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-06a0-49e13da6c1f7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-cbfa-e359b4420d40	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-d601-69413674bc13	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-57dd-bee9a65422e5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-9f0d-6d5d3e997fc9	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-573d-9c37f6cdde04	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-260d-828ae935bf61	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-e9f8-fe54d0a8b4ee	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-a281-1943d1ee838d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-ceb6-be260a53f2c9	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-b00b-841ef960f8f2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-98d8-b4934a8e4c55	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-e955-b74987528395	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-f244-b85cf03155be	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-e1c4-b978234106e9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-34bf-1c81356741cd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-b098-600c40054fd9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-aced-9f7f2f3c4c77	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-6caa-1ec035b84e4c	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-5bc1-89b1ee8d02ce	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-af5a-e35f70d9664a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-7bb7-50ade89bbfe7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-63f6-341969f6fee8	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-3900-9b70f04d9f32	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-e476-a8d436b2f2a6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-6a47-21b6ba7213cf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-1438-f8b0292c45f7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-4592-0238a8ec51a3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-95cc-f93ae1ce41a0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-6681-affd84a1c47e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-0502-11c9c7283a43	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-eb01-81e1f89eb8c7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-353c-33210cccd813	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-13e8-1e90321291dd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-d477-d34911fc5754	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-2d13-713191b3e754	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-914a-1aeb811dc71d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-1d77-9a85d495235d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-cf94-7e723ec4cdb2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-b960-777e354769fe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-6a09-c26489e67b05	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-1071-9d51bdf36a55	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-6358-f4e33c25d4d8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-3139-e74d52121340	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-4ddb-7ceb59b05f5f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-deb6-18e0ca458a39	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-8cc8-309c8e37650f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-e694-81c8dcbf06e0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-2105-cc89cdf80dfd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-ffde-0f257e5dac80	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-affc-f12a122cb1c3	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-613a-82cd9fc6a7fc	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-0215-4e1b1b617918	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-88f8-d3d7abf3e8cf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-6ec7-5b3ba4951330	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-c5a9-91ec523a2b96	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-4510-8d8f4e9fe5eb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-1bfe-28b5771ffa39	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-1e24-cf455126415a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-84d0-61e68c856cf0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-e54d-2e54c4f4de5d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-5251-de4cd55975de	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-8508-82bd460696ad	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-22dd-d55c33617330	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-7eae-4c74e92699b8	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-2469-c3d6f5ab8af9	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-fdba-c1e2051d8dc1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-9d88-3f46a2f03c5e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-c7c1-830a03134d07	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-7646-9be080c7b07d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-5d2e-0999b577f3b7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-bf34-3276f0dbaf47	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-4a18-0f361eac4711	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-58a7-e0245f5c0a21	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-f2c3-19600ed2edfa	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-2fa7-f8ba0af70e0f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-5d06-3aa5a9ee947d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-4cad-355e3a6b40dc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-341c-d55cc0ac6b41	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-85d7-155a6c00b9a4	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-f0fb-93c92ed925de	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-e08c-340fef73c13c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-d8db-95766c7bb018	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-2a61-a74e41a34b22	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-d2b8-467c976e5d23	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-7c9e-e49b3ba449db	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-abeb-0c23cf37b257	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-7b29-e8f1cdb0e1e7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-6576-116ac79ac95e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-534f-b93e666f2cbd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-e3d8-e90bdacf052a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-1212-49faee056733	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-c312-1d43327350a4	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-4c7c-719bd61ab795	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-64d0-d9d256f2f452	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-00ca-c56f47611598	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-4d18-5e5564bd52b1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-525d-5d98abac6bb1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-8ec7-3585572af373	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-78a5-b4ab5f57428d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-6a53-a6f1a0c6a780	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-2903-24e3e439e3b9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-9981-9f27fcf1cce2	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-b6c2-f0e217fb5277	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-ecd2-c126b6204437	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-2a73-f91cce61c243	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-df31-802ec2da3a2b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-4b7b-9f1414ac0817	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-f5ac-9e9ee27f344d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-4b81-85999eb2b352	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-96ac-13d284581c05	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-832d-0fa89874a53e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-dc52-c393ecab9d2f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-ebb3-e85e5de8acc3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-c5e0-0f3f7e4f82ba	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-43d1-d7a3b1524fa0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-704b-0cfb9bfd9e34	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-fb02-d406ede0435a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-cc3c-52a7029a4d94	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-cf66-055f428b40ed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-5875-f6b08498cd16	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-3074-8837679d7a49	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-a3d3-252d75feab23	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-523d-960e33526a13	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-d3f1-c97330904df7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-591b-225023553a95	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-0912-40fc73320991	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-c6ba-8e4671cc7b9f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-8409-0f848fdcf7b8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-d623-ceb7885310e5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-0fca-5e153e6f3f26	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-448e-385111bed2c9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-0420-6005162e96e5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-0f95-654dfe637030	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-971e-d38cc3c640b3	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-215e-f10660884bd0	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-1f62-38d6a9d8a5ab	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-41e5-c45c5ae129c4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-4459-83f93381b169	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-5474-f4fb8606e6b1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-4100-ba74da9e2d41	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-cf22-fe68f8ba919c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-0eb5-92da635b9d0e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-ecc0-a02b2ab903e5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-1da1-987240447a44	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-0c7a-c9355d5cfc92	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-ddcc-044f453950bc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-d8c1-9cb9ccfbf686	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-ce9b-a0aeb507fb72	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-42cc-f3bd823d9943	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-11fd-fc3a1a448982	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-bbbf-673a9de20c29	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-1f04-bb59cb448832	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-9ac2-4c1bc889d3a3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-567e-8f0fb2119b87	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-b613-f0385c65cf52	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-e3cf-49488a809284	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-1baa-1c630ea3234e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-9114-3a3ca6f0661d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-9b3b-01dc71382359	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-f50d-76c617cee6b1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-faee-190c77c4018f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-0ff6-ccd5a269223d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-5da6-421a52c2fc46	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-817c-c59d45f7981f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-60ad-f2a3fd7b17fe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-a499-37faeb38094b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-f7a2-722917099c9e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-8653-4579d360b1d7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-f64d-755e856b2227	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-1da0-17ed333e8137	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-befc-d2e434a0efbe	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-99c1-28fe5bfc8059	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-66ae-9787f46fdb45	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-19bf-0e11c47d0984	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-78c1-b4e7595c740e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-e387-eaa1519dec02	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-f75c-b84d19986c90	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-3b49-adb14178fedc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-dcf6-99269d367532	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-98c9-fc3a318372d6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-7547-e5744932bd9d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-0479-1c03411d9f5e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-ce9f-b22a9d06b808	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-0312-3412d6a33cbe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-62cc-08384bf83098	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-1316-621cd2440034	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-88e3-ddd672713338	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-1935-f6bb529c0819	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-1174-56da47a5bd5b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-f4dd-e31ca275a81a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-a180-329c832ab640	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-f3b4-95e79befc491	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-7374-7d86d70639c2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-d491-5e593e3d581c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-2fd5-c28cf5f93914	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-3b4e-b61ec8e47622	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-da3b-605397b3a9c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-cff4-c47108f94b58	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-04bc-cdd19bb6d87c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-2f54-c71828c9d86d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-fade-f6b3512eee15	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-85b3-be917c35df2a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-182f-60287c5e8d73	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-f684-480b486bd1ba	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-5e5c-b4f8bd373aec	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-1570-f41ffcd74e24	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-6a7f-52bcc124f986	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-0fe9-2cf1d57f3547	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-dad0-d25be7e77321	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-ef97-a9c889cbf2f5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-11c9-54dd0bfab03f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-8480-6d7a9ff6702d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-dcfd-70f761ae0347	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-e78b-65f650c4ef31	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-1160-e4fcf20099ca	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-e701-306c5029d288	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-e43e-5b8e5551a85d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-3a4d-7ed613687614	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-1ea7-c937f5a9fd8c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-5ec8-7cdbdf121c8c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-52ff-db80a44050f6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-3594-cfcaaa2f9e71	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-f72c-c0e8bdf5b1e4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-f2ce-7111a7f6927d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-72dd-aa47789b1c55	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-979d-0861211ce8c6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-63cd-24768e6ef231	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-57d9-668f99ffd36d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-2bff-f0f6bb17ddfe	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-cdfe-01e8c8409c0d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-39c4-199526afa859	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-ca95-6e745ffd7275	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-b275-577e5cee4d99	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-8e33-fd62e5c69cc3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-c194-8145f13d9504	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-6fba-01745f3220ab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-a092-04e38a0beffc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-de16-46a0ded8d900	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-4de2-0da17ad2275b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-09dc-eb1411ed0b80	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-ce0c-3910c600a5dc	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-7d24-e1c178e186f8	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-37a5-1c2b4bf69066	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-67f7-5c8cd77e6fe2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-9b4a-e7536e9108a7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-ca8d-9a71db82ae3b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-578f-3cfe20481696	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-591e-8734ea2efd1e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-e4e8-2cbd43565775	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-9783-1b9af0957ef9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-4a5a-28354c161482	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-e032-ab0944488502	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-1509-8617dc81fc22	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-116a-525f5464f673	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-f58e-c28d3ac4c2e1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-eed0-75c5b0e0830b	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-49d2-791055f454c3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-fd43-d933fc6f1b1e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-c10c-c181f82ef03e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-0ba5-d3e7626f7475	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-add9-822b3f237976	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-030d-7d5fc500494d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-d0fd-58d207e08aac	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-fe82-5a58585e0120	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-1b60-c9f828ccc26d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-c81a-291e5c6b0fe3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-8472-9c7fab1d8779	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-f9aa-e62aceee7fc2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-f684-1a3c686e8998	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-51cc-e68d19f92ad3	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-636b-109bcd3645eb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-5577-696795ea65e1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-496c-6a6178f9d519	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-a2d7-6e2f1bdb0b6c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-36cd-5ea75728d910	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-b076-709c26b45ac9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-e522-ba954179213e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-7c90-4272d992469e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-21b2-4f32be84349b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-c02a-d9180f96787f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-b837-0dca48477047	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-fe11-4b27ef0773db	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-390e-7aae19e4eea4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-75b5-a187c22dea6e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-556d-8c39f1feded8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-b416-62ee1e416598	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-0db9-a98734987522	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-a3e6-8b582c4adf95	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-7dd6-474e33c732b1	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-944a-3e75b5d7687f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-9768-30a824db7b94	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-1d16-51326466c45d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-5eb0-d30f796d6dd5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-e672-37fda523f85f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-50e3-95c136413586	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-8abf-df5f47ca8dad	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-46ba-3d092d517b6a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-01ec-7cdcad2acff8	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-8ad9-8b564ac4b053	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-c5e7-1fd6855c47dc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-ff48-c1e74d7c72d8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-3f9d-df07b1d35e07	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-cce4-0c4211562fda	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-a734-8185d51f797e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-2dac-550ab3e31bb3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-12bc-a6a83443e5e8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-6a15-fa422261fc23	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-4b40-578be223fd90	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-c4ff-502bb24df843	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-6fc1-fce1f69b4b82	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-95fe-bb504bb5e904	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-165d-c6e36804c2fc	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-c94b-4dd98b19cabe	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-6284-df1cbd12b32b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-07d8-28ab039d9d05	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-21d7-cb1bdea7a9b9	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-45de-a0a1759ee717	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-33a2-10e782bc97c0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-5c32-26aa8e1598ee	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-254a-8d63fd96cfd3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-668e-69b2c70cf64f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-27af-2f4176ae47e3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-1a1a-37a8b394f1ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-7359-451704146666	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-c2b9-a5fe1d417907	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-bc43-f9f8e33bd902	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-9aae-728887d0a6c3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-2bd3-0a5be7d629e5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-3c4d-243f9a61e504	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-2c2b-19f8deca1ce6	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-ca18-056cc83e4da0	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-48e4-c6a3c1a5e58b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-0376-f342a18c4941	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-8ccb-9cf78dfbb537	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-b171-3e44e7c83cb6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-9309-1c60145d592f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-1869-f5e42d7d0bf4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-730f-79a93c85271b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-e336-65e8fb455e1f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-4fdb-53b135905c91	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-b86d-94365e64a185	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-4467-cd06763a4d2c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-1863-6c2d9e8f8031	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-8d0a-7158f2770c5b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-fb29-2b9d7eb6ebb4	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-7342-605d8c3b5c11	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-1a8f-2239f4e3c2fd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-d145-e5de3a23b1cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-fd00-6713d58f1503	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-4410-f3ac07834fa0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-4a9c-1c26ef2941cc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-c20f-6cb56d626d22	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-42f7-bd72fb033908	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-5a26-52dc28b530d0	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-d20c-73189ae07aa5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-2ac7-8318e1a81f24	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-268b-8bf3d2b4a8ba	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-a539-e4e68741e8a9	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-38d4-97b6d0677521	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-9d4b-05844198e1a0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-490b-0cfacd441727	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-cd0e-fcea475a4261	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-aaa3-a08245e409fa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-0e8c-e416310f3833	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-5512-20d67df32fe6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-77b3-61cb318fd07a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-2809-f780330f0c20	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-452f-8b14626e5b49	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-d3ea-53dff60df4ae	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-3ff8-5adaa10d6cef	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-0573-4e0ee7c0ad47	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-d47f-a3aa406ca7ad	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-3675-585579aa2c1d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-91cb-61b55ae0f8d2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-d260-0e80d734ee7b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-3d85-83149c5f9e98	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-8ccb-28c250ab3b57	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-58d9-0000f7b7eb2e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-10c8-6940366dd701	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-3634-90127647152e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-28fa-c9d857f63f98	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-8702-4b7f76fb7c0c	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-7953-60b7672b3088	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-4200-97607ade22e3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-e973-b2edc9f0f374	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-89b4-feeb52239815	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-3ef2-5dcf8b2f348c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-da83-e13078ff5b7b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-8a4c-4321a70b61d2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-c711-db1748dd5b3c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-4588-0912efa97e05	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-9f82-d0ce6685b593	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-6df9-e69721ccc665	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-3b8f-c01fe6dbbfde	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-bd26-ab964a378032	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-23f6-dbe60703793f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-5d71-d2773663799a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-999b-bc1e4daeb652	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-bfec-543974a2b95f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-7d65-1550750fd6a0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-15ea-37987a6d45dc	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-5c6d-593b124dd060	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-341b-a3e1f99f9d31	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-94e0-4b785542e036	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-584d-a71b7674d693	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-7669-c4a83fbbad1a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-7035-f1ad85f9c355	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-a591-07cbc6c08266	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-5f65-ed0d9f5c2866	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-3e39-d74879fee2ed	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-1910-096c4231f338	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-bf7a-792033da5059	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-d689-f5607043a6a4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-dbb9-8ac24f35d29f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-4e97-73fc3ee62416	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-1426-c6340a143107	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-cccc-63a954da1d72	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-c61f-8fe8fda1d4e9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-883a-7c95de161f3e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-8457-1576a6ade674	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-2819-0226423659b0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-bc72-4c1af0b7f8fe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-2fd5-f00686fd5176	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-d814-919bfdb8a373	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-f9fa-dc5026db7ef5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-1e51-c6d8cfaad5e9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-b885-840295dffdf4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-6d19-04abeb39b3b6	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-1a7b-e099f88c3bd2	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-623f-51c458c79c90	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-437d-151d0c7bfd86	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-594f-1a354ced5247	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-3b80-d62b5d662320	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-5de5-503b69b0bb15	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-44b4-bf2efc957d0f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-d9e7-54a0818a48a4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-6e51-63f68519f114	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-e548-aa184b88d116	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-d00e-c447c8a0b6ca	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-0fab-5e789ac8e784	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-d862-5628bcd9d1ce	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-3fb3-5ffcbf65f2c4	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-aeea-abdfaa2b5791	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-9fa0-cd2dad5c1fa2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-5572-6388fd2968fb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-2b9c-6c9d450c5394	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-531a-23b6fbaa0a85	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-cbe5-6d5082f95377	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-062a-3bc7d44ee75f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-0d3d-f706b1b6d98a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-24a4-b8203cdd10af	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-e071-ba9a2c091c60	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-a765-b91d0162c5b4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-e561-d9dd3cd745a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-4e17-b646c0a1d09f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-da0a-958b961b19ce	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-843c-ce1251fe8e6d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-1f8f-06e2659c544b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-7484-3b41de1c47ed	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-64b9-e4b6eba2d3e1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-2cfa-5f499cf42b18	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-d11e-1c11fe3c768b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-772e-df3015bf4b23	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-a02d-5159d4ac9d03	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-8cc9-84c2be930bfe	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-a76f-8734ff5db01f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-85b6-dfcce9595333	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-c364-7192385d5986	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-2798-13683515391c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-8698-cf58ebf8e851	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-e0c8-a19cc12a9c48	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-704e-aff1fee230bd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-ee29-deb6a738285a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-6f98-b6b3a98f2223	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-857e-72105e8b3a21	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-5a64-75ec3f72f79c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-c41e-0818af7ced18	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-1f26-b935e897c460	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-adf7-5235853d1420	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-2fda-2166cb1fa398	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-2149-8a7caa16d6ac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-c2bc-0f493a4c05bd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-97d0-188467ae5f40	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-4b1d-caa1f74fadcf	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-60b8-79261b803a1f	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-5000-1709d4237239	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-3397-76be145165c9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-ef46-e037f355b586	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-55da-1e8ada117bf1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-1cb9-e7fe761b9c6e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-e8d7-3f872cdbaa6c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-bed8-a083e05ffc7d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-902c-fb43d2f79e4e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-0eb1-19fcf4c5d8ac	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-8fec-c115eb3b298d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-d29b-7f3b7f682338	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-bc3e-7b0096e741dd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-b44d-96c19743fc57	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-e450-43c817c60db4	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-75a6-a4eabfdee53a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-bf0b-3a0cf027f364	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-5c4f-78427af9f63a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-df5c-fb5bd8951fb9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-de5d-6fd9019ee867	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-d98a-96e2ce691301	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-1ae9-879aa61855f0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-20d1-0f2fe7048d9c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-71d4-fbe94dcc1117	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-93c8-3d7b6c0d9d8b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-a97e-87866afaa9a0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-f00f-06a4df6a0a90	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-25ad-890606275061	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-0e92-ba4634ba2f79	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-a439-b2a02ddf1ede	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-4720-acace209b064	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-934a-4f9abd2f6c46	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-6929-243305cb12fc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-1e29-1dc38a9b1655	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-50df-fdf3dbd20690	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-902f-f77a00532efa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-c1c1-15469009ac08	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-7c92-f1d78cc9df2e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-74eb-ca3e9a1b184f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-2cd0-e579ce3ca503	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-0180-e730aee5b893	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-ef8e-6569b6065aa4	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-9356-f1011987c468	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-2952-cdc8443a3d80	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-3136-f5e6db67b70b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-af90-b75c59ca90a9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-d32e-14bf1c6e940b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-e41f-9a9e35ab5a51	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-1016-5727656f4750	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-8412-a3d7a03ef7c8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-74e4-6ce95133c150	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-f2ee-5b19d79d5945	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-c4cf-8a67fabbda8c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-1377-d4e8294e0511	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-e3d0-ca0d7f16f444	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-3c60-c1edd54512b8	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-6f70-1cda29901f35	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-8f3b-90ff95be90f3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-cd59-44bb2f255da5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-eb03-23f424068eab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-676f-c9e23bc5fdaf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-8d58-04cce497930b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-5e76-23e412ae99c5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-236b-9849ecb95ac1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-cf12-e323f1d3d561	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-8dbc-83b497c193f3	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-c95a-a6ceaf1db571	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-38ab-ac60e581280d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-1ce5-f412699437dd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-bc56-154f904aa8b8	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-f876-02601969f16b	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-b6db-6a2131b92ea2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-48d7-0c22fb6dc73d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-5874-b76483b16e23	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-7684-4872f56d052b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-2656-e427f76967c8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-2d42-9b8a5847eebb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-2b1b-df7b6327a721	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-4640-bca1594b0116	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-b921-05572200f3b8	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-7a3b-9232f94689d1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-c75c-a2ef5fc6c1a6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-9faf-c5f639cbc03a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-bac6-130fe3e426fb	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-b568-5258d894ebd0	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-a584-a5f11ae02a11	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-fbbe-8a11d55adc9a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-d85e-bc29b774eae0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-179a-1133671a1728	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-615d-6107fa92f9e2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-866f-2f763ffcc445	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-1b90-e936b54b1fb9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-0e74-bb489189238b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-30cc-729fa0927167	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-4dac-e8571fc506a8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-9af7-697b330cef66	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-13da-927acdd7e62a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-defa-9ab27838a708	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-1902-15c3baa0507f	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-9bf5-54bc09dcf365	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-17f8-1ac03981cbce	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-509c-f9c72e7b7dbf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df8-a807-aedde4b7c4e1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df8-166d-5226702e55ab	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df8-80d8-4877099f9c3e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df8-a5ac-0ec6a143487e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df8-5a81-39c66b6f61a1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df8-4604-133189e988a5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df8-cbe8-23767bc15b16	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df8-0d60-3646371b51b3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df8-87c7-ba05791de029	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df8-35b3-e830da2300b9	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df8-7153-3fcdc7f8002b	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df8-f3e1-995fa45cc72a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df8-9402-cacff29bd78f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df8-f03d-bfc7b897427d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-5953-11f154312469	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-e38e-13b188c57af2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-6ae2-321882afdac6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-6b7b-0b4d2602dfcd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-6b8b-06e75ee6baeb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-1f31-a395d9774aed	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-3f17-45e4574d3a7e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-8b78-421fecc84100	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-67fe-8b9822b36e0a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-3e97-3eabbcf751b0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-9040-570323c731e7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-61e5-97ae72cf00a2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-2cd9-8d2d8ca22cda	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-e47f-8610598d3aec	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-9955-c6154a371a03	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-f466-a7a5177f9f17	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-7c02-f1c2d89f0694	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-41cf-9746550a71f8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-9ab1-67f0b9aa6371	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-620d-daf69a4fdca6	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-2aab-986f1663cc55	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-6ffa-d19a1420fa2b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-ae44-24e3a10c82ae	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-9237-75f57a78a04b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-982c-64ae9c4275da	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-0595-9e0e004221ed	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-3f85-79dc3529ad7c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-afbc-141b7300df5b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-44de-2ae90e82c3cf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-ae6c-c2d2c532c182	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-babd-7d4b86852c4d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-fbe7-9499c22cb7b9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-26c3-c4808ca92a1a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-e2a5-06ec4465f253	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-9aca-ed3434bf0594	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-6d22-90c9826814fd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-b241-0549c453cbb8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-e151-832a85a1bc37	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-da07-7eec08b65102	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-d84e-52a96a72a555	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-3e64-78ab4e4148cc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-655d-10da0d83a95f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-6a20-a409d228269c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-d21c-2410cd1aa180	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-80c1-2141b0d74f1a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-1dd6-1fe59cb8e905	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-f8e7-a7653155e75e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-2513-4c15cbf8ea38	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-73a8-99ee4a47e796	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-d5c2-197d831a5384	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-733b-f57bfdebe508	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-fa5b-d6b048156a2f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-7a12-60780c27dd7e	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-7b4d-1598c0cf65f1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-c068-d7afdedd3d5b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-fd7e-b3b7b6be96ce	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-bc37-e813eed47586	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-62e7-ef23bff860aa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-6187-7259d9dc886d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-d663-e09663bc1416	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-a604-25b24c1c9020	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-72e7-7cc2f74aa7e5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-0bfa-6993bc194306	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-4920-d0c8b4c4e7bd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-d3da-d74421bf0926	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-788e-9d91e985934a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-61cc-42e4839f1cda	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-c053-27e1b8a26c71	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-2493-41f343c82143	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-cde4-a727b2bdedce	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-9fed-744f5c9cbafb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-d5fc-5adda811a786	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-0ad8-ea559596043a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-9ad4-65262701e626	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-ac4a-51a12c1c9b84	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-6b28-d393ecfd981e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-7831-a4e784a8c81f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-7c44-f3513fe45a16	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-1046-9bfd03d2a583	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-6875-ad3c131c20b0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-400b-ced1ec7067a6	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-4b81-d4cb858de5fa	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-131a-d982e3a26f9e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-df41-76d71d8d7959	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-b389-961d1d13b761	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-36f2-9cd2cf400573	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-6a4a-e4dfffd3100e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-77ed-25dfad304d6b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-6fb5-f4fbefbf6db6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-76f1-5dcdb2e1f366	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-3436-100fc8a922f0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-a896-d0e39ffd5f75	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-a41f-980c64c92ef8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-6a02-556658d3c2ad	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-95fc-37f99b75e6c1	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-a5da-365a14860826	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-3b07-17c360e5cd77	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-4a18-63af060b94b4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-b2f9-8e75ea0e3cf5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-d6b0-95a6e47da08d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-bfbc-de6fa6cc7cfe	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-8ad2-8dd8d8811200	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-7c2e-3f2e7af68ec6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-fa42-98e0da96e899	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-f389-6721261fedc7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-3919-630920ab3a92	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-a980-59f1726e37a4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-c8a4-3b782f3b53bc	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-b6b3-dee1e63e9138	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-90f7-cc70026c8aa3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-3c39-e86600fb9a71	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-0162-39daa5efdb5e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-76af-ae954d0cbaad	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-fdf1-a7309e4e8eb5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-d721-eada676a5f0c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-411e-6271f691d623	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-d49e-7dc49d086fa3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-6254-a8b883a09901	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-1cea-686a2f853e64	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-0482-39c0c7c8f53c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-189a-f4133f0d8f8b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-4f98-23f4539ef485	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-7511-9db6b7b466e1	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-e849-f715bd70a94b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-e88d-7316f6233f13	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-3fd4-d9f985e901eb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-deb2-d8c82be5159e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-8986-6c9865e04df6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-fb9b-fec6960274c6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-27ae-ec1aefee13f1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-fc55-b4bc1e759669	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-d822-1c3aa418a2d5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-07f9-1dc433b836e9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-7742-652ea0ae262d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-2346-0c77db340a8f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-0253-02aaf089d3ad	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-ca86-b82b3da9d94d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-5ddb-3a760bb90bd6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-d579-f32a8d1da9ad	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-93d8-849f41f412f6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-0eaa-cfc2a097ac6f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-db9d-bc7f1a404256	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-5151-0925fc6e8e60	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-3312-08f6bfe6f0d7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-9ad4-0788b61b1b6b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-5c00-19b860c1c7fa	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-b10f-e316b783b812	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-958b-da89c5a071bb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-3235-6041a183d88f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-4069-ad6e0cfcfd1d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-7610-b4390d432cbc	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-3d18-5093f05791f1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-688b-624c8d721284	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-50f5-c5a3740e9e30	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-41a6-1790ed2b2734	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-ad51-0201c86bba2d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-a117-79b15a7b6108	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-5859-256a910d3c01	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-a4ca-da10a520b5c4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-1562-34b563d7fb85	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-365f-78d51f0f1755	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-3291-866bb255a580	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-b99c-398984fe996d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-0109-885a84aadd1c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-15d5-e7c42ee7ba82	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-4ac2-c1fc58bb7abc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-3cc4-518ff8a186bb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-4722-cf07420cc68a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-4cb4-89dd40ce217a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-a504-3c514391ca0d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-136b-da57e1348914	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-cdae-7b5f7d410bc0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-96aa-a04294292679	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-6df9-9344-b2454eacd8c0	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-6df9-f100-d831fb260803	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-6df9-f815-985cba1f5f9d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-6df9-167a-0c9420e1a5a5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-6df9-5730-e6cb4352b1c7	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-6df9-650d-5bc6c82b759c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-6df9-57ae-f32b26fd6568	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-6df9-0664-53774ae15cda	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-6df9-5ffa-fc474f584784	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-6df9-f99c-afd2f852a51a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-6df9-1bf1-ec7b302d18b4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-6df9-f191-9f4e64e2d8a8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-6df9-896a-4734eff89c6a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-6df9-9f6e-cb70b85fc3bb	Drzava-read	Seznam držav	f
00020000-5537-6df9-4ba9-46b586118bfc	Drzava-write	Urejanje držav	f
00020000-5537-6df9-56b9-ddf7cb48162a	Popa-delete	Poslovni partner - Briši	f
00020000-5537-6df9-a90b-d40e68a0d501	Popa-list	Poslovni partner - Beri	f
00020000-5537-6df9-13c7-65850c3be85f	Popa-update	Poslovni partner - Posodobi	f
00020000-5537-6df9-2336-bbe477320878	Popa-create	Poslovni partner - Ustvari	f
00020000-5537-6df9-9427-a877a97b672d	Posta-delete	Pošta - Briši	f
00020000-5537-6df9-7bd1-44165c9d4323	Posta-list	Pošta - Beri	f
00020000-5537-6df9-e3b3-5b791846adb9	Posta-update	Pošta - Posodobi	f
00020000-5537-6df9-05b6-6c5d20256952	Posta-create	Pošta - Ustvari	f
00020000-5537-6df9-d8bb-49802aea61d0	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5537-6df9-5ce7-4f0ed5b80549	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5537-6df9-e834-b8e393c1f821	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5537-6df9-5642-fc5171f66336	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2863 (class 0 OID 2800840)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5537-6df9-08a9-20517525e485	00020000-5537-6df9-9f6e-cb70b85fc3bb
00000000-5537-6df9-08a9-20517525e485	00020000-5537-6df8-711b-627967ad57db
00000000-5537-6df9-d17b-4ff23f66679c	00020000-5537-6df9-4ba9-46b586118bfc
00000000-5537-6df9-d17b-4ff23f66679c	00020000-5537-6df9-9f6e-cb70b85fc3bb
\.


--
-- TOC entry 2888 (class 0 OID 2801112)
-- Dependencies: 201
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 2801119)
-- Dependencies: 202
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2903 (class 0 OID 2801256)
-- Dependencies: 216
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 2800941)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 2800968)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5537-6df7-09dd-4a6fb8a08828	8341	Adlešiči
00050000-5537-6df7-397a-3ca5e47dddde	5270	Ajdovščina
00050000-5537-6df7-72c1-9e021160500f	6280	Ankaran/Ancarano
00050000-5537-6df7-34c2-b3463e510256	9253	Apače
00050000-5537-6df7-9db4-36aa4399aaf7	8253	Artiče
00050000-5537-6df7-3910-ba40aeae7e8d	4275	Begunje na Gorenjskem
00050000-5537-6df7-e33d-3146ecd6f423	1382	Begunje pri Cerknici
00050000-5537-6df7-ccf9-cb1b83c1ab1d	9231	Beltinci
00050000-5537-6df7-76a2-336c3247cab4	2234	Benedikt
00050000-5537-6df7-d31a-5bb7451f67b5	2345	Bistrica ob Dravi
00050000-5537-6df7-59f4-04ed6d7f4ab4	3256	Bistrica ob Sotli
00050000-5537-6df7-2b5d-eb961f5cd965	8259	Bizeljsko
00050000-5537-6df7-b52d-e7ab21bfbaba	1223	Blagovica
00050000-5537-6df7-70fc-4cc9c4dd8954	8283	Blanca
00050000-5537-6df7-31bc-51b16f24d859	4260	Bled
00050000-5537-6df7-5dcc-90950e5b1109	4273	Blejska Dobrava
00050000-5537-6df7-78d2-b55dbe5d8b75	9265	Bodonci
00050000-5537-6df7-9001-8bdf8d11e1ac	9222	Bogojina
00050000-5537-6df7-ea90-70dc3250cd67	4263	Bohinjska Bela
00050000-5537-6df7-8b5f-575dffd86613	4264	Bohinjska Bistrica
00050000-5537-6df7-d5c8-8c7e99e6dec0	4265	Bohinjsko jezero
00050000-5537-6df7-8855-9efac323539c	1353	Borovnica
00050000-5537-6df7-7afa-4d07197bd025	8294	Boštanj
00050000-5537-6df7-d282-9de5812b4582	5230	Bovec
00050000-5537-6df7-43b2-60eea2b133cb	5295	Branik
00050000-5537-6df7-0029-aedfab3899e4	3314	Braslovče
00050000-5537-6df7-c6ab-450f07312f00	5223	Breginj
00050000-5537-6df7-8368-4feaa6b01b8f	8280	Brestanica
00050000-5537-6df7-9a27-ec17cce15a4f	2354	Bresternica
00050000-5537-6df7-48f4-ddb90429de45	4243	Brezje
00050000-5537-6df7-8bc5-a777b1d0c6ce	1351	Brezovica pri Ljubljani
00050000-5537-6df7-f137-465d3cd1143e	8250	Brežice
00050000-5537-6df7-c62a-ba13c5e664f1	4210	Brnik - Aerodrom
00050000-5537-6df7-2fee-0adbeaa629db	8321	Brusnice
00050000-5537-6df7-f87a-4a4d1703eb7a	3255	Buče
00050000-5537-6df7-54f0-a34543f78e91	8276	Bučka 
00050000-5537-6df7-487c-0b030ee29e50	9261	Cankova
00050000-5537-6df7-15d3-900f85e76837	3000	Celje 
00050000-5537-6df7-f9e6-750779d94250	3001	Celje - poštni predali
00050000-5537-6df7-525d-e2bd2e688527	4207	Cerklje na Gorenjskem
00050000-5537-6df7-407d-97c9b2ba7308	8263	Cerklje ob Krki
00050000-5537-6df7-2b80-8e2aa5dd3618	1380	Cerknica
00050000-5537-6df7-0e9c-79f41d4ff0d7	5282	Cerkno
00050000-5537-6df7-3377-724db4361a79	2236	Cerkvenjak
00050000-5537-6df7-17f4-e7614475dad2	2215	Ceršak
00050000-5537-6df7-17c3-e66e1d11bb68	2326	Cirkovce
00050000-5537-6df7-9a85-62306ae073c3	2282	Cirkulane
00050000-5537-6df7-ae08-dfea4b688f77	5273	Col
00050000-5537-6df7-f2ee-4a48bf852163	8251	Čatež ob Savi
00050000-5537-6df7-8616-c3a8eccc876c	1413	Čemšenik
00050000-5537-6df7-2f67-57d433ee3f12	5253	Čepovan
00050000-5537-6df7-5580-8d2a6690f48c	9232	Črenšovci
00050000-5537-6df7-8d04-e142c6bb2d92	2393	Črna na Koroškem
00050000-5537-6df7-ce22-6997fc240f97	6275	Črni Kal
00050000-5537-6df7-a8bf-98b35c9863e7	5274	Črni Vrh nad Idrijo
00050000-5537-6df7-b55d-5a77a6db606c	5262	Črniče
00050000-5537-6df7-bf51-60fbfc53556b	8340	Črnomelj
00050000-5537-6df7-b9ee-263176c1d93d	6271	Dekani
00050000-5537-6df7-587d-7bb23c8ec25a	5210	Deskle
00050000-5537-6df7-86f5-f23a57d1a5bf	2253	Destrnik
00050000-5537-6df7-5160-9a40ab753d9c	6215	Divača
00050000-5537-6df7-5627-afe5c903d54b	1233	Dob
00050000-5537-6df7-9b33-4a2638641042	3224	Dobje pri Planini
00050000-5537-6df7-7fed-f8b2b1204be7	8257	Dobova
00050000-5537-6df7-057b-563a1a51f98e	1423	Dobovec
00050000-5537-6df7-1ca8-4e133c8534dd	5263	Dobravlje
00050000-5537-6df7-d22d-ae26494f4b75	3204	Dobrna
00050000-5537-6df7-03d4-c86569ab8895	8211	Dobrnič
00050000-5537-6df7-e1a0-cefa4dd77515	1356	Dobrova
00050000-5537-6df7-ebbd-832101a32f2d	9223	Dobrovnik/Dobronak 
00050000-5537-6df7-c796-a9ea05056a08	5212	Dobrovo v Brdih
00050000-5537-6df7-17d7-bef948950847	1431	Dol pri Hrastniku
00050000-5537-6df7-6bfb-a0df2ba555c3	1262	Dol pri Ljubljani
00050000-5537-6df7-bc09-8dc4b9ed31bb	1273	Dole pri Litiji
00050000-5537-6df7-f422-11327a187cde	1331	Dolenja vas
00050000-5537-6df7-4135-f7488da9747a	8350	Dolenjske Toplice
00050000-5537-6df7-6683-28523f38b601	1230	Domžale
00050000-5537-6df7-a7a8-71ea379e6115	2252	Dornava
00050000-5537-6df7-ae22-6d6f26da24ba	5294	Dornberk
00050000-5537-6df7-d625-65994e8f5b60	1319	Draga
00050000-5537-6df7-fd26-50d72d87e8cd	8343	Dragatuš
00050000-5537-6df7-0a0f-14a8e83d41f6	3222	Dramlje
00050000-5537-6df7-796f-f44d29aec4ed	2370	Dravograd
00050000-5537-6df7-cfc7-5a544e121721	4203	Duplje
00050000-5537-6df7-70cc-b2b86657091c	6221	Dutovlje
00050000-5537-6df7-b0eb-88365f04b7d9	8361	Dvor
00050000-5537-6df7-d9aa-8cc0724cfe4a	2343	Fala
00050000-5537-6df7-6002-4068b067fa4f	9208	Fokovci
00050000-5537-6df7-bf35-40452b997926	2313	Fram
00050000-5537-6df7-08f4-1fea6e513f99	3213	Frankolovo
00050000-5537-6df7-752d-62f6b231d2fb	1274	Gabrovka
00050000-5537-6df7-8b52-28b180f79b90	8254	Globoko
00050000-5537-6df7-f199-451145b0fb9d	5275	Godovič
00050000-5537-6df7-0e57-47c2e42f0e43	4204	Golnik
00050000-5537-6df7-cd5a-50040730e70f	3303	Gomilsko
00050000-5537-6df7-85c6-d30fafb58d77	4224	Gorenja vas
00050000-5537-6df7-0b72-de1d3b14e3b0	3263	Gorica pri Slivnici
00050000-5537-6df7-cd2b-882ac77fc1a3	2272	Gorišnica
00050000-5537-6df7-29ee-dc6cd8bad4bd	9250	Gornja Radgona
00050000-5537-6df7-2f29-ad2fde257025	3342	Gornji Grad
00050000-5537-6df7-9efa-dab5ac42f547	4282	Gozd Martuljek
00050000-5537-6df7-1512-e662ee9fe51b	6272	Gračišče
00050000-5537-6df7-d37c-b37e274bb050	9264	Grad
00050000-5537-6df7-23d0-056fbb40da31	8332	Gradac
00050000-5537-6df7-6791-92a6f17bed7a	1384	Grahovo
00050000-5537-6df7-3a34-021d55879aed	5242	Grahovo ob Bači
00050000-5537-6df7-40c1-bb977e7b6643	5251	Grgar
00050000-5537-6df7-d99c-3f2f2f80c630	3302	Griže
00050000-5537-6df7-ed01-90efcea88c32	3231	Grobelno
00050000-5537-6df7-694c-7b5ffdc914a1	1290	Grosuplje
00050000-5537-6df7-170d-a80599c43e9d	2288	Hajdina
00050000-5537-6df7-a140-4f17caf2b9a9	8362	Hinje
00050000-5537-6df7-e7d5-c67a7791ba92	2311	Hoče
00050000-5537-6df7-a916-649eefbd667d	9205	Hodoš/Hodos
00050000-5537-6df7-4469-13a1921c0295	1354	Horjul
00050000-5537-6df7-e188-66147e261509	1372	Hotedršica
00050000-5537-6df7-3870-433c4ecaf2bd	1430	Hrastnik
00050000-5537-6df7-c35f-074c25c1ece5	6225	Hruševje
00050000-5537-6df7-db90-21f9d405cee6	4276	Hrušica
00050000-5537-6df7-bd91-be44365abcf0	5280	Idrija
00050000-5537-6df7-a1e5-96931e2b7239	1292	Ig
00050000-5537-6df7-6aa6-dd0c6171bdab	6250	Ilirska Bistrica
00050000-5537-6df7-c863-34173f1098e4	6251	Ilirska Bistrica-Trnovo
00050000-5537-6df7-9c63-273b6647245f	1295	Ivančna Gorica
00050000-5537-6df7-a8c4-213cf431d935	2259	Ivanjkovci
00050000-5537-6df7-a4fa-71a2d8d8ccc6	1411	Izlake
00050000-5537-6df7-e6fb-249ca627da70	6310	Izola/Isola
00050000-5537-6df7-8e61-593938c6dc3b	2222	Jakobski Dol
00050000-5537-6df7-b3e9-34e4dfec3d65	2221	Jarenina
00050000-5537-6df7-b7ac-7aa4398e45f7	6254	Jelšane
00050000-5537-6df7-b31d-50a8a70d296a	4270	Jesenice
00050000-5537-6df7-dbf8-7b5efddb775b	8261	Jesenice na Dolenjskem
00050000-5537-6df7-2757-b1540e716a98	3273	Jurklošter
00050000-5537-6df7-3526-15b421329a16	2223	Jurovski Dol
00050000-5537-6df7-cd29-dfae87775455	2256	Juršinci
00050000-5537-6df7-1759-3d3757dfc0b0	5214	Kal nad Kanalom
00050000-5537-6df7-34c1-3dad6db65490	3233	Kalobje
00050000-5537-6df7-e32d-406966b532fa	4246	Kamna Gorica
00050000-5537-6df7-12f2-b5ee80b8835d	2351	Kamnica
00050000-5537-6df7-c245-567af2347efb	1241	Kamnik
00050000-5537-6df7-3b7f-9522c7310bcc	5213	Kanal
00050000-5537-6df7-daae-e3fdfd380383	8258	Kapele
00050000-5537-6df7-4faf-77c68a6d3984	2362	Kapla
00050000-5537-6df7-f224-d0c6afbe9966	2325	Kidričevo
00050000-5537-6df7-b439-9da4631107e1	1412	Kisovec
00050000-5537-6df7-736e-585d9ea6f961	6253	Knežak
00050000-5537-6df7-caae-e42d7223a3c5	5222	Kobarid
00050000-5537-6df7-5a57-036a87f2ca1c	9227	Kobilje
00050000-5537-6df7-9084-a5e3d6804470	1330	Kočevje
00050000-5537-6df7-624d-37f4e2a96c85	1338	Kočevska Reka
00050000-5537-6df7-17e0-fec69731c4e1	2276	Kog
00050000-5537-6df7-3f19-69a6ae07c790	5211	Kojsko
00050000-5537-6df7-beb7-6ca46743549b	6223	Komen
00050000-5537-6df7-b966-5a3d57926421	1218	Komenda
00050000-5537-6df7-6a92-a150e8d506ca	6000	Koper/Capodistria 
00050000-5537-6df7-baa5-3d5a5eb1a4c6	6001	Koper/Capodistria - poštni predali
00050000-5537-6df7-5a2c-1ca13d8b956d	8282	Koprivnica
00050000-5537-6df7-5b33-28f789326edd	5296	Kostanjevica na Krasu
00050000-5537-6df7-f445-404b0d5aa820	8311	Kostanjevica na Krki
00050000-5537-6df7-90a3-0d6879ca71cc	1336	Kostel
00050000-5537-6df7-599a-401f51d0f87b	6256	Košana
00050000-5537-6df7-12cb-40be37669560	2394	Kotlje
00050000-5537-6df7-86c6-f0f4ea9a2870	6240	Kozina
00050000-5537-6df7-1168-883708ea4cb4	3260	Kozje
00050000-5537-6df7-38ea-29ae7ed9b5ba	4000	Kranj 
00050000-5537-6df7-f9ac-5e1c955155e7	4001	Kranj - poštni predali
00050000-5537-6df7-b952-cab21ad7f174	4280	Kranjska Gora
00050000-5537-6df7-bff7-1bf61782caf8	1281	Kresnice
00050000-5537-6df7-344d-56d81ba4d73e	4294	Križe
00050000-5537-6df7-29d1-c40f921046ff	9206	Križevci
00050000-5537-6df7-4707-bd6aa43a2330	9242	Križevci pri Ljutomeru
00050000-5537-6df7-3634-7c5b465aaa90	1301	Krka
00050000-5537-6df7-57d3-44c8f5efd55f	8296	Krmelj
00050000-5537-6df7-7380-d232cae339c3	4245	Kropa
00050000-5537-6df7-741a-f519a040d7f9	8262	Krška vas
00050000-5537-6df7-4989-d2f53c85eadd	8270	Krško
00050000-5537-6df7-1ed9-d4c2431ac99c	9263	Kuzma
00050000-5537-6df7-a1d7-5b99dde4a4ba	2318	Laporje
00050000-5537-6df7-e88e-a478209e30cc	3270	Laško
00050000-5537-6df7-3aed-9ee7a2cbb4c3	1219	Laze v Tuhinju
00050000-5537-6df7-d59e-473e40ba6515	2230	Lenart v Slovenskih goricah
00050000-5537-6df7-66fe-676463835a0b	9220	Lendava/Lendva
00050000-5537-6df7-a74e-6517eeb7538d	4248	Lesce
00050000-5537-6df7-a819-a88ab11bb510	3261	Lesično
00050000-5537-6df7-7ee7-87cf202fadb7	8273	Leskovec pri Krškem
00050000-5537-6df7-f0f5-299a806284ce	2372	Libeliče
00050000-5537-6df7-b2b9-90ebe7a8cdec	2341	Limbuš
00050000-5537-6df7-e267-af0242ffdf6b	1270	Litija
00050000-5537-6df7-d0bf-07da2d276e36	3202	Ljubečna
00050000-5537-6df7-802c-cd97d73d94c9	1000	Ljubljana 
00050000-5537-6df7-e065-b2e79f49f89d	1001	Ljubljana - poštni predali
00050000-5537-6df7-bac3-e5ed3e71ec5c	1231	Ljubljana - Črnuče
00050000-5537-6df7-b4df-2446bbb04c9a	1261	Ljubljana - Dobrunje
00050000-5537-6df7-d82d-dcd33a08e408	1260	Ljubljana - Polje
00050000-5537-6df7-9af1-79903461f522	1210	Ljubljana - Šentvid
00050000-5537-6df7-227b-3d9585f14b20	1211	Ljubljana - Šmartno
00050000-5537-6df7-441e-26ffc8b40987	3333	Ljubno ob Savinji
00050000-5537-6df7-a5c0-6e36419b8f20	9240	Ljutomer
00050000-5537-6df7-ad46-fa3a958da987	3215	Loče
00050000-5537-6df7-b58c-384f48c9d8ff	5231	Log pod Mangartom
00050000-5537-6df7-dd51-098dc637c1b5	1358	Log pri Brezovici
00050000-5537-6df7-aa3c-60ec3edd80fd	1370	Logatec
00050000-5537-6df7-e41d-8951855a76b3	1371	Logatec
00050000-5537-6df7-6e06-830d77039b15	1434	Loka pri Zidanem Mostu
00050000-5537-6df7-7e51-67fa1c6e54cd	3223	Loka pri Žusmu
00050000-5537-6df7-7039-2392141c839e	6219	Lokev
00050000-5537-6df7-5f6a-18b9384b904c	1318	Loški Potok
00050000-5537-6df7-94e8-67e17b37e6c9	2324	Lovrenc na Dravskem polju
00050000-5537-6df7-8163-d56c1ee96091	2344	Lovrenc na Pohorju
00050000-5537-6df7-437e-2703d3f76bd9	3334	Luče
00050000-5537-6df7-66ec-b697fd6e2589	1225	Lukovica
00050000-5537-6df7-0706-22875d86a371	9202	Mačkovci
00050000-5537-6df7-e264-b84140894112	2322	Majšperk
00050000-5537-6df7-c0e8-6afebca173be	2321	Makole
00050000-5537-6df7-d939-26aec10cedb7	9243	Mala Nedelja
00050000-5537-6df7-eecf-1302de4cafed	2229	Malečnik
00050000-5537-6df7-d651-7c53ad9738e7	6273	Marezige
00050000-5537-6df7-bb9c-4e09be976229	2000	Maribor 
00050000-5537-6df7-cc2d-6257caf17187	2001	Maribor - poštni predali
00050000-5537-6df7-b1b5-86d7bcae3402	2206	Marjeta na Dravskem polju
00050000-5537-6df7-70e2-a95b6565dea0	2281	Markovci
00050000-5537-6df7-2b19-e709e13de464	9221	Martjanci
00050000-5537-6df7-a1eb-71cd23617daf	6242	Materija
00050000-5537-6df7-d027-5ca4b7002c17	4211	Mavčiče
00050000-5537-6df7-f068-0bd4c9e74102	1215	Medvode
00050000-5537-6df7-76e4-5cbfd44de1b3	1234	Mengeš
00050000-5537-6df7-25eb-652e5eab34d2	8330	Metlika
00050000-5537-6df7-ce9d-db093bb91754	2392	Mežica
00050000-5537-6df7-ccb5-d4e5fb8c9f4f	2204	Miklavž na Dravskem polju
00050000-5537-6df7-6a14-dfe07334d3f6	2275	Miklavž pri Ormožu
00050000-5537-6df7-7b84-ec0c91b79135	5291	Miren
00050000-5537-6df7-f7ea-e891d0397547	8233	Mirna
00050000-5537-6df7-7670-c02a1fba3f72	8216	Mirna Peč
00050000-5537-6df7-eb0d-44bf96043403	2382	Mislinja
00050000-5537-6df7-fc00-0a81eab92a46	4281	Mojstrana
00050000-5537-6df7-3e6b-d109c289f587	8230	Mokronog
00050000-5537-6df7-306f-bd4b6b30cb80	1251	Moravče
00050000-5537-6df7-bb6f-d22e9f398ee0	9226	Moravske Toplice
00050000-5537-6df7-3eee-36ea4f07194a	5216	Most na Soči
00050000-5537-6df7-3c57-cd820d68a102	1221	Motnik
00050000-5537-6df7-da52-825831fac6d9	3330	Mozirje
00050000-5537-6df7-b10a-7ba88628afd8	9000	Murska Sobota 
00050000-5537-6df7-de2a-67e281879209	9001	Murska Sobota - poštni predali
00050000-5537-6df7-0a3f-2ece5a30acc7	2366	Muta
00050000-5537-6df7-7cc3-ac790d569b7d	4202	Naklo
00050000-5537-6df7-aa28-6d88f2a11c64	3331	Nazarje
00050000-5537-6df7-9f9d-5dc4720280e7	1357	Notranje Gorice
00050000-5537-6df7-16df-6e0fac288568	3203	Nova Cerkev
00050000-5537-6df7-f5e7-1a014f43d7fd	5000	Nova Gorica 
00050000-5537-6df7-cde4-0a1049182d0c	5001	Nova Gorica - poštni predali
00050000-5537-6df7-b789-eb477c656d18	1385	Nova vas
00050000-5537-6df7-cf25-a58ae82273d0	8000	Novo mesto
00050000-5537-6df7-1ab4-f1c38a05f563	8001	Novo mesto - poštni predali
00050000-5537-6df7-7fab-fb16fa2ff925	6243	Obrov
00050000-5537-6df7-3693-76f2d45cf7e3	9233	Odranci
00050000-5537-6df7-6c05-b875db8a3ecf	2317	Oplotnica
00050000-5537-6df7-45df-f09b54b8effb	2312	Orehova vas
00050000-5537-6df7-3712-c1798fe086bf	2270	Ormož
00050000-5537-6df7-82dd-7b381378596c	1316	Ortnek
00050000-5537-6df7-153e-eb0df0bb345d	1337	Osilnica
00050000-5537-6df7-3fde-1a1a8e128d89	8222	Otočec
00050000-5537-6df7-6cbe-406033862aa8	2361	Ožbalt
00050000-5537-6df7-9318-f5b99c7f0d23	2231	Pernica
00050000-5537-6df7-9efe-144878797be6	2211	Pesnica pri Mariboru
00050000-5537-6df7-bd1a-acc9ae5ff9cd	9203	Petrovci
00050000-5537-6df7-1a66-922b72aff3fa	3301	Petrovče
00050000-5537-6df7-3d31-0a7d04b925f3	6330	Piran/Pirano
00050000-5537-6df7-24f9-eded1991e747	8255	Pišece
00050000-5537-6df7-fe22-0ecebb5f8b71	6257	Pivka
00050000-5537-6df7-551b-5ff70ac56683	6232	Planina
00050000-5537-6df7-a9cc-8715ce86ccc0	3225	Planina pri Sevnici
00050000-5537-6df7-600b-f8fcbc7eb98c	6276	Pobegi
00050000-5537-6df7-4d9c-870df73520fd	8312	Podbočje
00050000-5537-6df7-e422-4a2b7a0b651d	5243	Podbrdo
00050000-5537-6df7-a84d-19df314dafe4	3254	Podčetrtek
00050000-5537-6df7-63f1-eab921e9e802	2273	Podgorci
00050000-5537-6df7-b953-de1e683aa49b	6216	Podgorje
00050000-5537-6df7-919e-5181c2886e96	2381	Podgorje pri Slovenj Gradcu
00050000-5537-6df7-2139-836b2bd3c78f	6244	Podgrad
00050000-5537-6df7-5508-ce71f0e76fdb	1414	Podkum
00050000-5537-6df7-fc98-09b7dc2b17b7	2286	Podlehnik
00050000-5537-6df7-6a37-a994c250b84d	5272	Podnanos
00050000-5537-6df7-3d7e-ff2c2be51a94	4244	Podnart
00050000-5537-6df7-aba9-8237c07b8116	3241	Podplat
00050000-5537-6df7-7197-695ec65e9e62	3257	Podsreda
00050000-5537-6df7-d55d-b29ee373e724	2363	Podvelka
00050000-5537-6df7-4589-03dced875fc3	2208	Pohorje
00050000-5537-6df7-ba3e-41290a9de7b2	2257	Polenšak
00050000-5537-6df7-9022-e55028e3fd76	1355	Polhov Gradec
00050000-5537-6df7-f55e-ef3184647d6a	4223	Poljane nad Škofjo Loko
00050000-5537-6df7-d048-5d9942a38b05	2319	Poljčane
00050000-5537-6df7-1c15-12c979308e01	1272	Polšnik
00050000-5537-6df7-8b50-1b912c9134d0	3313	Polzela
00050000-5537-6df7-a5f0-7ad561b77a0c	3232	Ponikva
00050000-5537-6df7-9eb9-57956ecc39b7	6320	Portorož/Portorose
00050000-5537-6df7-06c0-99ef3bae4ea3	6230	Postojna
00050000-5537-6df7-0429-a65a8f583f76	2331	Pragersko
00050000-5537-6df7-983f-41297e6c2511	3312	Prebold
00050000-5537-6df7-9c02-542b8a8703ef	4205	Preddvor
00050000-5537-6df7-bd2d-c1c9a1e5cfe5	6255	Prem
00050000-5537-6df7-81d6-d1e18a3b2bea	1352	Preserje
00050000-5537-6df7-4870-6e511b65c3be	6258	Prestranek
00050000-5537-6df7-8d7a-410c22c50996	2391	Prevalje
00050000-5537-6df7-100a-2a1218c6d4bd	3262	Prevorje
00050000-5537-6df7-43bb-a1f99eb47d84	1276	Primskovo 
00050000-5537-6df7-05bd-259b0723d38a	3253	Pristava pri Mestinju
00050000-5537-6df7-329e-1a400460c8d9	9207	Prosenjakovci/Partosfalva
00050000-5537-6df7-7355-5e1d72e49f52	5297	Prvačina
00050000-5537-6df7-670f-08f9140930b7	2250	Ptuj
00050000-5537-6df7-022e-6b2dcb010292	2323	Ptujska Gora
00050000-5537-6df7-9f6c-ae042c5556d0	9201	Puconci
00050000-5537-6df7-b6cd-e94677da5bd6	2327	Rače
00050000-5537-6df7-0039-ef83eb0d724d	1433	Radeče
00050000-5537-6df7-c78e-8b52fa85c9c6	9252	Radenci
00050000-5537-6df7-6dc2-98c48c272bc0	2360	Radlje ob Dravi
00050000-5537-6df7-ab00-607a5c64c6b1	1235	Radomlje
00050000-5537-6df7-09ce-a4e6ca51f84c	4240	Radovljica
00050000-5537-6df7-bccd-182454be9df0	8274	Raka
00050000-5537-6df7-7387-543a12f94daf	1381	Rakek
00050000-5537-6df7-07f1-b28542e1282f	4283	Rateče - Planica
00050000-5537-6df7-4b7e-883cc9d79d72	2390	Ravne na Koroškem
00050000-5537-6df7-1af7-23795740bc34	9246	Razkrižje
00050000-5537-6df7-1447-27993a7c39cb	3332	Rečica ob Savinji
00050000-5537-6df7-edac-6cfdd4bed858	5292	Renče
00050000-5537-6df7-8831-79c77270fa5c	1310	Ribnica
00050000-5537-6df7-2a8e-311e7b682059	2364	Ribnica na Pohorju
00050000-5537-6df7-70b7-c753aa580785	3272	Rimske Toplice
00050000-5537-6df7-2179-2981d1bb9da1	1314	Rob
00050000-5537-6df7-fc88-52e5f1190f72	5215	Ročinj
00050000-5537-6df7-9332-97000f7b0e6c	3250	Rogaška Slatina
00050000-5537-6df7-e904-e077e83626fc	9262	Rogašovci
00050000-5537-6df7-56da-a1d96f6611b2	3252	Rogatec
00050000-5537-6df7-0629-16aecf6e0f4a	1373	Rovte
00050000-5537-6df7-827c-f02fa27f90a2	2342	Ruše
00050000-5537-6df7-be53-2b6dfafcbe56	1282	Sava
00050000-5537-6df7-6fa6-b64bd91055bf	6333	Sečovlje/Sicciole
00050000-5537-6df7-598d-b18f0744c62f	4227	Selca
00050000-5537-6df7-a908-8146fab6e816	2352	Selnica ob Dravi
00050000-5537-6df7-0172-3a22ba95252e	8333	Semič
00050000-5537-6df7-a8aa-101eb1a34794	8281	Senovo
00050000-5537-6df7-3966-2ee259982732	6224	Senožeče
00050000-5537-6df7-5a39-23b556c6a051	8290	Sevnica
00050000-5537-6df7-b008-70306823e41c	6210	Sežana
00050000-5537-6df7-73ee-1c0b877f3cda	2214	Sladki Vrh
00050000-5537-6df7-2a0c-a70d7fc76d30	5283	Slap ob Idrijci
00050000-5537-6df7-a32b-b9e34225a7cb	2380	Slovenj Gradec
00050000-5537-6df7-e990-b75217304522	2310	Slovenska Bistrica
00050000-5537-6df7-1a55-1ebd14db3070	3210	Slovenske Konjice
00050000-5537-6df7-b7ee-4171075a860f	1216	Smlednik
00050000-5537-6df7-e8b1-cda99d677e99	5232	Soča
00050000-5537-6df7-951d-bbe940d0f8cd	1317	Sodražica
00050000-5537-6df7-7258-e80ef6bce12d	3335	Solčava
00050000-5537-6df7-ccf6-2b5fa09bb1ba	5250	Solkan
00050000-5537-6df7-10cd-f458ff752ade	4229	Sorica
00050000-5537-6df7-939f-c97e85dece3b	4225	Sovodenj
00050000-5537-6df7-c716-599f7b2437fc	5281	Spodnja Idrija
00050000-5537-6df7-9cf8-6eda1c532cdd	2241	Spodnji Duplek
00050000-5537-6df7-ae91-ae3af2bc5278	9245	Spodnji Ivanjci
00050000-5537-6df7-149a-9fe44d5ff196	2277	Središče ob Dravi
00050000-5537-6df7-9e7f-ae018c0b4698	4267	Srednja vas v Bohinju
00050000-5537-6df7-5570-c411619d3f4f	8256	Sromlje 
00050000-5537-6df7-ba1f-5ab11c638679	5224	Srpenica
00050000-5537-6df7-7e1c-4b3ff3be11ec	1242	Stahovica
00050000-5537-6df7-ea2a-5424d4422646	1332	Stara Cerkev
00050000-5537-6df7-fa24-3a20d599c5d4	8342	Stari trg ob Kolpi
00050000-5537-6df7-1b14-3197f67aa9bb	1386	Stari trg pri Ložu
00050000-5537-6df7-4be2-305f630c22a4	2205	Starše
00050000-5537-6df7-5624-d705a6650e5f	2289	Stoperce
00050000-5537-6df7-fff3-c0cea0e96b0e	8322	Stopiče
00050000-5537-6df7-b36a-e8a599a24f79	3206	Stranice
00050000-5537-6df7-a325-a02d180d876e	8351	Straža
00050000-5537-6df7-a884-c5cb45142b75	1313	Struge
00050000-5537-6df7-0147-89db05d982ae	8293	Studenec
00050000-5537-6df7-5caa-3797918d98ff	8331	Suhor
00050000-5537-6df7-2e4c-e94e50b03237	2233	Sv. Ana v Slovenskih goricah
00050000-5537-6df7-bea3-abcbb3dcdc61	2235	Sv. Trojica v Slovenskih goricah
00050000-5537-6df7-162d-481ca6ed5c99	2353	Sveti Duh na Ostrem Vrhu
00050000-5537-6df7-53ff-4839ec9bbab9	9244	Sveti Jurij ob Ščavnici
00050000-5537-6df7-f2ad-caaddd436160	3264	Sveti Štefan
00050000-5537-6df7-039a-a86ff779f5c2	2258	Sveti Tomaž
00050000-5537-6df7-4ac8-fff704eca4bd	9204	Šalovci
00050000-5537-6df7-8992-57fddf6a6685	5261	Šempas
00050000-5537-6df7-8990-61587929b015	5290	Šempeter pri Gorici
00050000-5537-6df7-c01d-66642c107b36	3311	Šempeter v Savinjski dolini
00050000-5537-6df7-fb9e-f82399af3ab0	4208	Šenčur
00050000-5537-6df7-bc42-dcb9af84b6ee	2212	Šentilj v Slovenskih goricah
00050000-5537-6df7-6fff-33410995ac15	8297	Šentjanž
00050000-5537-6df7-a805-f3a438da3e2c	2373	Šentjanž pri Dravogradu
00050000-5537-6df7-78e6-25251bfb2a87	8310	Šentjernej
00050000-5537-6df7-fcc3-f85e2bc97631	3230	Šentjur
00050000-5537-6df7-cbc3-326e409ae33c	3271	Šentrupert
00050000-5537-6df7-0341-ad98a0cb997d	8232	Šentrupert
00050000-5537-6df7-6294-5ce5e5216a33	1296	Šentvid pri Stični
00050000-5537-6df7-167f-622eda64cf22	8275	Škocjan
00050000-5537-6df7-578e-dc8baef1d7a7	6281	Škofije
00050000-5537-6df7-9295-f6ff643bbeb1	4220	Škofja Loka
00050000-5537-6df7-7e1f-09dfc5872f41	3211	Škofja vas
00050000-5537-6df7-be4f-ce322f0cac5d	1291	Škofljica
00050000-5537-6df7-cd56-c20a7bd622b1	6274	Šmarje
00050000-5537-6df7-aa57-95bef8e4f71e	1293	Šmarje - Sap
00050000-5537-6df7-dfff-5e7a6487036e	3240	Šmarje pri Jelšah
00050000-5537-6df7-78c4-18baa86d7545	8220	Šmarješke Toplice
00050000-5537-6df7-0281-feb5edaa4d82	2315	Šmartno na Pohorju
00050000-5537-6df7-6ddf-86d455d834c9	3341	Šmartno ob Dreti
00050000-5537-6df7-05c4-370ed1081525	3327	Šmartno ob Paki
00050000-5537-6df7-4b04-d3b41144d105	1275	Šmartno pri Litiji
00050000-5537-6df7-7a9e-d74c5864eefb	2383	Šmartno pri Slovenj Gradcu
00050000-5537-6df7-74a5-63f39c37d779	3201	Šmartno v Rožni dolini
00050000-5537-6df7-ce38-60b18167ede0	3325	Šoštanj
00050000-5537-6df7-75df-0a657c8b213d	6222	Štanjel
00050000-5537-6df7-cc39-dcd321917c06	3220	Štore
00050000-5537-6df7-3350-8463447b5e39	3304	Tabor
00050000-5537-6df7-452c-4de696d83f8f	3221	Teharje
00050000-5537-6df7-d653-9a7e08c8baca	9251	Tišina
00050000-5537-6df7-c398-72a37ae95bf7	5220	Tolmin
00050000-5537-6df7-9640-a3b95aced9d9	3326	Topolšica
00050000-5537-6df7-5d6c-64bdc636aa3b	2371	Trbonje
00050000-5537-6df7-6ea3-7550415f4105	1420	Trbovlje
00050000-5537-6df7-71d1-a044fcaec8bd	8231	Trebelno 
00050000-5537-6df7-64b5-e9d900eaf901	8210	Trebnje
00050000-5537-6df7-0f7d-6ed8618189c8	5252	Trnovo pri Gorici
00050000-5537-6df7-7416-e149acdb54d8	2254	Trnovska vas
00050000-5537-6df7-5cfb-b007633883f0	1222	Trojane
00050000-5537-6df7-794b-43687af53d63	1236	Trzin
00050000-5537-6df7-7d23-8f7cd5f3d360	4290	Tržič
00050000-5537-6df7-8ebf-26147e4e3d4b	8295	Tržišče
00050000-5537-6df7-6335-66667498dd22	1311	Turjak
00050000-5537-6df7-0913-9575bd999e2b	9224	Turnišče
00050000-5537-6df7-b477-2667457ef860	8323	Uršna sela
00050000-5537-6df7-8089-608ce3521a8d	1252	Vače
00050000-5537-6df7-1bfc-8c426ff7b627	3320	Velenje 
00050000-5537-6df7-2684-37d1f80d941d	3322	Velenje - poštni predali
00050000-5537-6df7-b4f4-b421872e058f	8212	Velika Loka
00050000-5537-6df7-131a-be7556a09f09	2274	Velika Nedelja
00050000-5537-6df7-bd2f-ec976cf672e8	9225	Velika Polana
00050000-5537-6df7-9eef-801967ddfdfc	1315	Velike Lašče
00050000-5537-6df7-b889-8e29b87efa42	8213	Veliki Gaber
00050000-5537-6df7-1fc5-19db06505996	9241	Veržej
00050000-5537-6df7-b526-9ffbf0d68b07	1312	Videm - Dobrepolje
00050000-5537-6df7-82cf-1aa06b3e395d	2284	Videm pri Ptuju
00050000-5537-6df7-a9dd-5a6cde5fab1c	8344	Vinica
00050000-5537-6df7-5045-8febf76957a3	5271	Vipava
00050000-5537-6df7-9bd9-9ecb3d0952fb	4212	Visoko
00050000-5537-6df7-9e88-9e3640ecaad7	1294	Višnja Gora
00050000-5537-6df7-736b-dcfea28fd980	3205	Vitanje
00050000-5537-6df7-c5c3-8e0ac32f43af	2255	Vitomarci
00050000-5537-6df7-79cf-bee401f12c4a	1217	Vodice
00050000-5537-6df7-aea7-b7a93fe53ff7	3212	Vojnik\t
00050000-5537-6df7-41b8-344569bceb92	5293	Volčja Draga
00050000-5537-6df7-1964-c76d096f66bb	2232	Voličina
00050000-5537-6df7-4d71-76e089c2ed5f	3305	Vransko
00050000-5537-6df7-d213-6b84bd3c1f20	6217	Vremski Britof
00050000-5537-6df7-2b73-f2e09498c83b	1360	Vrhnika
00050000-5537-6df7-8921-3aa40fc5bf97	2365	Vuhred
00050000-5537-6df7-da7b-86a1a15bc8ec	2367	Vuzenica
00050000-5537-6df7-f73d-6d284a2ea7f0	8292	Zabukovje 
00050000-5537-6df7-3c3e-b6f268c7517f	1410	Zagorje ob Savi
00050000-5537-6df7-c926-5e8b8aafe135	1303	Zagradec
00050000-5537-6df7-4a31-8903d7e94da2	2283	Zavrč
00050000-5537-6df7-9542-883d8fb1bbbc	8272	Zdole 
00050000-5537-6df7-d07c-7505dd0f8c41	4201	Zgornja Besnica
00050000-5537-6df7-4f56-e2cfff1e2bde	2242	Zgornja Korena
00050000-5537-6df7-90b3-100f1ae78b7d	2201	Zgornja Kungota
00050000-5537-6df7-fcf4-04451744f72b	2316	Zgornja Ložnica
00050000-5537-6df7-756e-42145665bce1	2314	Zgornja Polskava
00050000-5537-6df7-5bc5-2a024290eda2	2213	Zgornja Velka
00050000-5537-6df7-8c77-ff8e9e2c29da	4247	Zgornje Gorje
00050000-5537-6df7-626b-092a6e4f0f5c	4206	Zgornje Jezersko
00050000-5537-6df7-6bfc-ca54c7799eee	2285	Zgornji Leskovec
00050000-5537-6df7-45f5-62c230d97326	1432	Zidani Most
00050000-5537-6df7-3586-505145e67069	3214	Zreče
00050000-5537-6df7-5f54-393f72134a89	4209	Žabnica
00050000-5537-6df7-964e-fb367761b678	3310	Žalec
00050000-5537-6df7-ee51-6411a17f7367	4228	Železniki
00050000-5537-6df7-67a0-5f37ce917eba	2287	Žetale
00050000-5537-6df7-0962-7de2694a9bc7	4226	Žiri
00050000-5537-6df7-22e9-a9673bd4f32e	4274	Žirovnica
00050000-5537-6df7-a8b7-b243444d4dad	8360	Žužemberk
\.


--
-- TOC entry 2890 (class 0 OID 2801127)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 2789301)
-- Dependencies: 170
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 2800976)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 2801053)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 2801133)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2904 (class 0 OID 2801270)
-- Dependencies: 217
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 2801279)
-- Dependencies: 218
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 2801140)
-- Dependencies: 205
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 2801149)
-- Dependencies: 206
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2894 (class 0 OID 2801158)
-- Dependencies: 207
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2906 (class 0 OID 2801286)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2907 (class 0 OID 2801296)
-- Dependencies: 220
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 2800821)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5537-6df9-7b09-ef0ef0dda63a	00010000-5537-6df9-975b-86525c795b98	2015-04-22 09:46:36	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO8gT42.MjX08iAUKYDPDjMHGFS4pivjG";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2895 (class 0 OID 2801168)
-- Dependencies: 208
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 2800830)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5537-6df9-b687-435017edf9db	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5537-6df9-dfac-0eedbfc1d54d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5537-6df9-08a9-20517525e485	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5537-6df9-0dc3-77124e8dc63f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5537-6df9-eb49-e86ddebee0a9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5537-6df9-d17b-4ff23f66679c	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2865 (class 0 OID 2800860)
-- Dependencies: 178
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5537-6df9-7b09-ef0ef0dda63a	00000000-5537-6df9-0dc3-77124e8dc63f
00010000-5537-6df9-975b-86525c795b98	00000000-5537-6df9-0dc3-77124e8dc63f
\.


--
-- TOC entry 2896 (class 0 OID 2801174)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 2801186)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 2801061)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 2800991)
-- Dependencies: 188
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 2801086)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 2801306)
-- Dependencies: 221
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 2800999)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 2800847)
-- Dependencies: 177
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5537-6df9-975b-86525c795b98	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO./eDMBGJfZA/UdE1nQ.Vf2BRcdm7h7C	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5537-6df9-7b09-ef0ef0dda63a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2909 (class 0 OID 2801315)
-- Dependencies: 222
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 2801067)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 2801192)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2910 (class 0 OID 2801333)
-- Dependencies: 223
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 2801073)
-- Dependencies: 197
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2911 (class 0 OID 2801341)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2912 (class 0 OID 2801351)
-- Dependencies: 225
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2503 (class 2606 OID 2800875)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 2801204)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 2801224)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 2801242)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 2801025)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 2801039)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 2800888)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 2801252)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 2801045)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 2801051)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 2798088)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 2801103)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 2801111)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 2800903)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 2800913)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 2800965)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2519 (class 2606 OID 2800938)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 2800844)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2486 (class 2606 OID 2800818)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 2801117)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 2801126)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 2801266)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 2800958)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 2800974)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 2801131)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 2789311)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 2800987)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 2801057)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 2801137)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 2801276)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 2801284)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 2801147)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 2801153)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 2801163)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 2801295)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 2801303)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 2800829)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 2801172)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 2800864)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2490 (class 2606 OID 2800838)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 2801182)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 2801191)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 2801066)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 2800996)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 2801095)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 2801314)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 2801010)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 2800859)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 2801329)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 2801071)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 2801198)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 2801339)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 2801085)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 2801350)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 2801360)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 1259 OID 2801032)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2521 (class 1259 OID 2800960)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2476 (class 1259 OID 2789313)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2477 (class 1259 OID 2789312)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2478 (class 1259 OID 2789314)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2586 (class 1259 OID 2801118)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2594 (class 1259 OID 2801139)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 2801138)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2571 (class 1259 OID 2801072)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2641 (class 1259 OID 2801255)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2642 (class 1259 OID 2801253)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2643 (class 1259 OID 2801254)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2644 (class 1259 OID 2801267)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2645 (class 1259 OID 2801268)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2646 (class 1259 OID 2801269)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2664 (class 1259 OID 2801332)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2665 (class 1259 OID 2801331)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2666 (class 1259 OID 2801330)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2541 (class 1259 OID 2801012)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2542 (class 1259 OID 2801011)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2525 (class 1259 OID 2800967)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 2800966)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2517 (class 1259 OID 2800940)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2613 (class 1259 OID 2801173)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2563 (class 1259 OID 2801052)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 2800845)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2493 (class 1259 OID 2800846)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2616 (class 1259 OID 2801185)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2617 (class 1259 OID 2801184)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2618 (class 1259 OID 2801183)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2564 (class 1259 OID 2801058)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2565 (class 1259 OID 2801060)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2566 (class 1259 OID 2801059)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2607 (class 1259 OID 2801167)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2608 (class 1259 OID 2801165)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2609 (class 1259 OID 2801164)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2610 (class 1259 OID 2801166)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2498 (class 1259 OID 2800865)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2499 (class 1259 OID 2800866)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2623 (class 1259 OID 2801199)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2591 (class 1259 OID 2801132)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2658 (class 1259 OID 2801304)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2659 (class 1259 OID 2801305)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2532 (class 1259 OID 2800989)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2533 (class 1259 OID 2800988)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2534 (class 1259 OID 2800990)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2649 (class 1259 OID 2801277)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2650 (class 1259 OID 2801278)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2628 (class 1259 OID 2801207)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 2801206)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2630 (class 1259 OID 2801209)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2631 (class 1259 OID 2801205)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2632 (class 1259 OID 2801208)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2669 (class 1259 OID 2801340)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2601 (class 1259 OID 2801157)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2602 (class 1259 OID 2801156)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2603 (class 1259 OID 2801154)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2604 (class 1259 OID 2801155)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2481 (class 1259 OID 2798090)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2635 (class 1259 OID 2801226)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 2801225)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2560 (class 1259 OID 2801046)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2513 (class 1259 OID 2800915)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2514 (class 1259 OID 2800914)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2537 (class 1259 OID 2800997)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2538 (class 1259 OID 2800998)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2576 (class 1259 OID 2801098)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 2801097)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2578 (class 1259 OID 2801096)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2548 (class 1259 OID 2801034)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2549 (class 1259 OID 2801030)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2550 (class 1259 OID 2801027)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2551 (class 1259 OID 2801028)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2552 (class 1259 OID 2801026)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2553 (class 1259 OID 2801031)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2554 (class 1259 OID 2801029)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2524 (class 1259 OID 2800959)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2506 (class 1259 OID 2800889)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2507 (class 1259 OID 2800891)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2508 (class 1259 OID 2800890)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2509 (class 1259 OID 2800892)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2583 (class 1259 OID 2801104)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2520 (class 1259 OID 2800939)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2512 (class 1259 OID 2800904)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2600 (class 1259 OID 2801148)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2484 (class 1259 OID 2798089)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2531 (class 1259 OID 2800975)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2655 (class 1259 OID 2801285)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2491 (class 1259 OID 2800839)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2555 (class 1259 OID 2801033)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2696 (class 2606 OID 2801471)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2699 (class 2606 OID 2801456)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2698 (class 2606 OID 2801461)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2694 (class 2606 OID 2801481)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2700 (class 2606 OID 2801451)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2695 (class 2606 OID 2801476)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2697 (class 2606 OID 2801466)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2684 (class 2606 OID 2801401)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 2801536)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2713 (class 2606 OID 2801551)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2714 (class 2606 OID 2801546)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2706 (class 2606 OID 2801511)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2735 (class 2606 OID 2801666)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2737 (class 2606 OID 2801656)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2736 (class 2606 OID 2801661)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2710 (class 2606 OID 2801531)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2740 (class 2606 OID 2801671)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2739 (class 2606 OID 2801676)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2738 (class 2606 OID 2801681)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2746 (class 2606 OID 2801721)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2747 (class 2606 OID 2801716)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2748 (class 2606 OID 2801711)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2692 (class 2606 OID 2801446)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 2801441)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 2801411)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2686 (class 2606 OID 2801406)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2682 (class 2606 OID 2801396)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2683 (class 2606 OID 2801391)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2723 (class 2606 OID 2801596)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2702 (class 2606 OID 2801491)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 2801361)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2676 (class 2606 OID 2801366)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2724 (class 2606 OID 2801611)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2725 (class 2606 OID 2801606)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2726 (class 2606 OID 2801601)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2705 (class 2606 OID 2801496)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 2801506)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2704 (class 2606 OID 2801501)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2719 (class 2606 OID 2801591)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2721 (class 2606 OID 2801581)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2722 (class 2606 OID 2801576)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2720 (class 2606 OID 2801586)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2679 (class 2606 OID 2801371)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2678 (class 2606 OID 2801376)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2727 (class 2606 OID 2801616)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2712 (class 2606 OID 2801541)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2745 (class 2606 OID 2801701)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2744 (class 2606 OID 2801706)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2688 (class 2606 OID 2801421)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 2801416)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2687 (class 2606 OID 2801426)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2742 (class 2606 OID 2801686)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2741 (class 2606 OID 2801691)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2730 (class 2606 OID 2801631)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2731 (class 2606 OID 2801626)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2728 (class 2606 OID 2801641)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2732 (class 2606 OID 2801621)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2729 (class 2606 OID 2801636)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2749 (class 2606 OID 2801726)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2715 (class 2606 OID 2801571)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2716 (class 2606 OID 2801566)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2718 (class 2606 OID 2801556)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2717 (class 2606 OID 2801561)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2733 (class 2606 OID 2801651)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2734 (class 2606 OID 2801646)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2701 (class 2606 OID 2801486)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2743 (class 2606 OID 2801696)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2680 (class 2606 OID 2801386)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2681 (class 2606 OID 2801381)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2691 (class 2606 OID 2801431)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 2801436)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 2801526)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2708 (class 2606 OID 2801521)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2709 (class 2606 OID 2801516)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-22 11:46:41 CEST

--
-- PostgreSQL database dump complete
--

