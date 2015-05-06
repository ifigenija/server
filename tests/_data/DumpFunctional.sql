--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-06 11:51:35 CEST

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
-- TOC entry 179 (class 1259 OID 2390538)
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
-- TOC entry 225 (class 1259 OID 2391020)
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
-- TOC entry 224 (class 1259 OID 2391003)
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
-- TOC entry 217 (class 1259 OID 2390919)
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
-- TOC entry 193 (class 1259 OID 2390703)
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
-- TOC entry 196 (class 1259 OID 2390744)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 2390665)
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
-- TOC entry 212 (class 1259 OID 2390869)
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
-- TOC entry 191 (class 1259 OID 2390690)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 2390738)
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
-- TOC entry 201 (class 1259 OID 2390787)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 2390812)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 2390639)
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
-- TOC entry 180 (class 1259 OID 2390547)
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
-- TOC entry 181 (class 1259 OID 2390558)
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
-- TOC entry 184 (class 1259 OID 2390609)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 2390512)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 2390531)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 2390819)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 2390849)
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
-- TOC entry 221 (class 1259 OID 2390961)
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
-- TOC entry 183 (class 1259 OID 2390589)
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
-- TOC entry 186 (class 1259 OID 2390631)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 2390793)
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
-- TOC entry 185 (class 1259 OID 2390616)
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
-- TOC entry 190 (class 1259 OID 2390682)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 2390805)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 2390910)
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
-- TOC entry 220 (class 1259 OID 2390954)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 2390834)
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
-- TOC entry 200 (class 1259 OID 2390778)
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
-- TOC entry 199 (class 1259 OID 2390768)
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
-- TOC entry 219 (class 1259 OID 2390944)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 2390900)
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
-- TOC entry 173 (class 1259 OID 2390482)
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
-- TOC entry 172 (class 1259 OID 2390480)
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
-- TOC entry 209 (class 1259 OID 2390843)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 2390522)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 2390505)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 2390857)
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
-- TOC entry 203 (class 1259 OID 2390799)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 2390749)
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
-- TOC entry 182 (class 1259 OID 2390581)
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
-- TOC entry 198 (class 1259 OID 2390755)
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
-- TOC entry 218 (class 1259 OID 2390935)
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
-- TOC entry 188 (class 1259 OID 2390651)
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
-- TOC entry 174 (class 1259 OID 2390491)
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
-- TOC entry 223 (class 1259 OID 2390985)
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
-- TOC entry 192 (class 1259 OID 2390697)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 2390826)
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
-- TOC entry 214 (class 1259 OID 2390892)
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
-- TOC entry 194 (class 1259 OID 2390725)
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
-- TOC entry 222 (class 1259 OID 2390975)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 2390882)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 2390485)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 2390538)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 2391020)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 2391003)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 2390919)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 2390703)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 2390744)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 2390665)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5549-e426-9095-6e2ade1a1c07	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5549-e426-d7c4-3b9e69e9179e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5549-e426-1a26-9cf7a8bdab4f	AL	ALB	008	Albania 	Albanija	\N
00040000-5549-e426-080a-c06fcf6b1a04	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5549-e426-2058-779d4022e866	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5549-e426-a558-7d252cefa94f	AD	AND	020	Andorra 	Andora	\N
00040000-5549-e426-ec94-f11de8de0f55	AO	AGO	024	Angola 	Angola	\N
00040000-5549-e426-398a-e90aa41eac27	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5549-e426-2d43-52559caf33ba	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5549-e426-8682-0c1a98f9729d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5549-e426-7085-1bb2d0e01cde	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5549-e426-fbfd-488aa5023c06	AM	ARM	051	Armenia 	Armenija	\N
00040000-5549-e426-6c0c-f26b6d4f6934	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5549-e426-7476-90339f65c685	AU	AUS	036	Australia 	Avstralija	\N
00040000-5549-e426-e2a1-0d9b64e999b9	AT	AUT	040	Austria 	Avstrija	\N
00040000-5549-e426-2c46-fe5b8132ddfd	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5549-e426-30d6-96b907f3b3df	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5549-e426-818f-4d7632e574dc	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5549-e426-e940-4fde17a8a3bb	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5549-e426-1be4-8b33addee99f	BB	BRB	052	Barbados 	Barbados	\N
00040000-5549-e426-9798-87165ed860e8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5549-e426-ac74-caee8c997c76	BE	BEL	056	Belgium 	Belgija	\N
00040000-5549-e426-c063-32bd18657034	BZ	BLZ	084	Belize 	Belize	\N
00040000-5549-e426-e99b-0bdb38c931ac	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5549-e426-8264-b2d30feae007	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5549-e426-30b5-3c7f2acd24a6	BT	BTN	064	Bhutan 	Butan	\N
00040000-5549-e426-b3ec-f4417e619bbe	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5549-e426-60b4-600ed2c32fa3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5549-e426-f40f-1b20c1be42eb	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5549-e426-7b5f-1647adb632e5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5549-e426-f47e-ab40fd82218d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5549-e426-fa6d-555d79ad0dfc	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5549-e426-702d-4928912d0ce9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5549-e426-374e-95bedcd655c3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5549-e426-8db8-9a118bf34924	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5549-e426-4e08-b2cc3d897f11	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5549-e426-b76a-a3acce78dea8	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5549-e426-e091-be6348302b22	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5549-e426-7807-7b0eafe61e3a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5549-e426-7407-f852a6068d3e	CA	CAN	124	Canada 	Kanada	\N
00040000-5549-e426-1948-76e7115e5cb6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5549-e426-9303-0d1979c1907b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5549-e426-4309-95a935011be4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5549-e426-3268-213d17b420b9	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5549-e426-dd8f-f85d15b0196c	CL	CHL	152	Chile 	Čile	\N
00040000-5549-e426-c8a3-2899178a33bd	CN	CHN	156	China 	Kitajska	\N
00040000-5549-e426-87f1-f173f4618623	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5549-e426-e9c9-9e3b4d527899	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5549-e426-3bee-7efb58ac2ec9	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5549-e426-c37e-98d8c1bd51ba	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5549-e426-5700-60c972651f91	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5549-e426-9364-a6c57a027539	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5549-e426-e7ea-f0101a24b719	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5549-e426-6540-7ecb9f266c91	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5549-e426-f5d6-0ae3f50c9d64	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5549-e426-f618-adbbb75a135f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5549-e426-ac3f-4bf39779e3cd	CU	CUB	192	Cuba 	Kuba	\N
00040000-5549-e426-c1f6-b8733dc4b882	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5549-e426-5e1a-9bf03b1ff77e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5549-e426-e5bb-c90fd72979a5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5549-e426-160e-c9d78069d90b	DK	DNK	208	Denmark 	Danska	\N
00040000-5549-e426-e464-c971d1c79e51	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5549-e426-8801-4b58f286e9e8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5549-e426-ba2f-ffa5c1abaf3a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5549-e426-6037-b3ef5a470bc5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5549-e426-c97e-7f42f3aec9e2	EG	EGY	818	Egypt 	Egipt	\N
00040000-5549-e426-1c22-60652e664ce1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5549-e426-b1ab-abbfd51049f9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5549-e426-60ff-60700950d87d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5549-e426-248e-53005a0d491f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5549-e426-72d3-a465642e83e9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5549-e426-0bde-71223b4067a1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5549-e426-fe6d-be9bd45db86e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5549-e426-df0c-2f7e21cb4784	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5549-e426-e27b-b80ca36e8179	FI	FIN	246	Finland 	Finska	\N
00040000-5549-e426-6d4b-3fc78ac50f8a	FR	FRA	250	France 	Francija	\N
00040000-5549-e426-fdbe-4c6dda8b2c30	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5549-e426-e465-4dd76e8362ae	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5549-e426-9946-73a83ab56059	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5549-e426-5e7c-48d09b696d93	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5549-e426-a192-ea694af5cc14	GA	GAB	266	Gabon 	Gabon	\N
00040000-5549-e426-2512-8fdce12141a7	GM	GMB	270	Gambia 	Gambija	\N
00040000-5549-e426-7b02-8f459cfaec1b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5549-e426-9910-931e6a1870f7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5549-e426-2cba-375644ecf289	GH	GHA	288	Ghana 	Gana	\N
00040000-5549-e426-74a4-0a10b54d7873	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5549-e426-c16c-3cea18bec67b	GR	GRC	300	Greece 	Grčija	\N
00040000-5549-e426-b6da-ce01fb3be0e1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5549-e426-f9de-55917530f513	GD	GRD	308	Grenada 	Grenada	\N
00040000-5549-e426-98c6-804241a1e81e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5549-e426-d87b-54b012460297	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5549-e426-eb5a-24415c4f2e5a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5549-e426-f5df-3cde2beab1d9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5549-e426-43ec-cfb2316c6763	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5549-e426-3c3a-0b575238b4ab	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5549-e426-ab5c-0a81af58f285	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5549-e426-a458-417a380cb9da	HT	HTI	332	Haiti 	Haiti	\N
00040000-5549-e426-1394-5f1a779288ec	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5549-e426-df2c-0f2c5d65ea88	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5549-e426-626e-b861427ae4bb	HN	HND	340	Honduras 	Honduras	\N
00040000-5549-e426-9c94-0c4efd745e18	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5549-e426-512b-7a86ed4d27ac	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5549-e426-e185-5c3d211ee572	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5549-e426-ecd7-7b2d9848143e	IN	IND	356	India 	Indija	\N
00040000-5549-e426-80b2-5049e928ed4e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5549-e426-b5b1-3179cb1d14ea	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5549-e426-d72c-486efa4e40e1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5549-e426-f06c-3c93c7fd530f	IE	IRL	372	Ireland 	Irska	\N
00040000-5549-e426-4140-3001cabea3c6	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5549-e426-04a0-826768b8ddf8	IL	ISR	376	Israel 	Izrael	\N
00040000-5549-e426-77b7-3a676512da46	IT	ITA	380	Italy 	Italija	\N
00040000-5549-e426-bef4-5e2ef5839b42	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5549-e426-d033-3fba13948520	JP	JPN	392	Japan 	Japonska	\N
00040000-5549-e426-3403-64e5810d4773	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5549-e426-431c-e3faf4f13c22	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5549-e426-f86b-3273b0e8cd91	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5549-e426-958f-a8db030b065e	KE	KEN	404	Kenya 	Kenija	\N
00040000-5549-e426-919d-6715ab5a805d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5549-e426-0314-3939d234cad9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5549-e426-3651-cbec1a1eca16	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5549-e426-ec9e-ecd23eba0aa7	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5549-e426-58bd-40aa98a5cf0d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5549-e426-393f-565e3ab21d1c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5549-e426-57c4-8b465be4f70b	LV	LVA	428	Latvia 	Latvija	\N
00040000-5549-e426-4829-55169cc59d78	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5549-e426-7c85-9d70075ef69f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5549-e426-dd09-9f1c5ca6a8b3	LR	LBR	430	Liberia 	Liberija	\N
00040000-5549-e426-f0da-1fd7574880c3	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5549-e426-ee5f-019d59ef4d9b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5549-e426-ccbd-d2424a30cecc	LT	LTU	440	Lithuania 	Litva	\N
00040000-5549-e426-1931-5a20dc3579af	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5549-e426-f879-dd073168cfcc	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5549-e426-a122-0ed3491e6f2a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5549-e426-3cc9-f53d03dcfa18	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5549-e426-d252-5554a2c813cd	MW	MWI	454	Malawi 	Malavi	\N
00040000-5549-e426-05b8-3761e7c5aead	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5549-e426-9e5a-b85e4dfff32c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5549-e426-2bbb-6010e5c9c30a	ML	MLI	466	Mali 	Mali	\N
00040000-5549-e426-c048-c14410648da6	MT	MLT	470	Malta 	Malta	\N
00040000-5549-e426-be17-a6e4d689071b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5549-e426-b6cd-e1775f0cb58f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5549-e426-9c0f-9ece11f56281	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5549-e426-2b96-b1c75353857b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5549-e426-b390-17466009d8e9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5549-e426-34df-6041111795d4	MX	MEX	484	Mexico 	Mehika	\N
00040000-5549-e426-4365-3f63ba8a05b8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5549-e426-91e5-fa04c5e6f969	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5549-e426-f216-efc5e82a279a	MC	MCO	492	Monaco 	Monako	\N
00040000-5549-e426-bdb6-30764e475324	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5549-e426-9864-6b78c527646f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5549-e426-368d-baff5dc147b2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5549-e426-ebbb-9b6b77fb4da2	MA	MAR	504	Morocco 	Maroko	\N
00040000-5549-e426-52cd-3d3b40f2b077	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5549-e426-7ec0-993d4209fa2c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5549-e426-7473-a7ef4f328ca1	NA	NAM	516	Namibia 	Namibija	\N
00040000-5549-e426-3804-cba2d5fc6d59	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5549-e426-3367-f1d916f62610	NP	NPL	524	Nepal 	Nepal	\N
00040000-5549-e426-8e5d-d0d2ee76b789	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5549-e426-ae31-e356031cb694	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5549-e426-cad7-2b3350f1c823	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5549-e426-15d4-4d8b6742202c	NE	NER	562	Niger 	Niger 	\N
00040000-5549-e426-e298-d7ead0cdbcb5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5549-e426-07b0-f502cdd02ea6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5549-e426-0ff3-e40c104d5b17	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5549-e426-36c1-587884df8998	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5549-e426-5928-1fb7967dda7f	NO	NOR	578	Norway 	Norveška	\N
00040000-5549-e426-5c83-f7523233f3a5	OM	OMN	512	Oman 	Oman	\N
00040000-5549-e426-8877-c59664fd9661	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5549-e426-5cfe-f5d281abd9b5	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5549-e426-afab-b6c34fa4941c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5549-e426-9adb-085879265097	PA	PAN	591	Panama 	Panama	\N
00040000-5549-e426-2e5a-5e6b8f143658	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5549-e426-4522-280ed4d0a824	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5549-e426-5a89-9b7eb6458df0	PE	PER	604	Peru 	Peru	\N
00040000-5549-e426-2733-ec83de9be4ab	PH	PHL	608	Philippines 	Filipini	\N
00040000-5549-e426-74c1-db0d42213112	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5549-e426-17cc-44dac80c16f5	PL	POL	616	Poland 	Poljska	\N
00040000-5549-e426-cd16-98f17099d977	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5549-e426-d854-f9cb4bc597e7	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5549-e426-6559-a9666e15bc33	QA	QAT	634	Qatar 	Katar	\N
00040000-5549-e426-9290-0d8a345223c8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5549-e426-4626-76b86c1343b1	RO	ROU	642	Romania 	Romunija	\N
00040000-5549-e426-838d-d82f6628ca5b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5549-e426-c3a6-0db1fe5b767f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5549-e426-8e1f-a39d326f9556	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5549-e426-83c6-d95ec0fea0cd	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5549-e426-8dc9-435be580f824	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5549-e426-b4cc-19c4e507627e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5549-e426-8c7b-60feab55b062	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5549-e426-9a4d-c11b8126ed0e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5549-e426-22e1-d234c2d704b0	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5549-e426-7801-376a6b24c983	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5549-e426-5a38-599f6b7e4e62	SM	SMR	674	San Marino 	San Marino	\N
00040000-5549-e426-24f5-f2d5e24ef909	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5549-e426-aeca-04059fdaab20	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5549-e426-6a99-44aed61643c5	SN	SEN	686	Senegal 	Senegal	\N
00040000-5549-e426-6b95-49076b6b1f0d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5549-e426-6c87-6d2923b556ec	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5549-e426-8922-df3ed220b79d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5549-e426-ef1b-0ec0247fad31	SG	SGP	702	Singapore 	Singapur	\N
00040000-5549-e426-5f60-3f518d63b2e7	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5549-e426-add3-983034b24480	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5549-e426-528a-a13f08d80852	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5549-e426-4c0d-8af5df54a963	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5549-e426-e79f-69bf8210faae	SO	SOM	706	Somalia 	Somalija	\N
00040000-5549-e426-2a32-4db1f40dd17a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5549-e426-c968-31efc30cbda2	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5549-e426-a67b-94f6e01abdfa	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5549-e426-10f5-84fbf7796812	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5549-e426-2b48-0b0b0b0dfa57	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5549-e426-f5f8-8a91dcd40255	SD	SDN	729	Sudan 	Sudan	\N
00040000-5549-e426-8144-8a6bbaa0ba98	SR	SUR	740	Suriname 	Surinam	\N
00040000-5549-e426-8489-42bdd855d985	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5549-e426-478a-67c85cb15dd6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5549-e426-d9ae-ec6841b00535	SE	SWE	752	Sweden 	Švedska	\N
00040000-5549-e426-c482-0bb529a1e5d2	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5549-e426-f05b-9520e9c846fa	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5549-e426-dd20-2b8bd73301d9	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5549-e426-06b7-aef52180a2f5	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5549-e426-720c-37931c77481d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5549-e426-5e42-873f955a4bd0	TH	THA	764	Thailand 	Tajska	\N
00040000-5549-e426-47e5-038c8df0bc2b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5549-e426-7764-5194277847aa	TG	TGO	768	Togo 	Togo	\N
00040000-5549-e426-a033-af4605ad0d79	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5549-e426-59a6-b896a217ffc4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5549-e426-0d55-7c9763a8df30	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5549-e426-a027-5c0bc9ff2a9c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5549-e426-7b73-1a7602c043f0	TR	TUR	792	Turkey 	Turčija	\N
00040000-5549-e426-894a-4a30dd6fcb15	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5549-e426-8afa-ac4b96dd0f49	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5549-e426-fcbb-66f39ff1ef13	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5549-e426-eedb-7c2005871953	UG	UGA	800	Uganda 	Uganda	\N
00040000-5549-e426-c350-101c70fd0699	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5549-e426-8a5f-aeb6eed20b62	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5549-e426-5734-3fcb5a2fcd24	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5549-e426-7189-a5be1aad61eb	US	USA	840	United States 	Združene države Amerike	\N
00040000-5549-e426-336a-82735c194030	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5549-e426-57cf-a38e072e7f8e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5549-e426-68d6-9edc0a799053	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5549-e426-ff2c-96d8ca408c3c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5549-e426-5581-88730f391336	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5549-e426-9ee3-df4769f5c7af	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5549-e426-db48-d11ebbf6e3bc	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5549-e426-9e77-6b0dda6ede34	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5549-e426-8706-db881926f86d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5549-e426-6d63-971f92d58fbc	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5549-e426-fa48-25dbcd38fa17	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5549-e426-e73d-9c9fac68e106	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5549-e426-382a-5184125a03a4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 2390869)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 2390690)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 2390738)
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
-- TOC entry 2658 (class 0 OID 2390787)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 2390812)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 2390639)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5549-e427-69ff-d6dc25d92c4e	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5549-e427-1918-1680da7b5bd2	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5549-e427-ff0e-539236a6cbd9	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5549-e427-2c73-65120822e4e5	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5549-e427-cbbc-2faf62ed4a1a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5549-e427-6e44-4f21cc78312b	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5549-e427-6013-dedac43eadc6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5549-e427-63ef-65e01420e314	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5549-e427-b804-adf12a382d75	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5549-e427-5e73-6d428e297dd2	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 2390547)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5549-e427-4435-e7d6d7066afa	00000000-5549-e427-cbbc-2faf62ed4a1a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5549-e427-f6c2-d9abf7201d0c	00000000-5549-e427-cbbc-2faf62ed4a1a	00010000-5549-e426-573e-59286795e864	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5549-e427-ea96-ad8978e36db6	00000000-5549-e427-6e44-4f21cc78312b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 2390558)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 2390609)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 2390512)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5549-e426-e02a-d429f7c7df02	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5549-e426-ad83-64f640264e33	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5549-e426-1d52-2e86f701363c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5549-e426-dc6b-4ba8ef56cfcb	Abonma-read	Abonma - branje	f
00030000-5549-e426-4c86-c4a378a07b6d	Abonma-write	Abonma - spreminjanje	f
00030000-5549-e426-ddc9-ed246db417b1	Alternacija-read	Alternacija - branje	f
00030000-5549-e426-b495-30ff420dc36c	Alternacija-write	Alternacija - spreminjanje	f
00030000-5549-e426-41b3-9eafd7c8cec6	Arhivalija-read	Arhivalija - branje	f
00030000-5549-e426-e6b8-58b541dc7891	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5549-e426-b6f4-fc36bb1c4ce8	Besedilo-read	Besedilo - branje	f
00030000-5549-e426-13ce-f9290029b374	Besedilo-write	Besedilo - spreminjanje	f
00030000-5549-e426-5aab-83ded4bfccb7	DogodekIzven-read	DogodekIzven - branje	f
00030000-5549-e426-cb49-19236698cf16	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5549-e426-b4aa-62990164d4ac	Dogodek-read	Dogodek - branje	f
00030000-5549-e426-a455-923de62073fa	Dogodek-write	Dogodek - spreminjanje	f
00030000-5549-e426-71cf-726add315b48	Drzava-read	Drzava - branje	f
00030000-5549-e426-95c6-93224486a969	Drzava-write	Drzava - spreminjanje	f
00030000-5549-e426-3ff1-6aeb3d47563e	Funkcija-read	Funkcija - branje	f
00030000-5549-e426-7070-96de3106cb94	Funkcija-write	Funkcija - spreminjanje	f
00030000-5549-e426-7c76-b1d1372f8ea5	Gostovanje-read	Gostovanje - branje	f
00030000-5549-e426-8769-1e0b3868629f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5549-e426-b2ee-3b806ce2f3f8	Gostujoca-read	Gostujoca - branje	f
00030000-5549-e426-4c02-5d1e6adb148c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5549-e426-0f97-be31b34d1449	Kupec-read	Kupec - branje	f
00030000-5549-e426-d88c-6621e0eeaaf5	Kupec-write	Kupec - spreminjanje	f
00030000-5549-e426-d8ef-dbde5793e161	NacinPlacina-read	NacinPlacina - branje	f
00030000-5549-e426-0be0-beae97177dda	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5549-e426-46c3-4953893ba852	Option-read	Option - branje	f
00030000-5549-e426-07d5-3c853595648c	Option-write	Option - spreminjanje	f
00030000-5549-e426-ad16-db7c66fcc5cb	OptionValue-read	OptionValue - branje	f
00030000-5549-e426-3e5b-fbdeba829f11	OptionValue-write	OptionValue - spreminjanje	f
00030000-5549-e426-161d-fc4b75a9d976	Oseba-read	Oseba - branje	f
00030000-5549-e426-cbe7-e72b537f6273	Oseba-write	Oseba - spreminjanje	f
00030000-5549-e426-7947-75c7bdedb8f5	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5549-e426-7592-8aa63268aad6	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5549-e426-30e9-253a597bd75e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5549-e426-13fc-346e9c844eac	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5549-e426-afab-916083ef9a3b	Pogodba-read	Pogodba - branje	f
00030000-5549-e426-ab08-13c04a45c0fb	Pogodba-write	Pogodba - spreminjanje	f
00030000-5549-e426-79fa-5334c560369b	Popa-read	Popa - branje	f
00030000-5549-e426-bcde-a511c7d68c64	Popa-write	Popa - spreminjanje	f
00030000-5549-e426-537d-66a4a27118b1	Posta-read	Posta - branje	f
00030000-5549-e426-8f76-dfd2d32dd5c4	Posta-write	Posta - spreminjanje	f
00030000-5549-e426-22b8-33e709b673d0	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5549-e426-a76a-e29952b8c3a3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5549-e426-53a9-a794ead49cfa	PostniNaslov-read	PostniNaslov - branje	f
00030000-5549-e426-2310-bb3b2aa8a179	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5549-e426-070b-cedfc04be432	Predstava-read	Predstava - branje	f
00030000-5549-e426-c709-78d634c486cb	Predstava-write	Predstava - spreminjanje	f
00030000-5549-e426-734d-c83b63346122	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5549-e426-7227-238a98e2bf83	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5549-e426-b9cf-5b96e950440e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5549-e426-6c62-0faee45b21f9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5549-e426-fc29-1f65cb275572	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5549-e426-7849-2d9ca90eaf8f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5549-e426-1250-6ea8fd370e04	Prostor-read	Prostor - branje	f
00030000-5549-e426-9029-1b4c48d42daa	Prostor-write	Prostor - spreminjanje	f
00030000-5549-e426-5623-f18dd5bacbd6	Racun-read	Racun - branje	f
00030000-5549-e426-a12e-6b4814d13caf	Racun-write	Racun - spreminjanje	f
00030000-5549-e426-6d5f-3ef12bca81e0	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5549-e426-4727-2437988d08f9	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5549-e426-437d-5c0cc85dca72	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5549-e426-8b5d-931ec4929b6f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5549-e426-8c7c-1ecc2bbb89d3	Rekvizit-read	Rekvizit - branje	f
00030000-5549-e426-326e-cdd51476d360	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5549-e426-6871-84306204d915	Rezervacija-read	Rezervacija - branje	f
00030000-5549-e426-0809-e9d7c9c70285	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5549-e426-2a97-ab693d11517c	SedezniRed-read	SedezniRed - branje	f
00030000-5549-e426-888a-3544e0ec1fe0	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5549-e426-3686-43111b4ea27e	Sedez-read	Sedez - branje	f
00030000-5549-e426-9ee8-d2429d579ff9	Sedez-write	Sedez - spreminjanje	f
00030000-5549-e426-ca1b-d62c8fc8c73d	Sezona-read	Sezona - branje	f
00030000-5549-e426-7c69-2d8eb2eebf2a	Sezona-write	Sezona - spreminjanje	f
00030000-5549-e426-077b-4bd21af93050	Telefonska-read	Telefonska - branje	f
00030000-5549-e426-75a4-f6b5e748223a	Telefonska-write	Telefonska - spreminjanje	f
00030000-5549-e426-fdab-4efd4dcc8551	TerminStoritve-read	TerminStoritve - branje	f
00030000-5549-e426-3677-24e9603f321e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5549-e426-141a-c7d2cb27339a	TipFunkcije-read	TipFunkcije - branje	f
00030000-5549-e426-6602-50e216e91297	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5549-e426-a597-17e3593e31e0	Trr-read	Trr - branje	f
00030000-5549-e426-cc94-73e2eb3905e5	Trr-write	Trr - spreminjanje	f
00030000-5549-e426-c6d6-f937015c4a05	Uprizoritev-read	Uprizoritev - branje	f
00030000-5549-e426-4d93-93ea09459c91	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5549-e426-8db1-bdbd3b0c6b8c	Vaja-read	Vaja - branje	f
00030000-5549-e426-1565-b217bcec862f	Vaja-write	Vaja - spreminjanje	f
00030000-5549-e426-a136-15bf90de19b8	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5549-e426-ecc4-485b5d562c15	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5549-e426-e842-251d87e470e9	Zaposlitev-read	Zaposlitev - branje	f
00030000-5549-e426-6f80-0bcab64a3b42	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5549-e426-2545-7a62cda1b779	Zasedenost-read	Zasedenost - branje	f
00030000-5549-e426-43c3-1acb16bf1a4d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5549-e426-3c96-a6066ce562cc	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5549-e426-96bd-6b7b5c565635	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5549-e426-f72a-7513663818ef	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5549-e426-1081-915674346d8d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 2390531)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5549-e426-cf0a-0a6a92663f04	00030000-5549-e426-71cf-726add315b48
00020000-5549-e426-7d85-1c80bb0db2af	00030000-5549-e426-95c6-93224486a969
00020000-5549-e426-7d85-1c80bb0db2af	00030000-5549-e426-71cf-726add315b48
\.


--
-- TOC entry 2663 (class 0 OID 2390819)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 2390849)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 2390961)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 2390589)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 2390631)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5549-e426-8d49-ecad1dd72c2c	8341	Adlešiči
00050000-5549-e426-6532-06b750b6a4ce	5270	Ajdovščina
00050000-5549-e426-0db6-cc35104b4814	6280	Ankaran/Ancarano
00050000-5549-e426-926c-8996ed78f5e6	9253	Apače
00050000-5549-e426-d012-fde2f8392e5d	8253	Artiče
00050000-5549-e426-f0f5-77c7a420aef9	4275	Begunje na Gorenjskem
00050000-5549-e426-ee1a-02d182de1495	1382	Begunje pri Cerknici
00050000-5549-e426-7025-216172624e62	9231	Beltinci
00050000-5549-e426-a14b-715e17450e46	2234	Benedikt
00050000-5549-e426-5462-9bc70287d13a	2345	Bistrica ob Dravi
00050000-5549-e426-b877-ea1b4b98d369	3256	Bistrica ob Sotli
00050000-5549-e426-2cae-48e4e059c36d	8259	Bizeljsko
00050000-5549-e426-5238-dd32de9a987c	1223	Blagovica
00050000-5549-e426-45ed-e49dc8d5b163	8283	Blanca
00050000-5549-e426-4eff-ef8c72dd2aea	4260	Bled
00050000-5549-e426-99ba-081759319b17	4273	Blejska Dobrava
00050000-5549-e426-1467-780ce1973362	9265	Bodonci
00050000-5549-e426-5503-4fd5db4a0b4a	9222	Bogojina
00050000-5549-e426-0a3e-24db804be761	4263	Bohinjska Bela
00050000-5549-e426-c00e-38d5049472df	4264	Bohinjska Bistrica
00050000-5549-e426-db80-1aefcf060e25	4265	Bohinjsko jezero
00050000-5549-e426-39c3-c73234e27793	1353	Borovnica
00050000-5549-e426-4646-baa700f351de	8294	Boštanj
00050000-5549-e426-1d91-aa96021f8309	5230	Bovec
00050000-5549-e426-aa7a-c7228f3bcc9f	5295	Branik
00050000-5549-e426-e58d-bc38356f4936	3314	Braslovče
00050000-5549-e426-6e88-8ef87631949b	5223	Breginj
00050000-5549-e426-2f89-610439265d19	8280	Brestanica
00050000-5549-e426-a208-801cbabdc787	2354	Bresternica
00050000-5549-e426-bdb7-fc59c70637d7	4243	Brezje
00050000-5549-e426-fb9f-917381cda612	1351	Brezovica pri Ljubljani
00050000-5549-e426-10d0-2277cffcb9a0	8250	Brežice
00050000-5549-e426-3f6d-63cfa2429166	4210	Brnik - Aerodrom
00050000-5549-e426-b8f1-e8e5fb0102c8	8321	Brusnice
00050000-5549-e426-e857-0f0f1d6b104b	3255	Buče
00050000-5549-e426-133b-03eb00c1e1c9	8276	Bučka 
00050000-5549-e426-b63f-33d35f5ee093	9261	Cankova
00050000-5549-e426-0b65-6ce596e5d0a7	3000	Celje 
00050000-5549-e426-9822-652dee8c1d73	3001	Celje - poštni predali
00050000-5549-e426-f3db-27766b9707ab	4207	Cerklje na Gorenjskem
00050000-5549-e426-c6a3-5a9fc6a96bb5	8263	Cerklje ob Krki
00050000-5549-e426-0e51-1c7ec551f982	1380	Cerknica
00050000-5549-e426-a20c-5849cf69ee90	5282	Cerkno
00050000-5549-e426-c52d-faaefedf78ae	2236	Cerkvenjak
00050000-5549-e426-e211-a417eca6a93a	2215	Ceršak
00050000-5549-e426-330c-ee3de9df52e4	2326	Cirkovce
00050000-5549-e426-3494-aa2897409ef3	2282	Cirkulane
00050000-5549-e426-e359-ff8151304cd0	5273	Col
00050000-5549-e426-a6cc-48692c1d410c	8251	Čatež ob Savi
00050000-5549-e426-1d3a-4ba2afb0b261	1413	Čemšenik
00050000-5549-e426-c94e-b9905d2e4be4	5253	Čepovan
00050000-5549-e426-f6dc-c481ce0c04cf	9232	Črenšovci
00050000-5549-e426-3292-226ce1d78615	2393	Črna na Koroškem
00050000-5549-e426-d503-6c80a9e2fea0	6275	Črni Kal
00050000-5549-e426-3fe6-7afb37609536	5274	Črni Vrh nad Idrijo
00050000-5549-e426-d521-314a6de52b32	5262	Črniče
00050000-5549-e426-e7d5-22966d55cfd3	8340	Črnomelj
00050000-5549-e426-777e-adb341989930	6271	Dekani
00050000-5549-e426-08db-42c36766a3f3	5210	Deskle
00050000-5549-e426-7334-27bef90afe43	2253	Destrnik
00050000-5549-e426-0fce-fb5d4eed7d29	6215	Divača
00050000-5549-e426-d77c-7d8e633373a3	1233	Dob
00050000-5549-e426-be99-785051255a7d	3224	Dobje pri Planini
00050000-5549-e426-f3cd-fdcca4a043c6	8257	Dobova
00050000-5549-e426-6a77-b9b9825ccf5d	1423	Dobovec
00050000-5549-e426-ecdf-3c0d8d6ef32b	5263	Dobravlje
00050000-5549-e426-858c-6b1351c1164c	3204	Dobrna
00050000-5549-e426-de2e-ec36225e7254	8211	Dobrnič
00050000-5549-e426-8e59-0441a990e2ab	1356	Dobrova
00050000-5549-e426-9628-a0205beaacf0	9223	Dobrovnik/Dobronak 
00050000-5549-e426-75a8-bae13427fe60	5212	Dobrovo v Brdih
00050000-5549-e426-844d-cd47df4d246f	1431	Dol pri Hrastniku
00050000-5549-e426-d544-34f17815acce	1262	Dol pri Ljubljani
00050000-5549-e426-ba96-c4e4df218853	1273	Dole pri Litiji
00050000-5549-e426-4732-75a6ed96ad0b	1331	Dolenja vas
00050000-5549-e426-8cee-319fd016f4c0	8350	Dolenjske Toplice
00050000-5549-e426-81ae-7cd21087954a	1230	Domžale
00050000-5549-e426-e374-7c420b9e95e9	2252	Dornava
00050000-5549-e426-b4cc-73502da93b84	5294	Dornberk
00050000-5549-e426-13b1-ff4c4edbef67	1319	Draga
00050000-5549-e426-1d04-adfe430e526f	8343	Dragatuš
00050000-5549-e426-b889-ab4d1d674b11	3222	Dramlje
00050000-5549-e426-358e-9c0866a14196	2370	Dravograd
00050000-5549-e426-f9bc-83ee3e590599	4203	Duplje
00050000-5549-e426-e109-7b99c8755ded	6221	Dutovlje
00050000-5549-e426-e408-7a7239f4f07f	8361	Dvor
00050000-5549-e426-d1c2-ec42b1392e26	2343	Fala
00050000-5549-e426-2201-bf3218158281	9208	Fokovci
00050000-5549-e426-8532-992f344415be	2313	Fram
00050000-5549-e426-f326-8a7f34ed7ac7	3213	Frankolovo
00050000-5549-e426-96d9-425987b80da9	1274	Gabrovka
00050000-5549-e426-7cfc-6f747fce747a	8254	Globoko
00050000-5549-e426-97d1-4f718d473a48	5275	Godovič
00050000-5549-e426-04e5-2dd8510d1713	4204	Golnik
00050000-5549-e426-c7e0-c77a14820ea7	3303	Gomilsko
00050000-5549-e426-efec-c9917c3f6bbc	4224	Gorenja vas
00050000-5549-e426-a60c-c995040571e6	3263	Gorica pri Slivnici
00050000-5549-e426-4b82-6907208d69cb	2272	Gorišnica
00050000-5549-e426-9cb7-4a2034e51937	9250	Gornja Radgona
00050000-5549-e426-8370-96a556e32ac0	3342	Gornji Grad
00050000-5549-e426-7211-1957f271609b	4282	Gozd Martuljek
00050000-5549-e426-893c-a3e8617891c4	6272	Gračišče
00050000-5549-e426-9c4c-8923ab0cc703	9264	Grad
00050000-5549-e426-f2cc-a16230147056	8332	Gradac
00050000-5549-e426-2807-567842dc3fed	1384	Grahovo
00050000-5549-e426-27ad-cbaab9a025ef	5242	Grahovo ob Bači
00050000-5549-e426-0020-a73fdafdc9f4	5251	Grgar
00050000-5549-e426-4d6c-74b91b3c3f83	3302	Griže
00050000-5549-e426-7a89-b023c76eb17e	3231	Grobelno
00050000-5549-e426-be0d-cc02d0304841	1290	Grosuplje
00050000-5549-e426-e55c-0e3396c41c17	2288	Hajdina
00050000-5549-e426-9245-2d38c670a62a	8362	Hinje
00050000-5549-e426-c2a0-73d13e7c66e7	2311	Hoče
00050000-5549-e426-d807-5a672a303b02	9205	Hodoš/Hodos
00050000-5549-e426-3538-11561495227a	1354	Horjul
00050000-5549-e426-3390-bfd0d2675717	1372	Hotedršica
00050000-5549-e426-f6dd-395f672e8ece	1430	Hrastnik
00050000-5549-e426-6c36-717192344e85	6225	Hruševje
00050000-5549-e426-a200-0682724c3525	4276	Hrušica
00050000-5549-e426-ed62-d3c8ac86ee43	5280	Idrija
00050000-5549-e426-eb90-96888e2b21bf	1292	Ig
00050000-5549-e426-5240-fa178b246583	6250	Ilirska Bistrica
00050000-5549-e426-0010-eb4aa5f3ad30	6251	Ilirska Bistrica-Trnovo
00050000-5549-e426-71bc-4feb0b531756	1295	Ivančna Gorica
00050000-5549-e426-842b-44f6aa08c1a8	2259	Ivanjkovci
00050000-5549-e426-098e-b1b4b6c1a1de	1411	Izlake
00050000-5549-e426-199e-9554d90ae030	6310	Izola/Isola
00050000-5549-e426-bfc3-077289845735	2222	Jakobski Dol
00050000-5549-e426-cb59-fd862d73de80	2221	Jarenina
00050000-5549-e426-7362-a5133ef9b0fc	6254	Jelšane
00050000-5549-e426-718e-8652ba7aff1a	4270	Jesenice
00050000-5549-e426-47a0-871713b6b7bc	8261	Jesenice na Dolenjskem
00050000-5549-e426-ed64-3ed98e8c693a	3273	Jurklošter
00050000-5549-e426-b9a9-9374d8bd58dc	2223	Jurovski Dol
00050000-5549-e426-d4a3-9b0f961b023c	2256	Juršinci
00050000-5549-e426-9044-30c156002d27	5214	Kal nad Kanalom
00050000-5549-e426-adc3-8ed7ecb7b94b	3233	Kalobje
00050000-5549-e426-696c-b4cbf1bf66e3	4246	Kamna Gorica
00050000-5549-e426-c2b6-22d9861e81cd	2351	Kamnica
00050000-5549-e426-ce23-81edfbe0e07b	1241	Kamnik
00050000-5549-e426-f6c9-2a5c2f98fc85	5213	Kanal
00050000-5549-e426-7f2a-9e5944686cc0	8258	Kapele
00050000-5549-e426-f3d0-7a570ffe959d	2362	Kapla
00050000-5549-e426-a43c-199e2f1c1da9	2325	Kidričevo
00050000-5549-e426-5113-ca12ec1219f0	1412	Kisovec
00050000-5549-e426-8eb8-e05a19d03755	6253	Knežak
00050000-5549-e426-f187-10821ee00f7c	5222	Kobarid
00050000-5549-e426-88ac-5d43f9d0ecf9	9227	Kobilje
00050000-5549-e426-2baf-a30d20f71718	1330	Kočevje
00050000-5549-e426-af8f-a15cec4d22ab	1338	Kočevska Reka
00050000-5549-e426-56ed-1c7dcad11a89	2276	Kog
00050000-5549-e426-c922-e61fa6432964	5211	Kojsko
00050000-5549-e426-f731-da87174c57aa	6223	Komen
00050000-5549-e426-2e9c-c6ba4a665f19	1218	Komenda
00050000-5549-e426-7c05-47a5e5dbd207	6000	Koper/Capodistria 
00050000-5549-e426-99d0-ad0fe546da0d	6001	Koper/Capodistria - poštni predali
00050000-5549-e426-8a12-b8e5f7e6229c	8282	Koprivnica
00050000-5549-e426-4e8d-55e4156257ba	5296	Kostanjevica na Krasu
00050000-5549-e426-51f6-f5fa1bd7b20b	8311	Kostanjevica na Krki
00050000-5549-e426-00ee-579060c1ef51	1336	Kostel
00050000-5549-e426-1c31-ef0a3414608d	6256	Košana
00050000-5549-e426-a730-4277031e2947	2394	Kotlje
00050000-5549-e426-9b3f-1ce033804000	6240	Kozina
00050000-5549-e426-259d-e55506bcb1f5	3260	Kozje
00050000-5549-e426-ec8a-6c22fa19c848	4000	Kranj 
00050000-5549-e426-fe02-578a4ebb4ec9	4001	Kranj - poštni predali
00050000-5549-e426-6f9e-e8a975c646cd	4280	Kranjska Gora
00050000-5549-e426-0702-9dcd1a4b8a45	1281	Kresnice
00050000-5549-e426-15b5-4a462eed6676	4294	Križe
00050000-5549-e426-c2db-fb50e0cdefbd	9206	Križevci
00050000-5549-e426-3731-4b9f5219715b	9242	Križevci pri Ljutomeru
00050000-5549-e426-0d8f-4d117b85f3f7	1301	Krka
00050000-5549-e426-af4a-86694f54042d	8296	Krmelj
00050000-5549-e426-ced5-f4b1e1240744	4245	Kropa
00050000-5549-e426-b4a5-8410343b1474	8262	Krška vas
00050000-5549-e426-6bf1-48aad74667ee	8270	Krško
00050000-5549-e426-f382-f499556477fb	9263	Kuzma
00050000-5549-e426-e5d6-900808f8d220	2318	Laporje
00050000-5549-e426-6827-90a1eb039a2d	3270	Laško
00050000-5549-e426-c26e-c7b590bc102b	1219	Laze v Tuhinju
00050000-5549-e426-9fbb-22775e768aac	2230	Lenart v Slovenskih goricah
00050000-5549-e426-c38a-47cb73bbbc53	9220	Lendava/Lendva
00050000-5549-e426-9a03-9cc71793b9e4	4248	Lesce
00050000-5549-e426-1c9e-d765e6456d58	3261	Lesično
00050000-5549-e426-d8f3-761fb0315471	8273	Leskovec pri Krškem
00050000-5549-e426-14cf-0ae0609434e2	2372	Libeliče
00050000-5549-e426-31d5-9e08844e3b1a	2341	Limbuš
00050000-5549-e426-ea67-c35d8c18ea60	1270	Litija
00050000-5549-e426-1ca9-8aaf90ef73e1	3202	Ljubečna
00050000-5549-e426-5960-76fced40878f	1000	Ljubljana 
00050000-5549-e426-1dbb-e0585d7954e5	1001	Ljubljana - poštni predali
00050000-5549-e426-05b2-e6183934d70e	1231	Ljubljana - Črnuče
00050000-5549-e426-c416-ea33cf4b4a0f	1261	Ljubljana - Dobrunje
00050000-5549-e426-dffa-91b7dcce9bac	1260	Ljubljana - Polje
00050000-5549-e426-fce4-3b44b3066c5c	1210	Ljubljana - Šentvid
00050000-5549-e426-0943-0098c21aff33	1211	Ljubljana - Šmartno
00050000-5549-e426-d296-493cb67f1625	3333	Ljubno ob Savinji
00050000-5549-e426-ccdf-375c97295b0b	9240	Ljutomer
00050000-5549-e426-eaca-ee0e89dfa8cc	3215	Loče
00050000-5549-e426-23b5-c569d625798f	5231	Log pod Mangartom
00050000-5549-e426-b338-48a812c89a2f	1358	Log pri Brezovici
00050000-5549-e426-70b6-8062baab8e08	1370	Logatec
00050000-5549-e426-0617-767acee97fb7	1371	Logatec
00050000-5549-e426-9d13-4c2e09679b14	1434	Loka pri Zidanem Mostu
00050000-5549-e426-43bf-68b6a2c47c1d	3223	Loka pri Žusmu
00050000-5549-e426-ef3b-61fec7b50d5a	6219	Lokev
00050000-5549-e426-73f5-8bec2b7a68d2	1318	Loški Potok
00050000-5549-e426-d87a-c74884213c57	2324	Lovrenc na Dravskem polju
00050000-5549-e426-6043-05ba69535fa3	2344	Lovrenc na Pohorju
00050000-5549-e426-8ec5-a4390e83724b	3334	Luče
00050000-5549-e426-8190-877d75aa134a	1225	Lukovica
00050000-5549-e426-d1ec-3513314604bb	9202	Mačkovci
00050000-5549-e426-e58b-c1d6de75f968	2322	Majšperk
00050000-5549-e426-7fee-45e1ca7ef502	2321	Makole
00050000-5549-e426-09f2-c95363fa6464	9243	Mala Nedelja
00050000-5549-e426-534c-0570a0e8cefd	2229	Malečnik
00050000-5549-e426-b40c-a12ffda72fd3	6273	Marezige
00050000-5549-e426-1d11-59b5fa9c2785	2000	Maribor 
00050000-5549-e426-069b-49261cac4d66	2001	Maribor - poštni predali
00050000-5549-e426-51f4-914619c4ae07	2206	Marjeta na Dravskem polju
00050000-5549-e426-515e-f22e4000917b	2281	Markovci
00050000-5549-e426-9f20-7cfc0647440d	9221	Martjanci
00050000-5549-e426-d1f3-0cc9ec6786a3	6242	Materija
00050000-5549-e426-c264-9bcea3646b34	4211	Mavčiče
00050000-5549-e426-057e-44d8a8ef8f27	1215	Medvode
00050000-5549-e426-5664-c38890f3854f	1234	Mengeš
00050000-5549-e426-6117-573bb7ba0840	8330	Metlika
00050000-5549-e426-8217-03723b4f1403	2392	Mežica
00050000-5549-e426-59e7-b34090cf71f0	2204	Miklavž na Dravskem polju
00050000-5549-e426-a0e3-864ec8126803	2275	Miklavž pri Ormožu
00050000-5549-e426-cf3c-0de44c1a37e0	5291	Miren
00050000-5549-e426-d574-b478e636cd2f	8233	Mirna
00050000-5549-e426-1a82-d4a00290b962	8216	Mirna Peč
00050000-5549-e426-82ff-cda0e2ebdbe9	2382	Mislinja
00050000-5549-e426-def1-acc1f8240b36	4281	Mojstrana
00050000-5549-e426-415b-ed5fdcae2c48	8230	Mokronog
00050000-5549-e426-db80-2a23082fdf45	1251	Moravče
00050000-5549-e426-b3ed-18a89fadbc4a	9226	Moravske Toplice
00050000-5549-e426-ddde-2fe97c66ed11	5216	Most na Soči
00050000-5549-e426-63c0-329f682e0a46	1221	Motnik
00050000-5549-e426-c174-7c0556d86b53	3330	Mozirje
00050000-5549-e426-5311-bf29c32cce77	9000	Murska Sobota 
00050000-5549-e426-a112-b33ee82f40df	9001	Murska Sobota - poštni predali
00050000-5549-e426-5328-4cbd5c2e7971	2366	Muta
00050000-5549-e426-68bf-b7ac1fcb1857	4202	Naklo
00050000-5549-e426-fb04-5d38ad0476ba	3331	Nazarje
00050000-5549-e426-dc17-c4f603bb7bfa	1357	Notranje Gorice
00050000-5549-e426-36fb-f1138f4f9dc3	3203	Nova Cerkev
00050000-5549-e426-9c4f-4e6bc5d9c053	5000	Nova Gorica 
00050000-5549-e426-72c7-6ad72fb45520	5001	Nova Gorica - poštni predali
00050000-5549-e426-91af-88d6b01fee9c	1385	Nova vas
00050000-5549-e426-21a6-830d36930125	8000	Novo mesto
00050000-5549-e426-2fc9-61b915cbb985	8001	Novo mesto - poštni predali
00050000-5549-e426-770e-0a1ba13d7c09	6243	Obrov
00050000-5549-e426-6a0d-af3ddb48811d	9233	Odranci
00050000-5549-e426-9340-11f4a0c47de8	2317	Oplotnica
00050000-5549-e426-df97-eb15071cb5ee	2312	Orehova vas
00050000-5549-e426-c7ba-84ec267e4996	2270	Ormož
00050000-5549-e426-daf5-dd1fdb36ecb9	1316	Ortnek
00050000-5549-e426-67cb-7d5959474320	1337	Osilnica
00050000-5549-e426-ea27-ddd881f7caf0	8222	Otočec
00050000-5549-e426-ee4c-e1e275ccf46e	2361	Ožbalt
00050000-5549-e426-2698-e62f91be2e65	2231	Pernica
00050000-5549-e426-790d-d9018d4513bc	2211	Pesnica pri Mariboru
00050000-5549-e426-52bc-0fd4bd44753b	9203	Petrovci
00050000-5549-e426-f5a2-8f412c0f4b8d	3301	Petrovče
00050000-5549-e426-27e6-0535f8f3de61	6330	Piran/Pirano
00050000-5549-e426-68c4-3ca04c80b421	8255	Pišece
00050000-5549-e426-c7e0-d0ecf4514e06	6257	Pivka
00050000-5549-e426-96af-de91dafd84c1	6232	Planina
00050000-5549-e426-f9be-185ad40c4050	3225	Planina pri Sevnici
00050000-5549-e426-d325-0e949d0b0142	6276	Pobegi
00050000-5549-e426-4eb3-0debcdafd2dc	8312	Podbočje
00050000-5549-e426-ecb3-9ee0a691eb41	5243	Podbrdo
00050000-5549-e426-28a3-0aad8ee2ac40	3254	Podčetrtek
00050000-5549-e426-35f7-02a9ef45709f	2273	Podgorci
00050000-5549-e426-2806-509433065507	6216	Podgorje
00050000-5549-e426-7a33-df416a600faa	2381	Podgorje pri Slovenj Gradcu
00050000-5549-e426-f25a-8c2c67b6c7ee	6244	Podgrad
00050000-5549-e426-7a58-5906537308d8	1414	Podkum
00050000-5549-e426-55d5-d530feee016c	2286	Podlehnik
00050000-5549-e426-8693-825eb088267e	5272	Podnanos
00050000-5549-e426-7d5d-bd34708dd290	4244	Podnart
00050000-5549-e426-f8ea-b5fa1ebcb7af	3241	Podplat
00050000-5549-e426-9818-601f6ab4015d	3257	Podsreda
00050000-5549-e426-a074-a9ae775da07f	2363	Podvelka
00050000-5549-e426-43ca-40ed16ad45dc	2208	Pohorje
00050000-5549-e426-0e85-1ba3e98dd5ab	2257	Polenšak
00050000-5549-e426-2c61-b0b6a9738818	1355	Polhov Gradec
00050000-5549-e426-6fcf-cdcbef499162	4223	Poljane nad Škofjo Loko
00050000-5549-e426-aa50-c4687a84025b	2319	Poljčane
00050000-5549-e426-f341-1a753032b56b	1272	Polšnik
00050000-5549-e426-1023-dbc85a910c40	3313	Polzela
00050000-5549-e426-b2c8-e22a31152ac5	3232	Ponikva
00050000-5549-e426-ed2e-02ae1053d818	6320	Portorož/Portorose
00050000-5549-e426-e2a6-7f82f8d177f9	6230	Postojna
00050000-5549-e426-74cd-01e0e6a0c90d	2331	Pragersko
00050000-5549-e426-19e9-78d25c63637a	3312	Prebold
00050000-5549-e426-3b37-e01a394e5f4c	4205	Preddvor
00050000-5549-e426-c50a-5a557f58eb0e	6255	Prem
00050000-5549-e426-a8b4-36403ccc8147	1352	Preserje
00050000-5549-e426-c0cc-997c990ad717	6258	Prestranek
00050000-5549-e426-c8ff-becd23b8116a	2391	Prevalje
00050000-5549-e426-577e-82f922ec4501	3262	Prevorje
00050000-5549-e426-1706-490c6e6ec498	1276	Primskovo 
00050000-5549-e426-63bb-e8592ffbb981	3253	Pristava pri Mestinju
00050000-5549-e426-a480-c09ac4bb7ab8	9207	Prosenjakovci/Partosfalva
00050000-5549-e426-9a99-40ce423277af	5297	Prvačina
00050000-5549-e426-f099-08c91014c751	2250	Ptuj
00050000-5549-e426-c47a-ffaa200a8402	2323	Ptujska Gora
00050000-5549-e426-d6d3-414b37ac706d	9201	Puconci
00050000-5549-e426-d11c-012eefef376e	2327	Rače
00050000-5549-e426-0fb4-17c3f99ed4ee	1433	Radeče
00050000-5549-e426-7749-81485152fe8b	9252	Radenci
00050000-5549-e426-f5ef-46d9384d61c6	2360	Radlje ob Dravi
00050000-5549-e426-e7ed-9764fb691951	1235	Radomlje
00050000-5549-e426-7af6-b19797be4363	4240	Radovljica
00050000-5549-e426-d8b8-d575dd9137e2	8274	Raka
00050000-5549-e426-17ca-42c14f278387	1381	Rakek
00050000-5549-e426-89b8-6060e6ecd6c7	4283	Rateče - Planica
00050000-5549-e426-f5a8-2fd8cbb5fbd8	2390	Ravne na Koroškem
00050000-5549-e426-e7a3-46cdffc4478b	9246	Razkrižje
00050000-5549-e426-2c76-af8b1a9f3c67	3332	Rečica ob Savinji
00050000-5549-e426-27c7-fe15faa59de5	5292	Renče
00050000-5549-e426-2024-c10cac3ac587	1310	Ribnica
00050000-5549-e426-4a70-3c511704feb5	2364	Ribnica na Pohorju
00050000-5549-e426-0eaf-18bea4d96706	3272	Rimske Toplice
00050000-5549-e426-2930-1027a915cc6d	1314	Rob
00050000-5549-e426-6285-0ce904aa22bf	5215	Ročinj
00050000-5549-e426-f6cb-e30123a8a437	3250	Rogaška Slatina
00050000-5549-e426-9b03-5b22d7811f4f	9262	Rogašovci
00050000-5549-e426-e409-4ac8c9c0b809	3252	Rogatec
00050000-5549-e426-3e07-f1bd9b70c58d	1373	Rovte
00050000-5549-e426-642d-b81daaebf2bf	2342	Ruše
00050000-5549-e426-0d54-363c8b29cbe2	1282	Sava
00050000-5549-e426-7cd9-0cd5158fb5b2	6333	Sečovlje/Sicciole
00050000-5549-e426-373e-ec9663dc8247	4227	Selca
00050000-5549-e426-cb6a-2121bc1a831e	2352	Selnica ob Dravi
00050000-5549-e426-d24a-bec5421dcd62	8333	Semič
00050000-5549-e426-d36d-82cda64abe62	8281	Senovo
00050000-5549-e426-4c5a-d098f5494385	6224	Senožeče
00050000-5549-e426-da4e-5a6ed404f8b5	8290	Sevnica
00050000-5549-e426-b9f3-664787c0011a	6210	Sežana
00050000-5549-e426-d121-8e5589ea4b14	2214	Sladki Vrh
00050000-5549-e426-9650-07c766a806aa	5283	Slap ob Idrijci
00050000-5549-e426-e6cd-f211e1a2c708	2380	Slovenj Gradec
00050000-5549-e426-3597-119f429581be	2310	Slovenska Bistrica
00050000-5549-e426-6603-84a87a43e9fa	3210	Slovenske Konjice
00050000-5549-e426-263c-daa6541a3ba4	1216	Smlednik
00050000-5549-e426-8797-cd81ab299d3b	5232	Soča
00050000-5549-e426-6870-e7f71aa0f3cd	1317	Sodražica
00050000-5549-e426-94c0-7bccb44dc415	3335	Solčava
00050000-5549-e426-cfe5-8477c959067f	5250	Solkan
00050000-5549-e426-2cef-a1a0500de173	4229	Sorica
00050000-5549-e426-a53c-473ddec94839	4225	Sovodenj
00050000-5549-e426-a6dd-fdec57431f31	5281	Spodnja Idrija
00050000-5549-e426-d682-5bd363fbad8d	2241	Spodnji Duplek
00050000-5549-e426-dbf1-638cf398735c	9245	Spodnji Ivanjci
00050000-5549-e426-3aaf-6a7aaed54692	2277	Središče ob Dravi
00050000-5549-e426-36fe-037aa2353ae1	4267	Srednja vas v Bohinju
00050000-5549-e426-e680-e14ab03c12d6	8256	Sromlje 
00050000-5549-e426-e2e4-4e3444d304c2	5224	Srpenica
00050000-5549-e426-75d2-76d70d26c0a2	1242	Stahovica
00050000-5549-e426-bfd0-912c7a6ebe42	1332	Stara Cerkev
00050000-5549-e426-bc1a-dc77b8559e04	8342	Stari trg ob Kolpi
00050000-5549-e426-0f9f-4eeb5d734209	1386	Stari trg pri Ložu
00050000-5549-e426-94d8-f0b7b1a91f01	2205	Starše
00050000-5549-e426-2243-6224ebb9aa83	2289	Stoperce
00050000-5549-e426-98bd-deed5f8f326a	8322	Stopiče
00050000-5549-e426-ce73-b90c3ff4ac32	3206	Stranice
00050000-5549-e426-1a3b-3f87c1e29334	8351	Straža
00050000-5549-e426-0cd1-2ccc2c50fde9	1313	Struge
00050000-5549-e426-d409-ab69a700c96e	8293	Studenec
00050000-5549-e426-1ffe-6717136530f5	8331	Suhor
00050000-5549-e426-2737-678521e170bf	2233	Sv. Ana v Slovenskih goricah
00050000-5549-e426-4bca-6b300819bb86	2235	Sv. Trojica v Slovenskih goricah
00050000-5549-e426-0c81-515c43497b10	2353	Sveti Duh na Ostrem Vrhu
00050000-5549-e426-34db-9b3b79aa0bcb	9244	Sveti Jurij ob Ščavnici
00050000-5549-e426-6f24-e21062651301	3264	Sveti Štefan
00050000-5549-e426-1f39-d140466d0651	2258	Sveti Tomaž
00050000-5549-e426-1ece-3d799ecbe420	9204	Šalovci
00050000-5549-e426-263c-f478a635b733	5261	Šempas
00050000-5549-e426-a6cb-466e10ede957	5290	Šempeter pri Gorici
00050000-5549-e426-5cf2-2377c3c6d842	3311	Šempeter v Savinjski dolini
00050000-5549-e426-13d6-c85f651d45ae	4208	Šenčur
00050000-5549-e426-525c-1cbbeaf4354f	2212	Šentilj v Slovenskih goricah
00050000-5549-e426-d247-1db10b5ff42d	8297	Šentjanž
00050000-5549-e426-ec64-9af946ffd7a4	2373	Šentjanž pri Dravogradu
00050000-5549-e426-917e-6ba4978866bf	8310	Šentjernej
00050000-5549-e426-8b29-284d4f5d0ab3	3230	Šentjur
00050000-5549-e426-1fae-2e4d2a133d3f	3271	Šentrupert
00050000-5549-e426-91d3-f2ad6630191a	8232	Šentrupert
00050000-5549-e426-0730-93ee84d58a7e	1296	Šentvid pri Stični
00050000-5549-e426-7d8e-2045f38a767c	8275	Škocjan
00050000-5549-e426-25c2-84ef23e9c0df	6281	Škofije
00050000-5549-e426-779d-4eaa541b8e81	4220	Škofja Loka
00050000-5549-e426-108b-12da406edcfb	3211	Škofja vas
00050000-5549-e426-34dd-d3fe6c53af12	1291	Škofljica
00050000-5549-e426-af48-3581fef376e3	6274	Šmarje
00050000-5549-e426-ed2f-335683043524	1293	Šmarje - Sap
00050000-5549-e426-8c82-63de47654470	3240	Šmarje pri Jelšah
00050000-5549-e426-e644-18478254bf4c	8220	Šmarješke Toplice
00050000-5549-e426-7a31-79d4e3af6af1	2315	Šmartno na Pohorju
00050000-5549-e426-2f3d-8b4bbbd5c0cc	3341	Šmartno ob Dreti
00050000-5549-e426-ec8d-220e2584ed80	3327	Šmartno ob Paki
00050000-5549-e426-e654-a0efc1e6f9a7	1275	Šmartno pri Litiji
00050000-5549-e426-47a2-5da34a039ed0	2383	Šmartno pri Slovenj Gradcu
00050000-5549-e426-0769-d4c554ad28bf	3201	Šmartno v Rožni dolini
00050000-5549-e426-051f-4ee8e48813e7	3325	Šoštanj
00050000-5549-e426-8672-06a912e45b18	6222	Štanjel
00050000-5549-e426-ea8a-6f261450c0e8	3220	Štore
00050000-5549-e426-3599-b953f474c1f9	3304	Tabor
00050000-5549-e426-9569-b08a834335b9	3221	Teharje
00050000-5549-e426-6bac-b9846e1fddfb	9251	Tišina
00050000-5549-e426-4e32-4b9232fd2de8	5220	Tolmin
00050000-5549-e426-7bb0-850d061cca0b	3326	Topolšica
00050000-5549-e426-d578-87fbe0e633b8	2371	Trbonje
00050000-5549-e426-9f09-c9878ad510e7	1420	Trbovlje
00050000-5549-e426-db63-a1dc3fc79e00	8231	Trebelno 
00050000-5549-e426-5cde-4529082c812f	8210	Trebnje
00050000-5549-e426-9902-8f2a9c2b7bdd	5252	Trnovo pri Gorici
00050000-5549-e426-ca23-3a9a0a73523e	2254	Trnovska vas
00050000-5549-e426-3c21-50feb8894b1f	1222	Trojane
00050000-5549-e426-65a3-341edda9ffc0	1236	Trzin
00050000-5549-e426-ab83-adee82ff7bf5	4290	Tržič
00050000-5549-e426-5878-18c152139c7b	8295	Tržišče
00050000-5549-e426-b91d-9840813181b8	1311	Turjak
00050000-5549-e426-b863-64b510d9a3ef	9224	Turnišče
00050000-5549-e426-985f-8560447e623e	8323	Uršna sela
00050000-5549-e426-9013-0a7798425b03	1252	Vače
00050000-5549-e426-c464-1b69f33d2acf	3320	Velenje 
00050000-5549-e426-d577-6a89a7f378d8	3322	Velenje - poštni predali
00050000-5549-e426-3b0b-3c0651c98130	8212	Velika Loka
00050000-5549-e426-d46f-63de6729c136	2274	Velika Nedelja
00050000-5549-e426-3ea2-f0726f2b364e	9225	Velika Polana
00050000-5549-e426-c358-cc58e54296d5	1315	Velike Lašče
00050000-5549-e426-a637-a92eb42730be	8213	Veliki Gaber
00050000-5549-e426-efdd-4d7c3b7fd1ab	9241	Veržej
00050000-5549-e426-08bd-af872acaa7e0	1312	Videm - Dobrepolje
00050000-5549-e426-516f-8cf44dc833ff	2284	Videm pri Ptuju
00050000-5549-e426-a934-e765a7530c49	8344	Vinica
00050000-5549-e426-977c-4c95aeccf273	5271	Vipava
00050000-5549-e426-5863-9f7f5109b0a5	4212	Visoko
00050000-5549-e426-8b90-d99435a53b75	1294	Višnja Gora
00050000-5549-e426-3726-5b1b7fc3c770	3205	Vitanje
00050000-5549-e426-5ca3-0358eeea5e6a	2255	Vitomarci
00050000-5549-e426-4f3e-e1e69e3bf097	1217	Vodice
00050000-5549-e426-5d25-32e10a22129b	3212	Vojnik\t
00050000-5549-e426-7709-026ef5bd9e80	5293	Volčja Draga
00050000-5549-e426-5b81-8cba0738c828	2232	Voličina
00050000-5549-e426-cd83-49f96befd939	3305	Vransko
00050000-5549-e426-cbc8-8c93ba292b56	6217	Vremski Britof
00050000-5549-e426-f34f-47e117dd6ddd	1360	Vrhnika
00050000-5549-e426-6eda-99d726fe5787	2365	Vuhred
00050000-5549-e426-0009-0521db79b4bb	2367	Vuzenica
00050000-5549-e426-9277-438486075890	8292	Zabukovje 
00050000-5549-e426-6759-04bb8f39ab48	1410	Zagorje ob Savi
00050000-5549-e426-2c40-09a3644fceb6	1303	Zagradec
00050000-5549-e426-9951-2c7e1ebbc5d1	2283	Zavrč
00050000-5549-e426-7779-823bc46f7b12	8272	Zdole 
00050000-5549-e426-16c1-2212a985b9c2	4201	Zgornja Besnica
00050000-5549-e426-d0e5-6ecfb314fdc9	2242	Zgornja Korena
00050000-5549-e426-fd0c-5ce594948e51	2201	Zgornja Kungota
00050000-5549-e426-c8f5-e8441378feea	2316	Zgornja Ložnica
00050000-5549-e426-9e40-734f0cc661ba	2314	Zgornja Polskava
00050000-5549-e426-6203-411b33c3579b	2213	Zgornja Velka
00050000-5549-e426-880c-092e7e0f33bc	4247	Zgornje Gorje
00050000-5549-e426-967a-b0527094012b	4206	Zgornje Jezersko
00050000-5549-e426-b2e5-1c0f782df9a7	2285	Zgornji Leskovec
00050000-5549-e426-1707-804ffc37b1f8	1432	Zidani Most
00050000-5549-e426-f8c8-8cd506ab8c75	3214	Zreče
00050000-5549-e426-b1af-e68c3f269bc0	4209	Žabnica
00050000-5549-e426-5dee-e8b8d81df9eb	3310	Žalec
00050000-5549-e426-d5f9-bc5adafdc8d9	4228	Železniki
00050000-5549-e426-0b38-fc8e01d22a8e	2287	Žetale
00050000-5549-e426-a94f-9ec67bf7ff1e	4226	Žiri
00050000-5549-e426-a3c3-7bdadfc45a14	4274	Žirovnica
00050000-5549-e426-fc21-69a662b03e28	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 2390793)
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
-- TOC entry 2642 (class 0 OID 2390616)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 2390682)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 2390805)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 2390910)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 2390954)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 2390834)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 2390778)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 2390768)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 2390944)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 2390900)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 2390482)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5549-e426-573e-59286795e864	00010000-5549-e427-6d65-809e772235fe	2015-05-06 11:51:35	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvr0UarEEEnKpdPiLEeMsfF6KrTDPzkO";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 2390843)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 2390522)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5549-e426-3e3c-14c940daec62	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5549-e426-6957-cb95341fdb44	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5549-e426-cf0a-0a6a92663f04	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5549-e426-1d40-66e437a9958a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5549-e426-321c-b92849ce595a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5549-e426-7d85-1c80bb0db2af	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 2390505)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5549-e426-573e-59286795e864	00020000-5549-e426-1d40-66e437a9958a
00010000-5549-e427-6d65-809e772235fe	00020000-5549-e426-1d40-66e437a9958a
\.


--
-- TOC entry 2668 (class 0 OID 2390857)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 2390799)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 2390749)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 2390581)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 2390755)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 2390935)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 2390651)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 2390491)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5549-e427-6d65-809e772235fe	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROHX5Z6YQYDl5McbHUFHBVGPsXTiRoPCi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5549-e426-573e-59286795e864	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 2390985)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 2390697)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 2390826)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 2390892)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 2390725)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 2390975)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 2390882)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 2390546)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 2391024)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 2391017)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 2390934)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 2390715)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 2390748)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 2390677)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 2390878)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 2390695)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 2390742)
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
-- TOC entry 2365 (class 2606 OID 2390791)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 2390818)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 2390649)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 2390555)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 2390613)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 2390579)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 2390535)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 2390520)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 2390824)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 2390856)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 2390971)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 2390606)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 2390637)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 2390797)
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
-- TOC entry 2299 (class 2606 OID 2390627)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 2390686)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 2390809)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 2390916)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 2390959)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 2390841)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 2390782)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 2390773)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 2390953)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 2390907)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 2390490)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 2390847)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 2390509)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 2390529)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 2390865)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 2390804)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 2390754)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 2390586)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 2390764)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 2390943)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 2390662)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 2390503)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 2390999)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 2390701)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 2390832)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 2390898)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 2390737)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 2390984)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 2390891)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 2390722)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 2390608)
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
-- TOC entry 2378 (class 1259 OID 2390825)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 2390811)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 2390810)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 2390702)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 2390881)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 2390879)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 2390880)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 2390972)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 2390973)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 2390974)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 2391002)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 2391001)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 2391000)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 2390664)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 2390663)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 2390615)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 2390614)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 2390848)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 2390743)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 2390536)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 2390537)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 2390868)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 2390867)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 2390866)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 2390687)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 2390689)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 2390688)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 2390777)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 2390775)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 2390774)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 2390776)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 2390510)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 2390511)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 2390833)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 2390798)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 2390908)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 2390909)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 2390629)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 2390628)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2297 (class 1259 OID 2390630)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 2390917)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 2390918)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 2391027)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 2391026)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 2391029)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 2391025)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 2391028)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 2390899)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 2390786)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 2390785)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 2390783)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 2390784)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2246 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 2391019)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 2391018)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 2390696)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 2390557)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 2390556)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 2390587)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 2390588)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 2390767)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 2390766)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 2390765)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 2390724)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 2390720)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 2390717)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 2390718)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 2390716)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 2390721)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 2390719)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 2390607)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 2390678)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 2390680)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 2390679)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 2390681)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 2390792)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 2390580)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 2390650)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2257 (class 1259 OID 2390504)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2386 (class 1259 OID 2390842)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2266 (class 1259 OID 2390521)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2249 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 2390638)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 2390960)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 2390530)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 2390723)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 2391160)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 2391145)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 2391150)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 2391170)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 2391140)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 2391165)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 2391155)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 2391075)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 2391255)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 2391250)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 2391245)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 2391135)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 2391295)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 2391285)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 2391290)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 2391235)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 2391330)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 2391335)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 2391340)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 2391355)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 2391350)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 2391345)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 2391110)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 2391105)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 2391085)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 2391080)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 2391060)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 2391265)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 2391175)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 2391040)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 2391045)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 2391280)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 2391275)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 2391270)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 2391115)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 2391125)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 2391120)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 2391210)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 2391200)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 2391195)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 2391205)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 2391030)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 2391035)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 2391260)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 2391240)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 2391305)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 2391310)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 2391095)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 2391090)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 2391100)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 2391315)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 2391320)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 2391380)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 2391375)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 2391390)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 2391370)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 2391385)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 2391300)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 2391230)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 2391225)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 2391215)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 2391220)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 2391365)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 2391360)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 2391130)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 2391325)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 2391055)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 2391050)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 2391065)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 2391070)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 2391190)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 2391185)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 2391180)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-06 11:51:35 CEST

--
-- PostgreSQL database dump complete
--

