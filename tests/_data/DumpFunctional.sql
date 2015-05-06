--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-05 16:12:32 CEST

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
-- TOC entry 179 (class 1259 OID 2319968)
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
-- TOC entry 225 (class 1259 OID 2320450)
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
-- TOC entry 224 (class 1259 OID 2320433)
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
-- TOC entry 217 (class 1259 OID 2320349)
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
-- TOC entry 193 (class 1259 OID 2320133)
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
-- TOC entry 196 (class 1259 OID 2320174)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 2320095)
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
-- TOC entry 212 (class 1259 OID 2320299)
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
-- TOC entry 191 (class 1259 OID 2320120)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 2320168)
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
-- TOC entry 201 (class 1259 OID 2320217)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 2320242)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 2320069)
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
-- TOC entry 180 (class 1259 OID 2319977)
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
-- TOC entry 181 (class 1259 OID 2319988)
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
-- TOC entry 184 (class 1259 OID 2320039)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 2319942)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 2319961)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 2320249)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 2320279)
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
-- TOC entry 221 (class 1259 OID 2320391)
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
-- TOC entry 183 (class 1259 OID 2320019)
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
-- TOC entry 186 (class 1259 OID 2320061)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 2320223)
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
-- TOC entry 185 (class 1259 OID 2320046)
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
-- TOC entry 190 (class 1259 OID 2320112)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 2320235)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 2320340)
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
-- TOC entry 220 (class 1259 OID 2320384)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 2320264)
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
-- TOC entry 200 (class 1259 OID 2320208)
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
-- TOC entry 199 (class 1259 OID 2320198)
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
-- TOC entry 219 (class 1259 OID 2320374)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 2320330)
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
-- TOC entry 173 (class 1259 OID 2319911)
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
-- TOC entry 172 (class 1259 OID 2319909)
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
-- TOC entry 209 (class 1259 OID 2320273)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 2319952)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 2319935)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 2320287)
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
-- TOC entry 203 (class 1259 OID 2320229)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 2320179)
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
-- TOC entry 182 (class 1259 OID 2320011)
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
-- TOC entry 198 (class 1259 OID 2320185)
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
-- TOC entry 218 (class 1259 OID 2320365)
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
-- TOC entry 188 (class 1259 OID 2320081)
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
-- TOC entry 174 (class 1259 OID 2319921)
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
-- TOC entry 223 (class 1259 OID 2320415)
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
-- TOC entry 192 (class 1259 OID 2320127)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 2320256)
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
-- TOC entry 214 (class 1259 OID 2320322)
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
-- TOC entry 194 (class 1259 OID 2320155)
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
-- TOC entry 222 (class 1259 OID 2320405)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 2320312)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 2319914)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 2319968)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 2320450)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 2320433)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 2320349)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 2320133)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 2320174)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 2320095)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5548-cfcf-f7cd-19ec52cd3ae4	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5548-cfcf-a6b6-767312fe84b3	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5548-cfcf-8853-c0aef2fa3936	AL	ALB	008	Albania 	Albanija	\N
00040000-5548-cfcf-5279-381ac9f78a62	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5548-cfcf-0085-2159ff4632d8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5548-cfcf-a633-2390565a44ff	AD	AND	020	Andorra 	Andora	\N
00040000-5548-cfcf-c76d-7a8ac47a94a5	AO	AGO	024	Angola 	Angola	\N
00040000-5548-cfcf-6837-c8b389012cdf	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5548-cfcf-f57c-549810ee5045	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5548-cfcf-ec99-33537291d4e7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5548-cfcf-6ab1-1090d23d59d5	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5548-cfcf-47c6-56980a36fff4	AM	ARM	051	Armenia 	Armenija	\N
00040000-5548-cfcf-d18c-961d1c6d9b43	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5548-cfcf-bc18-d95b1466b26d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5548-cfcf-4fea-1d87f042a9d8	AT	AUT	040	Austria 	Avstrija	\N
00040000-5548-cfcf-1762-bd43e55afe60	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5548-cfcf-f12d-4140a4662415	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5548-cfcf-bbba-fc55a891112b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5548-cfcf-b956-27493a130f36	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5548-cfcf-2c12-5a7c782770b1	BB	BRB	052	Barbados 	Barbados	\N
00040000-5548-cfcf-9f3a-62c2d23c469b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5548-cfcf-3285-0b789e67a972	BE	BEL	056	Belgium 	Belgija	\N
00040000-5548-cfcf-d40b-6bae0b18e230	BZ	BLZ	084	Belize 	Belize	\N
00040000-5548-cfcf-8b91-d03d195ff7a4	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5548-cfcf-c4a6-1e4754143720	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5548-cfcf-7af4-da72664e3503	BT	BTN	064	Bhutan 	Butan	\N
00040000-5548-cfcf-dc9e-65d5f3aa6556	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5548-cfcf-6b81-40156b1d46b7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5548-cfcf-e999-21ed5ec40bb0	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5548-cfcf-69b1-7838ee9375f2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5548-cfcf-0df7-dee81f921f7b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5548-cfcf-dddc-8121ee9d5c9d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5548-cfcf-814b-31a89de055e9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5548-cfcf-460d-ba436c8a9342	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5548-cfcf-fb8f-6355128645ae	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5548-cfcf-7062-13494ed2954f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5548-cfcf-1e63-35e8796605be	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5548-cfcf-3cf0-54081c7b11e0	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5548-cfcf-574e-29034afccf71	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5548-cfcf-a72e-6e3c26846e2a	CA	CAN	124	Canada 	Kanada	\N
00040000-5548-cfcf-cc9b-8dccaa1d4c40	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5548-cfcf-aeba-15b056511134	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5548-cfcf-a2e6-395c3732ad7c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5548-cfcf-2ac0-086080912c35	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5548-cfcf-8aaa-1f17b2a23e9d	CL	CHL	152	Chile 	Čile	\N
00040000-5548-cfcf-1255-fa398fd20820	CN	CHN	156	China 	Kitajska	\N
00040000-5548-cfcf-6498-4d68be3b332f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5548-cfcf-2b00-aa8f72205a66	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5548-cfcf-c88d-9b40f6356722	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5548-cfcf-6163-c46f0bca26c2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5548-cfcf-bccd-147abedc1be8	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5548-cfcf-f531-f1e2b6eafc85	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5548-cfcf-80b3-4d693502e0cb	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5548-cfcf-2895-f040883b79b6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5548-cfcf-2218-d477b2726436	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5548-cfcf-c895-e37376a19a1b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5548-cfcf-5db6-75b36d49ac4b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5548-cfcf-2be3-66ef6a93e77e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5548-cfcf-6573-b64653576e6a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5548-cfcf-bf88-7a9ae8558cbe	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5548-cfcf-4521-24b37a3217de	DK	DNK	208	Denmark 	Danska	\N
00040000-5548-cfcf-4213-dca392677aa4	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5548-cfcf-fd5b-02e43dde55a0	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5548-cfcf-e712-6f26f2e2f06b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5548-cfcf-2ea0-9400cbcddc6a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5548-cfcf-54ee-e2fecdba3e44	EG	EGY	818	Egypt 	Egipt	\N
00040000-5548-cfcf-9a24-df9a8591591d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5548-cfcf-9617-201ccb694b61	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5548-cfcf-d8f3-2d2504124a60	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5548-cfcf-afbf-01995e1a21ba	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5548-cfcf-331b-d81b5c0bca6b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5548-cfcf-961e-5219f67e3bb4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5548-cfcf-02ca-c209596a719b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5548-cfcf-1350-0e1385279c12	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5548-cfcf-45f9-5181daac7d1f	FI	FIN	246	Finland 	Finska	\N
00040000-5548-cfcf-27d2-14f7382bcde2	FR	FRA	250	France 	Francija	\N
00040000-5548-cfcf-bcdf-0723778cafe3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5548-cfcf-1657-73be6285d9da	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5548-cfcf-ce36-0b445abe58f3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5548-cfcf-0012-f3073957e236	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5548-cfcf-0417-80f16f2fac25	GA	GAB	266	Gabon 	Gabon	\N
00040000-5548-cfcf-0b41-0d7089e53150	GM	GMB	270	Gambia 	Gambija	\N
00040000-5548-cfcf-4a27-a07d9508a675	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5548-cfcf-4fc0-5129c55535a1	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5548-cfcf-ca33-92d70de23637	GH	GHA	288	Ghana 	Gana	\N
00040000-5548-cfcf-af37-1bcd2516f676	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5548-cfcf-20f4-604f1b585ea2	GR	GRC	300	Greece 	Grčija	\N
00040000-5548-cfcf-4c43-0b4e0fa68103	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5548-cfcf-ef4d-4e323ede3cb9	GD	GRD	308	Grenada 	Grenada	\N
00040000-5548-cfcf-ed66-b1dc84cb81d5	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5548-cfcf-7e5c-ceb89351d8f4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5548-cfcf-91e4-ed5838cac597	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5548-cfcf-7d6a-6c35f97f9f4b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5548-cfcf-fbe7-2f18139071cf	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5548-cfcf-a66a-aafea61b07e6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5548-cfcf-5f68-fe339bc818d6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5548-cfcf-7d56-655dd5310194	HT	HTI	332	Haiti 	Haiti	\N
00040000-5548-cfcf-4916-901d1ae5931a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5548-cfcf-1c71-2c51c1d23c4c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5548-cfcf-6902-93bc282dcc56	HN	HND	340	Honduras 	Honduras	\N
00040000-5548-cfcf-f3df-65e6495d2ebc	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5548-cfcf-028b-79fb9536c7db	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5548-cfcf-a802-a4f87b7dc6b1	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5548-cfcf-f425-2dff165d9b30	IN	IND	356	India 	Indija	\N
00040000-5548-cfcf-e5f0-e50c7dd8616e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5548-cfcf-c762-4b47ae43d372	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5548-cfcf-0399-8e6367394827	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5548-cfcf-364c-1f32b470a9a1	IE	IRL	372	Ireland 	Irska	\N
00040000-5548-cfcf-65dd-4e4ec2888602	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5548-cfcf-34ab-39a84daf2748	IL	ISR	376	Israel 	Izrael	\N
00040000-5548-cfcf-99be-a0dfd271391e	IT	ITA	380	Italy 	Italija	\N
00040000-5548-cfcf-2393-77f7456640fb	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5548-cfcf-fc56-a26ed155a35c	JP	JPN	392	Japan 	Japonska	\N
00040000-5548-cfcf-dffa-cc70f563f31c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5548-cfcf-b3da-6b2c90f888a7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5548-cfcf-ea5f-99778e0003bb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5548-cfcf-f3d8-1bd2fc32b4ee	KE	KEN	404	Kenya 	Kenija	\N
00040000-5548-cfcf-ecfa-ab49b45186aa	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5548-cfcf-52b4-f3bce1ce60f0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5548-cfcf-bee6-b5cc0b6c8247	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5548-cfcf-5c1e-453b00809595	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5548-cfcf-90ea-514f20ba16a1	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5548-cfcf-5881-c8be94ed9ed1	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5548-cfcf-4a7f-1947ee822b8f	LV	LVA	428	Latvia 	Latvija	\N
00040000-5548-cfcf-687c-634cae7ee6b0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5548-cfcf-343a-b3b107b8b241	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5548-cfcf-94d8-d3521c2c56e6	LR	LBR	430	Liberia 	Liberija	\N
00040000-5548-cfcf-5b1c-8ce63477db3c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5548-cfcf-1eb6-79c43ddbcf69	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5548-cfcf-5e9b-e2adfa464dff	LT	LTU	440	Lithuania 	Litva	\N
00040000-5548-cfcf-8d43-0feced991fed	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5548-cfcf-2354-ce693b851c94	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5548-cfcf-2426-a23936395617	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5548-cfcf-65e0-0d30c54c08bc	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5548-cfcf-a155-73e448d246a2	MW	MWI	454	Malawi 	Malavi	\N
00040000-5548-cfcf-9884-e572721e76d0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5548-cfcf-d9f2-780d1b2b3442	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5548-cfcf-4c02-e0829a288722	ML	MLI	466	Mali 	Mali	\N
00040000-5548-cfcf-41c0-62581a283efc	MT	MLT	470	Malta 	Malta	\N
00040000-5548-cfcf-086d-1cdba4484181	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5548-cfcf-e26c-e91397e90241	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5548-cfcf-c633-f27b9ae9c628	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5548-cfcf-d19b-f94d3f25aa99	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5548-cfcf-c9ba-3bcaa87bb79b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5548-cfcf-09c4-618fc2ab31d1	MX	MEX	484	Mexico 	Mehika	\N
00040000-5548-cfcf-e8e7-f610a0ab1cc5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5548-cfcf-e5ce-2250c2e960c2	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5548-cfcf-ba0a-8678f147fcb7	MC	MCO	492	Monaco 	Monako	\N
00040000-5548-cfcf-66e7-794c6c9c1ca3	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5548-cfcf-7986-43c5c4a1e8ed	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5548-cfcf-44ec-71e6749c4db5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5548-cfcf-8869-26d9aae391a4	MA	MAR	504	Morocco 	Maroko	\N
00040000-5548-cfcf-1779-92f3a013993d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5548-cfcf-fc2b-fdb3c2c81def	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5548-cfcf-ec96-33ca6bb9516a	NA	NAM	516	Namibia 	Namibija	\N
00040000-5548-cfcf-ad99-5007f25ddfde	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5548-cfcf-12aa-2c8313e94302	NP	NPL	524	Nepal 	Nepal	\N
00040000-5548-cfcf-8725-cb34140fc1ec	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5548-cfcf-4118-36a6b5ba2e14	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5548-cfcf-a827-65c7c160b8bb	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5548-cfcf-670d-ca646b293a6d	NE	NER	562	Niger 	Niger 	\N
00040000-5548-cfcf-3420-80f836c34969	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5548-cfcf-1075-c84e368cedfb	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5548-cfcf-c0f7-37bbfb7b4a25	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5548-cfcf-0b83-06324dc31354	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5548-cfcf-cbcd-fcb525d524b2	NO	NOR	578	Norway 	Norveška	\N
00040000-5548-cfcf-3f4f-b70fa154ed1b	OM	OMN	512	Oman 	Oman	\N
00040000-5548-cfcf-d567-18e56fe76de9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5548-cfcf-fd28-d0dd3c5ad76f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5548-cfcf-5a37-f2bb8d6a2b50	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5548-cfcf-f239-e36047fdc15e	PA	PAN	591	Panama 	Panama	\N
00040000-5548-cfcf-61fd-999a950abe5f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5548-cfcf-1e05-c241d7b4d3f5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5548-cfcf-9ae4-f49498070b86	PE	PER	604	Peru 	Peru	\N
00040000-5548-cfcf-7850-c2084d5294f9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5548-cfcf-5496-56f6ab409b87	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5548-cfcf-fbec-5c65f1d60b3d	PL	POL	616	Poland 	Poljska	\N
00040000-5548-cfcf-81ea-b06de295840e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5548-cfcf-f5d0-af3cf81313c2	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5548-cfcf-f56e-3e378fed79f4	QA	QAT	634	Qatar 	Katar	\N
00040000-5548-cfcf-5640-6dd9191e5c05	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5548-cfcf-86f6-fe752ba1473c	RO	ROU	642	Romania 	Romunija	\N
00040000-5548-cfcf-89b9-b42917aa7ea0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5548-cfcf-2a69-c35c061b1fb0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5548-cfcf-bc6a-d54b5a20ed04	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5548-cfcf-3115-6bf020b8b959	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5548-cfcf-45ff-57dc9f7268d0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5548-cfcf-8938-308868db21d3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5548-cfcf-1da3-7578fbbbf925	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5548-cfcf-3bbe-da05ab631a3d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5548-cfcf-1cee-01beb42ae9cd	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5548-cfcf-1add-4c4c98e07df9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5548-cfcf-e5da-3c250b4a36e6	SM	SMR	674	San Marino 	San Marino	\N
00040000-5548-cfcf-a0ac-1de6d5e32fa6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5548-cfcf-d40c-6d865083c49c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5548-cfcf-eb30-31d14f5b3e9e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5548-cfcf-f940-03492d5a3fde	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5548-cfcf-c742-c3227e33aea6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5548-cfcf-dba6-de8a06799161	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5548-cfcf-059c-53714eb69bfa	SG	SGP	702	Singapore 	Singapur	\N
00040000-5548-cfcf-096d-da8091daa57e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5548-cfcf-b687-c2e4f36fd0a8	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5548-cfcf-d5a3-2d272b93f7c0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5548-cfcf-1235-d5a311e01634	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5548-cfcf-bbe2-920374982881	SO	SOM	706	Somalia 	Somalija	\N
00040000-5548-cfcf-f64e-e176fa4fe608	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5548-cfcf-056e-bb6c796be5ae	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5548-cfcf-b055-faca15f27b60	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5548-cfcf-6732-b2e6b90d8140	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5548-cfcf-0140-da1dcc5b1a26	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5548-cfcf-5e3d-a3caea780085	SD	SDN	729	Sudan 	Sudan	\N
00040000-5548-cfcf-b0d3-cd4d29f9894a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5548-cfcf-d089-630ca886dfb7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5548-cfcf-aa33-afa2b70c13a5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5548-cfcf-f613-2b5cd5c95940	SE	SWE	752	Sweden 	Švedska	\N
00040000-5548-cfcf-b179-b6824832ece1	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5548-cfcf-e9b1-e35c26b0579d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5548-cfcf-f18b-b84b043127fd	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5548-cfcf-ec69-1695277ef223	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5548-cfcf-6bdc-b2970e477940	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5548-cfcf-0c0f-208e8a108743	TH	THA	764	Thailand 	Tajska	\N
00040000-5548-cfcf-8201-935a761a6f94	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5548-cfcf-5fbf-ed5048586bf5	TG	TGO	768	Togo 	Togo	\N
00040000-5548-cfcf-c27b-96cf63b5783f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5548-cfcf-d31a-3b77de0c14bc	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5548-cfcf-4fd7-6af9ebd32d17	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5548-cfcf-c32a-24602a37979d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5548-cfcf-0df9-437474c9aed1	TR	TUR	792	Turkey 	Turčija	\N
00040000-5548-cfcf-1d83-24adc5ffcf68	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5548-cfcf-7f30-f57c2e255a54	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5548-cfcf-c8f4-658ea03ff6ab	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5548-cfcf-37c6-fc015cc38cd6	UG	UGA	800	Uganda 	Uganda	\N
00040000-5548-cfcf-2e4e-f028bc1b45a4	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5548-cfcf-fd33-5120e9821cff	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5548-cfcf-1084-6c9895158c3d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5548-cfcf-5a98-be90efb874f3	US	USA	840	United States 	Združene države Amerike	\N
00040000-5548-cfcf-cd4d-b53c965b0826	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5548-cfcf-9373-1ae361c3f296	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5548-cfcf-8f4b-51d73b53fd45	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5548-cfcf-f550-8fc2bf83640a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5548-cfcf-d71e-d7271a53cda8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5548-cfcf-b50d-7662dfc2a51f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5548-cfcf-9503-e7f50565553c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5548-cfcf-010c-56cc7c92f781	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5548-cfcf-01de-7d410c5e5334	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5548-cfcf-32ed-da688fb1e679	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5548-cfcf-fb92-e532620433bc	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5548-cfcf-9d51-da9aa8b64e0d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5548-cfcf-e390-b02438ed90b6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 2320299)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 2320120)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 2320168)
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
-- TOC entry 2658 (class 0 OID 2320217)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 2320242)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 2320069)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5548-cfd0-d27f-521cac9a705c	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5548-cfd0-34d8-8428b85e180a	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5548-cfd0-baef-634d057e4747	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5548-cfd0-7de5-51c0fd3a323f	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5548-cfd0-ff02-5dd7cff9721c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5548-cfd0-f2b5-7928544b547e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5548-cfd0-a020-4523e8b59895	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5548-cfd0-9858-10f49ce7db43	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5548-cfd0-4eae-48a59fd3a1f5	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5548-cfd0-3f26-1a09b4c52ca2	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 2319977)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5548-cfd0-640f-872c66e5ddcb	00000000-5548-cfd0-ff02-5dd7cff9721c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5548-cfd0-f7d5-440da0bd56ab	00000000-5548-cfd0-ff02-5dd7cff9721c	00010000-5548-cfd0-2a64-38823f713ab6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5548-cfd0-94f8-e0a896db8ef1	00000000-5548-cfd0-f2b5-7928544b547e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 2319988)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 2320039)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 2319942)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5548-cfd0-9c5b-289f904f5488	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5548-cfd0-f1aa-4dc54f37d704	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5548-cfd0-30b8-f467d3742203	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5548-cfd0-4c11-ac04435157b6	Abonma-read	Abonma - branje	f
00030000-5548-cfd0-aec8-7007128e2280	Abonma-write	Abonma - spreminjanje	f
00030000-5548-cfd0-0639-c09f4b276793	Alternacija-read	Alternacija - branje	f
00030000-5548-cfd0-262f-b2ef95f3f627	Alternacija-write	Alternacija - spreminjanje	f
00030000-5548-cfd0-0c6e-07165aa16b6c	Arhivalija-read	Arhivalija - branje	f
00030000-5548-cfd0-4adb-f21c8bdd91c4	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5548-cfd0-f9e5-cfba3b8ab99c	Besedilo-read	Besedilo - branje	f
00030000-5548-cfd0-1549-1df91feeaa49	Besedilo-write	Besedilo - spreminjanje	f
00030000-5548-cfd0-6ca5-3a87e5bb18ad	DogodekIzven-read	DogodekIzven - branje	f
00030000-5548-cfd0-80f8-006675cfbc67	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5548-cfd0-d527-81809950765a	Dogodek-read	Dogodek - branje	f
00030000-5548-cfd0-84c5-42971320f026	Dogodek-write	Dogodek - spreminjanje	f
00030000-5548-cfd0-0362-33300f69def8	Drzava-read	Drzava - branje	f
00030000-5548-cfd0-94ba-5c62cf2b200b	Drzava-write	Drzava - spreminjanje	f
00030000-5548-cfd0-eeb5-14d6b7a50fc5	Funkcija-read	Funkcija - branje	f
00030000-5548-cfd0-32ff-de960f558fea	Funkcija-write	Funkcija - spreminjanje	f
00030000-5548-cfd0-da9b-597808a933b0	Gostovanje-read	Gostovanje - branje	f
00030000-5548-cfd0-67ea-5d4beae42566	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5548-cfd0-9baa-483c46618592	Gostujoca-read	Gostujoca - branje	f
00030000-5548-cfd0-d2e8-29b44d43f148	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5548-cfd0-84a8-ee4ced838c19	Kupec-read	Kupec - branje	f
00030000-5548-cfd0-8dea-051fb02bfdb5	Kupec-write	Kupec - spreminjanje	f
00030000-5548-cfd0-c99e-097a912b396f	NacinPlacina-read	NacinPlacina - branje	f
00030000-5548-cfd0-a3e1-63bbb1ad1051	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5548-cfd0-b1fe-9163a79babe2	Option-read	Option - branje	f
00030000-5548-cfd0-b294-31c245b6a762	Option-write	Option - spreminjanje	f
00030000-5548-cfd0-63fd-8db913ed8e26	OptionValue-read	OptionValue - branje	f
00030000-5548-cfd0-d400-df3ec7a7c6db	OptionValue-write	OptionValue - spreminjanje	f
00030000-5548-cfd0-8048-0d85ee79728b	Oseba-read	Oseba - branje	f
00030000-5548-cfd0-2a7d-bf671cccd9ac	Oseba-write	Oseba - spreminjanje	f
00030000-5548-cfd0-22e7-516afbbef27d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5548-cfd0-9dcd-4d4fb3826586	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5548-cfd0-4595-18dba8366f40	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5548-cfd0-8053-64383f5dc028	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5548-cfd0-6dc6-15c379a5b3ea	Pogodba-read	Pogodba - branje	f
00030000-5548-cfd0-8846-f3a9590e3a44	Pogodba-write	Pogodba - spreminjanje	f
00030000-5548-cfd0-d964-175a7dd0f00a	Popa-read	Popa - branje	f
00030000-5548-cfd0-5a78-8667774dd6c6	Popa-write	Popa - spreminjanje	f
00030000-5548-cfd0-f1f9-0a113ddd7100	Posta-read	Posta - branje	f
00030000-5548-cfd0-daf0-a5c19d702ca7	Posta-write	Posta - spreminjanje	f
00030000-5548-cfd0-2cf7-1cd5f311fa5d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5548-cfd0-acd6-24b306c5f972	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5548-cfd0-9cd6-4dcae5d20161	PostniNaslov-read	PostniNaslov - branje	f
00030000-5548-cfd0-4935-8dd9fcb04d8b	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5548-cfd0-a198-2fca8676db2b	Predstava-read	Predstava - branje	f
00030000-5548-cfd0-34be-0098d13098b3	Predstava-write	Predstava - spreminjanje	f
00030000-5548-cfd0-f9f7-f77758faffb1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5548-cfd0-2480-929a7a714830	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5548-cfd0-4522-c79c59ebd4db	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5548-cfd0-cd5c-9b73922d765f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5548-cfd0-cf81-751d065b8272	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5548-cfd0-131f-afe4f0123429	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5548-cfd0-a77a-0f04a411cf5b	Prostor-read	Prostor - branje	f
00030000-5548-cfd0-0545-88b2aa4fd2d0	Prostor-write	Prostor - spreminjanje	f
00030000-5548-cfd0-85b1-6e97eabe4dd3	Racun-read	Racun - branje	f
00030000-5548-cfd0-6fb2-bd4fdbe277bb	Racun-write	Racun - spreminjanje	f
00030000-5548-cfd0-72db-ac6c18ea7ba7	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5548-cfd0-d321-5bf1d4f22a7b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5548-cfd0-a869-024d58476faf	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5548-cfd0-509d-966f74267396	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5548-cfd0-ffab-bb004a71cf57	Rekvizit-read	Rekvizit - branje	f
00030000-5548-cfd0-ed1c-affcac68b5ba	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5548-cfd0-2815-c54165ccd375	Rezervacija-read	Rezervacija - branje	f
00030000-5548-cfd0-19b2-602d45ea8893	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5548-cfd0-0fc9-b3b882e9803f	SedezniRed-read	SedezniRed - branje	f
00030000-5548-cfd0-2b39-e0fb69283c85	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5548-cfd0-194f-b170b19eee0e	Sedez-read	Sedez - branje	f
00030000-5548-cfd0-0078-de88f530be29	Sedez-write	Sedez - spreminjanje	f
00030000-5548-cfd0-9ccb-156ce38a49d5	Sezona-read	Sezona - branje	f
00030000-5548-cfd0-9bf6-ab0ceebe72c7	Sezona-write	Sezona - spreminjanje	f
00030000-5548-cfd0-3daa-a5a5e408f2a6	Telefonska-read	Telefonska - branje	f
00030000-5548-cfd0-f40b-a2cb24a700ee	Telefonska-write	Telefonska - spreminjanje	f
00030000-5548-cfd0-5cd2-1d78d180d5d3	TerminStoritve-read	TerminStoritve - branje	f
00030000-5548-cfd0-8870-7f564e57e993	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5548-cfd0-8c15-30520787faf2	TipFunkcije-read	TipFunkcije - branje	f
00030000-5548-cfd0-d170-e2528081ee7d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5548-cfd0-d6b3-064dc56790f7	Trr-read	Trr - branje	f
00030000-5548-cfd0-dd6f-54d215fc5eb8	Trr-write	Trr - spreminjanje	f
00030000-5548-cfd0-87a6-5ae25d66555f	Uprizoritev-read	Uprizoritev - branje	f
00030000-5548-cfd0-74af-36277e673b7a	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5548-cfd0-8795-826a4697e415	Vaja-read	Vaja - branje	f
00030000-5548-cfd0-b63f-16abcdcdd865	Vaja-write	Vaja - spreminjanje	f
00030000-5548-cfd0-e7a6-d75e078936b1	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5548-cfd0-b63b-64f50e38d7c3	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5548-cfd0-0cb7-879587823105	Zaposlitev-read	Zaposlitev - branje	f
00030000-5548-cfd0-e66f-375a32933654	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5548-cfd0-1621-78dccc07f38d	Zasedenost-read	Zasedenost - branje	f
00030000-5548-cfd0-d6f8-45e76dc5cc21	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5548-cfd0-ff96-55bbfa69f2ce	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5548-cfd0-3ce7-9a69e2fa7664	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5548-cfd0-fb6d-5845b2edbdc6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5548-cfd0-37c9-1f92ced308cd	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 2319961)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5548-cfd0-2f35-8dd549e3afb9	00030000-5548-cfd0-0362-33300f69def8
00020000-5548-cfd0-ac12-98c9d0988a7a	00030000-5548-cfd0-94ba-5c62cf2b200b
00020000-5548-cfd0-ac12-98c9d0988a7a	00030000-5548-cfd0-0362-33300f69def8
\.


--
-- TOC entry 2663 (class 0 OID 2320249)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 2320279)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 2320391)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 2320019)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 2320061)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5548-cfcf-8da3-c5c26dcba0a4	8341	Adlešiči
00050000-5548-cfcf-f2d7-d3ec88edb965	5270	Ajdovščina
00050000-5548-cfcf-1425-feae72cec7ee	6280	Ankaran/Ancarano
00050000-5548-cfcf-21de-8e622a87dfb7	9253	Apače
00050000-5548-cfcf-bcb7-00e7fa69d6f8	8253	Artiče
00050000-5548-cfcf-a6c7-fd3460a8ceb8	4275	Begunje na Gorenjskem
00050000-5548-cfcf-daf1-08c551d68e51	1382	Begunje pri Cerknici
00050000-5548-cfcf-0833-f425a77ae7ec	9231	Beltinci
00050000-5548-cfcf-c715-cbb95fc43822	2234	Benedikt
00050000-5548-cfcf-69cc-2e24afde694a	2345	Bistrica ob Dravi
00050000-5548-cfcf-f4b5-ee77477a5992	3256	Bistrica ob Sotli
00050000-5548-cfcf-4bf5-7fb436252d4b	8259	Bizeljsko
00050000-5548-cfcf-5938-d6d5c6816360	1223	Blagovica
00050000-5548-cfcf-a9f1-6335ae63cc12	8283	Blanca
00050000-5548-cfcf-acd1-3ed1ca8e5298	4260	Bled
00050000-5548-cfcf-84c7-29dc241f74b3	4273	Blejska Dobrava
00050000-5548-cfcf-066a-9327cd8e808b	9265	Bodonci
00050000-5548-cfcf-b46e-4421e130ae42	9222	Bogojina
00050000-5548-cfcf-8602-73ab35b224db	4263	Bohinjska Bela
00050000-5548-cfcf-72f2-d5ee9563d738	4264	Bohinjska Bistrica
00050000-5548-cfcf-43da-901297a304c3	4265	Bohinjsko jezero
00050000-5548-cfcf-c8fc-fa95cb20be46	1353	Borovnica
00050000-5548-cfcf-ae37-a866e626073d	8294	Boštanj
00050000-5548-cfcf-2371-b22190827edb	5230	Bovec
00050000-5548-cfcf-6bbb-ac00c73d4b40	5295	Branik
00050000-5548-cfcf-e8eb-0abd14028ae8	3314	Braslovče
00050000-5548-cfcf-c1af-364f0f2a39d6	5223	Breginj
00050000-5548-cfcf-0148-c7a38ee94a91	8280	Brestanica
00050000-5548-cfcf-542e-80b4eaede5fc	2354	Bresternica
00050000-5548-cfcf-955f-41365bf15661	4243	Brezje
00050000-5548-cfcf-03ae-21f868b2bd8d	1351	Brezovica pri Ljubljani
00050000-5548-cfcf-7806-24f803fe7006	8250	Brežice
00050000-5548-cfcf-fafd-dc2b20816b2a	4210	Brnik - Aerodrom
00050000-5548-cfcf-2aeb-dc184306268d	8321	Brusnice
00050000-5548-cfcf-82e3-d3f5c67a1d13	3255	Buče
00050000-5548-cfcf-9612-2dbeaf214c09	8276	Bučka 
00050000-5548-cfcf-b272-9a9ca4309cc7	9261	Cankova
00050000-5548-cfcf-09f0-f72a16bf5800	3000	Celje 
00050000-5548-cfcf-86a2-6fc47c2a2e91	3001	Celje - poštni predali
00050000-5548-cfcf-d48f-952052f6e831	4207	Cerklje na Gorenjskem
00050000-5548-cfcf-1b96-ce1181c1a670	8263	Cerklje ob Krki
00050000-5548-cfcf-6bd3-537999ce890a	1380	Cerknica
00050000-5548-cfcf-09fa-8a091fa27a38	5282	Cerkno
00050000-5548-cfcf-e6b9-c05b97dc8d2d	2236	Cerkvenjak
00050000-5548-cfcf-e150-cae76d5db5ad	2215	Ceršak
00050000-5548-cfcf-7115-b14e80f2674c	2326	Cirkovce
00050000-5548-cfcf-b262-0503d7fff74f	2282	Cirkulane
00050000-5548-cfcf-605a-cf35821afa15	5273	Col
00050000-5548-cfcf-13e3-3285c66e40d4	8251	Čatež ob Savi
00050000-5548-cfcf-34b0-9634d4bb6f56	1413	Čemšenik
00050000-5548-cfcf-fd66-d364dbc77770	5253	Čepovan
00050000-5548-cfcf-ea92-5da6192f0a12	9232	Črenšovci
00050000-5548-cfcf-4178-8517c9736bec	2393	Črna na Koroškem
00050000-5548-cfcf-7e9a-7e335ff50135	6275	Črni Kal
00050000-5548-cfcf-22ae-556f46798daa	5274	Črni Vrh nad Idrijo
00050000-5548-cfcf-bc39-a20e752dd46a	5262	Črniče
00050000-5548-cfcf-e58c-fd051cfe2909	8340	Črnomelj
00050000-5548-cfcf-bf89-050ea8e5ffa3	6271	Dekani
00050000-5548-cfcf-6e38-6412ef894e60	5210	Deskle
00050000-5548-cfcf-1579-1ef034da6419	2253	Destrnik
00050000-5548-cfcf-e791-10a45314ffb5	6215	Divača
00050000-5548-cfcf-e517-989eaaef23bd	1233	Dob
00050000-5548-cfcf-9cb8-542bb13cbec9	3224	Dobje pri Planini
00050000-5548-cfcf-17f8-03b961ae0ec2	8257	Dobova
00050000-5548-cfcf-4ace-4ecf91154f90	1423	Dobovec
00050000-5548-cfcf-2fd8-55c19beab4d5	5263	Dobravlje
00050000-5548-cfcf-09b6-a76ca3ef3a4d	3204	Dobrna
00050000-5548-cfcf-1ffb-e984d1c0ef83	8211	Dobrnič
00050000-5548-cfcf-ac07-c191403f5c02	1356	Dobrova
00050000-5548-cfcf-de79-a317e6d60871	9223	Dobrovnik/Dobronak 
00050000-5548-cfcf-80a7-dbb258ecd04a	5212	Dobrovo v Brdih
00050000-5548-cfcf-f229-dfc191da69ec	1431	Dol pri Hrastniku
00050000-5548-cfcf-58dd-ffd3c8f75d0d	1262	Dol pri Ljubljani
00050000-5548-cfcf-c790-30df58b5ab4d	1273	Dole pri Litiji
00050000-5548-cfcf-a653-c31671f50b01	1331	Dolenja vas
00050000-5548-cfcf-ebb8-faf23728013e	8350	Dolenjske Toplice
00050000-5548-cfcf-58e7-82cfa5838ade	1230	Domžale
00050000-5548-cfcf-d682-017a0d7a3bd5	2252	Dornava
00050000-5548-cfcf-2925-2e4d57d9ddcb	5294	Dornberk
00050000-5548-cfcf-107d-76cdd47ddb46	1319	Draga
00050000-5548-cfcf-5399-82934ff68fb8	8343	Dragatuš
00050000-5548-cfcf-69e0-82aeef456b8f	3222	Dramlje
00050000-5548-cfcf-79a3-1f5c2d92f0bb	2370	Dravograd
00050000-5548-cfcf-7494-11edc5c8c326	4203	Duplje
00050000-5548-cfcf-ff02-86403f777491	6221	Dutovlje
00050000-5548-cfcf-4859-6613cdd1500b	8361	Dvor
00050000-5548-cfcf-6af0-8576b0d598dd	2343	Fala
00050000-5548-cfcf-c49e-5aed913732f5	9208	Fokovci
00050000-5548-cfcf-4675-909aba074951	2313	Fram
00050000-5548-cfcf-9155-63181ee586de	3213	Frankolovo
00050000-5548-cfcf-2684-d9637aeb7f72	1274	Gabrovka
00050000-5548-cfcf-da1c-79cfd8d602cd	8254	Globoko
00050000-5548-cfcf-3d8d-30396f467337	5275	Godovič
00050000-5548-cfcf-ed17-b1508ae243e0	4204	Golnik
00050000-5548-cfcf-9002-659ae48adea6	3303	Gomilsko
00050000-5548-cfcf-6557-763cc532a6a8	4224	Gorenja vas
00050000-5548-cfcf-437a-609d3eb5ca54	3263	Gorica pri Slivnici
00050000-5548-cfcf-7e56-baaebb57d5cf	2272	Gorišnica
00050000-5548-cfcf-f465-c125d3ac4ce6	9250	Gornja Radgona
00050000-5548-cfcf-651b-bc7d16dc9ccd	3342	Gornji Grad
00050000-5548-cfcf-68c9-bf07146c4493	4282	Gozd Martuljek
00050000-5548-cfcf-0f88-95b7e02f2dac	6272	Gračišče
00050000-5548-cfcf-b970-fcf4464093bd	9264	Grad
00050000-5548-cfcf-d864-59d0cb9b6948	8332	Gradac
00050000-5548-cfcf-5b81-693b45dc7c0d	1384	Grahovo
00050000-5548-cfcf-7d68-24bbfde9b84b	5242	Grahovo ob Bači
00050000-5548-cfcf-27e4-8d36e35207b8	5251	Grgar
00050000-5548-cfcf-4793-0b9f781ebcf5	3302	Griže
00050000-5548-cfcf-25a4-7bd66c38698a	3231	Grobelno
00050000-5548-cfcf-f6b6-40150f736ecd	1290	Grosuplje
00050000-5548-cfcf-70cd-c39c3b090d4f	2288	Hajdina
00050000-5548-cfcf-7f5f-c79e061b3f2e	8362	Hinje
00050000-5548-cfcf-7b40-f964a701bfa7	2311	Hoče
00050000-5548-cfcf-4083-29d2b0cb4501	9205	Hodoš/Hodos
00050000-5548-cfcf-6f5c-0ae335b32ebe	1354	Horjul
00050000-5548-cfcf-809c-233cb8307029	1372	Hotedršica
00050000-5548-cfcf-b3ac-3a9ad04e095b	1430	Hrastnik
00050000-5548-cfcf-3321-4015349b57cb	6225	Hruševje
00050000-5548-cfcf-3948-fd52d5ab5979	4276	Hrušica
00050000-5548-cfcf-05fe-367d5b0f19e7	5280	Idrija
00050000-5548-cfcf-7b20-595aad3aafbc	1292	Ig
00050000-5548-cfcf-e446-93bb44d57241	6250	Ilirska Bistrica
00050000-5548-cfcf-5b24-6d50e1777de4	6251	Ilirska Bistrica-Trnovo
00050000-5548-cfcf-9f6c-1e0c2c1c107f	1295	Ivančna Gorica
00050000-5548-cfcf-30ae-25c5fb3f3566	2259	Ivanjkovci
00050000-5548-cfcf-b2e4-dda4e182203f	1411	Izlake
00050000-5548-cfcf-155d-d7314bf7ea96	6310	Izola/Isola
00050000-5548-cfcf-1e07-f6bc51b4a886	2222	Jakobski Dol
00050000-5548-cfcf-6c11-1a421eb0a2fc	2221	Jarenina
00050000-5548-cfcf-9cd1-efcfba300c35	6254	Jelšane
00050000-5548-cfcf-0e99-1781aeb4ca08	4270	Jesenice
00050000-5548-cfcf-cf52-ca7adc94755d	8261	Jesenice na Dolenjskem
00050000-5548-cfcf-4e5d-9a9c4bd2a63a	3273	Jurklošter
00050000-5548-cfcf-c71a-9592616eb8f9	2223	Jurovski Dol
00050000-5548-cfcf-caa7-36d147c997dd	2256	Juršinci
00050000-5548-cfcf-9a4a-2ff4293f6f37	5214	Kal nad Kanalom
00050000-5548-cfcf-8498-e39477e299f9	3233	Kalobje
00050000-5548-cfcf-2be2-ad770cde4213	4246	Kamna Gorica
00050000-5548-cfcf-0599-573f84d131de	2351	Kamnica
00050000-5548-cfcf-3235-df77796e6737	1241	Kamnik
00050000-5548-cfcf-84b6-231022570892	5213	Kanal
00050000-5548-cfcf-af8e-934ea060a965	8258	Kapele
00050000-5548-cfcf-f4fb-ad5e7eb524eb	2362	Kapla
00050000-5548-cfcf-83e8-cfbb2d9b4499	2325	Kidričevo
00050000-5548-cfcf-a6b6-8fa9c1d53018	1412	Kisovec
00050000-5548-cfcf-fd35-af9368280d15	6253	Knežak
00050000-5548-cfcf-ef72-e4e153986983	5222	Kobarid
00050000-5548-cfcf-8f17-4d37cb363c4f	9227	Kobilje
00050000-5548-cfcf-bf74-f3fead431a77	1330	Kočevje
00050000-5548-cfcf-7012-65bcb491677e	1338	Kočevska Reka
00050000-5548-cfcf-43f2-c320ffe8cad1	2276	Kog
00050000-5548-cfcf-6a3d-f28f759802d6	5211	Kojsko
00050000-5548-cfcf-5c1d-263ad69de254	6223	Komen
00050000-5548-cfcf-4d05-8f3045932ca1	1218	Komenda
00050000-5548-cfcf-3ca7-64f44699c117	6000	Koper/Capodistria 
00050000-5548-cfcf-deac-a391058a981a	6001	Koper/Capodistria - poštni predali
00050000-5548-cfcf-4600-a35524bd29e3	8282	Koprivnica
00050000-5548-cfcf-7c50-d294d858d405	5296	Kostanjevica na Krasu
00050000-5548-cfcf-40b9-8387fe6d1f8d	8311	Kostanjevica na Krki
00050000-5548-cfcf-8d87-7fac600a4885	1336	Kostel
00050000-5548-cfcf-85fd-57f9e5e0ee02	6256	Košana
00050000-5548-cfcf-b8c2-73a8ad848847	2394	Kotlje
00050000-5548-cfcf-291a-6caaafed9a2a	6240	Kozina
00050000-5548-cfcf-6995-3be61c2ac03c	3260	Kozje
00050000-5548-cfcf-70a1-b4de8eeba30f	4000	Kranj 
00050000-5548-cfcf-9c02-609a38eea0f4	4001	Kranj - poštni predali
00050000-5548-cfcf-b329-f8441ba35b48	4280	Kranjska Gora
00050000-5548-cfcf-35bc-d5dbb8784151	1281	Kresnice
00050000-5548-cfcf-b70e-a6578d68fb2c	4294	Križe
00050000-5548-cfcf-08db-56f9f9f24228	9206	Križevci
00050000-5548-cfcf-1131-161981607096	9242	Križevci pri Ljutomeru
00050000-5548-cfcf-9e2c-acaa31c75d5a	1301	Krka
00050000-5548-cfcf-9e60-a5b2a922b065	8296	Krmelj
00050000-5548-cfcf-61ee-7a64b493f2e4	4245	Kropa
00050000-5548-cfcf-0754-ef2749c103d9	8262	Krška vas
00050000-5548-cfcf-be3b-f6abe7782f30	8270	Krško
00050000-5548-cfcf-a587-183a91b00d09	9263	Kuzma
00050000-5548-cfcf-5e47-22528272235f	2318	Laporje
00050000-5548-cfcf-94ac-bfb62425d851	3270	Laško
00050000-5548-cfcf-05cc-24fef55f45fd	1219	Laze v Tuhinju
00050000-5548-cfcf-9c8d-4c34becadff5	2230	Lenart v Slovenskih goricah
00050000-5548-cfcf-f388-d4615783d82a	9220	Lendava/Lendva
00050000-5548-cfcf-fb58-f078346cd6f2	4248	Lesce
00050000-5548-cfcf-eaf4-1886259f45c0	3261	Lesično
00050000-5548-cfcf-223b-c6bf31418d52	8273	Leskovec pri Krškem
00050000-5548-cfcf-b9e4-d7187661a983	2372	Libeliče
00050000-5548-cfcf-bc8d-bf32578a8de8	2341	Limbuš
00050000-5548-cfcf-43c6-819f09ad67f3	1270	Litija
00050000-5548-cfcf-a94d-15e1a703abcb	3202	Ljubečna
00050000-5548-cfcf-1bc4-de1ca9147c6b	1000	Ljubljana 
00050000-5548-cfcf-4b52-e4e6b8e8c895	1001	Ljubljana - poštni predali
00050000-5548-cfcf-7c08-8cd18163999e	1231	Ljubljana - Črnuče
00050000-5548-cfcf-7b68-33d3bb21f5c9	1261	Ljubljana - Dobrunje
00050000-5548-cfcf-10d6-eddc11befcb3	1260	Ljubljana - Polje
00050000-5548-cfcf-c2c2-76d62c129669	1210	Ljubljana - Šentvid
00050000-5548-cfcf-2db7-d697e46a09b8	1211	Ljubljana - Šmartno
00050000-5548-cfcf-eab5-95f18ff6072f	3333	Ljubno ob Savinji
00050000-5548-cfcf-192b-72aaa1e1f793	9240	Ljutomer
00050000-5548-cfcf-aa27-602bdbdc2cd1	3215	Loče
00050000-5548-cfcf-fb93-372734b36b67	5231	Log pod Mangartom
00050000-5548-cfcf-7971-3b2ac90034d5	1358	Log pri Brezovici
00050000-5548-cfcf-02e7-38474eae3798	1370	Logatec
00050000-5548-cfcf-3367-3a3346bca41e	1371	Logatec
00050000-5548-cfcf-47cb-206e042455df	1434	Loka pri Zidanem Mostu
00050000-5548-cfcf-5a9c-909f747cf4fc	3223	Loka pri Žusmu
00050000-5548-cfcf-28be-afa4d514daa0	6219	Lokev
00050000-5548-cfcf-b8db-aae463234fb9	1318	Loški Potok
00050000-5548-cfcf-08ce-01c63c19fa1a	2324	Lovrenc na Dravskem polju
00050000-5548-cfcf-5480-4564a3976032	2344	Lovrenc na Pohorju
00050000-5548-cfcf-5982-b2c932b72c58	3334	Luče
00050000-5548-cfcf-ee07-3a4df9903d8b	1225	Lukovica
00050000-5548-cfcf-92d7-e6473f5330e2	9202	Mačkovci
00050000-5548-cfcf-23a3-fb16b6cb2251	2322	Majšperk
00050000-5548-cfcf-b163-fb53e711e1a4	2321	Makole
00050000-5548-cfcf-b50b-c568b648f234	9243	Mala Nedelja
00050000-5548-cfcf-597b-680c44520911	2229	Malečnik
00050000-5548-cfcf-15bd-599f585b9660	6273	Marezige
00050000-5548-cfcf-2985-cb00ace35e6c	2000	Maribor 
00050000-5548-cfcf-df08-903435bae963	2001	Maribor - poštni predali
00050000-5548-cfcf-a747-0f042d3782f9	2206	Marjeta na Dravskem polju
00050000-5548-cfcf-5489-c6c66778ba4b	2281	Markovci
00050000-5548-cfcf-0545-5ae3c275510e	9221	Martjanci
00050000-5548-cfcf-1499-4223047f1e90	6242	Materija
00050000-5548-cfcf-25e3-c5c4f8885d66	4211	Mavčiče
00050000-5548-cfcf-4e07-3d94e65b7142	1215	Medvode
00050000-5548-cfcf-f82c-d2999bb5ac09	1234	Mengeš
00050000-5548-cfcf-bfce-0a5198d58c7a	8330	Metlika
00050000-5548-cfcf-4520-b9e8eb53c053	2392	Mežica
00050000-5548-cfcf-5009-51aef72b6495	2204	Miklavž na Dravskem polju
00050000-5548-cfcf-23ea-bcad5140fafa	2275	Miklavž pri Ormožu
00050000-5548-cfcf-7610-f2695c3cb3c5	5291	Miren
00050000-5548-cfcf-6bfa-6d78a2c32d30	8233	Mirna
00050000-5548-cfcf-7488-9c6b16d31225	8216	Mirna Peč
00050000-5548-cfcf-731e-f6e43da9c7c9	2382	Mislinja
00050000-5548-cfcf-0a65-1e86fe1d7429	4281	Mojstrana
00050000-5548-cfcf-3587-eebe8fa2ad9b	8230	Mokronog
00050000-5548-cfcf-ab41-24a54182bb8c	1251	Moravče
00050000-5548-cfcf-f6a3-4213aac523a2	9226	Moravske Toplice
00050000-5548-cfcf-b878-172366336e27	5216	Most na Soči
00050000-5548-cfcf-2f04-e1e6b5404e0a	1221	Motnik
00050000-5548-cfcf-dfcd-9f01dcdaa234	3330	Mozirje
00050000-5548-cfcf-801b-4d620e189c37	9000	Murska Sobota 
00050000-5548-cfcf-378e-ac511b618083	9001	Murska Sobota - poštni predali
00050000-5548-cfcf-7a14-ebfc93c5c0af	2366	Muta
00050000-5548-cfcf-5645-ed79a528798d	4202	Naklo
00050000-5548-cfcf-a284-7c954df40550	3331	Nazarje
00050000-5548-cfcf-6fbc-635e4b51adca	1357	Notranje Gorice
00050000-5548-cfcf-e35c-bece8138326e	3203	Nova Cerkev
00050000-5548-cfcf-1016-bc376f6ee829	5000	Nova Gorica 
00050000-5548-cfcf-7d13-dfd456f87688	5001	Nova Gorica - poštni predali
00050000-5548-cfcf-b708-e583014b3ac7	1385	Nova vas
00050000-5548-cfcf-6d21-514815d48454	8000	Novo mesto
00050000-5548-cfcf-ad61-0291f3a6558f	8001	Novo mesto - poštni predali
00050000-5548-cfcf-3908-9306978f9cf4	6243	Obrov
00050000-5548-cfcf-8e87-ef07c02b485d	9233	Odranci
00050000-5548-cfcf-8bae-41a80b134258	2317	Oplotnica
00050000-5548-cfcf-c23b-489605a5e607	2312	Orehova vas
00050000-5548-cfcf-8804-5dde28019544	2270	Ormož
00050000-5548-cfcf-710f-0bea5b83cc30	1316	Ortnek
00050000-5548-cfcf-0bb1-db4f58fa5f15	1337	Osilnica
00050000-5548-cfcf-94f8-714af11f7716	8222	Otočec
00050000-5548-cfcf-6687-0d2bc0c54b4d	2361	Ožbalt
00050000-5548-cfcf-6d51-d6056e9348c5	2231	Pernica
00050000-5548-cfcf-814b-ee2927f4db46	2211	Pesnica pri Mariboru
00050000-5548-cfcf-0735-5fe8e4d6903b	9203	Petrovci
00050000-5548-cfcf-38d5-bab8c09fff41	3301	Petrovče
00050000-5548-cfcf-0277-ce466e5bf6ef	6330	Piran/Pirano
00050000-5548-cfcf-39e9-8a08eb548aab	8255	Pišece
00050000-5548-cfcf-c2d7-38f790fd4f9c	6257	Pivka
00050000-5548-cfcf-908c-eab72559e2b0	6232	Planina
00050000-5548-cfcf-fca7-cebcae34310b	3225	Planina pri Sevnici
00050000-5548-cfcf-0a15-e356f9225f51	6276	Pobegi
00050000-5548-cfcf-af6b-c038405fc2a8	8312	Podbočje
00050000-5548-cfcf-a99f-b5b12112af80	5243	Podbrdo
00050000-5548-cfcf-0e8e-fd9baa47ca2b	3254	Podčetrtek
00050000-5548-cfcf-d800-9e24624c3b29	2273	Podgorci
00050000-5548-cfcf-8aae-76f6388ee470	6216	Podgorje
00050000-5548-cfcf-8213-f21953cc2588	2381	Podgorje pri Slovenj Gradcu
00050000-5548-cfcf-0a4c-d240a7ef2a58	6244	Podgrad
00050000-5548-cfcf-ae78-4bb1092ecec8	1414	Podkum
00050000-5548-cfcf-bbb7-55ecd76aa6e9	2286	Podlehnik
00050000-5548-cfcf-cfcb-484512a3a0b1	5272	Podnanos
00050000-5548-cfcf-c97b-819537ca2fd2	4244	Podnart
00050000-5548-cfcf-1cf1-0f9b781014d3	3241	Podplat
00050000-5548-cfcf-84a6-c0c08e836ec6	3257	Podsreda
00050000-5548-cfcf-db07-b830728ad3c4	2363	Podvelka
00050000-5548-cfcf-1dfa-5e0174e7549e	2208	Pohorje
00050000-5548-cfcf-f8e3-812d4b6586c8	2257	Polenšak
00050000-5548-cfcf-e88c-785a9825a339	1355	Polhov Gradec
00050000-5548-cfcf-ebca-02f56bab490b	4223	Poljane nad Škofjo Loko
00050000-5548-cfcf-8013-5f400c1ff01f	2319	Poljčane
00050000-5548-cfcf-65ce-fe7ee87a7034	1272	Polšnik
00050000-5548-cfcf-3532-3baf79925053	3313	Polzela
00050000-5548-cfcf-21ea-54c11b0a2387	3232	Ponikva
00050000-5548-cfcf-e5a5-186c13775a8b	6320	Portorož/Portorose
00050000-5548-cfcf-27fb-37edd4b71634	6230	Postojna
00050000-5548-cfcf-52b6-7e48261b8ffd	2331	Pragersko
00050000-5548-cfcf-ea4a-5a2a90b8fc47	3312	Prebold
00050000-5548-cfcf-e4d6-7f69d1f69baa	4205	Preddvor
00050000-5548-cfcf-0e70-d22c0d3c6fb5	6255	Prem
00050000-5548-cfcf-8393-92d8c9ac94eb	1352	Preserje
00050000-5548-cfcf-f98f-ba612f8eba30	6258	Prestranek
00050000-5548-cfcf-e4cf-e4bafe38b0a4	2391	Prevalje
00050000-5548-cfcf-a496-79601ad7ef4d	3262	Prevorje
00050000-5548-cfcf-e83b-e0e0c4174bdd	1276	Primskovo 
00050000-5548-cfcf-18f5-57a3c2c59389	3253	Pristava pri Mestinju
00050000-5548-cfcf-89e2-b9bdf6129153	9207	Prosenjakovci/Partosfalva
00050000-5548-cfcf-0beb-a94c20e31741	5297	Prvačina
00050000-5548-cfcf-7bae-d00632d82c57	2250	Ptuj
00050000-5548-cfcf-48c7-74b3e26eab75	2323	Ptujska Gora
00050000-5548-cfcf-da59-cb98b4afa7bf	9201	Puconci
00050000-5548-cfcf-47e7-3c7d931f300b	2327	Rače
00050000-5548-cfcf-855e-0a42c1b675a3	1433	Radeče
00050000-5548-cfcf-dfa0-7dd3eb1aaeba	9252	Radenci
00050000-5548-cfcf-ee3d-0ecb28ec8b20	2360	Radlje ob Dravi
00050000-5548-cfcf-cb91-a90658a6576e	1235	Radomlje
00050000-5548-cfcf-43aa-8a0052b541d1	4240	Radovljica
00050000-5548-cfcf-7a8d-539773c824dc	8274	Raka
00050000-5548-cfcf-fa65-74dd232c08dc	1381	Rakek
00050000-5548-cfcf-c0c5-baf40c5cb2bb	4283	Rateče - Planica
00050000-5548-cfcf-0878-3e85c5c7af6f	2390	Ravne na Koroškem
00050000-5548-cfcf-a270-e67435bfc5d9	9246	Razkrižje
00050000-5548-cfcf-4614-0bc098083fa1	3332	Rečica ob Savinji
00050000-5548-cfcf-7b37-23532c4b5553	5292	Renče
00050000-5548-cfcf-7f18-d6c6b1054963	1310	Ribnica
00050000-5548-cfcf-ce4e-8200f8e9eeec	2364	Ribnica na Pohorju
00050000-5548-cfcf-b3e3-611480667d60	3272	Rimske Toplice
00050000-5548-cfcf-1df3-18c3500d1227	1314	Rob
00050000-5548-cfcf-7289-4f6855be2216	5215	Ročinj
00050000-5548-cfcf-840a-903c0fece2b6	3250	Rogaška Slatina
00050000-5548-cfcf-3824-9e6a3bf24d0a	9262	Rogašovci
00050000-5548-cfcf-813a-62f335f6a4bc	3252	Rogatec
00050000-5548-cfcf-4922-5337ecb60c75	1373	Rovte
00050000-5548-cfcf-714f-9e540d607d84	2342	Ruše
00050000-5548-cfcf-c629-9ba80ae6c974	1282	Sava
00050000-5548-cfcf-569c-a5fdd9b3e57a	6333	Sečovlje/Sicciole
00050000-5548-cfcf-ee09-7b185ead7587	4227	Selca
00050000-5548-cfcf-023f-a1b7bec4361a	2352	Selnica ob Dravi
00050000-5548-cfcf-2297-49eecea83a02	8333	Semič
00050000-5548-cfcf-43e6-a67ce6b32f3b	8281	Senovo
00050000-5548-cfcf-7920-53711327f435	6224	Senožeče
00050000-5548-cfcf-b7a7-529e6bda42d4	8290	Sevnica
00050000-5548-cfcf-bb2b-b10f339fe5c8	6210	Sežana
00050000-5548-cfcf-d8d9-bb0d45cb450d	2214	Sladki Vrh
00050000-5548-cfcf-8b66-013ad9c26ddf	5283	Slap ob Idrijci
00050000-5548-cfcf-c931-3eab52e0b49b	2380	Slovenj Gradec
00050000-5548-cfcf-4eea-53032a095ec5	2310	Slovenska Bistrica
00050000-5548-cfcf-24cf-84405df7f825	3210	Slovenske Konjice
00050000-5548-cfcf-769b-8ab2b9132aea	1216	Smlednik
00050000-5548-cfcf-46bd-50e0b03b588e	5232	Soča
00050000-5548-cfcf-9518-8ef11485ef6b	1317	Sodražica
00050000-5548-cfcf-cbc8-4a260df3108b	3335	Solčava
00050000-5548-cfcf-679b-9959452cca54	5250	Solkan
00050000-5548-cfcf-e5ea-cd238fe59e46	4229	Sorica
00050000-5548-cfcf-b365-676a902bab24	4225	Sovodenj
00050000-5548-cfcf-a06e-48db30124c59	5281	Spodnja Idrija
00050000-5548-cfcf-ff71-9a8b7614dd26	2241	Spodnji Duplek
00050000-5548-cfcf-8ddc-17fd5599750a	9245	Spodnji Ivanjci
00050000-5548-cfcf-d50e-538f32b98df4	2277	Središče ob Dravi
00050000-5548-cfcf-0fde-e425e97dc305	4267	Srednja vas v Bohinju
00050000-5548-cfcf-2522-29892e77c15e	8256	Sromlje 
00050000-5548-cfcf-3c47-09c98bdb1912	5224	Srpenica
00050000-5548-cfcf-aac2-960755df0990	1242	Stahovica
00050000-5548-cfcf-4aad-b838b722ef1f	1332	Stara Cerkev
00050000-5548-cfcf-9422-05669e5884f8	8342	Stari trg ob Kolpi
00050000-5548-cfcf-998e-5073b72f5921	1386	Stari trg pri Ložu
00050000-5548-cfcf-f08b-6b3c462076f0	2205	Starše
00050000-5548-cfcf-ce6d-ff7a4f7a98d8	2289	Stoperce
00050000-5548-cfcf-b93f-2b4f170b56e3	8322	Stopiče
00050000-5548-cfcf-4a8e-472b938c52db	3206	Stranice
00050000-5548-cfcf-45d1-74465b0cedf6	8351	Straža
00050000-5548-cfcf-0e78-ec8b4d678d23	1313	Struge
00050000-5548-cfcf-1417-12587131bf40	8293	Studenec
00050000-5548-cfcf-23dd-ce898d65ad78	8331	Suhor
00050000-5548-cfcf-8465-e26254a58fa9	2233	Sv. Ana v Slovenskih goricah
00050000-5548-cfcf-6b6b-bb072bfaafdf	2235	Sv. Trojica v Slovenskih goricah
00050000-5548-cfcf-81e9-9aa7f5b271b9	2353	Sveti Duh na Ostrem Vrhu
00050000-5548-cfcf-d61a-5875545bcdd1	9244	Sveti Jurij ob Ščavnici
00050000-5548-cfcf-60e0-9ff362e589a5	3264	Sveti Štefan
00050000-5548-cfcf-0d0c-0088836ea336	2258	Sveti Tomaž
00050000-5548-cfcf-44c2-8f7c58ec3228	9204	Šalovci
00050000-5548-cfcf-a490-cae678e46ddf	5261	Šempas
00050000-5548-cfcf-8d04-3d75e1d42102	5290	Šempeter pri Gorici
00050000-5548-cfcf-1493-bab01c45a73a	3311	Šempeter v Savinjski dolini
00050000-5548-cfcf-e8f2-41a15abf4c51	4208	Šenčur
00050000-5548-cfcf-dc46-fdccedd6cdc2	2212	Šentilj v Slovenskih goricah
00050000-5548-cfcf-3426-366c1a21e8fc	8297	Šentjanž
00050000-5548-cfcf-afbe-a4fd8a676855	2373	Šentjanž pri Dravogradu
00050000-5548-cfcf-f9f9-e1f8e92098cf	8310	Šentjernej
00050000-5548-cfcf-9122-fddb43405bb6	3230	Šentjur
00050000-5548-cfcf-596a-7617bec9e260	3271	Šentrupert
00050000-5548-cfcf-e786-6120fe43691e	8232	Šentrupert
00050000-5548-cfcf-92a4-d97d4a4da9f5	1296	Šentvid pri Stični
00050000-5548-cfcf-b08e-d508294f5749	8275	Škocjan
00050000-5548-cfcf-9611-5b291f13f88b	6281	Škofije
00050000-5548-cfcf-187b-34fac926625e	4220	Škofja Loka
00050000-5548-cfcf-6195-74fdf835959a	3211	Škofja vas
00050000-5548-cfcf-8183-a35ade40dcb0	1291	Škofljica
00050000-5548-cfcf-1e1e-95f6563bde14	6274	Šmarje
00050000-5548-cfcf-c956-7a0856267536	1293	Šmarje - Sap
00050000-5548-cfcf-f3f6-d29ba0108139	3240	Šmarje pri Jelšah
00050000-5548-cfcf-d3f7-5b9780a04839	8220	Šmarješke Toplice
00050000-5548-cfcf-cb97-0cfacec81f1c	2315	Šmartno na Pohorju
00050000-5548-cfcf-2634-2755b95dd9b1	3341	Šmartno ob Dreti
00050000-5548-cfcf-76d1-94e2d4537438	3327	Šmartno ob Paki
00050000-5548-cfcf-bb33-52180e0ae8f2	1275	Šmartno pri Litiji
00050000-5548-cfcf-aa6e-a3f143dc87bc	2383	Šmartno pri Slovenj Gradcu
00050000-5548-cfcf-8ace-c67e1027b4e5	3201	Šmartno v Rožni dolini
00050000-5548-cfcf-e400-af00a6eeb0b8	3325	Šoštanj
00050000-5548-cfcf-e4c3-80dc4af46f6d	6222	Štanjel
00050000-5548-cfcf-a45f-204044aa7161	3220	Štore
00050000-5548-cfcf-4f81-5273678adb34	3304	Tabor
00050000-5548-cfcf-ce0b-66bdc3822049	3221	Teharje
00050000-5548-cfcf-25b0-3258991b51c4	9251	Tišina
00050000-5548-cfcf-b79d-db57905f6493	5220	Tolmin
00050000-5548-cfcf-7eaf-cc68732a8ed0	3326	Topolšica
00050000-5548-cfcf-e7c1-1c0c66c5bdda	2371	Trbonje
00050000-5548-cfcf-db46-b28797b804e9	1420	Trbovlje
00050000-5548-cfcf-4ab9-9143de3ab380	8231	Trebelno 
00050000-5548-cfcf-617e-61782c1fdd2f	8210	Trebnje
00050000-5548-cfcf-ac51-bd9f8028ffac	5252	Trnovo pri Gorici
00050000-5548-cfcf-08d5-40177a7506eb	2254	Trnovska vas
00050000-5548-cfcf-bb5e-6ef3e085dded	1222	Trojane
00050000-5548-cfcf-8cf2-2a6e8921d35b	1236	Trzin
00050000-5548-cfcf-b45b-3383f8b13aa0	4290	Tržič
00050000-5548-cfcf-eb16-7dd353e50dcc	8295	Tržišče
00050000-5548-cfcf-4d9f-5790e8842b48	1311	Turjak
00050000-5548-cfcf-e498-c436ad40e837	9224	Turnišče
00050000-5548-cfcf-37d2-f35d8a2e7b2e	8323	Uršna sela
00050000-5548-cfcf-c281-25ad673e726a	1252	Vače
00050000-5548-cfcf-ecc1-f6fb60bab62b	3320	Velenje 
00050000-5548-cfcf-d5ab-bbcf518d6f26	3322	Velenje - poštni predali
00050000-5548-cfcf-592f-c3df931840ec	8212	Velika Loka
00050000-5548-cfcf-0fb3-254d65ea4627	2274	Velika Nedelja
00050000-5548-cfcf-4458-ec532eca9097	9225	Velika Polana
00050000-5548-cfcf-f62c-8bee8b5abe79	1315	Velike Lašče
00050000-5548-cfcf-48fc-affdb438cb61	8213	Veliki Gaber
00050000-5548-cfcf-ddb1-228842addd9e	9241	Veržej
00050000-5548-cfcf-116e-8d35beebfc00	1312	Videm - Dobrepolje
00050000-5548-cfcf-c13c-8061baa9e0ba	2284	Videm pri Ptuju
00050000-5548-cfcf-57a4-f0c5b50af87c	8344	Vinica
00050000-5548-cfcf-86dc-904885adddc8	5271	Vipava
00050000-5548-cfcf-744e-9ee2664d171c	4212	Visoko
00050000-5548-cfcf-423b-c8d47e85f45c	1294	Višnja Gora
00050000-5548-cfcf-03e8-62ed5d04bbec	3205	Vitanje
00050000-5548-cfcf-ab91-a4847a6479db	2255	Vitomarci
00050000-5548-cfcf-ba3c-79b262e93902	1217	Vodice
00050000-5548-cfcf-94c4-728cf2c886e5	3212	Vojnik\t
00050000-5548-cfcf-804e-0c7d18dacdd2	5293	Volčja Draga
00050000-5548-cfcf-5b52-16d39b48ac79	2232	Voličina
00050000-5548-cfcf-2357-0d0dde7a2656	3305	Vransko
00050000-5548-cfcf-78b0-3ffd6111bb11	6217	Vremski Britof
00050000-5548-cfcf-7280-d0d8531eb1db	1360	Vrhnika
00050000-5548-cfcf-56a8-f47980a8e818	2365	Vuhred
00050000-5548-cfcf-6866-a8fe2fffde8f	2367	Vuzenica
00050000-5548-cfcf-b259-f735f24e2c32	8292	Zabukovje 
00050000-5548-cfcf-b437-6a81dc011fdb	1410	Zagorje ob Savi
00050000-5548-cfcf-14bf-562fe3041e1b	1303	Zagradec
00050000-5548-cfcf-b530-3714ccd19377	2283	Zavrč
00050000-5548-cfcf-eaf7-9dd86ff83792	8272	Zdole 
00050000-5548-cfcf-d9d7-10104c23cc29	4201	Zgornja Besnica
00050000-5548-cfcf-8790-0361a07d31c7	2242	Zgornja Korena
00050000-5548-cfcf-c431-6a4225cd59e6	2201	Zgornja Kungota
00050000-5548-cfcf-0f94-0fa45134fbcb	2316	Zgornja Ložnica
00050000-5548-cfcf-5021-5af6b592c075	2314	Zgornja Polskava
00050000-5548-cfcf-bb5a-4377fddaa31a	2213	Zgornja Velka
00050000-5548-cfcf-2edf-7a7315c3b5c5	4247	Zgornje Gorje
00050000-5548-cfcf-2a27-ab4083acfe04	4206	Zgornje Jezersko
00050000-5548-cfcf-72f4-906e2b650bd1	2285	Zgornji Leskovec
00050000-5548-cfcf-6e01-908e1b7926b4	1432	Zidani Most
00050000-5548-cfcf-4227-715bfb7c4977	3214	Zreče
00050000-5548-cfcf-2b50-eebfe6885623	4209	Žabnica
00050000-5548-cfcf-1b71-9656d53ec437	3310	Žalec
00050000-5548-cfcf-c239-ba36c8a496a1	4228	Železniki
00050000-5548-cfcf-f415-d23eadde4524	2287	Žetale
00050000-5548-cfcf-300c-c8f01cd3084e	4226	Žiri
00050000-5548-cfcf-c31c-08ae6b851512	4274	Žirovnica
00050000-5548-cfcf-bc88-ae00e4f3627f	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 2320223)
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
-- TOC entry 2642 (class 0 OID 2320046)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 2320112)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 2320235)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 2320340)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 2320384)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 2320264)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 2320208)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 2320198)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 2320374)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 2320330)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 2319911)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5548-cfd0-2a64-38823f713ab6	00010000-5548-cfd0-2aaf-66a4afed51f7	2015-05-05 16:12:32	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROQs40iWZ/jFHv1Jw/vTlpV0/JjtcCQQK";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 2320273)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 2319952)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5548-cfd0-db83-c1eb5a90bb9e	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5548-cfd0-4c94-29fdd1847e4b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5548-cfd0-2f35-8dd549e3afb9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5548-cfd0-9ea5-02248dd955bf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5548-cfd0-e8dd-8ef490128db9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5548-cfd0-ac12-98c9d0988a7a	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 2319935)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5548-cfd0-2a64-38823f713ab6	00020000-5548-cfd0-9ea5-02248dd955bf
00010000-5548-cfd0-2aaf-66a4afed51f7	00020000-5548-cfd0-9ea5-02248dd955bf
\.


--
-- TOC entry 2668 (class 0 OID 2320287)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 2320229)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 2320179)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 2320011)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 2320185)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 2320365)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 2320081)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 2319921)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5548-cfd0-2aaf-66a4afed51f7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO9lqlJi2TdXRaLsippayiKI0F7kILGKG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5548-cfd0-2a64-38823f713ab6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 2320415)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 2320127)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 2320256)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 2320322)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 2320155)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 2320405)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 2320312)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 2319976)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 2320454)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 2320447)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 2320364)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 2320145)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 2320178)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 2320107)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 2320308)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 2320125)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 2320172)
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
-- TOC entry 2365 (class 2606 OID 2320221)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 2320248)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 2320079)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 2319985)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 2320043)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 2320009)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 2319965)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 2319950)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 2320254)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 2320286)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 2320401)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 2320036)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 2320067)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 2320227)
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
-- TOC entry 2299 (class 2606 OID 2320057)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 2320116)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 2320239)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 2320346)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 2320389)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 2320271)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 2320212)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 2320203)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 2320383)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 2320337)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 2319920)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 2320277)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 2319939)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 2319959)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 2320295)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 2320234)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 2320184)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 2320016)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 2320194)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 2320373)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 2320092)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 2319933)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 2320429)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 2320131)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 2320262)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 2320328)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 2320167)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 2320414)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 2320321)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 2320152)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 2320038)
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
-- TOC entry 2378 (class 1259 OID 2320255)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 2320241)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 2320240)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 2320132)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 2320311)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 2320309)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 2320310)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 2320402)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 2320403)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 2320404)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 2320432)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 2320431)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 2320430)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 2320094)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 2320093)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 2320045)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 2320044)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 2320278)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 2320173)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 2319966)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 2319967)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 2320298)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 2320297)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 2320296)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 2320117)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 2320119)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 2320118)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 2320207)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 2320205)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 2320204)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 2320206)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 2319940)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 2319941)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 2320263)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 2320228)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 2320338)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 2320339)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 2320059)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 2320058)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2297 (class 1259 OID 2320060)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 2320347)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 2320348)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 2320457)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 2320456)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 2320459)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 2320455)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 2320458)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 2320329)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 2320216)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 2320215)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 2320213)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 2320214)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2246 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 2320449)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 2320448)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 2320126)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 2319987)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 2319986)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 2320017)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 2320018)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 2320197)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 2320196)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 2320195)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 2320154)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 2320150)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 2320147)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 2320148)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 2320146)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 2320151)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 2320149)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 2320037)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 2320108)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 2320110)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 2320109)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 2320111)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 2320222)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 2320010)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 2320080)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2257 (class 1259 OID 2319934)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2386 (class 1259 OID 2320272)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2266 (class 1259 OID 2319951)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2249 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 2320068)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 2320390)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 2319960)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 2320153)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2473 (class 2606 OID 2320590)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 2320575)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2471 (class 2606 OID 2320580)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2475 (class 2606 OID 2320600)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2469 (class 2606 OID 2320570)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2474 (class 2606 OID 2320595)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 2320585)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 2320505)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 2320685)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 2320680)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2490 (class 2606 OID 2320675)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 2320565)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 2320725)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2498 (class 2606 OID 2320715)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 2320720)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 2320665)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 2320760)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2507 (class 2606 OID 2320765)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 2320770)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2512 (class 2606 OID 2320785)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 2320780)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2510 (class 2606 OID 2320775)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2463 (class 2606 OID 2320540)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 2320535)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 2320515)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 2320510)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 2320490)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 2320695)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 2320605)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2449 (class 2606 OID 2320470)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 2320475)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2497 (class 2606 OID 2320710)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 2320705)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2495 (class 2606 OID 2320700)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2464 (class 2606 OID 2320545)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2466 (class 2606 OID 2320555)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 2320550)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2483 (class 2606 OID 2320640)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2481 (class 2606 OID 2320630)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2480 (class 2606 OID 2320625)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2482 (class 2606 OID 2320635)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2447 (class 2606 OID 2320460)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 2320465)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 2320690)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 2320670)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2502 (class 2606 OID 2320735)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2503 (class 2606 OID 2320740)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 2320525)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 2320520)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 2320530)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2504 (class 2606 OID 2320745)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 2320750)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 2320810)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 2320805)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2519 (class 2606 OID 2320820)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 2320800)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2518 (class 2606 OID 2320815)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 2320730)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2487 (class 2606 OID 2320660)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2486 (class 2606 OID 2320655)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2484 (class 2606 OID 2320645)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2485 (class 2606 OID 2320650)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2514 (class 2606 OID 2320795)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2513 (class 2606 OID 2320790)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 2320560)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 2320755)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 2320485)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2451 (class 2606 OID 2320480)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2454 (class 2606 OID 2320495)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 2320500)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2479 (class 2606 OID 2320620)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 2320615)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2477 (class 2606 OID 2320610)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-05 16:12:32 CEST

--
-- PostgreSQL database dump complete
--

