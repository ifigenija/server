--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-24 14:43:31 CEST

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
-- TOC entry 179 (class 1259 OID 1303292)
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
-- TOC entry 225 (class 1259 OID 1303775)
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
-- TOC entry 224 (class 1259 OID 1303758)
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
-- TOC entry 217 (class 1259 OID 1303674)
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
-- TOC entry 193 (class 1259 OID 1303458)
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
-- TOC entry 196 (class 1259 OID 1303499)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1303420)
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
-- TOC entry 212 (class 1259 OID 1303624)
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
-- TOC entry 191 (class 1259 OID 1303445)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1303493)
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
-- TOC entry 201 (class 1259 OID 1303542)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1303567)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1303394)
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
-- TOC entry 180 (class 1259 OID 1303301)
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
-- TOC entry 181 (class 1259 OID 1303312)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
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
-- TOC entry 184 (class 1259 OID 1303364)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1303266)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1303285)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1303574)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1303604)
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
-- TOC entry 221 (class 1259 OID 1303716)
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
-- TOC entry 183 (class 1259 OID 1303344)
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
-- TOC entry 186 (class 1259 OID 1303386)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1303548)
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
-- TOC entry 185 (class 1259 OID 1303371)
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
-- TOC entry 190 (class 1259 OID 1303437)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1303560)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1303665)
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
-- TOC entry 220 (class 1259 OID 1303709)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1303589)
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
-- TOC entry 200 (class 1259 OID 1303533)
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
-- TOC entry 199 (class 1259 OID 1303523)
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
-- TOC entry 219 (class 1259 OID 1303699)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1303655)
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
-- TOC entry 173 (class 1259 OID 1303237)
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
-- TOC entry 172 (class 1259 OID 1303235)
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
-- TOC entry 209 (class 1259 OID 1303598)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1303275)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1303259)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1303612)
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
-- TOC entry 203 (class 1259 OID 1303554)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1303504)
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
-- TOC entry 182 (class 1259 OID 1303336)
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
-- TOC entry 198 (class 1259 OID 1303510)
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
-- TOC entry 218 (class 1259 OID 1303690)
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
-- TOC entry 188 (class 1259 OID 1303406)
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
-- TOC entry 174 (class 1259 OID 1303246)
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
-- TOC entry 223 (class 1259 OID 1303740)
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
-- TOC entry 192 (class 1259 OID 1303452)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1303581)
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
-- TOC entry 214 (class 1259 OID 1303647)
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
-- TOC entry 194 (class 1259 OID 1303480)
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
-- TOC entry 222 (class 1259 OID 1303730)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1303637)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1303240)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 1303292)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1303775)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 1303758)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1303674)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1303458)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1303499)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1303420)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-553a-3a71-3057-b4d144c3c7db	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-553a-3a71-b802-7c5185240ff3	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-553a-3a71-83d1-0692ca5866db	AL	ALB	008	Albania 	Albanija	\N
00040000-553a-3a71-0d37-df1ba26d1fe1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-553a-3a71-eedb-1782f327019b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-553a-3a71-fccd-bf80bdc2bc01	AD	AND	020	Andorra 	Andora	\N
00040000-553a-3a71-c405-99a5f94a2934	AO	AGO	024	Angola 	Angola	\N
00040000-553a-3a71-e510-02720dbe1116	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-553a-3a71-6415-77cac94c7dc1	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-553a-3a71-3aa3-91513d6fa75b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-3a71-f8d8-7186d11df9f7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-553a-3a71-f37a-4f1c7bf5baf5	AM	ARM	051	Armenia 	Armenija	\N
00040000-553a-3a71-ca4c-f2ed93e25c20	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-553a-3a71-a735-b7310cfd27df	AU	AUS	036	Australia 	Avstralija	\N
00040000-553a-3a71-596d-3e3900a8ad18	AT	AUT	040	Austria 	Avstrija	\N
00040000-553a-3a71-d1a5-2b075b178c84	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-553a-3a71-6b4b-937dd61e96db	BS	BHS	044	Bahamas 	Bahami	\N
00040000-553a-3a71-f8db-933118eb9c3e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-553a-3a71-f064-13327c438922	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-553a-3a71-dacc-5500906e63e0	BB	BRB	052	Barbados 	Barbados	\N
00040000-553a-3a71-7f41-e8816fbf46c3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-553a-3a71-74bc-02969e192bd4	BE	BEL	056	Belgium 	Belgija	\N
00040000-553a-3a71-5a3d-ea59eaafe83d	BZ	BLZ	084	Belize 	Belize	\N
00040000-553a-3a71-c6ce-1e968fecd3e9	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-553a-3a71-1229-dbfba160fe02	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-553a-3a71-a430-88d7ffa372c9	BT	BTN	064	Bhutan 	Butan	\N
00040000-553a-3a71-7995-ef40f35f4e25	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-553a-3a71-4e8a-d9da1d4334b4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-553a-3a71-460f-1c0de948814a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-553a-3a71-f7b7-35fdc3980818	BW	BWA	072	Botswana 	Bocvana	\N
00040000-553a-3a71-6c45-57285f7ee278	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-553a-3a71-585d-8e88ab3d15b7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-553a-3a71-7218-5923f8e8dce5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-553a-3a71-f4a2-f4063865e8ae	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-553a-3a71-328a-ff891e3df5bb	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-553a-3a71-f34b-438a586bd990	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-553a-3a71-3438-3868baf27072	BI	BDI	108	Burundi 	Burundi 	\N
00040000-553a-3a71-a8f1-a52b6fc434e6	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-553a-3a71-9be3-cae38b73c38a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-553a-3a71-d946-cd034df5452e	CA	CAN	124	Canada 	Kanada	\N
00040000-553a-3a71-7340-65e0cbba13b6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-553a-3a71-725d-0abc4e1d1eb5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-553a-3a71-35eb-2eb4eff9df78	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-553a-3a71-9b6f-4942726687d7	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-553a-3a71-47b0-59ddcdd1466a	CL	CHL	152	Chile 	Čile	\N
00040000-553a-3a71-c91b-22f6130c0a7e	CN	CHN	156	China 	Kitajska	\N
00040000-553a-3a71-1cd6-af93ce9a91df	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-553a-3a71-4b63-58930d0c8bc3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-553a-3a71-cba2-1afbc489b5f2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-553a-3a71-7a3b-aa457b101a9e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-553a-3a71-53be-da53521ebbe0	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-553a-3a71-f5f3-d73a74bfa415	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-553a-3a71-d235-f0268581ef31	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-553a-3a71-6f17-144b73a0e8e5	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-553a-3a71-7a8f-7185501be0ff	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-553a-3a71-7dbf-81a7b55a2c01	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-553a-3a71-15b9-c8aff7e07e66	CU	CUB	192	Cuba 	Kuba	\N
00040000-553a-3a71-1ba4-6889fe218907	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-553a-3a71-c8ab-b3b444bc81ae	CY	CYP	196	Cyprus 	Ciper	\N
00040000-553a-3a71-5eeb-a96a02a976f6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-553a-3a71-80c9-bb03cb792ce0	DK	DNK	208	Denmark 	Danska	\N
00040000-553a-3a71-2c7b-c49c0750512a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-553a-3a71-ced2-f4421e48135d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-3a71-9816-06b1dccade35	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-553a-3a71-f9e1-f861ccbe2a34	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-553a-3a71-48e9-9235cab4733c	EG	EGY	818	Egypt 	Egipt	\N
00040000-553a-3a71-d261-f2e37a2ca43a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-553a-3a71-7b91-cde3c2f7feb0	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-553a-3a71-745f-4a55ff195c71	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-553a-3a71-228f-a6a8a77d3356	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-553a-3a71-f678-6c63a8921f73	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-553a-3a71-c475-da309c69fba7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-553a-3a71-32f6-7f5f8c7e96a4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-553a-3a71-d970-1db3798788da	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-553a-3a71-0322-b6ab99a9f5d3	FI	FIN	246	Finland 	Finska	\N
00040000-553a-3a71-f82e-ea860c162396	FR	FRA	250	France 	Francija	\N
00040000-553a-3a71-0792-5944979ceffb	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-553a-3a71-6b54-e94f980d3f3c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-553a-3a71-9e0c-83a3997169ee	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-553a-3a71-7b77-0678b68ac4d9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-553a-3a71-0168-741aae7efe3b	GA	GAB	266	Gabon 	Gabon	\N
00040000-553a-3a71-f7f0-2d4bb2e84242	GM	GMB	270	Gambia 	Gambija	\N
00040000-553a-3a71-764b-994dabfcdfe7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-553a-3a71-66b1-5b035d820730	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-553a-3a71-af93-42f63cce6999	GH	GHA	288	Ghana 	Gana	\N
00040000-553a-3a71-5e39-87faa819b533	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-553a-3a71-edc6-4855dd5e0106	GR	GRC	300	Greece 	Grčija	\N
00040000-553a-3a71-904e-d12365fe018a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-553a-3a71-89aa-cbecac0329ef	GD	GRD	308	Grenada 	Grenada	\N
00040000-553a-3a71-c4fd-a34ec384fd93	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-553a-3a71-ddd3-d61416f15088	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-553a-3a71-e095-9117c9f5af65	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-553a-3a71-53b4-74a1d34bf36c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-553a-3a71-092c-6e59d2a9662f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-553a-3a71-ed2a-10c7b1caf76e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-553a-3a71-0039-ed199cef0289	GY	GUY	328	Guyana 	Gvajana	\N
00040000-553a-3a71-017d-ccfcf248bf87	HT	HTI	332	Haiti 	Haiti	\N
00040000-553a-3a71-d22c-4ae01e3985be	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-553a-3a71-08f9-42cd67e36271	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-553a-3a71-9234-cd03842aaada	HN	HND	340	Honduras 	Honduras	\N
00040000-553a-3a71-6c52-46d044afde72	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-553a-3a71-4811-15ecd43a7146	HU	HUN	348	Hungary 	Madžarska	\N
00040000-553a-3a71-bb6e-ba266577e304	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-553a-3a71-e31a-e00fc7448f5f	IN	IND	356	India 	Indija	\N
00040000-553a-3a71-2adb-88858dc7f7b8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-553a-3a71-60dc-303423184ace	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-553a-3a71-2ba4-6a4767f538c7	IQ	IRQ	368	Iraq 	Irak	\N
00040000-553a-3a71-99d6-34c673757077	IE	IRL	372	Ireland 	Irska	\N
00040000-553a-3a71-fbfc-f0d143b3b1a2	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-553a-3a71-26b1-56097e0c831f	IL	ISR	376	Israel 	Izrael	\N
00040000-553a-3a71-9552-ec634609407d	IT	ITA	380	Italy 	Italija	\N
00040000-553a-3a71-d1af-32898302115e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-553a-3a71-2253-481a97ea2936	JP	JPN	392	Japan 	Japonska	\N
00040000-553a-3a71-fe5f-248080044065	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-553a-3a71-1b3c-ac97954098cd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-553a-3a71-a6fe-dadc7c0a055b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-553a-3a71-9e92-238896d8e783	KE	KEN	404	Kenya 	Kenija	\N
00040000-553a-3a71-5225-fe1b0b2fe39d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-553a-3a71-8dd1-b69c9676e0a3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-553a-3a71-bf49-a0e585f94ac2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-553a-3a71-4d5c-802cae24b02a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-553a-3a71-ddb4-5367a36f283f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-553a-3a71-bc8a-253757f4281b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-553a-3a71-f1a9-313cf8ce98b8	LV	LVA	428	Latvia 	Latvija	\N
00040000-553a-3a71-cd84-9c2f1392fbbc	LB	LBN	422	Lebanon 	Libanon	\N
00040000-553a-3a71-1ec3-88a4786a1634	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-553a-3a71-67e1-f80165bb6017	LR	LBR	430	Liberia 	Liberija	\N
00040000-553a-3a71-9b70-5316e1d401de	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-553a-3a71-0fc2-113c3717ed2e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-553a-3a71-8dae-59c45222e164	LT	LTU	440	Lithuania 	Litva	\N
00040000-553a-3a71-fad4-05acc9f67add	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-553a-3a71-7c91-34ea77427214	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-553a-3a71-acee-d5c4f0c328f7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-553a-3a71-ae44-0ae52c9901fa	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-553a-3a71-debe-fc387c082e15	MW	MWI	454	Malawi 	Malavi	\N
00040000-553a-3a71-ab18-d6b879fc296d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-553a-3a71-7dc7-c36308bf80cd	MV	MDV	462	Maldives 	Maldivi	\N
00040000-553a-3a71-895b-4e4808ad71b8	ML	MLI	466	Mali 	Mali	\N
00040000-553a-3a71-6f70-7c2711348463	MT	MLT	470	Malta 	Malta	\N
00040000-553a-3a71-7d0f-b7236615262b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-553a-3a71-a6b1-8aceffbb12b4	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-553a-3a71-648a-5bccd0fbb64e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-553a-3a71-a618-7293b22e4e07	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-553a-3a71-e02c-66a1e78a2e17	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-553a-3a71-3ec1-d4a6082e5034	MX	MEX	484	Mexico 	Mehika	\N
00040000-553a-3a71-af0d-a7e723f286ce	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-553a-3a71-3180-adcf5d264d0f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-553a-3a71-8323-cbc6a54ac5ed	MC	MCO	492	Monaco 	Monako	\N
00040000-553a-3a71-f810-39722bf90f59	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-553a-3a71-4a84-8c3d635d3368	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-553a-3a71-5178-bb82eb451ecd	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-553a-3a71-8c7a-27a626ec496a	MA	MAR	504	Morocco 	Maroko	\N
00040000-553a-3a71-c607-f82ecb7ce702	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-553a-3a71-b312-a4adaf6f6cd1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-553a-3a71-6ea0-3ab8a6b64476	NA	NAM	516	Namibia 	Namibija	\N
00040000-553a-3a71-eb48-26cb447912db	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-553a-3a71-415a-4189223fb0b5	NP	NPL	524	Nepal 	Nepal	\N
00040000-553a-3a71-922e-61d69f91c8b0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-553a-3a71-c5ee-fd871c1d9ac1	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-553a-3a71-03f7-9271c3938b2e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-553a-3a71-13a1-4f2fb6d2e252	NE	NER	562	Niger 	Niger 	\N
00040000-553a-3a71-53f2-39a7042a2263	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-553a-3a71-2e09-2d1d2cf86966	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-553a-3a71-56c7-6e93d2d1817a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-553a-3a71-919a-32dc5678613e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-553a-3a71-727a-6c73f3f57341	NO	NOR	578	Norway 	Norveška	\N
00040000-553a-3a71-80cc-95a2be0b1687	OM	OMN	512	Oman 	Oman	\N
00040000-553a-3a71-8925-87b2bddec1e7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-553a-3a71-0b14-f4cb53761f31	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-553a-3a71-b40d-c6b788a6f417	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-553a-3a71-f912-249e8eb64677	PA	PAN	591	Panama 	Panama	\N
00040000-553a-3a71-60f3-90f8ed3c2639	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-553a-3a71-5853-04560a6464c0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-553a-3a71-c02a-716170b6ca43	PE	PER	604	Peru 	Peru	\N
00040000-553a-3a71-26ce-78bde9d24a06	PH	PHL	608	Philippines 	Filipini	\N
00040000-553a-3a71-64e5-86c09275f43d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-553a-3a71-4e4b-a8f1fe5edd46	PL	POL	616	Poland 	Poljska	\N
00040000-553a-3a71-e973-63bd9008ccf2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-553a-3a71-0946-9bd3892d4afe	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-553a-3a71-576d-df0cc419178a	QA	QAT	634	Qatar 	Katar	\N
00040000-553a-3a71-92a7-e0036bb96e1c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-553a-3a71-d4a9-52ee23c780c5	RO	ROU	642	Romania 	Romunija	\N
00040000-553a-3a71-8783-aeef13f2e950	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-553a-3a71-a859-65f9a3ebc4cc	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-553a-3a71-d081-861266f5575d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-553a-3a71-be60-1542fcb4a26a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-553a-3a71-06f5-92636be3fa02	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-553a-3a71-b3e4-daa0e915ad15	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-553a-3a71-b985-09adf6119c36	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-553a-3a71-127a-662a4cbd8574	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-553a-3a71-8066-e59cdc100b22	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-553a-3a71-cfd1-f2fa64159bcc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-553a-3a71-ce25-699c2798db5f	SM	SMR	674	San Marino 	San Marino	\N
00040000-553a-3a71-f2a6-f8657980a0f0	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-553a-3a71-fee0-72c9a994da2d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-553a-3a71-18a7-6cea789009a4	SN	SEN	686	Senegal 	Senegal	\N
00040000-553a-3a71-a0e7-6a9ccd5d4ebc	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-553a-3a71-c3f3-09721d32316e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-553a-3a71-2e71-bfe08fa7a724	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-553a-3a71-ff02-ad697144324f	SG	SGP	702	Singapore 	Singapur	\N
00040000-553a-3a71-af26-607b0148595b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-553a-3a71-f5ad-90e3b317bc04	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-553a-3a71-b0b1-33bc1acf6f17	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-553a-3a71-5a32-89689d6a75f8	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-553a-3a71-f42b-041eb2a5c15f	SO	SOM	706	Somalia 	Somalija	\N
00040000-553a-3a71-d48c-ab6e05859bf2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-553a-3a71-e728-6f6c215ff2d8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-553a-3a71-a949-8baab3fe1e13	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-553a-3a71-a2da-d7540275244a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-553a-3a71-5c5b-22672f7df883	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-553a-3a71-c7d9-84896bf462f5	SD	SDN	729	Sudan 	Sudan	\N
00040000-553a-3a71-994f-2bbc2863276e	SR	SUR	740	Suriname 	Surinam	\N
00040000-553a-3a71-e7d8-12e1b9301b3e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-553a-3a71-bb1e-5aadf30887f9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-553a-3a71-86b6-f3e84d2bfb73	SE	SWE	752	Sweden 	Švedska	\N
00040000-553a-3a71-cd9b-01bc2df10c7f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-553a-3a71-b5f2-4bb92c0c909a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-553a-3a71-fadb-3faea38605f0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-553a-3a71-c414-9cc59c56cab4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-553a-3a71-88e9-160074c4546f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-553a-3a71-f66f-4543699f975e	TH	THA	764	Thailand 	Tajska	\N
00040000-553a-3a71-33e1-c94fd409f3cd	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-553a-3a71-e2e4-c472a861bb04	TG	TGO	768	Togo 	Togo	\N
00040000-553a-3a71-18d8-e45c8e0d99aa	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-553a-3a71-6460-3491410acb7c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-553a-3a71-8449-072f17c3b6f0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-553a-3a71-8385-21ef26e827ad	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-553a-3a71-e324-5858bb59ef06	TR	TUR	792	Turkey 	Turčija	\N
00040000-553a-3a71-dc82-2dcb0a6ac7ef	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-553a-3a71-61e8-777058988d71	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-3a71-b3fa-4af985ce7a02	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-553a-3a71-6aaa-f8c7e3a2acbc	UG	UGA	800	Uganda 	Uganda	\N
00040000-553a-3a71-bdac-088074c500b6	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-553a-3a71-3855-6f64285cc832	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-553a-3a71-b1d9-e980eb5c6c03	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-553a-3a71-a6e3-72b4170cd448	US	USA	840	United States 	Združene države Amerike	\N
00040000-553a-3a71-7eda-f9cc7f9d0e4a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-553a-3a71-87f9-02f8ddabeda6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-553a-3a71-31c4-0f0c1d6fa961	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-553a-3a71-5f10-0b5b363f5430	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-553a-3a71-b51f-2af71aa524b6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-553a-3a71-0f1c-b66e44f8cdcb	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-553a-3a71-57da-b9d8546b4b9a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-3a71-b75a-8d82fa3d0516	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-553a-3a71-8715-ae34a3c43003	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-553a-3a71-ee83-0e416972238b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-553a-3a71-2bdb-ab5ad4a03e46	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-553a-3a71-5e35-6245f68080ce	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-553a-3a71-e7a7-5a4be4391575	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 1303624)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1303445)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1303493)
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
-- TOC entry 2658 (class 0 OID 1303542)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1303567)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1303394)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-553a-3a73-46db-ece484aae7f5	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-553a-3a73-9790-24dcb55eaeb1	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-553a-3a73-7e01-feff31367b3f	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-553a-3a73-a103-cf94105e0904	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-553a-3a73-94b8-6934c4dcf84f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-553a-3a73-ecdb-ac853ac1b587	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-553a-3a73-5d38-648c898b49a4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-553a-3a73-4c89-28432a406183	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-553a-3a73-eedb-acb2c2c0f5bf	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-553a-3a73-7076-d793d753932b	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 1303301)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-553a-3a73-a256-32d9e50dc27b	00000000-553a-3a73-94b8-6934c4dcf84f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-553a-3a73-5bc3-db5bcc257254	00000000-553a-3a73-94b8-6934c4dcf84f	00010000-553a-3a73-761c-9d5a373ac346	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-553a-3a73-7978-5348898fd9be	00000000-553a-3a73-ecdb-ac853ac1b587	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 1303312)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1303364)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 1303266)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-553a-3a71-afb8-c2e3184e07e7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a71-8bf0-e7a12ee19992	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a71-d33c-a426791a45ad	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a71-f256-c6e68a6ba2f9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a71-30b5-17557e7d123b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a71-d452-a2eb56a23f45	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a71-aee5-6cd2c592d1e5	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a71-aceb-41a2498201fa	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a71-11d2-bf438884e37b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a71-a224-1fe354e141f8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a71-5023-2fef62a71eee	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a71-8480-88f84819ff0f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a71-bbc0-6e9f205ea4ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a71-3235-eb9fcfa91eca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a71-ad82-de482aa46887	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a71-5140-28ed6d546a34	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a71-56e1-e09a013463d9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a71-7a82-2af88bfb3043	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a71-df0f-33df27d8e41a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a71-f3d6-b76e727e77dd	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a71-82a4-6738913f9a4c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a71-01d3-75bc641b1f6f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a71-5e74-78539e64ec49	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a71-3898-d6775062ed39	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a71-4930-501e3c1a210e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a71-2347-7ad89a8ed397	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a71-da3b-0e6b2b0a7e8e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a71-01f2-3206033d630d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a71-6b29-59e026bbd6de	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a71-acba-da9fed7a8936	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a71-d229-812f0fbc525a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a71-ea67-74305af9a073	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a71-f2c5-1fb12521cba0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a71-ba52-84b8efc4a566	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a71-88b0-aedea848bd0a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a71-6825-05b82d2df31c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a71-b6fa-7f2c5ff4567a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a71-0351-da4565f3b12a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a71-2488-4b4b34601b38	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a71-285e-4227c7323587	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a71-f420-c6418c7a1e18	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a71-a352-0456b0ed15ab	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a71-dc58-2f2bc1bb73f6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a71-179b-c263e220859a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a71-5f75-3c63399ef12d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a71-4222-a0757ebd4954	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a71-28ee-1bc74813c2c3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a71-0ea6-191e39e17e87	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a71-ad21-2f08a716e0c5	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a71-d23f-a57f8c6cb498	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a71-2ef6-5c8dc129773c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a71-0b0b-bd429f79b9a6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a71-e562-1f68573fe79b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a71-6759-b633378ee313	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a71-233a-3c5f63892185	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a71-3fa3-8499d63cce54	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a71-e77f-1aa8cb0ed8a0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a71-7394-5c94d106216d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a71-b0e3-3502611fa95c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a71-357e-fd796c25b9fb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a71-7f78-fcc5eb785356	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a71-152e-2e11ce81457a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a71-5b79-8eb2d595b956	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a71-b8ab-4485da778ef2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a71-95a3-5af7b2dbc3fb	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a71-3c78-679668bb3a9d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a71-f164-54d82ff4edcf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a71-6816-56cd33145b34	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a71-8148-dd56e461ffcb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a71-f9ce-8a5945551793	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a71-d4e3-328a4b02b9d1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a71-ef4b-1d95ac907d2f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a71-2c5e-bcc1cdb3e066	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a71-77fd-2194a13227a3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a71-dd87-3e384fc544bb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a71-61e9-ede9e583219b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a71-64be-2de050fae981	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a71-e930-5534e5898d3e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a71-9d7b-f3b44102e0ee	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a71-ac09-0c1131dd9135	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a71-5b56-a83fd5c00d78	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a71-b16f-b8845a3c2ec9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a71-be54-6af2bbb72b3f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a71-757e-c00bb0e98389	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a71-7ef9-41f3134ad6b5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a71-55f4-7f7b20076413	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a71-9249-aef09cdc5d0c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a71-b4c2-c162f4b8dd01	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a71-8ada-5260ef294fdd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a71-57dc-25814665bf14	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a71-0766-50ac36842601	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a71-b070-f020e094bfad	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a71-889e-401de89ac3f9	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a71-1fcb-21db283f3848	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a71-2b47-5ef8d89f64cd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a71-4170-54bff99caeba	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a71-f7da-e07bbe153746	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a71-47e1-93a24b23aae0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a71-8646-c269172d010e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a71-0711-01423962f36f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a71-6477-75737a9a10bc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a71-1602-9677e5b2629f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a71-2398-6b88fec88229	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a71-bd6f-dbca2dafefb6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a71-807f-9c80fad1935d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a71-c7c3-905c88f60ad9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a71-be98-dc481b86428c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a71-5afb-ccbec7b07dbb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a71-7f96-28e213b28672	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a71-45e6-37c595f6c963	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a71-2502-9c13bf9d368f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a71-b36b-5480ef67caa6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a71-da28-d606606d2ec2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a71-d9ce-9db49c614543	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a71-3ddf-2f6948f55e8f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a71-07b2-673244633db0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a71-51d7-e498932bd27a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a71-7a03-4dfa938c8430	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a71-af42-0bb5e9a035ac	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a71-9a45-b72ceaae57b8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a71-2819-7c1e3c0191fa	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a71-a177-7cc612937fbc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a71-7d49-a8de5bbacb7b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a71-9125-787efacc5455	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a71-5eff-309d9f9f7f20	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a71-c95c-8b86782ff024	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a71-7676-4762d8534092	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a71-e13f-2525a926d1b8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a71-957d-c81db286310a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a71-6198-84b4be2bdfe5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a71-384d-124f514c7448	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a71-12f4-9400020315ca	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-b9fe-32c626213eef	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-f6a2-6f6980653b0f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-ca8a-7d180cbaabf8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-f356-0437091826aa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-972e-83df848c683d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-3ed9-5f859f047d5b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-6a57-72d3b4686d1a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-e330-ebf983e47b2f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-b1fd-2dfbd95ec388	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-b7af-c009151ad9fd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-60c8-144734b4b1d1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-e9af-f669ade11a78	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-aca2-4c4f3eb25256	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-53c9-57319da28cd1	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-7357-e911a2258f42	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-d9fe-98cd8c858bdb	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-60fb-a094f55aade3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-62ee-aa0ac8c73885	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-c0b9-60eedb4f904b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-97ff-1c07fcf6f3d0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-6dd8-450e629ea60c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-a8a6-fdea94c91112	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-a445-51d7e94c0998	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-3462-bec46ea58238	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-7cb2-a34abec19fc6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-f6ee-10d50eb8e316	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-b630-3596fb1ad1f8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-5dbb-d4eb586846b0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-4d6e-f23802b00852	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-d11c-ee11bd977f41	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-b84d-9854f94f2b8b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-f171-27893e03d26d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-e416-ba18536e05ac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-c5ad-3233409fac06	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-e257-6d55c9582624	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-a255-b4f766465f61	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-3ee0-1b6dade86dfb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-bcda-0a06220b7f98	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-6c0c-69dc618fda9f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-c37a-29f8aa34cd42	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-4a68-4b79a4309ba2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-c1bc-208787f958e2	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-f540-744c225e253c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-ab42-61f3e9f2607e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-c25b-1208c023660c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-5943-a4a284497637	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-1c49-556a3855e0ae	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-aef8-f63240ea1ebc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-d442-85cfbfa29694	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-92d1-6abc39719f5e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-1ca3-3565b9636e1e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-5e30-eeb50ecde55a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-35b8-f79b41c0e9a3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-e881-eb474f3710bf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-6878-9b8cc078df6a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-81ee-b8f36ebe6926	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-8d78-15432bfc8e6d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-a791-85f559ad97d0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-e896-022dec53f492	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-ddde-7d81fc40df00	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-3873-811bcb9a8056	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-91e1-a12e85721389	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-0e2d-7374fa4086d4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-dbc6-3a086c11aae1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-aa2d-2d8687c3a78c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-d793-851dbba8411a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-f91c-371937de62ae	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-da5e-7768479c7f03	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-2b93-2b064530bc80	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-0683-a7e34de8056a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-91c2-c34eaf9b3992	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-472c-6579ff649396	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-da68-31813b397d67	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-01a3-1fd3a3beec05	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-ba1a-0116ec354a5c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-a71d-af2b13c941b9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-eed0-83249b0bea4f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-351d-91067160a42f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-203b-28f787c58c13	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-9a9e-09b4654f9b2e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-d51e-3d5c613e7bc7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-35cc-d04cb69914ca	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-952b-be3d7869cc7f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-bb1d-fb19e3ceb38d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-3859-fdd2526dbf1a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-9c2e-4837939ae752	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-5ded-d16e817ed34c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-5287-f806fff27a50	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-ad80-566f40607d0c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-a926-3dbf55820f20	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-5318-ce8a128917cb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-e26c-e1ecc85e1c40	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-b2cf-213bdf03cea3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-0024-28be0e22fe87	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-d621-1d0e08e5b073	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-043e-0bef5b03aabf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-3759-a3a9cb658594	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-7670-6061edec4a88	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-0daa-fdabafc9505f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-05af-c59e20a13819	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-5a8b-cbc8c95d390d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-6f4c-3fcfe7757044	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-c7a3-f687a9c5b1d6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-05d4-91b9031ba2d1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-ba48-6d16c394d9af	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-099e-a25ef05eae24	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-648a-8f99287c2261	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-6a7d-da9ccc7f535c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-0e57-8ae2c4507468	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-e848-725459664ffa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-9896-bff6cc4fa959	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-3ad0-43612fcf87e0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-055c-20472f06cb4e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-16e4-3867735891bb	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-fd4c-547856e9c777	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-6dcd-e2da97848953	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-1115-4575ac28d9ee	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-a800-cde86d2a45ff	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-d4ba-3a21ab4b4806	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-cb79-63ec5858c58a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-2e36-94c47a2ee3b1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-ae54-e92b349ba6f5	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-3777-77e031a171fc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-2325-69bf477aab6d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-c2a2-19d526624b26	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-6d76-3223a7d63b96	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-91f4-519de4b44603	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-67bc-b9794d8f258c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-8509-591d49e32dd1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-e96a-4a65ae151bb5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-d83f-65e8539a7a16	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-ecca-da67fe7a75e4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-cbdf-727781401efc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-cf57-9ff5c1423c1b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-bbad-45de93eebced	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-5eac-36d147293ad9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-6610-fb1c4dc8d72e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-fbd9-6ff37a28c442	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-e44e-aa44e4f8f398	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-79d7-a264a92d000f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-9a21-63ea4bf84ff5	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-148f-2a9fab07f996	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-9383-a63300a21fdd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-11b1-c69a9d77924c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-9ad6-392ab21f4a6f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-0798-d2b1fde2d62d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-49e2-766d91be4a8f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-040c-8f68991cfd21	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-437c-67017fc279e6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-58b0-307de9e04515	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-07af-497654945419	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-9e85-9c1e1628940a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-78f4-4f25e2e61c91	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-e3d6-68d749e34f0c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-5d6b-3baa6dfa1c2f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-b753-29818d96adf3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-4ace-02010b4880a4	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-0daf-630b2bf534a5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-2b89-60fbbc2ca671	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-9e98-c9e373488757	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-d9ff-eb92af61841b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-49d6-898e2a462335	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-b48d-0af1e1a10890	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-0358-d99654c1a33f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-6ef1-97e41590adce	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-e971-3994c4e2974f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-85ae-b6db7ebea145	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-ce2e-094b4685f292	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-63fb-2ad9d8860cf2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-8263-828d7f56e1a9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-b2fa-db0920e795e8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-0559-df5f90a68861	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-6249-a33730e35a90	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-3ecf-21d5c5904ccb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-d455-2e6b2f340968	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-a507-c77c51203132	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-4a99-6e9d95049e14	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-5851-560ad7f50cf9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-8158-a5a0c7ea6074	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-63cd-5e0fe334a11e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-725e-546e4ad817d0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-0975-b0f68d5e4166	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-195c-e92f46168607	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-5a2a-823d56b8b523	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-9051-df93e143c36e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-90f8-6ad045c610fa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-0a75-a434d3fd71e5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-fc0a-e41bc1e300cf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-8ebd-a2fd1529ed05	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-fa13-3d286e7dd3f8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-fd59-bca5b7b36f1f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-6063-9caabc709a6c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-8eef-3390ce4e137d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-a548-4bc67fde695c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-b06c-2cdf110e47bc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-b898-ac0edc1f7901	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-e8a8-ed04a2d8a399	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-4321-7d67566974b9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-de26-988b53e5b599	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-ac7e-14ac492e1271	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-092c-c003830a9fb8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-1fab-806b32b32b8f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-f93a-2953895ee32f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-8507-ffb9f1345c8b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-d862-ed627ac10b48	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-f18c-68ec61c2a2da	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-56cc-5f776244ea2c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-8a62-a60560355499	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-5fb8-c0f62f3f33fa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-e52a-d50a09a2c567	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-1ce0-b9e5cb987795	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-8b2e-77ad6b3e947c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-ee3d-d53a01d5b2f1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-70d6-196452921abc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-c25b-0ad84d765a86	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-816b-b3bec4399dc1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-d6d4-5f4539a84236	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-ced2-5c73704c0c54	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-6c35-d23372f53d24	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-41b8-53275be78581	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-c4cd-f34b4862e9bd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-75bb-21b1db166bf3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-dd4d-c840951e1a0e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-04c1-f0e27648b8cd	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-0cf8-0a08b8f35ac5	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-f1aa-f4048831b442	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-5a08-e35904854055	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-2605-05a62e39a9f6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-9698-356151da31c5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-8f7e-ccac44ec91d0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-c9a5-4785ea22bc77	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-5eeb-378dded9331b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-4fa5-081bf8651436	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-9c81-78c3492e382f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-6afe-38b8fa2803fe	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-6416-ba2f8a14fcff	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-489d-f45cc0b61126	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-fa65-27696d021718	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-6ecc-a1af08450038	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-128f-3f6ceabbe081	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-7363-8937fc4f7f6b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-377f-cf787dfbeb1a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-4472-5867c817f39c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-26c0-b2c3ddbabd92	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-81a2-8eb29e5636a4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-8b20-dd61fc664297	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-2fef-7fe6cc4d9d96	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-94b4-2cd51b82d235	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-b5b4-f48d578f95b0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-556f-b1605e653d63	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-80d1-2698d846fa94	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-1dbf-e39807324d11	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-e45a-24e8c8a42677	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-41aa-d67566571210	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-9ebf-ab322c8b6e0b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-aed3-ad89c354d5e7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-c705-ef4240e3decf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-3a29-5ed3cfdd8502	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-b157-5dfbaa596889	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-bb1b-7321df442557	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-23d2-8cc2ce2f1104	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-e322-410ee7022293	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-5523-ce3352791f64	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-7996-fc2fb09eebbf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-9a8e-95906fcd8690	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-6ba3-94ff4325546b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-f2a9-b468d8b7ff95	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-af3e-53b9ddc912fb	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-2d6c-0c4f0218399c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-a648-57dbf5b899fb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-27a7-5bc9b5c6c11a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-05ba-efc4a7f5184d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-d243-07356fb0844d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-8474-75ee309d04aa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-3a2f-408477613acd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-5e9b-060c755b5aef	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-69ef-141a292d1b7e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-22a7-0449c2c2ee53	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-81fa-0073c08990c0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-d86b-07b202dc1b3a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-ebe0-c02354da6ce4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-3733-60a14162a863	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-4fd9-b0eb5e40a3e2	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-fb00-8f0d09e4f41f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-a237-57ce66577c96	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-bbb5-b7f8c3fc5a04	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-1d9f-7060c6fb6472	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-b4ff-538a3545ed7f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-f2ee-863fa97922ee	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-a3c7-5802e6de334d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-ee64-a86358ad4bf2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-2f98-82e697993934	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-68a3-9046f89fb233	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-6fca-051097245c2f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-73ad-afc96c723d10	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-810b-0034b9902d1f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-28ec-b2cc11805b86	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-99ea-5769afb23e55	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-03fa-dba71acb45d8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-95df-5a62f11fa6af	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-ae5b-3dd60704ce54	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-97a4-9110c09902a0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-cf9d-c3541db56b11	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-cb2b-c531222fb919	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-0e8f-8ac021c592b3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-18c1-44ac65048210	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-5fc8-3982a4993efb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-1157-3878770ba5a0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-ea29-1023d1fc4ee0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-b494-d1388225b296	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-b4b4-d780da5f7ee9	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-d8d0-680712626ebb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-0ee1-f1ef94baa338	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-e63f-25030ae6a377	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-6e3f-6057b365fc3b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-18c9-ca3ad725db9a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-e50d-16bf6f69fcfe	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-dee4-c4270a1ecd16	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-e5af-0af4835c69dd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-758e-bdb4e71f80d2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-b366-867356cf59f8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-7d4c-8d49b3dbe1f7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-61f3-740600b9df2e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-7b70-1dd4f747535f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-3924-2caa5356f9d5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-babb-cd46159b62af	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-a30f-0413d0bf443e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-5c84-1f3718de9aaa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-4fe9-6ff7bda9c20b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-1bcc-e8d2990d8917	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-de2e-5173b60aa64f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-2638-771dc888292f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-6205-5a35332dbaa3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-e84a-e872c61bd9d7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-ddd5-2326ccfbb3ca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-d51f-6266e4881b58	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-d386-9a0a3a45e46c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-376c-84255150cc1d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-9752-c7b39d924971	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-ef7e-7913d1bd08dd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-abbe-1d85c0a2ad6d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-0b04-b9c37d1037ea	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-92c8-129077940269	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-8738-03b83d79be0d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-a011-1d716637e236	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-85c0-4af228709c6f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-42f3-01af6e39e220	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-0f18-c4bf0357f268	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-602e-fa75f5ccd531	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-943d-bc8413fcd043	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-fe92-d18fcba1db0b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-8209-3114faef1f7f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-6b1f-ad21e16e4b98	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-1506-cb186fa49578	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-4062-db55e994a842	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-7823-8ce4996386f7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-a993-64259181a11c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-be39-c13ea8f7283d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-2e2f-8fe274e778f7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-0a06-42d2ed861134	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-7682-8a33313e3e0c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-8c77-837eb21ddd89	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-6293-fffe36af8b47	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-3011-acbe13acbf72	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-298c-251f0698deb8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-8fcb-4645d91964e7	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-2234-779e5ffe0341	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-138f-7204a91477ce	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-a66d-2b07a6f249ae	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-17bc-599831dc9ec6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-2411-d1a4fb0ecd00	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-aa6a-3cd94b32d3c0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-4a7c-e9e8d780f6d8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-682d-b7700b625855	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-9d7e-8ab74dbf9457	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-6ba3-6b52ccce551c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-671c-dc7eedf9d929	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-7919-4a77cf70d787	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-8bb8-6955649abc37	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-987d-9864261f5ce2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-6685-ca62758a802e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-25b0-98e38572586f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-2787-3c49dbd502a2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-7e3f-b764cbf43853	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-4dce-ec93dc6876fb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-abfb-40ce60b73bca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-9bec-d50fc6aa1bac	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-2984-fb15822a1c99	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-ded2-44883fa051ed	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-6ed1-d6c38f7e8bbd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-3f0b-74a106043934	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-6de7-57a7cd08d624	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-e776-d886acb3167c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-0eb8-fbb23ecc649e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-afb3-b635fbda094b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-2695-4e95ae0a5880	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-7098-00bb8faf14ba	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-4273-260b8ae19c92	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-2350-54afb5e6ea5d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-c382-a3c5a678ca19	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-4497-70c1b440cca7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-781b-d4e71cb7b37d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-0ebf-ab77c9845d37	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-82f0-ad367449ee36	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-1eaf-cc902854a0bb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-1da4-f69f4574eb57	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-1505-802f7f49f07b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-b4c2-80ae57bc0381	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-6bd7-f38339609b12	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-f825-8f1ad0dcee87	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-ed2c-429cca4f138e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-680b-ce028036a031	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-12b8-ecb52d7cd893	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-e006-394c25e4abce	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-c5fe-7bab348f70dc	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-7a02-5c45ccac9af2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-4852-797eedc1fe37	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-0474-c435214c17fe	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-643b-68f0abd3a341	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-45c1-49ef371a675f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-34dc-5b6e12e22139	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-2b52-8c120076bd26	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-7d44-43010bd52da3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-aea5-fc4d69a86571	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-adeb-cc8aa93d2e11	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-0e0b-23af69736f3e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-7e4b-dac34e1cda0c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-bda8-21f14d5b1c63	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-627b-d186fe9e9e39	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-e650-a507af1cc9b8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-583d-cb340ba38fe9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-05cc-8a1f99e67ffd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-bdba-4e8042584f60	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-3b57-7c357e0c4546	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-f759-701968f8ba76	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-4e24-9206c33e8ed7	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-47ca-c8afb9a9c19d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-ea2b-126c2b8134ba	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-966a-1c7960d9087b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-8de4-3093c97929a8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-c924-49b35e5a1429	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-5553-801332fdf7f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-53d1-8ce728b3b87e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-6d9b-eeca8ae17f32	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-dfd6-3ef2959dd7f1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-579f-212b68eb95a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-97a9-de9b0bec5fe2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-cfe0-6f815ae3af45	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-acb9-43adaf5bee0f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-12b9-4ef141989b91	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-9484-131366925d05	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-6265-ef13f35eae74	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-9106-1e75b8930152	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-deff-265b73e6362e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-372e-adc7d3de2351	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-8d3c-da3c65a3cdd1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-358c-8a59a05c1494	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-0330-9de7f84a36f6	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-4be3-ed05c44f0346	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-34a4-b7cea07b52d8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-53f0-8a4d0a7b66a3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-03ce-8812a526f22e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-8d33-333f21132b62	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-d0d0-6f970f6edc96	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-a76e-77542e60aabe	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-6398-5db534eea8b8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-06db-a6ec155a717f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-b150-b04e35e53fdf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-54a4-61bb93190af3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-db1c-57adc5550231	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-23b9-6d5e410c05d0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-b3f4-1c733f2a62ad	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-715e-6346a94e1ea3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-6f94-2dd4d53d564f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-2ef8-cb4c281d005f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-02d5-f20cf60d40c4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-e220-eb17c3ccdde6	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-ed13-95e3c27722a8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-f06e-92543a06c1a2	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-66e8-98e1412ded7b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-0705-fd31dff6f622	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-c57c-75d4721bbd66	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-428f-2ac77ba2e68f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-bf05-53f9699f3aa9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-5783-2ca9787092d1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-1ef1-897a1bb435e3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-5bee-e9a2c95b2c29	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-4c8c-b9e025ed3aec	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-0748-17fb4caf6b54	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-6ae9-d4df2a69461a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-e812-5db9d6d46f7f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-64f3-3674f8cfb462	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-da85-60abd99e472a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-3f84-4ba1cc78b7c7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-f2e3-7dfc4c0cd21c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-1b06-7a7002c625d3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-194e-52aaeb9bbfe4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-972c-7266cea0ff28	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-5291-dcbd08ce10f9	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-8e01-7a8e4f6828ef	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-b7ed-02e3dd993c08	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-ee43-ea5a88a43bc1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-6683-d43febcc0a10	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-7aec-1362bb0a42f6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-5b11-70ca1307b526	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-ad9b-1231aa9c30ab	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-0bb3-23bf9a2d190d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-6559-43811da9d525	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-c0b2-124389e1c376	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-9c8d-dc9511b45be9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-58ad-ce3f90497104	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-2453-3cf96492aed3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-a4a2-ef14d08277aa	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-e661-a330f5059b49	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-9fd4-881ca3cdf888	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-4906-bc81e144f2f0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-868d-fd34c9db77f9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-be61-72380e2df6aa	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-da61-fcfc5ce24d7b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-2023-b000aebaa529	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-14a3-2d365cc982c5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-790a-7896e831e86d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-d2db-34d5ce821ea8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-33ca-d3d8081836f7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-2deb-575c79da74b5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-b4bc-ae80f3523b12	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-0c15-8ed3400115e0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-0668-807234b1b3fe	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-be8d-fe648c49af6e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-a1cc-64c56513a93c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-efb1-83b6f51aef8a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-3a95-b84bb4b0633d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-8501-92556a41e381	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-95f1-e9be2274639a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-23a8-61774bdcc274	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-5f9f-22cf8fcf966c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-bcae-3eedbd57697e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-9452-518b557eb126	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-1c1f-32af904b0d7c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-a13a-3f4851915bf3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-d2af-66ca2dc296ff	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-5eb7-eda233316b5c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-5ead-605b36fd40b4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-666e-e53a4db7a365	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-7f38-0fa6fcfb5513	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-2baa-5928bf4365e8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-45c2-8ec0b41d2b4e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-c79e-975df4b9e6aa	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-fb55-50c7c6a252f5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-d38f-5c9a5dcbb4c9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-7ce1-3be3d775ab8c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-e161-72660f056ade	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-bbd3-34bc8e3825fb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-63f7-e1679715af7d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-1f3b-40f8938eb689	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-baeb-44649778609a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-3bbe-2290ee72d9a4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-d1e5-7ff2d27da0f5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-d2dc-1ec7313fa572	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-a3d9-47eb7f64e430	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-145e-cf00b86089b1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-7b28-456fc40947f9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-b524-bcbe38278acf	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-c79c-358078a4dbfe	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-6394-754a46450f1e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-0ffd-f1eeb76d4d89	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-4ca2-120b9277a12f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-fa3b-1a74646b47aa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-b050-5d0512b06959	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-78b8-2a151aa4562e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-aa71-d5a2ec1ded13	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-bd0e-8bf39604063d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-5240-98f5871b1764	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-797d-02cc62746c2f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-342d-0143cf8617f7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-203f-04b833042653	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-63e8-de62d7e048d6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-53bd-e50e31b32932	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-f0dc-67f3c28d8813	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-e460-7bd36bb4370e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-ab6b-60c13043491b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-c67f-33ee77d5daa1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-5f18-1d167818c9cf	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-77c4-fdc58558e02c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-c945-b0d3cdaae238	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-4742-6999710526a5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-f307-dcb818fa5d90	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-b97a-8b38d69327df	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-7075-a21a497a9442	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-850e-faa6ba379a98	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-4e13-88a1db3e5a7f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-6c65-e99d66b1bb4b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-f6b5-16dde130162e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-8af4-24bbfdf1dc67	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-c607-63faaeb670d5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-27d6-372b29e50aa6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-7bf1-39612a11c123	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-f890-5d045a5559d2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-88fd-bd31c8c0c78d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-3868-fee74f7159ea	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-ae80-9c948603ea86	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-45b3-cc3ab19c19d7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-84dc-39d212ea4693	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-f750-7db6c2bcf89f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-3c39-eaa510ee2a62	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-47bc-47e379bbed45	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-41dd-9de8b5dc5336	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-6ecb-28408d8e8e04	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-9712-8a228c4e1320	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-3096-d95b25d0ef95	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-cdbc-02bb5fb16a9d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-8741-122c16650712	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-877b-1ca077bbbea6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-ebaf-eb28e8534f93	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-f26d-246b8f41714f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-3d3a-0d9e4e1e6132	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-16a7-c3e767571e7b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-f54a-0bac7ffee31c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-677c-9c2e9601defc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-f756-b43bc9822b24	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-57d2-bc6556a61428	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-627a-f038aed93fdd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-6650-86202845e336	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-935d-4b3dc4bb0acc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-ed19-a86c2281e7f6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-1846-cb299d4296dd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-486f-f7168266294f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-ebf1-698dba4ebcf0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-6dad-83a664d95115	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-8d14-792ef2314afd	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-b6a1-d6e21f1378b2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-0d32-a916d7e1d027	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-e717-8e5c0275f99a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-4ba7-f0f1e84c6d2d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-5dc8-caba36442915	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-aa66-6e89e70b48da	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-c4be-d1a54a04f1ba	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-8207-5f53fbf2dcce	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-a769-151c4c284ec3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-cfab-e44c76a83195	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-1ced-32874db53bb3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-ee6a-665a527ed6dc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-49d0-091a3ee31886	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-5c66-ab620190807d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-f3a3-91ad86bce002	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-edee-3bac75874d53	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-c11b-b07120b8b390	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-b365-d29160cc7c21	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-b80b-2816e3d45f96	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-d71b-51257a656ee8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-b97f-7086d72e149c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-b654-e161988ef408	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-7c14-a1524f41324c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-8dde-cfc3e7601afb	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-342d-e92a5c7e3355	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-048f-76d35d1ca475	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-d56b-6a7784acc3f4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-c25a-289188bc7a64	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-f75e-ff93c33ce074	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-163c-da6f7b61c6e0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-0420-f4bd50f8f5c5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-77f0-4262b8661dbe	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-a12c-2c286262b675	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-1c1d-f5afbd1b706a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-697b-8dadc8351d92	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-d36c-8108c878e947	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-041e-189b15643bd1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-ac06-9eb6ac8e104d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-f483-cd8d85cdbdbf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-aaf2-33c96f4fb921	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-6ee9-a347850d9789	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-2892-a0953ad44415	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-872a-f3266292218a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-04a5-43f6a3cf5f91	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-187e-b6e315002a44	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-83ab-262a2aad337f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-a232-ff049dabd10d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-8ee1-8316904f5885	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-d85d-bbd82a70b659	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-23bf-ca38434cc735	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-73a5-15a2cab62668	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-f3f6-52ef8ed21f49	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-b4c3-6cb329492dab	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-0bcc-d008114735df	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-0ad9-9a2b5e18382a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-7c19-f693708289b7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-5929-ef3f519e6e4d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-ff6c-73b1dc68e08f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-f542-9dc165ae7b80	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-585b-1599f6cff442	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-355c-8c441e2b2b52	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-454f-7f7fca55d827	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-1a65-ae9511765db7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-5db4-8db0b8137014	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-2fbd-88d2e22fd776	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-cb0c-efb3e6602bab	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-5bf9-c93503146d62	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-676d-77fd47d1ddc3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-2259-40572d2cb847	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-387d-6f9bb8781a3e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-bf6e-d937da04626e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-ff84-a75b9c5ae2e5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-de9f-b9e11d6cc098	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-e484-92a11fa1c675	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-788e-044b2c42c863	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-e103-691f8e3d1145	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-2007-9b74e23d265a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-59ce-76be27301a28	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-244f-229c7cafbc6f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-dae3-c57b6b4228a3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-8de2-9b00e66ef8f2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-b4d3-8e9a37253190	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-8ff1-8f7a4d1b02d7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-d280-e3ecd7116bcf	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-2c98-54d411d3105a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-e2e1-215ca94aa543	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-365a-8aba36bb5392	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-f9c1-71b3536f7677	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-b8a1-9ef1630a3cb5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-b48c-7f6656c8b4e1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-81e3-c7f45d51339c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-b772-93452e77d278	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-6618-edd61528c34d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-a293-6ce08a77414f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-e696-68dbc5bb8cef	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-66fd-0d52d8c13d9b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-1249-d28672efbe88	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-056a-f688f488b17c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-10ce-e6b266e096c8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-f49b-e29571362432	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-1482-7d2d25213696	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-9135-a8bdf548dd42	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-a897-99e654c0c1db	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-586c-63ce1a32e8a9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-82e8-bb45897ebdf4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-6fea-93b82d13524d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-97ca-770237d540b6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-d9f5-4cb3a27d2c67	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-af90-c4d49a391001	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-60b8-077898d22888	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-bee4-a2d94710fb51	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-7c3f-b7e8a6f9e14b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-7867-70f46d1153b2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-60ff-2e6294554871	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-fa32-5e32190e02dc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-3c07-8c59130da8a6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-a602-ca28b5f87a6b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-ff4b-955ae8aedb98	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-c110-ffdbafd27d63	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-9258-af2019e09815	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-4a9c-1019474a4710	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-cc93-6fda6a315d25	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-cea0-e6d9e3f48ef7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-9418-04e1535a1cf1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-bda2-2193200ebc98	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-1ceb-8e7143aa9ead	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-50f1-b842e98ee5c3	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-eadc-9a644c1c2a90	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-d193-01ed0a634c72	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-7168-8496f761523d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-ab52-e22711216d6a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-234c-915a4d86132e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-9c12-ed1c3cfff678	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-2cf7-6f551e5b681c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-0e6a-147486976fc3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-f60f-5e41c254e2e5	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-ff8f-7115ca36ccaf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-9e02-f2a5323953db	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-5be8-88ac0a5674d4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-fa28-2623ce903c60	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-e38a-f0983d99e39f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-fd6f-0a45d3529bb0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-0ae1-e68e5094dac8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-c912-10b512c11322	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-0f58-1d8fdfc9239b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-e331-416abfcd5bf4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-3fa7-e3c438646047	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-6ec9-8aa9d1c6508c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-9919-2f6a2887fb8b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-253a-10ac7a6edc8b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-a143-612786fba00e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-5596-7e907c2e9955	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-7e1b-badcd5952a18	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-918c-7b50e089841b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-74da-41a81e804bbd	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-69fd-0379213c23ad	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-160b-d700c1ea2008	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-8fef-8a19bc63d7d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-78f9-0235827b5ab0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-f2dd-287cb9b70633	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-4dd3-ac5a662e6251	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-92a9-7ef3599a6770	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-8f55-03424718f8c8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-68ef-06874ede4a67	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-521b-26117a5710c4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-ec25-9bb0f9f64e0c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-4007-c5d58def138c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-a702-c7a23480b00b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-742b-7107d06e9567	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-5c6f-e809a01e9b1a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-22be-4e542b1a2a87	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-b065-ef51eea46ec3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-15ac-b56e131061a3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-a235-9dae58ea4afa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-eeac-e063b4d7081b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-418c-0d90c1ea35d1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-da05-ba51f1a51e02	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-a979-5d35db7c5a16	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-0014-4544d801867a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-97cc-052b2fb101ea	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-a7d1-bfe66a77d346	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-dbca-5e91a9d41de5	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-e6f9-f34c5c4d45b3	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-0af7-ecc02f36528b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-d08e-183714a04e28	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-2652-4a5200ec8dd0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-13f8-10264552cfd6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-af97-2e728c4da072	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-a333-f25d33fe88bf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-1e31-b97460c24701	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-50b8-a869ffcf2291	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-1c48-7dcf5938b35b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-d1f6-c87d9cb2b28d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-e508-5ff84546f10a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-187e-ebe982645c68	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-bc6d-7cabfd979c39	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-db47-7448e3cbc4b7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-92ce-fb1305e6162b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-3806-22a276ba8e76	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-9d83-e4f5f0b05aae	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-107d-4475b3eac879	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-dfa9-fa7457757572	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-6c9f-57c870b4b64c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-e254-6ca6a9b36301	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-0686-3c6f964b6971	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-3486-65c252c97f95	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-923a-0e600af98146	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-61ba-d0bb02f7a36c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-294b-8aad5b42e7e6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-564d-8ac6e35f8a8d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-35ad-bcf09947dc4b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-79c7-51456171992b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-5193-a65f699f9898	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-feb9-67c7b686209f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-1b22-7a16dbab5437	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-a454-b95b741d766e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-9dbc-b2d9d4bc6b04	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-26a3-869278a5ec77	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-cd04-cd04e430d807	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-506c-42d98f175134	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-60d0-c492075dcee3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-3c66-ae6c4284452c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-a23e-326462753832	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-1417-b7c3faa29910	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-97c6-41eb7d69d8e3	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-7d81-2e053a98ba83	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-bcef-463512460171	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-48d9-b0164f3f6ff3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-1ebc-3ada1883bf72	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-9bc6-f8dca86cc3f7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-151b-a092561e921f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-b490-5bc6f933bb24	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-aefe-9ddd7fd6a526	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-34bd-84b36fe945a1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-6bf7-7e187e22b370	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-eb5a-1852cf26a193	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-4ea1-5791744a650b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-fa8c-9fe491a29b97	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-ca21-056b7d0c8458	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-4a9b-ddf0da08798f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-5469-596c28270491	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-31d7-32306470f164	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-0003-c0c7921a915d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-1b16-5ce0c35db2fb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-52ff-01de97493d38	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-ca1f-6f12a1fcf45e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-2a9c-6a466d7e8fee	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-3039-a1062ce08b68	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-6193-274fedc370f5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-47eb-638a5d76de66	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-07c0-ccfa64adfe23	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-ab46-e45f01890156	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-643f-108826a1eb18	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-ccf2-92b41c3c0aeb	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-0a7e-5d2522a57aa6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-c0a3-24bab9b9cdf6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-a1d3-1dacd8875d2e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-fdea-29877cc81571	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-96f0-4c6714bf6dab	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-2660-02ffb481ddab	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-7d6e-ceb16d9020c7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-87b9-9a4b5cc74f56	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-610e-e861e5dcb41d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-344a-efeac1e3db97	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-8e5d-c16ce0611137	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-5213-ce039b7e2375	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-46fd-7a4d0ad4419c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-8860-0f50e201f0a5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-0ca6-3f57b076a43c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-37bc-15dc93739840	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-6404-3768b29b413d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-752f-c51744822ec8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-0aeb-b3a0ea17686a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-3257-90c021b06520	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-27f4-f92a4934cf0a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-e553-d1b3268f8988	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-3811-0fd75c7ad433	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-a557-9d2e94ae1401	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-10bc-0d548bb37912	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-82ae-ba66162ebbf7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-cf41-ea1a3ace1195	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-b2aa-8ab9c9a4000a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-e9d8-2d4eccc5ec48	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-79f8-b167d79ad217	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-6df9-6a836e40e0dd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-19a5-4b1849e559ac	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-2986-5a2c837045b2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-abb0-9079b0bb6ff1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-78d8-a4c9e274417d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-3b15-7aa2796213e3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-a896-7110705910a4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-ff23-f51149e71363	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-9cad-f8b723633ab8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-e64f-96620b827a4e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-34fa-815247c369c8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-2fe9-57ddffd722ff	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-0d42-13e6c3fe7655	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-ea1e-407401656327	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-ea6d-05fd36857323	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-f396-9076a169b44d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-6072-746254fbd27a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-fca8-96ad68cbf3a1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-5f49-99fc48a58d2a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-a6d4-7d6e96a56c68	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-0c3a-1b9859e76982	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-0c14-a29c1b14e739	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-4808-d6d7a702ffd6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-c66b-d9ffa14a4efe	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-2189-e0275c714d56	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-dfcb-a7d239fdda38	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-e55c-21d7314937b7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-571f-56ac1281448e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-767b-22dbdeeb0c1e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-efe6-cbece76d196e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-b2a3-19ea0c26043b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-2bf7-548691858129	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-9999-c3fe8839a1a2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-da8d-612ff4044153	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-ba9f-afe86e167d5b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-7c2e-0b137a5eb820	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-39d3-b26278eda8fc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-b220-8455f4f5b7e2	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-9de3-04511255a4ac	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-2e61-8ecbc4e0adfa	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-4b57-1f8f26559d62	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-611a-6fa986839498	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-3bf2-44da41baa3d6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-a21e-1ded917155f2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-587d-31e2066d3899	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-822a-85138e65dd7d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-33ad-f5b340a5c73d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-dc95-96191a1158f8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-9636-1e892ae2ba39	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-db7b-ee9d84a1b3ec	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-29e0-166f7a0634f6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-3a09-ed150c9be1b7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-1de8-9be5ffa02e04	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-b5b9-d53c740abb41	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-44f6-1aa0a823276e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-302a-f5e93f702142	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-0df2-a9f4f0033670	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-8533-71e2950849eb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-007f-bdc51326c870	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-1895-a867c3c2b2e2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-3244-a101d37cfe53	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-e396-84053294e8ff	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-25eb-be91ebaf7e65	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-58e9-bb0224693cd4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-073b-b2ca08405ab3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-0c19-bae0c9be4d09	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-260a-a4111e3a0c56	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-7296-81b7baf708ab	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-2bcb-784c9f4d50dd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-ceba-a4742702e764	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-0e97-4b53339fb596	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-a141-d420320341d8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-be4e-45ea3e9013eb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-932f-683f0abe1344	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-0ef0-de59454ca1cb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-5c44-b96d01874efa	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-b31c-ea95d34825ad	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-9849-3698e8306121	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-7ae0-f6e37651d164	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-6446-a2fc06702d87	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-9f2f-a5afab61011e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-19b6-fe51eb6a9874	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-9441-8b034099c2ed	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-7f60-a394c48ed1ed	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-a5aa-06a4d49998b5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-7ef1-8bc772818c29	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-3304-5839cfc54ba6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-ac55-1939b6e5ad42	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-8d0d-7025a3c936ef	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-41ad-e82adae0dacc	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-58d2-37a1bee5ea2b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-0abd-5a830fafdb21	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-19da-fb6b9f3b9b57	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-669b-40d847c4940d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-84a0-9cba17292871	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-dfb9-0fad597a615c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-f275-51233ff67aaa	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-8964-f24c93ca3c15	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-703e-c206c7034afc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-3c68-aa56b12c74d1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-53d3-dc846d8aa131	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-0666-3a0479d60041	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-e924-41fd34613d49	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-b574-8f739569d051	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-ebe1-14caaceb802d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-ee63-607a7c0f4ac6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-d17b-e9b33c471459	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-388c-1f898e2cd585	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-c92e-7f20853a54d2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-0b2c-909569c850cf	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-49e2-3fe8cedc441a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-3b26-9daa3551ce29	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-54bc-90fd7a863a82	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-fcfd-0f5f5ee83172	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-cc92-4415ec1c9b60	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-f0bc-14e8020b3656	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-60ce-86442dc717a6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-1da9-62966bf18301	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-c230-37efe94576d6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-3280-060b48a5b7c1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-1de0-b76805425d92	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-0574-824dd284219e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-1602-7f782d06cef5	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-1948-c44f15b6cec0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-3f8e-4d5764dce76f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-3c2f-0bf4c5337b82	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-0cbb-d94842b174a4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-d19c-015ec499102c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-b8c4-36dc41b2f681	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-3450-5dd1c2ef432f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-b9e6-fa69b61d9b4c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-d03d-83557f0e5714	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-275d-cc1274eda5b7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-bfc3-9ecebe7447f6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-ba9a-c94af704c719	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-a050-5fd4a408805a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-ccf6-84aef843ea30	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-45aa-4f64049c37f2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-d702-e94ec7a82d16	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-c630-a55953449b93	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-fd80-b413ad564b65	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-7957-5e53bcbf7fa3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-60bb-fa3195038196	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-6b1a-4a12fc25d4f6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-c504-adf0d8887dde	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-7790-23e1b93d7ab8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-1e89-9e85401e9791	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-ea11-bfc34e120a64	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-dcff-f5a3d1f06aa4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-1c0e-90be69b3cee1	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-e0a8-bab25f36d37d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-8dcb-4d59b22ffab8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-a9da-25bc6a23c198	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-f10f-86acfb9c9040	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-d680-69bea1cef45e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-864e-546ac009d8cf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-da22-cea9fb11bfa1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-5ef6-e98fa4b62deb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-c22e-65b9e1b49254	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-2a62-9380f4e67a7c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-ea21-5183737ff5ef	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-f935-6e47739cda6c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-3330-6f69d316bb54	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-4ed7-6e26b3ef337c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-f45f-6c49f96b0804	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-fb88-12b508aabdee	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-1136-ca95d66628bd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-c3e9-6fb69c9b3935	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-1bfb-a6fa03529168	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-8f72-62293bfca0be	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-7bfb-df2c037b4d9e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-d68c-9611dc4a6f2a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-0c3f-c19c579cb03a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-5414-10699c2ffb2a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-cbdb-50303200b912	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-c2dc-6329c8da13f0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-9f9e-0a58346c9cca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-3885-b6095169c2b8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-c803-66132c74f3a0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-5d2f-e9a7d6b472a3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-6871-d0167195999c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-d51d-c7dbb14fd5b7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-441e-df0cfda47909	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-d2b4-915397ed766e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-12d4-07c656eab9bb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-3bec-a8e31cdc68df	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-0d9d-e0289a4adf0e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-9eaa-a1caf5ea89ca	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-d80d-63d262d3fd5b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-7789-5949786a3162	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-02c6-a8878cb3ccc5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-334a-37eb67fbf19a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-0eb7-27e4f9accf2f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-5f14-4907bbc2e0cd	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-cc6c-c25cda08fe1e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-4d1f-2cc44c668404	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-d090-1913c67469d6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-8ecd-dbdc15be3cbe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-7b9d-282e9848c388	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-28a5-860b8e127862	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-e534-fab72051f1e4	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-c443-3da4cb3d91db	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-5295-78b1189dc2be	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-40fc-7749ac382e4a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-5b34-5f8547dacc42	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-8da3-9d03199eed26	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-97ef-da34325593da	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-85ba-fd95fd8e1c6c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-237d-4dd4478a46d8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-c3b2-fde47689ab0a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-c06f-15b0ca68c0df	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-a734-eb31b5b24dd9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-6b9f-8362312b16c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-de91-aec9753b59c6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-ec47-4276088a0745	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-1283-965a1b54491d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-ab08-9d29609c1671	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-c795-71fd027c7dae	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-f6ca-d710d6311063	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-5539-064d98ea8c11	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-3a08-0107fffa767e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-471a-2dcecd001060	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-dfce-33d44eb41d97	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-d9b8-7f351907866a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-1fef-8f0da9c5cef9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-fa8e-81d95c33e689	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-fd1e-6f81cd7e87df	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-718f-7ee7f8937b29	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-1194-d1b0ca28e926	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-72e7-4abea1577f56	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-f364-7059adb0ef96	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-d31d-9e0cc2b6a3dd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-7bcc-1620d848951c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-60fb-5c24731dfd7b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-03ac-cbd84d3a2780	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-970b-31e608c4006e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-123e-8845a4b24283	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-dc52-a2748c146e8c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-c980-c937142ef8f9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-6cbe-98093a5cecd2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-f68d-a044b687c8b5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-dc3e-bec6b96846c5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-25fb-dbda0830fb42	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-75b0-9c25dcca4fbb	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-48ab-93845c10c23a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-af59-5a3c6ae5b00e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-7c86-7e8c1feaa016	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-7e76-7a27177e1a0e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-08b3-cc484264a98e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-3161-76154a80d779	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-ffb6-2acceebdd2a1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-908b-be83c9359314	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-b738-f4aa2228283a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-acae-9194ec598256	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-281f-4fcdbbd5aa64	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-77c1-a247615b1a8b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-aeda-10e9b64d3037	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-cf51-03dec93338a2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-2230-05c835ad1c7d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-1ee8-21fab93dc8e1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-f309-aa3790dd347d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-32f8-780ee55e94ba	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-22e7-b225270cac44	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-693f-940e70aa5bbf	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-8dec-9e5a46c7c4e1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-5fb0-85e8306d9457	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-4add-067acfb5dc50	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-185d-22fec0ef1726	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-9a09-8c4d40b1fc25	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-4290-6487a2738a21	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-2b5b-e33fc1673250	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-d863-722159fd2e88	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-1cce-fbd80dcdc841	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-5534-605b36e166fd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-addb-99131d458643	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-7912-eb88d764352a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-c8bf-62db3870e4ca	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-17cb-51922ec68674	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-5cf6-baf6d8345ed8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-bca5-3da19c121d5c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-63db-eaa203eb73cc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-3e57-3db62a52d2db	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-e97e-3c03f3a9875e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-6ac2-2612184e96f1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-ec8b-21e3e7905c7d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-b020-a353c70840d0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-f6f5-feb5e48fe26b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-e3e4-201343bd6d09	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-8c00-02763acac918	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-9ef5-98c6b3b4025f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-c099-9fb2b6e13212	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-826a-4de3f9049d4b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-1774-3c506652094a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-fa85-44dff76c3366	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-ae21-174b2670e05f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-1f65-2bd4a94f15ee	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-604b-bff2f935b9c5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-2107-80c27d707cac	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-db60-9af3b18ab7de	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-d08f-8e8e5cff4793	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-c102-e688a6e85428	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-b79f-58bb0284d855	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-9965-5120f880d7b5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-c7e6-8e7fd8283659	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-0dba-9116bd0b0ad1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-7095-3f0c1fb0b683	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-525f-f58b13ee5d5d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-1945-c39d4d48a405	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-ea12-f78b135a9ced	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-c21a-1e9feedff67c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-0c6c-8fa4a91b37bc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-b1b9-4bf9ba033f3a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-8e95-6aa1b4d7c3e5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-57a0-ee67a2a25bb1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-c7d9-f342d6137961	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-8e49-23621581c886	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-54b6-b4dc85027439	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-9b43-507ae2f981eb	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-7f56-f4fa5d95f974	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-07a8-86fa1bf8f1b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-21cd-87428f321482	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-e03e-f344e9fd33c0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-6302-15ca248d4bee	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-d550-4c539bfbfd8b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-9d67-e781d503c6c8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-e291-1216fec12c1c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-ff2f-c8601fc2cc83	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-7bb3-5b78c368d00b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-dfe7-344dcb0fc25f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-dbc6-4b20e1bdf5b1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-08c9-04d26085d971	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-f8e2-deb600e3213f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-fb89-afe942b1823d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-c652-d011f639dbbf	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-adc7-cdb6c1bf17d3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-fe92-8c3600666cfa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-49b1-291ac36d5cc2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-4529-8dde9d384fd8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-a16a-182c967a32df	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-d6af-f265f5bd3200	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-6894-bcc4a3916d2a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-0aa3-490fec59015b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-9cc0-f05f580295c7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-5054-810f71e2e793	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-5f1a-6e825f2589b5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-c4ab-b4519000dac9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-0726-c4896db5307f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-97ec-a5556fe4a51a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-6d0b-f394cd4f56ce	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-c243-7f82b80d8be0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-1294-0e81c4533291	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-8226-764706545917	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-6050-06e77cc1f543	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-a7ed-ecb010bb05ec	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-b30d-bc2905d2cd82	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-6d01-6682486c2012	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-5a1b-53ab0c81d737	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-8258-f18473862fc4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-272f-6d0af52476ce	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-4530-49f435d34176	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-1c9a-d6ac38f5b62c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-2436-4f5de2779a2e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-a3b9-b78458e02566	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-de68-c765e0852da2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-331a-0310b6f783d1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-9ecf-a304157d5248	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-613b-8ee8f06597e7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-4a43-8f96302f94cd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-5793-b64029362c80	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-871f-b960f16c95b5	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-2a37-6e61c997df57	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-1448-8e90374e198c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-9d36-1d68308de7d9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-6908-bf3559017cee	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-ce99-5cbd51b35e79	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-ebb6-00aed507ca8d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-37a0-8376195ffa40	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-4624-b46127c3c13d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-57ee-5f5a55f93cf4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-5410-7f66ff4f0122	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-9242-31e27c5e40e8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-c7fc-16116de083dc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-e837-e3e3795e6952	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-7bff-44917a225c20	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-184c-4f20577c51dc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-a8d8-2f0545da0e38	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-e69d-fb1da5fd6876	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-6f99-f75518e9fae8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-923d-4c09ceb127c7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-71f7-aa820925389e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-6b24-7e3e6e8e620e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-635e-3e1ee0cfe25a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-0494-99dedae99329	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-d3bd-b74f6613929e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-acfb-d4a672536177	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-7fb1-2a618caad699	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-93e6-0b0fa5242cc1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-4543-029d742286e1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-2776-63cd84f92431	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-2fc1-fa10445b2cc7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-b2fa-1e69374fd560	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-5ec6-9b0247dcb0cf	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-a042-2e2b7548782e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-e25b-145d7c487ecf	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-5ef8-a5da88a3f3bc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-261b-9aaaaf02928f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-0daa-d1688bacc9c5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-8ef1-a86c6265aa95	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-e626-966d5d851192	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-2633-0d84f7bfad33	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-10a4-e09bb15a9d8c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-7758-a1e276386d90	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-2b03-046dd9d8ab34	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-1f42-7e4ab195aef0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-3012-93f3c8dbd721	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-738e-422f48d28d1f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-f341-b1f58e84f238	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-3b91-01fcecbce64b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-50c1-5ef69fd79131	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-6fd6-2b57aeeef012	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-4c1e-9816c92ca21c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-081c-72cc0588e51e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-e923-1f23a58337a6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-4a86-1ee096d6de8e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-88e8-31098b1a5101	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-d194-c61cf38bfda3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-c5ef-29fc896ac598	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-1df6-e4b0222c9f5e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-4eff-fa8004f9a82e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-ac24-9a4490bddf94	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-6e00-f3c24303d275	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-3aaa-35f60e56b42f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-5e36-6ad58460cc4b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-1144-ead55dd69902	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-afc9-2626ea6a2d1f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-f76c-ed17c6fb2f96	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-af61-adfe6f972006	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-1469-49bc90104109	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-bd9d-d35769e6090b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-0fc7-61c6c2a36341	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-bd0f-2df5e86d82a3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-f8b6-526b9c7d3137	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-23ad-9f463d8b8096	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-378a-623b210248ef	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-30b2-21f15e92334e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-feee-e65ba786375f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-722e-3c6d83e5ad4f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-126a-01a18ccaad36	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-a008-7c5fc34fc1ec	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-2db7-22f5156901b9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-5cf7-d20e85ed8da4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-a3e1-428db803cfb3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-1cb7-b9cba4fffdb1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-164f-7214e593b9fd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-c41a-08a26a90fe6f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-82d8-2fae8fc66879	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-9fa8-e1f42bd3d9a7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-2ac5-e30f80a61d42	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-5771-ddf1b0ddd5a0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-ae75-3be752c9869a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-7d71-650e8d79d982	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-35aa-6d00b2867187	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-5c4b-944318f2f73f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-9990-54a408da2cb7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-156b-8c44e80bd0c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-646a-dad3435fe733	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-f04f-5a8fabb141a9	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-7097-918e7f7f2aa3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-799c-b16d33f5453d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-b540-518455ada410	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-c425-794d3c9b612e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-e9cd-79faa23f6ccb	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-9aa9-72f87761135b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-41c9-d35cf03e8869	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-7b1c-273173ddd714	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-d60a-2a5fb7ec59e6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-8306-122bdab676c5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-1bdc-c4ee4fe11f86	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-2ea1-1a7cb7fe88c3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-56fb-127333d566af	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-9580-53e8c751c7b0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-c61b-bee3914a78b0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-bc3e-44928d2509c9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-fe91-6363ec9f8808	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-fb71-5fa9632d8087	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-5836-1f55352e257a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-b866-438f52bc2e81	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-dec5-8412712901e8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-bcdc-beb3a7b6ee63	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-6422-07dc162a578b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-367d-9e5e6f3ea31d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-4edf-f086f8a13bdc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-3725-b1cbb03bf57f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-df71-a36b19191681	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-4aa7-fbe077b0655a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-5ea1-ad969404d99c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-5f7e-92380c43622f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-3178-b429e6f184e5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-ab84-0732a85ad89d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-ffbb-4b1132d2eb2c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-0c3b-6799d8acebc4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-cf13-5621031d7c15	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-1649-78dbeb982dd6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-704f-46d6f4160779	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-0f57-7d5594bfd0a8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-28a9-a894675bb8be	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-4eab-8ee46d6525b0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-467b-dde168fabbd3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-05d6-7c5eb7a00862	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-9318-3f9f967fb7e7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-faf1-4e279bc4c691	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-c1a7-6ce2bffb86b0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-2f5a-d6e80f8c0942	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-8613-f2bdc69087e7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-6765-1402273705cf	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-b66b-0b6f86a2501e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-a89b-2a02ec27ef86	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-c09a-e000e248e639	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-47aa-803b3215193c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-9f12-542d59b8cb59	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-1fed-fb453cd4b00d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-c96d-cbc70fb760a8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-035c-2c62b1277488	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-6f35-850a4ee7f056	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-3e75-4f2e698ad452	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-a3a9-9d386fd94a59	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-ca34-c953284c3aec	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-f39f-7267581fd63d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-1511-dcf6318f3cca	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-f0ae-cd63f032b8c3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-24b9-e615ca306450	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-1bd0-4781e8862c34	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-b219-61659873fc28	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-b77d-06764cbfe454	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-cf43-69a352c47b82	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-9d3d-f969d3fc7113	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-bfac-324168de78c5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-9d41-4085ed7b988a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-e369-c34399b6ac54	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-dd6e-9403597fa222	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-0cc8-3eb37d08d4f1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-24f8-b96cb79bdaf3	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-0f1e-2c79569532b7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-8633-06d3e1c2e604	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-e629-990c90078dc5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-6de2-5cee04ea8a72	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-39d2-434f25e97c01	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-3d9f-79a4b25ffa10	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-3ddd-074eecd7d07a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-59c6-6de64eedb6c4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-0c1b-c55e9d2ab5e5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-4b7e-ebeb6822ddb4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-f2c8-f633043beb88	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-b6d8-aaffa3c1c0c2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-7de3-4cca0517f853	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-a853-50d4fafa4ac4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-dccf-62b7d9e9d0b9	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-6aeb-81a85a9dddbd	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-0c1f-0b2ef763b8fc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-b16d-571088ddcd22	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-acd5-bc584d4bfbe2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-6592-fed0cec50350	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-0295-0e5632e2ddfb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-98d8-1473aa482a45	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-623f-842895fabf5a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-a363-1e375292741a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-e897-7c82275222e3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-36ef-36cbbc798fe9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-daef-9af1eeeb9c86	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-55f6-12fb1d946a08	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-fae8-f4f6315eb7f7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-2da0-665407e1cca6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-6cce-851b1f60052f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-36d5-6a253c2f663e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-1552-9244f8cd7f0c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-2ee1-d06c069a300a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-67aa-2537e5c3d7c7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-73bd-47c65e333790	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-d278-b30fae922477	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-5f09-32b9d8bc29a2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-108c-9be1709ed907	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-5964-2cc19f4df94e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-2137-04629623a0ff	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-cdbd-58d939969f56	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-0d57-ec78149071d5	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-bf5f-374f3bd86351	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-6662-4f8b163bab75	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-5438-cf7c2af3a006	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-e3e3-b8dbccb85081	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-18ec-bd4c77027e8d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-f9dd-a93a48a1b61d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-e9cc-de2750eab1b8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-3ae8-f26f5aff49f2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-3a72-dbfd-458ef9afb571	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-3a72-03ce-59418f393a5e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-3a72-10c5-bf596f843f7d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-3a72-1729-3a20cdc94aab	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-3a72-a327-fc47bf85268b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-3a72-1e05-75f9fa0fd23e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-3a72-59d3-b2acfa4bd246	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-3a72-17ae-9dcf29202d43	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-3a72-f7f4-d2881160f2c1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-3a72-d204-4a939b73c19e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-3a72-0fab-88d22baeb451	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-3a72-3e8e-71b8e47b8ad1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-3a72-adf3-f39bb90c6389	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-3a72-50cf-c4aa9ff18274	Drzava-read	Seznam držav	f
00020000-553a-3a72-4fc0-8df1b991a320	Drzava-write	Urejanje držav	f
00020000-553a-3a72-b187-f4227f3b0932	Popa-delete	Poslovni partner - Briši	f
00020000-553a-3a72-2373-651c1e303d64	Popa-list	Poslovni partner - Beri	f
00020000-553a-3a72-8d16-3aa7321bdd75	Popa-update	Poslovni partner - Posodobi	f
00020000-553a-3a72-3536-06e8d37acb99	Popa-create	Poslovni partner - Ustvari	f
00020000-553a-3a72-c39e-67afac0b818a	Posta-delete	Pošta - Briši	f
00020000-553a-3a72-c470-18abb14b8330	Posta-list	Pošta - Beri	f
00020000-553a-3a72-eff6-96bdb2609b97	Posta-update	Pošta - Posodobi	f
00020000-553a-3a72-db69-055e5cdd7db1	Posta-create	Pošta - Ustvari	f
00020000-553a-3a72-c4ff-4e72dce30e13	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-553a-3a72-5904-ba7eaf5edbe7	PostniNaslov-list	Poštni naslov - Beri	f
00020000-553a-3a72-0d2d-4b3a6530cd76	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-553a-3a72-c9ab-52525b39c16d	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2635 (class 0 OID 1303285)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-553a-3a73-40f2-700c61840168	00020000-553a-3a72-50cf-c4aa9ff18274
00000000-553a-3a73-40f2-700c61840168	00020000-553a-3a71-3235-eb9fcfa91eca
00000000-553a-3a73-d2df-a6b75f9805f0	00020000-553a-3a72-4fc0-8df1b991a320
00000000-553a-3a73-d2df-a6b75f9805f0	00020000-553a-3a72-50cf-c4aa9ff18274
\.


--
-- TOC entry 2663 (class 0 OID 1303574)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 1303604)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1303716)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1303344)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1303386)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-553a-3a71-d244-dd2df2592e89	8341	Adlešiči
00050000-553a-3a71-3d09-834c9ec0d492	5270	Ajdovščina
00050000-553a-3a71-a2aa-1bb59dbba47c	6280	Ankaran/Ancarano
00050000-553a-3a71-7452-0a3a38333cd7	9253	Apače
00050000-553a-3a71-97c8-0f4de5c69762	8253	Artiče
00050000-553a-3a71-c4ef-875599a866da	4275	Begunje na Gorenjskem
00050000-553a-3a71-9558-77d63e8f2700	1382	Begunje pri Cerknici
00050000-553a-3a71-0f44-b7369d5de114	9231	Beltinci
00050000-553a-3a71-32dd-53e017e92c70	2234	Benedikt
00050000-553a-3a71-91fa-aee0468e7635	2345	Bistrica ob Dravi
00050000-553a-3a71-c87f-f8c1f59ee74c	3256	Bistrica ob Sotli
00050000-553a-3a71-b748-43bf71b1fc1c	8259	Bizeljsko
00050000-553a-3a71-f8e4-a72d244a576a	1223	Blagovica
00050000-553a-3a71-311d-7a51e921ca55	8283	Blanca
00050000-553a-3a71-6434-ad275ccdbf7d	4260	Bled
00050000-553a-3a71-be81-ceb0ec2b37d9	4273	Blejska Dobrava
00050000-553a-3a71-b914-3474be0a2cda	9265	Bodonci
00050000-553a-3a71-17d2-35fa1e7e472d	9222	Bogojina
00050000-553a-3a71-d239-4b933ce371ca	4263	Bohinjska Bela
00050000-553a-3a71-9aa6-c7a706f52ff2	4264	Bohinjska Bistrica
00050000-553a-3a71-8df3-a5615fe11559	4265	Bohinjsko jezero
00050000-553a-3a71-dfbc-5a3518eacec8	1353	Borovnica
00050000-553a-3a71-b305-f2a64f0b26ff	8294	Boštanj
00050000-553a-3a71-c842-fc678443de39	5230	Bovec
00050000-553a-3a71-2b8e-cb4af4cbe5ce	5295	Branik
00050000-553a-3a71-229b-db842c6c7d8c	3314	Braslovče
00050000-553a-3a71-d2af-e63427c442c7	5223	Breginj
00050000-553a-3a71-840a-eca5995ac231	8280	Brestanica
00050000-553a-3a71-8534-557781383db1	2354	Bresternica
00050000-553a-3a71-9155-5c9cd640a14b	4243	Brezje
00050000-553a-3a71-7fc4-d1db0553e543	1351	Brezovica pri Ljubljani
00050000-553a-3a71-d060-46845bf4ed94	8250	Brežice
00050000-553a-3a71-e887-73c1fa5f2a7c	4210	Brnik - Aerodrom
00050000-553a-3a71-6d5d-998ac513f9d7	8321	Brusnice
00050000-553a-3a71-5212-ac0d6efcda60	3255	Buče
00050000-553a-3a71-a1ee-88fc4533cf04	8276	Bučka 
00050000-553a-3a71-f75e-ad98877ebc26	9261	Cankova
00050000-553a-3a71-0756-cfa62383f0e9	3000	Celje 
00050000-553a-3a71-f3d1-c26333abad6b	3001	Celje - poštni predali
00050000-553a-3a71-aa2a-47aae8cad7fc	4207	Cerklje na Gorenjskem
00050000-553a-3a71-35a5-26243c3a4906	8263	Cerklje ob Krki
00050000-553a-3a71-6b96-a59abccb9513	1380	Cerknica
00050000-553a-3a71-0b08-d7a9212a1b7d	5282	Cerkno
00050000-553a-3a71-1d26-a379bb897a61	2236	Cerkvenjak
00050000-553a-3a71-04fc-f0fde115acb6	2215	Ceršak
00050000-553a-3a71-e578-35550c7c506a	2326	Cirkovce
00050000-553a-3a71-f9af-81b663894e4e	2282	Cirkulane
00050000-553a-3a71-9ccf-bad93d275fc5	5273	Col
00050000-553a-3a71-e227-ff789e5f26f2	8251	Čatež ob Savi
00050000-553a-3a71-0e6b-40d7d5a16758	1413	Čemšenik
00050000-553a-3a71-8c8d-20ef15a38f0f	5253	Čepovan
00050000-553a-3a71-e9fe-f4fcc8604f48	9232	Črenšovci
00050000-553a-3a71-5dbf-0970c2fb42b3	2393	Črna na Koroškem
00050000-553a-3a71-eebd-dd655ed47c32	6275	Črni Kal
00050000-553a-3a71-eca9-aca3ca60e4ca	5274	Črni Vrh nad Idrijo
00050000-553a-3a71-e679-4be2ea4e802e	5262	Črniče
00050000-553a-3a71-3b88-1c9712d6a21f	8340	Črnomelj
00050000-553a-3a71-b237-a11c01174c31	6271	Dekani
00050000-553a-3a71-4813-c5e8f4663294	5210	Deskle
00050000-553a-3a71-c69f-3cbc6064f31d	2253	Destrnik
00050000-553a-3a71-e2c2-876069b0498f	6215	Divača
00050000-553a-3a71-ecf3-055b8c4a94b7	1233	Dob
00050000-553a-3a71-ee2c-b495b4ad0650	3224	Dobje pri Planini
00050000-553a-3a71-8349-b2c92e51cf7f	8257	Dobova
00050000-553a-3a71-12dd-8f96e142f7b4	1423	Dobovec
00050000-553a-3a71-4091-2474bd5eaedd	5263	Dobravlje
00050000-553a-3a71-bd2f-0dc91f6ac8f1	3204	Dobrna
00050000-553a-3a71-5029-358aec4dac68	8211	Dobrnič
00050000-553a-3a71-941b-3485a53c2f3d	1356	Dobrova
00050000-553a-3a71-fb87-1f2265ed8015	9223	Dobrovnik/Dobronak 
00050000-553a-3a71-0d4c-e7e23e1161dc	5212	Dobrovo v Brdih
00050000-553a-3a71-c513-a30268caa6a8	1431	Dol pri Hrastniku
00050000-553a-3a71-0953-405414415741	1262	Dol pri Ljubljani
00050000-553a-3a71-8bc4-a70d3fdb4ed9	1273	Dole pri Litiji
00050000-553a-3a71-4f89-6728f8312fc6	1331	Dolenja vas
00050000-553a-3a71-427c-78bd3dbef8e1	8350	Dolenjske Toplice
00050000-553a-3a71-6b1f-30bffeae4496	1230	Domžale
00050000-553a-3a71-b66c-585658f9a4ec	2252	Dornava
00050000-553a-3a71-b5b1-17784243300d	5294	Dornberk
00050000-553a-3a71-a413-ed7087ad82dc	1319	Draga
00050000-553a-3a71-f5e0-8679f7f0a498	8343	Dragatuš
00050000-553a-3a71-a557-f42d655f4e14	3222	Dramlje
00050000-553a-3a71-082f-5b63402a88f2	2370	Dravograd
00050000-553a-3a71-87e3-c3efad6b10b6	4203	Duplje
00050000-553a-3a71-a3ef-e76dadd91f86	6221	Dutovlje
00050000-553a-3a71-0221-504080a4f06e	8361	Dvor
00050000-553a-3a71-5a8e-30be2d608c0e	2343	Fala
00050000-553a-3a71-8327-c9f1e8de7777	9208	Fokovci
00050000-553a-3a71-09f2-39d005c3a36e	2313	Fram
00050000-553a-3a71-59e1-44059d216a20	3213	Frankolovo
00050000-553a-3a71-39cd-f28cf034d207	1274	Gabrovka
00050000-553a-3a71-8b95-7a6db4a542a4	8254	Globoko
00050000-553a-3a71-a726-242d46bbd3ea	5275	Godovič
00050000-553a-3a71-7a3c-5be597fa2ee1	4204	Golnik
00050000-553a-3a71-b386-a79034fc8b1a	3303	Gomilsko
00050000-553a-3a71-9e54-4da04fe80902	4224	Gorenja vas
00050000-553a-3a71-d662-0723de24d55d	3263	Gorica pri Slivnici
00050000-553a-3a71-8f26-0e784f6ca8af	2272	Gorišnica
00050000-553a-3a71-eb19-9aece0d00aed	9250	Gornja Radgona
00050000-553a-3a71-871f-460514ef6997	3342	Gornji Grad
00050000-553a-3a71-0f5f-fc40dc2de632	4282	Gozd Martuljek
00050000-553a-3a71-5151-c63ee63aa3bc	6272	Gračišče
00050000-553a-3a71-5247-5e625e3b4825	9264	Grad
00050000-553a-3a71-67f5-66391d434af6	8332	Gradac
00050000-553a-3a71-32b8-91ebad58e63f	1384	Grahovo
00050000-553a-3a71-76c3-d01bceb7a709	5242	Grahovo ob Bači
00050000-553a-3a71-ed95-fec59672216e	5251	Grgar
00050000-553a-3a71-728a-b242c29d1d0c	3302	Griže
00050000-553a-3a71-0254-6a0b8141f4b1	3231	Grobelno
00050000-553a-3a71-c698-5cc5437404ac	1290	Grosuplje
00050000-553a-3a71-1f71-9c2ea32e210d	2288	Hajdina
00050000-553a-3a71-6509-15bfde70c121	8362	Hinje
00050000-553a-3a71-b319-819b661330e8	2311	Hoče
00050000-553a-3a71-befe-2aeaa70b625a	9205	Hodoš/Hodos
00050000-553a-3a71-07cf-485729478c4a	1354	Horjul
00050000-553a-3a71-468f-cd002e0b0866	1372	Hotedršica
00050000-553a-3a71-c86d-952e6e0535e1	1430	Hrastnik
00050000-553a-3a71-e491-3668e4ab84b0	6225	Hruševje
00050000-553a-3a71-06df-bf9c121893f3	4276	Hrušica
00050000-553a-3a71-481c-7703c5af3168	5280	Idrija
00050000-553a-3a71-83cd-f980252d4cdd	1292	Ig
00050000-553a-3a71-7607-0a9ba9353a55	6250	Ilirska Bistrica
00050000-553a-3a71-256e-191aad365b6e	6251	Ilirska Bistrica-Trnovo
00050000-553a-3a71-e765-8a5b07dec870	1295	Ivančna Gorica
00050000-553a-3a71-6349-024bb4579b3c	2259	Ivanjkovci
00050000-553a-3a71-adbb-1b51eccd6a0b	1411	Izlake
00050000-553a-3a71-d48d-711702419e32	6310	Izola/Isola
00050000-553a-3a71-d9c1-6174d6963a3a	2222	Jakobski Dol
00050000-553a-3a71-87da-db6406958ec5	2221	Jarenina
00050000-553a-3a71-ba1c-5a1c8effda06	6254	Jelšane
00050000-553a-3a71-330f-f25acaf8d0a7	4270	Jesenice
00050000-553a-3a71-f4f3-792f2fd4de41	8261	Jesenice na Dolenjskem
00050000-553a-3a71-15ae-94c27405c68f	3273	Jurklošter
00050000-553a-3a71-d078-c20b526211d4	2223	Jurovski Dol
00050000-553a-3a71-89d3-1ddf4afc5fdd	2256	Juršinci
00050000-553a-3a71-2625-958159403c05	5214	Kal nad Kanalom
00050000-553a-3a71-e8ae-7d8dc744edfe	3233	Kalobje
00050000-553a-3a71-6073-c0f8d68b120a	4246	Kamna Gorica
00050000-553a-3a71-c4ca-33ed17d05695	2351	Kamnica
00050000-553a-3a71-e7de-5e7e9b61f67b	1241	Kamnik
00050000-553a-3a71-49f6-0bd1c2eb5401	5213	Kanal
00050000-553a-3a71-3a36-268baf7db16e	8258	Kapele
00050000-553a-3a71-f809-3094c4c611b3	2362	Kapla
00050000-553a-3a71-fd2a-c9d3f53d1db8	2325	Kidričevo
00050000-553a-3a71-f503-b600e16eb130	1412	Kisovec
00050000-553a-3a71-2a15-b9df8b9e423a	6253	Knežak
00050000-553a-3a71-f0a8-8c0e7a69b379	5222	Kobarid
00050000-553a-3a71-6639-0c879f3816a4	9227	Kobilje
00050000-553a-3a71-fd9f-e6a41c5c8e87	1330	Kočevje
00050000-553a-3a71-9bdb-0c24a0b37972	1338	Kočevska Reka
00050000-553a-3a71-46a8-89887f2ffc1a	2276	Kog
00050000-553a-3a71-0d4a-e3b265a41e32	5211	Kojsko
00050000-553a-3a71-6b54-82d508ebe10a	6223	Komen
00050000-553a-3a71-c5f2-475dc582ae47	1218	Komenda
00050000-553a-3a71-ae00-4c38a1471c96	6000	Koper/Capodistria 
00050000-553a-3a71-428c-61b5606557f3	6001	Koper/Capodistria - poštni predali
00050000-553a-3a71-87a3-77db248c39de	8282	Koprivnica
00050000-553a-3a71-f66a-a732dfd0de36	5296	Kostanjevica na Krasu
00050000-553a-3a71-20be-ce36bab782d5	8311	Kostanjevica na Krki
00050000-553a-3a71-d492-631c438b7fec	1336	Kostel
00050000-553a-3a71-fd10-e647e16abd28	6256	Košana
00050000-553a-3a71-769f-b006a66e69cb	2394	Kotlje
00050000-553a-3a71-db7e-fb748117f946	6240	Kozina
00050000-553a-3a71-0654-fd3212ee0ef8	3260	Kozje
00050000-553a-3a71-6bb7-929fc96ea387	4000	Kranj 
00050000-553a-3a71-c6ef-608327b488f7	4001	Kranj - poštni predali
00050000-553a-3a71-577c-b5d238b8d31d	4280	Kranjska Gora
00050000-553a-3a71-53d5-d1efdc9733ea	1281	Kresnice
00050000-553a-3a71-6e43-b744aaa8ddc5	4294	Križe
00050000-553a-3a71-b7a1-714178bb1207	9206	Križevci
00050000-553a-3a71-a847-4e8e89ad6a99	9242	Križevci pri Ljutomeru
00050000-553a-3a71-cbde-4a906a2441d0	1301	Krka
00050000-553a-3a71-3306-4012e3e05af3	8296	Krmelj
00050000-553a-3a71-15db-93ee23cb2f43	4245	Kropa
00050000-553a-3a71-a274-a81b3ad65e9d	8262	Krška vas
00050000-553a-3a71-9952-95dcec79c871	8270	Krško
00050000-553a-3a71-447f-0d0701539b48	9263	Kuzma
00050000-553a-3a71-394f-4ddf99bb83d8	2318	Laporje
00050000-553a-3a71-d429-4ea00a662c51	3270	Laško
00050000-553a-3a71-95ae-c6c0e9400d8d	1219	Laze v Tuhinju
00050000-553a-3a71-4a6c-3c3db738ca2f	2230	Lenart v Slovenskih goricah
00050000-553a-3a71-c04f-9348ba119019	9220	Lendava/Lendva
00050000-553a-3a71-996f-b2077fcbe4fd	4248	Lesce
00050000-553a-3a71-33a1-7d28e372dd0f	3261	Lesično
00050000-553a-3a71-49c0-508484e48cb0	8273	Leskovec pri Krškem
00050000-553a-3a71-95c8-853006fbf1b3	2372	Libeliče
00050000-553a-3a71-aceb-a2d6229a0142	2341	Limbuš
00050000-553a-3a71-a227-61fb943d26d5	1270	Litija
00050000-553a-3a71-e391-77e683c06829	3202	Ljubečna
00050000-553a-3a71-40f6-1d7beb581951	1000	Ljubljana 
00050000-553a-3a71-6730-cbbb448429bc	1001	Ljubljana - poštni predali
00050000-553a-3a71-ed49-a1820d292d31	1231	Ljubljana - Črnuče
00050000-553a-3a71-a3dc-74f5d6aebb89	1261	Ljubljana - Dobrunje
00050000-553a-3a71-949b-3246780c4a92	1260	Ljubljana - Polje
00050000-553a-3a71-72e9-e165fd90e5ad	1210	Ljubljana - Šentvid
00050000-553a-3a71-f508-abe78f896afa	1211	Ljubljana - Šmartno
00050000-553a-3a71-2349-54c21ff14b5e	3333	Ljubno ob Savinji
00050000-553a-3a71-f978-a58a9988b8f7	9240	Ljutomer
00050000-553a-3a71-da99-a2a2d2892c2e	3215	Loče
00050000-553a-3a71-b873-7ca83022b942	5231	Log pod Mangartom
00050000-553a-3a71-d23f-d1959de1d1f6	1358	Log pri Brezovici
00050000-553a-3a71-5993-5d33a1e6f9e9	1370	Logatec
00050000-553a-3a71-d8bf-0afa39b1523a	1371	Logatec
00050000-553a-3a71-1302-c21a8b297254	1434	Loka pri Zidanem Mostu
00050000-553a-3a71-7e85-c0042fbd0e4e	3223	Loka pri Žusmu
00050000-553a-3a71-87a2-d7f5e416e9b9	6219	Lokev
00050000-553a-3a71-fb6b-296eaad2d812	1318	Loški Potok
00050000-553a-3a71-c686-1142dae21c11	2324	Lovrenc na Dravskem polju
00050000-553a-3a71-5443-32602250e693	2344	Lovrenc na Pohorju
00050000-553a-3a71-3781-27c1877d5af8	3334	Luče
00050000-553a-3a71-0a55-3f3df7d5b8da	1225	Lukovica
00050000-553a-3a71-dcd8-5426ac64ac2f	9202	Mačkovci
00050000-553a-3a71-d32d-7c30f23f2616	2322	Majšperk
00050000-553a-3a71-2dce-c1264c9fc779	2321	Makole
00050000-553a-3a71-61dd-d9b1c4908bed	9243	Mala Nedelja
00050000-553a-3a71-22e5-014afc576dba	2229	Malečnik
00050000-553a-3a71-1896-cc93bfc6d09e	6273	Marezige
00050000-553a-3a71-f2df-877c11d4e57f	2000	Maribor 
00050000-553a-3a71-e397-16df1abbb976	2001	Maribor - poštni predali
00050000-553a-3a71-b058-71fe2b568aa1	2206	Marjeta na Dravskem polju
00050000-553a-3a71-500e-29c1d09f3ba2	2281	Markovci
00050000-553a-3a71-6842-58772e30e093	9221	Martjanci
00050000-553a-3a71-23b1-901d5bc3bc75	6242	Materija
00050000-553a-3a71-594c-65fb6face4c9	4211	Mavčiče
00050000-553a-3a71-f1f6-8dbf841d0bf6	1215	Medvode
00050000-553a-3a71-621f-b167c2c5ff9c	1234	Mengeš
00050000-553a-3a71-7d7d-bdcb327f78a5	8330	Metlika
00050000-553a-3a71-a975-831f69ad6ea1	2392	Mežica
00050000-553a-3a71-e8b6-abc25860f1db	2204	Miklavž na Dravskem polju
00050000-553a-3a71-1280-13ab7cfefb25	2275	Miklavž pri Ormožu
00050000-553a-3a71-6075-a56ffa0a4df9	5291	Miren
00050000-553a-3a71-2e59-9b7e150d63f6	8233	Mirna
00050000-553a-3a71-983f-56273407e5de	8216	Mirna Peč
00050000-553a-3a71-0875-698f293e123a	2382	Mislinja
00050000-553a-3a71-540f-41aca5016e46	4281	Mojstrana
00050000-553a-3a71-e674-0e247c6a6262	8230	Mokronog
00050000-553a-3a71-df7a-99cead259c15	1251	Moravče
00050000-553a-3a71-8b94-703117085d61	9226	Moravske Toplice
00050000-553a-3a71-69d5-7fadd006acc3	5216	Most na Soči
00050000-553a-3a71-c709-559b86dca5a7	1221	Motnik
00050000-553a-3a71-1a6b-e6cec02241e2	3330	Mozirje
00050000-553a-3a71-cecc-f57a5dfe739f	9000	Murska Sobota 
00050000-553a-3a71-c2cb-7fcca570707d	9001	Murska Sobota - poštni predali
00050000-553a-3a71-b1c6-667408fb21b9	2366	Muta
00050000-553a-3a71-4282-4f643ea09034	4202	Naklo
00050000-553a-3a71-a01f-75e00c1875fd	3331	Nazarje
00050000-553a-3a71-d6e1-ba5e520cf105	1357	Notranje Gorice
00050000-553a-3a71-72fc-01118479e0b0	3203	Nova Cerkev
00050000-553a-3a71-a98a-d9cc005e07f9	5000	Nova Gorica 
00050000-553a-3a71-87a1-cbfe4e421db9	5001	Nova Gorica - poštni predali
00050000-553a-3a71-8c52-4893b073825a	1385	Nova vas
00050000-553a-3a71-d79b-4539391011a8	8000	Novo mesto
00050000-553a-3a71-87c5-bcdd337826a1	8001	Novo mesto - poštni predali
00050000-553a-3a71-9ec6-46fbf3472c7d	6243	Obrov
00050000-553a-3a71-c762-cfd60119ee5b	9233	Odranci
00050000-553a-3a71-b796-cf39d34648e3	2317	Oplotnica
00050000-553a-3a71-a349-6cc93945b404	2312	Orehova vas
00050000-553a-3a71-8981-90cebdd8aa09	2270	Ormož
00050000-553a-3a71-2277-6cb84729fffc	1316	Ortnek
00050000-553a-3a71-1922-31a259ce611e	1337	Osilnica
00050000-553a-3a71-8eab-708646c6577c	8222	Otočec
00050000-553a-3a71-fc99-2233b15ad1c9	2361	Ožbalt
00050000-553a-3a71-349c-1cb2d1dc9139	2231	Pernica
00050000-553a-3a71-4d4e-af3d135e87cb	2211	Pesnica pri Mariboru
00050000-553a-3a71-9d6c-f131e70abad9	9203	Petrovci
00050000-553a-3a71-d4a7-ebe1bc8418ca	3301	Petrovče
00050000-553a-3a71-afe7-4affabe3f3fc	6330	Piran/Pirano
00050000-553a-3a71-5334-3e742554ccfb	8255	Pišece
00050000-553a-3a71-3a41-5892a1003499	6257	Pivka
00050000-553a-3a71-c991-d72a332d9ad1	6232	Planina
00050000-553a-3a71-3e20-12f9601a927a	3225	Planina pri Sevnici
00050000-553a-3a71-af50-ad501bf9b191	6276	Pobegi
00050000-553a-3a71-b824-69e65a77c02f	8312	Podbočje
00050000-553a-3a71-8344-2b9662abff22	5243	Podbrdo
00050000-553a-3a71-bc92-8137743a497c	3254	Podčetrtek
00050000-553a-3a71-21d5-b61e6e683baa	2273	Podgorci
00050000-553a-3a71-6d54-f6b5278c34a0	6216	Podgorje
00050000-553a-3a71-b947-eb2d6ee62684	2381	Podgorje pri Slovenj Gradcu
00050000-553a-3a71-f690-1544b51ea25e	6244	Podgrad
00050000-553a-3a71-a5ee-c51867968c42	1414	Podkum
00050000-553a-3a71-f153-58737c7a35e8	2286	Podlehnik
00050000-553a-3a71-c8a9-22c5c4e90680	5272	Podnanos
00050000-553a-3a71-c533-b1f7c8a0a6ec	4244	Podnart
00050000-553a-3a71-6fcd-7083dc5c54fe	3241	Podplat
00050000-553a-3a71-e8a0-9cd6378aa989	3257	Podsreda
00050000-553a-3a71-06e8-97563a26226d	2363	Podvelka
00050000-553a-3a71-643a-bf922ae990dd	2208	Pohorje
00050000-553a-3a71-e819-a7752e1e4d79	2257	Polenšak
00050000-553a-3a71-c8e1-46e860d24e70	1355	Polhov Gradec
00050000-553a-3a71-8c51-fe1513b7189b	4223	Poljane nad Škofjo Loko
00050000-553a-3a71-ed84-c7168f077671	2319	Poljčane
00050000-553a-3a71-04a5-b00dd973e74e	1272	Polšnik
00050000-553a-3a71-cdb4-7ec9959c9697	3313	Polzela
00050000-553a-3a71-c5b4-d3f3b981c4fa	3232	Ponikva
00050000-553a-3a71-9678-a2fa24c52148	6320	Portorož/Portorose
00050000-553a-3a71-5389-a922c3c4a378	6230	Postojna
00050000-553a-3a71-a00e-fd54f906a61a	2331	Pragersko
00050000-553a-3a71-127b-cbe84d418bd8	3312	Prebold
00050000-553a-3a71-0751-2118140ec64a	4205	Preddvor
00050000-553a-3a71-7f2b-fefc0ab5dcb3	6255	Prem
00050000-553a-3a71-c0df-f1e6dcb4e324	1352	Preserje
00050000-553a-3a71-acc9-83f2a56cd3b6	6258	Prestranek
00050000-553a-3a71-9d7c-89fbb841f6c4	2391	Prevalje
00050000-553a-3a71-3b59-e5f2bcec79d4	3262	Prevorje
00050000-553a-3a71-66cc-088b3503abad	1276	Primskovo 
00050000-553a-3a71-d727-42208913f658	3253	Pristava pri Mestinju
00050000-553a-3a71-0433-d48fa9b1c2c4	9207	Prosenjakovci/Partosfalva
00050000-553a-3a71-1e2a-c52c5b94c0c9	5297	Prvačina
00050000-553a-3a71-4303-9f9e6458d527	2250	Ptuj
00050000-553a-3a71-238c-7de5cab40f4f	2323	Ptujska Gora
00050000-553a-3a71-0914-ae15abfee8e1	9201	Puconci
00050000-553a-3a71-3f5f-2d63852e9762	2327	Rače
00050000-553a-3a71-9eac-4e7c20f407fd	1433	Radeče
00050000-553a-3a71-4cf9-9675ae50ef65	9252	Radenci
00050000-553a-3a71-849f-612a30b2f02c	2360	Radlje ob Dravi
00050000-553a-3a71-64be-09f05a1e72c4	1235	Radomlje
00050000-553a-3a71-4d48-8c445fb7b25c	4240	Radovljica
00050000-553a-3a71-17da-640e6eca7298	8274	Raka
00050000-553a-3a71-2758-f839202980cf	1381	Rakek
00050000-553a-3a71-9cca-2b623a5dd4f6	4283	Rateče - Planica
00050000-553a-3a71-e89b-ff07358a7f44	2390	Ravne na Koroškem
00050000-553a-3a71-1acc-eacdb08c149e	9246	Razkrižje
00050000-553a-3a71-e9bd-695adecbf265	3332	Rečica ob Savinji
00050000-553a-3a71-d7e8-6eea5615886e	5292	Renče
00050000-553a-3a71-a8f4-5adc9a86fc85	1310	Ribnica
00050000-553a-3a71-c8bd-ce612c66ea01	2364	Ribnica na Pohorju
00050000-553a-3a71-2376-ab12d97f04ef	3272	Rimske Toplice
00050000-553a-3a71-1179-708d1e504596	1314	Rob
00050000-553a-3a71-32e4-9c772405f8ea	5215	Ročinj
00050000-553a-3a71-86a2-13e51106436d	3250	Rogaška Slatina
00050000-553a-3a71-90cc-2aff8ae0913f	9262	Rogašovci
00050000-553a-3a71-cb45-9c3a85167480	3252	Rogatec
00050000-553a-3a71-1b5f-d7e5815bdaa5	1373	Rovte
00050000-553a-3a71-a645-15b7b51ac3c9	2342	Ruše
00050000-553a-3a71-2f2e-d3c7eb2e3e61	1282	Sava
00050000-553a-3a71-ecb2-9fa9ee744037	6333	Sečovlje/Sicciole
00050000-553a-3a71-0782-521709fed826	4227	Selca
00050000-553a-3a71-b64a-977f04f60b06	2352	Selnica ob Dravi
00050000-553a-3a71-a1ec-45c5f2383151	8333	Semič
00050000-553a-3a71-476e-37a701207537	8281	Senovo
00050000-553a-3a71-e1bc-4ad24990ee02	6224	Senožeče
00050000-553a-3a71-4940-964d6431d151	8290	Sevnica
00050000-553a-3a71-a1fd-61ac1bd2297b	6210	Sežana
00050000-553a-3a71-94c5-406c63c63617	2214	Sladki Vrh
00050000-553a-3a71-2919-aaabab66991a	5283	Slap ob Idrijci
00050000-553a-3a71-51ed-fc7586c29aef	2380	Slovenj Gradec
00050000-553a-3a71-64d8-5ded74f9bb81	2310	Slovenska Bistrica
00050000-553a-3a71-534f-3c4bbd6c80bd	3210	Slovenske Konjice
00050000-553a-3a71-f025-1f314ee376d9	1216	Smlednik
00050000-553a-3a71-f40e-1dc9fd65d9a0	5232	Soča
00050000-553a-3a71-3bd1-ee45d776a7b2	1317	Sodražica
00050000-553a-3a71-5b66-78254b84f3cb	3335	Solčava
00050000-553a-3a71-72dc-0e833f435f96	5250	Solkan
00050000-553a-3a71-f2a7-2a1d7fe77204	4229	Sorica
00050000-553a-3a71-1aa5-c1e0184697c7	4225	Sovodenj
00050000-553a-3a71-4f0a-bbfda0ede562	5281	Spodnja Idrija
00050000-553a-3a71-7308-8506bac0fbf6	2241	Spodnji Duplek
00050000-553a-3a71-3f12-a11506fb01b1	9245	Spodnji Ivanjci
00050000-553a-3a71-2241-5ceba6bb2fe1	2277	Središče ob Dravi
00050000-553a-3a71-7f82-bc285fa5341d	4267	Srednja vas v Bohinju
00050000-553a-3a71-13a5-1455782c1211	8256	Sromlje 
00050000-553a-3a71-435f-dc32bf2a81a6	5224	Srpenica
00050000-553a-3a71-20d8-1f87fa62a8ef	1242	Stahovica
00050000-553a-3a71-0d08-616f1afad2af	1332	Stara Cerkev
00050000-553a-3a71-d84a-bcc2006b87df	8342	Stari trg ob Kolpi
00050000-553a-3a71-16ab-d571e5f0e9c4	1386	Stari trg pri Ložu
00050000-553a-3a71-da2d-deae804eacaf	2205	Starše
00050000-553a-3a71-f49a-2b5eb8e1eaf6	2289	Stoperce
00050000-553a-3a71-04fe-30d33eddb53a	8322	Stopiče
00050000-553a-3a71-391e-3f87e32d6d49	3206	Stranice
00050000-553a-3a71-8abb-4fae83dcce8a	8351	Straža
00050000-553a-3a71-6699-b765d04125cc	1313	Struge
00050000-553a-3a71-b570-181053aebbd5	8293	Studenec
00050000-553a-3a71-c4f0-333c2402fb4e	8331	Suhor
00050000-553a-3a71-4aa5-94d45ddff2a9	2233	Sv. Ana v Slovenskih goricah
00050000-553a-3a71-4c18-4f1b984b687c	2235	Sv. Trojica v Slovenskih goricah
00050000-553a-3a71-5a5c-4bb138a17d44	2353	Sveti Duh na Ostrem Vrhu
00050000-553a-3a71-4542-201fea3825f6	9244	Sveti Jurij ob Ščavnici
00050000-553a-3a71-d5af-a5e9fbdf8cb1	3264	Sveti Štefan
00050000-553a-3a71-485c-2026d07fe395	2258	Sveti Tomaž
00050000-553a-3a71-1d3d-bc7bc22647e5	9204	Šalovci
00050000-553a-3a71-5879-a8df23d130d1	5261	Šempas
00050000-553a-3a71-7a21-1ff8f0cd1192	5290	Šempeter pri Gorici
00050000-553a-3a71-2234-0f6d3da6cfe8	3311	Šempeter v Savinjski dolini
00050000-553a-3a71-fc2c-0537c467c336	4208	Šenčur
00050000-553a-3a71-f35e-3257d572b1ee	2212	Šentilj v Slovenskih goricah
00050000-553a-3a71-4f6c-9902e58f6e24	8297	Šentjanž
00050000-553a-3a71-08e2-958064f8b662	2373	Šentjanž pri Dravogradu
00050000-553a-3a71-b505-8fd3e7a55232	8310	Šentjernej
00050000-553a-3a71-1a69-c62a596fd2f4	3230	Šentjur
00050000-553a-3a71-f24c-a1ffd919d5ec	3271	Šentrupert
00050000-553a-3a71-b4bf-1979426d136b	8232	Šentrupert
00050000-553a-3a71-816e-2c599ac65b73	1296	Šentvid pri Stični
00050000-553a-3a71-550b-82b38de839d2	8275	Škocjan
00050000-553a-3a71-b0cf-7405d6d98006	6281	Škofije
00050000-553a-3a71-3c26-58dba1e4f9de	4220	Škofja Loka
00050000-553a-3a71-c7ec-c04e5b60e8b1	3211	Škofja vas
00050000-553a-3a71-0fd3-88de00dded26	1291	Škofljica
00050000-553a-3a71-f1b4-d1d40b141537	6274	Šmarje
00050000-553a-3a71-4abe-2f65215cb318	1293	Šmarje - Sap
00050000-553a-3a71-dde3-16433b927aa1	3240	Šmarje pri Jelšah
00050000-553a-3a71-e54b-19ababd1e960	8220	Šmarješke Toplice
00050000-553a-3a71-0ff3-bbb7b95bfc61	2315	Šmartno na Pohorju
00050000-553a-3a71-ff7d-0d7a5c13b324	3341	Šmartno ob Dreti
00050000-553a-3a71-96ff-9e4968e8dd55	3327	Šmartno ob Paki
00050000-553a-3a71-ed16-1c217f4ff899	1275	Šmartno pri Litiji
00050000-553a-3a71-b24b-c13a8ec92117	2383	Šmartno pri Slovenj Gradcu
00050000-553a-3a71-cfaa-c178a9e879a6	3201	Šmartno v Rožni dolini
00050000-553a-3a71-9249-1f1fec52d433	3325	Šoštanj
00050000-553a-3a71-932c-84096210be56	6222	Štanjel
00050000-553a-3a71-dc1f-b827aa2279e1	3220	Štore
00050000-553a-3a71-2b4d-c98ca71736e0	3304	Tabor
00050000-553a-3a71-b2cd-ba2b8f077749	3221	Teharje
00050000-553a-3a71-4751-f4f034f115e8	9251	Tišina
00050000-553a-3a71-11a3-bd130fd81ff0	5220	Tolmin
00050000-553a-3a71-1ad6-acab8b638265	3326	Topolšica
00050000-553a-3a71-3568-e86ba418b392	2371	Trbonje
00050000-553a-3a71-f651-3296c7710b57	1420	Trbovlje
00050000-553a-3a71-f5ab-9d120c069a08	8231	Trebelno 
00050000-553a-3a71-41e9-db073febc61b	8210	Trebnje
00050000-553a-3a71-01ae-d31e088ad7e1	5252	Trnovo pri Gorici
00050000-553a-3a71-e934-cbb2e489e009	2254	Trnovska vas
00050000-553a-3a71-bd1d-d82bf5b4dd48	1222	Trojane
00050000-553a-3a71-974b-ea0ac2b084ab	1236	Trzin
00050000-553a-3a71-0559-7a1be454f2af	4290	Tržič
00050000-553a-3a71-1a2f-0290e113d74e	8295	Tržišče
00050000-553a-3a71-5b1a-971ac5a597f6	1311	Turjak
00050000-553a-3a71-ce45-22fbb09bd855	9224	Turnišče
00050000-553a-3a71-c761-449ddd5e08a1	8323	Uršna sela
00050000-553a-3a71-8e2d-8207929ed387	1252	Vače
00050000-553a-3a71-7af4-fb4b5e0d1d62	3320	Velenje 
00050000-553a-3a71-8fc1-b2ca46166aed	3322	Velenje - poštni predali
00050000-553a-3a71-9a85-f50c887d1fe7	8212	Velika Loka
00050000-553a-3a71-ec81-c5464d46cfac	2274	Velika Nedelja
00050000-553a-3a71-5d6f-6f6e9adab79d	9225	Velika Polana
00050000-553a-3a71-4e3c-6e6ff7771873	1315	Velike Lašče
00050000-553a-3a71-248e-456f5232639b	8213	Veliki Gaber
00050000-553a-3a71-768f-54a247a805b0	9241	Veržej
00050000-553a-3a71-a690-cc28da12cd9a	1312	Videm - Dobrepolje
00050000-553a-3a71-b4f8-79fb75759004	2284	Videm pri Ptuju
00050000-553a-3a71-8a1d-b93eb7aa370a	8344	Vinica
00050000-553a-3a71-8b5d-10ff4ee07d2e	5271	Vipava
00050000-553a-3a71-5e1c-7157673b733b	4212	Visoko
00050000-553a-3a71-33b6-1783c00d9c1d	1294	Višnja Gora
00050000-553a-3a71-04a7-1e01f1b720a8	3205	Vitanje
00050000-553a-3a71-75b0-4e9fb4015f7b	2255	Vitomarci
00050000-553a-3a71-4ae7-ed8590572aa6	1217	Vodice
00050000-553a-3a71-2475-d11014264fad	3212	Vojnik\t
00050000-553a-3a71-4418-e99eef637ea2	5293	Volčja Draga
00050000-553a-3a71-73e1-7493b682adb2	2232	Voličina
00050000-553a-3a71-3c33-0032bd4404fe	3305	Vransko
00050000-553a-3a71-cf27-1c77eb5f46e2	6217	Vremski Britof
00050000-553a-3a71-d3b2-92955f0eb6dc	1360	Vrhnika
00050000-553a-3a71-f7df-422d2f319414	2365	Vuhred
00050000-553a-3a71-c126-423fd763bff4	2367	Vuzenica
00050000-553a-3a71-7567-d11df14e7ecf	8292	Zabukovje 
00050000-553a-3a71-e1d4-805071d8ccc6	1410	Zagorje ob Savi
00050000-553a-3a71-400d-a98e5e68bb02	1303	Zagradec
00050000-553a-3a71-02ac-e7fe5c058627	2283	Zavrč
00050000-553a-3a71-dfb6-898330257b93	8272	Zdole 
00050000-553a-3a71-8c62-98cf554fe392	4201	Zgornja Besnica
00050000-553a-3a71-9c78-12cdaa55318a	2242	Zgornja Korena
00050000-553a-3a71-4f7c-64414544dd58	2201	Zgornja Kungota
00050000-553a-3a71-f957-473561317659	2316	Zgornja Ložnica
00050000-553a-3a71-2b4b-78f5d634caac	2314	Zgornja Polskava
00050000-553a-3a71-579d-7d8593806d64	2213	Zgornja Velka
00050000-553a-3a71-2db9-ec749fd05e8a	4247	Zgornje Gorje
00050000-553a-3a71-574b-de1b1ecff25b	4206	Zgornje Jezersko
00050000-553a-3a71-92ee-1dc0c2053092	2285	Zgornji Leskovec
00050000-553a-3a71-2108-a952f799ec7c	1432	Zidani Most
00050000-553a-3a71-90c6-6fb3fe5843e9	3214	Zreče
00050000-553a-3a71-a3d1-39500e00d148	4209	Žabnica
00050000-553a-3a71-1bd7-e3465ed64b19	3310	Žalec
00050000-553a-3a71-1f90-3e5dec157c78	4228	Železniki
00050000-553a-3a71-d215-ca56363723db	2287	Žetale
00050000-553a-3a71-5536-f2ad46a2031a	4226	Žiri
00050000-553a-3a71-8d6e-be5bd393d8a0	4274	Žirovnica
00050000-553a-3a71-0253-e9739cefc6ae	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 1303548)
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
-- TOC entry 2642 (class 0 OID 1303371)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1303437)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1303560)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1303665)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1303709)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1303589)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1303533)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1303523)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1303699)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1303655)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 1303237)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-553a-3a73-761c-9d5a373ac346	00010000-553a-3a73-c5b1-f0cb8326853a	2015-04-24 14:43:31	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROKYDHRWf1/tjvEPZUWn0kzErISei6yPm";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 1303598)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1303275)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-553a-3a73-ae42-a239c7779015	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-553a-3a73-b9c7-da2025d6c5c7	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-553a-3a73-40f2-700c61840168	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-553a-3a73-f166-35dcf3aea182	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-553a-3a73-2f93-f7b7bd53b486	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-553a-3a73-d2df-a6b75f9805f0	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 1303259)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-553a-3a73-761c-9d5a373ac346	00000000-553a-3a73-f166-35dcf3aea182
00010000-553a-3a73-c5b1-f0cb8326853a	00000000-553a-3a73-f166-35dcf3aea182
\.


--
-- TOC entry 2668 (class 0 OID 1303612)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 1303554)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1303504)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 1303336)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1303510)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1303690)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1303406)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1303246)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-553a-3a73-c5b1-f0cb8326853a	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO6IAyZeFqPx0Aw/K15cptZkpWTSkvF7.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-553a-3a73-761c-9d5a373ac346	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 1303740)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1303452)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 1303581)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1303647)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1303480)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1303730)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 1303637)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 1303300)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 1303779)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 1303772)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 1303689)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 1303470)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 1303503)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 1303432)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 1303633)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 1303450)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 1303497)
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
-- TOC entry 2365 (class 2606 OID 1303546)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 1303573)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 1303404)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 1303309)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 1303368)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 1303334)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 1303289)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 1303274)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 1303579)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 1303611)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 1303726)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 1303361)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 1303392)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 1303552)
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
-- TOC entry 2299 (class 2606 OID 1303382)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 1303441)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 1303564)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 1303671)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 1303714)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 1303596)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 1303537)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 1303528)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 1303708)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 1303662)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 1303245)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 1303602)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 1303263)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 1303283)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 1303620)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 1303559)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 1303509)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 1303341)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 1303519)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 1303698)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 1303417)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 1303258)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 1303754)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 1303456)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 1303587)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 1303653)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 1303492)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 1303739)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 1303646)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 1303477)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 1303363)
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
-- TOC entry 2378 (class 1259 OID 1303580)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 1303566)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 1303565)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 1303457)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 1303636)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 1303634)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 1303635)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 1303727)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 1303728)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 1303729)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 1303757)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 1303756)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 1303755)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 1303419)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 1303418)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 1303370)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 1303369)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 1303603)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 1303498)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 1303290)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 1303291)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 1303623)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 1303622)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 1303621)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 1303442)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 1303444)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 1303443)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 1303532)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 1303530)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 1303529)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 1303531)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 1303264)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 1303265)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 1303588)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 1303553)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 1303663)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 1303664)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 1303384)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 1303383)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 1303385)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 1303672)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 1303673)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 1303782)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 1303781)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 1303784)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 1303780)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 1303783)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 1303654)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 1303541)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 1303540)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 1303538)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 1303539)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 1303774)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 1303773)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 1303451)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 1303311)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 1303310)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 1303342)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 1303343)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 1303522)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 1303521)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 1303520)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 1303479)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 1303475)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 1303472)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 1303473)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 1303471)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 1303476)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 1303474)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 1303362)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 1303433)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1303435)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 1303434)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 1303436)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 1303547)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 1303335)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 1303405)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2386 (class 1259 OID 1303597)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 1303393)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 1303715)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 1303284)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 1303478)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 1303915)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 1303900)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 1303905)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 1303925)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 1303895)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 1303920)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 1303910)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 1303830)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 1304010)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 1304005)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 1304000)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 1303890)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 1304050)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 1304040)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1304045)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 1303990)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 1304085)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 1304090)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 1304095)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 1304110)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 1304105)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 1304100)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 1303865)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 1303860)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 1303840)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 1303835)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 1303815)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 1304020)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 1303930)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 1303795)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 1303800)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 1304035)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 1304030)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 1304025)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 1303870)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 1303880)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 1303875)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 1303965)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 1303955)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 1303950)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 1303960)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 1303785)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 1303790)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 1304015)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 1303995)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 1304060)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 1304065)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 1303850)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 1303845)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 1303855)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 1304070)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 1304075)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 1304135)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 1304130)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 1304145)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 1304125)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 1304140)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 1304055)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 1303985)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 1303980)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 1303970)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 1303975)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 1304120)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 1304115)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 1303885)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1304080)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 1303810)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 1303805)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 1303820)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 1303825)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 1303945)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 1303940)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 1303935)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-24 14:43:31 CEST

--
-- PostgreSQL database dump complete
--

