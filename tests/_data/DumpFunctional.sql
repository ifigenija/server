--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-04-09 10:24:28 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 2187701)
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
-- TOC entry 210 (class 1259 OID 2188032)
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
-- TOC entry 211 (class 1259 OID 2188042)
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
-- TOC entry 212 (class 1259 OID 2188059)
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
-- TOC entry 188 (class 1259 OID 2187845)
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
-- TOC entry 189 (class 1259 OID 2187867)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 2187710)
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
-- TOC entry 213 (class 1259 OID 2188075)
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
-- TOC entry 190 (class 1259 OID 2187872)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 191 (class 1259 OID 2187879)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 181 (class 1259 OID 2187750)
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
-- TOC entry 197 (class 1259 OID 2187931)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 198 (class 1259 OID 2187937)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 179 (class 1259 OID 2187727)
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
-- TOC entry 180 (class 1259 OID 2187739)
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
-- TOC entry 183 (class 1259 OID 2187794)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 170 (class 1259 OID 2187645)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 174 (class 1259 OID 2187675)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 2187944)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 2187951)
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
-- TOC entry 214 (class 1259 OID 2188088)
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
-- TOC entry 182 (class 1259 OID 2187773)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
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
-- TOC entry 184 (class 1259 OID 2187801)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 2187959)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 185 (class 1259 OID 2187809)
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
-- TOC entry 192 (class 1259 OID 2187885)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 2187965)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 2188102)
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
-- TOC entry 216 (class 1259 OID 2188111)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 2187972)
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
-- TOC entry 204 (class 1259 OID 2187981)
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
-- TOC entry 205 (class 1259 OID 2187990)
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
-- TOC entry 217 (class 1259 OID 2188118)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 2188128)
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
-- TOC entry 172 (class 1259 OID 2187656)
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
-- TOC entry 171 (class 1259 OID 2187654)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 206 (class 1259 OID 2188000)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 173 (class 1259 OID 2187665)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 2187694)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 2188006)
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
-- TOC entry 208 (class 1259 OID 2188018)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 2187893)
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
-- TOC entry 186 (class 1259 OID 2187824)
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
-- TOC entry 196 (class 1259 OID 2187918)
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
-- TOC entry 219 (class 1259 OID 2188138)
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
-- TOC entry 187 (class 1259 OID 2187831)
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
-- TOC entry 175 (class 1259 OID 2187682)
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
-- TOC entry 220 (class 1259 OID 2188147)
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
-- TOC entry 194 (class 1259 OID 2187899)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 209 (class 1259 OID 2188024)
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
-- TOC entry 221 (class 1259 OID 2188165)
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
-- TOC entry 195 (class 1259 OID 2187905)
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
-- TOC entry 222 (class 1259 OID 2188173)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 2188183)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2320 (class 2604 OID 2187659)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2821 (class 0 OID 2187701)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 2188032)
-- Dependencies: 210
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 2188042)
-- Dependencies: 211
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 2188059)
-- Dependencies: 212
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 2187845)
-- Dependencies: 188
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 2187867)
-- Dependencies: 189
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 2187710)
-- Dependencies: 178
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5526-35bd-dd52-441af338a774	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5526-35bd-8b00-4cfaf48c45df	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5526-35bd-bf3e-5eb3a49a3628	AL	ALB	008	Albania 	Albanija	\N
00040000-5526-35bd-e07a-2ec751891753	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5526-35bd-7f8e-3ad7844d3afe	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5526-35bd-cdce-3dabf42f3053	AD	AND	020	Andorra 	Andora	\N
00040000-5526-35bd-94ad-ef5e038229f4	AO	AGO	024	Angola 	Angola	\N
00040000-5526-35bd-d410-e0365bf751af	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5526-35bd-9654-7e7a3d6f6ce8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5526-35bd-50ab-7da897e8c986	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5526-35bd-d582-5aecfcb6c8e4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5526-35bd-7e13-683015deca00	AM	ARM	051	Armenia 	Armenija	\N
00040000-5526-35bd-79ee-3bd36eb60667	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5526-35bd-cacd-88db17cf565f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5526-35bd-dded-3b93e486f051	AT	AUT	040	Austria 	Avstrija	\N
00040000-5526-35bd-5b83-351003cc93a5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5526-35bd-4144-9fb8b86c6d99	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5526-35bd-26d5-a2d9e238281b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5526-35bd-50b5-bb8f372cd659	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5526-35bd-e0cc-8482c685492a	BB	BRB	052	Barbados 	Barbados	\N
00040000-5526-35bd-6897-cf61de64b539	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5526-35bd-edb6-28519ae969b5	BE	BEL	056	Belgium 	Belgija	\N
00040000-5526-35bd-9412-a2cc3a385717	BZ	BLZ	084	Belize 	Belize	\N
00040000-5526-35bd-a68d-e24aae3b76f6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5526-35bd-2732-f0524e73d395	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5526-35bd-e6c7-0aade143a344	BT	BTN	064	Bhutan 	Butan	\N
00040000-5526-35bd-c500-638b9b390616	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5526-35bd-79d4-5ea5dce8426c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5526-35bd-786f-b9e079906ae5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5526-35bd-b6b8-07e876bce72d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5526-35bd-e8c5-e712999c1b3a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5526-35bd-096d-5cb86a40a03c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5526-35bd-58e9-5c1b6f532044	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5526-35bd-b19f-f45a47457c36	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5526-35bd-891a-c9b82bca0bcc	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5526-35bd-8729-91156c720e6b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5526-35bd-795a-e6cb85e0767c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5526-35bd-01a8-425010e5ac07	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5526-35bd-0dfb-12443a2ddc6f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5526-35bd-957a-1295a23a5760	CA	CAN	124	Canada 	Kanada	\N
00040000-5526-35bd-6a54-d4c5bd033661	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5526-35bd-6859-40b1a4e1cd67	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5526-35bd-a2dc-8ab18e7d86d6	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5526-35bd-ebeb-d644b88df40c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5526-35bd-fe09-4e43533ebc57	CL	CHL	152	Chile 	Čile	\N
00040000-5526-35bd-7e22-be70f579b5e7	CN	CHN	156	China 	Kitajska	\N
00040000-5526-35bd-b969-f5c5ac9d6a67	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5526-35bd-ddf0-fbdfe6545a16	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5526-35bd-7ca4-92fcac48804d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5526-35bd-a559-6a0f163f9afb	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5526-35bd-1c72-238cab3a2ed6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5526-35bd-17e7-4968613b8174	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5526-35bd-bd2a-6ddc0feebba7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5526-35bd-963c-54b809ee8d25	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5526-35bd-881c-ee1f9e05c79f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5526-35bd-8347-5dab48b8230a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5526-35bd-f264-f918e5dcc729	CU	CUB	192	Cuba 	Kuba	\N
00040000-5526-35bd-6f99-a9363ea5153b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5526-35bd-689e-0303d2a56921	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5526-35bd-98d4-06664805e90c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5526-35bd-60de-cd169f626e02	DK	DNK	208	Denmark 	Danska	\N
00040000-5526-35bd-ed54-d6649a63c772	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5526-35bd-0a6d-f4be8a3b4fbc	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5526-35bd-8fc2-a3dbc5889281	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5526-35bd-4bcc-183c4fcb8fc5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5526-35bd-d986-5e32f3ea8bff	EG	EGY	818	Egypt 	Egipt	\N
00040000-5526-35bd-6366-86965baf5ebf	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5526-35bd-2180-9e2b4bc9ec2a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5526-35bd-70c6-80d1a6d9ec77	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5526-35bd-5a48-f1feac118f34	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5526-35bd-c671-609f8853b761	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5526-35bd-2426-8ca3596316cb	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5526-35bd-7ad3-4b819af331ea	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5526-35bd-5841-499c30742bb8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5526-35bd-460c-035573fa23bb	FI	FIN	246	Finland 	Finska	\N
00040000-5526-35bd-75de-1f06dd2d647a	FR	FRA	250	France 	Francija	\N
00040000-5526-35bd-8b3b-821e8f4ff048	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5526-35be-6aa1-f38b4ea2199a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5526-35bd-9709-f7f5749c5ebe	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5526-35bd-30ea-be3eaa11a264	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5526-35bd-3386-2289aff9a76f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5526-35bd-540a-b158bd392e7b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5526-35be-bc12-47b0536199bf	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5526-35be-c7a1-d8ddeb37c5ea	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5526-35be-2028-dc80381801de	GH	GHA	288	Ghana 	Gana	\N
00040000-5526-35be-d54f-ceaa9d256075	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5526-35be-01e0-53198ecd98ae	GR	GRC	300	Greece 	Grčija	\N
00040000-5526-35be-1028-cc20abde9b68	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5526-35be-347b-dfa7debd3e4b	GD	GRD	308	Grenada 	Grenada	\N
00040000-5526-35be-7992-37c947d22edd	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5526-35be-af38-57a3970094ce	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5526-35be-1d30-938bbb68d9f0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5526-35be-afd6-9ddca858f213	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5526-35be-1f72-d1964d499a79	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5526-35be-8f05-342adcd14bab	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5526-35be-fba5-6acddc4e2639	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5526-35be-cced-d88a3796bf54	HT	HTI	332	Haiti 	Haiti	\N
00040000-5526-35be-099b-dd07d1420b20	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5526-35be-0cca-6e14247c99a9	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5526-35be-9f0e-fa18f4348a9a	HN	HND	340	Honduras 	Honduras	\N
00040000-5526-35be-d1e9-3f0a8f7b3721	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5526-35be-86db-c2a310f3beba	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5526-35be-4ac4-1bcf5a135bef	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5526-35be-de44-809f06fb133b	IN	IND	356	India 	Indija	\N
00040000-5526-35be-0dfd-de62231b4d75	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5526-35be-36ac-6c2d036e48bf	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5526-35be-d5f2-51538d0ad256	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5526-35be-710e-2d4dd06c1511	IE	IRL	372	Ireland 	Irska	\N
00040000-5526-35be-58de-d17348224aa5	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5526-35be-0534-04d6b4efa792	IL	ISR	376	Israel 	Izrael	\N
00040000-5526-35be-7260-c7145504e5e1	IT	ITA	380	Italy 	Italija	\N
00040000-5526-35be-89f9-b8643739e383	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5526-35be-a863-cd7c2098381f	JP	JPN	392	Japan 	Japonska	\N
00040000-5526-35be-ab9f-0b2e71e9e0d1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5526-35be-df9b-90f3f2821dbe	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5526-35be-9409-ab968759bfec	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5526-35be-4994-16df81a372e2	KE	KEN	404	Kenya 	Kenija	\N
00040000-5526-35be-434c-eeb64d65496d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5526-35be-76be-b031041486ea	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5526-35be-a7d0-9b45c734ef75	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5526-35be-84a3-3fa482e23049	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5526-35be-d241-ee416818d1c1	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5526-35be-b265-daabbfeb145e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5526-35be-4c49-eb4bbcaef449	LV	LVA	428	Latvia 	Latvija	\N
00040000-5526-35be-91af-f594f92caa7e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5526-35be-4b4b-bbee040bcb72	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5526-35be-51d1-ece504bd585c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5526-35be-f415-0d30a76f4974	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5526-35be-c745-400090be0cde	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5526-35be-5c1d-c7e599bf930f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5526-35be-6139-0c5af0edf3bf	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5526-35be-0c18-5565f8e22fe9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5526-35be-1468-9cf080230c99	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5526-35be-b186-f9045a47e7b6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5526-35be-0d65-ccfda7d96880	MW	MWI	454	Malawi 	Malavi	\N
00040000-5526-35be-41a7-7140a38a143f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5526-35be-f7f1-bc79c87923e8	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5526-35be-e317-ac6b02d5a231	ML	MLI	466	Mali 	Mali	\N
00040000-5526-35be-b705-492c4cc72132	MT	MLT	470	Malta 	Malta	\N
00040000-5526-35be-861b-bc08af5d9e31	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5526-35be-d212-82c8b06162af	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5526-35be-1048-c8a42d2e0e3c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5526-35be-2554-1607fb73a1b3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5526-35be-fc36-f79012b69150	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5526-35be-92fc-526ea66067f8	MX	MEX	484	Mexico 	Mehika	\N
00040000-5526-35be-668f-d69b8429ce18	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5526-35be-b984-fb271475d310	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5526-35be-7b27-379538cc5b84	MC	MCO	492	Monaco 	Monako	\N
00040000-5526-35be-b4e3-70dabdf2e0ce	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5526-35be-8b57-afc1ec9665d6	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5526-35be-756a-d9d985fd6cf2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5526-35be-27d3-2257325556e3	MA	MAR	504	Morocco 	Maroko	\N
00040000-5526-35be-81b1-1948487f3e07	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5526-35be-a5f4-c2110775f779	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5526-35be-0d18-b1c41072674b	NA	NAM	516	Namibia 	Namibija	\N
00040000-5526-35be-aa51-7ac44bf41ce4	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5526-35be-3cc2-96b835493135	NP	NPL	524	Nepal 	Nepal	\N
00040000-5526-35be-d760-a1c518e03161	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5526-35be-b3bf-b38229d30f08	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5526-35be-a1cb-04507a0e495d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5526-35be-7835-4bee247afd0d	NE	NER	562	Niger 	Niger 	\N
00040000-5526-35be-4cdd-9094da19c717	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5526-35be-f97c-d5561ecd3d54	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5526-35be-23d7-e517a1fbe261	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5526-35be-b85d-b5d9e1d8cb32	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5526-35be-dd9e-59015701ced4	NO	NOR	578	Norway 	Norveška	\N
00040000-5526-35be-2679-f870d92a63fa	OM	OMN	512	Oman 	Oman	\N
00040000-5526-35be-0868-aa1e06b3c7bd	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5526-35be-139e-623cb2b78cfe	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5526-35be-5c21-a4af2cebd75d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5526-35be-fe40-7b8579c3d373	PA	PAN	591	Panama 	Panama	\N
00040000-5526-35be-1308-65db83e257ed	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5526-35be-03e6-8e21f8224b4f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5526-35be-4c65-7fa589573b4c	PE	PER	604	Peru 	Peru	\N
00040000-5526-35be-fb17-279af7e10645	PH	PHL	608	Philippines 	Filipini	\N
00040000-5526-35be-2ec5-dea6313203c3	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5526-35be-34a8-14311462d113	PL	POL	616	Poland 	Poljska	\N
00040000-5526-35be-9bfd-7628b28c4c3b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5526-35be-f9d6-d26d67ab37a6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5526-35be-75ca-1228df807731	QA	QAT	634	Qatar 	Katar	\N
00040000-5526-35be-e3bb-6b680c640b0b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5526-35be-5cca-90365bbe4152	RO	ROU	642	Romania 	Romunija	\N
00040000-5526-35be-4fa6-869f4f961cac	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5526-35be-b0a0-5e680c2bad6a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5526-35be-4f88-5dfe117a5cc8	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5526-35be-4767-eb8daa77d775	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5526-35be-27bd-976005591212	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5526-35be-9dce-6fe5311a1133	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5526-35be-ff5d-0449b9b68b15	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5526-35be-a901-5b10101c9f3d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5526-35be-53d0-436f461636af	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5526-35be-be0c-26f68f352d15	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5526-35be-b26f-b38fb0bb4fa0	SM	SMR	674	San Marino 	San Marino	\N
00040000-5526-35be-c44b-5e0a4c787b8f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5526-35be-40b9-60079e820054	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5526-35be-99bd-8c22c61f878f	SN	SEN	686	Senegal 	Senegal	\N
00040000-5526-35be-1195-db9f8220f9e7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5526-35be-fe0f-cc0599c9b55e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5526-35be-14fb-1fb0cc16dd70	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5526-35be-0c34-446cd68a8906	SG	SGP	702	Singapore 	Singapur	\N
00040000-5526-35be-2f6b-ae66fde4e8ea	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5526-35be-5b17-edc8f90efd72	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5526-35be-5e23-4479bf32274b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5526-35be-3837-afbe7266ad83	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5526-35be-9aee-80454abf0be2	SO	SOM	706	Somalia 	Somalija	\N
00040000-5526-35be-ac4a-a49a83eec05b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5526-35be-70ef-a244270ef18c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5526-35be-70d0-bade2e27bebb	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5526-35be-9228-b21bced673ec	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5526-35be-1636-59ab1f950312	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5526-35be-2ba2-8e24c7e26154	SD	SDN	729	Sudan 	Sudan	\N
00040000-5526-35be-79d5-c44a52d32168	SR	SUR	740	Suriname 	Surinam	\N
00040000-5526-35be-760f-4bdfbfa7ef9c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5526-35be-5de8-5db610075779	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5526-35be-40e0-ea4205338ebb	SE	SWE	752	Sweden 	Švedska	\N
00040000-5526-35be-a46f-c454fa1d5f29	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5526-35be-5d58-c83374b51e8b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5526-35be-eb8a-087d61f198d7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5526-35be-e272-ef64eea574d6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5526-35be-d5f9-fab70d44146a	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5526-35be-b219-f5dd43eb59ed	TH	THA	764	Thailand 	Tajska	\N
00040000-5526-35be-fe4a-f68fe0ee2cd8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5526-35be-cc5a-b77a1bebcbb4	TG	TGO	768	Togo 	Togo	\N
00040000-5526-35be-f10f-48460bf454a0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5526-35be-a4ea-516425388ed4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5526-35be-34e5-334179e140ab	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5526-35be-5742-6f79d5c6b31a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5526-35be-f87f-ea6c49f9b2dd	TR	TUR	792	Turkey 	Turčija	\N
00040000-5526-35be-2959-26c51eb5ebae	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5526-35be-6b94-71411a770b1d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5526-35be-1cfd-f3d10ef4a01f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5526-35be-5045-40f3542a65e5	UG	UGA	800	Uganda 	Uganda	\N
00040000-5526-35be-148f-ea4b6e3c4ed0	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5526-35be-cb31-425006780e0d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5526-35be-0730-4acb1043af7e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5526-35be-9f30-a52c7b64f88a	US	USA	840	United States 	Združene države Amerike	\N
00040000-5526-35be-c203-cb36bbd56a56	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5526-35be-095b-16f87301dda7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5526-35be-e758-1819bbc52dc6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5526-35be-1e94-8b4c6367edff	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5526-35be-782d-48c28dd6f819	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5526-35be-6204-5e3423bdb8e5	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5526-35be-ccf5-99817d3071d6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5526-35be-dbc2-b0c285c9aa9f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5526-35be-11b6-1d4c9506da75	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5526-35be-1fb1-b89b625afbfd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5526-35be-8ceb-205c9a8cad98	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5526-35be-16df-598d75d68975	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5526-35be-a0b1-c8a18f1d4f7e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2857 (class 0 OID 2188075)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 2187872)
-- Dependencies: 190
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 2187879)
-- Dependencies: 191
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 2187750)
-- Dependencies: 181
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 2187931)
-- Dependencies: 197
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 2187937)
-- Dependencies: 198
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 2187727)
-- Dependencies: 179
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5526-35be-0df1-b892c1b3a424	kravaXXX	color	N;	t	f	f	\N	\N
00000000-5526-35be-c103-6658429a7b3d	privzetInspicient	entity	N;	f	f	f	\N	\N
00000000-5526-35be-06d0-51db7b9e55e4	dogodek-status	map	O:18:"Zend\\Config\\Config":4:{s:21:"	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2824 (class 0 OID 2187739)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 2187794)
-- Dependencies: 183
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 2187645)
-- Dependencies: 170
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5526-35be-2d6d-200000df8680	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-35be-fee7-702a8ae0e295	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-35be-9bb2-187ca1f85fd2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-35be-4aeb-cdfdf2e7bd4e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-35be-5e69-2de34f9ffbbb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-35be-a612-54bb56b6e7ee	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-35be-da88-961ea5f14b8c	Role-read	Aaa - Vloga - Beri	f
00020000-5526-35be-be4e-c35ed7a86c0a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-35be-e3d9-f1d2c36de777	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-35be-f2de-ab0dc6d8e577	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-35be-dc95-9b2cf11f4f9b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-35be-066d-3aad9b1aa28c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-35be-3c27-2fe6a8bc7881	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-35be-95ad-742bd740645b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-35be-7634-0513bb8aea31	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-35be-7aab-4d0d75625b9b	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-35be-b2e8-ab55b53859fc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-35be-9d5f-c7181f026e44	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-35be-8276-e64ca74b19ec	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-35be-bb9f-e55590f13f96	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-35be-9742-99798b4294fd	Role-read	Aaa - Vloga - Beri	f
00020000-5526-35be-c30e-c1a46f6647cf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-35be-0484-a17b1c5f8616	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-35be-35db-54cb7cd28f29	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-35be-8685-385bc13a7beb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-35be-1ad2-3a62f70696d2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-35be-37fe-c4afafa123f6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-35be-ca3a-ebf790acef04	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-35be-5aac-761e95821521	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-35be-36f1-40e9654f4f12	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-35be-47b6-6f43774a1dea	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-35be-12bc-b417863e1a71	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-35be-943b-d49018e2cc46	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-35be-aa91-0022adfa2a27	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-35be-8316-d2f8f94d2f60	Role-read	Aaa - Vloga - Beri	f
00020000-5526-35be-7fae-c694117d52f0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-35be-ede2-08b75d6a73f6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-35be-d7b2-81a37f0c2379	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-35be-0d67-10007d8f40f8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-35be-84f2-aaec26726f03	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-35be-c5c4-f933929aeceb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-35be-f65a-252013244b97	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-35be-69ae-c663e24ca4b4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-35be-3b02-0a7afb717dba	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-35be-e63a-b887e88ea9df	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-35be-971a-623e9aa784c3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-35be-dd3a-8d1263ea298b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-35be-8ebb-a43f7710d303	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-35be-7fcf-6e4487e467d1	Role-read	Aaa - Vloga - Beri	f
00020000-5526-35be-a5b5-daaf6d12dcf2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-35be-d1bb-7e3ac6ca8db9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-35be-7caf-181b5e20d18b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-35be-eb17-773c9ddd9ea8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-35be-69a3-aa189baeccb7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-35be-9f0b-2fd0e00b4b1d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-35be-b5c4-1509fefb4500	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-35be-e5a0-4031d96e28cd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-35be-b326-920133f45f16	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-35be-9d6e-9f4eb96569d3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-35be-eaea-dd9576ab7ba8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-35be-0c4e-9a908b207969	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-35be-8535-69cf2c5fbf2e	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-35be-24ab-d0164f94d5ce	Role-read	Aaa - Vloga - Beri	f
00020000-5526-35be-0b13-f430d7178efb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-35be-4c5e-ab99ee1255d0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-35be-63ba-1695832e7677	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-35be-7d56-ee78907b1221	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-35be-0759-c332084b2ac3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-35be-10be-5fd4ec11486f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-35be-3e14-1268cceb87d9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-35be-1eda-8ca1a070fcb3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-35be-a671-37422df8a37b	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-35be-0fbb-eb1153835973	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-35be-d4f1-267b4cde9db0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-35be-6ca1-9c875c9f6f39	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-35be-bef0-4fb0eabe445d	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-35be-c424-55e203eb4909	Role-read	Aaa - Vloga - Beri	f
00020000-5526-35be-54be-b0fd2221b191	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-35be-dd7e-87111e09d9e9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-35be-8604-ca47aca56069	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-35be-3be7-82bb57994e02	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-35be-a8cb-094d0795fda2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-35be-98b8-fb84d097365c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-35be-01f2-09ac3838fc1f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-35be-e933-ae0c8d753954	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-35be-a8f1-3fe2f51f9fd0	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-35be-bd8b-009691b86c2a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-35be-3581-b9eee5681b9f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-35be-7022-3440a133b2dd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-35be-b6a0-0f3c797eac4d	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-35be-1bcd-d5b521364494	Role-read	Aaa - Vloga - Beri	f
00020000-5526-35be-19da-f5e5ecf8dd8e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-35be-dc1f-278542f11b99	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-35be-eb9e-15ed00dae4be	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-35be-3383-7de9050b8636	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-35be-2e41-9436a715bb8d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-35be-f2a9-db9c570f4268	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-35be-3ddb-894c77596451	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-35be-a065-943a23bfba06	Drzava-read	Seznam držav	f
00020000-5526-35be-d7ab-9810ef5723ac	Drzava-write	Urejanje držav	f
00020000-5526-35be-d7b6-702180194dce	Popa-delete	Poslovni partner - Briši	f
00020000-5526-35be-cb7d-082a73f7dcc1	Popa-list	Poslovni partner - Beri	f
00020000-5526-35be-5a04-355d3c963b42	Popa-update	Poslovni partner - Posodobi	f
00020000-5526-35be-f041-4c0d4a2b9a97	Popa-create	Poslovni partner - Ustvari	f
00020000-5526-35be-2afe-676508570b13	Posta-delete	Pošta - Briši	f
00020000-5526-35be-90f0-d4a97d12da30	Posta-list	Pošta - Beri	f
00020000-5526-35be-bbf0-0e9b8802d4fe	Posta-update	Pošta - Posodobi	f
00020000-5526-35be-412b-716a919d167a	Posta-create	Pošta - Ustvari	f
00020000-5526-35be-1353-c6e0b2cc5fba	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5526-35be-467a-2078780cf4de	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5526-35be-aaae-dd960e4ea1d6	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5526-35be-d603-b796b944f5df	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2818 (class 0 OID 2187675)
-- Dependencies: 174
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5526-35bf-71f3-4c441f0bf866	00020000-5526-35be-a065-943a23bfba06
00000000-5526-35bf-71f3-4c441f0bf866	00020000-5526-35be-95ad-742bd740645b
00000000-5526-35bf-27a5-dca1a77a379f	00020000-5526-35be-d7ab-9810ef5723ac
00000000-5526-35bf-27a5-dca1a77a379f	00020000-5526-35be-a065-943a23bfba06
\.


--
-- TOC entry 2843 (class 0 OID 2187944)
-- Dependencies: 199
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 2187951)
-- Dependencies: 200
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 2188088)
-- Dependencies: 214
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 2187773)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 2187801)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5526-35be-74ae-825c94605253	8341	Adlešiči
00050000-5526-35be-0bd7-e75f7c50aacf	5270	Ajdovščina
00050000-5526-35be-1b21-2fe276a2a16d	6280	Ankaran/Ancarano
00050000-5526-35be-ebfd-5586912781dd	9253	Apače
00050000-5526-35be-f512-2227ff855545	8253	Artiče
00050000-5526-35be-6cf8-aebae28a8c67	4275	Begunje na Gorenjskem
00050000-5526-35be-860f-23110f736eff	1382	Begunje pri Cerknici
00050000-5526-35be-b245-ca344ed05634	9231	Beltinci
00050000-5526-35be-2242-a07998945ea7	2234	Benedikt
00050000-5526-35be-deff-cc878e82eb04	2345	Bistrica ob Dravi
00050000-5526-35be-ed70-109753199e50	3256	Bistrica ob Sotli
00050000-5526-35be-3f7e-0d1cb3a17058	8259	Bizeljsko
00050000-5526-35be-8188-a053833b751e	1223	Blagovica
00050000-5526-35be-e02a-45a471076d57	8283	Blanca
00050000-5526-35be-528d-4cdd42cf7441	4260	Bled
00050000-5526-35be-70d4-91540931153d	4273	Blejska Dobrava
00050000-5526-35be-d571-e080aabf7571	9265	Bodonci
00050000-5526-35be-0f65-9ae1cca0f898	9222	Bogojina
00050000-5526-35be-5c6a-95f83af9d865	4263	Bohinjska Bela
00050000-5526-35be-c616-c5ceb0b4e7ad	4264	Bohinjska Bistrica
00050000-5526-35be-1af9-3dd0c708293f	4265	Bohinjsko jezero
00050000-5526-35be-2730-390a0e454ad0	1353	Borovnica
00050000-5526-35be-212d-5f453e4cc947	8294	Boštanj
00050000-5526-35be-2f25-6e18776e6e42	5230	Bovec
00050000-5526-35be-7264-514465e15116	5295	Branik
00050000-5526-35be-2070-a78ff2f61c80	3314	Braslovče
00050000-5526-35be-642c-08d0ea0cd619	5223	Breginj
00050000-5526-35be-56cf-83cc2ba1f3f4	8280	Brestanica
00050000-5526-35be-e3af-ec257690672b	2354	Bresternica
00050000-5526-35be-f4fa-cb9edbfcbab7	4243	Brezje
00050000-5526-35be-c950-9ce633772c05	1351	Brezovica pri Ljubljani
00050000-5526-35be-0561-ebe971d15300	8250	Brežice
00050000-5526-35be-0b8c-09cc969354c1	4210	Brnik - Aerodrom
00050000-5526-35be-1839-fd32d3e9fada	8321	Brusnice
00050000-5526-35be-b421-fb591ec69807	3255	Buče
00050000-5526-35be-8d52-cae1c3baf0a5	8276	Bučka 
00050000-5526-35be-712f-e48cc53e84ed	9261	Cankova
00050000-5526-35be-3faa-5e773b576c5b	3000	Celje 
00050000-5526-35be-58d7-2d32dc929230	3001	Celje - poštni predali
00050000-5526-35be-f981-bcd89d776d42	4207	Cerklje na Gorenjskem
00050000-5526-35be-87df-e0cad85defe5	8263	Cerklje ob Krki
00050000-5526-35be-fa8b-0452703d9a85	1380	Cerknica
00050000-5526-35be-9f47-131775c4080a	5282	Cerkno
00050000-5526-35be-71ff-f07de883b76c	2236	Cerkvenjak
00050000-5526-35be-fd01-54e7e65c49d8	2215	Ceršak
00050000-5526-35be-acb6-5ed56def413a	2326	Cirkovce
00050000-5526-35be-1e6a-b1df880544b0	2282	Cirkulane
00050000-5526-35be-7ee7-e9b4581aa8e8	5273	Col
00050000-5526-35be-8eff-710af8ddd1f3	8251	Čatež ob Savi
00050000-5526-35be-590e-c83f87edeb50	1413	Čemšenik
00050000-5526-35be-ad42-ad08ebcb0e64	5253	Čepovan
00050000-5526-35be-1978-b136f90b465f	9232	Črenšovci
00050000-5526-35be-da0b-c77d8062641f	2393	Črna na Koroškem
00050000-5526-35be-3e79-d6e5b50f333e	6275	Črni Kal
00050000-5526-35be-e0ca-d8b5a98ce206	5274	Črni Vrh nad Idrijo
00050000-5526-35be-a4d8-7d35ec3fcb1e	5262	Črniče
00050000-5526-35be-07a4-05f7ab2d3753	8340	Črnomelj
00050000-5526-35be-d62e-ec2dc213c92e	6271	Dekani
00050000-5526-35be-1f59-30618a2d57cc	5210	Deskle
00050000-5526-35be-5922-cab7f120b683	2253	Destrnik
00050000-5526-35be-6588-124b4360c952	6215	Divača
00050000-5526-35be-0aba-ce88407f1d3d	1233	Dob
00050000-5526-35be-f1e4-6307c8a0574c	3224	Dobje pri Planini
00050000-5526-35be-c75b-64ddfab7f42f	8257	Dobova
00050000-5526-35be-a92a-b7d2a8557770	1423	Dobovec
00050000-5526-35be-f72f-ddd3c1bf51e0	5263	Dobravlje
00050000-5526-35be-60b4-27e03ef2c583	3204	Dobrna
00050000-5526-35be-3669-071e0ebfbf4e	8211	Dobrnič
00050000-5526-35be-50f4-2a35efa309ca	1356	Dobrova
00050000-5526-35be-5fda-734e2fececb3	9223	Dobrovnik/Dobronak 
00050000-5526-35be-ebf6-9b0500847f47	5212	Dobrovo v Brdih
00050000-5526-35be-1d08-28ee707f0e8b	1431	Dol pri Hrastniku
00050000-5526-35be-21f6-e81e6a5324fb	1262	Dol pri Ljubljani
00050000-5526-35be-4678-a78a795d9cbb	1273	Dole pri Litiji
00050000-5526-35be-0621-059615ccb46d	1331	Dolenja vas
00050000-5526-35be-b7f7-cc699207200c	8350	Dolenjske Toplice
00050000-5526-35be-3f89-e1693df99b69	1230	Domžale
00050000-5526-35be-97ed-a2735f8eb9c3	2252	Dornava
00050000-5526-35be-6b57-629160cf9c66	5294	Dornberk
00050000-5526-35be-00a2-105047b86121	1319	Draga
00050000-5526-35be-f79c-2a94b76c3a6d	8343	Dragatuš
00050000-5526-35be-cdd9-4ce951ed3365	3222	Dramlje
00050000-5526-35be-7cc2-ba715ed46732	2370	Dravograd
00050000-5526-35be-f945-6e5188b8fb27	4203	Duplje
00050000-5526-35be-f657-af678e232b94	6221	Dutovlje
00050000-5526-35be-f7d2-d7506b37b963	8361	Dvor
00050000-5526-35be-4173-5b241c251891	2343	Fala
00050000-5526-35be-0d6c-5bf966b2c477	9208	Fokovci
00050000-5526-35be-2c67-d9e5414ca472	2313	Fram
00050000-5526-35be-3cc2-ab5f0a4698da	3213	Frankolovo
00050000-5526-35be-a411-04c3773e319e	1274	Gabrovka
00050000-5526-35be-9b85-d0ab731ddc0c	8254	Globoko
00050000-5526-35be-11d3-8a32da473e47	5275	Godovič
00050000-5526-35be-ba3e-9dc700678701	4204	Golnik
00050000-5526-35be-a909-8251af9cb234	3303	Gomilsko
00050000-5526-35be-d5b0-13e933f2478c	4224	Gorenja vas
00050000-5526-35be-22a6-30f409d99ec5	3263	Gorica pri Slivnici
00050000-5526-35be-c677-140f316bf739	2272	Gorišnica
00050000-5526-35be-b049-fc28d34bbb77	9250	Gornja Radgona
00050000-5526-35be-7816-039153a8232d	3342	Gornji Grad
00050000-5526-35be-baa9-f3c39ed01878	4282	Gozd Martuljek
00050000-5526-35be-aa42-14e36ed3711d	6272	Gračišče
00050000-5526-35be-4966-3945202234e4	9264	Grad
00050000-5526-35be-6706-5f93c07b731c	8332	Gradac
00050000-5526-35be-bc87-8f73f917ddc8	1384	Grahovo
00050000-5526-35be-4b97-14400acbd6a5	5242	Grahovo ob Bači
00050000-5526-35be-8eb5-44c906fc037a	5251	Grgar
00050000-5526-35be-bbd1-d1e78f3192d2	3302	Griže
00050000-5526-35be-b77e-3ae68f5e818e	3231	Grobelno
00050000-5526-35be-4c08-5ccdd7e2dde4	1290	Grosuplje
00050000-5526-35be-9976-dbf959f774d0	2288	Hajdina
00050000-5526-35be-1f7d-ee55af7a36cf	8362	Hinje
00050000-5526-35be-42fc-50471557a4ec	2311	Hoče
00050000-5526-35be-b2be-87d28023dce6	9205	Hodoš/Hodos
00050000-5526-35be-157a-dba0f3392508	1354	Horjul
00050000-5526-35be-b305-2a707920c828	1372	Hotedršica
00050000-5526-35be-16ce-1db8d26b9a85	1430	Hrastnik
00050000-5526-35be-b10d-63df8a2bec9a	6225	Hruševje
00050000-5526-35be-9118-375d5cc5c4b1	4276	Hrušica
00050000-5526-35be-93f9-5639192b5120	5280	Idrija
00050000-5526-35be-4b6c-63c6bb0c8d3f	1292	Ig
00050000-5526-35be-4e5a-4646214c68a5	6250	Ilirska Bistrica
00050000-5526-35be-fff4-92a843d6c960	6251	Ilirska Bistrica-Trnovo
00050000-5526-35be-6cab-e086d9a04a0b	1295	Ivančna Gorica
00050000-5526-35be-5656-c42240cfb2b0	2259	Ivanjkovci
00050000-5526-35be-e368-42bdec78785c	1411	Izlake
00050000-5526-35be-0157-b1334c1f65af	6310	Izola/Isola
00050000-5526-35be-4ef0-b0a6487955ad	2222	Jakobski Dol
00050000-5526-35be-d846-78bab584ee27	2221	Jarenina
00050000-5526-35be-22a4-9ec1266bc568	6254	Jelšane
00050000-5526-35be-26c5-6465cf7989e6	4270	Jesenice
00050000-5526-35be-3d7a-60fca1d97af7	8261	Jesenice na Dolenjskem
00050000-5526-35be-3454-bac157176311	3273	Jurklošter
00050000-5526-35be-f610-f49383f3dad5	2223	Jurovski Dol
00050000-5526-35be-4685-bb35f2e00beb	2256	Juršinci
00050000-5526-35be-95bb-3331f18ef177	5214	Kal nad Kanalom
00050000-5526-35be-1a92-b229e79d70cf	3233	Kalobje
00050000-5526-35be-4f0f-9db3ea2aedf2	4246	Kamna Gorica
00050000-5526-35be-4102-7ef7af011a5a	2351	Kamnica
00050000-5526-35be-a6d9-be57b0644731	1241	Kamnik
00050000-5526-35be-7e13-44d73f6a71f4	5213	Kanal
00050000-5526-35be-ae78-0d7e855e0a7a	8258	Kapele
00050000-5526-35be-9709-b946a0540294	2362	Kapla
00050000-5526-35be-3a0a-1f8c6b04a1d9	2325	Kidričevo
00050000-5526-35be-f234-6f6a2f5da7f2	1412	Kisovec
00050000-5526-35be-c649-bc369c3d1c89	6253	Knežak
00050000-5526-35be-9302-254867a18a5a	5222	Kobarid
00050000-5526-35be-5cdf-e1f34a35602f	9227	Kobilje
00050000-5526-35be-a9c2-5ec9cc709570	1330	Kočevje
00050000-5526-35be-916e-f287c3dad5e9	1338	Kočevska Reka
00050000-5526-35be-5179-e802ad9a06d3	2276	Kog
00050000-5526-35be-c5ac-c79fe438c4c7	5211	Kojsko
00050000-5526-35be-7c1d-237e89c155cf	6223	Komen
00050000-5526-35be-ea03-d5d7d00d7839	1218	Komenda
00050000-5526-35be-4798-a7ad85b877d4	6000	Koper/Capodistria 
00050000-5526-35be-77f8-379e60d4bbd7	6001	Koper/Capodistria - poštni predali
00050000-5526-35be-ed19-6bed7d1e6284	8282	Koprivnica
00050000-5526-35be-3948-4e8e0a85cad5	5296	Kostanjevica na Krasu
00050000-5526-35be-0582-03bae344e0ed	8311	Kostanjevica na Krki
00050000-5526-35be-7d41-0f6946da8183	1336	Kostel
00050000-5526-35be-6d70-35f8349b29e4	6256	Košana
00050000-5526-35be-535b-c2dd78148619	2394	Kotlje
00050000-5526-35be-edd9-104b63f79461	6240	Kozina
00050000-5526-35be-02ea-0cef72328f4d	3260	Kozje
00050000-5526-35be-f098-a0b982cb8f4c	4000	Kranj 
00050000-5526-35be-a17e-6984b9ae1a29	4001	Kranj - poštni predali
00050000-5526-35be-d86a-c77b3fac0e6d	4280	Kranjska Gora
00050000-5526-35be-36ee-f806062f2dba	1281	Kresnice
00050000-5526-35be-bc66-22e88c3d9dc4	4294	Križe
00050000-5526-35be-0f16-0b5bda3d9d49	9206	Križevci
00050000-5526-35be-fbed-d1193120a90b	9242	Križevci pri Ljutomeru
00050000-5526-35be-7667-9267f03879b7	1301	Krka
00050000-5526-35be-0c63-5aea0b83b534	8296	Krmelj
00050000-5526-35be-5c40-2c6f8baa1d3d	4245	Kropa
00050000-5526-35be-465d-cb26275bf25c	8262	Krška vas
00050000-5526-35be-ce56-8c025f1cb403	8270	Krško
00050000-5526-35be-37e9-9a1fa4139d17	9263	Kuzma
00050000-5526-35be-1bbb-f15bd961209f	2318	Laporje
00050000-5526-35be-4d97-6c1ec2ead432	3270	Laško
00050000-5526-35be-092f-add202859822	1219	Laze v Tuhinju
00050000-5526-35be-4d14-e305e034c41a	2230	Lenart v Slovenskih goricah
00050000-5526-35be-ec5f-e4ed39443dcc	9220	Lendava/Lendva
00050000-5526-35be-8c66-cc759b5166f6	4248	Lesce
00050000-5526-35be-36cf-68b8a61bc8a3	3261	Lesično
00050000-5526-35be-a576-323cf550ac7e	8273	Leskovec pri Krškem
00050000-5526-35be-42e3-4322835a07f7	2372	Libeliče
00050000-5526-35be-f4f1-e78d7d283735	2341	Limbuš
00050000-5526-35be-c68d-5abc6af106af	1270	Litija
00050000-5526-35be-d6ef-b0815f56d981	3202	Ljubečna
00050000-5526-35be-8aa1-506e08e43f5d	1000	Ljubljana 
00050000-5526-35be-05a4-5c69afdba63e	1001	Ljubljana - poštni predali
00050000-5526-35be-ecce-3b440b099017	1231	Ljubljana - Črnuče
00050000-5526-35be-7f06-65af46ccf9c8	1261	Ljubljana - Dobrunje
00050000-5526-35be-51a5-7d40c0bc8c12	1260	Ljubljana - Polje
00050000-5526-35be-be77-6b0e9a64083a	1210	Ljubljana - Šentvid
00050000-5526-35be-55c7-6a0c0cc297ef	1211	Ljubljana - Šmartno
00050000-5526-35be-8d09-0c755293cacd	3333	Ljubno ob Savinji
00050000-5526-35be-67dc-afa98666f44a	9240	Ljutomer
00050000-5526-35be-f6b4-067b8f13b9be	3215	Loče
00050000-5526-35be-21e1-ad999974f5b3	5231	Log pod Mangartom
00050000-5526-35be-473d-ce41d39fa2da	1358	Log pri Brezovici
00050000-5526-35be-05e7-696c6476c01e	1370	Logatec
00050000-5526-35be-71f2-b3a96a436933	1371	Logatec
00050000-5526-35be-0cd7-f7aa960b9a30	1434	Loka pri Zidanem Mostu
00050000-5526-35be-dcdd-c2cb2bd4cfee	3223	Loka pri Žusmu
00050000-5526-35be-6b88-daea13147974	6219	Lokev
00050000-5526-35be-99df-8fdcf3144942	1318	Loški Potok
00050000-5526-35be-0b3f-4abc1bb2ed5b	2324	Lovrenc na Dravskem polju
00050000-5526-35be-6060-231174407c24	2344	Lovrenc na Pohorju
00050000-5526-35be-9fb4-3d5708cc74e3	3334	Luče
00050000-5526-35be-fce1-16c4e27fb6b4	1225	Lukovica
00050000-5526-35be-04b1-bed94d450611	9202	Mačkovci
00050000-5526-35be-570c-841b7e8fd52d	2322	Majšperk
00050000-5526-35be-2e62-7894da286936	2321	Makole
00050000-5526-35be-a785-157006eff042	9243	Mala Nedelja
00050000-5526-35be-f0c5-308c1038020b	2229	Malečnik
00050000-5526-35be-c3a0-c37b9f0f84f7	6273	Marezige
00050000-5526-35be-375d-6ea834c7b85b	2000	Maribor 
00050000-5526-35be-34b4-366491fb9985	2001	Maribor - poštni predali
00050000-5526-35be-6670-bd56cdda9da3	2206	Marjeta na Dravskem polju
00050000-5526-35be-a27e-3df28e064885	2281	Markovci
00050000-5526-35be-88a3-bc032b71d904	9221	Martjanci
00050000-5526-35be-145b-8f50d662dcac	6242	Materija
00050000-5526-35be-b6b2-c26eb954ed5d	4211	Mavčiče
00050000-5526-35be-d3e9-f7d9fe884dd9	1215	Medvode
00050000-5526-35be-9811-b31fca7b8faf	1234	Mengeš
00050000-5526-35be-783e-70913d310049	8330	Metlika
00050000-5526-35be-2983-eb80f0de6554	2392	Mežica
00050000-5526-35be-831a-4934a11eee67	2204	Miklavž na Dravskem polju
00050000-5526-35be-cb81-6665a4c40e22	2275	Miklavž pri Ormožu
00050000-5526-35be-02e3-4946ed173910	5291	Miren
00050000-5526-35be-0004-e0231c2fcab4	8233	Mirna
00050000-5526-35be-3d95-a9622ad17937	8216	Mirna Peč
00050000-5526-35be-3b32-e1899c64a0f2	2382	Mislinja
00050000-5526-35be-6cc3-462894c9bc3b	4281	Mojstrana
00050000-5526-35be-525b-723f05e0b456	8230	Mokronog
00050000-5526-35be-2135-59ba8621e923	1251	Moravče
00050000-5526-35be-9c73-0962ec9ee068	9226	Moravske Toplice
00050000-5526-35be-a1dd-996cb8c6e6f4	5216	Most na Soči
00050000-5526-35be-beb8-20c074b7c568	1221	Motnik
00050000-5526-35be-7e24-70c8f8e3aa7e	3330	Mozirje
00050000-5526-35be-8cae-91deacd458fc	9000	Murska Sobota 
00050000-5526-35be-a04c-b34de90df5a1	9001	Murska Sobota - poštni predali
00050000-5526-35be-7a57-995161cb65e5	2366	Muta
00050000-5526-35be-c704-48031f170bc7	4202	Naklo
00050000-5526-35be-2fa1-238172264e20	3331	Nazarje
00050000-5526-35be-692f-a8d3b399a37f	1357	Notranje Gorice
00050000-5526-35be-ef66-1a77fedf8452	3203	Nova Cerkev
00050000-5526-35be-1a44-1012d1e12077	5000	Nova Gorica 
00050000-5526-35be-1bb8-f3f2f815fc6c	5001	Nova Gorica - poštni predali
00050000-5526-35be-9df0-1ff5012163a3	1385	Nova vas
00050000-5526-35be-da1d-c5a22a05f99a	8000	Novo mesto
00050000-5526-35be-947d-c85e249cd0e6	8001	Novo mesto - poštni predali
00050000-5526-35be-43ce-e0232e833992	6243	Obrov
00050000-5526-35be-af4c-1d9fcde76657	9233	Odranci
00050000-5526-35be-4725-512acd1aa277	2317	Oplotnica
00050000-5526-35be-da6e-8851d35c3469	2312	Orehova vas
00050000-5526-35be-05d1-ebaab739bc23	2270	Ormož
00050000-5526-35be-25ce-a710f9bf1b97	1316	Ortnek
00050000-5526-35be-97a9-162c29481488	1337	Osilnica
00050000-5526-35be-9027-055431088371	8222	Otočec
00050000-5526-35be-2667-41c76e010e6c	2361	Ožbalt
00050000-5526-35be-e36a-429c7f2fff49	2231	Pernica
00050000-5526-35be-af30-81ba4ba5864f	2211	Pesnica pri Mariboru
00050000-5526-35be-3f20-97608764b452	9203	Petrovci
00050000-5526-35be-f625-455ea35995c0	3301	Petrovče
00050000-5526-35be-7856-4c6dada3196d	6330	Piran/Pirano
00050000-5526-35be-59ff-0142385dd7f3	8255	Pišece
00050000-5526-35be-14f5-0097ecfd3360	6257	Pivka
00050000-5526-35be-43e5-f23d0316b527	6232	Planina
00050000-5526-35be-80fb-45fb882b06aa	3225	Planina pri Sevnici
00050000-5526-35be-4478-f435f00a6219	6276	Pobegi
00050000-5526-35be-de33-4e9d4ad3e7d6	8312	Podbočje
00050000-5526-35be-78e3-0b2dffa80fc2	5243	Podbrdo
00050000-5526-35be-e80f-92a2642bc492	3254	Podčetrtek
00050000-5526-35be-cf04-a381bddfa9fb	2273	Podgorci
00050000-5526-35be-7f0f-e8f3450dd0ec	6216	Podgorje
00050000-5526-35be-01ba-60d2e22ade69	2381	Podgorje pri Slovenj Gradcu
00050000-5526-35be-941a-ce0368a57b49	6244	Podgrad
00050000-5526-35be-891d-2e6ce500b845	1414	Podkum
00050000-5526-35be-ba15-3019a1f03832	2286	Podlehnik
00050000-5526-35be-f439-8e8dc1bc2435	5272	Podnanos
00050000-5526-35be-4836-98ee3ae67ce8	4244	Podnart
00050000-5526-35be-77e0-83174486af99	3241	Podplat
00050000-5526-35be-17ff-bad98e9280bb	3257	Podsreda
00050000-5526-35be-07d8-6b7321a0359e	2363	Podvelka
00050000-5526-35be-3de1-7430c1251533	2208	Pohorje
00050000-5526-35be-9144-518623ce54a1	2257	Polenšak
00050000-5526-35be-548f-a316fdbf8487	1355	Polhov Gradec
00050000-5526-35be-ba53-f554c27d821c	4223	Poljane nad Škofjo Loko
00050000-5526-35be-9197-f655d57c487f	2319	Poljčane
00050000-5526-35be-0fef-6f7a9aac7cc8	1272	Polšnik
00050000-5526-35be-f0a1-9ac2e572a151	3313	Polzela
00050000-5526-35be-ca59-644851e8816c	3232	Ponikva
00050000-5526-35be-fc2c-b8792c73217b	6320	Portorož/Portorose
00050000-5526-35be-b70d-2f47e79f4c5f	6230	Postojna
00050000-5526-35be-f48e-c716a74496cd	2331	Pragersko
00050000-5526-35be-37f5-dad4d8846e37	3312	Prebold
00050000-5526-35be-7b76-74b5ebbdfa7a	4205	Preddvor
00050000-5526-35be-295f-20a284f0ec5e	6255	Prem
00050000-5526-35be-35e0-1c6c092d620a	1352	Preserje
00050000-5526-35be-188c-94352f381022	6258	Prestranek
00050000-5526-35be-c4b7-1d9813cccb7f	2391	Prevalje
00050000-5526-35be-b4dd-3a271f2c3b2c	3262	Prevorje
00050000-5526-35be-0137-4fb59921e49a	1276	Primskovo 
00050000-5526-35be-90c8-57a316bace80	3253	Pristava pri Mestinju
00050000-5526-35be-f97c-6c335ffb2c4a	9207	Prosenjakovci/Partosfalva
00050000-5526-35be-911a-b10d28fbc932	5297	Prvačina
00050000-5526-35be-1445-c410eb33dcd7	2250	Ptuj
00050000-5526-35be-1ce8-55185c2afcd9	2323	Ptujska Gora
00050000-5526-35be-82c1-1848b006d11b	9201	Puconci
00050000-5526-35be-71ea-946714e63d4d	2327	Rače
00050000-5526-35be-1b75-676880ecb19e	1433	Radeče
00050000-5526-35be-3759-07e456379dff	9252	Radenci
00050000-5526-35be-ba70-07ed90f7653a	2360	Radlje ob Dravi
00050000-5526-35be-eaea-807e85685de9	1235	Radomlje
00050000-5526-35be-dbd6-6bb1c09c1117	4240	Radovljica
00050000-5526-35be-9da6-28bbd9ffb84f	8274	Raka
00050000-5526-35be-d83b-2ff936a2288a	1381	Rakek
00050000-5526-35be-fac5-2c7980fae591	4283	Rateče - Planica
00050000-5526-35be-8515-6e2473a97f92	2390	Ravne na Koroškem
00050000-5526-35be-7ab0-cb0fd5517a4a	9246	Razkrižje
00050000-5526-35be-edd2-8b86d3b8fc75	3332	Rečica ob Savinji
00050000-5526-35be-caff-2a203ae86437	5292	Renče
00050000-5526-35be-539d-d46d3380274d	1310	Ribnica
00050000-5526-35be-800f-89b729d04b46	2364	Ribnica na Pohorju
00050000-5526-35be-d3be-c7945689f122	3272	Rimske Toplice
00050000-5526-35be-9de3-4d570ed2bf15	1314	Rob
00050000-5526-35be-d556-d5dca91a0201	5215	Ročinj
00050000-5526-35be-ac8b-b4d951abe3bb	3250	Rogaška Slatina
00050000-5526-35be-e7c3-b0be2f437293	9262	Rogašovci
00050000-5526-35be-05b9-8deb8d8b253c	3252	Rogatec
00050000-5526-35be-ca8d-8894576f71fd	1373	Rovte
00050000-5526-35be-d5ac-282218f34266	2342	Ruše
00050000-5526-35be-1814-273754681ff5	1282	Sava
00050000-5526-35be-f234-6163a2805b19	6333	Sečovlje/Sicciole
00050000-5526-35be-8a6e-7dad99b841de	4227	Selca
00050000-5526-35be-2bec-03e19ec8f332	2352	Selnica ob Dravi
00050000-5526-35be-c4c1-44aa92428be9	8333	Semič
00050000-5526-35be-d755-1c755b02918c	8281	Senovo
00050000-5526-35be-71db-c5731d330c28	6224	Senožeče
00050000-5526-35be-e035-28bd4195d0a6	8290	Sevnica
00050000-5526-35be-90ec-297984fde13e	6210	Sežana
00050000-5526-35be-fb65-0da2006906d5	2214	Sladki Vrh
00050000-5526-35be-ae9c-84ce464373f2	5283	Slap ob Idrijci
00050000-5526-35be-6984-94d997f98fd4	2380	Slovenj Gradec
00050000-5526-35be-236a-4623b289effe	2310	Slovenska Bistrica
00050000-5526-35be-0826-d85704034fe2	3210	Slovenske Konjice
00050000-5526-35be-1c70-64434688c697	1216	Smlednik
00050000-5526-35be-be41-4e3e18cb6fcd	5232	Soča
00050000-5526-35be-0838-d493801c1368	1317	Sodražica
00050000-5526-35be-d2a2-67192c20fbd9	3335	Solčava
00050000-5526-35be-7339-ed9eac2de7a4	5250	Solkan
00050000-5526-35be-29f1-0b5329cdee9b	4229	Sorica
00050000-5526-35be-26e8-adb2fcba830f	4225	Sovodenj
00050000-5526-35be-8b2d-22b3055eb0a0	5281	Spodnja Idrija
00050000-5526-35be-16cb-1bd148620f96	2241	Spodnji Duplek
00050000-5526-35be-117c-b1888a571adf	9245	Spodnji Ivanjci
00050000-5526-35be-7899-9ee146620aa4	2277	Središče ob Dravi
00050000-5526-35be-c540-17c7d675a092	4267	Srednja vas v Bohinju
00050000-5526-35be-4dbf-f7da73bbfb9f	8256	Sromlje 
00050000-5526-35be-c899-1124ddba86e6	5224	Srpenica
00050000-5526-35be-8b0c-761fc4aafc51	1242	Stahovica
00050000-5526-35be-b0f1-beab618af8d9	1332	Stara Cerkev
00050000-5526-35be-79fb-a6deba6292ab	8342	Stari trg ob Kolpi
00050000-5526-35be-67ca-b41da16f07c4	1386	Stari trg pri Ložu
00050000-5526-35be-1d3d-515098453258	2205	Starše
00050000-5526-35be-ecf0-e60fe05dd0e3	2289	Stoperce
00050000-5526-35be-5762-b326522bf278	8322	Stopiče
00050000-5526-35be-f585-f2bd79037293	3206	Stranice
00050000-5526-35be-4f24-be30e311107a	8351	Straža
00050000-5526-35be-395d-0ed719aa64fe	1313	Struge
00050000-5526-35be-4b90-cc73d16a656c	8293	Studenec
00050000-5526-35be-2e8b-30aeae464ffc	8331	Suhor
00050000-5526-35be-b706-49828d14e590	2233	Sv. Ana v Slovenskih goricah
00050000-5526-35be-a66a-562328e1218c	2235	Sv. Trojica v Slovenskih goricah
00050000-5526-35be-6106-5c7a7490007c	2353	Sveti Duh na Ostrem Vrhu
00050000-5526-35be-3a69-236a9f1321f9	9244	Sveti Jurij ob Ščavnici
00050000-5526-35be-bbe9-bf671518a572	3264	Sveti Štefan
00050000-5526-35be-bdec-81f3d48f752e	2258	Sveti Tomaž
00050000-5526-35be-c3e0-9c81464b0458	9204	Šalovci
00050000-5526-35be-6a0c-010574e96d8b	5261	Šempas
00050000-5526-35be-2df6-829c7c1061a1	5290	Šempeter pri Gorici
00050000-5526-35be-5e9b-c6e11443d78c	3311	Šempeter v Savinjski dolini
00050000-5526-35be-9b11-727f89e27e94	4208	Šenčur
00050000-5526-35be-7c6f-5e826b9e224f	2212	Šentilj v Slovenskih goricah
00050000-5526-35be-0bbb-4f588e5be3b3	8297	Šentjanž
00050000-5526-35be-1988-022cb85bd29b	2373	Šentjanž pri Dravogradu
00050000-5526-35be-af45-45f2decd6058	8310	Šentjernej
00050000-5526-35be-5f90-83f6e52efa46	3230	Šentjur
00050000-5526-35be-b670-f4cc543b33b4	3271	Šentrupert
00050000-5526-35be-1d11-2cb3dabdebfb	8232	Šentrupert
00050000-5526-35be-c1a0-3229b20ddd69	1296	Šentvid pri Stični
00050000-5526-35be-514c-5914f8c6b22e	8275	Škocjan
00050000-5526-35be-b4d3-55df4edba06e	6281	Škofije
00050000-5526-35be-707e-aa36fcc14001	4220	Škofja Loka
00050000-5526-35be-7f84-9a3b8c28d251	3211	Škofja vas
00050000-5526-35be-696a-83ffb47d5305	1291	Škofljica
00050000-5526-35be-e2c3-7a8f179d3e13	6274	Šmarje
00050000-5526-35be-cace-7b0e40ee0ec1	1293	Šmarje - Sap
00050000-5526-35be-1e70-8ebcf07556fb	3240	Šmarje pri Jelšah
00050000-5526-35be-92ac-4665e96ff07f	8220	Šmarješke Toplice
00050000-5526-35be-a8af-16f698f8ff8d	2315	Šmartno na Pohorju
00050000-5526-35be-0c91-3eecbc698ae0	3341	Šmartno ob Dreti
00050000-5526-35be-bda4-b25138b74dd2	3327	Šmartno ob Paki
00050000-5526-35be-93b4-e47651b308c2	1275	Šmartno pri Litiji
00050000-5526-35be-974c-5d96fc920975	2383	Šmartno pri Slovenj Gradcu
00050000-5526-35be-5c08-4643a3ef7cac	3201	Šmartno v Rožni dolini
00050000-5526-35be-c6a4-149c7d57df26	3325	Šoštanj
00050000-5526-35be-c6c4-23bd5aa772ee	6222	Štanjel
00050000-5526-35be-9adf-51df370ddd91	3220	Štore
00050000-5526-35be-6d82-1a627179f9ba	3304	Tabor
00050000-5526-35be-8dd0-92857ee45123	3221	Teharje
00050000-5526-35be-d4a6-cb438a3c7e94	9251	Tišina
00050000-5526-35be-1c37-955b14850d66	5220	Tolmin
00050000-5526-35be-2746-3b8a766cdf9e	3326	Topolšica
00050000-5526-35be-bac7-499b45322c8b	2371	Trbonje
00050000-5526-35be-ea45-a37bbb031b3b	1420	Trbovlje
00050000-5526-35be-3905-1d8e813b887d	8231	Trebelno 
00050000-5526-35be-4a6b-8d6301315faf	8210	Trebnje
00050000-5526-35be-732d-84d4413bb6ae	5252	Trnovo pri Gorici
00050000-5526-35be-f602-9bba2380fb2a	2254	Trnovska vas
00050000-5526-35be-8181-c1df4fa16edf	1222	Trojane
00050000-5526-35be-4b15-8c884f5873f8	1236	Trzin
00050000-5526-35be-4368-b81add69b899	4290	Tržič
00050000-5526-35be-e446-f694e26380c0	8295	Tržišče
00050000-5526-35be-2bee-a2ab70c34b64	1311	Turjak
00050000-5526-35be-50e9-22c72f514e75	9224	Turnišče
00050000-5526-35be-e0bc-9dad4cb4b932	8323	Uršna sela
00050000-5526-35be-a44b-d895756e1014	1252	Vače
00050000-5526-35be-cc4f-123d5dc9ca1d	3320	Velenje 
00050000-5526-35be-4225-e615058aebee	3322	Velenje - poštni predali
00050000-5526-35be-9394-abea9258097f	8212	Velika Loka
00050000-5526-35be-c080-964af8d42b6d	2274	Velika Nedelja
00050000-5526-35be-bf5e-678c40bc6644	9225	Velika Polana
00050000-5526-35be-a6b0-da61f9b0a0da	1315	Velike Lašče
00050000-5526-35be-f350-0592896a819b	8213	Veliki Gaber
00050000-5526-35be-d93d-8043965aa2f2	9241	Veržej
00050000-5526-35be-6ad0-f3d604810945	1312	Videm - Dobrepolje
00050000-5526-35be-4d76-1ee865197765	2284	Videm pri Ptuju
00050000-5526-35be-5e24-6d85dd1c5dd8	8344	Vinica
00050000-5526-35be-27b2-0624db34e954	5271	Vipava
00050000-5526-35be-5c59-e93a344791ce	4212	Visoko
00050000-5526-35be-6018-8483ad80fb92	1294	Višnja Gora
00050000-5526-35be-08ef-18b41c34148c	3205	Vitanje
00050000-5526-35be-509f-c5365e8b9d48	2255	Vitomarci
00050000-5526-35be-771c-3d07aedbf995	1217	Vodice
00050000-5526-35be-edc5-8b42a4cf9f9d	3212	Vojnik\t
00050000-5526-35be-2a05-81de817f887b	5293	Volčja Draga
00050000-5526-35be-e355-c2ba2f43fdb2	2232	Voličina
00050000-5526-35be-f984-52994872a2b9	3305	Vransko
00050000-5526-35be-1a1e-b2b632bfe60d	6217	Vremski Britof
00050000-5526-35be-ace7-9e1dcf375363	1360	Vrhnika
00050000-5526-35be-6631-8c335f492587	2365	Vuhred
00050000-5526-35be-837f-ac6d9424d245	2367	Vuzenica
00050000-5526-35be-fabd-b316069b4f63	8292	Zabukovje 
00050000-5526-35be-5360-80e3f4d8d978	1410	Zagorje ob Savi
00050000-5526-35be-9440-e132aab361b6	1303	Zagradec
00050000-5526-35be-9a07-a1f5fd8131aa	2283	Zavrč
00050000-5526-35be-16f4-1e2127118a14	8272	Zdole 
00050000-5526-35be-af96-90e0d0d520fe	4201	Zgornja Besnica
00050000-5526-35be-17c0-707d07a8517e	2242	Zgornja Korena
00050000-5526-35be-29e9-1ce3aa2edb1d	2201	Zgornja Kungota
00050000-5526-35be-ad5e-ea6d2d65be9a	2316	Zgornja Ložnica
00050000-5526-35be-b337-79d64aa8337d	2314	Zgornja Polskava
00050000-5526-35be-961f-794b9a83cfe8	2213	Zgornja Velka
00050000-5526-35be-76b5-c57610da3058	4247	Zgornje Gorje
00050000-5526-35be-034d-a4367a854597	4206	Zgornje Jezersko
00050000-5526-35be-8c62-396a9e556a85	2285	Zgornji Leskovec
00050000-5526-35be-7352-552bf4aa00a8	1432	Zidani Most
00050000-5526-35be-6bbc-b79ff322a3e2	3214	Zreče
00050000-5526-35be-50a1-f7485b6b4896	4209	Žabnica
00050000-5526-35be-3036-e34ad00be2e0	3310	Žalec
00050000-5526-35be-420d-8da9cb45fde0	4228	Železniki
00050000-5526-35be-d546-a308912f7f5b	2287	Žetale
00050000-5526-35be-dc0a-80ee16ccecde	4226	Žiri
00050000-5526-35be-a7c1-3db02328c852	4274	Žirovnica
00050000-5526-35be-50b5-6d167991a73b	8360	Žužemberk
\.


--
-- TOC entry 2845 (class 0 OID 2187959)
-- Dependencies: 201
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 2187809)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 2187885)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 2187965)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 2188102)
-- Dependencies: 215
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 2188111)
-- Dependencies: 216
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 2187972)
-- Dependencies: 203
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 2187981)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 2187990)
-- Dependencies: 205
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 2188118)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 2188128)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 2187656)
-- Dependencies: 172
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5526-35bf-7ee9-de5b70145221	00010000-5526-35bf-6721-3db5f8dd822b	2015-04-09 08:18:10	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO/pgOKA1GZSExbImMw9c1iwdhA1DIm9S";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2850 (class 0 OID 2188000)
-- Dependencies: 206
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 2187665)
-- Dependencies: 173
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5526-35bf-b9c9-a88db7787193	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5526-35bf-18e5-bfc38a5164e0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5526-35bf-71f3-4c441f0bf866	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5526-35bf-caee-f59f97040376	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5526-35bf-060c-0f8351ed309b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5526-35bf-27a5-dca1a77a379f	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2820 (class 0 OID 2187694)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5526-35bf-7ee9-de5b70145221	00000000-5526-35bf-caee-f59f97040376
00010000-5526-35bf-a6b6-16f1229204e4	00000000-5526-35bf-71f3-4c441f0bf866
\.


--
-- TOC entry 2851 (class 0 OID 2188006)
-- Dependencies: 207
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 2188018)
-- Dependencies: 208
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 2187893)
-- Dependencies: 193
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 2187824)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 2187918)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 2188138)
-- Dependencies: 219
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 2187831)
-- Dependencies: 187
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 2187682)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-5526-35bf-6721-3db5f8dd822b	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxROjPuZlPrlbY8TZopotP0ZUiggBbL0Vxy	t	\N	\N	\N	rootmail@max.si
00010000-5526-35bf-a6b6-16f1229204e4	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxROZizCt7hobo.gHY.yEOw/BdUbtodDCdC	t	\N	\N	\N	noreply@max.si
00010000-5526-35bf-7ee9-de5b70145221	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2864 (class 0 OID 2188147)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 2187899)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 2188024)
-- Dependencies: 209
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 2188165)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 2187905)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 2188173)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 2188183)
-- Dependencies: 223
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2462 (class 2606 OID 2187709)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 2188036)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 2188056)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 2188074)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 2187857)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 2187871)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 2187722)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 2188084)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 2187877)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 2187883)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 2187770)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 2187935)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 2187943)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 2187737)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 2187747)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 2187798)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2453 (class 2606 OID 2187679)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2444 (class 2606 OID 2187653)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 2187949)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 2187958)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 2188098)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 2187791)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 2187807)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 2187963)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 2187821)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 2187889)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 2187969)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 2188108)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 2188116)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 2187979)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 2187985)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 2187995)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 2188127)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 2188135)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 2187664)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 2188004)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 2187698)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2448 (class 2606 OID 2187673)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 2188014)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 2188023)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 2187898)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 2187828)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 2187927)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 2188146)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 2187842)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 2187692)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 2188161)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 2187903)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 2188030)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 2188171)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 2187917)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 2188182)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 2188192)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 1259 OID 2187864)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2480 (class 1259 OID 2187793)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2544 (class 1259 OID 2187950)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2552 (class 1259 OID 2187971)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2553 (class 1259 OID 2187970)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 2187904)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2599 (class 1259 OID 2188087)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2600 (class 1259 OID 2188085)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2601 (class 1259 OID 2188086)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2602 (class 1259 OID 2188099)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 2188100)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 2188101)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2622 (class 1259 OID 2188164)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2623 (class 1259 OID 2188163)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2624 (class 1259 OID 2188162)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2499 (class 1259 OID 2187844)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2500 (class 1259 OID 2187843)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2484 (class 1259 OID 2187800)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 2187799)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2571 (class 1259 OID 2188005)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2521 (class 1259 OID 2187884)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2450 (class 1259 OID 2187680)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2451 (class 1259 OID 2187681)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2574 (class 1259 OID 2188017)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2575 (class 1259 OID 2188016)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2576 (class 1259 OID 2188015)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2522 (class 1259 OID 2187890)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2523 (class 1259 OID 2187892)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2524 (class 1259 OID 2187891)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2565 (class 1259 OID 2187999)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2566 (class 1259 OID 2187997)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2567 (class 1259 OID 2187996)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2568 (class 1259 OID 2187998)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2457 (class 1259 OID 2187699)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2458 (class 1259 OID 2187700)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2581 (class 1259 OID 2188031)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2549 (class 1259 OID 2187964)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2616 (class 1259 OID 2188136)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2617 (class 1259 OID 2188137)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 2187822)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2492 (class 1259 OID 2187823)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2607 (class 1259 OID 2188109)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2608 (class 1259 OID 2188110)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2586 (class 1259 OID 2188039)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2587 (class 1259 OID 2188038)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2588 (class 1259 OID 2188041)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2589 (class 1259 OID 2188037)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2590 (class 1259 OID 2188040)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2627 (class 1259 OID 2188172)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2559 (class 1259 OID 2187989)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2560 (class 1259 OID 2187988)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2561 (class 1259 OID 2187986)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2562 (class 1259 OID 2187987)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 2187771)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2593 (class 1259 OID 2188058)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2594 (class 1259 OID 2188057)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2518 (class 1259 OID 2187878)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2472 (class 1259 OID 2187749)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2473 (class 1259 OID 2187748)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2495 (class 1259 OID 2187829)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2496 (class 1259 OID 2187830)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2534 (class 1259 OID 2187930)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 2187929)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2536 (class 1259 OID 2187928)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2506 (class 1259 OID 2187866)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2507 (class 1259 OID 2187862)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2508 (class 1259 OID 2187859)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2509 (class 1259 OID 2187860)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2510 (class 1259 OID 2187858)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2511 (class 1259 OID 2187863)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2512 (class 1259 OID 2187861)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2483 (class 1259 OID 2187792)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 2187723)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 2187725)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2467 (class 1259 OID 2187724)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2468 (class 1259 OID 2187726)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2541 (class 1259 OID 2187936)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 2187738)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2454 (class 1259 OID 2187693)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2558 (class 1259 OID 2187980)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2479 (class 1259 OID 2187772)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2490 (class 1259 OID 2187808)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 2188117)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 2187674)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2513 (class 1259 OID 2187865)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2655 (class 2606 OID 2188298)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2652 (class 2606 OID 2188283)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2653 (class 2606 OID 2188288)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2657 (class 2606 OID 2188308)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2651 (class 2606 OID 2188278)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2656 (class 2606 OID 2188303)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2654 (class 2606 OID 2188293)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2642 (class 2606 OID 2188233)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2668 (class 2606 OID 2188363)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2671 (class 2606 OID 2188378)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2670 (class 2606 OID 2188373)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2663 (class 2606 OID 2188338)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2694 (class 2606 OID 2188493)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2692 (class 2606 OID 2188483)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 2188488)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2667 (class 2606 OID 2188358)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2695 (class 2606 OID 2188498)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2696 (class 2606 OID 2188503)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2697 (class 2606 OID 2188508)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2705 (class 2606 OID 2188548)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2704 (class 2606 OID 2188543)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2703 (class 2606 OID 2188538)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2650 (class 2606 OID 2188273)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2649 (class 2606 OID 2188268)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2644 (class 2606 OID 2188243)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2643 (class 2606 OID 2188238)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2680 (class 2606 OID 2188423)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2659 (class 2606 OID 2188318)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 2188193)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2635 (class 2606 OID 2188198)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2683 (class 2606 OID 2188438)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2682 (class 2606 OID 2188433)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2681 (class 2606 OID 2188428)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2660 (class 2606 OID 2188323)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 2188333)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2661 (class 2606 OID 2188328)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2679 (class 2606 OID 2188418)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2677 (class 2606 OID 2188408)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2676 (class 2606 OID 2188403)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2678 (class 2606 OID 2188413)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2636 (class 2606 OID 2188203)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2637 (class 2606 OID 2188208)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2684 (class 2606 OID 2188443)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2669 (class 2606 OID 2188368)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2701 (class 2606 OID 2188528)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2702 (class 2606 OID 2188533)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 2188248)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2646 (class 2606 OID 2188253)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2698 (class 2606 OID 2188513)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2699 (class 2606 OID 2188518)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2687 (class 2606 OID 2188458)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2686 (class 2606 OID 2188453)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2689 (class 2606 OID 2188468)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2685 (class 2606 OID 2188448)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2688 (class 2606 OID 2188463)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2706 (class 2606 OID 2188553)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2675 (class 2606 OID 2188398)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2674 (class 2606 OID 2188393)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2672 (class 2606 OID 2188383)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2673 (class 2606 OID 2188388)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2640 (class 2606 OID 2188223)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2641 (class 2606 OID 2188228)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2691 (class 2606 OID 2188478)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2690 (class 2606 OID 2188473)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2658 (class 2606 OID 2188313)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 2188523)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 2188218)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2638 (class 2606 OID 2188213)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2647 (class 2606 OID 2188258)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2648 (class 2606 OID 2188263)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2666 (class 2606 OID 2188353)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2665 (class 2606 OID 2188348)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2664 (class 2606 OID 2188343)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-09 10:24:29 CEST

--
-- PostgreSQL database dump complete
--

