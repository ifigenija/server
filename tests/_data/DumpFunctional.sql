--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-22 20:53:02 CEST

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
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 865116)
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
-- TOC entry 225 (class 1259 OID 865600)
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
-- TOC entry 224 (class 1259 OID 865583)
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
-- TOC entry 217 (class 1259 OID 865499)
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
-- TOC entry 193 (class 1259 OID 865283)
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
-- TOC entry 196 (class 1259 OID 865324)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 865245)
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
-- TOC entry 212 (class 1259 OID 865449)
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
-- TOC entry 191 (class 1259 OID 865270)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 865318)
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
-- TOC entry 201 (class 1259 OID 865367)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 865392)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 865219)
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
-- TOC entry 180 (class 1259 OID 865125)
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
-- TOC entry 181 (class 1259 OID 865136)
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
-- TOC entry 184 (class 1259 OID 865189)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 865090)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 865109)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 865399)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 865429)
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
-- TOC entry 221 (class 1259 OID 865541)
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
-- TOC entry 183 (class 1259 OID 865169)
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
-- TOC entry 186 (class 1259 OID 865211)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 865373)
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
-- TOC entry 185 (class 1259 OID 865196)
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
-- TOC entry 190 (class 1259 OID 865262)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 865385)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 865490)
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
-- TOC entry 220 (class 1259 OID 865534)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 865414)
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
-- TOC entry 200 (class 1259 OID 865358)
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
-- TOC entry 199 (class 1259 OID 865348)
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
-- TOC entry 219 (class 1259 OID 865524)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 865480)
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
-- TOC entry 173 (class 1259 OID 865061)
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
-- TOC entry 172 (class 1259 OID 865059)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 865423)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 865099)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 865083)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 865437)
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
-- TOC entry 203 (class 1259 OID 865379)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 865329)
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
-- TOC entry 182 (class 1259 OID 865161)
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
-- TOC entry 198 (class 1259 OID 865335)
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
-- TOC entry 218 (class 1259 OID 865515)
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
-- TOC entry 188 (class 1259 OID 865231)
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
-- TOC entry 174 (class 1259 OID 865070)
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
-- TOC entry 223 (class 1259 OID 865565)
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
-- TOC entry 192 (class 1259 OID 865277)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 865406)
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
-- TOC entry 214 (class 1259 OID 865472)
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
-- TOC entry 194 (class 1259 OID 865305)
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
-- TOC entry 222 (class 1259 OID 865555)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 865462)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 865064)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2638 (class 0 OID 865116)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2684 (class 0 OID 865600)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 865583)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 865499)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 865283)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 865324)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 865245)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5537-ee02-80a7-f9b4a0eb4f8a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5537-ee02-79e3-d159c4298f30	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5537-ee02-0eb7-29384acb225a	AL	ALB	008	Albania 	Albanija	\N
00040000-5537-ee02-a5b4-18589531d939	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5537-ee02-7237-ecf592136bda	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5537-ee02-5514-8bf6258bc006	AD	AND	020	Andorra 	Andora	\N
00040000-5537-ee02-1d59-3dbf3062b742	AO	AGO	024	Angola 	Angola	\N
00040000-5537-ee02-574d-170f4e826fbc	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5537-ee02-3a3a-efe5cea910ba	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5537-ee02-5acd-01a609ed9805	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5537-ee02-d461-cce5ea8c67b8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5537-ee02-dc4f-8c5f716b550f	AM	ARM	051	Armenia 	Armenija	\N
00040000-5537-ee02-54fa-6444e64c025a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5537-ee02-214f-5c60e3535bb5	AU	AUS	036	Australia 	Avstralija	\N
00040000-5537-ee02-586b-1e5f0f242c3a	AT	AUT	040	Austria 	Avstrija	\N
00040000-5537-ee02-06d7-bdc80c3f02d4	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5537-ee02-da02-b8813fa7ddb5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5537-ee02-7733-5976e9c09854	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5537-ee02-04e6-c0b5ddad2913	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5537-ee02-8b43-9f174a780748	BB	BRB	052	Barbados 	Barbados	\N
00040000-5537-ee02-5f9d-ab5fa8eaec24	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5537-ee02-a23c-4135a8aecae3	BE	BEL	056	Belgium 	Belgija	\N
00040000-5537-ee02-fac6-7a237387792c	BZ	BLZ	084	Belize 	Belize	\N
00040000-5537-ee02-b0b1-8944673065cc	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5537-ee02-3634-65561a5fca7e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5537-ee02-9835-4fcd01cba737	BT	BTN	064	Bhutan 	Butan	\N
00040000-5537-ee02-fd5d-fcaa0c323194	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5537-ee02-a5bb-812a14141b9a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5537-ee02-c573-e8fff2706861	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5537-ee02-16c9-d44c13006c65	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5537-ee02-30f8-d652060feaba	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5537-ee02-23f4-4f6580b0eb38	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5537-ee02-5165-722f5b928622	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5537-ee02-a5ab-6aabb366f2be	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5537-ee02-f1bf-41a95c1d5421	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5537-ee02-b494-8d016cfff1e9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5537-ee02-356e-7fc2427525f7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5537-ee02-1162-c7f79da6ea51	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5537-ee02-ae53-a86725e20dd8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5537-ee02-2bdd-fb7349df7161	CA	CAN	124	Canada 	Kanada	\N
00040000-5537-ee02-8e9f-db69ea07ea00	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5537-ee02-a09b-08cb6b634eb6	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5537-ee02-89ca-ee8c9fd99fef	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5537-ee02-8473-c12029cac62c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5537-ee02-a26d-66e6412e0358	CL	CHL	152	Chile 	Čile	\N
00040000-5537-ee02-00c2-2fce0829a298	CN	CHN	156	China 	Kitajska	\N
00040000-5537-ee02-8f1f-3d12b8ca725d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5537-ee02-8b2c-3d7615c76c6b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5537-ee02-2d58-ab662b1409d5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5537-ee02-9b5d-e779157839e7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5537-ee02-1ffc-7c6ad931e5d4	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5537-ee02-0887-2c4d75ddfb4d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5537-ee02-22ff-7883946cac00	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5537-ee02-8ce9-4c6f0bf28f44	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5537-ee02-beb4-26a6063a7c30	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5537-ee02-6415-694a5444fb22	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5537-ee02-eb4d-6a6cd89ce96e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5537-ee02-6d1b-66da8ac4e623	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5537-ee02-f520-edd87ded6f41	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5537-ee02-28bd-c4c2fb4b99a2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5537-ee02-7339-67afb9966ba9	DK	DNK	208	Denmark 	Danska	\N
00040000-5537-ee02-cd00-5f9181348485	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5537-ee02-d36f-5c2b6cd453d7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5537-ee02-a440-1793819ba01a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5537-ee02-1a61-ded8ece2a396	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5537-ee02-069a-a44229e707d8	EG	EGY	818	Egypt 	Egipt	\N
00040000-5537-ee02-48cb-4a99ca45b81c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5537-ee02-b811-e50199b13f2c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5537-ee02-078d-00acb87e2f0d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5537-ee02-5f51-d71813d1c505	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5537-ee02-6101-1a9a02d70673	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5537-ee02-9396-1c1502691dd6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5537-ee02-9f9f-2d4f60fa891b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5537-ee02-38f5-aa3cf20d7dfb	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5537-ee02-abb2-cf97fdcde211	FI	FIN	246	Finland 	Finska	\N
00040000-5537-ee02-d26a-7af064d251c7	FR	FRA	250	France 	Francija	\N
00040000-5537-ee02-9e32-a5f2710bcd10	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5537-ee02-586f-751ae6275c93	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5537-ee02-19ca-af30a9a68133	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5537-ee02-9c1a-ccc47647b434	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5537-ee02-04e0-8f485a10d4db	GA	GAB	266	Gabon 	Gabon	\N
00040000-5537-ee02-2b01-f71f5427ad16	GM	GMB	270	Gambia 	Gambija	\N
00040000-5537-ee02-d88a-bf296f73dd0f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5537-ee02-260a-80a09be91b64	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5537-ee02-3e7c-cabf5f7f8694	GH	GHA	288	Ghana 	Gana	\N
00040000-5537-ee02-b98a-6364c7faf4b4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5537-ee02-265f-796e5c0e0eb0	GR	GRC	300	Greece 	Grčija	\N
00040000-5537-ee02-318e-5e8700126d5a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5537-ee02-0e49-1bb8356283ed	GD	GRD	308	Grenada 	Grenada	\N
00040000-5537-ee02-88ec-23b5d1e864f1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5537-ee02-7d49-58f2ef56b8ad	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5537-ee02-c7f2-7b9460aaba7b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5537-ee02-098a-f6c250d195eb	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5537-ee02-d7b3-15f166d2e028	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5537-ee02-f235-2146e6a813da	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5537-ee02-34ab-0feb626478c0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5537-ee02-4fad-cb8412045576	HT	HTI	332	Haiti 	Haiti	\N
00040000-5537-ee02-6234-e25c5b262031	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5537-ee02-56ba-d710b7cda26b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5537-ee02-0aa8-b0dc297afb14	HN	HND	340	Honduras 	Honduras	\N
00040000-5537-ee02-ee04-e3dad0cc52d9	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5537-ee02-646a-9e1aad28e86f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5537-ee02-d1af-3c58c1516832	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5537-ee02-13b8-c5f2c6494458	IN	IND	356	India 	Indija	\N
00040000-5537-ee02-1ec6-fdcdd3bbbe7f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5537-ee02-4cc3-db5194b094cf	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5537-ee02-1846-0dc2ed699551	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5537-ee02-78b1-b504a4d3a870	IE	IRL	372	Ireland 	Irska	\N
00040000-5537-ee02-3304-b91696d70a0c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5537-ee02-a467-07b88a6fb19c	IL	ISR	376	Israel 	Izrael	\N
00040000-5537-ee02-74e2-e9a272129ff9	IT	ITA	380	Italy 	Italija	\N
00040000-5537-ee02-2347-462916e63047	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5537-ee02-842c-48a9fb6331c7	JP	JPN	392	Japan 	Japonska	\N
00040000-5537-ee02-afe8-9a5a646a18a9	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5537-ee02-367e-24f82c312617	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5537-ee02-cae8-54b1aae6cb60	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5537-ee02-167f-61606e3e2c89	KE	KEN	404	Kenya 	Kenija	\N
00040000-5537-ee02-d52a-627460395ca4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5537-ee02-1cb2-a73ebc437a13	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5537-ee02-0378-15f12257dab7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5537-ee02-49b4-b26430217b25	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5537-ee02-a27f-0b2dc7819d95	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5537-ee02-cd61-6465a365bbe2	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5537-ee02-da0e-c070d5f28b6f	LV	LVA	428	Latvia 	Latvija	\N
00040000-5537-ee02-4929-258444f3d862	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5537-ee02-6deb-dbe44b10f4e5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5537-ee02-7fdd-450f7ecc5d7d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5537-ee02-3ccb-d6a3f9c3b486	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5537-ee02-10be-29da44afe0b9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5537-ee02-59cf-9971e7fedf1b	LT	LTU	440	Lithuania 	Litva	\N
00040000-5537-ee02-b0af-fc8c62989cb0	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5537-ee02-28d8-f5c8efcfb6e8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5537-ee02-63b2-a2c4b5fe7b27	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5537-ee02-010b-61161441e11f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5537-ee02-5a2b-9a8ec6e37822	MW	MWI	454	Malawi 	Malavi	\N
00040000-5537-ee02-4eed-55e7874e1acc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5537-ee02-9a54-760cb7717e6d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5537-ee02-04c9-cc3bbc03fab8	ML	MLI	466	Mali 	Mali	\N
00040000-5537-ee02-5f56-a9fc0803fbae	MT	MLT	470	Malta 	Malta	\N
00040000-5537-ee02-b600-172435a60144	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5537-ee02-ebc2-d17352fff2a7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5537-ee02-3ebc-0d21317e3c3e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5537-ee02-5c63-745b04406de3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5537-ee02-8941-bee8a748d3c9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5537-ee02-7292-9cad4dffe68b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5537-ee02-c7c3-062f5cc73bf9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5537-ee02-b11e-af3123247c53	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5537-ee02-2056-da5199b0e4b0	MC	MCO	492	Monaco 	Monako	\N
00040000-5537-ee02-1031-a8c4003b86d8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5537-ee02-5dd7-46f23f9b2367	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5537-ee02-39b6-6b209bffc3d8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5537-ee02-04eb-b0da5bbf248d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5537-ee02-6aa5-ecb81654daac	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5537-ee02-4878-06626bcebd25	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5537-ee02-d0de-609b2a4db2ad	NA	NAM	516	Namibia 	Namibija	\N
00040000-5537-ee02-13bf-e3683eb97585	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5537-ee02-29a8-0a5ab1b2c80e	NP	NPL	524	Nepal 	Nepal	\N
00040000-5537-ee02-5725-8543e0b2a7a6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5537-ee02-ed2d-25d18a557cef	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5537-ee02-c122-4d5e25935f06	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5537-ee02-fcef-6e69bbb248b6	NE	NER	562	Niger 	Niger 	\N
00040000-5537-ee02-b01c-d54ec88b5aed	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5537-ee02-65f5-799724e0a8fd	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5537-ee02-c6e1-5eb8075ae1fc	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5537-ee02-a5db-14fe551b6916	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5537-ee02-b25d-392fa5da2073	NO	NOR	578	Norway 	Norveška	\N
00040000-5537-ee02-fdb5-054543873f39	OM	OMN	512	Oman 	Oman	\N
00040000-5537-ee02-abba-f4ace9dc02c7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5537-ee02-bf68-e3c335cb46ec	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5537-ee02-3200-e4f42ec22d5c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5537-ee02-b919-8428a9a0d314	PA	PAN	591	Panama 	Panama	\N
00040000-5537-ee02-20e8-d74b35a43ceb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5537-ee02-0bbc-27b0bf23a670	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5537-ee02-dfd0-143a364b0358	PE	PER	604	Peru 	Peru	\N
00040000-5537-ee02-bdc8-77bb8fbd92d9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5537-ee02-c6ba-96dc7b630036	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5537-ee02-52d3-0cc4190a25e8	PL	POL	616	Poland 	Poljska	\N
00040000-5537-ee02-2888-4987ccb3d04e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5537-ee02-5cfa-3931174b7a73	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5537-ee02-c68b-78cd7bf6eb59	QA	QAT	634	Qatar 	Katar	\N
00040000-5537-ee02-2fa5-4f3082fd1c32	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5537-ee02-9836-a30011b01fbd	RO	ROU	642	Romania 	Romunija	\N
00040000-5537-ee02-55ac-75e43bd8a0ad	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5537-ee02-9023-8f1cbba64109	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5537-ee02-1410-ebd14391d919	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5537-ee02-8c97-85268052c3cc	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5537-ee02-2392-101bdb520829	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5537-ee02-100f-48a54104005c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5537-ee02-3587-dfc9cd3d2f9e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5537-ee02-e8ff-fea8a4b38b63	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5537-ee02-2d8f-0494f89fb6ad	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5537-ee02-a59f-59e906311bfb	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5537-ee02-6aee-92660eb1263a	SM	SMR	674	San Marino 	San Marino	\N
00040000-5537-ee02-8820-31a4ce1d2aa8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5537-ee02-1802-d92836ec11e8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5537-ee02-f541-c63c72300967	SN	SEN	686	Senegal 	Senegal	\N
00040000-5537-ee02-f4ca-6935742f7f0b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5537-ee02-1906-fa810a8337ff	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5537-ee02-dbb0-a5463c1462b1	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5537-ee02-ce63-7b7920b741f5	SG	SGP	702	Singapore 	Singapur	\N
00040000-5537-ee02-3644-8c5af27a4b23	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5537-ee02-54f3-0ad4b8fd0baa	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5537-ee02-c25b-ae69cea8af4d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5537-ee02-61a1-3554e88231f3	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5537-ee02-ff81-d5d77a7751cf	SO	SOM	706	Somalia 	Somalija	\N
00040000-5537-ee02-96ac-10ae71f5adde	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5537-ee02-94c6-8e22890838f5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5537-ee02-15dc-b4c31742a690	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5537-ee02-a1df-593efce58c62	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5537-ee02-33c7-bf97a6bf8462	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5537-ee02-dd02-cb6e85713871	SD	SDN	729	Sudan 	Sudan	\N
00040000-5537-ee02-f9da-6749010f2ff1	SR	SUR	740	Suriname 	Surinam	\N
00040000-5537-ee02-9270-ced10f7138b9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5537-ee02-0ee3-210cac512581	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5537-ee02-14a0-a890fe921202	SE	SWE	752	Sweden 	Švedska	\N
00040000-5537-ee02-406e-10b3329cce6a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5537-ee02-6951-2a50c162bcd3	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5537-ee02-e9c0-3dc5c43ba1d1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5537-ee02-f311-0605fc1a0b3a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5537-ee02-82c6-71b07abe333e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5537-ee02-6903-42c6d4ea9fab	TH	THA	764	Thailand 	Tajska	\N
00040000-5537-ee02-ac77-1fdb3dac0a44	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5537-ee02-7f8b-467ddab72801	TG	TGO	768	Togo 	Togo	\N
00040000-5537-ee02-c02d-27b8dacaba9d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5537-ee02-5345-caf4a41922da	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5537-ee02-d50e-7fa3226c908f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5537-ee02-9f56-d294c1c61cd0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5537-ee02-0406-fe7b52a1fd41	TR	TUR	792	Turkey 	Turčija	\N
00040000-5537-ee02-8ea7-38bb759054d3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5537-ee02-012b-5c1c118ad7af	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5537-ee02-fea3-da25955d332c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5537-ee02-b8fa-5b1fbd428023	UG	UGA	800	Uganda 	Uganda	\N
00040000-5537-ee02-c322-858ba2ceddcd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5537-ee02-143e-0573567b82a2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5537-ee02-b2cb-08cca654a8c1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5537-ee02-720f-eac27524e4a0	US	USA	840	United States 	Združene države Amerike	\N
00040000-5537-ee02-23dd-c87dd085e30a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5537-ee02-4507-d3eb0b7167a7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5537-ee02-78ce-3839bb14945c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5537-ee02-14a2-a2050feaeabc	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5537-ee02-3019-0b11d9073ac5	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5537-ee02-7dc7-708f1ef7702f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5537-ee02-432b-2f55b67d9d25	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5537-ee02-7f11-70460dcac49e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5537-ee02-97b2-50ba520f5919	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5537-ee02-b906-576ebf700afb	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5537-ee02-4c4d-05f83a7d38d0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5537-ee02-5990-21ef601c2f18	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5537-ee02-3a4f-c680637b6f50	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2671 (class 0 OID 865449)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 865270)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 865318)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 865367)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 865392)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 865219)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5537-ee04-39ca-11715b131d97	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5537-ee04-a60a-3fbb05745564	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5537-ee04-57fa-fabce2720331	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5537-ee04-25c6-e042f4fe80f5	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5537-ee04-7785-608c8506b8ec	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5537-ee04-1c41-d9c93bb8b3dc	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5537-ee04-9034-3e7c312d8e46	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5537-ee04-7c3e-85f22b4e033a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5537-ee04-39e6-d8e54ac2aee3	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5537-ee04-7671-597bd8741943	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2639 (class 0 OID 865125)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5537-ee04-cabf-8c5c9a46c664	00000000-5537-ee04-7785-608c8506b8ec	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5537-ee04-10a4-c69f9d08846f	00000000-5537-ee04-7785-608c8506b8ec	00010000-5537-ee04-5953-c416fa003915	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5537-ee04-d5ed-a90b512c46b5	00000000-5537-ee04-1c41-d9c93bb8b3dc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2640 (class 0 OID 865136)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 865189)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 865090)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5537-ee02-cd7c-ed914ae60d3b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-a02b-4e1355f18e81	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-405b-e76c439f4460	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-eda6-57cc540b0cd8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-8416-38f1a2af671e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-f9f1-a2c79d54776d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-714e-1db3071248ea	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-9ae0-51635ab1ff1e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-9d75-41f399d1a794	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-04ec-8cbc2c5e5235	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-c1dd-eec563407fc2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-1c12-c063fa7ee10d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-7c38-f915a5900d45	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-dd9c-315854060f7b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-89e3-860c73cda53b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-bf26-404401167b97	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-bcfa-71a3111c0e3e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-b8a9-f4ba5778fbe4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-bac0-2fb9cc207a38	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-5aab-7de63cb598fc	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-77fd-67ac52d4acb1	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-8107-57822bc384a5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-3fd1-13fb7bd840f2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-c176-8995943fd99c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-5a2d-90375c2b6f16	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-6400-a9062dbf0980	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-d5d4-e40d6cac2f67	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-82b2-c879bea17368	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-b2b6-8724f88e15c7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-a375-536563f572ca	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-4520-777bc8b4d041	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-2d85-70949e943852	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-f87d-4e428f86bd9e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-73a6-674fe9bd4e21	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-02b8-23bc9ad421ae	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-58b4-e56bd77aed97	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-22df-2444ef6adce8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-67f7-016fe59cf8b6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-1428-30e8a25efb8a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-b027-3ed12e37cf7d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-1a31-a8f3d6605d6f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-af9b-f75b82fb4a9b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-d368-4cede25f2202	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-f9bc-3656d4d1d5f4	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-f930-9fae2318bcc6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-e890-2078c68fa7f3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-d3d3-e362cfb8b3a5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-20fe-cbd9c91532e4	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-406a-81f086178608	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-49f8-7289e7f8328a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-e8cd-c06468a837d1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-f4c5-d0c2d4fba7d9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-991b-a97479283452	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-83d0-cb60178f70f0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-a634-7a63e8867097	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-26b4-d021e6dd718b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-f3ff-f30c9f55f887	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-c381-f90dbc273cb5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-ec3b-d0fbf34c2162	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-6650-82bd61539f05	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-5fed-04513981831b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-1f70-bfa9be2c1000	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-9946-a79ef58084f5	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-3439-a7d002e587e6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-2455-3dea05afc25d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-9573-add5f2e7054a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-504e-641caa501b56	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-5cac-e7cca10d90d6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-c9d4-825db1be9469	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-817c-2c68fbf62527	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-088a-27386dc5481d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-4b65-3c183230495f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-a223-bbafcc84efdc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-cc14-512b744cafdc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-0345-e8747fc226aa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-97c8-ea794394ecd3	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-bacf-0f73cd66fa3b	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-4c5b-a5fceee61d88	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-7701-cc14e3ab93b7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-28c5-776785915bec	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-52a6-ff850870e368	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-a387-1987d779b8e9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-c770-d43b7f63de81	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-c65e-8375821a4a03	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-f011-641ff64ae537	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-131a-c8b36f0f0bde	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-5fb3-1e7e0a352549	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-5d56-70fa666251d4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-5baa-06906f22fc26	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-8595-9dd4b843a86f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-c606-17e687cf4502	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-ac4f-c8e8c303f9d6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-1ada-f00ff1e84819	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-fd4d-1b5a99a5ae36	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-7912-9de2b94b7dfd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-6675-9284df48cceb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-797c-882064df6c11	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-c995-df0505a3d0b7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-2508-ca8a9d464b12	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-cba7-4c3d5ebc87f2	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-3f1e-ddccad50df64	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-4739-85ef84fde057	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-7cb0-44d22b20e385	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-3d26-8e7a1eeb9243	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-5e7e-c6c9dc4ce3fb	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-d6ff-cb45fcc5bc13	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-d5d7-cd338f65ca28	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-1056-b638a1a201b5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-8a28-84ab06f601c5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-427c-e6f7aa05501d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-ff1b-647c883608f5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-c13a-d164f0e47e2d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-4fac-fdcb2caa3591	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-3ee6-b29346c92a8a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-03a5-931138e413f8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-7b63-976252d17a10	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-b7b6-3db7518cfe0e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-0660-e05c762acb0e	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-e301-f749faeb23f5	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-8ab0-1152fcadddc8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-23f7-8bd2aabc5fe7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-02dd-2dc143914f03	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-0b07-a1320737e3b8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-786c-344327b6a9ee	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-fe58-b90aa8930105	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-b6f7-66872a42802a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-8a45-1001c2cd77b6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-2a85-7aac13f3bb66	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-6196-7fc48ae0106a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-f4fe-2ba8c9465eea	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-ee2a-80180b2df57c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-e859-8029d1115cbc	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-de66-9342599ad4f0	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-2f11-2dfc8178af16	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-9fab-200bb18ce2fb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-df14-318c301d2082	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-cfa6-54aaae547891	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-c3e4-a840949150ed	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-312e-0304a7c6376c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-b253-d4d8a134e5d6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-a684-37fe521f5447	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-d667-88c8bdef9871	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-1ec0-8abfff7c99a9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-f41f-423e197fa0c3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-5a61-d0c771658f2d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-c3a7-a4e832752257	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-1e01-87c2d3b22c4b	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-ee1f-88b3276e77c5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-6343-0b1831fd2584	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-c804-0b8e4b84cd17	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-138f-21f0c6191678	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-b9c9-a75e8bcae912	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-297c-e50376429d65	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-11dc-e1ff081c2470	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-ca5a-0d62912fbd2e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-49bc-fb861c6904a6	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-1874-b446ab6d53d6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-a160-9f131389173c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-cf81-8e62e4db136b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-4bdd-f852617d8afe	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-f4f4-719a6572e07a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-cd69-a4f450bf002e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-84f4-43c25d8c40ec	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-4003-a8009da8b923	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-3a0f-d1ec685d0b96	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-421b-b059d3a1a82e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-71b2-4d3cac2daa0d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-14cc-1baadfa19861	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-82c2-561c2642ffec	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-8e14-d92772652f8e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-65c8-d59ad1d83aa1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-0a0c-72fabba58b1b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-a861-16a6244ef7b9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-213b-1db84ccb84d6	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-a970-1327951c7c0a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-5266-228bc8dcfe92	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-db48-86a9890d601e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-363c-d78bc9a0254c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-fbef-00633a836ca3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-8b87-09956e970f33	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-c8a6-0de804f44fd4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-005b-e5722b713c11	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-844a-6980d6a0e9a4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-ff7f-55245717ea1a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-44af-f51496722b91	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-5b86-a44d57249307	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-aa07-ce1725f90225	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-f705-e41938c7aade	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-d52f-e5c78371ae13	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-972a-875228af431b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-0f68-c29e0d18347a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-cc9b-dba646bba718	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-2fad-70f0472e8dcd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee02-1834-632d4f2a7c71	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee02-63fa-63bf0e70b744	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee02-d88e-e683b5b87592	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee02-559c-616272377cab	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee02-1867-a57602b769ba	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee02-c15b-3c381a446dbb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee02-7eb4-ec2864215ee2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee02-56c8-841fea221f48	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee02-cfe3-83b396a3567d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee02-a592-cb1368d9f26c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee02-b95c-f8924ad9a335	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee02-8300-7c42a7542fb6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee02-e2f1-e9f8782af683	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee02-6dfc-39cf5c2bc12a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-7884-0a26d2bed85c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-bbf7-8215636a5708	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-8b0d-40eb9225ebbe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-927e-e12d7705a458	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-9c88-538954fe0f1c	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-05d7-a122855395bd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-63af-f249d631a1ec	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-aa52-f71e42f82164	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-77a5-e5ca574e4520	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-ba1a-6cea4fa8ebe0	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-6166-2f255def8f3b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-de93-171689865d17	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-c7e1-64e23d84cffb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-ab9c-5b3898150ff5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-ea34-67cbb5df4444	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-07af-e3c6c207ce19	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-61ea-835c451ac552	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-7168-1b15a0ae6d68	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-93d9-4fda767e4f6f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-6bc6-b76f21a0c2f6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-7545-d83274f69f1c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-76e1-6329a7038f79	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-c9e3-66dc07048e48	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-a962-b79236355c55	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-c09d-72b1933ec613	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-8a7c-f5256456dc2a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-50e8-76729706e9ff	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-fc2e-1a58fa090103	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-d127-d04186d625f9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-cf3f-37fb9bfa6296	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-c674-c71b42846c08	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-c1fd-61603397f95b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-d5f4-f33f2938e64d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-80e6-729644d78dd6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-547f-5dde915597e6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-7446-38c783c0613b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-d174-ed84b0dc4163	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-12df-ff2eaa59deaf	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-3a70-6c68e695d3e5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-ad8e-1e226a963dc6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-f099-c9bb1a894f38	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-dcf1-4e635e490264	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-e840-fe7f3257e565	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-1b95-424d7f4e8379	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-047b-682f03bdf8cd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-3d27-412f502f0058	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-ddd0-4a5783fef451	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-03ff-90cc4b6444df	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-6c4e-abca57f9a257	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-9835-d1229730d88a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-54b7-7bd5887862e9	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-0495-e194fc8f9f2c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-7e72-5fb60fa5663c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-a03c-e0a4b02a8235	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-48ea-888b06a20377	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-618c-a81aa8748986	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-6224-078c6a966d4e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-bb1d-1ae39f484345	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-3610-1039b4df82b4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-0eaa-8688fc52f8ed	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-dea7-235332204716	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-1e45-d706838a0c84	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-321c-cb8b6e76717a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-c98e-90a546520446	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-2f8c-cc412d5339d7	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-cfd0-30a418dbcf75	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-23d2-80b49ab3ab5e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-2dc3-25c73f87f4fe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-6574-7391d31ed5d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-2760-659a678053c8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-d38d-ba28bf246dd9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-f829-f665e9f7d2cf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-718c-9508a9556d60	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-63f2-cfb77c42963c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-5749-475503e7652b	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-be20-0604a37c98e3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-bab9-40db6c0b14d1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-862f-bf65a00176b5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-1a2a-d98074f61033	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-10e5-66c1a901626a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-368f-238c1c91033b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-1580-d5f2d6cf883a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-3ebe-5fdba7b8d1da	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-207f-9665513e6611	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-adbe-d64123575830	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-bfae-686843c4f167	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-a643-8695232f4657	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-86ee-d0294d0a2f85	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-6e27-eb9054606499	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-4f91-2e0f415060a9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-ba34-5a848f63b149	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-3d36-58a96edbe3ac	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-27c0-7941a826c781	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-5e69-89a80f4e9874	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-5202-ec1e96a52034	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-5777-6c63ebe3c3d6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-3f6c-7c3c040c8146	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-0e51-7f3c5e7accb7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-0d3e-3f22e4cc5998	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-fabf-f23a736420c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-c374-924dfcf515f1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-7943-3e3396f89fff	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-5287-b8d6243dbd6b	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-3542-ac75485083fd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-b1c9-5c83edebd794	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-b274-ac305923cc0f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-33a8-923fbe16d5ef	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-2e0b-15fc3640c039	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-eebf-3e44a8a84eac	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-03bd-ba639c07ac08	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-0d38-96c8263fab45	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-117c-6ddbc21e6525	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-f373-a8e13bfd227b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-49ce-f8632f2dfa03	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-6742-ef53b42000e9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-457e-4ee0c59c04cb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-a29b-95fb260986fd	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-2ec6-42ff2e64f1b6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-bc2d-8af1ff0607e1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-0ef3-097b5d41ed3f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-cde7-48e90259bd9a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-c6fe-54e4d1750457	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-0ab3-94947b2f093d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-657f-c64f820d2912	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-f0e5-faf0d05d2545	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-303a-a94881cc1c99	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-e02f-bf377e280760	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-3153-73cbf9faf6e5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-59e4-ac5089d95e1d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-1f3d-af43afeb81e5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-8184-861d13a4ace7	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-4aaa-2e983d0f0972	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-7320-a4ed342b1040	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-5dcd-b886686804c6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-8976-931f6b744aa5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-f147-b999c9d793a0	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-b784-ea1d6dbd033e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-9a68-d1f941acd2e6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-f4c7-ca6fd366bde9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-abe2-d66f66858201	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-1344-5cadfa1a1f04	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-0d37-7eb30411f8b8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-e6cf-ff1d485472c9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-a352-aa1bd0408e16	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-7a67-4bcad3910ce4	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-ef20-a7c7787d5f19	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-0adb-f9f192efce6b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-4e9f-be03dd59d234	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-7fec-4a9ee3df69ae	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-8e8e-8cd0fb320d9c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-a94d-7338e8a2074a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-2f32-e5efec296a24	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-6a67-75f04caa5e82	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-32a4-cb0b2e0ec2f9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-530c-7983fca5b2f5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-adb7-98a3742993e7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-6333-64392186c659	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-2973-eefb21b633fd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-1f81-64c9d00da7d1	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-d84c-27a6aa41a8dc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-f852-ad9da60e99c6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-767b-29b5e27dd449	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-03c0-820517b45879	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-d52e-3fd5eafb51a0	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-fc66-5a5887b4a033	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-c10d-fbcb56af6e62	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-9eff-3bcc42f29f25	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-2338-733c381b9321	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-3101-743e30bb1969	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-92a2-d7ba8ff92ce2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-53bc-fbed4bfa65ef	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-12a1-61e1c86cddd6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-0bda-d77da5741d1a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-fca4-9fad25d0e08d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-2c42-82604baea7b4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-34f8-e41ec7f45a74	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-8073-1777ed338b24	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-4451-1aaf249690de	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-15f2-fe4fe540a2b2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-4de0-513b42558b34	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-2d19-1bced1089141	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-0c05-9cfd4170e1a0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-3ff8-3b0cd4ff094a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-dce0-3edd9e29eafa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-b8c4-aff7df0c7b0b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-3afd-bbe2c9efaada	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-8645-906ae6fb7851	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-2b5f-d69e55826a82	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-6b18-7e3ea025d694	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-993d-a85d0d31da04	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-d951-e09f434c0928	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-ced1-2588f05c9ede	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-ba13-221d860e8ed6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-c427-cc8847c9e3ad	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-8cc0-718bb7e4e1be	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-a560-90a0c9220121	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-df28-a7e69d012ca0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-8c7a-17f0898eeb15	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-29e7-a110bdbc89a4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-5de9-a84f11b19199	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-80a3-cc015373d12c	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-7ed4-6f779bca92e4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-a38d-edc04ced53f7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-6843-bbfc3b562f06	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-a658-4a9875b0eb86	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-7fe5-84cecb9b2d06	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-e5f7-f39c334a653b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-946d-223848ef40ed	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-5743-d27bd3de39cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-0e28-85ec2e00e4c2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-e65c-e9c88688976a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-6104-94c67f939563	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-1b69-2e7f0f358ccf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-f102-878d90f0080f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-66bf-9514134f9053	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-c7b4-70e20f972e16	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-7f36-41e1820a3b83	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-9ee5-47acfaa6a38c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-35d7-64ce3de8bdb1	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-f208-be4d6e40bfe1	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-4aff-74121df67e93	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-79b4-024f544239f3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-3501-e1b0e97863aa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-718c-7769c067a83e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-0b70-17d3d8fc75ac	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-c028-742dd1569874	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-c0ef-a551f671ecb6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-d458-c523dcefeae6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-4c87-48a1c5c88c19	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-ecd2-181b9abd8342	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-0c67-3490fac7cc64	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-63fd-f89abd585e6f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-afa1-40dfcd0fc1f4	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-5f26-374ec06377e8	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-6655-646db2c7ed15	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-1fed-88583dab7079	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-6f2d-4ab5375b1efd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-224a-ef15b41962d5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-82f2-52b7acebabb8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-98e0-f15fe608e37c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-7938-0273a3514021	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-415a-d3bfd59a5ecc	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-3382-4d765c2ec6d3	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-d3cb-8f05ff8ed7d7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-32be-f54becff8552	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-7dc3-ef1dad5111c7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-2aaf-abb833d3f33c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-f582-c66a4b6f6574	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-10e0-7f79b0828852	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-aea8-348479b10b8e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-7cc1-5f19645109e9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-4e76-19697a6cc5d8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-fd25-d0a7e6c31f35	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-382c-1773c8fcc88c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-46ac-a8ee58de1cc7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-09c1-3af5217d1b00	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-e9d7-3d8cea17b2d8	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-d456-640f992996a7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-deec-ba9636f1497a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-9973-592f8b1634da	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-8f10-32fdcc3a1c9b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-3ec7-835529b29746	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-9d41-405cad6d2851	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-9a02-9623f1349b5e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-df34-c1436f0e00f0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-a0e0-0b70cba751e5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-c5bb-c73b4e77fa02	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-ca21-a5bb274cddd3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-8f8f-d87f8dc0d960	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-a6f1-8b58d13243e1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-ef95-7cbb875047cd	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-8a76-8c5b257645c7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-5914-427d427756ca	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-c83d-26b7493fb7aa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-3cc1-9b971543d5e5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-6e48-d2bc0a373797	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-0123-46495a84fb3c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-d90b-11f8c4cf4bdd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-005b-d3b88e2cbbc6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-85e5-5ab3828e02cd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-c6bf-2041be8b3dea	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-dad4-c80869636191	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-edac-958a2a09915f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-3824-d70d14f299c5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-bf88-1f140ad9485b	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-584b-52c0938a124e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-1669-f8a4ff0a68b8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-ab2d-39477426d02d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-4437-383a3e2300eb	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-0734-8655ace2cd3c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-0ff9-dd0a952ba8cf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-a10f-17f8956f9707	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-f2d2-3ad847dd6766	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-c633-415ac2c6d968	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-2093-2f935b083f95	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-705f-2ac89cf2bd88	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-5c06-d3ccd896f755	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-23d6-fcf58350cf68	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-6791-4a7857b64764	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-3d6d-4a4e27ca94fa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-9c9b-14b051ef1c74	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-b863-5db8d1205055	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-8a54-00e9950afc83	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-6d12-6a5a8aeabf52	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-8332-9865d1cb904e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-8542-4469ecbec3ba	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-b83b-5160e15ffd4a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-9459-8bc4c5e43c84	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-648c-5645028be117	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-71a4-96767d14ac00	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-32c6-2936c6d89b70	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-267d-3812674eb15a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-836f-d09d306551da	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-47cd-369810cb590c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-af28-f473de727410	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-56ca-6a6698bfc578	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-531a-75565472dd04	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-9f3f-3b2e9cd4773b	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-bfa4-3eb9458490fd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-6a51-7cf0a66073ea	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-0186-6715bc6edcd0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-3c6d-72799cc41428	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-db45-8f8eaa405207	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-7eae-5c97f8e7f6cd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-4f4a-b08a66599540	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-ee5f-4e9e16e1a9ed	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-617e-b90160020d63	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-d6bf-fd4d656d88ca	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-0972-025d42274f74	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-9195-498aa62b60cd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-0b8f-69e2d0627bad	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-0cdf-c64fb95d32e1	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-99fe-f4ef63f8e308	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-3831-149190896b10	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-5604-0b7ec11b4e2a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-94d8-ac7256c356ae	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-e4e2-e6837fbac359	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-5b45-ff71ce70b265	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-bf1b-1d487965b2c5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-630e-e64efaf6980e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-6e86-08824373c637	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-0beb-60e4445b455c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-8d3b-959770c80c47	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-2e62-4fe3931c89d2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-89d6-338d0ce74a2e	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-f56c-5bc0ed6cade9	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-9824-449d87897457	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-7914-ee40d0d285bb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-f352-d2c6e8c05a89	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-6d7b-af829ad0b6d5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-5188-36a090f53168	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-e913-2146ffbe4696	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-313c-45c682f3739c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-f42b-b3fae925c16d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-cf1b-62743be2dd02	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-3586-b3907bd1de48	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-45b1-36a97655037c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-01b1-79c00e498748	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-664e-8d5979843cbe	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-9340-2e19b460969a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-a7f8-74aa1bbd40e4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-5255-1988eb759678	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-9684-b25792b195b1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-fd8a-a2917e1a6761	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-d136-f3eeb964074c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-1e7c-03587535fadf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-c874-5108fe7a5d3c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-4297-f3fdeba4c092	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-37df-fe3cbf98f4a8	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-1bc1-4d8c437527b4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-70b1-2840c4f1774c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-1768-46bcd574ba69	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-ca52-93a6ae9ec274	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-70c0-39c4e155f110	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-a9c3-b98091fdfa29	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-7660-fa33744b99ec	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-9adb-131e6213613e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-5079-0cf308ecc163	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-e67d-8b3914d41230	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-7603-bbe127cfbc73	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-adb8-f09f74a90e59	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-bb8f-77c0e37036b5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-e02e-e7475f5d9136	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-1b96-f4ebf33c2dd1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-8a78-79225ae672cd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-65ab-3815fafbe139	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-d2bf-24914296b8c7	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-f55f-0e3f06a8c36f	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-b980-8c3ff5b1a992	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-2b49-9368a04accbd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-f7c9-c7e440fe3a70	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-f090-8cad34a1d76e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-19a4-8153ebb7aade	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-33c6-a1eaaabec9f0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-c5a7-f6fffdedfe0a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-7c20-06a9b2e3b543	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-2663-2ba4edb14d4e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-a86f-376ddc55581b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-cfe5-0e72c9e08b1a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-fcd0-f2d13156b643	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-e259-ffc0e47ad83c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-72c4-d4fb4a34a833	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-fba4-e675099f8e2b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-09d5-273d2b615bfe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-586e-5c870f7e9753	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-f50c-d4e31a204e8b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-02df-30f0b3368bb3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-01d8-3b2714635a49	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-6ac2-4bff8aa322a0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-bc5a-d59fdf42c79d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-86b2-8a66324bc7b0	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-0568-b1a6f1b2854e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-53e4-450d53cbb2a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-2add-3f665c5b466a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-b4f7-5f6abe5582f8	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-a508-d35489c796eb	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-95b3-1a6ea573a82b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-ddc5-1edc22a3049a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-5b0c-54e4e4f3df32	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-7fcf-fbe1c052e949	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-a164-21bc51d8af98	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-6b52-8a34050123a6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-0657-f6089dfa3efe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-acd8-b660a17213f5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-fa36-7c89f17f0f8e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-0864-f4059868ef75	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-2f08-5f02a7010984	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-ab1f-fce65261b711	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-aa49-de67b2dbc0da	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-8456-f488c85d38a8	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-a3e4-5f2a600657d9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-5a3c-224b63111229	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-f046-abfdb42b250b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-cf3a-95e3c36777ba	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-6db6-3244dff0b590	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-671c-9f46138a8ab3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-f0fc-68a03f930693	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-da08-0f1a042c4921	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-7bf8-2560c6346236	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-549f-39f25070d8f4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-838e-f494d7d41028	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-1fa9-d8c56ab76e6b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-70ae-94574de7887b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-3e40-b029af559c9d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-e2d3-8a85640c2ea7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-9272-e4649bbbdcf8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-d749-eddadceed1cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-6707-8d5fbfef86dc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-bbbc-38cdf19ae40d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-bff8-18f9777d1c95	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-3146-70ee1c5919db	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-6112-60e0e979a79b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-61e5-2db1b3220690	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-7c56-ef5a10a10bfb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-1b4d-4998900f2fab	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-52f2-5e28bfecd7d8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-7100-4f63a9bf20a2	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-adf6-29149769ef05	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-a7d0-6be67858846d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-b1ff-2ae0c6657d0c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-dce3-06ea602ca394	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-6ed9-8e62dc1216f0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-a2ac-403ed47811e0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-f13c-ff334733541f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-b41d-f4a205b24a72	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-b0dd-735ecbcb6a4e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-9b72-0c9ba2765faf	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-1e99-2f5dd9abb446	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-adbd-66faf49e4bdc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-12f3-9f79baeaa3d0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-5f64-87eccd215704	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-c9b9-5137fea772d7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-d32b-fef712d3e27c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-aeca-775c3e0838fe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-b898-9567f530df33	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-d391-7a63c11772b0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-c312-eb37155500c5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-c9f2-0947d3926b49	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-e9a7-634fa4b6c5c4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-b284-37e49fa345d7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-bae2-b4e40b688313	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-f2f9-ff7309004a69	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-1229-00b098e414cf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-7137-06d500db16d3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-c3c5-710382ffdc64	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-e542-f72843fb6d9d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-0625-95a47f691f74	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-2794-b900a7b306fc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-e207-1f2e4d98fd1d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-04b1-cda43bd0d209	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-f935-80025de3e720	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-59c8-5e5dfe556eb5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-8e42-59abd6aa84d7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-15a2-280c1734a3ac	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-ee7e-b6879c4ad2f0	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-e497-addc3c2944fb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-8523-a56bf574775f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-fd2a-38e536060c6d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-358e-bf6621502b90	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-454f-ba93222c064d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-f46b-bdce9aeb0091	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-7bb3-e6a96a29adcb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-87ba-0784935c9430	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-d196-a5ef5c47dc60	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-36b1-42244bec9ee5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-dfb8-6daddda0c8be	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-a375-9c4e32d121c5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-a7eb-efda6fb6b085	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-8313-7d5f6c0d3626	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-deb3-1d016e4764cb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-c07f-f11d8c60057e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-e7ac-5627321feeb9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-a177-4b94a495b9d0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-43d7-d72cb76eb9bd	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-a214-c832c2f90141	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-7495-7ba18d1d51ff	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-347d-7f106ba1498f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-a6d8-0ccf95844813	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-c678-0144f1062f43	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-4c07-7b2465bc3b6b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-ce46-fee1e5f60f00	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-6daf-bbd654aed828	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-57bc-f4ea6e8e005e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-e147-5fc61c21df9e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-3324-b53caae92afc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-7772-37a49daa5e10	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-6a57-7bdea4839b14	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-da16-e452297178ac	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-4919-af147f1e3889	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-e878-8d688f1b4b3e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-d83e-64cb67a3a0b2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-98ea-38fed5513331	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-90b0-aac00124cf66	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-6c0c-4001efa5306e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-697b-0fc4ad496d01	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-55c8-449cdb4846a9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-7a71-03b3ef3e853e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-cfc2-b554438ef3cd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-35c7-4ebe827630ac	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-5c8d-f21c1797ecc5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-4682-c0b831fda272	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-c7ca-f630c84bd605	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-7afb-3712c10afcc4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-3158-a75b7434196d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-98f6-c90362e8519d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-d1b6-9a60027cd75c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-8b6b-17f5cc505dd9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-9821-d85d6c659b5d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-9909-9172770ea3cd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-59a2-8775579bd33b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-16fe-e1eaee66a0ff	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-733a-bfd1ffcf0200	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-fade-0dc551d627e6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-8f8e-46611f696515	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-09ad-a894041926d2	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-68aa-6b6a51517029	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-7e76-f91e612e5231	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-95bd-d0418c9a5ad5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-0015-6efc2efa70cb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-334c-f41bafded6b9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-9704-ec97ebcba84f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-136a-0de0e824c3f5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-c425-2300208335a8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-c2e9-aebf98a5c7ca	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-0798-a5eda784ba33	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-eb79-892abcd034b2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-3a5c-fca8fada62f4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-c849-17055d9f7840	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-d530-8649543a69b0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-24dc-e39db1c6ca1e	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-c07a-32a87abc3a30	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-cd9c-0748cc49be5e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-25c9-d2036abb0776	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-9457-4b2ee0d02cd9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-982a-0dd419d1694f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-2849-557ac1885f2f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-3f11-b3a318bb50e1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-a77e-ad247e4f6fb4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-1be8-6da94a6fd32f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-4d96-ec07fbb751c2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-48c2-9aadd5f648b8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-8c8e-ae94cf69f3e2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-d49b-b464a19d0a15	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-1c5c-91d4ab614f1f	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-7f66-b78f44a206a7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-9cee-646dfc2d5eb0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-10d0-24912ed475f3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-471e-6dab2e13f832	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-04b0-25b474770c02	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-731d-d925cc497b19	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-7f61-e8e80bf44c0f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-782f-18cf3ba0743b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-fff7-3b20d87dabb0	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-2585-bc7b5d16f201	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-42c8-3a8566688910	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-015f-713dc8404a8a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-0fec-6e371a2c74bc	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-fbe3-f5d06df7a941	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-3f34-c24633357398	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-532b-2600c912859c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-eb94-0602e3125dea	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-d958-0c62f6a30f8b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-5d76-b057a26ce5bc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-1df9-80a1221b6b4f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-4a81-9f64623e4f59	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-6dfd-3f1796a7fb72	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-3dd0-f7ca5d205460	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-f151-a1901b947cf3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-02d7-9f7b760bf4fc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-8ea2-93d58fe762e1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-8fef-a73d6c7adfcc	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-e070-257c852e7a01	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-ebc5-0b1c5bad8b5a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-ff58-db1124aa6e2a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-3e8d-5dfdb4b8ed00	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-3476-6104a715c486	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-3e40-451ba675f44b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-4dd9-2d61c4adbbbb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-67a1-8ed36cd5b8ce	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-85bb-fd06ecbc6d42	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-9133-6fc7b90c58f3	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-39aa-1d6548b6e84c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-9057-8a16155d60c5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-6721-49ca02b406fd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-de58-0e8ae951151a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-7797-dc5c44679c23	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-f272-52b18ba36754	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-f4c3-d8bd4eac529c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-d575-c62ad594c742	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-adf5-c9f1a5e51635	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-89c7-6ea7e186f812	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-761f-401441daeee7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-36fe-15fe8add3991	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-a35f-4bcd1cc2127b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-44ca-07976bff7167	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-8da2-75e65a2df15e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-f18d-5ec33ca437da	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-c820-a7d7611a74ec	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-1856-716032b15495	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-1ede-fef32fb7ba13	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-14ac-5b56dfb2147a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-551b-314fba389827	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-cffb-fb3716c92ccb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-337f-e90cdd57737b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-7513-5b9bd48758d8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-67b2-9f9e23512e2c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-f12c-292af5367a27	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-1753-9f355a23bb77	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-c7cb-d8821df791eb	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-adaa-cbc8dd292aca	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-6598-0bf90895f426	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-6330-050aefc968f6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-6c4a-bf12f136ab1c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-a57f-271cd1e57b83	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-a6ae-a51e35df4355	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-daa8-6f9b3fff1ad2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-944d-fa6e618d22b5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-9587-bab76a1ca21f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-7366-2f103d101ef8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-2e0f-290adaf6e054	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-54b7-5cf23e1986d9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-6b03-0b29b3f01760	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-6569-33b2c52f4879	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-37a2-c94384eb5e59	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-ff65-8426e5e4309f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-3d70-e83713c86084	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-fe1f-acdadcb1cd23	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-9994-3aae40bdbde4	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-f5ad-5c691aea1eb9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-2f81-73623e84cf71	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-4f24-d521e59e1431	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-1bc5-4ef95a53cbac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-ea57-070b9e531159	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-c1f8-a6175817123b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-9ccf-9e268eefbbb9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-45a5-ab933914dfa8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-a6fe-491e4d92f83a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-a447-3be16ac1e025	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-3dca-c641be5d8169	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-3e28-1ba19fc93cd3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-4dce-c1aa6ac6d9da	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-c3c0-a6a44bd16960	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-5695-d7125c8e098e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-fc53-c45921bf8dde	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-484d-0a5e05b2fa65	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-aa5e-415a5235dace	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-9bbe-edb8b1eca2e6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-edd7-0726cd0730e5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-5c2c-3d125a4966b1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-ab3d-43d494ba7ff7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-d605-b469e56e200c	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-b83b-5f8cac74b1c7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-ea55-1b7b337d206e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-c276-db800466caf5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-00be-b7243b0b4d64	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-46ad-e6324b097d43	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-95d6-ce0f7156999f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-5d33-8592e9216656	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-72cb-37d07edbe7ed	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-5882-09ddf6c27b0d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-898c-d8b3e04cf4f0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-6903-94eb0f9717ba	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-488d-ded6dc3843f7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-b2c0-66ad4acc4f0f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-8869-b97b9d3e9dff	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-5fdc-c9e1ded22726	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-9132-9d82207b4b3b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-4960-3e06c492b4ee	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-f828-1c34a5869c34	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-5e22-20b8c7d9d103	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-aa69-d8e97b7624e0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-8b2d-36839110b051	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-010d-14585b8864cf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-95a4-256920f54432	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-9d88-7f0f61e614a6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-e33b-d7fc9d93f908	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-e485-28261a82e60c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-d908-890eea4679f0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-7adb-7a78bbdb323a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-ce14-fa5d31378a1b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-417d-ec8217645e6c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-7d96-5f169718fa1f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-d2f4-6967d881d89b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-9afb-02e6723df23d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-34a7-bb1270a86288	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-29be-e9202a910c74	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-2109-5e3f349c2c7d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-4e3e-aaadc79fdc78	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-c2c9-010d1f6efc58	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-b46f-b7c4157a715c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-f542-dbbb0c42346f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-d123-0411d77fca65	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-a8dd-3281ec19b6d4	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-d3c5-844a04541a58	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-e417-cf8c2d512b50	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-96b9-247d93895734	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-3302-dc3b86084e73	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-d277-4247d01f321d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-0b80-569988d1cb65	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-350f-e2217d9af03c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-4128-0b66c44d161a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-2570-aa36c7a59e52	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-b58b-3383712c513f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-87b7-b353974810c8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-0e43-4d63d2f15882	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-9b4c-476c7267254c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-0cd7-305fde1f2677	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-f09f-2e2ced256363	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-ca88-05e17a43900b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-9be4-eb071e2e04ad	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-6bee-92a597f225ea	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-cf49-49d12cf966d6	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-c15f-fb6d3bb9d8b8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-f2db-29c765562f77	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-4d92-25f228d2fc03	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-e9ea-af8a84f684e7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-db41-18b41e6d1a79	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-2a3e-be4aca80bac2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-8e7a-9910f30ae2e6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-1fdc-5c25217b4321	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-800e-f4c3a32bf143	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-e021-6a58092f2263	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-cdb1-9efef4ca918a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-c7e9-c8fea5274900	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-ab62-ebfdf681daa1	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-6190-cb5ce0dc11c8	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-5137-fa8d31b226bd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-6672-a86fde086390	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-f74a-304d9cf090df	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-54e8-3d6b7e49d910	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-a773-a17a01bd080d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-f48e-0ff116ecb56f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-ebc4-1336bddc2f25	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-af5e-215d3360ffb5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-2ddc-fe0bc4872c12	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-2173-a26d21b23d90	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-b4e5-59f63e6603e6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-a56a-c4128eeb6df0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-d8c4-4f845bbb449f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-9003-133451d83986	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-7779-ecaa3187cfe8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-6201-b6e869b1c3d4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-b655-1603494ce1e0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-1f5b-186c8c6dad49	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-5350-5f36091c3f2e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-c073-a2627fe57e32	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-d271-ebcc63bcbc71	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-af93-cfdc39a29142	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-7014-89367f71d4ea	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-de5e-342ceff8b3f8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-0215-7f3eff0a60e4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-e174-f1cd8bd36f6f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-122b-04a2cb313d3e	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-31f2-6bf2a84bf325	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-8e03-a58c34108100	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-4348-5ccda717ed5c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-9a62-37f9e2192787	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-9da5-84540533d20f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-a7eb-01f031d43a11	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-1f7f-5b4bc45533ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-3384-a947f6cd21eb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-758d-23040cb0fff8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-93d9-320dc971913e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-95e0-f1515990000d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-87c4-c2a7a0637c1b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-c067-025b1738c8a2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-44bd-af549cfeaa33	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-127b-8cb90ba3b617	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-d6c4-d40e667904a5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-eeba-cb804327ec57	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-2f56-deeddf962c17	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-65ad-153ed493ba57	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-1af3-fd91f6a922b3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-c417-b065701faaf1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-7744-b71d48caae28	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-5700-223c78f57df4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-8f13-eded6c198ba9	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-027d-667fcb76e06d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-36d6-5cccef6b81ae	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-c9ca-a9607fe8e893	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-2cf4-29ef1864ff0c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-6c19-c176e8085f4d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-a5e8-364cdb7f0352	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-49fa-5b6c0d912a67	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-2131-3ae398ed438c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-78ba-5c30b1fb37b2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-74d9-ad3027b1bd8c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-b8ec-db250b947e32	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-be26-c81ef1e7cba9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-ac70-04311eb4515b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-de35-20d6521ffa7d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-8106-c012afb0635a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-74bd-23d2fe082c29	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-eae4-f706ece0cbfb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-64b5-6bacde484df1	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-a925-9bf38839d628	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-9e97-99465b019116	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-4199-5fc1957cca00	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-36f7-eb916ebf0023	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-6c69-73bb4726e1f7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-246a-04f5eba55f45	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-aa65-32cfd500ea67	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-e1ce-92978d32ee62	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-d216-9ad587e51592	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-b82a-02a5e6dd60f6	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-44c8-ef11a71f03ec	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-a29b-5c70d4acf979	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-555b-d4ad916aa593	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-a2b0-79dc65baf8f0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-9b7f-6bf6db035cde	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-bf19-4e0152df3490	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-9516-8226337ce2f1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-373c-6a3df7862458	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-bc1a-dd46bde79728	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-7f32-dc37ef9911bb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-ad04-497923a9ab7d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-11b9-bd82d734cd65	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-e549-dffda79174f9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-4eab-91df431c58f5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-b3b0-c24222a6f798	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-9c48-a1c2694ac2d6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-a2da-ea7e7da57aa9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-0727-5f411afd0c99	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-c4ae-4991abf015c7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-a84c-0e8b5c8e506b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-7104-24e4a5b59007	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-9c1a-92df06c72644	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-3413-9b2184df57a6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-08c0-2617571417bc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-c5dc-f247c6364753	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-b081-7515694f2a1e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-03c8-da25da7b5fec	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-8acb-007c6a723f42	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-da30-00a8bb503caf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-07be-89c9095fb5f1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-d983-4586d9b48335	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-d9c4-daecaccb830a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-123d-5b516f34f393	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-b4f9-15c825306244	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-8be3-c84c0eaa06fc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-f2fb-e9f2130818fc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-da5e-741bc99dbb21	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-c90c-91286440cee1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-8a83-86933465e7f9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-af19-c3dffe7393a4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-0f0f-7f260b6f4b82	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-4407-d427f6dcfc6b	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-0bb2-785b26b3a1c2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-76cb-70cca1239372	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-edb7-d7f9d8f44800	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-2618-d726e628c58b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-c003-ddb355ff8ae3	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-ee7c-ed6c2ffe1d56	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-5fef-0e980a21a682	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-78c0-a1b67c1c01e7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-a0b5-3030d0ee4691	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-ac20-762d1a357549	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-e142-3a6dac4c3c41	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-2790-0efd2cc86b61	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-c587-29acf6bdd7e1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-f32c-fe5c715ef023	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-70fe-7b00dd9b9271	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-b66c-8cde5de3b023	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-fd87-a52a47e1fce7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-1969-df85dd959ea8	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-9e31-91cb73e9bd8c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-515a-90269da84f48	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-f6d0-d1cd2a0ee7fa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-7635-611a2c2c1428	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-a8bf-f750b20a8552	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-8e3f-c753d678a34a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-dd82-181fe4741f6a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-f894-f66973cc2d23	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-d0ed-d993de38a72d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-6880-47996fb74b11	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-d2d4-d3119510d72b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-4538-7840c5b262a8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-5db9-02fe03df0077	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-e48b-622840b8826b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-b235-d0aff4320025	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-2718-3de3b3b545ce	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-245b-7e136606119b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-3560-681d931037a3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-c12d-ca65905b65fe	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-ef98-393fcf4447f8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-eedc-2dee39e1a160	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-235c-8c98c85f64d2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-be9f-7368bd4d096b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-c025-01a1f3e5f343	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-b722-29246b0a0ec9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-d2f8-45edc2ffafd1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-88eb-5d062f876123	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-36c4-64e75e7d2014	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-d2f2-ce6af349f1f5	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-a712-6e98071e2b8f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-1be3-e90b642cc91a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-cc6e-e39567f23b0b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-008c-2d83e3a33d05	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-aa01-4ae475d4be1e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-e946-cc8fa6f590e2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-3a24-296ed8d36e4d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-35f5-0244ebab5453	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-d804-2b93a0b0fe2d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-b8f2-893e184f83d4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-ddcf-c3992b8b3e87	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-65c7-3def9755894f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-e742-8c50ffcca273	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-4477-5862acfc4538	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-c93d-8ec6a21fa2d7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-8de6-f49f1ab35c33	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-3bf7-c1fd55b83a3f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-d7a0-d284be053b14	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-69b5-fb7ebd47b083	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-4a63-2319eff9616c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-207b-d060ad1a3a00	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-adb4-ed3f9ae8d237	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-436c-949f59fb5f1f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-0869-f18ef6e58a2b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-7bbc-410d85e45303	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-dea7-c07c6a416c5e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-2347-ca395141e462	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-0b15-c06f936f722d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-ed8b-bd0fca4c24a6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-8bbd-44b9d4179c1e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-4fd5-8c1d7dfb8d2c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-31f6-75ce2c9e56bf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-65be-f8e634643e7a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-300c-4f3160453d61	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-8116-fa183476233f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-06ba-537c300d034e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-f78b-93ff0d485234	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-d01f-e2074da6d9cb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-1eb2-12499e34c602	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-73dc-63b8fd1b4e22	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-8fcb-5dc0a0e241ad	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-0739-9c8f62d9e071	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-ffab-f49e8869d291	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-e3e2-59a4cfb6938b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-e5b3-3469c02b7030	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-7336-20540d292b4b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-c91e-cfb844634e9d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-3162-8745f395b5d7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-2581-dce5b8c489fb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-40ba-accd95964a85	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-bce6-57ed65e5ac38	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-8505-ac241f2d73d9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-ad76-e0addd1a9799	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-34d7-5c64a34158a6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-1280-204ae9b19d6a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-9718-220a9fd18885	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-b585-22c14df7097e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-4976-a30df27d0247	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-842a-12e7925d2f99	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-237c-8f1d733bcdd6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-7f9a-ed7642fb92b7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-dda1-52fc7da07184	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-2323-5f748adfd71d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-108d-a157774a0895	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-f33b-eb273e95a0de	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-ce43-4e3c28d4f057	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-1a25-2626b4d03d9c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-4a0b-2d4333c47d29	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-3774-4fdde9296cc1	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-7884-2d7833c08507	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-4a21-2b4a504f8e35	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-a515-e3bcf0e44cfb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-3439-448a8f23511f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-6254-f0fa3b46035e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-20fe-e6a3f941fb00	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-194f-4b3aac5b06fb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-8909-c6984f75d215	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-12ac-1f916ec6b4cc	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-3a1b-acd25ba8ec2b	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-0357-ed1c0f1ee8b9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-0431-4b7f2144befb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-3c52-1494cd7e2bc0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-2f8e-b78b79c41a3b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-e3a9-2cb4de8e9d6e	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-f47f-fcac014c42f7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-b9bf-81eb63e05ed2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-ec53-d4b23ea242d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-a3b8-531b106fc4bb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-e4c9-c92d9959b7e9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-230d-55c493a09c4d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-4a80-db08e5b0cf8b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-1ff5-ad2cdb70a533	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-9799-579d1d229abc	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-d42a-aca0f62cd469	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-7361-0ca751dd8f2c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-bf5d-9717b6288d9d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-a7af-059db74652ae	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-1e57-f1df6e19e01e	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-6453-a2cbc0c231e2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-9538-13ba239836c3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-a7be-07021a4ab74f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-0158-1a12dd60bba3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-b6e0-315481b1bff2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-c76c-9a2d82bf4627	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-af1c-695f404b268d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-d3bb-070d4d21c64a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-ead8-a8b078031acd	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-b35c-a5009be2a7c7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-8831-961e1edc5132	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-26f4-0555cc56a714	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-7df1-9a27377e5ec4	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-007d-3bd83e6f5fb4	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-fca3-06a741d84fb1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-6e57-c71facfe43eb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-4aec-23b59baae3df	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-9ff9-c9eb8679d94d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-cf43-5c6d7c45f28e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-48a5-9f742dc0a0fb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-bb2c-cebda24c876c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-331b-97842dff8ef9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-207c-94d67de2123d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-20db-7235ee6e1aba	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-9a61-25156bf615aa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-d308-3cf1c497ad79	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-bf67-22ec486e4280	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-c932-b9355f7c0600	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-5e98-26f60a27395a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-dc19-ab6a2697cfe0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-7a28-552b3153cc83	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-c43d-daa611842cde	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-8d7e-64eb353b1c4f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-9a7d-4ee12ad5a8c3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-66c6-c9865fb040aa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-11e8-25070f89b723	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-012a-0374c801f4df	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-b536-074bd8ff1d25	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-24b6-6e00e8077044	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-665a-b92474cf02ba	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-7112-d96a981b4db1	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-1e0c-aa280b53f5c7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-1090-99700efa98db	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-429b-562e8b13940c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-c93e-74aa81dc75fa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-ae74-3811e8708033	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-9b0b-2a7824adeee1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-b62c-4d157401fdbb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-2f75-07654e12eb09	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-26f9-daed19d78f8e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-aaac-819cca79c0bb	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-49f0-2de0439b2da0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-53aa-dbb9bcf08c49	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-88f5-762ecc0ba84d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-0e7c-b1b47c583c17	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-bf23-2c5042e819a7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-cf8d-53ceed5408a7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-123b-fb5d09055b20	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-d88c-6dcbdad4b9a1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-02ac-237227aa0ae2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-c512-db4b27abc542	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-59b3-86ffa8c5660c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-67cd-990885265f7e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-4ec9-e28cfd382ee4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-a9c8-e39b95b5b6e8	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-8304-fa53e374609e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-e517-3921da633394	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-53e0-503612d2a3c6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-2479-494b7de94837	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-f88d-020eba1b1cc8	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-d84c-224b5b3e0fa0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-b9bd-252c2a7f7667	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-9568-f41dd3d3dbed	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-7d97-83d1828afbe5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-48d5-dbf7afc7089d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-26e8-e3184fd3707b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-4958-304d04b03acd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-7f6f-820016fcc48f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-dd86-6361daf1486a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-3508-151459561bf7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-1c8f-1910dc57a985	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-ab74-2d96a6910a02	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-0b87-eb12f2199b5c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-644e-749bfac226a7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-2188-a36598ec5645	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-058a-564e37bc1a38	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-4f7c-0aaf651a6577	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-e660-0a8afc8590a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-7341-245306adb3b3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-dd8c-cbf0818b3388	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-6f8a-658d66cb8288	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-a93a-dd17bdec372a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-0650-1729df728dcb	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-19fe-85d01da87805	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-b772-79d16595b194	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-53ba-1eaac015c3d7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-f191-78f68df3fd9b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-e5a1-3c1d94e2e858	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-54ca-ce328dd0188f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-038f-876170436e57	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-e4c6-e30ead455d5a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-24b2-820104926423	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-0e21-6015f2790c20	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-c483-58bf6712cb7e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-0e1b-2b5119662b31	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-70b8-da5628f17500	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-ddd0-5ef7e92e917f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-e12a-eb3f9ab80ba2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-f3ee-02eaeec7cc0c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-f3c9-d40296ab9899	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-0110-08f051437b80	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-0f89-b6f9da4eb6ea	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-34bb-d69eb7f3e9d2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-6cef-ea06b4208672	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-8cf2-c025a8fcd6dd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-365c-d06f1da745a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-327e-685809cc3bb2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-6459-098667783d7a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-1cd4-7c7e60d3389f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-bb63-c159190d4ff7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-d6df-5c99456b1cea	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-7de6-05132b219146	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-72d3-44483dc9cf36	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-db83-4cf66ce2a4d7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-821a-900f3a0eac17	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-d236-e4b2cdebebce	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-91fe-a62132751048	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-20bf-58ae689489a3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-581b-e2f0112ae5a3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-32e3-b5a1add4fd2f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-4e43-9872a898f519	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-2d10-f7a9548c3341	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-7c97-bb45adf53af3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-d7ec-5e273e56938c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-0ec3-b85a35eea955	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-6454-1a0033b098b8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-94b9-343a3368a2d1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-0cdd-c0d0847ae735	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-b8ba-fcf57ea619b8	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-2022-48e2469f8aae	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-7581-308c01300636	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-a1f7-d69d95aa4313	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-ddc3-732459b5d312	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-312a-67b19c7ddf9c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-1496-923ab89d30e1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-6ee4-e0aeea137ab6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-e6d2-304a188440d3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-8062-85b85c9a3660	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-5fb6-f6897efc48e3	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-38a6-df1b875f016e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-c3e7-da56d3bcb48c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-014f-75dc8cadbc01	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-94ee-78086f6341b5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-a4de-ec1d731703ff	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-2645-3f433da58cab	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-a6c3-12053131d340	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-4071-eff4bf6f774a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-98a8-fa88bbe106ec	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-8509-b50f6126795f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-1e1c-c2b583e10f27	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-6e16-51f190a48090	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-ecf2-8b4b8dff7cd3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-17bb-3d8e65761ce0	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-9413-6d79ec5e892c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-2cc1-257c4df6a87d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-a33c-7fcb9a166145	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-36be-43a7d1a4edea	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-b85a-43e45093f540	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-539a-646f39d653ca	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-46ae-2ce75c9ff6ea	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-f6f1-d904031ca3ae	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-01f7-0590df77df58	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-ee2f-213fc3aaca48	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-9895-6b7ce5e3a224	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-26ba-297a44b12a10	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-2494-a85858e27320	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-30e0-113c2b593051	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-51fc-316553a05bcd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-48b2-b5d9c34b4ca8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-83cd-1defdab95446	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-01c3-17432dabb1e4	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-6c6f-718eeed25c6a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-6099-a17becd4cd0c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-c269-d89a8881d308	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-addf-8b87dcf57c1f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-0473-aca95f7fcb0b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-4a4f-413f88a67dee	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-4c4e-d3ec3755efa8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-c280-536a9d07bf58	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-a4f2-22f946497c3d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-fde4-d142caeee7ae	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-c168-0dd7d8fa8d26	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-dd0a-9e71693f78ec	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-2723-8433160dddf1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-6809-18446405da33	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-3b4d-7b4331df9a81	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-dacc-a0b061cf9458	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-d415-be9086b291f7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-d071-8af78296ce9d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-dc98-e3884156e0a0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-75ce-343ea093d4a8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-9d70-f44730f3f3c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-9f98-9dd7be40c106	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-4d3d-515cbe539882	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-e0e0-5d145756ad06	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-e4c9-5279d74f3506	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-8b78-0afbbb64b1e6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-fb72-e8abedcd89b7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-6c11-a723be5ac2e0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-8589-c49b249828d8	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-01c2-f3be7a3ac85f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-2c29-071793f8d534	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-6e30-1405d221a16a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-3075-b5dfcf87f61a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-57d4-4d685339b451	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-e811-da910693b465	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-59fc-c5c679914e04	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-ba74-015eba04b1ec	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-51e8-cfe4066403c4	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-0c8e-0a741eacf25f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-b9a0-a0ade0fec007	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-a75c-12d23b5b41f4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-768f-f528761e92cd	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-dd11-9e7b1b673625	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-915c-f7462bdf3a9f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-d716-6af4c202eca5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-f4ad-41f413933010	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-87b4-cd25772ca85a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-ab05-324a3def105d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-f7f0-a3c6058cde34	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-469b-44bed015be63	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-d184-48cb0f83e415	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-64e6-98668da7c20d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-8043-5c812ad3a2a0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-58ae-1064f93d0ef2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-9332-f582c0930ef0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-7315-c8b57396e5f8	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-2748-7398734f02e2	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-d80c-38d1ef6b7986	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-f683-1b553871c0e6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-325c-6c6c031dd414	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-3b32-63ae6e2323a5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-50a8-582fd6ec5563	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-84a6-261f453b6d30	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-919a-1d2f92135296	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-c2df-80ef3339cbb6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-bae7-5c68b75098cb	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-5395-9f4dd03c6293	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-6863-88cb1a2b99eb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-ee50-46033a1cc317	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-de9d-0a426fd1526b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-6657-86ba86e7fa12	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-9572-0ede833b79d8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-3dfe-61d5d06bddff	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-1b5b-f0304cc66d41	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-facf-f7a13a914f8f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-ed7e-89c2fee01f6f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-e26b-ccf7ce3a44a5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-2243-b0f4b0ce065d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-5647-498b5518eb94	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-6d04-698dafa14928	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-1579-0f2bb4b86af3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-d05f-af0f27d1d0bc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-1f83-5389684a5935	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-ee1a-eb4ead3e2065	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-70f1-4d714a23a284	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-2fc4-505db8f23641	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-cdb3-b3171eb8e008	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-dedf-a5589ff0f57d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-6c6c-822af16a5a8f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-001f-f7a4988acc3d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-542b-7b74954df48a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-dc9e-3806afe8fae4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-5351-a6d73234ec51	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-b1ce-b1dca91d00bc	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-f774-f84ca8583a87	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-509e-115767b168cc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-3b2b-4f678181c5a7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-4fc9-661dac44935f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-0b69-925b35fcb53c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-215e-1501bada3fca	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-20a2-e410b0874600	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-2e0f-8310c73191ab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-f86d-0cbc6158d1a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-7bc8-536280e2e9dc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-7bc9-9b15000817b3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-e4c6-82548b006d8a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-18a5-4125f147d116	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-6745-dfe3d396b9df	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-938d-5b78a9f3f7fe	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-112b-3436e2b321ec	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-be6c-214e813e1bbd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-c5a6-d74a2c1a704c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-332b-60163eb1bb9b	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-9cfc-ae447e3d50a0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-864f-20c1a85ef931	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-0590-e15e38a46927	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-9acd-ec1c039b9edc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-81a9-b3e5f22cdc07	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-117f-5a28e063b9a5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-9267-cb4f5bb4effd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-d415-890fc2956402	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-b49e-3ea12979cc41	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-fcd1-f812f3f2e0e2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-3066-c246fcf96eee	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-38d2-d3476dc62f52	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-136b-fd2ff206442b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-60f9-6789feb444da	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-ce1c-63c7c488eeaf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-5267-f3d909b2c072	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-a6f5-d61f53f0b599	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-e1e8-a16d7834a770	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-5d4a-84f3c3453b54	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-256f-e7d6b8844f69	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-ee67-1d0a2f16d42d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-e6b1-e3dce73d6d6e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-ccea-0aec0f1ff4b0	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-f282-6823b0726d88	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-b599-a20eb9b61d8f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-bdd0-9dd93946f152	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-9a5c-e5666ae3964f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-4635-52f1612a640e	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-33ec-a959321379c6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-4c68-dbe96a417f60	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-6c0f-ac5c57f2e4e4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-cc5d-2714bec214c6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-9246-2b9ef8d85f80	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-5896-837f4be32991	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-daee-f4ed0f7c0e13	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-ec87-e5e931629cf8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-2c82-45e3f3e8361a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-45a6-211690fb29a0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-61be-9e3f7cdfc04c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-addd-a4d430c9fb5a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-a124-426070af6b96	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-3e4a-f190dbf39d01	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-7ebd-a9bd3bd079c6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-6a41-398a872586bb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-3cd3-368d57ffa2b5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-fb93-05f3e9d430a4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-5357-64498a829a9f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-7846-36230c9c01a9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-8366-9392e29f8a51	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-7c52-ab09a2de6c78	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-f9f2-61fabb70043d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-ee19-62a1cf8530d7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-f942-d18e3cd36f5d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-68f1-86b3475ca22b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-b956-433ae91c9522	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-29cd-44a2edbb67ff	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-b81f-1957dd0de957	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-e03f-642e1c108cb0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-5d2f-9a850efbd6b2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-1629-a88992d3bba1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-2077-40d9e7863a3a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-55b3-e02245c08369	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-bbf6-c65242ba962c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-e582-9b917a620915	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-f52c-4ab7ab7e4e56	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-1024-4964c380c5b3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-09e9-e42d67262ee9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-5b8a-117ad5450372	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-8439-56789cf0d656	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-e285-14a993cd02f2	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-b55a-cc97955afa74	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-c2c5-725034fd41d7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-8ddf-dd0786333a57	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-2f52-0d7fec5bbc05	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-0a93-7f85031da0b8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-2cf3-da01eedd989e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-f415-fa79c3e3dfaf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-79a0-1b37fd5309e5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-87d4-741f50000e63	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-cf18-d80fe2ec0494	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-88ae-24b4cc05268b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-bcf4-28c26a18a427	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-3847-c8b788eda51c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-9fbd-ddac5be04a3d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-7a1d-925a6c45f854	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-67d2-1d01ceb3571a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-b777-4f9f61f5a073	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-3514-6425cd11da7b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-e853-8ae623ed3a66	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-bc04-4d9fd9a06252	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-d595-7c35d5fbd660	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-f7ca-edebacfda117	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-a146-0b861f3be81a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-2bc3-f1bb54ea7bfa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-a9b9-0242b2c3c900	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-1ad1-763fb0fcd16f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-8499-0fca076a2e4c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-c582-6126001f3ae7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-e2d2-79b035466146	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-fe3d-43ff90fb3fcb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-b111-e679a5dccc3a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-7e65-f07c16a11adb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-2578-f767cae8ef74	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-2341-99b4ea84840a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-ac88-bfc6276d48f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-4f4d-2ac7073470e9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-ee03-43b5-9bb799ed2626	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-ee03-f897-16a9723eea10	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-ee03-b569-e7a621330ffd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-ee03-4557-9d10dcd171f4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-ee03-ed0b-6a7d09c6f8d2	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-ee03-e6fe-51b671529c2f	Role-read	Aaa - Vloga - Beri	f
00020000-5537-ee03-1c2e-1a0764c832de	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-ee03-efdd-58f3d55758b0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-ee03-850f-12517e8f0f69	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-ee03-cf72-1a4a5b00ea83	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-ee03-3d64-6074cf2187c1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-ee03-a2e3-8c610de5e31b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-ee03-bc42-f863ca335dc8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-ee03-84e3-d4259a1fc2c2	Drzava-read	Seznam držav	f
00020000-5537-ee03-cfea-68f4b8e2b8a0	Drzava-write	Urejanje držav	f
00020000-5537-ee03-8990-5a7468cf6876	Popa-delete	Poslovni partner - Briši	f
00020000-5537-ee03-fe3b-2ed583759ff9	Popa-list	Poslovni partner - Beri	f
00020000-5537-ee03-9835-6491e724f465	Popa-update	Poslovni partner - Posodobi	f
00020000-5537-ee03-bfa9-62d69ea78a87	Popa-create	Poslovni partner - Ustvari	f
00020000-5537-ee03-919a-1a30dd4fdec3	Posta-delete	Pošta - Briši	f
00020000-5537-ee03-4f60-c4ef46065833	Posta-list	Pošta - Beri	f
00020000-5537-ee03-02c9-a3908f358003	Posta-update	Pošta - Posodobi	f
00020000-5537-ee03-01a9-90630ad85e33	Posta-create	Pošta - Ustvari	f
00020000-5537-ee03-f743-499744ae4612	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5537-ee03-860f-2245521c61b2	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5537-ee03-1771-eaedca49a45b	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5537-ee03-b802-efd38ba22c01	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2637 (class 0 OID 865109)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5537-ee04-b858-478b309ee871	00020000-5537-ee03-84e3-d4259a1fc2c2
00000000-5537-ee04-b858-478b309ee871	00020000-5537-ee02-dd9c-315854060f7b
00000000-5537-ee04-a1a2-5eaced88b7a9	00020000-5537-ee03-cfea-68f4b8e2b8a0
00000000-5537-ee04-a1a2-5eaced88b7a9	00020000-5537-ee03-84e3-d4259a1fc2c2
\.


--
-- TOC entry 2665 (class 0 OID 865399)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 865429)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 865541)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 865169)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 865211)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5537-ee02-408c-49495e68d12f	8341	Adlešiči
00050000-5537-ee02-4e86-a0f26a6cd88a	5270	Ajdovščina
00050000-5537-ee02-29cc-4a85763c4e96	6280	Ankaran/Ancarano
00050000-5537-ee02-5578-a70ffa709a8b	9253	Apače
00050000-5537-ee02-8e35-599b8adda72f	8253	Artiče
00050000-5537-ee02-4bff-d779c3933f8b	4275	Begunje na Gorenjskem
00050000-5537-ee02-53db-53cce5ee421b	1382	Begunje pri Cerknici
00050000-5537-ee02-bf07-275a377d8415	9231	Beltinci
00050000-5537-ee02-d4b5-02fec9c313ee	2234	Benedikt
00050000-5537-ee02-528a-aef7baf7cecc	2345	Bistrica ob Dravi
00050000-5537-ee02-eeb8-e0bd8276ff98	3256	Bistrica ob Sotli
00050000-5537-ee02-38aa-82c498d7ba3b	8259	Bizeljsko
00050000-5537-ee02-547f-d6eb609376b0	1223	Blagovica
00050000-5537-ee02-6ff1-d052efd6b9c5	8283	Blanca
00050000-5537-ee02-8b35-f0bfa4976e54	4260	Bled
00050000-5537-ee02-7a7a-9c2c91f6a7a8	4273	Blejska Dobrava
00050000-5537-ee02-b384-36adbc7426f9	9265	Bodonci
00050000-5537-ee02-4a88-6bea5cc0079d	9222	Bogojina
00050000-5537-ee02-9f52-a2525fd53a3f	4263	Bohinjska Bela
00050000-5537-ee02-552b-7233fc3075c7	4264	Bohinjska Bistrica
00050000-5537-ee02-729e-2fe8130a2bf0	4265	Bohinjsko jezero
00050000-5537-ee02-02a9-3d6de35e41c7	1353	Borovnica
00050000-5537-ee02-2d00-89e4ed81279c	8294	Boštanj
00050000-5537-ee02-4ef2-9798765b32c1	5230	Bovec
00050000-5537-ee02-787b-19f2b6faf720	5295	Branik
00050000-5537-ee02-6e56-02dc1cf27cf0	3314	Braslovče
00050000-5537-ee02-36d8-690b4cc6e6d0	5223	Breginj
00050000-5537-ee02-491a-6416423525ed	8280	Brestanica
00050000-5537-ee02-d558-d7a0a2b4bc09	2354	Bresternica
00050000-5537-ee02-3f74-df73563b1350	4243	Brezje
00050000-5537-ee02-96b5-dc7d5fbd070e	1351	Brezovica pri Ljubljani
00050000-5537-ee02-7a90-747f64c05d6b	8250	Brežice
00050000-5537-ee02-b249-f68c0b967437	4210	Brnik - Aerodrom
00050000-5537-ee02-b637-f8d09c5f297a	8321	Brusnice
00050000-5537-ee02-5c8d-5075c6b55bd6	3255	Buče
00050000-5537-ee02-4fed-0d47f46fc000	8276	Bučka 
00050000-5537-ee02-37ae-5f7d7cf425ae	9261	Cankova
00050000-5537-ee02-5b58-d177fcb35e34	3000	Celje 
00050000-5537-ee02-6a65-781e1b94dd93	3001	Celje - poštni predali
00050000-5537-ee02-1860-0b35dacbe613	4207	Cerklje na Gorenjskem
00050000-5537-ee02-554d-25f565d5abde	8263	Cerklje ob Krki
00050000-5537-ee02-0289-2abbf9c5407c	1380	Cerknica
00050000-5537-ee02-b548-e30ea5941001	5282	Cerkno
00050000-5537-ee02-1360-ea51e2fbb5a2	2236	Cerkvenjak
00050000-5537-ee02-58a7-9dc24f89cab9	2215	Ceršak
00050000-5537-ee02-c8a6-d19b1c01acf5	2326	Cirkovce
00050000-5537-ee02-2b3b-92fdd0dbeb1f	2282	Cirkulane
00050000-5537-ee02-6926-ac69d1f5974b	5273	Col
00050000-5537-ee02-568f-60c790f51002	8251	Čatež ob Savi
00050000-5537-ee02-6314-00b29757a7f8	1413	Čemšenik
00050000-5537-ee02-18d4-78db0f4ac59a	5253	Čepovan
00050000-5537-ee02-44d3-1f69db43b06a	9232	Črenšovci
00050000-5537-ee02-08b5-6952142d8c7e	2393	Črna na Koroškem
00050000-5537-ee02-7d8f-46c850799d10	6275	Črni Kal
00050000-5537-ee02-1343-f1c4a48111f1	5274	Črni Vrh nad Idrijo
00050000-5537-ee02-fa7e-883976f683c1	5262	Črniče
00050000-5537-ee02-286c-ac64e5b7c993	8340	Črnomelj
00050000-5537-ee02-c9ff-4d0f8e229e26	6271	Dekani
00050000-5537-ee02-76cb-c97cd5add4d7	5210	Deskle
00050000-5537-ee02-82b2-efdd68b18fa8	2253	Destrnik
00050000-5537-ee02-f6b3-62de338cb988	6215	Divača
00050000-5537-ee02-fe79-9cf321892b44	1233	Dob
00050000-5537-ee02-3537-32d392c768b0	3224	Dobje pri Planini
00050000-5537-ee02-2af5-151daf0e88f6	8257	Dobova
00050000-5537-ee02-4ec7-3e942800b91b	1423	Dobovec
00050000-5537-ee02-f2bd-e396fd76cc78	5263	Dobravlje
00050000-5537-ee02-02a8-a5600667233b	3204	Dobrna
00050000-5537-ee02-48a4-342c3032f677	8211	Dobrnič
00050000-5537-ee02-3d39-43cd35ab519f	1356	Dobrova
00050000-5537-ee02-75b9-abf70ada31bf	9223	Dobrovnik/Dobronak 
00050000-5537-ee02-6ef3-6d3a02a9907f	5212	Dobrovo v Brdih
00050000-5537-ee02-066a-2b451007956b	1431	Dol pri Hrastniku
00050000-5537-ee02-dccb-71bb4b018374	1262	Dol pri Ljubljani
00050000-5537-ee02-1517-84c624e3ff93	1273	Dole pri Litiji
00050000-5537-ee02-236f-3523f8bd2862	1331	Dolenja vas
00050000-5537-ee02-e061-a1e7d182ec8d	8350	Dolenjske Toplice
00050000-5537-ee02-9a2e-8e3d039fef9a	1230	Domžale
00050000-5537-ee02-83ae-5a5567a46a62	2252	Dornava
00050000-5537-ee02-f870-d5ea9455a40b	5294	Dornberk
00050000-5537-ee02-ce82-781e4da0a066	1319	Draga
00050000-5537-ee02-0563-ecd524b85620	8343	Dragatuš
00050000-5537-ee02-ebc5-fdbd2ef9790e	3222	Dramlje
00050000-5537-ee02-4ae9-7045c33b5abc	2370	Dravograd
00050000-5537-ee02-10a8-a17827653966	4203	Duplje
00050000-5537-ee02-5d91-ab740c8b8c80	6221	Dutovlje
00050000-5537-ee02-2f44-7b0fb088f0c5	8361	Dvor
00050000-5537-ee02-0bb8-b4949e973128	2343	Fala
00050000-5537-ee02-06f3-caf4aa42dd58	9208	Fokovci
00050000-5537-ee02-17d5-f989b73530bd	2313	Fram
00050000-5537-ee02-b40d-b32087a2df0a	3213	Frankolovo
00050000-5537-ee02-b059-585d76262a1b	1274	Gabrovka
00050000-5537-ee02-fb43-869b64607982	8254	Globoko
00050000-5537-ee02-be2c-e28a93092d9e	5275	Godovič
00050000-5537-ee02-0873-6cbfa5bd988b	4204	Golnik
00050000-5537-ee02-4323-36eda0f3c392	3303	Gomilsko
00050000-5537-ee02-c899-496879bfa54e	4224	Gorenja vas
00050000-5537-ee02-1935-3232b5d29b99	3263	Gorica pri Slivnici
00050000-5537-ee02-d3ee-e2f847c56de5	2272	Gorišnica
00050000-5537-ee02-7d16-2aea0588efd4	9250	Gornja Radgona
00050000-5537-ee02-4774-de3486f08104	3342	Gornji Grad
00050000-5537-ee02-2591-17d730bb702c	4282	Gozd Martuljek
00050000-5537-ee02-6c6f-3e7daa48888e	6272	Gračišče
00050000-5537-ee02-2ad2-d5e85b79163c	9264	Grad
00050000-5537-ee02-6b29-68e4144c32a9	8332	Gradac
00050000-5537-ee02-bc2c-3943c9cfa2eb	1384	Grahovo
00050000-5537-ee02-1725-8d9877d18d5f	5242	Grahovo ob Bači
00050000-5537-ee02-b549-cd5d0f46cc61	5251	Grgar
00050000-5537-ee02-6041-a1e5a70f571b	3302	Griže
00050000-5537-ee02-f2e5-1eb4f6b04c1c	3231	Grobelno
00050000-5537-ee02-6fb1-17d68fc2b39e	1290	Grosuplje
00050000-5537-ee02-9942-0c109894cfc3	2288	Hajdina
00050000-5537-ee02-17d0-5f0b1a860d1c	8362	Hinje
00050000-5537-ee02-e81f-cefb6688676a	2311	Hoče
00050000-5537-ee02-648c-f9dbf12da0d7	9205	Hodoš/Hodos
00050000-5537-ee02-2f39-2b7f513f1139	1354	Horjul
00050000-5537-ee02-37e3-70b487afc381	1372	Hotedršica
00050000-5537-ee02-8fb3-4a4b219e99c1	1430	Hrastnik
00050000-5537-ee02-09bd-a0ef0ba77876	6225	Hruševje
00050000-5537-ee02-d8d2-e6bff233a78d	4276	Hrušica
00050000-5537-ee02-6507-bb767f3a974e	5280	Idrija
00050000-5537-ee02-38b6-63640ffc8060	1292	Ig
00050000-5537-ee02-f011-0b77c1db1348	6250	Ilirska Bistrica
00050000-5537-ee02-0edc-93363de64f79	6251	Ilirska Bistrica-Trnovo
00050000-5537-ee02-a691-e6408a25d50e	1295	Ivančna Gorica
00050000-5537-ee02-de1a-21549e8b1781	2259	Ivanjkovci
00050000-5537-ee02-4362-8085fdb67780	1411	Izlake
00050000-5537-ee02-14f6-bd015876bb04	6310	Izola/Isola
00050000-5537-ee02-3f61-9c3daf96fd2a	2222	Jakobski Dol
00050000-5537-ee02-acab-e322145e16fa	2221	Jarenina
00050000-5537-ee02-4e0f-ad8d252e10f6	6254	Jelšane
00050000-5537-ee02-1ce8-87749376465a	4270	Jesenice
00050000-5537-ee02-fc86-c85b9340edeb	8261	Jesenice na Dolenjskem
00050000-5537-ee02-cef0-7198569962d3	3273	Jurklošter
00050000-5537-ee02-02bc-6008432fcd32	2223	Jurovski Dol
00050000-5537-ee02-4e7f-1db2956aed44	2256	Juršinci
00050000-5537-ee02-97dd-4b1eb4044958	5214	Kal nad Kanalom
00050000-5537-ee02-281f-3bc630326388	3233	Kalobje
00050000-5537-ee02-6930-23ff53fcf1c9	4246	Kamna Gorica
00050000-5537-ee02-c169-e26b80b15b4b	2351	Kamnica
00050000-5537-ee02-9d82-7973edfe7c22	1241	Kamnik
00050000-5537-ee02-a051-30ae1218a08d	5213	Kanal
00050000-5537-ee02-3851-c75414ddfe79	8258	Kapele
00050000-5537-ee02-0759-c92729d994a2	2362	Kapla
00050000-5537-ee02-d69e-194815588b50	2325	Kidričevo
00050000-5537-ee02-93bb-3522e06aa1ff	1412	Kisovec
00050000-5537-ee02-a0c6-7c59f1ba4ac4	6253	Knežak
00050000-5537-ee02-9106-e87acd4aa957	5222	Kobarid
00050000-5537-ee02-ed69-b2738246282a	9227	Kobilje
00050000-5537-ee02-d51a-8821637c92d0	1330	Kočevje
00050000-5537-ee02-3818-ad5fc1f80b02	1338	Kočevska Reka
00050000-5537-ee02-6062-1b08def12438	2276	Kog
00050000-5537-ee02-cfb6-eaa5265c998d	5211	Kojsko
00050000-5537-ee02-3cf5-75d753579bc9	6223	Komen
00050000-5537-ee02-6e75-84b2d8cc5391	1218	Komenda
00050000-5537-ee02-6097-0e17873d10c9	6000	Koper/Capodistria 
00050000-5537-ee02-b0d0-8cac38500fc8	6001	Koper/Capodistria - poštni predali
00050000-5537-ee02-8b50-9a6f4488293c	8282	Koprivnica
00050000-5537-ee02-a91e-2ef6ed03c736	5296	Kostanjevica na Krasu
00050000-5537-ee02-1b98-5cc523a7e195	8311	Kostanjevica na Krki
00050000-5537-ee02-f40e-1a7c3f468db0	1336	Kostel
00050000-5537-ee02-c04a-8850ccc941a8	6256	Košana
00050000-5537-ee02-6b31-983d78766919	2394	Kotlje
00050000-5537-ee02-b31b-ef9805dc2e78	6240	Kozina
00050000-5537-ee02-4d30-b0dd3bf1a4af	3260	Kozje
00050000-5537-ee02-886c-06c7ebccea18	4000	Kranj 
00050000-5537-ee02-1fea-2520e2124bda	4001	Kranj - poštni predali
00050000-5537-ee02-032a-4f026006c5d7	4280	Kranjska Gora
00050000-5537-ee02-1398-6be159b4d3b7	1281	Kresnice
00050000-5537-ee02-4e53-22a6f6f4fd96	4294	Križe
00050000-5537-ee02-5c35-5315c1d5dea0	9206	Križevci
00050000-5537-ee02-dc20-2e5c4274d8ad	9242	Križevci pri Ljutomeru
00050000-5537-ee02-6a4d-3a5d6a92ca51	1301	Krka
00050000-5537-ee02-9dae-f2124dc190a7	8296	Krmelj
00050000-5537-ee02-0459-acd81ed611a3	4245	Kropa
00050000-5537-ee02-7dfa-261e8dd6c8dd	8262	Krška vas
00050000-5537-ee02-10c5-480905d2f63b	8270	Krško
00050000-5537-ee02-10db-18f1f2c692fb	9263	Kuzma
00050000-5537-ee02-d8c6-718d29cf72a9	2318	Laporje
00050000-5537-ee02-c767-3cd040c564e1	3270	Laško
00050000-5537-ee02-6669-e410723cca85	1219	Laze v Tuhinju
00050000-5537-ee02-4ff7-8a67f714ae28	2230	Lenart v Slovenskih goricah
00050000-5537-ee02-ce81-992643fc6eef	9220	Lendava/Lendva
00050000-5537-ee02-2fb3-215576c28da0	4248	Lesce
00050000-5537-ee02-9afd-054c244d13b7	3261	Lesično
00050000-5537-ee02-4544-a7811b33ec9b	8273	Leskovec pri Krškem
00050000-5537-ee02-23d4-a59ccdaeba04	2372	Libeliče
00050000-5537-ee02-8b3c-d696621ead38	2341	Limbuš
00050000-5537-ee02-8f95-eea8d33f1aec	1270	Litija
00050000-5537-ee02-1e84-59e5fd9b29d3	3202	Ljubečna
00050000-5537-ee02-ee9d-2e2f5e41bc9f	1000	Ljubljana 
00050000-5537-ee02-2b4d-df69729c7c22	1001	Ljubljana - poštni predali
00050000-5537-ee02-7db6-acb588102971	1231	Ljubljana - Črnuče
00050000-5537-ee02-6611-489cf1344f56	1261	Ljubljana - Dobrunje
00050000-5537-ee02-127b-27c8608165c9	1260	Ljubljana - Polje
00050000-5537-ee02-b086-fd956bfba7c0	1210	Ljubljana - Šentvid
00050000-5537-ee02-320e-50a3b126a9f5	1211	Ljubljana - Šmartno
00050000-5537-ee02-30ba-ba184cc393a7	3333	Ljubno ob Savinji
00050000-5537-ee02-aeaf-f4220257b514	9240	Ljutomer
00050000-5537-ee02-d7b2-600a29afb7bc	3215	Loče
00050000-5537-ee02-95f2-288a9f104279	5231	Log pod Mangartom
00050000-5537-ee02-2cd3-287827805874	1358	Log pri Brezovici
00050000-5537-ee02-b478-53a72e719c2c	1370	Logatec
00050000-5537-ee02-16cd-bf2d21cf31da	1371	Logatec
00050000-5537-ee02-213e-be0b7022847f	1434	Loka pri Zidanem Mostu
00050000-5537-ee02-2191-e419091d86d3	3223	Loka pri Žusmu
00050000-5537-ee02-ae38-ff7cb47020b8	6219	Lokev
00050000-5537-ee02-9ecc-002c9fd66c57	1318	Loški Potok
00050000-5537-ee02-d0bc-9996c15ba543	2324	Lovrenc na Dravskem polju
00050000-5537-ee02-06c1-170abdca7893	2344	Lovrenc na Pohorju
00050000-5537-ee02-381c-876c377875ed	3334	Luče
00050000-5537-ee02-4146-5cb66e3d3f9b	1225	Lukovica
00050000-5537-ee02-453a-6df67e846015	9202	Mačkovci
00050000-5537-ee02-b2a3-510722c7f79e	2322	Majšperk
00050000-5537-ee02-7bb9-71e327082eb6	2321	Makole
00050000-5537-ee02-e5cd-c72b29c6d455	9243	Mala Nedelja
00050000-5537-ee02-b1bc-9482da250f62	2229	Malečnik
00050000-5537-ee02-f845-024e90626319	6273	Marezige
00050000-5537-ee02-0191-ae10d5a83db9	2000	Maribor 
00050000-5537-ee02-1f27-c2e3310f837c	2001	Maribor - poštni predali
00050000-5537-ee02-68e0-586243acf52e	2206	Marjeta na Dravskem polju
00050000-5537-ee02-14fb-834dcf3e27e4	2281	Markovci
00050000-5537-ee02-13a6-66e23be8f5e2	9221	Martjanci
00050000-5537-ee02-4b66-6b68148c1cd2	6242	Materija
00050000-5537-ee02-f217-c0faa9e3ad2d	4211	Mavčiče
00050000-5537-ee02-289c-3ce110f4296a	1215	Medvode
00050000-5537-ee02-5b09-4d6bb43ff662	1234	Mengeš
00050000-5537-ee02-1b00-66ca3259e61c	8330	Metlika
00050000-5537-ee02-963d-ce91b4fc9ed4	2392	Mežica
00050000-5537-ee02-1837-db745c403741	2204	Miklavž na Dravskem polju
00050000-5537-ee02-a585-ba7ff727abc1	2275	Miklavž pri Ormožu
00050000-5537-ee02-232f-181ccb230af8	5291	Miren
00050000-5537-ee02-e372-a268fed5f7c6	8233	Mirna
00050000-5537-ee02-7cd5-ac0c5919bcb8	8216	Mirna Peč
00050000-5537-ee02-ed60-20d5120e007e	2382	Mislinja
00050000-5537-ee02-2c27-51b33d18a78c	4281	Mojstrana
00050000-5537-ee02-7b96-319cdd65ff3b	8230	Mokronog
00050000-5537-ee02-66d1-20ce6b77272f	1251	Moravče
00050000-5537-ee02-dcf4-9cf84842076b	9226	Moravske Toplice
00050000-5537-ee02-3108-1921ed5ed7db	5216	Most na Soči
00050000-5537-ee02-866a-272bf7fd0ea6	1221	Motnik
00050000-5537-ee02-8605-6392f012c0b7	3330	Mozirje
00050000-5537-ee02-d334-e2c101c7fa16	9000	Murska Sobota 
00050000-5537-ee02-0913-d122433a6043	9001	Murska Sobota - poštni predali
00050000-5537-ee02-5a22-ed5974fd439f	2366	Muta
00050000-5537-ee02-83f8-54ff95f99123	4202	Naklo
00050000-5537-ee02-ba4e-b181c40253fa	3331	Nazarje
00050000-5537-ee02-f340-7f59068c699d	1357	Notranje Gorice
00050000-5537-ee02-5f24-30c7310177b6	3203	Nova Cerkev
00050000-5537-ee02-edb7-d964f54e1db1	5000	Nova Gorica 
00050000-5537-ee02-d023-e45348e1c8ff	5001	Nova Gorica - poštni predali
00050000-5537-ee02-b039-9cb5d37e89cc	1385	Nova vas
00050000-5537-ee02-2262-b3a5868bbfdd	8000	Novo mesto
00050000-5537-ee02-b75c-22a434145eac	8001	Novo mesto - poštni predali
00050000-5537-ee02-ba51-e6f7f04d339b	6243	Obrov
00050000-5537-ee02-76ce-bc4ba26a447c	9233	Odranci
00050000-5537-ee02-a69a-022fab3b0a0d	2317	Oplotnica
00050000-5537-ee02-63d0-ef35c443df46	2312	Orehova vas
00050000-5537-ee02-c283-123246bd6ae1	2270	Ormož
00050000-5537-ee02-2ec5-91d36ca5a0ce	1316	Ortnek
00050000-5537-ee02-3dcc-f392112696ae	1337	Osilnica
00050000-5537-ee02-12cb-bc756ac6f52f	8222	Otočec
00050000-5537-ee02-4bf5-f214e950aa90	2361	Ožbalt
00050000-5537-ee02-c622-dad1f8c77d91	2231	Pernica
00050000-5537-ee02-fd14-99d567284d78	2211	Pesnica pri Mariboru
00050000-5537-ee02-9e48-d0a3eacb1c60	9203	Petrovci
00050000-5537-ee02-e5eb-ffffd91a0ccf	3301	Petrovče
00050000-5537-ee02-1e37-ffbd1f5d6c9f	6330	Piran/Pirano
00050000-5537-ee02-6905-ed3600f9d776	8255	Pišece
00050000-5537-ee02-671f-e2775292588b	6257	Pivka
00050000-5537-ee02-09f8-2d0dfb349dcb	6232	Planina
00050000-5537-ee02-c5b9-5b3dfb340f35	3225	Planina pri Sevnici
00050000-5537-ee02-0821-dbc39506f1f3	6276	Pobegi
00050000-5537-ee02-6a3c-d241dc795066	8312	Podbočje
00050000-5537-ee02-df47-615df6bb7b28	5243	Podbrdo
00050000-5537-ee02-e805-cb79e067067d	3254	Podčetrtek
00050000-5537-ee02-8af3-67ecaf7c51a4	2273	Podgorci
00050000-5537-ee02-b75d-a62fd9c03e30	6216	Podgorje
00050000-5537-ee02-a053-77ae8cd02517	2381	Podgorje pri Slovenj Gradcu
00050000-5537-ee02-12ec-c72644bad1f6	6244	Podgrad
00050000-5537-ee02-955a-822ed557d4a4	1414	Podkum
00050000-5537-ee02-cae4-7fb8f4be9b78	2286	Podlehnik
00050000-5537-ee02-80f9-9d7c618f578e	5272	Podnanos
00050000-5537-ee02-4aed-6a2b73d89dca	4244	Podnart
00050000-5537-ee02-8857-2106fdcc740a	3241	Podplat
00050000-5537-ee02-887a-15200030b806	3257	Podsreda
00050000-5537-ee02-01c6-c40dd56f02ac	2363	Podvelka
00050000-5537-ee02-95e6-ea326e2123af	2208	Pohorje
00050000-5537-ee02-da9e-01d511a4534b	2257	Polenšak
00050000-5537-ee02-100f-94d0094503c2	1355	Polhov Gradec
00050000-5537-ee02-1f00-60da0dbc2e51	4223	Poljane nad Škofjo Loko
00050000-5537-ee02-e7e2-5c921489dd88	2319	Poljčane
00050000-5537-ee02-72a4-4670cddd59c4	1272	Polšnik
00050000-5537-ee02-dfe3-8a8ea009b706	3313	Polzela
00050000-5537-ee02-fc50-a2c29bb4dc1a	3232	Ponikva
00050000-5537-ee02-3914-72e640cd02c9	6320	Portorož/Portorose
00050000-5537-ee02-9239-eb121120dee8	6230	Postojna
00050000-5537-ee02-438b-ed8fa6a00e9d	2331	Pragersko
00050000-5537-ee02-50fc-02df51e484a9	3312	Prebold
00050000-5537-ee02-b53e-1c03a5cdbd5a	4205	Preddvor
00050000-5537-ee02-2992-370836e9b38c	6255	Prem
00050000-5537-ee02-50f8-3bccdd347b28	1352	Preserje
00050000-5537-ee02-b3b3-5c6b21c526ff	6258	Prestranek
00050000-5537-ee02-05cd-467d1c6a29ff	2391	Prevalje
00050000-5537-ee02-cd38-763c72224579	3262	Prevorje
00050000-5537-ee02-1543-846dc28656d4	1276	Primskovo 
00050000-5537-ee02-1eeb-274d2f14d25f	3253	Pristava pri Mestinju
00050000-5537-ee02-e3bd-ae199f8611e7	9207	Prosenjakovci/Partosfalva
00050000-5537-ee02-0422-8c26d2763703	5297	Prvačina
00050000-5537-ee02-3b24-610052ce9d20	2250	Ptuj
00050000-5537-ee02-15ac-1cca74d193b1	2323	Ptujska Gora
00050000-5537-ee02-aa35-ba660cfccdae	9201	Puconci
00050000-5537-ee02-9980-fc5ddd2886c6	2327	Rače
00050000-5537-ee02-d8ca-01fb2fad1c57	1433	Radeče
00050000-5537-ee02-8bec-10393359c932	9252	Radenci
00050000-5537-ee02-88c0-bf1a1b4cf47b	2360	Radlje ob Dravi
00050000-5537-ee02-a791-bb0d8f99a573	1235	Radomlje
00050000-5537-ee02-8f51-db14b5f31e48	4240	Radovljica
00050000-5537-ee02-9a5f-af77955d01be	8274	Raka
00050000-5537-ee02-b790-87950b0f007f	1381	Rakek
00050000-5537-ee02-34ef-61bfb6f827e8	4283	Rateče - Planica
00050000-5537-ee02-eb91-3e549276f71e	2390	Ravne na Koroškem
00050000-5537-ee02-634a-646100b98923	9246	Razkrižje
00050000-5537-ee02-194c-82d4a0f3454c	3332	Rečica ob Savinji
00050000-5537-ee02-e801-c51fbc169815	5292	Renče
00050000-5537-ee02-faa7-d03ea20fce54	1310	Ribnica
00050000-5537-ee02-0627-5bbf797eb4d1	2364	Ribnica na Pohorju
00050000-5537-ee02-2794-2cd59f2b47ec	3272	Rimske Toplice
00050000-5537-ee02-ebd4-0c2d3b0ab196	1314	Rob
00050000-5537-ee02-e938-ccd3f9ad4dca	5215	Ročinj
00050000-5537-ee02-5436-e863fe09e19b	3250	Rogaška Slatina
00050000-5537-ee02-e36f-90023e88ca2d	9262	Rogašovci
00050000-5537-ee02-803c-753d1db087f4	3252	Rogatec
00050000-5537-ee02-d42c-093fca08f62f	1373	Rovte
00050000-5537-ee02-f638-b02e09342524	2342	Ruše
00050000-5537-ee02-d434-c2db154d0b7a	1282	Sava
00050000-5537-ee02-f8f6-38069ddc10ff	6333	Sečovlje/Sicciole
00050000-5537-ee02-da2a-f5160b9d2ca6	4227	Selca
00050000-5537-ee02-2d02-9ff46f4b140d	2352	Selnica ob Dravi
00050000-5537-ee02-5732-70efb9eb816d	8333	Semič
00050000-5537-ee02-a637-64793259c9d6	8281	Senovo
00050000-5537-ee02-ef3f-7adf7df4ccd4	6224	Senožeče
00050000-5537-ee02-e6da-ad135d533309	8290	Sevnica
00050000-5537-ee02-b490-0725f92c46be	6210	Sežana
00050000-5537-ee02-b192-fac10aac975f	2214	Sladki Vrh
00050000-5537-ee02-3c8e-d9ebbeb0f924	5283	Slap ob Idrijci
00050000-5537-ee02-25c0-1cacac9ed3d3	2380	Slovenj Gradec
00050000-5537-ee02-77a6-9ddf5e64529f	2310	Slovenska Bistrica
00050000-5537-ee02-2de6-cf6c816f7090	3210	Slovenske Konjice
00050000-5537-ee02-fc2b-984d0605be28	1216	Smlednik
00050000-5537-ee02-d6c3-a2c3ea1a0920	5232	Soča
00050000-5537-ee02-35ea-9850d40c25c8	1317	Sodražica
00050000-5537-ee02-8bea-5b8000a3d831	3335	Solčava
00050000-5537-ee02-673f-e048da55b279	5250	Solkan
00050000-5537-ee02-dfb1-afa21f8f69f9	4229	Sorica
00050000-5537-ee02-840b-f19128864516	4225	Sovodenj
00050000-5537-ee02-c821-1b62b2e378b3	5281	Spodnja Idrija
00050000-5537-ee02-bde5-d3c42fe66628	2241	Spodnji Duplek
00050000-5537-ee02-ae29-491884ab9ecd	9245	Spodnji Ivanjci
00050000-5537-ee02-6590-329277807a22	2277	Središče ob Dravi
00050000-5537-ee02-d40f-465438d02f66	4267	Srednja vas v Bohinju
00050000-5537-ee02-bbf5-84e9718a240f	8256	Sromlje 
00050000-5537-ee02-6a7a-33688301d02f	5224	Srpenica
00050000-5537-ee02-3c1e-a4697a58f130	1242	Stahovica
00050000-5537-ee02-5964-3193315a55fd	1332	Stara Cerkev
00050000-5537-ee02-4675-f0376988eff2	8342	Stari trg ob Kolpi
00050000-5537-ee02-73cc-006803bb15fe	1386	Stari trg pri Ložu
00050000-5537-ee02-7f11-4d41a6fa1097	2205	Starše
00050000-5537-ee02-9fa0-243ee88f86af	2289	Stoperce
00050000-5537-ee02-f075-5bee70d4dd55	8322	Stopiče
00050000-5537-ee02-dedf-b69ecdfbc89c	3206	Stranice
00050000-5537-ee02-1812-b45e6ffebc36	8351	Straža
00050000-5537-ee02-e36a-5c29e2cf9abd	1313	Struge
00050000-5537-ee02-cbfb-a1342327f8ce	8293	Studenec
00050000-5537-ee02-4014-527d6daaea6e	8331	Suhor
00050000-5537-ee02-953a-0e242a0c2a67	2233	Sv. Ana v Slovenskih goricah
00050000-5537-ee02-5888-57050e33a25e	2235	Sv. Trojica v Slovenskih goricah
00050000-5537-ee02-8165-f41f0693d5de	2353	Sveti Duh na Ostrem Vrhu
00050000-5537-ee02-5b47-ab5185dc584a	9244	Sveti Jurij ob Ščavnici
00050000-5537-ee02-757f-7202b1e2009f	3264	Sveti Štefan
00050000-5537-ee02-aca5-6872ab27af1a	2258	Sveti Tomaž
00050000-5537-ee02-8eea-83a8610e7c07	9204	Šalovci
00050000-5537-ee02-18a7-ca7d7bdbf341	5261	Šempas
00050000-5537-ee02-d47b-dd4018d42f11	5290	Šempeter pri Gorici
00050000-5537-ee02-f64c-71d5c57c2274	3311	Šempeter v Savinjski dolini
00050000-5537-ee02-c040-e52bd82b8d2d	4208	Šenčur
00050000-5537-ee02-6bac-7422bbebda61	2212	Šentilj v Slovenskih goricah
00050000-5537-ee02-89ce-64f381ef0e17	8297	Šentjanž
00050000-5537-ee02-cfcd-b520b77aae7b	2373	Šentjanž pri Dravogradu
00050000-5537-ee02-b60e-0082df7a830d	8310	Šentjernej
00050000-5537-ee02-9ae8-88467df7b4ee	3230	Šentjur
00050000-5537-ee02-bbce-c2d1d3b45798	3271	Šentrupert
00050000-5537-ee02-3f76-c4a23783b257	8232	Šentrupert
00050000-5537-ee02-a20b-da62df131805	1296	Šentvid pri Stični
00050000-5537-ee02-a26d-65fdddc9aa04	8275	Škocjan
00050000-5537-ee02-6033-0ebb4ded6356	6281	Škofije
00050000-5537-ee02-1aaa-b0b0935ab42f	4220	Škofja Loka
00050000-5537-ee02-d885-671a93595b26	3211	Škofja vas
00050000-5537-ee02-f247-bd87bd161570	1291	Škofljica
00050000-5537-ee02-12bc-bc7aa7a7cb9e	6274	Šmarje
00050000-5537-ee02-4a20-61842a305779	1293	Šmarje - Sap
00050000-5537-ee02-c742-3be393faeb74	3240	Šmarje pri Jelšah
00050000-5537-ee02-004b-6f5f1a468216	8220	Šmarješke Toplice
00050000-5537-ee02-7a5d-f09b595e2513	2315	Šmartno na Pohorju
00050000-5537-ee02-e2df-445437787193	3341	Šmartno ob Dreti
00050000-5537-ee02-b2e3-ec326a3f138e	3327	Šmartno ob Paki
00050000-5537-ee02-c844-3d086aa9c8dc	1275	Šmartno pri Litiji
00050000-5537-ee02-8daf-94ac1959926a	2383	Šmartno pri Slovenj Gradcu
00050000-5537-ee02-875c-7aae27aa7b0b	3201	Šmartno v Rožni dolini
00050000-5537-ee02-f3b9-9f517455905f	3325	Šoštanj
00050000-5537-ee02-3164-432e25ff1937	6222	Štanjel
00050000-5537-ee02-ed72-6ec0c80f7170	3220	Štore
00050000-5537-ee02-60e2-c3a605acb753	3304	Tabor
00050000-5537-ee02-1533-f8e8ee6b1553	3221	Teharje
00050000-5537-ee02-6dc0-fa71148b7d25	9251	Tišina
00050000-5537-ee02-0442-5bc5b811a4af	5220	Tolmin
00050000-5537-ee02-e60a-92c3adeaeab7	3326	Topolšica
00050000-5537-ee02-2ac2-0a03e5c35bed	2371	Trbonje
00050000-5537-ee02-6b24-e5750baae38c	1420	Trbovlje
00050000-5537-ee02-b32d-8291e708cd26	8231	Trebelno 
00050000-5537-ee02-653e-b94f0c9710af	8210	Trebnje
00050000-5537-ee02-c001-9fdcf79495b1	5252	Trnovo pri Gorici
00050000-5537-ee02-6c4b-b6155b0a644b	2254	Trnovska vas
00050000-5537-ee02-0fbb-c67c2e36886e	1222	Trojane
00050000-5537-ee02-2c29-a15ed23e2617	1236	Trzin
00050000-5537-ee02-d43e-bebda72b00f8	4290	Tržič
00050000-5537-ee02-eefc-6ac1fc16602a	8295	Tržišče
00050000-5537-ee02-ed81-65a99a946e3e	1311	Turjak
00050000-5537-ee02-f674-35033c43e72a	9224	Turnišče
00050000-5537-ee02-a938-1279c4b3e85a	8323	Uršna sela
00050000-5537-ee02-04a9-395ea5a4f2fb	1252	Vače
00050000-5537-ee02-9fb0-c189f19f5da9	3320	Velenje 
00050000-5537-ee02-c5e1-cdc52a1c7c11	3322	Velenje - poštni predali
00050000-5537-ee02-b31d-09c6dc8710f9	8212	Velika Loka
00050000-5537-ee02-c33e-d7070d5a8f36	2274	Velika Nedelja
00050000-5537-ee02-08bd-13f92c42ade8	9225	Velika Polana
00050000-5537-ee02-2217-461adf06a107	1315	Velike Lašče
00050000-5537-ee02-823f-2ed50759dba0	8213	Veliki Gaber
00050000-5537-ee02-6f4b-8c0a2c4de24b	9241	Veržej
00050000-5537-ee02-edb7-4a8bb5dae465	1312	Videm - Dobrepolje
00050000-5537-ee02-6152-0a390c718473	2284	Videm pri Ptuju
00050000-5537-ee02-0a03-64c101a6a466	8344	Vinica
00050000-5537-ee02-ee14-709a816a61ec	5271	Vipava
00050000-5537-ee02-58a2-39ef35a749e1	4212	Visoko
00050000-5537-ee02-f3da-1cf1d0872036	1294	Višnja Gora
00050000-5537-ee02-c756-fe7984f18f3d	3205	Vitanje
00050000-5537-ee02-c48d-35b028f5d78d	2255	Vitomarci
00050000-5537-ee02-85d2-9612a11ea6ab	1217	Vodice
00050000-5537-ee02-8495-402781abbbd3	3212	Vojnik\t
00050000-5537-ee02-d712-8e2d51d34c5d	5293	Volčja Draga
00050000-5537-ee02-c5cb-416f56f6232d	2232	Voličina
00050000-5537-ee02-08b6-907ee01df333	3305	Vransko
00050000-5537-ee02-7203-8966f18735ff	6217	Vremski Britof
00050000-5537-ee02-68eb-8dc986063230	1360	Vrhnika
00050000-5537-ee02-2130-3f03d60c6342	2365	Vuhred
00050000-5537-ee02-9d2d-05add63b6a7b	2367	Vuzenica
00050000-5537-ee02-ad33-e7c6ec6ea293	8292	Zabukovje 
00050000-5537-ee02-74ce-452dbf19ff74	1410	Zagorje ob Savi
00050000-5537-ee02-85e4-2e608497a9fe	1303	Zagradec
00050000-5537-ee02-a91c-8741d8c77af6	2283	Zavrč
00050000-5537-ee02-3224-cb1f88927cd0	8272	Zdole 
00050000-5537-ee02-84a5-3c03be126cdf	4201	Zgornja Besnica
00050000-5537-ee02-d87b-ffaa578bca07	2242	Zgornja Korena
00050000-5537-ee02-dd9a-c66ebc3f4fa0	2201	Zgornja Kungota
00050000-5537-ee02-1886-50f0a6b26f63	2316	Zgornja Ložnica
00050000-5537-ee02-4e33-c872395c480c	2314	Zgornja Polskava
00050000-5537-ee02-ac9d-5f3fc7258768	2213	Zgornja Velka
00050000-5537-ee02-18fd-1e02c136277f	4247	Zgornje Gorje
00050000-5537-ee02-7cd2-520a03e4a175	4206	Zgornje Jezersko
00050000-5537-ee02-fa20-52606684f4a6	2285	Zgornji Leskovec
00050000-5537-ee02-d7b6-d0abdc4386e6	1432	Zidani Most
00050000-5537-ee02-86c7-c5b1f50ed8b3	3214	Zreče
00050000-5537-ee02-55f9-aacd13fbd677	4209	Žabnica
00050000-5537-ee02-b528-e80f1a09855d	3310	Žalec
00050000-5537-ee02-4039-c8144ac9813b	4228	Železniki
00050000-5537-ee02-f009-2fe3b8dc3755	2287	Žetale
00050000-5537-ee02-7d4f-0a6c9c9a12c6	4226	Žiri
00050000-5537-ee02-7a06-7b9904b9442e	4274	Žirovnica
00050000-5537-ee02-97ed-28e91f015baf	8360	Žužemberk
\.


--
-- TOC entry 2661 (class 0 OID 865373)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 865196)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 865262)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 865385)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 865490)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 865534)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 865414)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 865358)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 865348)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 865524)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 865480)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 865061)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5537-ee04-5953-c416fa003915	00010000-5537-ee04-61a1-a50bf67b9d03	2015-04-22 20:52:52	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROq03ghHQWBPJ14mR5o5Mb.gQS3WL.RXS";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2668 (class 0 OID 865423)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 865099)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5537-ee04-bea6-f7b299be4dfc	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5537-ee04-8f97-6715381c847f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5537-ee04-b858-478b309ee871	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5537-ee04-d33f-47679fedff43	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5537-ee04-2735-b94d655656a7	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5537-ee04-a1a2-5eaced88b7a9	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2634 (class 0 OID 865083)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5537-ee04-5953-c416fa003915	00000000-5537-ee04-d33f-47679fedff43
00010000-5537-ee04-61a1-a50bf67b9d03	00000000-5537-ee04-d33f-47679fedff43
\.


--
-- TOC entry 2670 (class 0 OID 865437)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 865379)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 865329)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 865161)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 865335)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 865515)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 865231)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 865070)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5537-ee04-61a1-a50bf67b9d03	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROlJqlWETkxDp9OWp.V3zIMyijZ0ilTpu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5537-ee04-5953-c416fa003915	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2682 (class 0 OID 865565)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 865277)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 865406)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 865472)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 865305)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 865555)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 865462)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 865124)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 865604)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 865597)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 865514)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 865295)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 865328)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 865257)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 865458)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 865275)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 865322)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2250 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 865371)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 865398)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 865229)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 865133)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 865193)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2282 (class 2606 OID 865158)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 865113)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 865098)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 865404)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 865436)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 865551)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 865186)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 865217)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 865377)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 865207)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 865266)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 865389)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 865496)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 865539)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 865421)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 865362)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 865353)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 865533)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 865487)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 865069)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 865427)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 865087)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 865107)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 865445)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 865384)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 865334)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 865166)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 865344)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 865523)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 865242)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 865082)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 865579)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 865281)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 865412)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 865478)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 865317)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 865564)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 865471)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 1259 OID 865302)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2288 (class 1259 OID 865188)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2252 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2253 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2254 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2379 (class 1259 OID 865405)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2373 (class 1259 OID 865391)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2374 (class 1259 OID 865390)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2325 (class 1259 OID 865282)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 865461)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2401 (class 1259 OID 865459)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 865460)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2425 (class 1259 OID 865552)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 865553)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2427 (class 1259 OID 865554)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2432 (class 1259 OID 865582)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2433 (class 1259 OID 865581)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2434 (class 1259 OID 865580)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2307 (class 1259 OID 865244)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2308 (class 1259 OID 865243)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 865195)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2293 (class 1259 OID 865194)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2280 (class 1259 OID 865160)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2388 (class 1259 OID 865428)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2343 (class 1259 OID 865323)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 865114)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 865115)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2393 (class 1259 OID 865448)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2394 (class 1259 OID 865447)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2395 (class 1259 OID 865446)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2317 (class 1259 OID 865267)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2318 (class 1259 OID 865269)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2319 (class 1259 OID 865268)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2353 (class 1259 OID 865357)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2354 (class 1259 OID 865355)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2355 (class 1259 OID 865354)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2356 (class 1259 OID 865356)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 865088)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 865089)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2382 (class 1259 OID 865413)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2368 (class 1259 OID 865378)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2408 (class 1259 OID 865488)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2409 (class 1259 OID 865489)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2296 (class 1259 OID 865209)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2297 (class 1259 OID 865208)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2298 (class 1259 OID 865210)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2412 (class 1259 OID 865497)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2413 (class 1259 OID 865498)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2443 (class 1259 OID 865607)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2444 (class 1259 OID 865606)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2445 (class 1259 OID 865609)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2446 (class 1259 OID 865605)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2447 (class 1259 OID 865608)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2405 (class 1259 OID 865479)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2359 (class 1259 OID 865366)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2360 (class 1259 OID 865365)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2361 (class 1259 OID 865363)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2362 (class 1259 OID 865364)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2439 (class 1259 OID 865599)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 865598)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2324 (class 1259 OID 865276)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 865135)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 865134)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2284 (class 1259 OID 865167)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2285 (class 1259 OID 865168)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 865347)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2349 (class 1259 OID 865346)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2350 (class 1259 OID 865345)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2331 (class 1259 OID 865304)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2332 (class 1259 OID 865300)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2333 (class 1259 OID 865297)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2334 (class 1259 OID 865298)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2335 (class 1259 OID 865296)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2336 (class 1259 OID 865301)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2337 (class 1259 OID 865299)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2291 (class 1259 OID 865187)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 865258)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2314 (class 1259 OID 865260)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2315 (class 1259 OID 865259)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2316 (class 1259 OID 865261)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2367 (class 1259 OID 865372)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2283 (class 1259 OID 865159)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2306 (class 1259 OID 865230)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2387 (class 1259 OID 865422)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2303 (class 1259 OID 865218)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2424 (class 1259 OID 865540)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 865108)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2338 (class 1259 OID 865303)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2475 (class 2606 OID 865745)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2472 (class 2606 OID 865730)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 865735)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2477 (class 2606 OID 865755)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2471 (class 2606 OID 865725)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2476 (class 2606 OID 865750)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2474 (class 2606 OID 865740)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2458 (class 2606 OID 865660)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2494 (class 2606 OID 865840)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2493 (class 2606 OID 865835)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2492 (class 2606 OID 865830)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2470 (class 2606 OID 865720)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2502 (class 2606 OID 865880)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 865870)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2501 (class 2606 OID 865875)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2490 (class 2606 OID 865820)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 865915)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2510 (class 2606 OID 865920)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 865925)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2514 (class 2606 OID 865940)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2513 (class 2606 OID 865935)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 865930)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2465 (class 2606 OID 865695)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2464 (class 2606 OID 865690)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2460 (class 2606 OID 865670)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 865665)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 865645)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2454 (class 2606 OID 865640)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2496 (class 2606 OID 865850)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2478 (class 2606 OID 865760)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 865620)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2451 (class 2606 OID 865625)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2499 (class 2606 OID 865865)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2498 (class 2606 OID 865860)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 865855)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 865700)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2468 (class 2606 OID 865710)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2467 (class 2606 OID 865705)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2485 (class 2606 OID 865795)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2483 (class 2606 OID 865785)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2482 (class 2606 OID 865780)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2484 (class 2606 OID 865790)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 865610)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2449 (class 2606 OID 865615)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2495 (class 2606 OID 865845)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2491 (class 2606 OID 865825)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2504 (class 2606 OID 865890)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2505 (class 2606 OID 865895)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2462 (class 2606 OID 865680)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 865675)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2463 (class 2606 OID 865685)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 865900)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2507 (class 2606 OID 865905)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2519 (class 2606 OID 865965)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 865960)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2521 (class 2606 OID 865975)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2517 (class 2606 OID 865955)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2520 (class 2606 OID 865970)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2503 (class 2606 OID 865885)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2489 (class 2606 OID 865815)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2488 (class 2606 OID 865810)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2486 (class 2606 OID 865800)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2487 (class 2606 OID 865805)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2516 (class 2606 OID 865950)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 865945)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2469 (class 2606 OID 865715)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2508 (class 2606 OID 865910)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 865635)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 865630)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2456 (class 2606 OID 865650)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 865655)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2481 (class 2606 OID 865775)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 865770)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 865765)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-22 20:53:02 CEST

--
-- PostgreSQL database dump complete
--

