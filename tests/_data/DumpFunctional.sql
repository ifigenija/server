--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-04-20 23:00:37 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 2764724)
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
-- TOC entry 210 (class 1259 OID 2765051)
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
-- TOC entry 211 (class 1259 OID 2765061)
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
-- TOC entry 212 (class 1259 OID 2765078)
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
-- TOC entry 188 (class 1259 OID 2764864)
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
-- TOC entry 189 (class 1259 OID 2764886)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 2764733)
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
-- TOC entry 213 (class 1259 OID 2765094)
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
-- TOC entry 190 (class 1259 OID 2764891)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 191 (class 1259 OID 2764898)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 181 (class 1259 OID 2764773)
-- Name: kose; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kose (
    id uuid NOT NULL,
    user_id uuid,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) NOT NULL,
    priimek character varying(255) NOT NULL,
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
-- TOC entry 197 (class 1259 OID 2764950)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 198 (class 1259 OID 2764956)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 179 (class 1259 OID 2764750)
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
-- TOC entry 180 (class 1259 OID 2764762)
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
-- TOC entry 224 (class 1259 OID 2789281)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) NOT NULL,
    priimek character varying(255) NOT NULL,
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
-- TOC entry 183 (class 1259 OID 2764815)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 170 (class 1259 OID 2764668)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 174 (class 1259 OID 2764698)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 2764963)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 2764970)
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
-- TOC entry 214 (class 1259 OID 2765107)
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
-- TOC entry 182 (class 1259 OID 2764794)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid,
    sifra character varying(4) NOT NULL,
    tipkli character varying(20) DEFAULT NULL::character varying NOT NULL,
    stakli character varying(2) DEFAULT NULL::character varying,
    naziv character varying(60) NOT NULL,
    naziv1 character varying(60) DEFAULT NULL::character varying,
    email character varying(50) DEFAULT NULL::character varying,
    url character varying(100) DEFAULT NULL::character varying,
    opomba text,
    idddv character varying(18) DEFAULT NULL::character varying,
    maticna character varying(20) DEFAULT NULL::character varying,
    zavezanec character varying(1) DEFAULT NULL::character varying,
    jeeu character varying(1) DEFAULT NULL::character varying,
    datzav date,
    datnzav date,
    zamejstvo boolean NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 2764822)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 2764978)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 225 (class 1259 OID 2789301)
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
-- TOC entry 185 (class 1259 OID 2764830)
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
-- TOC entry 192 (class 1259 OID 2764904)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 2764984)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 2765121)
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
-- TOC entry 216 (class 1259 OID 2765130)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 2764991)
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
-- TOC entry 204 (class 1259 OID 2765000)
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
-- TOC entry 205 (class 1259 OID 2765009)
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
-- TOC entry 217 (class 1259 OID 2765137)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 2765147)
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
-- TOC entry 172 (class 1259 OID 2764679)
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
-- TOC entry 171 (class 1259 OID 2764677)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 206 (class 1259 OID 2765019)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 173 (class 1259 OID 2764688)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 2764717)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 2765025)
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
-- TOC entry 208 (class 1259 OID 2765037)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 2764912)
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
-- TOC entry 186 (class 1259 OID 2764845)
-- Name: telefonska; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE telefonska (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    vrsta character varying(20) NOT NULL,
    stevilka character varying(30) NOT NULL,
    privzeta boolean NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 2764937)
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
-- TOC entry 219 (class 1259 OID 2765157)
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
-- TOC entry 187 (class 1259 OID 2764852)
-- Name: trr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trr (
    id uuid NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    stevilka character varying(255) NOT NULL,
    swift character varying(255) DEFAULT NULL::character varying,
    bic character varying(255) DEFAULT NULL::character varying,
    banka character varying(255) NOT NULL
);


--
-- TOC entry 175 (class 1259 OID 2764705)
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
-- TOC entry 220 (class 1259 OID 2765166)
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
-- TOC entry 194 (class 1259 OID 2764918)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 209 (class 1259 OID 2765043)
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
-- TOC entry 221 (class 1259 OID 2765184)
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
-- TOC entry 195 (class 1259 OID 2764924)
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
-- TOC entry 222 (class 1259 OID 2765192)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 2765202)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2329 (class 2604 OID 2764682)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2851 (class 0 OID 2764724)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 2765051)
-- Dependencies: 210
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 2765061)
-- Dependencies: 211
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2886 (class 0 OID 2765078)
-- Dependencies: 212
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 2764864)
-- Dependencies: 188
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 2764886)
-- Dependencies: 189
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 2764733)
-- Dependencies: 178
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5534-f327-3671-d90b56583da9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5534-f327-6ca8-5458c0ed61c0	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5534-f327-090c-564c7550b26f	AL	ALB	008	Albania 	Albanija	\N
00040000-5534-f327-bb97-35641675201e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5534-f327-8d43-fad1f233c7b9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5534-f327-4832-e71fb4eb1f2e	AD	AND	020	Andorra 	Andora	\N
00040000-5534-f327-5a3d-9c29e0d231e1	AO	AGO	024	Angola 	Angola	\N
00040000-5534-f327-9abc-2be9b6224621	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5534-f327-2731-3d337671afc4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5534-f327-790f-8ff8bfdd46a7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5534-f327-5f93-c2c3eb29493a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5534-f327-888b-5feb87e5efd8	AM	ARM	051	Armenia 	Armenija	\N
00040000-5534-f327-3efa-959f64e9aed4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5534-f327-9055-ef51bb4de72f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5534-f327-a00d-22fac6331554	AT	AUT	040	Austria 	Avstrija	\N
00040000-5534-f327-1c2b-0a6c8b4c49d8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5534-f327-4682-dac94b29e971	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5534-f327-174d-1ffc92e0137e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5534-f327-116a-98a575e8713b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5534-f327-c73e-72d98ca20c9c	BB	BRB	052	Barbados 	Barbados	\N
00040000-5534-f327-32a7-d30a0920bd8b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5534-f327-5c5d-b575a1d18e86	BE	BEL	056	Belgium 	Belgija	\N
00040000-5534-f327-bafe-cbd2488e030d	BZ	BLZ	084	Belize 	Belize	\N
00040000-5534-f327-c09b-e0aa5448f293	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5534-f327-aa2a-4166278bc550	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5534-f327-4238-8e5ed6fc3e8a	BT	BTN	064	Bhutan 	Butan	\N
00040000-5534-f327-5e8f-e52888d11b01	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5534-f327-39c9-047011156fd2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5534-f327-49f7-b8bc1b140851	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5534-f327-8935-665fff317704	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5534-f327-20ad-cd9edc272add	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5534-f327-d795-b134b41f380f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5534-f327-51dc-814b4dfa8625	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5534-f327-78a1-71d04e0b76f7	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5534-f327-6536-4554c19c066d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5534-f327-f8bd-4ebdfb8eef46	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5534-f327-8dbf-a6db8704622b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5534-f327-96db-a46082eb3936	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5534-f327-4185-b59470c8f1a3	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5534-f327-1e24-94447ee04ea3	CA	CAN	124	Canada 	Kanada	\N
00040000-5534-f327-d2b3-fa2bb84f0b35	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5534-f327-8ec6-bcdc54684f95	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5534-f327-41fb-d2336b097465	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5534-f327-dc93-657ec111f6c3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5534-f327-b8e0-ef4f0b930a7d	CL	CHL	152	Chile 	Čile	\N
00040000-5534-f327-5a9d-9178a4ffd216	CN	CHN	156	China 	Kitajska	\N
00040000-5534-f327-fc4f-68e463e7bded	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5534-f327-0cee-32dce93815ff	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5534-f327-1a74-6d8f2ab2bbca	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5534-f327-954d-25a151c25525	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5534-f327-409b-4ea16d4b735d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5534-f327-ae59-98804b5078b6	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5534-f327-51ef-10d956c12d6a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5534-f327-19a8-ed88cfe12762	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5534-f327-4e29-c36d6ab282b0	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5534-f327-0ba0-8a94405aaecc	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5534-f327-0e39-c2e134bfbdf7	CU	CUB	192	Cuba 	Kuba	\N
00040000-5534-f327-1362-a576b8a74cdd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5534-f327-d576-7371358066e6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5534-f327-8f02-eafaf4411c47	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5534-f327-9553-562944e074a8	DK	DNK	208	Denmark 	Danska	\N
00040000-5534-f327-2318-f3a92ebdecae	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5534-f327-140f-e6196b210445	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5534-f327-91d9-dc8636381875	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5534-f327-5694-5b1964b25574	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5534-f327-bd57-aa9aa8c27fac	EG	EGY	818	Egypt 	Egipt	\N
00040000-5534-f327-9c8b-7f26c3e5fb83	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5534-f327-5dc1-e2100899b9a5	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5534-f327-87ae-ab445fb1ed94	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5534-f327-49f7-97e09e352ffe	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5534-f327-3fcc-3e4f1fafbc3b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5534-f327-0383-a5db8ff13880	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5534-f327-5888-c70bd60f5208	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5534-f327-9978-ccfbe48e9939	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5534-f327-b048-959a5b7be415	FI	FIN	246	Finland 	Finska	\N
00040000-5534-f327-1792-be95f2cee176	FR	FRA	250	France 	Francija	\N
00040000-5534-f327-3224-9c1793eb8a21	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5534-f327-924a-16b0e6577cdf	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5534-f327-c7b2-4f5f5d45e31b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5534-f327-fc54-7390eaaaed63	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5534-f327-e68d-22cff294bbc0	GA	GAB	266	Gabon 	Gabon	\N
00040000-5534-f327-4505-8919f9ac8e40	GM	GMB	270	Gambia 	Gambija	\N
00040000-5534-f327-2b42-5717b81b2aac	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5534-f327-1968-a84e557a3266	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5534-f327-9771-0d144ae2eb86	GH	GHA	288	Ghana 	Gana	\N
00040000-5534-f327-cef7-cccf189c50b3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5534-f327-d2c1-8de1bfd9801e	GR	GRC	300	Greece 	Grčija	\N
00040000-5534-f327-4f2b-970f4ac390b8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5534-f327-0a3e-a4f542ad34ba	GD	GRD	308	Grenada 	Grenada	\N
00040000-5534-f327-26ee-49ee23f7c878	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5534-f327-54fc-f9bb96ccbe2f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5534-f327-aeb1-7927bd856688	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5534-f327-57c3-d4da0ec0d317	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5534-f327-1844-fdec027a1a63	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5534-f327-5701-67501e16f5c7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5534-f327-e88d-c28617c6a9f5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5534-f327-d58c-afa08d8f9719	HT	HTI	332	Haiti 	Haiti	\N
00040000-5534-f327-f710-b445b2337594	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5534-f327-9ce8-6efe51cf9d2b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5534-f327-a27f-9290be0803fa	HN	HND	340	Honduras 	Honduras	\N
00040000-5534-f327-a736-538e4db4af39	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5534-f327-0f68-cc2b946d9cb7	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5534-f327-62c6-0824809e65d0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5534-f327-831a-219908613e5c	IN	IND	356	India 	Indija	\N
00040000-5534-f327-b5b6-3518cb22a0e5	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5534-f327-9168-39348fa8c996	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5534-f327-4176-07b94c3f4c7f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5534-f327-b01f-10e79ca202e5	IE	IRL	372	Ireland 	Irska	\N
00040000-5534-f327-8ff8-5bd2fced9b6a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5534-f327-17ec-5c99bf7b73ad	IL	ISR	376	Israel 	Izrael	\N
00040000-5534-f327-9b28-4358ed1702c7	IT	ITA	380	Italy 	Italija	\N
00040000-5534-f327-53d5-f1fe25f69c16	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5534-f327-b784-0178ad3be309	JP	JPN	392	Japan 	Japonska	\N
00040000-5534-f327-4f19-fe219083c72d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5534-f327-7e05-a603a4e9f6a8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5534-f327-7536-317a94e288a6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5534-f327-9d8f-366aafb3f4d1	KE	KEN	404	Kenya 	Kenija	\N
00040000-5534-f327-a930-c86fa0de6983	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5534-f327-04fd-c5f699256a00	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5534-f327-c92a-baa26033621d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5534-f327-3d9d-97228df9c22d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5534-f327-ce63-c25083ddf620	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5534-f327-f8c2-6d09210b8901	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5534-f327-448e-2f00219b6ff2	LV	LVA	428	Latvia 	Latvija	\N
00040000-5534-f327-dfff-112019e01c43	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5534-f327-f503-8350357a86fb	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5534-f327-a393-ec9b1bd062c1	LR	LBR	430	Liberia 	Liberija	\N
00040000-5534-f327-3e32-1615f20e82c9	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5534-f327-cf3e-66b4ff5c0c9e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5534-f327-4b37-a7c698f46d62	LT	LTU	440	Lithuania 	Litva	\N
00040000-5534-f327-f757-494e2d3a5ba3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5534-f327-c043-a5cfcd8846ea	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5534-f327-6654-e0ae3dbc458a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5534-f327-3c0b-c6d68af74668	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5534-f327-a058-246d383a871f	MW	MWI	454	Malawi 	Malavi	\N
00040000-5534-f327-7849-3683029d74eb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5534-f327-895b-ec8f41967f6f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5534-f327-a70a-419efbc945ed	ML	MLI	466	Mali 	Mali	\N
00040000-5534-f327-9801-547f58f636c6	MT	MLT	470	Malta 	Malta	\N
00040000-5534-f327-ea68-f8e2aecb28ff	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5534-f327-bcf3-4695acb9a140	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5534-f327-5b85-e7db7da6fc90	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5534-f327-945f-018883925016	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5534-f327-ac5e-9c77005e05b9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5534-f327-919f-df82152bdc87	MX	MEX	484	Mexico 	Mehika	\N
00040000-5534-f327-0447-5f7b621e8129	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5534-f327-f145-2b1cf8ab2ffb	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5534-f327-0f07-bc97001081c2	MC	MCO	492	Monaco 	Monako	\N
00040000-5534-f327-82c5-d0cad17aa36a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5534-f327-f6c2-f511961ce237	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5534-f327-b45a-1d2e89533d62	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5534-f327-1a83-1ab74b1f1198	MA	MAR	504	Morocco 	Maroko	\N
00040000-5534-f327-ead1-df9d90fa1f47	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5534-f327-28c8-01cfa02d6aa3	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5534-f327-da7c-e9ec8b694e3f	NA	NAM	516	Namibia 	Namibija	\N
00040000-5534-f327-a91f-0663da0da133	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5534-f327-2695-1505bd302265	NP	NPL	524	Nepal 	Nepal	\N
00040000-5534-f327-8aec-0d0254bc47a6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5534-f327-be61-ea867aab8f87	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5534-f327-6b19-8a674b1db87f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5534-f327-c743-919e9b25ca89	NE	NER	562	Niger 	Niger 	\N
00040000-5534-f327-74c3-09ef02968aa3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5534-f327-cc54-33483e7fbc1c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5534-f327-154c-71530c0213cc	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5534-f327-566f-ba8da0a99d8c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5534-f327-edde-a9caa54a0c1f	NO	NOR	578	Norway 	Norveška	\N
00040000-5534-f327-6a8a-63522cb045d6	OM	OMN	512	Oman 	Oman	\N
00040000-5534-f328-8950-f4bdbdf34963	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5534-f328-5f1e-f4c0f5b98c11	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5534-f328-fed6-b1d9fc3886cd	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5534-f328-9dfb-babe32830509	PA	PAN	591	Panama 	Panama	\N
00040000-5534-f328-228e-9f62ad960a80	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5534-f328-b914-7007f215ca42	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5534-f328-eb34-f3aa5b812f18	PE	PER	604	Peru 	Peru	\N
00040000-5534-f328-f5a7-e1d91fe35d5e	PH	PHL	608	Philippines 	Filipini	\N
00040000-5534-f328-66a6-0a0a52d883ba	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5534-f328-c314-735921d93b66	PL	POL	616	Poland 	Poljska	\N
00040000-5534-f328-b6d5-f64d767e4633	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5534-f328-5b5b-c1d55f36397d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5534-f328-56f2-6b8dde8c35d1	QA	QAT	634	Qatar 	Katar	\N
00040000-5534-f328-a66e-9356a9c2e6fd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5534-f328-f2e4-ba2b99331079	RO	ROU	642	Romania 	Romunija	\N
00040000-5534-f328-deda-66c495262b51	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5534-f328-2eab-f080e884d32c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5534-f328-f832-9b481dc55aad	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5534-f328-46d0-c60525f6d390	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5534-f328-6c1f-1247b8bb4999	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5534-f328-6a22-9dd03761d712	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5534-f328-9cac-6834026afff2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5534-f328-ffbe-ec08ec362de3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5534-f328-e6df-f348efd95cf2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5534-f328-e9c3-37b843fdcf2d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5534-f328-c437-30602a42abcb	SM	SMR	674	San Marino 	San Marino	\N
00040000-5534-f328-4417-aaba22e75bc8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5534-f328-12fd-232cfb4f1eab	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5534-f328-38d6-dbe4be45c156	SN	SEN	686	Senegal 	Senegal	\N
00040000-5534-f328-fcab-cb74c04d7279	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5534-f328-d3bf-a2b8f31df9d6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5534-f328-bdcf-029fac753901	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5534-f328-5dd0-62f25c77a458	SG	SGP	702	Singapore 	Singapur	\N
00040000-5534-f328-de35-3f2478a86b0c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5534-f328-b3a5-1242fbab7d59	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5534-f328-e03b-85c84bcee112	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5534-f328-5ed1-1a74749189ce	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5534-f328-b080-991ed7da1128	SO	SOM	706	Somalia 	Somalija	\N
00040000-5534-f328-f3c3-056c2f2b695f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5534-f328-da96-495306614f84	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5534-f328-eeb4-c4f06c48d066	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5534-f328-cb0e-d0f7ce53a795	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5534-f328-07fb-7c7d622ae246	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5534-f328-75d1-f804b9e32f97	SD	SDN	729	Sudan 	Sudan	\N
00040000-5534-f328-487e-f5532893a64b	SR	SUR	740	Suriname 	Surinam	\N
00040000-5534-f328-92f1-e7a1dddc53c8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5534-f328-5ada-2c949abf7a4c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5534-f328-00ff-fcb0960435c0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5534-f328-e37b-3adcb915b8f8	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5534-f328-08d8-46601d46a581	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5534-f328-9e1b-2e64b0459df7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5534-f328-50ee-7b78149a41f1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5534-f328-a39b-c041255f19bd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5534-f328-37fc-4d6f5ce935dd	TH	THA	764	Thailand 	Tajska	\N
00040000-5534-f328-2db8-a947160f5db2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5534-f328-cf85-32b256936882	TG	TGO	768	Togo 	Togo	\N
00040000-5534-f328-e2f4-ffc4863f0831	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5534-f328-9927-7f2a128a2474	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5534-f328-8c13-a284f99e3183	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5534-f328-1d6f-23fcf719a182	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5534-f328-a111-b6e566a2f1aa	TR	TUR	792	Turkey 	Turčija	\N
00040000-5534-f328-abd0-765d3f2750ff	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5534-f328-4211-d9a474b41682	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5534-f328-fc73-ce62090ddc11	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5534-f328-d7ef-d0badb32cd0f	UG	UGA	800	Uganda 	Uganda	\N
00040000-5534-f328-479f-01e7b8bdee6e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5534-f328-5cb5-8068b5c5d2c9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5534-f328-37be-461fa630f160	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5534-f328-db6c-54f0f9c4892f	US	USA	840	United States 	Združene države Amerike	\N
00040000-5534-f328-fbe0-177f37eee67c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5534-f328-6a3d-54fade0dfd43	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5534-f328-3aee-d7df9e4b280d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5534-f328-4cf1-c59abe2ae95f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5534-f328-0add-c0e73e11b8f5	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5534-f328-482c-0fa0d13c97b3	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5534-f328-1c6b-a5669ed0cf28	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5534-f328-d1f0-5ef6254d4279	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5534-f328-4ffc-27ec6f8913b1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5534-f328-4d43-f2e53e8798d3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5534-f328-fe9a-9672b77fa13f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5534-f328-964c-68e7e06e113f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5534-f328-8dfd-a1c5f375eddf	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2887 (class 0 OID 2765094)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 2764891)
-- Dependencies: 190
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 2764898)
-- Dependencies: 191
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 2764773)
-- Dependencies: 181
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, user_id, naziv, ime, priimek, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 2764950)
-- Dependencies: 197
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 2764956)
-- Dependencies: 198
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 2764750)
-- Dependencies: 179
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5534-f32a-d824-b63ad65cc3ff	privzetInspicient	entity	N;	f	f	f	\N	Privzeti inspicient
00000000-5534-f32a-0af7-3ddc168e2a3f	dogodek-status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5534-f32a-0a30-39f37431755b	popa.Maxkli	array	a:3:{i:0;a:2:{s:3:"key";i:1;s:5:"value";s:5:"odprt";}i:1;a:2:{s:3:"key";i:2;s:5:"value";s:5:"zaprt";}i:2;a:2:{s:3:"key";i:3;s:5:"value";s:6:"blabla";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5534-f32a-9881-45a85fdce1dd	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5534-f32a-069f-9d605e970cfa	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	f	f	f	\N	barva ozadja
00000000-5535-68f0-1193-1cb97106258c	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5535-68f0-8bbb-08ca492f710c	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5535-68f0-378a-ab2c012140cd	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5534-f32a-f5fb-7a4f2eeaf13b	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
\.


--
-- TOC entry 2854 (class 0 OID 2764762)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5534-f32a-7b6c-6c2436f154ee	00000000-5534-f32a-069f-9d605e970cfa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5534-f32a-9a94-38d115390980	00000000-5534-f32a-069f-9d605e970cfa	00010000-5534-f32a-8173-b31b609cd8bf	a:1:{i:0;a:2:{s:3:"key";s:1:"z";s:5:"value";s:6:"zelena";}}	f
00000000-5534-f32a-5b92-c42190c45e41	00000000-5534-f32a-069f-9d605e970cfa	00010000-5534-f32a-718e-4a8f8d62f5ec	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
\.


--
-- TOC entry 2898 (class 0 OID 2789281)
-- Dependencies: 224
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 2764815)
-- Dependencies: 183
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 2764668)
-- Dependencies: 170
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5534-f328-0ea6-b808b7a6c620	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f328-62ad-05d9b26cfb9f	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f328-09e2-b5849fa235f8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f328-572f-827c005209d9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f328-e715-7ca852c2cb8f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f328-8245-701033732690	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f328-e9c5-851a0920fce5	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f328-c22c-52bb0246a491	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f328-84af-9a2190edd576	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f328-7a38-f0d56f8f5c48	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f328-c390-37e1facb07c6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f328-b9f6-71e4d3535a91	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f328-6ebb-be40f344c491	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f328-1cb0-7e57624134f9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-6eb0-540d7e5209ac	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-3f44-8d8fadf92433	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-ac7b-f3e84bf4db30	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-b84d-87d463f3c3c4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-dbd7-f5d0cea55a02	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-eda0-c5194239fc02	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-e9b2-9db78589f8c2	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-3152-468012ab1a1e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-05b2-a6f89fbc8982	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-4be9-7dc689e39e1f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-39c1-10ab7b18646d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-792d-0875438bf031	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-b4f6-22d9b42882e9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-4cb6-57b8c3efb94c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-dfc8-05e0cb15279b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-a482-f0a86956d1e3	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-2c7c-d65e1870da0e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-11ca-1df322145d3a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-d37a-4d57814b97ba	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-eae0-aa76f08749ee	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-1a05-fa849a37987c	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-1f90-0ca67994b838	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-cdf8-d27efc2b8c11	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-c5e6-fdf7365bea72	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-40fe-128c1c8973b8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-666e-5cbc24fb603a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-52b7-cd5521aababb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-e2cd-8cbe306b75d8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-dba5-371d3537eb0f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-9276-d4c271d89cb9	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-f226-3520ee6f9aca	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-ab3d-1aa5df923f51	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-6d5c-e5edac54d37e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-288c-a666c1035b2c	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-535f-f24ab5141123	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-deeb-1fb1c16fdd3d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-1f66-cbfa3401362a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-ea67-5dace030d4e8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-77bc-dc838ce923db	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-8839-16bfe01a2413	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-63b2-aeacc918bfa8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-e358-23bec6bfe53a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-d339-2d13372dea45	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-5617-0e0343b55103	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-e408-4d60edacaa12	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-6179-160d53e5f150	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-5790-f2e559cbe765	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-ceb7-69bba2fab251	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-968d-c7a919aa5195	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-998b-de165e9a716a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-93b3-8b63e9831bda	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-19ec-63baf69d50fd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-458f-c4088fcfe5c1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-c9cc-17e01b011ebd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-4a29-c859a0f1e38d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-e9c3-d8aa2a4747f8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-64bc-d57e6935d95a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-1b4a-0552980f4453	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-a79a-f9abf3d0ad34	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-bb6e-576a898e701b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-4ef6-b76aebb06d5a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-7d45-d31cbc087d19	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-2462-e6af5dabdeff	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-3bd8-9c1e3752b397	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-92c9-e201b5617b23	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-9446-8fec16e029f0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-a611-0a41e2235a44	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-10ea-cfc1f4d6bc2b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-b313-38ffa910d99d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-59aa-fa12514d599c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-7245-fb8b8784dc08	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-02ab-b44f93501445	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-d3af-9194d19202f9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-4dbb-84f86623dcf0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-b686-fbbc7e2d1311	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-943f-94d0763eb396	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-2ea6-29c25fab523b	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-ab62-2ccd26d1bb37	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-ba6f-633bf88f3e5a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-c9b4-70b4a1ec3b33	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-d241-c0e207330256	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-4d29-7aab7a6ce6f9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-e58b-1f922bbac838	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-00f0-4347029d38e7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-c73f-b0ac161652d6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-1e92-38c57bb36e14	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-4dc0-bcfb1b6f3369	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-5c95-326253fc0a0f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-998f-777c1e2c808b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-54c5-b908b09a925d	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-8fdc-e97937c77b0b	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-9fb4-35c25c5c11a6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-8000-c5120f909972	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-6399-c0d244b37785	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-c50c-8b9c135b9870	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-82c7-c16e45d331bf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-3f62-13fcfde8b096	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-861d-c52f43fa1057	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-4563-99c062ccf3ef	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-4968-ac9434ba3616	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-53c9-c978dce05c4c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-4dc6-c9771e50a5fd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-fdc3-30e6e16b071c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-4138-5690b705d7a8	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-7f47-efc5ccc0a239	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-77e8-fef95d2025ed	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-acdf-805eae9ca216	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-9e20-0895792fb686	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-de1b-fe632c65d930	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-5f7c-0242de9d8bf8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-0b2a-2ecc7afe716c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-b48b-802e3688c87e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-b5d4-5696d6f0fbcc	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-bf1a-bd4d9fc5486c	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0976-e0bb61238f12	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-d436-3bf06ebc1366	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-6532-344a51959221	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-901d-da3b1c7a679d	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-8854-57e2c34a2d9a	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-edb1-a340f0409896	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-944f-f10b865bddbe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-2a36-a8133b446ff5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-f87d-17402cb1a63a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-0519-b2278f3873a2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-c7f8-26358ed27bf1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-8526-802d34df0839	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-42d9-5b49c8ce5c3d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-8afd-f72523afbf6c	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-85ad-3accf6b1b9d3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-7709-491b5f14d5e8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-5e3b-6eae8f5c595e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-3ca0-1b2ac69baca6	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-6ec3-287148708383	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-3c0b-259abfc4d47b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-3907-d7587842471a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-452e-ee363d7c13a8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-88d5-41bbff538dae	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-8fc1-1b342a70e97a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-6c83-3aca573d57af	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-6649-3bc7002bd226	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-454b-b258bd5d12b5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-0600-78caca1719af	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-bf3f-f22d3c65150a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-c787-1b7fc0ebdd40	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-3d1f-689a332eebee	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-5b34-8b43b262d090	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-2b53-b60717c23b71	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-2eb1-be0a65d84b0a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-d469-863eea237a3b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-ad85-b3d052f4fd99	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-78ef-44b21c0d6d45	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-b7ea-f08914783fd2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-7daf-29b34087f294	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-1a09-57718fe30ada	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-2e50-33736543eb02	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-48dc-51344298412d	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-e8d2-bece95c4dbf4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-3274-cd72028325a3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-40ae-bbe7b1ee82f1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-044f-3da05269f963	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-1eb6-0b573240187a	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-85db-6bfede9c55ef	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-a36c-472e5f1d5bc8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-ba33-8e54d38a3313	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-dd88-e3794d86bc9a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-334b-4e334e7c6a7d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-fad7-3aa5a08487b5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-0b0f-ef990ab2c81c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-eca9-35b964f8da92	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-bffa-335116f07434	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-94f5-9f07fcc7fd3b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-3df1-e34852610dea	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-29e0-aeeb86eafe17	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-e72d-d0a1c4feabe2	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-6ce4-78bf8a99dcff	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-b6dd-d3449b41ace6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-d0d9-2cc8ffbdb1ec	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-3cb1-6626185ad1d9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-8541-903a65107916	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-3766-07ee354e860a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-494d-7acc57668eac	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-09d6-caaff38f2758	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-98f1-c41ad24c1bf3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-2c06-5162e82b325f	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-19fd-5d33aea53f8c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-1a79-4493c63a59db	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-00be-fd1820e77576	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-c9fe-2bca94976547	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-fee5-84a35d4c06d9	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-d836-e9b80295888e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-12d9-a20ec4e6e3f6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-b161-af725a0ac38a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-987d-40d0bc2608b4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-f4d9-807d6bfff2c0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-953f-9a56fd8e9596	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-cb45-60bf93268bc1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-8bbd-0a0ee784977b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-4613-7b6180cece74	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-136a-098e0e960d0f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-cbea-e7240f2bd36d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-0cd9-0516e9b22519	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-24c9-9592b698ccfa	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-1f6b-a005f68137c6	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-7a65-e226cb90aba8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-00a8-78fc19dcf32d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-3582-92cb6aa49762	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-10e9-b8bc3dae3a3a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-a9e0-4f782a0acd3c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-30f2-714fcda1538c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-44a5-fc177fdbc60c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-0b30-da3bcbff0128	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-3956-aeb917ea2d98	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-bd25-d54637c39e38	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-050f-5e3ac3e3f789	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-01b1-edd79482745d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-5419-db6424645d75	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-a7c0-00d3fe24a556	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-fd5f-c6878377dfd4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-a87b-a7ad8aad5107	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-6293-7138d12850e4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-7e25-9a561f006b0c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-2eb9-ac519587d999	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-7feb-25031bd70a14	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-4912-c7b1cb6b0b01	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-c34b-edfc86f7c5b7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-23c9-f70e8a8c8939	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-e0ac-5c12eed671be	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-ba87-a37c305b44d7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-9106-c9645725ac8c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-a4b6-8046c2632cb6	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-3a7a-e5b9ea547ac1	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-cac4-22bf81176f89	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-40e0-b0d370df853d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-f4d1-1281412c1303	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-7d21-c2cddb699530	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-5499-5f7245487de4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-4deb-8f860f1648a7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-764a-69f488d9109e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-80b1-a1260fc9ecd9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-d384-7570f92473c9	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-b9b1-cf1076f24250	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-ad2f-7c0549b88f7a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-0ba6-7d98921fd626	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-876d-56ed11592b0c	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-c5b3-1f01916a8d56	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-3688-cf08c2e7dd74	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-1eda-2b172dca995c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-2f94-b7240a187d99	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-a35e-f96e4107ea62	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-36c2-f0f32e965f9c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-a45d-ec0b03898e28	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-c9c4-dd18b1d51040	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-07d8-964e35d37f4d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-e9db-736ed7721564	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-c8f3-7e14409c0b71	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-6018-6856bee9b240	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-bba5-22a14b1de5a6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-7031-5f5c90a092ea	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-f8bd-e3ae18c44f17	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-112a-c31ea8188776	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-0ae8-8d375e83ad00	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-4265-2aaf3eaf33cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-66b8-3aca328b8241	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-f67c-a59097fd12dd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-e9ac-361f059a341d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-75e9-a47194486f16	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-d9a2-630fdedb15ad	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-27f7-bc53901c6b1f	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-3946-101cd457cb7e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-32b4-5c72aa425e67	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-228b-f1ef99acf7bc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-0bbf-614190ab8170	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-1c91-b8ce70d80e8c	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-d0c6-0432c64c8418	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-dc15-c8cbd50ff2d0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-0952-650eb7ca42d1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-d790-61b299777726	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-5a21-3b13de121b80	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-1155-1ab38a85d6ec	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-c143-5f7baa90845d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-439d-ea80cdf749ec	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-5675-987729daa685	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-31dd-436f89dcd9fe	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-0d74-908b03920f48	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-9730-2ca22eed0b16	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-c652-c90e4930a925	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-d87e-724b6177976f	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-270f-95c4d59820ae	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-dd80-89f09ded0d28	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-0673-8489d5c1a0d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-e198-8415cee74dbb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-eed9-2f1bee0ea862	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-3cd0-121dab372f04	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-c2f2-e47c3f7fa68b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-2e92-b401a6afaea1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-d6a6-7834edd367bd	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-64e8-ea8c325e55cc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-ff38-391e0993d4be	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-42c6-0aed0fc1077f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-f5a8-6098e199c5b0	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-f6a7-dd7bd1cf4270	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-77d3-6c79de700273	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-b41f-867f716aab06	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-5bb7-3f723fb2483c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-9e31-d936d2251728	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-9cad-8d8286ef7f81	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-ed6a-af7cc99cdd7e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-4daa-ee7d5a8ed5f6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-140d-86dbea39c93e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-3787-609c10d1e06e	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-6512-b1fcb35f7bf2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-9ae6-f5134f25301c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-82b2-28cbe36f20c9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-b760-fb0675969892	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-389e-b7363155e295	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-c020-e56765716051	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-f785-2956764e4348	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-6b35-41eec902bc76	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-6401-d79452b1842d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-5399-1fd67bf2c356	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-3c46-60e16eeb863c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-91f4-d89d8a5eafb8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-ccf5-82390a2d044f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-e3e7-17b17b615e48	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-733e-2990d162f14e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-f0e8-7370f2781895	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-8f12-4c8ea154873f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-1b41-6d333c3b5d7c	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-4bd5-f6f910ba9b69	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-3be4-d24f5740c6f9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-da2d-18036510a575	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-6ada-f0632b17c55a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-080b-906caf85ea03	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-5a8a-8074f314254b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-3eb3-5375abbace0c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-dec2-76bddcad700d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-5ef2-fc61cca95bc5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-0abb-3f33e24a6b35	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-e2ee-1b76347264c5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-90ae-cc4d166d4657	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-5c8f-762710f50f02	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-9bbc-26b4f59589fb	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-d809-dc428c35c2e4	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-b006-211cfb4914a6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-11d7-e98cc3cf94c6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-45fb-c77b7adcfb1b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-a384-5414b4374bbd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-ca7c-a7c93f6501ed	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-fffb-16873ad52504	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-2a4b-3d8cc9d752fc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-3a33-3060de9f0e9a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-7159-856b7cdbe7b1	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0969-501c60f67af1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-4e0c-e9693bfd4c4b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-00c5-18923a0f525b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-2f17-e1e70305d16a	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-f994-c29739a06a16	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-1c06-a06ced68d1af	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-0d5f-607a82ef0063	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-c47b-d9a72a10f959	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-ab23-702d2d730fb0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-c0ac-8134a0fc67f8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-d351-b2d7be7b250c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-bbe1-cb742d88f8e1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-b228-212a0ce86fd8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-bd0b-878d3b064f1a	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-874f-056793148121	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-efdb-3f1fdf4cf28d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-2b50-27a2f571a979	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-e8c2-3a105e99cb87	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-28e2-029377810a19	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-df7b-1090d1a23feb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-528c-be227c4c3acf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-e570-befab2297650	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-2c08-6fae73fbd5d7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-120d-ad8ff2528eb3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-e0f7-067b5e4c937e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-e7b6-2f593e344886	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-b8fd-a093702d6e65	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-382f-7a2388d00824	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-cfa9-1403ff0d4ae2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-3ac4-4fda0db8aeb3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-89ae-93481bc19ced	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-d844-b5570ed318bb	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-0a23-d3f10cdbae39	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-08a6-155e3b626d75	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-0bb2-db6b6d38f57d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-59c6-66e57035d5a2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-3b5a-ed8000106754	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-f7fb-8c1e9c920bbc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-a116-15b0aa2c01d6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-7552-3cd27f401ff4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-1756-a165cd979f45	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-251e-51af81ed3ce2	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-d65a-0e2a247157a3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-a5e3-0be8e6d43829	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-3ab1-842055804138	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-1bf8-5f5112b11562	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-8339-c7f001f096ef	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-86c2-e57a87818acc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-4ce1-71853e53127b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-27a3-1084bf60ec82	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-f896-6bd4eacb577c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-ef5e-03137f02b0fc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-14b1-822b745765a0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-baef-b9b6a14cef45	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-af5f-45769ba5111a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-49b4-292f5c0a8c99	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-e07d-96ad3cbc3b17	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-3a17-e9c068f98a4c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-aff8-0cae0e1e8397	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-bd04-fe9eb101cfc5	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-e678-8fc27918df22	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-0bae-a584b533b437	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-b59a-e1b611b2a484	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-3a66-edac15aa6e3b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-6528-84461dca01bd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-b0a6-caeca9676edb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-1b8a-1f4bbfa1cd8d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-fc2b-b3c7049b8bca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-83f6-e896b80563ec	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-8c8a-1d0421a13500	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-68af-67150840aea6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-43c7-9cda762b5137	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-e7d1-935dc2476342	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-0091-6d03c8ead383	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-e611-f8fc693d75c3	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-0b76-ed7641ba2c74	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-33b1-c9cbb2adf7ac	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-3cc4-0608def86e19	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-4c36-15769802eaca	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-1144-e7abf8967068	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-46bd-c0236bd80e2f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-ed4a-e5868db3dc12	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-7cf9-e32270796e0a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-5f19-96d09161600e	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-db6f-f737bf7eece0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-a169-2210a31d8c90	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-48b4-0c1109dcdb3b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-7a5b-a7fd2a355e9b	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-b8bd-195283015bff	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-a70c-6e180f9b74e3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-f8c0-16d53127aa12	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-29d8-193115a5d7c7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-fa6a-b6996479da26	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-975e-965c472b306a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-197d-6b6b825992e1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-17e3-9b9bfcdd2c27	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-61b5-52362aec8de3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-ac9b-2750798c18d5	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-c05d-0fc8929e1dc0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-e68d-7b1c9c534270	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-748b-bf986e52436c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-e7e7-994d4c18dfc5	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-3e14-6b8578112942	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-b55f-f7ea63abb9ff	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-1773-215e3020c15f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-4f3c-b12e8bd4ddd5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-06a1-9b81a54ca950	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-6c8c-8b5ea9b7cfe3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-99b7-7988649f0dc1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-fc2d-2ce7b497a144	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-38f3-665dc8da4858	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-0665-b206d4d56ded	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-b10a-ace5f7ff6c5e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-2ed1-a1b03b3d8b7f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-3680-36f9c9682d22	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-170f-7a89135fc39f	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-757d-c35ed095d6ca	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-e97e-62bff6eb64e8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-9b71-33e202b8ea29	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-a011-065d8e971a65	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-3174-11cb4822d2c7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-b143-9b10840e0ddd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-a148-8fda61ff2ec1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-1acf-bdfdf3bc8600	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-620d-76180cbdee10	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-8e65-c38d625a2099	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-1c92-2cf727b2efe2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-75bc-e9924a8e3ee3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-4cb6-185f553bf2d9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-eb87-d492642ceed1	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-99f2-fd44d0294840	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-a361-9634f0c735aa	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-5b1d-4313bd2494bb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-164a-76817c4c6edd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-0a00-74d25959b87f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-bf73-b2a459ab5afa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-2830-2f98cde8cc1e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-7b0e-e54eeb2875fa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-8c7a-e7a2ae3e11e1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-3656-bcc68002934a	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-178a-19472ec4c378	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-549a-a1cf77105e57	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-731b-4770bfd9a1eb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-e4fe-1f46ba278d99	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-abbd-69d2937abb47	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-e626-73a3cb474850	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-0e4c-2b6dcfee1765	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-ae22-b98b786f62bc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-4cf4-e79550fea9e7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-553c-3f3d90ee9d73	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-5650-bdd8caf86b88	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-c810-05c1a312c136	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-2d5e-6829a6e87246	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-406d-9b0a48a46cb7	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-2809-9903f9e9be0b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-600a-ca28de6bacc7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-76c8-6b1814242b1a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-92b6-bd6cdb9f2db3	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-f46b-29a27b7f0e03	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-8968-0cbecb86ffa8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-0c9f-04b8269d1d46	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-2f45-5e6c37b09a07	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-97d2-8209d49209aa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-78ca-66eb7a965290	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-86fc-1f517ee0a888	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-25cc-a801f2d5f3d4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-1605-64bc47811c91	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-dccc-ea8b0b80d56a	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-efef-ebc84560ec92	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-ab5a-f484ad4047c7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-08d1-7661f43cfa9e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-8201-178e12f04b85	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-d2b8-68c28793cef8	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-b421-89160f4f69b1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-1747-414f484be003	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-1dd1-3c0342050bc5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-244d-d6962a350399	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-2c5d-0d17f5dcc130	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-9fe4-eaa425398141	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-fbaa-5f3dfe136ba8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-880f-72ec46083921	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-8dc9-a410c9901f43	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-13b4-ce3770d5a947	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-89d3-3422531b0f56	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-d371-0c25b5b073b9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-9b9a-4b64648cfd4e	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-57f4-671277c7804d	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-7188-2d3cfa47262a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-62ca-4c22f1f18c95	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-8c2e-b33ca2e6fcf3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-5258-cfe8427ef8c0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-9d5a-4275de166fb0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-fc7f-223707190edc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-8b12-cafdacfff7a8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-af30-5437c693810b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-d7c0-06f0dd197ab2	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-7711-6a889e6f354f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-3bfb-15ae9b8a650d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-b91c-57ca324f0404	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-5fd5-bb255d009444	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-e794-92c7f179b187	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-b461-dc13b9dc4e6a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-7543-ea19cefd6a34	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-f700-24f98f016ac8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-816c-fcbc36f2581a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-b1c2-d101c43ed585	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-2682-8170489ec5a6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-bb95-0f6f2e0b20ac	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-8f28-04fdc217131d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-a333-16fe540d98f2	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-4be9-7339722d280c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-1dfc-a8d6e010ec6c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-8ef5-80c282576010	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-6cba-8dae10aa22f4	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-2fbe-92424a4b7edf	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-c4d1-79784e6e9ade	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-fc9c-ee3f2ef4d745	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-9a9f-b78732271917	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-350a-794070834f51	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-1030-ecd9d9b6859d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-1543-12fee926b09f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-7ecf-9f50465aef3f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-3cfd-3337a5869c18	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-0f49-d725975234e2	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-3d3e-ff6b19013198	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-294f-324343827f10	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-c98e-ac1e47f5be1b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-312f-149277705864	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-4633-48e637398bc5	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-79d3-0e6eea1d20e9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-5419-143f90e21b3e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-4cb6-70601d935824	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-91e4-c51f6632d0d9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-2786-fd830636b3cd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-df84-4474a584dbcd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-26f2-6f1da1ef55b9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-e776-814c24f13173	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-e6bc-b7a4834d2801	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-7d3e-f16dd57927e8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-d700-f710d7a21dcc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-dbae-0490425ca709	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-ce33-081316d9ec19	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-949a-a2f2f11cc375	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-cdf2-40a4c76bd26b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-26f0-941fbf5c4431	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-c041-83f37dd7a72b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-048b-12db3299c30d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-70f8-e15ef1119fe1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-bc92-8cd7eb7fff19	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-fb41-27b50920e4eb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-9a24-ff337643d1f7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-5ef9-1f965a067745	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0376-7c818901e97f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-a986-fda4fecccaf6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-9780-dfda07159e81	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-3d3a-16380f77440e	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-0158-b162c16895e7	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-3f2e-7f1f1af1cb32	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-eb0a-e3d2f41cbfcb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-308c-e4257c1ee5da	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-1b6d-02e40ada5b7d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-749f-f75715f2be66	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-0b7c-9029ac49107e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-aee2-662742129a38	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-58f9-ef0e2a978305	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-071d-4182e1fd2b39	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-7df5-53461ddf09d1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-5947-36ad005794d6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-dd1d-de4c6f0e8a9f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-d1fa-fbfd5f8060f2	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-5f4f-e0577e8acef8	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-37af-32b28c3f7ef1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-3bc4-4d179c930be8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-699e-6771088d3a98	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-ca30-e680af23726a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-ef36-0666acd39cc3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-9a7f-4e23976fe4c5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-8ef6-15403508a9b5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-7b2d-6139885a2e6d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-2b96-0dc32f63f60f	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-7154-cfd9d79175db	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-e23e-7c00ae218776	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-fdd7-c42256f0b78d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-2f38-a347409e0d87	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-a96e-b4799f8ccfc4	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-960d-8a8a194e26b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-8cf2-f481b22beb05	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-bf9f-e2c08c9ffd05	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-d1b2-ad793901bdcd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-7a73-9fe71b1ec0b3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-71f8-d0490925e2f7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-2c16-9d2ecf4027fe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-89f7-057a847d3cd2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-8b63-f02cfb938f93	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-b317-a23478edb125	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-866f-24eeb0f947b3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-09e8-6537138cca20	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-ea70-179c85cd2821	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-6fdb-c6609141ba08	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-6abb-bfe1b5fd989b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-3a12-614514ee8fa4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-0702-71e0146534b6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-e7f1-0977e5cd1f1f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-fa24-148a319757ea	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-b1be-cfa382eae9c0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-641f-cae603d25c0d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-3246-ab1399df8057	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-db0b-9e91c61cb6d9	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-a100-95932ca65041	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-7ed2-74e698be98dc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-43bc-28dcb397ab7d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-6e34-f4b2e8742566	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-eaae-d92795203bd6	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-5bd0-868e8801cd54	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-3a71-f0a1e8e6f39b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-66c2-d6319e4a11ca	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-ae68-821b97caebbc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-c2cb-f25b73c48c25	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-20bd-b166a7860995	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-116d-3dcea5d972ef	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-52d8-ae360bf0fea1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-40ae-01dee335e0c9	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-f06e-ecb24b58a2fd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-d09b-ee44a52c3eb5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-8f7f-fd3b271eeb5d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-e081-490a65241bda	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-4f01-c016f7d2d36f	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-81c0-c56467775359	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-b0e2-bc2589bdac0e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-0e0d-8163c77cf89b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-2e24-fc16987c27c2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-4a98-38e3df3accf7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-b86e-f0711e3465d3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-43dd-004e47b5f727	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-86e4-145329015ba5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-224a-c6a46ba16d25	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-61a3-ddd2818197b5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-6f38-10ca73b45bbd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-a975-83877382577d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-c5af-2ff2a75b134d	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-b974-1ed3e4f23794	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-8842-f424fd002cad	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-1ae5-60d226a34815	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-9871-f28d00ff057d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-c184-d7d5e2096562	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-f15b-4e9a95e2e23f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-cd74-c0e4f3663c10	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-a326-9876c487856b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-1a32-3a70f72987a7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-610b-023b74a38d3a	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-9e97-0573e788dca4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-bf05-cfede76cbecd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-be2f-0143f82955d4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-32c4-2cf908ecfe4f	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-c9d7-9cdd5c8dce3a	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-5248-f3d8e02aa1d2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-5ae5-7c29228f0b39	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-25a5-a7e6e0b015d9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-1404-1be387c45a56	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-91e6-e502932055c4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-436a-d1a5942a2a23	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-6998-8a9568c2bf44	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-6d4f-10a34e30621d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-b180-0908401788d3	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-8032-8c7f079c9962	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-8870-58e9644b5b22	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-e824-983f5214ef15	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-d9a2-bcb9a90c7c17	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-61e3-76cbf1119c7b	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-ba4f-4d32fd9e0545	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-c62d-75831bf549ef	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-a75a-591c983fa809	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-bd9d-39250bf7e09c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-cdea-c085d1a5819b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-6626-9b64c64a0d5e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-cbe7-ddfbfcedb703	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-d88c-d882a0aad681	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-e641-1436f1cc2864	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-3b42-a5e4a44cf03d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-82f7-d00a0a300695	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-bd8d-28456aae0c31	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-16ea-fd3ef43fa933	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-7694-2d217fa322c5	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-3227-5baa1ff0b078	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-2d8f-7133eaf1c521	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-4af6-e566f8de37d1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-b159-e4640587d448	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-e1be-2f2665b4b890	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-ca31-f5d72ba2104f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-85ce-09989d597b29	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-6dd2-a477887470b7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-880f-93b33b6bbdc0	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-76f2-461f3eca7606	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-f11a-64810dd28aa9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-91e8-0767e5d380f9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-6b8e-09b7f9dd56db	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-ac72-d49ab275f0dc	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-8f9a-7a87279332d2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-5773-cc82e75c6a74	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-d504-d5120594c3c8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-0cf2-75f28da93e23	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-4af9-1a98624dcb1c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-1001-114bf6dfe331	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-fafa-9f8bb48823b9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-d1e3-fd025dd58a28	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-a4bd-5b7d2efbbcf1	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-56d2-4a104150ee75	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-04ff-17f85a94db8b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-7f70-d4863d61fea3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-e145-23f5e5960840	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-2a33-c3fa092ea040	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-d50a-1e47f139b770	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-0e48-42fd6b2ea6f7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-a05d-5c59837e07d6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-3be3-ded1857740f4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-e923-6164b29a251a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-2e8e-f4e7961c7799	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-5037-b48a63b4823e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-5de2-b42995a98f8d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-2ff1-32f8aff64948	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-2caa-69497c5dcb8b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-7a5a-7c38eb0ab7eb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-51f0-222bd7ebed44	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-5b91-3a4b82e5cfa6	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-be51-1f4d07bf764a	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-0134-7e3e13811b7b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-69b7-190ca815f05b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-1b09-8a1edc0432cf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-ac8e-4c487096fb5c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-c3a0-63d133f88b1a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-a12e-5f0cc078d9ea	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-1bb1-c8ad222d6f16	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-c2e6-f3a142bed192	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-d476-fff07b9a1b39	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-e8eb-8045893eb747	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-638a-d9b5e84e1ae3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-6d10-7526f0728c6a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-f072-9d6ff4a55f29	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-4660-b8aade200441	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-9406-f5b3c23b3e00	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-ebcc-365bfc6a202b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-1b39-3c364f52d0c2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-05a6-382685490851	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-e974-9eacb71c6263	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-0d0d-02ab8061587f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-acec-a3194113f121	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-d838-b4c154407e44	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-4478-5f72ab69f605	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-563f-62162ca9a59b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-9998-91ef48d11ec7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-a172-8c6688ee9155	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-245e-1a3f9b542b5b	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-8b4d-b80b74237806	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-3622-f9fb9e877788	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-5666-fcfaa2ea9323	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-a66f-f65a99ff57ae	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-e044-d1b4cce609ac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-d92a-1ec2d0e18405	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-e2e8-6b14c7c366bc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-4092-db1a6ad2d797	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-1a5b-009e914c86b2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-c7c9-a263ae3dea43	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-9ad6-53d5af72d9cb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-225b-b30c0c6a17cc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-767d-a64d11d94eed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-bc10-b30e212eab15	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-ef56-f30bc01fbef0	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-0b88-c2a88a43a01c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-a716-94f90f541bb3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-8ade-5d9060c375cf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-07f4-05a9242a274c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-351c-c36763a5b093	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-74b5-69362862c87e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-9eac-2b91be3b0c9e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-7600-05dfa0555dad	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-e99a-e435a4bbf424	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-501b-4db9935e5382	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-4edd-a6b340bb194e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-d924-a8085c72789c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-0249-323d44e229c4	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-984d-5c2bbe52a25b	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-e761-c10ea1edac66	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-70a6-41f472762421	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-d81a-9a5926069b88	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-9a9d-cc472262e7c4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-7c5f-6d7dc52b61b4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-a680-d5aa021e1511	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-852e-91f156fe4848	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-0eee-b7c588f4a585	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-1cf2-03425b0ab99a	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-cc2b-e56e23ba0c23	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-9555-cc3baa23fa4a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-928f-8f7a0a449379	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-4cb9-caabe391b619	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-01a2-b1ff9482d1f9	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-db4b-81e5a3379ec1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-0d9a-14505bddcd2e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-735c-e725daee8f90	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-f232-e1c958e5139f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-3dc8-bff9b4ee5efc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-cfe5-7a561513fe7d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-c9f2-ec4f2c1841dd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-fe0b-353e1b932afa	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-32ad-d0ce92b38143	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-5ebb-f15d0ec37eea	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-5061-99d2b1611b68	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-31df-d91166bd3b7f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-6bb1-86ef00942aa2	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-e152-10ad5d5c2308	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-b5c0-478b1e641a80	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-97c0-9ce7f8974cfb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-888b-bb4628f6a13f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-0d99-39817ec8f804	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-c2c1-3c5dd3f8314b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-749c-f62506fff0d3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-2265-7b4e11eed750	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-bd5d-1e8ec9cbaf20	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-69f8-e2d7e09a3922	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0c13-e8af542d0f5e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-0114-435e8a89de5a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-679a-8a7bb4aded86	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-2f72-a9856e37bdc8	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-f83d-c32bd14332e1	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-642a-30af4ffe031a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-7842-ffa4c6f5149a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-e880-5547e76088a7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-401e-f28274dabfed	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-ffe7-2b44a9b58b61	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-23ac-e673113cfa62	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-716a-d397ba5fdd45	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-3487-171db8c08cc3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-ca86-fe4f5ba9c5a3	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-37bc-07497f0c48e5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-0e59-ce537286c48c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-b7f3-0053f0e4400c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-8c42-9d26dc3c8235	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-7143-046a35fe040a	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-7c31-dad7c91998f3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-f981-90978b7703e0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-3254-a89e1601ad67	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-49ee-22b3a58ada78	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-b5e4-3d4d91b37c48	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-2414-17ac5f99b765	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-1412-a0a0956101f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-90aa-bb2d80311ebb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-ccbd-8074aa16b3ac	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0ff7-ba816fb682ba	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-167d-c4ebad11062b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-859b-5ae29ac8b0f2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-0f08-5f9e5b09c2f5	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-3c47-05a2c23b7669	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-8607-17fea22d9b0a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-45ff-c49ac1842153	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-23f1-efd22b4f3387	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-a323-6eb1b4818f91	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-47e3-49161ccc8fef	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-f275-00c5dc1e796c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-9088-81d09a6fd7e7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-05b6-a9367e92e748	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-b227-5e7e625d6006	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-b8e9-c108842f87f4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-2c00-d110f2bd3583	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-47c7-bf671912ed14	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-22c9-09181801362d	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-76b1-c70cb1a43e4b	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-c8cd-216891979ccb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-224a-35797f08ac3f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-35f4-1143218aea8d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-74eb-c5edd888d30d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-ac55-f60b6d44b6a1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-26a2-ccfda4079560	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-fe6a-83725e3e342c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-c38d-e77260c7dc49	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-3585-5dd19a313672	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-3d2c-98c07050375e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-82a7-5599ad546f19	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-b4d8-6e85f4fbde3e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-b6a5-ae829dfb7ef9	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-4b0a-d86e4c562a07	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-6060-26092480a933	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-c606-edd1d8027eaa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-a2d1-720bc677d38d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-6374-7d9a9733159c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-0cbc-a8a4e6cf7e58	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-ce72-cf7e1e9c87d1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-ab92-0421ae0c3eca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-c1c1-e90e0a71abd6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-a868-effecf555712	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-c5b5-a97b09b90c6b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-6268-aa87f569a90a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-c2bf-171b6d6be2f4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-2324-d30364cad847	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-6cbc-b596341d74cb	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-6dac-f7b6cbf0c6b8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-8404-44e520d3d699	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-06ea-4a8d723228fd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-b864-a7e721a1d1c7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-ac99-4afa70236fdb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-4353-8730923e55f9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-d7ec-334c21066d2b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-d383-d5ac46378ae7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-f5fd-0fe84ad98a51	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-20a6-09cdc8ebaa7b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-2fe8-76fb28cd6eb0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-3059-2b5627f79455	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-4d3a-b2fafb83bd2b	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-b663-b6cabb59be73	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-53a4-9cac13821e32	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-e4ea-ffe7ba7a6d33	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-50f5-3e985bce1b8d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-6363-96237a747904	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-b727-8efb56a1363e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-0cc2-9b6d83154d02	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-0304-2fe3458c008d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-d9b1-89502c23e4b4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-d3bc-8b493a1dcc42	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-9580-09c08eeed22d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-29e4-ecbee738dbfb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-daaa-3889f164c025	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-c0e7-c899f9d90938	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-0f78-d97a5dc03255	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-e86b-6ccf9a0477d7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-5256-bfac1032669b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-19d1-79b74f6e50d5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-affb-2b29749feba0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-3dfa-a3d1d1bca067	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-878d-4ed7a8899837	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-19e4-a8d00484b74a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-6d8d-6f91cb7e10a8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-0052-92fd788bc649	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-2ad1-4f87a3cee0e9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-c9f2-6bbaaed8dd5e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-25a3-75fb18ae4b07	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-97cd-53fdd700eacd	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-61c2-6e71f5ea620e	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-d35c-2df38bbb2054	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-2c00-c619c09ad068	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-f451-b5ba873d9d8a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-08f0-26b5a3769fba	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-4792-daa5587e9579	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-13dc-c220ddc3984f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-7b9f-25219b0e9b91	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-a61d-9c17058b2f9f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-f46f-a1f50f4041c7	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-dbcc-5f9b2b0e4335	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-c3d8-7ceb8da8b404	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-5c7e-50ff177c43c9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-bd2f-2a4a5f13e11a	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-8f91-840c744a47fc	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-2a03-cb2f85fc9972	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-d5a2-6a16e60a91d5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-4ea4-70a8d003af62	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-b0b6-157e14f22276	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-aaa2-6895a13975ac	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-f2fc-f12b7d9edffb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-8416-3bc662740a9c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-ec02-82bc5976e461	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-e1a3-1d9ebd38b1bf	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-b3ab-e19d62d8bfe0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-9c3b-98b493a2ba54	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-d865-d2581a50762d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-bc43-7af840969f2b	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-260e-59cb552c020d	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-2725-2abdc766d835	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-31e5-a647f1d90527	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-e1ab-65a2dba5d072	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-b937-682a0b8f067d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-2979-d411e991fa4a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-a2be-81474c23fda6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-ca31-68a24f0bfdb9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-dc5b-b358aab5a2e0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-2dc1-de932e427a36	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-dd32-386edd8c75c1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-56ad-39e560c3dfbc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-8f18-13cc6e72b216	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-d988-370a5db63c46	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-4326-f3a73c10336d	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-1126-966ef2825a7e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-5878-8ebf47dd95b9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-82e3-6a7ecaab9367	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-52aa-cc772f76b6ca	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-651a-5988da35559b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-be09-e1acce624adc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-cbe1-635d379b14fa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-1d5e-23183f6830dd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-f522-818dbe61f03d	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-89dc-ada3630bf564	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-9c89-589494dbf617	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-4d5f-5479f4b69e0c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-0357-b0bcdedb5b7f	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-a0e4-811a4420eb0f	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-9efc-61cb9445c1c6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-15d8-5d2ec709384c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-1969-157c87b4d753	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-a5cf-2e5cb3ca0dfc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-6595-063000c70a80	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-50c0-747989fd8b39	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-1802-9273925c101e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-848a-e01a0f8d2961	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-366f-f0696b9a7625	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0aef-aabbfbc58cbb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-edbc-628be9d4d311	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-cdd1-35cf1b95363a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-96f7-58df04aaa712	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-1b3c-9df417b18032	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-832f-835612442751	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-f106-5b77cc183354	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-f599-2130c15f226e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-8304-8ed16ef896c0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-6202-982c717523eb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-6cac-1392ab1d8bbd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-ab14-b6c83901d5e6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-4a0e-8a58e0211d55	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-24de-08e3cafda028	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-1d18-df53062b1d60	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-b33f-7a43b68a0747	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-b5da-7a70f0a358e1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-4a1e-f0fd7de8f625	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-7693-334783e4a822	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-1e60-cb61c01ec0ee	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-323b-145ed33ae6e8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-8f6b-fdd1ae28aac1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-d64e-1b04277e05c3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-852f-7c325249c4cc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-23f3-836a4b876761	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-5931-03578abbd39d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-7b23-1c08da6fb246	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-85f7-3d2f0d4e4211	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-af03-d3a896976996	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-2a4e-15308853c323	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-249a-c6e52955d92e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-c3c3-1c30876cc6e2	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-6c42-3b3776f89f81	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-a5f5-32945d71e736	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-435e-ca916099c380	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-9ca1-725927a01f2a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-990c-462a8914b45c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-ba87-ea6c44ff788a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-bc34-812bfc1d8f67	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-c195-396628e255c4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-7a7f-60979e4bbe68	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-6a29-01047853fafe	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-960a-f4e03a4e003a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-0226-c23843414fd9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-1c75-722dfd3c3a05	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-7d42-6f1966fd14d6	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-241e-cf1c2fc58ae7	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-03dc-97f7637261b0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-5968-5023c36e483a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-ee8f-b61c69485dfb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-7a21-8d726de54509	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-6aa6-0ab9d968a406	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-906d-ed8506ba2b34	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-81a6-3b0d377c2b08	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-9bec-21d9aa06930e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-e42d-4f4ff2142160	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-88fe-ca9c6d803682	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-61d2-539523ff8230	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-50d1-a7ee7c426d4d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-1186-38e9170518fd	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-68b0-e03bf5562f80	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-8f9f-b2df67b042e7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-1307-e43d0506590e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-0077-fc67f78efa0f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-498a-75c6e8109c04	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-bc35-824fda2f5bbf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-187f-64d441c14138	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-6a44-b3e53b381afa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-58d0-86809c8a16b1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-592d-1910b6c4ca98	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-c54e-fbcc8b9f4044	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-d3d7-198adbfd9fa2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-54f8-6e6a856ab1bd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-bd6b-c57914338aa9	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-be0d-660fa1eaff0e	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-82d9-109f2670db71	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-44ab-c34bcb2a4010	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-be6b-6f22323e9631	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-9e2a-5ac2d682be19	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-d05a-b78194125617	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-f881-8ea6b289dcae	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-f55f-46638bcf02a3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-f6c9-1361f51db03e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-d021-2cabd7f0ead3	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-ff43-1bfa0e2594f3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-52c2-7c3b33345e87	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-142b-d0a55cae1875	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-72de-3901fe50e990	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-326d-f1be54d154bd	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-4933-f21f1bdc043c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-ad1d-ce2e19b69554	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-58fa-e5bfee5c2661	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-9c37-b8fa4cac5d11	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-d1c9-379fcc437ad1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-95ff-95964b01ec8b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-7233-76ffa05f2a10	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-9914-5d6ba6a06f7b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-4233-55ed921aae60	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0619-335538d6ad92	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-0352-8c2f781dfad2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-9ebe-911f8f2eb426	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-c793-e1a054cd36ef	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-f464-6889bbaebb0e	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-92bf-13b48c7269cc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-e50f-ab8846694db6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-5885-880bc296f1cf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-9189-1790f6fc117b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-2101-b650e91135a0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-458a-fcf9fa7702a3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-ee52-fa4f9b2d94a0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-39db-83a94cf36dbd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-9448-bb6091ee7fb6	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-e0d1-f6814892e392	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-db42-502e56eaf69e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-04b4-fde2b3313c1d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-f48f-579db46769ae	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-c5e4-2c159be98d78	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-dd86-de0002bdf223	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-df3f-a62816f38210	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-5f73-bc94cba8fa92	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-818f-20e143891055	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-1055-ab73c93c4c9c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-adec-68f80c3e5a56	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-46a9-a5da03b54e38	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-3293-ee641a94877f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-95bc-a0d4dff82d6a	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0304-6dc1fa9f1d74	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-2fbe-eed1c3d811a7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-6306-f5ad8c951b3b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-b1f4-26376cc71863	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-6588-a2dd2d728379	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-c37f-50c004a5d9b2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-167c-8fd598d81eb7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-981a-1f4890c664f6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-b534-4ccaa891df2e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-b1da-b5b4ab6b272e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-ee0d-ad15896d6b35	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-e4d5-7f3d54b60571	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-f1a0-3ec6c6977281	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-09ef-32d4a9d980a9	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-4880-5a6916815799	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-acb5-09259d734911	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-5c3e-46a4531368b2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-4300-36e585854167	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-9dc3-c7b22819e409	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-c55f-bf7c0b90e36a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-8a7a-efc2592a50bb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-8f94-8ded991ede76	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-6fb8-38ffaa305eea	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-897e-6c22f9d98bf4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-2990-b8020f98354d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-f276-06278b7998e2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-9310-e5d8edb3f100	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-6234-39af531c0e02	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0b8e-b89daca1e112	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-bf9f-7b70893aa3b7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-141a-749ac5c06751	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-d416-ec459ff8a801	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-4714-835cca4fa9b7	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-3d57-ecaf65952ab6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-a13b-52a6e9ccebe3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-3f06-ab015cd1c127	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-6622-4820b499aba2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-eefd-34acb4f6c2cf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-1ba4-85fa25404a41	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-4788-18080256fe79	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-6f5b-d4aafc386aaf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-c6de-95f075694d65	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-5f0d-a51c806c8b0f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-8e67-efbbcd5fe9ce	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-22eb-31ddc78e39ab	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-a2ac-948f3e526939	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-0c45-557393956f04	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-7fc4-9071904dc107	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-ade4-79bd839cdbc8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-e655-549d684edf41	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-7b6b-98f4680bbe18	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-21c2-296b84851e03	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-68a0-2998c273d7ca	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-96a9-cb01e5b0f499	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-60a5-cd840a3620f8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-4dc4-c88df47ec66c	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-4365-5ec4c8f6ec35	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-0c73-11371890d403	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-a905-48b4712a7278	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-5c5e-ba17e7a78d0f	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-0eec-cb9d70f942d6	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-3b5d-eed2d4249f28	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-d7b2-f2b7c207df33	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-25b2-48e7156b8664	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-1476-0958b2c14008	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-cc3b-f0a067dc0d11	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-1669-265687e47aaa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-9f0d-f21d0a75e5c3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-50ed-817a9ac3843f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-74c9-2dade836df13	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-e0b9-2dac757703d7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-ba56-37f772b061dc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-f8c0-42cb78ca619a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-c498-02196d505d84	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-d2db-5a1d97c84b70	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-b9c6-36b5858f735c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-ad54-860d4191a7d5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-8291-9dea863f99bd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-7a0c-43e78c265481	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-43e9-9760532362a8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-d72a-24064add382f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-6a16-6847ed3cb587	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-7369-9073a104341c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-0c75-ff0349f1f9e2	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-f44a-bfb52fe38579	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-3040-6b7609acac6c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-bafd-1640d44d7c09	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-c787-29d79731647b	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-861e-3d61ca57457d	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-aa62-4a8147d2fbbb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-3e17-79229be40856	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-eb2e-6384723ae7ee	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-fb67-83f5ca62c6ba	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-2f07-16c32c80804a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-091e-532055299b54	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-8d3a-75aa80332f9c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-4a86-1aeb6016c5fe	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-0a07-5554554b98f3	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-5e7d-7b5ec5cd0f7b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-6958-b0cb2d06399f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-69cb-75e2db044cd4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-459e-2e61dca649e7	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-311e-d442cda1dbdd	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-30b6-d052c7210f06	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-3ede-60267077f614	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-d910-c16753ac31cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-6ee8-9f3c0617755a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-6716-0ee7f3a626f1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-e521-f68701f8a883	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-2a96-5260fd38b755	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-7bcc-a57cb1bba87b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-bbe7-253722d34e62	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-8984-11feca06b0ac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-4ff9-0e92125f772a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-e46e-87c3cb9e934e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-a349-293301f9c283	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-3471-17d956d6a382	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-d1e0-e7b52c206dd5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-12e8-2f6912d8de9a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-a81e-bfc7104ff493	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-ff4e-fd23cd7f0ad8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-d209-11c5b89e8f67	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-9783-c98fc103291b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-c37d-222b1d266a6c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-c97e-5dbb8cc8e728	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-839f-492e0db9c4dc	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-cb82-5e9ccd172688	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-0f9a-dc55fefb1699	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-254f-854b901c334e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-d243-f89dacdc5f52	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-db5b-ddb86a339371	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-92eb-545608260d4c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-eb5d-b9d2b7aec43c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-d2a3-1d491991c578	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-0180-6880e2b23735	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-36ae-83251e7df929	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-1235-575f90cdcf59	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-d28d-d21c86be1213	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-ec57-c317b1c52dc2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-bd69-3a5a0b93fd13	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-709c-8b92a3de8726	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-4abf-c1b3bcf3f405	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-4713-b8307a4c3c95	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-3eca-5e58acd0d5af	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-c39b-fa59b9040caa	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-6ef3-ec1dc138d198	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-986a-803b9ac446c1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-682c-f3a7ea1eabf5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-cfa8-ebc605aa6723	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-599a-42233987f9b6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-b02c-cbe0045ef31d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-e456-daf86122542e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-ad71-d8a06aafc4f3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-dad7-e80283d04744	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-eeb6-b8793f8588f1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-d811-ff5c3c6539d1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-39aa-46c229b07896	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-59e3-24686d100bf7	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-8b78-c30486c96bc8	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-db80-7bf90a2dfc6a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-a308-8d723ba37c9b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-fbb1-4ce1bb49df84	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-45e5-bcfda5989840	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-ea55-07f0759703e7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-41d5-b4647adc066f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-3c11-5273329c138c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-f8da-8d6c1fc64cae	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-8035-1ae35336de38	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-4dfd-ba62f7b8a642	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-6068-0788b1a507ef	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-98e7-a51281bc251d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-d734-6f8ffaa9ba8a	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-2258-9e9b50aaafdd	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-93c9-6e95a0df8d3e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-afda-3011b2a14718	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-5dfc-3531797f7210	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-0c1e-f57338a97708	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-f202-aab4bb062873	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-e244-f1dfc8963ddc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-9b84-54e02775ad10	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-3072-b6342644a737	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-4369-5d5b1a11a608	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-f455-b792356faeea	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-7668-91e692557cd4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-ac4d-e9f9ee0fb4e5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-2afb-e66914365c00	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-a1e0-49a2a72c2d7f	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-a3fd-aaeea90d4f6c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-9f56-a3dcea888290	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-9bf0-e8d42874600a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-d7d8-8dcc46f30ca1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-8014-d39e50e31953	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-7314-b3d8d170a8c0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-56ee-44d3fe5880a1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-e23b-f515427ccd2b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-4804-cf04e1bb0397	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-8ba1-b5754335b0ea	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-d156-a5b16ab33fdc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-69dd-36b727518249	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-06f5-82806f91f660	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-f91c-87fbe597aec0	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-f62d-a0de8168d9d2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-4940-b53855f61d7b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-6380-61f223f7c0e1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-f337-83372de0a203	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-4a06-2f5dd640b0bc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-6c8c-16e6ee8513f9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-4a30-4a42be312bbd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-4a47-ed5e70ea84f7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-4eea-e83b08f5cae7	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-9e21-5d34cc07dd08	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-c81d-f1eb5e2d0f31	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-c1cb-76d7a2e16c02	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-7fea-2085add19930	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-5595-75fded103556	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-36b3-488fe953c70f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-b9fb-fe9bd1fca75f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-c972-4bcbdaa2a454	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-7ada-a8804989843f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-2f33-0daffa80020a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-f2a0-60d0ef26a324	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-6a84-3690940a3f5f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-c078-a4affbccafe8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-1937-326ae95c20b2	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0ab2-570e98eab42e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-8cdd-76fa099fd689	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-4968-b90859afe323	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-cb73-5acf60a19331	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-f693-9eb49af52708	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-4b2f-606a42db19fb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-a4ac-b2f3e6595c5a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-d700-0bde829e8d82	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-d6c1-b4653c99dce9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-54b4-8fd546f6c5d4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-b045-9d7c9a47eeed	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-b75e-55569e235ae9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-65bf-718d683d0a30	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-f33d-79b8e89c07f1	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-b07a-165c58c35d39	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-37f0-b7e95dec6a8a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-9b62-91aeba4b29dc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-fd84-4369f830599a	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-7344-4e4620f70f1e	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-027d-f97b0c1f1531	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-b577-1c94aad1566f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-0cc5-a3b1ea46dac0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-5d0d-ddf0818e0afd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-d45e-759c3df4d181	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-d673-33119cb287da	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-1417-10a9309eba31	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-3b40-efd603ba3331	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-6ba0-afe896cda99a	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-10e9-577d8627135d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-0b6a-cb1209ce35e0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-6aa0-96a7eafdee6d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-b039-93e98d4039ed	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-9ce3-c00aa9453ddc	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-dcdc-2f314775da00	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-6feb-e5450e887fba	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-79c2-23f5aef84f55	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-25cb-54135fab65cf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-39c6-0832fd8a6d62	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-5877-c40669612172	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-2d33-c7890e7dad68	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-d5f2-5b741d2ccc22	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-087a-e91460727ee7	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-febb-aae1b90c45f2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-e6f9-b38e5518b0cc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-dd7e-f9eb2660449a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-ce21-37d8a2067dd9	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-f2c8-48d873920d89	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-1318-0c3f7200c2ae	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-9972-1da995a954d6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-a002-9f1f44b1ac01	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-e576-ca35edf3d125	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-8299-4c0dad43fcba	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-1dc4-d7508ad39fde	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-6c17-75fed3f2a132	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-4028-6d3b654bf44d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-fceb-cc8c4e7d18ea	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-8494-8af859542b19	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-4b52-3dae924799c2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-bcb3-09802226da59	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-181f-2fca01b2476d	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-3f78-6648c2fc35bd	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-70ee-4d188cef6769	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-3c57-e53b20aa3b45	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-5f68-643bc25da93a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-9ca4-b24ff8da56d0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-9ef6-4877da05368b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-4fca-29ba72640bf3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-394d-4c08a32ec9ef	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-4512-ffd673213d8f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-f5ea-641897d7320a	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-62be-01341c0730fd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-f062-48df8c3c1d0f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-5896-d38f2fd1c11c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-9594-bb28cdb2573d	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-153d-4031008c8d76	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-717a-e24b604f63ca	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-85f5-88046c5e809e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-de17-ed786cbca8ba	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-0b89-d3be710b7069	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-b50e-6820db4abe7c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-1eea-4515984fa76e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-2fff-2cacfa0be0ac	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-acab-d3f85ebfcd9d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-87e7-d786e9d1c4c4	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-c6be-6fcdb3f63ef1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-62f3-30b561e0acf3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-f1ba-f12104bdb061	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-aa9e-84b131ccd505	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-a95c-bc55a743ad40	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-13e1-e507a3b4a1e2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-6a0c-daa2f5d7cd71	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-40fe-f1e4ae91ba1a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-fefd-19f5a18f00b0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-2dc7-17e386b8b47b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-0ea0-80ced1bbc5ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-31ae-eef69bb6e661	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-e00c-3cce02f050aa	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-9b8d-f8ab12e28219	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0c34-dad555eb4613	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-e345-92f0ed97f6b7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-51f7-450960ec36f6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-3e74-9c7bd24f209c	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-de15-29407422ef3d	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-e0cf-640535fa7232	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-e746-178a7b498f13	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-6267-200f8328a68b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-3088-bade89370c7d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-1630-9e5c74cf0b3d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-69cb-5515b54afdac	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-43ba-348f24db8fb4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-83ea-076f9a2e7569	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-ffa4-8ab12ff022f0	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-0b85-010451f26bdb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-52e7-fa6adf1d9d28	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-a56a-f82f22513a10	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-7c31-84eaf33eb02c	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-2025-cce6d5bb6c9e	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-620c-b1cbc6d1c3f9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-668f-1b617ba10491	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-8fe0-d07e668ee7b7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-43f4-79a4639a615b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-c1e6-e992cdc60426	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-ce8c-1049cf3e4e03	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-4a65-58aa5a06fb34	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-71a5-ba7b7e12e9b4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-b203-573412d9e60b	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-5f8b-07620c4da064	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-dc78-9d39d70dbe2f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-454a-2bafd86ac58d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-2c71-1eaa7555ea41	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-c659-d1a9282c4679	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-1d5f-7dc6384ef4a4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-34df-947635a67468	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-2796-a0686ea6b4a8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-4626-da02a74a2de7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-925d-1d22c994d888	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-008c-f66431a25d85	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-933a-f83520038c49	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-ddcb-0786f1855759	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-0215-c201a102a5f9	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-c235-00d864109ba5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-2a0a-363842524e4b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-cb30-b2a1a51b9f91	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-9e73-0647f0f4044b	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-ccfc-6ff4c31557a7	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-1636-2f2c8a5fdb75	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-9970-798defd644fe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-e788-6e26f41924af	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-fc1d-7a1167e1d6ef	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-4bfe-b979eddd9c56	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-a1f2-43410eb8e301	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-0414-2ac9e28481ee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-6c39-f823cbd09d05	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-87b4-a94590d638a4	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-2c88-9306ac90e6d9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-69eb-13adf66eef66	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-cd8b-3b42c428103a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-ed34-8875d239338f	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-8eec-54567383c8f1	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-f05c-a98f319c7469	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-4dfb-75a2019bc81d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-f5d9-f4c8cedc30f6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-a0cd-0352bc4fb4ff	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-4f01-ba7149b5c02f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-b78b-94bf6d4d431b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-c6d2-d24c514081f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-bff5-cfd6f7a9f270	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-e33f-b1418b191949	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-3061-3c2a6af6f644	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-6d0f-bb7dd5c1a6a7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-9aca-1de097c10269	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-c12e-742e8411cb5e	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-83bc-1f7a1e4c8efb	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-617d-06bd6419481d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-4ae8-ce5e52a1d806	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-40dc-1dcfcf7a6811	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-d44a-40fe2db1fee5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-675c-91f2691fda48	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-458d-e375645e7037	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-66cd-59aad6c4362a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-546e-e939d108d474	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-b65b-3d6265bf3147	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-acf9-0f0fef3e7b92	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-e056-9f6ef98a057d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-e102-60b0034b2e5a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-df35-de248d304635	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-8286-49aeeaf4a3aa	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-4ac1-4eb24069eb3a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-ee9e-13247739beac	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-9854-9c56e95a68e0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-f64d-e5f1fe06854f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-b504-0b97c04527c3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-f82b-21de3978e698	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-3a2e-39687bd5517c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-8c64-3cc4dd84b65c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-2d70-b4b4e54f58d7	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-6ab4-bd60e291cc91	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-123d-3ac77e19670a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-2588-ad294e7b2625	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-1599-1fd977b61f3c	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-53b7-bb2f4e318aa9	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-6a3d-8470dda5d6cb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-e2e3-24b2cb890297	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-9d84-58dde85e7fa7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-98e7-ec875d4a9052	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-1bcb-9cc0abb16ee8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-fb7b-477dbf37fcc2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-609e-446e728efdcf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-afc6-fc960f152766	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-3a80-c4ab10410516	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-58ce-dcccf1b1de1c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-c103-74c4e2036583	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-1667-b745e6e3b613	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-a6ee-40dfe4700958	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-a46a-85a7e44bf40c	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-9b03-b6f069684052	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-15ee-57b019d0eb0c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-e81e-fe2bafbb6685	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-5168-f18a7fb5cf5c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-c724-11062fe18822	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-7539-387dee48ee53	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-bfbc-7ed24ecb944e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-92f1-50eb18356487	User-delete	Aaa - Uporabnik - Briši	f
00020000-5534-f329-c3b9-64b949b04024	User-read	Aaa - Uporabnik - Beri	f
00020000-5534-f329-feca-63004295bad7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5534-f329-9e1d-0d8c47c7a0cd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5534-f329-9384-8f2ce5557adc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5534-f329-50c7-372c8d0e97b2	Role-delete	Aaa - Vloga - Briši	f
00020000-5534-f329-e9f2-470a4c9f460e	Role-read	Aaa - Vloga - Beri	f
00020000-5534-f329-4cf3-5c86a99685e0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5534-f329-f469-74994c888ed0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5534-f329-0063-39ef7e1d8d5e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5534-f329-bfbb-03d3aa36acbf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5534-f329-33ae-0011b5197436	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5534-f329-5f84-680255f4c05a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5534-f329-bdda-37bd0ee74b23	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5534-f329-d5a2-e8d7cacc0ba4	Drzava-read	Seznam držav	f
00020000-5534-f329-0b75-9b8816d3360c	Drzava-write	Urejanje držav	f
00020000-5534-f329-0d3e-f1de8ec43e49	Popa-delete	Poslovni partner - Briši	f
00020000-5534-f329-8fb1-7627e7431ad0	Popa-list	Poslovni partner - Beri	f
00020000-5534-f329-13c0-ee55f2e5a0b3	Popa-update	Poslovni partner - Posodobi	f
00020000-5534-f329-8b59-fe2eea210eb0	Popa-create	Poslovni partner - Ustvari	f
00020000-5534-f329-c2c5-bc743ab55c33	Posta-delete	Pošta - Briši	f
00020000-5534-f329-55c6-40419e1705cc	Posta-list	Pošta - Beri	f
00020000-5534-f329-9727-37e7a5c06d96	Posta-update	Pošta - Posodobi	f
00020000-5534-f329-0322-f260bca695db	Posta-create	Pošta - Ustvari	f
00020000-5534-f329-88fd-a4d57fe61fe7	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5534-f329-6828-5ac20fe863dd	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5534-f329-2e67-7ff484c7b537	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5534-f329-4c6b-00329c3b207e	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2848 (class 0 OID 2764698)
-- Dependencies: 174
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5534-f32a-647f-594e5521344c	00020000-5534-f329-d5a2-e8d7cacc0ba4
00000000-5534-f32a-647f-594e5521344c	00020000-5534-f328-1cb0-7e57624134f9
00000000-5534-f32a-0f0a-159b0c5888c3	00020000-5534-f329-0b75-9b8816d3360c
00000000-5534-f32a-0f0a-159b0c5888c3	00020000-5534-f329-d5a2-e8d7cacc0ba4
\.


--
-- TOC entry 2873 (class 0 OID 2764963)
-- Dependencies: 199
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 2764970)
-- Dependencies: 200
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 2765107)
-- Dependencies: 214
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 2764794)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 2764822)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5534-f328-7024-c007faa73b1e	8341	Adlešiči
00050000-5534-f328-30fc-9553b78fb368	5270	Ajdovščina
00050000-5534-f328-44f4-d2687f347aeb	6280	Ankaran/Ancarano
00050000-5534-f328-c3a1-a41388362797	9253	Apače
00050000-5534-f328-7649-e705220a396c	8253	Artiče
00050000-5534-f328-6eac-e3685c16780e	4275	Begunje na Gorenjskem
00050000-5534-f328-1e08-56649fa01f3b	1382	Begunje pri Cerknici
00050000-5534-f328-eab6-9349b72a1ffc	9231	Beltinci
00050000-5534-f328-4dd9-c2159b77d478	2234	Benedikt
00050000-5534-f328-808a-629de252f171	2345	Bistrica ob Dravi
00050000-5534-f328-902c-3f0a825b4909	3256	Bistrica ob Sotli
00050000-5534-f328-1721-a9238f8fb82f	8259	Bizeljsko
00050000-5534-f328-a0d7-070ea840a240	1223	Blagovica
00050000-5534-f328-7986-32efaab945fc	8283	Blanca
00050000-5534-f328-8ea3-dcdbf37f1e08	4260	Bled
00050000-5534-f328-ead4-eef670191c31	4273	Blejska Dobrava
00050000-5534-f328-4db7-83cb23eba293	9265	Bodonci
00050000-5534-f328-c8b4-09c353f842fb	9222	Bogojina
00050000-5534-f328-054a-87c7456c859e	4263	Bohinjska Bela
00050000-5534-f328-40a1-57bd930250be	4264	Bohinjska Bistrica
00050000-5534-f328-e1fd-66219a4dceb5	4265	Bohinjsko jezero
00050000-5534-f328-5237-8a529908ecbb	1353	Borovnica
00050000-5534-f328-d466-0b86890511d2	8294	Boštanj
00050000-5534-f328-8c54-2426d5148ebd	5230	Bovec
00050000-5534-f328-f011-081dc1f10113	5295	Branik
00050000-5534-f328-1b69-0e3c6ccdeb9e	3314	Braslovče
00050000-5534-f328-dab7-6901c2db30a5	5223	Breginj
00050000-5534-f328-523a-1a1c52a8fc3b	8280	Brestanica
00050000-5534-f328-2048-6a89521355b6	2354	Bresternica
00050000-5534-f328-ad90-e6cc128585f1	4243	Brezje
00050000-5534-f328-7473-408ed2a23d05	1351	Brezovica pri Ljubljani
00050000-5534-f328-aba3-d115f9b60102	8250	Brežice
00050000-5534-f328-a86f-892b763c73e4	4210	Brnik - Aerodrom
00050000-5534-f328-7c01-03b90f8fad87	8321	Brusnice
00050000-5534-f328-a88c-3f2b4c7ca1cc	3255	Buče
00050000-5534-f328-82de-20af4c59cd98	8276	Bučka 
00050000-5534-f328-a9b1-313085e15bba	9261	Cankova
00050000-5534-f328-23df-738bd9dc0758	3000	Celje 
00050000-5534-f328-22f0-6f25d71b210e	3001	Celje - poštni predali
00050000-5534-f328-6379-25af39092362	4207	Cerklje na Gorenjskem
00050000-5534-f328-6f53-d6b0ade6a2e6	8263	Cerklje ob Krki
00050000-5534-f328-b72b-e93581e008ae	1380	Cerknica
00050000-5534-f328-e33d-c3654c0d55f1	5282	Cerkno
00050000-5534-f328-4d4f-7e0f87574286	2236	Cerkvenjak
00050000-5534-f328-1be3-245b81718278	2215	Ceršak
00050000-5534-f328-fc60-8adae6882bd8	2326	Cirkovce
00050000-5534-f328-14af-013007273738	2282	Cirkulane
00050000-5534-f328-a60c-a2cfd6fef6fb	5273	Col
00050000-5534-f328-16ab-f801eea82d63	8251	Čatež ob Savi
00050000-5534-f328-670e-50228fd4a3a2	1413	Čemšenik
00050000-5534-f328-74d9-271a65608c5a	5253	Čepovan
00050000-5534-f328-591e-85ad2aca88e0	9232	Črenšovci
00050000-5534-f328-d2ef-55c0274c8884	2393	Črna na Koroškem
00050000-5534-f328-bba8-592e08178b73	6275	Črni Kal
00050000-5534-f328-b748-0befa90c8c4d	5274	Črni Vrh nad Idrijo
00050000-5534-f328-ef02-fe469ae141a2	5262	Črniče
00050000-5534-f328-4f86-0f11e4928435	8340	Črnomelj
00050000-5534-f328-9760-2e21d2102cfa	6271	Dekani
00050000-5534-f328-8ccb-193a6bcb82c3	5210	Deskle
00050000-5534-f328-f1ae-17d60ab8a4de	2253	Destrnik
00050000-5534-f328-3492-a29041b37714	6215	Divača
00050000-5534-f328-b621-62f85c17619c	1233	Dob
00050000-5534-f328-1690-027bcc3eac4f	3224	Dobje pri Planini
00050000-5534-f328-8d5a-3e5b3437b798	8257	Dobova
00050000-5534-f328-2681-8a5af34aae69	1423	Dobovec
00050000-5534-f328-cff9-7e7b3ea98595	5263	Dobravlje
00050000-5534-f328-4516-743e53913513	3204	Dobrna
00050000-5534-f328-f0c5-194dccb9afe4	8211	Dobrnič
00050000-5534-f328-4144-531af85b82ee	1356	Dobrova
00050000-5534-f328-e0a4-2bccfa366a60	9223	Dobrovnik/Dobronak 
00050000-5534-f328-46c1-d7004e6341f1	5212	Dobrovo v Brdih
00050000-5534-f328-4174-b89469e2f77c	1431	Dol pri Hrastniku
00050000-5534-f328-5c55-148feda974f3	1262	Dol pri Ljubljani
00050000-5534-f328-72da-a7171eafc52c	1273	Dole pri Litiji
00050000-5534-f328-472d-dfec4e9b8153	1331	Dolenja vas
00050000-5534-f328-6589-0c288ed5eb57	8350	Dolenjske Toplice
00050000-5534-f328-87d2-9beb65639827	1230	Domžale
00050000-5534-f328-7583-b2c4138ab084	2252	Dornava
00050000-5534-f328-9ff2-a13fb8a2a68a	5294	Dornberk
00050000-5534-f328-18da-c61dd73e0ad9	1319	Draga
00050000-5534-f328-fcb3-f1804466e404	8343	Dragatuš
00050000-5534-f328-2428-bc2a13ebb441	3222	Dramlje
00050000-5534-f328-530c-d62fdd08ed12	2370	Dravograd
00050000-5534-f328-aee0-520550f7825f	4203	Duplje
00050000-5534-f328-6939-c588d428331f	6221	Dutovlje
00050000-5534-f328-7a49-696b82e1d6e9	8361	Dvor
00050000-5534-f328-c93c-52b315231d66	2343	Fala
00050000-5534-f328-31c0-398e06581a6e	9208	Fokovci
00050000-5534-f328-8a64-169155b0edb4	2313	Fram
00050000-5534-f328-95a4-db6657130ab0	3213	Frankolovo
00050000-5534-f328-64e7-f9a2119749d0	1274	Gabrovka
00050000-5534-f328-2e61-a5ebdfefbdc6	8254	Globoko
00050000-5534-f328-5fa7-79cd15be3071	5275	Godovič
00050000-5534-f328-75df-b9514d6778b8	4204	Golnik
00050000-5534-f328-a814-15df8c94bbae	3303	Gomilsko
00050000-5534-f328-cb44-b9b02f8ee0c1	4224	Gorenja vas
00050000-5534-f328-9e58-5783c8b9ce1b	3263	Gorica pri Slivnici
00050000-5534-f328-ed78-f17bf57448d8	2272	Gorišnica
00050000-5534-f328-5375-161e48e54428	9250	Gornja Radgona
00050000-5534-f328-3e42-9dadcd23b12e	3342	Gornji Grad
00050000-5534-f328-1216-0bdb33535608	4282	Gozd Martuljek
00050000-5534-f328-12d8-6edc2b58c277	6272	Gračišče
00050000-5534-f328-9c73-7eea0fa5b3e6	9264	Grad
00050000-5534-f328-2480-7594066b589c	8332	Gradac
00050000-5534-f328-2713-19fb7d555f17	1384	Grahovo
00050000-5534-f328-049c-a903945e8486	5242	Grahovo ob Bači
00050000-5534-f328-68c5-b381df3350fe	5251	Grgar
00050000-5534-f328-7dfc-d576b0b2d00e	3302	Griže
00050000-5534-f328-58e1-30f6167c6a28	3231	Grobelno
00050000-5534-f328-f506-1e1db885a47e	1290	Grosuplje
00050000-5534-f328-96e8-9ef4c447e627	2288	Hajdina
00050000-5534-f328-8a57-d2639086752f	8362	Hinje
00050000-5534-f328-3e3e-4776c9924e70	2311	Hoče
00050000-5534-f328-dbbc-86f803dd02c3	9205	Hodoš/Hodos
00050000-5534-f328-d112-37b30ae48a8a	1354	Horjul
00050000-5534-f328-9ff4-c630265ef3b2	1372	Hotedršica
00050000-5534-f328-b852-1d7ec3810698	1430	Hrastnik
00050000-5534-f328-bdc1-ae87383a70e5	6225	Hruševje
00050000-5534-f328-981c-8544dd8d685c	4276	Hrušica
00050000-5534-f328-c652-b1a214de15b2	5280	Idrija
00050000-5534-f328-416e-932b9b7ace4e	1292	Ig
00050000-5534-f328-f1fe-9479924cced5	6250	Ilirska Bistrica
00050000-5534-f328-3d26-63f839bd19ca	6251	Ilirska Bistrica-Trnovo
00050000-5534-f328-fa81-958e51581d33	1295	Ivančna Gorica
00050000-5534-f328-3026-a0a61eb3fd7e	2259	Ivanjkovci
00050000-5534-f328-84e3-ed4f5e468a5b	1411	Izlake
00050000-5534-f328-c16e-622de8477cf7	6310	Izola/Isola
00050000-5534-f328-2ee4-5f48ebfb9ea7	2222	Jakobski Dol
00050000-5534-f328-2046-781433607073	2221	Jarenina
00050000-5534-f328-74f3-6dc468592a65	6254	Jelšane
00050000-5534-f328-6364-8e9f8c1a2bb3	4270	Jesenice
00050000-5534-f328-fc42-b76e2915fe58	8261	Jesenice na Dolenjskem
00050000-5534-f328-5707-2202a98fbc36	3273	Jurklošter
00050000-5534-f328-4e5c-a93d09c89d21	2223	Jurovski Dol
00050000-5534-f328-ac0c-827834bcc427	2256	Juršinci
00050000-5534-f328-47d7-20ea8fd41e0f	5214	Kal nad Kanalom
00050000-5534-f328-576f-2d0c8c60ba9e	3233	Kalobje
00050000-5534-f328-1292-34d114d12e27	4246	Kamna Gorica
00050000-5534-f328-1026-3cf267868ad7	2351	Kamnica
00050000-5534-f328-30d7-24c4974a44f4	1241	Kamnik
00050000-5534-f328-c570-9da42a34f01c	5213	Kanal
00050000-5534-f328-3dc4-990e221a07ce	8258	Kapele
00050000-5534-f328-8783-e78bc9117c7a	2362	Kapla
00050000-5534-f328-2594-cf24a42523ac	2325	Kidričevo
00050000-5534-f328-d732-289601b01b51	1412	Kisovec
00050000-5534-f328-5adf-ab0364799b8d	6253	Knežak
00050000-5534-f328-3139-05f0c4bd967f	5222	Kobarid
00050000-5534-f328-a657-ca4bf7f72b68	9227	Kobilje
00050000-5534-f328-5174-a2073657d3c9	1330	Kočevje
00050000-5534-f328-fe7c-00a2a34d49f7	1338	Kočevska Reka
00050000-5534-f328-df31-8e234705f34a	2276	Kog
00050000-5534-f328-d057-f80e95352b38	5211	Kojsko
00050000-5534-f328-02dd-686eb91a61f7	6223	Komen
00050000-5534-f328-fb70-8ced82ae011a	1218	Komenda
00050000-5534-f328-6fca-e3053a953097	6000	Koper/Capodistria 
00050000-5534-f328-6ed2-d2babac7fd03	6001	Koper/Capodistria - poštni predali
00050000-5534-f328-6865-4789068c190e	8282	Koprivnica
00050000-5534-f328-479e-ff27c0dbb387	5296	Kostanjevica na Krasu
00050000-5534-f328-5652-b3f9f0c39ea4	8311	Kostanjevica na Krki
00050000-5534-f328-1ba1-969595890e5c	1336	Kostel
00050000-5534-f328-66e8-41965dc35369	6256	Košana
00050000-5534-f328-f32a-bba1913c5c8d	2394	Kotlje
00050000-5534-f328-e39d-a562cb14bdbe	6240	Kozina
00050000-5534-f328-faf5-68391686e865	3260	Kozje
00050000-5534-f328-732e-817edbb5fae3	4000	Kranj 
00050000-5534-f328-85f3-22237590f617	4001	Kranj - poštni predali
00050000-5534-f328-e287-2063f8e0b8b2	4280	Kranjska Gora
00050000-5534-f328-6a71-25e29266894d	1281	Kresnice
00050000-5534-f328-ea85-24f3e06bd6fe	4294	Križe
00050000-5534-f328-b05e-ae3a4174014d	9206	Križevci
00050000-5534-f328-7cb0-cd02fa377da2	9242	Križevci pri Ljutomeru
00050000-5534-f328-997b-66fdaeccead3	1301	Krka
00050000-5534-f328-2a15-f34f3767ee70	8296	Krmelj
00050000-5534-f328-63bf-d8e167440677	4245	Kropa
00050000-5534-f328-6a70-22a31af31f54	8262	Krška vas
00050000-5534-f328-3d3d-9fac985960c8	8270	Krško
00050000-5534-f328-fdce-630fe96fe5f0	9263	Kuzma
00050000-5534-f328-b051-4295ddfbb7f1	2318	Laporje
00050000-5534-f328-5e05-cab1a55cf145	3270	Laško
00050000-5534-f328-9f5e-ce5d7a460312	1219	Laze v Tuhinju
00050000-5534-f328-5b2a-218995a9fe90	2230	Lenart v Slovenskih goricah
00050000-5534-f328-6ace-60c84da04b2d	9220	Lendava/Lendva
00050000-5534-f328-4068-93e466a98533	4248	Lesce
00050000-5534-f328-6f96-a4071986b436	3261	Lesično
00050000-5534-f328-2729-a82174d7321b	8273	Leskovec pri Krškem
00050000-5534-f328-c8d0-4368d93c0e16	2372	Libeliče
00050000-5534-f328-aa86-a3fe99d1009b	2341	Limbuš
00050000-5534-f328-78fa-2642ceab508b	1270	Litija
00050000-5534-f328-14a2-5ff7737684db	3202	Ljubečna
00050000-5534-f328-5498-936ced0fc87b	1000	Ljubljana 
00050000-5534-f328-4985-492ca48fd1dc	1001	Ljubljana - poštni predali
00050000-5534-f328-e6e4-d79e649bd94a	1231	Ljubljana - Črnuče
00050000-5534-f328-b122-6f75708b783a	1261	Ljubljana - Dobrunje
00050000-5534-f328-243a-57c895785c28	1260	Ljubljana - Polje
00050000-5534-f328-e82f-52ceb4ff7b4a	1210	Ljubljana - Šentvid
00050000-5534-f328-9007-674d157d49ad	1211	Ljubljana - Šmartno
00050000-5534-f328-516f-c168350a1370	3333	Ljubno ob Savinji
00050000-5534-f328-9bef-d8384261eb8a	9240	Ljutomer
00050000-5534-f328-a912-f8b1f9da19e4	3215	Loče
00050000-5534-f328-39cb-a0072a312f2a	5231	Log pod Mangartom
00050000-5534-f328-8a7b-3f30b391ab36	1358	Log pri Brezovici
00050000-5534-f328-618f-21a60a7e713d	1370	Logatec
00050000-5534-f328-3dfd-ab418f3ae423	1371	Logatec
00050000-5534-f328-b383-275c1768c35e	1434	Loka pri Zidanem Mostu
00050000-5534-f328-b96b-5830bb1b597d	3223	Loka pri Žusmu
00050000-5534-f328-b77c-e8c6929ea945	6219	Lokev
00050000-5534-f328-377b-99eb62735b1f	1318	Loški Potok
00050000-5534-f328-a66e-e3a36b414265	2324	Lovrenc na Dravskem polju
00050000-5534-f328-7554-0a985d6bebed	2344	Lovrenc na Pohorju
00050000-5534-f328-e3f3-05ac26a58abb	3334	Luče
00050000-5534-f328-13ec-579ea03cad75	1225	Lukovica
00050000-5534-f328-19e6-67d2b0a6c63d	9202	Mačkovci
00050000-5534-f328-eda5-d43036b1567d	2322	Majšperk
00050000-5534-f328-df6c-e762ebbf232d	2321	Makole
00050000-5534-f328-c519-772ddeb142ae	9243	Mala Nedelja
00050000-5534-f328-d6dd-fcb7feb6e765	2229	Malečnik
00050000-5534-f328-73fd-e04df6becd2b	6273	Marezige
00050000-5534-f328-41e7-529914833838	2000	Maribor 
00050000-5534-f328-ebcf-0b023eed6b27	2001	Maribor - poštni predali
00050000-5534-f328-05ab-1d06f476eef0	2206	Marjeta na Dravskem polju
00050000-5534-f328-ef13-7410ba695c79	2281	Markovci
00050000-5534-f328-74ac-bdb5c0ec9ea4	9221	Martjanci
00050000-5534-f328-8a2a-a72e4bb7783b	6242	Materija
00050000-5534-f328-0d61-77d7fc2116cb	4211	Mavčiče
00050000-5534-f328-cdb5-37ac930b6311	1215	Medvode
00050000-5534-f328-bd2e-8e2af5e86c92	1234	Mengeš
00050000-5534-f328-f4e6-8242d3a19cb5	8330	Metlika
00050000-5534-f328-c408-d48e69d0bc3c	2392	Mežica
00050000-5534-f328-ff1f-a492bd45c4a8	2204	Miklavž na Dravskem polju
00050000-5534-f328-9a71-5b4f0483bac3	2275	Miklavž pri Ormožu
00050000-5534-f328-c154-30d45de20623	5291	Miren
00050000-5534-f328-abc4-e9985aab5bc5	8233	Mirna
00050000-5534-f328-51ee-032012303e07	8216	Mirna Peč
00050000-5534-f328-022c-8e03e4b590e0	2382	Mislinja
00050000-5534-f328-e177-e6bc5898b5eb	4281	Mojstrana
00050000-5534-f328-c4d2-65e674094d77	8230	Mokronog
00050000-5534-f328-42e4-97cc5c3c190c	1251	Moravče
00050000-5534-f328-20fc-23c96597632f	9226	Moravske Toplice
00050000-5534-f328-410d-33a8f9fab2cd	5216	Most na Soči
00050000-5534-f328-0205-30b22b2dcd4e	1221	Motnik
00050000-5534-f328-806d-8582d47df53c	3330	Mozirje
00050000-5534-f328-d227-240a41246159	9000	Murska Sobota 
00050000-5534-f328-8cf7-11229918603f	9001	Murska Sobota - poštni predali
00050000-5534-f328-290d-a72e029db968	2366	Muta
00050000-5534-f328-950d-d68dec0c213b	4202	Naklo
00050000-5534-f328-06e5-c94a77fdeda6	3331	Nazarje
00050000-5534-f328-a87e-1d7a3bccda74	1357	Notranje Gorice
00050000-5534-f328-d570-b47dc92b8bcc	3203	Nova Cerkev
00050000-5534-f328-8e72-d168934c9388	5000	Nova Gorica 
00050000-5534-f328-16fc-2caa80102535	5001	Nova Gorica - poštni predali
00050000-5534-f328-0f5d-0af403363a1a	1385	Nova vas
00050000-5534-f328-8fad-1f7b1674653d	8000	Novo mesto
00050000-5534-f328-a212-69ef6e5c611a	8001	Novo mesto - poštni predali
00050000-5534-f328-6a69-0b6ac9f163e0	6243	Obrov
00050000-5534-f328-d446-9a86e5b7f6ec	9233	Odranci
00050000-5534-f328-3c9a-901aee7bdecf	2317	Oplotnica
00050000-5534-f328-ce87-e449cecda810	2312	Orehova vas
00050000-5534-f328-e292-fd1bd6e97402	2270	Ormož
00050000-5534-f328-8203-78519807a940	1316	Ortnek
00050000-5534-f328-159e-626afce48dd2	1337	Osilnica
00050000-5534-f328-da36-91a61b1ac826	8222	Otočec
00050000-5534-f328-a28b-30e00c895dee	2361	Ožbalt
00050000-5534-f328-4e28-bb21c28f827b	2231	Pernica
00050000-5534-f328-35f1-1825ad6b47ba	2211	Pesnica pri Mariboru
00050000-5534-f328-2966-a0992abb79cc	9203	Petrovci
00050000-5534-f328-d691-b3bf82f8c3fe	3301	Petrovče
00050000-5534-f328-7c60-9f0c12153139	6330	Piran/Pirano
00050000-5534-f328-8d96-5c865c7e1ddd	8255	Pišece
00050000-5534-f328-a5b2-4ddf3545d138	6257	Pivka
00050000-5534-f328-6352-fec3152ad0e8	6232	Planina
00050000-5534-f328-e0de-861a5ca1161a	3225	Planina pri Sevnici
00050000-5534-f328-19ad-61b49f8cdcd2	6276	Pobegi
00050000-5534-f328-7a62-cbf386ef3c7e	8312	Podbočje
00050000-5534-f328-d4f5-c49bbc5563e3	5243	Podbrdo
00050000-5534-f328-518f-85b0181c3a97	3254	Podčetrtek
00050000-5534-f328-f4d7-21bce298c5b7	2273	Podgorci
00050000-5534-f328-e3ab-24b13a961a02	6216	Podgorje
00050000-5534-f328-497d-faf1eb6dc58c	2381	Podgorje pri Slovenj Gradcu
00050000-5534-f328-4192-e56047513ad7	6244	Podgrad
00050000-5534-f328-6b0c-e933d91a7719	1414	Podkum
00050000-5534-f328-c3a3-c08dd3cc1c44	2286	Podlehnik
00050000-5534-f328-f347-cb29e6a0484c	5272	Podnanos
00050000-5534-f328-ac46-e4f6c78ae1c8	4244	Podnart
00050000-5534-f328-0594-03b89e023560	3241	Podplat
00050000-5534-f328-758a-2b6f652a15ed	3257	Podsreda
00050000-5534-f328-7a21-005fb75a70d1	2363	Podvelka
00050000-5534-f328-13c6-e5c63ee187a4	2208	Pohorje
00050000-5534-f328-8d1f-5a5e2f95a942	2257	Polenšak
00050000-5534-f328-6256-f71bd2e94b1f	1355	Polhov Gradec
00050000-5534-f328-6118-fde42f163494	4223	Poljane nad Škofjo Loko
00050000-5534-f328-e2ea-8e3b0b70a226	2319	Poljčane
00050000-5534-f328-501b-19e9f15b18f1	1272	Polšnik
00050000-5534-f328-5ef8-b420ef03914c	3313	Polzela
00050000-5534-f328-60de-fb61880813a0	3232	Ponikva
00050000-5534-f328-e7ac-6b171272de38	6320	Portorož/Portorose
00050000-5534-f328-ef97-e7ae62eb21a8	6230	Postojna
00050000-5534-f328-553c-14fa66bf9f35	2331	Pragersko
00050000-5534-f328-9d17-f18a112dd19b	3312	Prebold
00050000-5534-f328-4428-8b6ab7b1f878	4205	Preddvor
00050000-5534-f328-a091-2acf328d30d2	6255	Prem
00050000-5534-f328-44e6-42c30098332e	1352	Preserje
00050000-5534-f328-907a-ccec91c6c2c4	6258	Prestranek
00050000-5534-f328-09bf-364e873db28f	2391	Prevalje
00050000-5534-f328-f1aa-d19d54fb5134	3262	Prevorje
00050000-5534-f328-f9d5-ccc63d53a08d	1276	Primskovo 
00050000-5534-f328-b031-46b7cf53b645	3253	Pristava pri Mestinju
00050000-5534-f328-4fe4-eeddfd6bf5b9	9207	Prosenjakovci/Partosfalva
00050000-5534-f328-e12c-78004a496983	5297	Prvačina
00050000-5534-f328-65e8-f5980fe0da35	2250	Ptuj
00050000-5534-f328-e481-4103d7474d85	2323	Ptujska Gora
00050000-5534-f328-c075-e7f10f82cd4c	9201	Puconci
00050000-5534-f328-5f68-46031de53683	2327	Rače
00050000-5534-f328-15f6-3c977a7ca4a6	1433	Radeče
00050000-5534-f328-e1f1-9c32ec10dd3b	9252	Radenci
00050000-5534-f328-5425-8d2930246ae0	2360	Radlje ob Dravi
00050000-5534-f328-ac79-cb90d25a5f9c	1235	Radomlje
00050000-5534-f328-d177-f8ace924fe57	4240	Radovljica
00050000-5534-f328-9b5c-722e87300a1b	8274	Raka
00050000-5534-f328-65cc-4f9b8f39943f	1381	Rakek
00050000-5534-f328-76ee-5faee55317dc	4283	Rateče - Planica
00050000-5534-f328-63ba-87e88d76696f	2390	Ravne na Koroškem
00050000-5534-f328-5e12-24b2109f42f9	9246	Razkrižje
00050000-5534-f328-33d6-4d297e2bb2b9	3332	Rečica ob Savinji
00050000-5534-f328-991e-5b6d61f258e3	5292	Renče
00050000-5534-f328-0f54-fa66a3836cf2	1310	Ribnica
00050000-5534-f328-dd05-01f9cee43ea2	2364	Ribnica na Pohorju
00050000-5534-f328-d6a4-a1538b542a47	3272	Rimske Toplice
00050000-5534-f328-ee4c-17a391129f18	1314	Rob
00050000-5534-f328-1f2d-39ef6a472e90	5215	Ročinj
00050000-5534-f328-53e2-5b72e299e8d3	3250	Rogaška Slatina
00050000-5534-f328-9419-8c6c71487610	9262	Rogašovci
00050000-5534-f328-189c-10c67e9ed58a	3252	Rogatec
00050000-5534-f328-d92a-39e2908df3b6	1373	Rovte
00050000-5534-f328-1ce8-9f0983ea137f	2342	Ruše
00050000-5534-f328-13de-2eff5d760d0b	1282	Sava
00050000-5534-f328-a5ae-519ea446c305	6333	Sečovlje/Sicciole
00050000-5534-f328-51a7-0c5ddb8643da	4227	Selca
00050000-5534-f328-6066-74bc9c93d498	2352	Selnica ob Dravi
00050000-5534-f328-12a4-ad3b2b4ef1f4	8333	Semič
00050000-5534-f328-a4ed-2c6c0d6d9d0f	8281	Senovo
00050000-5534-f328-2f34-714a6aaa95b4	6224	Senožeče
00050000-5534-f328-cb7a-9081c96f3984	8290	Sevnica
00050000-5534-f328-c290-0cea755ef070	6210	Sežana
00050000-5534-f328-b672-36325c9b0e0a	2214	Sladki Vrh
00050000-5534-f328-bf76-1de1514c68fc	5283	Slap ob Idrijci
00050000-5534-f328-980b-704e619f257a	2380	Slovenj Gradec
00050000-5534-f328-d313-da5e21ac222b	2310	Slovenska Bistrica
00050000-5534-f328-e090-bd969c7d5061	3210	Slovenske Konjice
00050000-5534-f328-ef35-8181ce7cf196	1216	Smlednik
00050000-5534-f328-4dde-720326dd139c	5232	Soča
00050000-5534-f328-87a9-844fe20b6c69	1317	Sodražica
00050000-5534-f328-522f-b5f372f0f0c3	3335	Solčava
00050000-5534-f328-e88d-13d550ffe839	5250	Solkan
00050000-5534-f328-b8ed-119ee2bf78f6	4229	Sorica
00050000-5534-f328-3037-65faa328c09d	4225	Sovodenj
00050000-5534-f328-ab7e-e31801a20a48	5281	Spodnja Idrija
00050000-5534-f328-ec39-f27e55847edb	2241	Spodnji Duplek
00050000-5534-f328-4b32-595da7af6547	9245	Spodnji Ivanjci
00050000-5534-f328-1f63-66a08ee3c22b	2277	Središče ob Dravi
00050000-5534-f328-3b8e-e44ac60a4bc1	4267	Srednja vas v Bohinju
00050000-5534-f328-be36-61d62543cc01	8256	Sromlje 
00050000-5534-f328-5802-d6e07c87415e	5224	Srpenica
00050000-5534-f328-679c-60aa1a08e191	1242	Stahovica
00050000-5534-f328-e689-cbcdbef74bbe	1332	Stara Cerkev
00050000-5534-f328-e02d-1a5bc2e7774a	8342	Stari trg ob Kolpi
00050000-5534-f328-2d6f-6553fa3478e6	1386	Stari trg pri Ložu
00050000-5534-f328-271b-a211de5e3cb3	2205	Starše
00050000-5534-f328-402e-1ffc4873e41c	2289	Stoperce
00050000-5534-f328-7f5b-d1c05dfa78ff	8322	Stopiče
00050000-5534-f328-47e1-da9f7ae2f8b3	3206	Stranice
00050000-5534-f328-0609-0bbe1ed77146	8351	Straža
00050000-5534-f328-b447-ce816c0d42d1	1313	Struge
00050000-5534-f328-97df-7a9f78d3713b	8293	Studenec
00050000-5534-f328-ede0-7a892f91b30e	8331	Suhor
00050000-5534-f328-c6af-0e3fc644ee2c	2233	Sv. Ana v Slovenskih goricah
00050000-5534-f328-51a7-9f100e7f1e26	2235	Sv. Trojica v Slovenskih goricah
00050000-5534-f328-ccc6-f14a867b6407	2353	Sveti Duh na Ostrem Vrhu
00050000-5534-f328-3b52-eb8c975b1441	9244	Sveti Jurij ob Ščavnici
00050000-5534-f328-b7c3-1c9933aa0a60	3264	Sveti Štefan
00050000-5534-f328-c51e-1855be27cd8d	2258	Sveti Tomaž
00050000-5534-f328-8f30-d710a291e62e	9204	Šalovci
00050000-5534-f328-9430-e6dfb98491a2	5261	Šempas
00050000-5534-f328-55cf-b65e045fdc79	5290	Šempeter pri Gorici
00050000-5534-f328-db01-609d1232788a	3311	Šempeter v Savinjski dolini
00050000-5534-f328-4b5c-b2ac5bdaf7e6	4208	Šenčur
00050000-5534-f328-db21-c0421d2a5065	2212	Šentilj v Slovenskih goricah
00050000-5534-f328-70cc-2d5fcc7ad3dc	8297	Šentjanž
00050000-5534-f328-8fb6-b6f6d044ca67	2373	Šentjanž pri Dravogradu
00050000-5534-f328-7985-048943e019f4	8310	Šentjernej
00050000-5534-f328-a8c9-04423eb5fbf3	3230	Šentjur
00050000-5534-f328-fb47-36cbb9763020	3271	Šentrupert
00050000-5534-f328-f193-9100b8fb33fb	8232	Šentrupert
00050000-5534-f328-0ccd-78617284d86e	1296	Šentvid pri Stični
00050000-5534-f328-eefa-c1eb74802973	8275	Škocjan
00050000-5534-f328-130e-90c95d076fe0	6281	Škofije
00050000-5534-f328-6043-32d62fb3c415	4220	Škofja Loka
00050000-5534-f328-a6ac-58ca4bd3c3c5	3211	Škofja vas
00050000-5534-f328-c75e-18345a94c415	1291	Škofljica
00050000-5534-f328-8343-abb46c90a16b	6274	Šmarje
00050000-5534-f328-20b6-d8c041c37fba	1293	Šmarje - Sap
00050000-5534-f328-d6bd-e981e8907c32	3240	Šmarje pri Jelšah
00050000-5534-f328-5767-e6dfb0cb056c	8220	Šmarješke Toplice
00050000-5534-f328-434a-fcbb8ef55e35	2315	Šmartno na Pohorju
00050000-5534-f328-c36f-4cbccbbb6659	3341	Šmartno ob Dreti
00050000-5534-f328-93e9-8b0346ca9970	3327	Šmartno ob Paki
00050000-5534-f328-f8c2-215d13bd89b0	1275	Šmartno pri Litiji
00050000-5534-f328-93bb-ada923fc3dd6	2383	Šmartno pri Slovenj Gradcu
00050000-5534-f328-1542-cead19190721	3201	Šmartno v Rožni dolini
00050000-5534-f328-3fef-ded04c0ba69a	3325	Šoštanj
00050000-5534-f328-bb21-fa706e8c11f3	6222	Štanjel
00050000-5534-f328-2bcd-d4c627133b11	3220	Štore
00050000-5534-f328-344c-fdbd61008097	3304	Tabor
00050000-5534-f328-edda-2d3f55d96c5b	3221	Teharje
00050000-5534-f328-6356-39293c1d992b	9251	Tišina
00050000-5534-f328-00b3-577a968ec240	5220	Tolmin
00050000-5534-f328-295d-389ad0318727	3326	Topolšica
00050000-5534-f328-8ffd-e85baa7d930e	2371	Trbonje
00050000-5534-f328-e2b2-2f049dc153ae	1420	Trbovlje
00050000-5534-f328-6d78-5bba2cdbcbe2	8231	Trebelno 
00050000-5534-f328-b25b-da5ae2f36dab	8210	Trebnje
00050000-5534-f328-9575-65ae3847c47b	5252	Trnovo pri Gorici
00050000-5534-f328-37ed-626526280394	2254	Trnovska vas
00050000-5534-f328-161f-203d4f515109	1222	Trojane
00050000-5534-f328-a7cb-cf395228d217	1236	Trzin
00050000-5534-f328-ff27-9657e5d2328c	4290	Tržič
00050000-5534-f328-2a21-754b388f80d5	8295	Tržišče
00050000-5534-f328-a72a-422cc65fc326	1311	Turjak
00050000-5534-f328-dfe9-2b6f6f65bc28	9224	Turnišče
00050000-5534-f328-bdbd-3ceb0b64cca7	8323	Uršna sela
00050000-5534-f328-0e35-e41ec555b27b	1252	Vače
00050000-5534-f328-1d89-365b6e78113f	3320	Velenje 
00050000-5534-f328-a1d8-66aebdb81b91	3322	Velenje - poštni predali
00050000-5534-f328-452e-6f85d94b9c61	8212	Velika Loka
00050000-5534-f328-7057-d3508ad2cd44	2274	Velika Nedelja
00050000-5534-f328-3f00-a7df555ae058	9225	Velika Polana
00050000-5534-f328-605e-a77237e9febf	1315	Velike Lašče
00050000-5534-f328-f09b-99119a5691ea	8213	Veliki Gaber
00050000-5534-f328-40db-c90b3609acda	9241	Veržej
00050000-5534-f328-4210-957617233e89	1312	Videm - Dobrepolje
00050000-5534-f328-754e-3aec0c8358da	2284	Videm pri Ptuju
00050000-5534-f328-0c4c-ad5fadd802b4	8344	Vinica
00050000-5534-f328-f6a0-051329fd173b	5271	Vipava
00050000-5534-f328-6d26-7e41ccc2ab4d	4212	Visoko
00050000-5534-f328-61e1-75d45cc57d72	1294	Višnja Gora
00050000-5534-f328-182f-581118f4d591	3205	Vitanje
00050000-5534-f328-2441-3e34f990f011	2255	Vitomarci
00050000-5534-f328-7718-1233adcfe7c7	1217	Vodice
00050000-5534-f328-a8de-e1549dc2019b	3212	Vojnik\t
00050000-5534-f328-7624-7b9e7b141838	5293	Volčja Draga
00050000-5534-f328-a024-233d10018c2e	2232	Voličina
00050000-5534-f328-e859-8ca4853fd852	3305	Vransko
00050000-5534-f328-85c2-6e060aba51e3	6217	Vremski Britof
00050000-5534-f328-98b6-d62a531544f6	1360	Vrhnika
00050000-5534-f328-6582-879b1bf54f02	2365	Vuhred
00050000-5534-f328-05fa-ed9005fc2d18	2367	Vuzenica
00050000-5534-f328-e3a0-32e0523cdc75	8292	Zabukovje 
00050000-5534-f328-8c24-b0b86ba0db1f	1410	Zagorje ob Savi
00050000-5534-f328-5c2f-1823b2d8bfc3	1303	Zagradec
00050000-5534-f328-e5a1-c62d85e99df8	2283	Zavrč
00050000-5534-f328-6c11-0976c47ed865	8272	Zdole 
00050000-5534-f328-475e-042fb95c1546	4201	Zgornja Besnica
00050000-5534-f328-3941-f64f7606c50f	2242	Zgornja Korena
00050000-5534-f328-3cd6-e5670c7f9717	2201	Zgornja Kungota
00050000-5534-f328-8885-ba3ced162512	2316	Zgornja Ložnica
00050000-5534-f328-1c6e-cf7e153cb073	2314	Zgornja Polskava
00050000-5534-f328-643c-5afd676c12ce	2213	Zgornja Velka
00050000-5534-f328-7a53-da884df2d39e	4247	Zgornje Gorje
00050000-5534-f328-a78a-c1d4666d7c0c	4206	Zgornje Jezersko
00050000-5534-f328-120c-533063c450c3	2285	Zgornji Leskovec
00050000-5534-f328-074c-360d13e97c17	1432	Zidani Most
00050000-5534-f328-313b-9af33d9f7e5e	3214	Zreče
00050000-5534-f328-b02d-93e0dd79e784	4209	Žabnica
00050000-5534-f328-a191-18517287ac02	3310	Žalec
00050000-5534-f328-d4e6-24fc29676109	4228	Železniki
00050000-5534-f328-a930-79b0c1e1682f	2287	Žetale
00050000-5534-f328-0fef-556e51043e94	4226	Žiri
00050000-5534-f328-dc0c-9c3d9587f585	4274	Žirovnica
00050000-5534-f328-49e2-9e42a0112a2a	8360	Žužemberk
\.


--
-- TOC entry 2875 (class 0 OID 2764978)
-- Dependencies: 201
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 2789301)
-- Dependencies: 225
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 2764830)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 2764904)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 2764984)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 2765121)
-- Dependencies: 215
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 2765130)
-- Dependencies: 216
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 2764991)
-- Dependencies: 203
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 2765000)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 2765009)
-- Dependencies: 205
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 2765137)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 2765147)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 2764679)
-- Dependencies: 172
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5534-f32a-718e-4a8f8d62f5ec	00010000-5534-f32a-d6c8-814b438ac7d5	2015-04-20 12:41:03	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRObXYAAsMjNrmv07SSnMkyHBNEWPesLBG";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2880 (class 0 OID 2765019)
-- Dependencies: 206
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 2764688)
-- Dependencies: 173
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5534-f32a-ce6c-47f80bf75564	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5534-f32a-ea23-fd2bbfa5d1f1	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5534-f32a-647f-594e5521344c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5534-f32a-df47-cc8627e214bd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5534-f32a-e698-4c05229c173f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5534-f32a-0f0a-159b0c5888c3	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2850 (class 0 OID 2764717)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5534-f32a-718e-4a8f8d62f5ec	00000000-5534-f32a-df47-cc8627e214bd
00010000-5534-f32a-8173-b31b609cd8bf	00000000-5534-f32a-647f-594e5521344c
\.


--
-- TOC entry 2881 (class 0 OID 2765025)
-- Dependencies: 207
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 2765037)
-- Dependencies: 208
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 2764912)
-- Dependencies: 193
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 2764845)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 2764937)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 2765157)
-- Dependencies: 219
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 2764852)
-- Dependencies: 187
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 2764705)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-5534-f32a-d6c8-814b438ac7d5	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxRO6gYar20h5Q/hoq6l49HlGoYe09JTyQ.	t	\N	\N	\N	rootmail@max.si
00010000-5534-f32a-8173-b31b609cd8bf	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxROsqOOJrjTfcoxcfxRR6c3W018dsknGdW	t	\N	\N	\N	noreply@max.si
00010000-5534-f32a-718e-4a8f8d62f5ec	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2894 (class 0 OID 2765166)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 2764918)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 2765043)
-- Dependencies: 209
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 2765184)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 2764924)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 2765192)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 2765202)
-- Dependencies: 223
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2482 (class 2606 OID 2764732)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 2765055)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 2765075)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 2765093)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 2764876)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 2764890)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 2764745)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 2765103)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 2764896)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 2764902)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 2764791)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 2764954)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 2764962)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 2764760)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 2764770)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 2764819)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2654 (class 2606 OID 2789299)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 2764702)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2464 (class 2606 OID 2764676)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 2764968)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 2764977)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 2765117)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 2764812)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 2764828)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 2764982)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 2789311)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 2764842)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 2764908)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 2764988)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 2765127)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 2765135)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 2764998)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 2765004)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 2765014)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 2765146)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 2765154)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 2764687)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 2765023)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 2764721)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2468 (class 2606 OID 2764696)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 2765033)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 2765042)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 2764917)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 2764849)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 2764946)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 2765165)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 2764861)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 2764715)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 2765180)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 2764922)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 2765049)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 2765190)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 2764936)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 2765201)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 2765211)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 1259 OID 2764883)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2499 (class 1259 OID 2764814)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 2789313)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2657 (class 1259 OID 2789312)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2658 (class 1259 OID 2789314)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2563 (class 1259 OID 2764969)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2571 (class 1259 OID 2764990)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2572 (class 1259 OID 2764989)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2548 (class 1259 OID 2764923)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2618 (class 1259 OID 2765106)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2619 (class 1259 OID 2765104)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2620 (class 1259 OID 2765105)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2621 (class 1259 OID 2765118)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2622 (class 1259 OID 2765119)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2623 (class 1259 OID 2765120)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2641 (class 1259 OID 2765183)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2642 (class 1259 OID 2765182)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2643 (class 1259 OID 2765181)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2518 (class 1259 OID 2764863)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2519 (class 1259 OID 2764862)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2503 (class 1259 OID 2764821)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2504 (class 1259 OID 2764820)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 2765024)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2540 (class 1259 OID 2764903)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2470 (class 1259 OID 2764703)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2471 (class 1259 OID 2764704)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2593 (class 1259 OID 2765036)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2594 (class 1259 OID 2765035)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2595 (class 1259 OID 2765034)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2541 (class 1259 OID 2764909)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2542 (class 1259 OID 2764911)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2543 (class 1259 OID 2764910)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2584 (class 1259 OID 2765018)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2585 (class 1259 OID 2765016)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2586 (class 1259 OID 2765015)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2587 (class 1259 OID 2765017)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2477 (class 1259 OID 2764722)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2478 (class 1259 OID 2764723)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2600 (class 1259 OID 2765050)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2568 (class 1259 OID 2764983)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2635 (class 1259 OID 2765155)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2636 (class 1259 OID 2765156)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2510 (class 1259 OID 2764843)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2511 (class 1259 OID 2764844)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2626 (class 1259 OID 2765128)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2627 (class 1259 OID 2765129)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2605 (class 1259 OID 2765058)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2606 (class 1259 OID 2765057)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2607 (class 1259 OID 2765060)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2608 (class 1259 OID 2765056)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2609 (class 1259 OID 2765059)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2646 (class 1259 OID 2765191)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 2765008)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2579 (class 1259 OID 2765007)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2580 (class 1259 OID 2765005)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2581 (class 1259 OID 2765006)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2612 (class 1259 OID 2765077)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 2765076)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2537 (class 1259 OID 2764897)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2492 (class 1259 OID 2764772)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2493 (class 1259 OID 2764771)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2514 (class 1259 OID 2764850)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2515 (class 1259 OID 2764851)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2553 (class 1259 OID 2764949)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2554 (class 1259 OID 2764948)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2555 (class 1259 OID 2764947)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2525 (class 1259 OID 2764885)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2526 (class 1259 OID 2764881)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2527 (class 1259 OID 2764878)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2528 (class 1259 OID 2764879)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2529 (class 1259 OID 2764877)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2530 (class 1259 OID 2764882)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2531 (class 1259 OID 2764880)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2502 (class 1259 OID 2764813)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2485 (class 1259 OID 2764746)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2486 (class 1259 OID 2764748)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2487 (class 1259 OID 2764747)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2488 (class 1259 OID 2764749)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2560 (class 1259 OID 2764955)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2655 (class 1259 OID 2789300)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2491 (class 1259 OID 2764761)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2474 (class 1259 OID 2764716)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2577 (class 1259 OID 2764999)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2498 (class 1259 OID 2764793)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2509 (class 1259 OID 2764829)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2632 (class 1259 OID 2765136)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2469 (class 1259 OID 2764697)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2532 (class 1259 OID 2764884)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2681 (class 2606 OID 2765317)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 2765302)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2679 (class 2606 OID 2765307)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2683 (class 2606 OID 2765327)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2677 (class 2606 OID 2765297)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2682 (class 2606 OID 2765322)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2680 (class 2606 OID 2765312)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2668 (class 2606 OID 2765252)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2735 (class 2606 OID 2789325)
-- Name: fk_1db842d610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT fk_1db842d610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2734 (class 2606 OID 2789320)
-- Name: fk_1db842d6a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT fk_1db842d6a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2736 (class 2606 OID 2789330)
-- Name: fk_1db842d6ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT fk_1db842d6ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2694 (class 2606 OID 2765382)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2697 (class 2606 OID 2765397)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2696 (class 2606 OID 2765392)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2689 (class 2606 OID 2765357)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2720 (class 2606 OID 2765512)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2718 (class 2606 OID 2765502)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2719 (class 2606 OID 2765507)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2693 (class 2606 OID 2765377)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2723 (class 2606 OID 2789360)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2721 (class 2606 OID 2765522)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2722 (class 2606 OID 2765527)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2731 (class 2606 OID 2765567)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2730 (class 2606 OID 2765562)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2729 (class 2606 OID 2765557)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2676 (class 2606 OID 2789345)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2675 (class 2606 OID 2765287)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2670 (class 2606 OID 2789335)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2669 (class 2606 OID 2765257)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2733 (class 2606 OID 2789315)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2706 (class 2606 OID 2765442)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2685 (class 2606 OID 2765337)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 2765212)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2662 (class 2606 OID 2765217)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2709 (class 2606 OID 2765457)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2708 (class 2606 OID 2765452)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2707 (class 2606 OID 2765447)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2686 (class 2606 OID 2765342)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2688 (class 2606 OID 2765352)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2687 (class 2606 OID 2765347)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2705 (class 2606 OID 2765437)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2703 (class 2606 OID 2765427)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2702 (class 2606 OID 2765422)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2704 (class 2606 OID 2765432)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2663 (class 2606 OID 2765222)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2664 (class 2606 OID 2765227)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2710 (class 2606 OID 2765462)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2695 (class 2606 OID 2765387)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2727 (class 2606 OID 2765547)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2728 (class 2606 OID 2765552)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2671 (class 2606 OID 2765267)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2672 (class 2606 OID 2765272)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2724 (class 2606 OID 2765532)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2725 (class 2606 OID 2765537)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2715 (class 2606 OID 2789355)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2712 (class 2606 OID 2765472)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2714 (class 2606 OID 2765487)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2711 (class 2606 OID 2765467)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2713 (class 2606 OID 2765482)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2732 (class 2606 OID 2789365)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2701 (class 2606 OID 2765417)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2700 (class 2606 OID 2765412)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2698 (class 2606 OID 2765402)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2699 (class 2606 OID 2765407)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2667 (class 2606 OID 2765247)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2717 (class 2606 OID 2765497)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2716 (class 2606 OID 2765492)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2684 (class 2606 OID 2765332)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2726 (class 2606 OID 2765542)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2666 (class 2606 OID 2765237)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2665 (class 2606 OID 2765232)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2674 (class 2606 OID 2789340)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2673 (class 2606 OID 2765282)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 2789350)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 2765367)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2690 (class 2606 OID 2765362)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-20 23:00:38 CEST

--
-- PostgreSQL database dump complete
--

