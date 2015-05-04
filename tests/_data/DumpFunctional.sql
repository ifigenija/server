--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-04 10:28:58 CEST

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
-- TOC entry 179 (class 1259 OID 1876367)
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
-- TOC entry 225 (class 1259 OID 1876849)
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
-- TOC entry 224 (class 1259 OID 1876832)
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
-- TOC entry 217 (class 1259 OID 1876748)
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
-- TOC entry 193 (class 1259 OID 1876532)
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
-- TOC entry 196 (class 1259 OID 1876573)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1876494)
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
-- TOC entry 212 (class 1259 OID 1876698)
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
-- TOC entry 191 (class 1259 OID 1876519)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1876567)
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
-- TOC entry 201 (class 1259 OID 1876616)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1876641)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1876468)
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
-- TOC entry 180 (class 1259 OID 1876376)
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
-- TOC entry 181 (class 1259 OID 1876387)
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
-- TOC entry 184 (class 1259 OID 1876438)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1876341)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1876360)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1876648)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1876678)
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
-- TOC entry 221 (class 1259 OID 1876790)
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
-- TOC entry 183 (class 1259 OID 1876418)
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
-- TOC entry 186 (class 1259 OID 1876460)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1876622)
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
-- TOC entry 185 (class 1259 OID 1876445)
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
-- TOC entry 190 (class 1259 OID 1876511)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1876634)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1876739)
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
-- TOC entry 220 (class 1259 OID 1876783)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1876663)
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
-- TOC entry 200 (class 1259 OID 1876607)
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
-- TOC entry 199 (class 1259 OID 1876597)
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
-- TOC entry 219 (class 1259 OID 1876773)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1876729)
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
-- TOC entry 173 (class 1259 OID 1876311)
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
-- TOC entry 172 (class 1259 OID 1876309)
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
-- TOC entry 209 (class 1259 OID 1876672)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1876351)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1876334)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1876686)
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
-- TOC entry 203 (class 1259 OID 1876628)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1876578)
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
-- TOC entry 182 (class 1259 OID 1876410)
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
-- TOC entry 198 (class 1259 OID 1876584)
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
-- TOC entry 218 (class 1259 OID 1876764)
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
-- TOC entry 188 (class 1259 OID 1876480)
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
-- TOC entry 174 (class 1259 OID 1876320)
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
-- TOC entry 223 (class 1259 OID 1876814)
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
-- TOC entry 192 (class 1259 OID 1876526)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1876655)
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
-- TOC entry 214 (class 1259 OID 1876721)
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
-- TOC entry 194 (class 1259 OID 1876554)
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
-- TOC entry 222 (class 1259 OID 1876804)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1876711)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1876314)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 1876367)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1876849)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 1876832)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1876748)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1876532)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1876573)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1876494)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5547-2dca-9a74-2261be1b6118	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5547-2dca-f30f-c348437bfec8	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5547-2dca-a00e-f4bef37c2c90	AL	ALB	008	Albania 	Albanija	\N
00040000-5547-2dca-739f-b51c18f6e831	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5547-2dca-41ab-685cfa968aa2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5547-2dca-5ee8-00e2566f409c	AD	AND	020	Andorra 	Andora	\N
00040000-5547-2dca-8734-a85eb4372896	AO	AGO	024	Angola 	Angola	\N
00040000-5547-2dca-7fef-267865d01e11	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5547-2dca-aa53-bdc0af6573dd	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5547-2dca-4a36-1693ee7b9246	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5547-2dca-11f6-243d7629b432	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5547-2dca-68ec-d21217061617	AM	ARM	051	Armenia 	Armenija	\N
00040000-5547-2dca-5b6c-28a10489cc69	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5547-2dca-e81d-06d5460b43e8	AU	AUS	036	Australia 	Avstralija	\N
00040000-5547-2dca-ed43-b72096d5e18d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5547-2dca-0e64-50259586c17f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5547-2dca-6da5-a745492afec0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5547-2dca-9d16-8a83e3f299ff	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5547-2dca-e6dc-b7620c3bb54f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5547-2dca-ba57-d86f1deed967	BB	BRB	052	Barbados 	Barbados	\N
00040000-5547-2dca-78ee-c42f94012532	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5547-2dca-8c13-464f76183db9	BE	BEL	056	Belgium 	Belgija	\N
00040000-5547-2dca-5f0e-9af45e52b8a4	BZ	BLZ	084	Belize 	Belize	\N
00040000-5547-2dca-bff6-bf85abf0ee4b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5547-2dca-2455-366632b992b7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5547-2dca-bcd0-8d5746848b50	BT	BTN	064	Bhutan 	Butan	\N
00040000-5547-2dca-56bc-5479b1f43b0d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5547-2dca-f99a-f82944a2841b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5547-2dca-f3ad-fc1947d2c7cc	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5547-2dca-0e63-bcc5a89d58bd	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5547-2dca-dd78-7ff41ffe3bcf	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5547-2dca-82b9-a9de6e6c4f7a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5547-2dca-fefa-9da17062295e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5547-2dca-3e62-8c16e4bac263	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5547-2dca-92af-997c98ff22cb	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5547-2dca-3cff-c8dba97a651d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5547-2dca-5372-64e30da68133	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5547-2dca-8215-eb9bf3e1c446	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5547-2dca-742e-e142e960614a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5547-2dca-db53-e90224be68a9	CA	CAN	124	Canada 	Kanada	\N
00040000-5547-2dca-dabe-d0bbd3adc907	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5547-2dca-408d-26b05259f8c2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5547-2dca-ea81-477df47aaed5	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5547-2dca-4fca-57345f3dbf13	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5547-2dca-2f38-ab893488bc1d	CL	CHL	152	Chile 	Čile	\N
00040000-5547-2dca-de5f-c5e8b5bba0e4	CN	CHN	156	China 	Kitajska	\N
00040000-5547-2dca-4c1b-e555c341d13d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5547-2dca-810b-a2f3a83a56c5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5547-2dca-f78c-bd1528580ac4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5547-2dca-4881-b7a57300e96c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5547-2dca-acee-76df71d417fa	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5547-2dca-a2b8-65be154d2f02	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5547-2dca-0a92-3b99b5bcaa5a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5547-2dca-1a58-2d2dd0e5a615	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5547-2dca-b153-b9394febaa9e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5547-2dca-73a6-17b1507d3e76	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5547-2dca-688d-8e4ba27a5df8	CU	CUB	192	Cuba 	Kuba	\N
00040000-5547-2dca-6ac1-04913557d838	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5547-2dca-0d5d-2f0561bc3152	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5547-2dca-2d5d-a408a83467c2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5547-2dca-ca8c-f71edb406fdc	DK	DNK	208	Denmark 	Danska	\N
00040000-5547-2dca-9f5a-49fa8a4a3da9	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5547-2dca-394e-11648d30b165	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5547-2dca-2263-bf58b5b21f42	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5547-2dca-a017-c05a2e194833	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5547-2dca-a776-c42d26041cd2	EG	EGY	818	Egypt 	Egipt	\N
00040000-5547-2dca-4d45-df5de9d58c1d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5547-2dca-fe56-4b220af37d92	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5547-2dca-564b-5457243a7e75	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5547-2dca-68e7-aed8ec066bb0	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5547-2dca-ac95-e6956a1a6f91	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5547-2dca-ceaa-7894158fb3be	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5547-2dca-bbee-96c9496c867b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5547-2dca-b73b-9e44846a42a6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5547-2dca-99ce-0ebac2c507b0	FI	FIN	246	Finland 	Finska	\N
00040000-5547-2dca-f3ae-6079fbe19760	FR	FRA	250	France 	Francija	\N
00040000-5547-2dca-e16c-259580d31412	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5547-2dca-2370-fa11edfc764e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5547-2dca-4ac6-8e7ec5b8b6bb	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5547-2dca-1276-7923a039e4fd	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5547-2dca-bfef-c504ad844b94	GA	GAB	266	Gabon 	Gabon	\N
00040000-5547-2dca-791f-9b02099b98da	GM	GMB	270	Gambia 	Gambija	\N
00040000-5547-2dca-3110-4b0591fae3e2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5547-2dca-568e-65dec13fd9da	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5547-2dca-06fe-f85f83896727	GH	GHA	288	Ghana 	Gana	\N
00040000-5547-2dca-d25a-e20d99a0fc21	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5547-2dca-f728-94425f09745f	GR	GRC	300	Greece 	Grčija	\N
00040000-5547-2dca-63d7-f883b6fa8426	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5547-2dca-f814-72dde7120099	GD	GRD	308	Grenada 	Grenada	\N
00040000-5547-2dca-a860-6f3da4e5affc	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5547-2dca-ef6c-baf7e5034062	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5547-2dca-551f-392152f88827	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5547-2dca-8bfa-4471f6aa3c9e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5547-2dca-0865-54de94238aa1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5547-2dca-39d3-fe483d52032a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5547-2dca-e207-4161b48c00cd	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5547-2dca-73e3-985073925666	HT	HTI	332	Haiti 	Haiti	\N
00040000-5547-2dca-a940-6a89a151226f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5547-2dca-dc27-dd833dc40144	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5547-2dca-1d9d-f6cf0066f732	HN	HND	340	Honduras 	Honduras	\N
00040000-5547-2dca-c833-3851f372da5b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5547-2dca-c870-08fb4c0298f8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5547-2dca-a5ae-5db9d614d7bd	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5547-2dca-5b49-ed7af0999b00	IN	IND	356	India 	Indija	\N
00040000-5547-2dca-0222-5c04a98d2692	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5547-2dca-4600-09d368f5001a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5547-2dca-6e0c-4d8bf09588ad	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5547-2dca-54ac-9c2d90c2cc47	IE	IRL	372	Ireland 	Irska	\N
00040000-5547-2dca-7f6d-3f99a94e191b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5547-2dca-1129-3c703d09d2d1	IL	ISR	376	Israel 	Izrael	\N
00040000-5547-2dca-19b0-c23d2a81eccf	IT	ITA	380	Italy 	Italija	\N
00040000-5547-2dca-1b8d-adbeef7fa4d7	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5547-2dca-236b-05cea026f9be	JP	JPN	392	Japan 	Japonska	\N
00040000-5547-2dca-4217-f60e7d2bd5de	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5547-2dca-b24e-901e1f128511	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5547-2dca-639c-c9a21786b019	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5547-2dca-5d71-5e6973c32e90	KE	KEN	404	Kenya 	Kenija	\N
00040000-5547-2dca-9823-2506f476b83a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5547-2dca-45c2-64c8b4b71f27	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5547-2dca-da92-bfc73fa3923e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5547-2dca-e16e-50cac297a116	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5547-2dca-70cb-e5b5768a47d6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5547-2dca-89a5-afc04db9f5fa	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5547-2dca-e041-a02a9c215480	LV	LVA	428	Latvia 	Latvija	\N
00040000-5547-2dca-03fc-663a0d8acd9e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5547-2dca-9648-f85a5a10828c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5547-2dca-5688-944e47d633b6	LR	LBR	430	Liberia 	Liberija	\N
00040000-5547-2dca-ebbd-40969fea8b59	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5547-2dca-9ebe-15046912a17e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5547-2dca-ae32-2bc64d28dbb8	LT	LTU	440	Lithuania 	Litva	\N
00040000-5547-2dca-65e4-000e0c2abece	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5547-2dca-7dd4-9067e0d25e36	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5547-2dca-b7b6-76d1d889d9ec	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5547-2dca-ccce-8710d4074f1b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5547-2dca-441b-bb08e5a0685a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5547-2dca-3905-071980d00e2e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5547-2dca-c4f0-f956de010c26	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5547-2dca-28ed-ce66fb76eafc	ML	MLI	466	Mali 	Mali	\N
00040000-5547-2dca-7f38-f5d06c582d9d	MT	MLT	470	Malta 	Malta	\N
00040000-5547-2dca-5d12-e959cc8c83ee	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5547-2dca-ad53-ecb3f47de76c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5547-2dca-1b29-896b0c7259c7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5547-2dca-aa04-5811ee793d5d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5547-2dca-88e6-882201f9d192	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5547-2dca-feac-6fc8db9abfd9	MX	MEX	484	Mexico 	Mehika	\N
00040000-5547-2dca-054e-b8627b6ff02c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5547-2dca-95fc-8469f832f61a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5547-2dca-8747-2aa341e4ece6	MC	MCO	492	Monaco 	Monako	\N
00040000-5547-2dca-375a-b80ed8506286	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5547-2dca-1beb-8b10e2022eca	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5547-2dca-3197-ac6e74f9f0d0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5547-2dca-06b4-5b66440b1418	MA	MAR	504	Morocco 	Maroko	\N
00040000-5547-2dca-690d-1d15f6929b47	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5547-2dca-b51b-0f63788340d1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5547-2dca-5abd-9ff4c5223852	NA	NAM	516	Namibia 	Namibija	\N
00040000-5547-2dca-3ef7-8312b7e76f2f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5547-2dca-22a5-e2b916815d56	NP	NPL	524	Nepal 	Nepal	\N
00040000-5547-2dca-d292-58d8a484e3a0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5547-2dca-3263-132a845da6f7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5547-2dca-54a6-6fcf08635da9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5547-2dca-4cb2-2af063eb18ea	NE	NER	562	Niger 	Niger 	\N
00040000-5547-2dca-37e6-ea2313e09a2e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5547-2dca-9ca5-c3c1537503ef	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5547-2dca-30b3-363bc613b242	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5547-2dca-63c6-d456c9313fd2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5547-2dca-fb85-f750c027770b	NO	NOR	578	Norway 	Norveška	\N
00040000-5547-2dca-b188-2900106e873c	OM	OMN	512	Oman 	Oman	\N
00040000-5547-2dca-ba56-9d2d21a306f0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5547-2dca-8866-48567087910c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5547-2dca-2f01-55efca03db4d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5547-2dca-f3b8-0b0967f73c9c	PA	PAN	591	Panama 	Panama	\N
00040000-5547-2dca-a2c7-539885bee0be	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5547-2dca-5522-7187604612bc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5547-2dca-638f-181193b910e3	PE	PER	604	Peru 	Peru	\N
00040000-5547-2dca-d475-b3fd633fd3bc	PH	PHL	608	Philippines 	Filipini	\N
00040000-5547-2dca-cf6f-1302e4e809fb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5547-2dca-bb8e-f5250d3d4654	PL	POL	616	Poland 	Poljska	\N
00040000-5547-2dca-fe2d-4f6009d99bfd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5547-2dca-8485-8bbc12887be6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5547-2dca-ffef-1dc0ed34f882	QA	QAT	634	Qatar 	Katar	\N
00040000-5547-2dca-e45c-c48463be02cd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5547-2dca-9686-64e00f732318	RO	ROU	642	Romania 	Romunija	\N
00040000-5547-2dca-a9c2-b9c4be4183c8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5547-2dca-81a1-6cdf8dcbab4a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5547-2dca-02cc-8971debf977a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5547-2dca-11c0-37013601d23e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5547-2dca-1b6b-6ce8d10f23dd	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5547-2dca-0f40-57bd43c25387	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5547-2dca-5787-3d2b2b0b7503	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5547-2dca-546d-d1f2485148d4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5547-2dca-86d4-cca83f992bb3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5547-2dca-200d-7d79c616c2f9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5547-2dca-3b20-7fe14726f242	SM	SMR	674	San Marino 	San Marino	\N
00040000-5547-2dca-3157-5bfae7af5a6a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5547-2dca-be57-94af2a457137	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5547-2dca-f853-200bbc8868b4	SN	SEN	686	Senegal 	Senegal	\N
00040000-5547-2dca-d0b2-55d7d93d5a77	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5547-2dca-e551-bf3cc95624a4	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5547-2dca-5b91-8da19abf9c99	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5547-2dca-b67f-fb79ee6b5d4b	SG	SGP	702	Singapore 	Singapur	\N
00040000-5547-2dca-a51d-b9f6b849107f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5547-2dca-b25f-ee8f94daaab0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5547-2dca-34c7-af2db4d7656a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5547-2dca-6fbf-8a5dbbb89b6e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5547-2dca-d952-2a453bd6100c	SO	SOM	706	Somalia 	Somalija	\N
00040000-5547-2dca-142b-2dd9b09b2296	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5547-2dca-d90c-db995430472c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5547-2dca-420e-81959d90c2e6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5547-2dca-8026-3c62319d3063	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5547-2dca-c290-d3e8e44b19f0	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5547-2dca-475e-0cc7e3d73e93	SD	SDN	729	Sudan 	Sudan	\N
00040000-5547-2dca-d7b8-e5c54eb4b4f0	SR	SUR	740	Suriname 	Surinam	\N
00040000-5547-2dca-39b3-75613b855661	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5547-2dca-5537-dce87c2c723a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5547-2dca-e940-35780f8f80fd	SE	SWE	752	Sweden 	Švedska	\N
00040000-5547-2dca-f7e7-04135d46c909	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5547-2dca-e4df-ffd0f9ec8439	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5547-2dca-3a14-ef0d31926d4c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5547-2dca-1fc3-6ccb951ddf43	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5547-2dca-59e9-a3370152faaf	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5547-2dca-7de4-a4bf21891ee4	TH	THA	764	Thailand 	Tajska	\N
00040000-5547-2dca-4d83-31c6c34055d3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5547-2dca-ac86-4ad5f992f4dc	TG	TGO	768	Togo 	Togo	\N
00040000-5547-2dca-a413-a6e02785ace7	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5547-2dca-53bf-b1fa3e4b1df5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5547-2dca-1a80-d571e4929fac	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5547-2dca-e407-fe7f55a60158	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5547-2dca-7b66-bf0f26f45964	TR	TUR	792	Turkey 	Turčija	\N
00040000-5547-2dca-6dab-d323c2eab53f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5547-2dca-dbf6-79cffe395eb6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5547-2dca-b950-57e591106cfe	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5547-2dca-2c1d-1773582d5d69	UG	UGA	800	Uganda 	Uganda	\N
00040000-5547-2dca-55c9-ec59318cf392	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5547-2dca-1aa5-5c0352e3341c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5547-2dca-9fd6-93cb2c5e30dc	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5547-2dca-cc48-0784b843186f	US	USA	840	United States 	Združene države Amerike	\N
00040000-5547-2dca-630c-656889b5ff0f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5547-2dca-1052-129213521c3a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5547-2dca-c080-6a85f178ffa4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5547-2dca-a7d2-7fd3399ff7db	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5547-2dca-01d1-45d9d40d8d3d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5547-2dca-6abd-27f5c9ce7957	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5547-2dca-1842-f88489877b94	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5547-2dca-4221-283428afff36	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5547-2dca-1795-06311851bbc5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5547-2dca-3aa7-b81bfd8cb980	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5547-2dca-1797-0eff18c4df14	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5547-2dca-2a60-81bab681957e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5547-2dca-74f1-eb828569f217	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 1876698)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1876519)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1876567)
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
-- TOC entry 2658 (class 0 OID 1876616)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1876641)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1876468)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5547-2dca-3c2c-b1920fe39acf	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5547-2dca-13ad-4f18e164bf09	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5547-2dca-8803-c69f55267ded	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5547-2dca-bdab-84d629767810	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5547-2dca-ca10-a5b762ea8521	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5547-2dca-a2cc-7333fc72c631	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5547-2dca-9aab-b0c69c961d99	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5547-2dca-7393-9051a55e56bf	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5547-2dca-550f-4760d35d9771	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5547-2dca-5150-9440bf9c9786	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 1876376)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5547-2dca-4e7d-12b7a8aec8df	00000000-5547-2dca-ca10-a5b762ea8521	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5547-2dca-f142-4754e2b5d511	00000000-5547-2dca-ca10-a5b762ea8521	00010000-5547-2dca-60b6-62e9f7f8fe70	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5547-2dca-80aa-8f339f8520ab	00000000-5547-2dca-a2cc-7333fc72c631	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 1876387)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1876438)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 1876341)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5547-2dca-b468-987836ef7ca3	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5547-2dca-1980-2cf7bb347374	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5547-2dca-d48f-2f2e12b8d688	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5547-2dca-ad00-c22d982a0df1	Abonma-read	Abonma - branje	f
00030000-5547-2dca-9402-ca4c58597ad3	Abonma-write	Abonma - spreminjanje	f
00030000-5547-2dca-4d5a-6c28cc090271	Alternacija-read	Alternacija - branje	f
00030000-5547-2dca-c923-82bf78c7fefe	Alternacija-write	Alternacija - spreminjanje	f
00030000-5547-2dca-1a05-585f55ee9669	Arhivalija-read	Arhivalija - branje	f
00030000-5547-2dca-fd57-a1185cec6c0a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5547-2dca-47cc-31f8cd90c728	Besedilo-read	Besedilo - branje	f
00030000-5547-2dca-56df-a82860be69c8	Besedilo-write	Besedilo - spreminjanje	f
00030000-5547-2dca-7954-3f432ddf15d2	DogodekIzven-read	DogodekIzven - branje	f
00030000-5547-2dca-bd25-f987e9a78424	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5547-2dca-0e5c-96893348867f	Dogodek-read	Dogodek - branje	f
00030000-5547-2dca-a97a-2b7bcdb6c842	Dogodek-write	Dogodek - spreminjanje	f
00030000-5547-2dca-5369-c55e9a56c91a	Drzava-read	Drzava - branje	f
00030000-5547-2dca-c930-b97d56c13492	Drzava-write	Drzava - spreminjanje	f
00030000-5547-2dca-e1d4-025c74b4775d	Funkcija-read	Funkcija - branje	f
00030000-5547-2dca-0a56-69e953b05a64	Funkcija-write	Funkcija - spreminjanje	f
00030000-5547-2dca-50dc-06401da863d8	Gostovanje-read	Gostovanje - branje	f
00030000-5547-2dca-dbf7-130a1d4e6a0d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5547-2dca-946a-92e815633567	Gostujoca-read	Gostujoca - branje	f
00030000-5547-2dca-c6d3-82d51572e8bf	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5547-2dca-4f21-c236bcc99129	Kupec-read	Kupec - branje	f
00030000-5547-2dca-dd2c-11dc999a37c2	Kupec-write	Kupec - spreminjanje	f
00030000-5547-2dca-ba16-5eba20c10c74	NacinPlacina-read	NacinPlacina - branje	f
00030000-5547-2dca-9764-7795c9889eb0	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5547-2dca-4fcf-f734407aabfe	Option-read	Option - branje	f
00030000-5547-2dca-8fa1-da3f20f4dea7	Option-write	Option - spreminjanje	f
00030000-5547-2dca-6474-d00e5554c7f2	OptionValue-read	OptionValue - branje	f
00030000-5547-2dca-5ec0-3ffd5c1ab92a	OptionValue-write	OptionValue - spreminjanje	f
00030000-5547-2dca-1a90-8ddc93df1f32	Oseba-read	Oseba - branje	f
00030000-5547-2dca-db4e-bf4830c3dac0	Oseba-write	Oseba - spreminjanje	f
00030000-5547-2dca-3ee6-f9cc3e5b3703	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5547-2dca-5855-3700cbaae882	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5547-2dca-adf9-8f057547e5ba	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5547-2dca-03cc-b380efe323ff	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5547-2dca-e820-122f418cbf5f	Pogodba-read	Pogodba - branje	f
00030000-5547-2dca-a27e-86c6dd59aeff	Pogodba-write	Pogodba - spreminjanje	f
00030000-5547-2dca-b886-4e7aef8ff9ba	Popa-read	Popa - branje	f
00030000-5547-2dca-d17a-8f4953663208	Popa-write	Popa - spreminjanje	f
00030000-5547-2dca-11c2-b1ed3ced4445	Posta-read	Posta - branje	f
00030000-5547-2dca-71ce-262b44b823fa	Posta-write	Posta - spreminjanje	f
00030000-5547-2dca-cdf9-18df1a3a741b	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5547-2dca-4386-9381e7bbfe35	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5547-2dca-ddc1-c28548b3f4f8	PostniNaslov-read	PostniNaslov - branje	f
00030000-5547-2dca-2c8f-f87547c8c8f3	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5547-2dca-d865-9997ca62d958	Predstava-read	Predstava - branje	f
00030000-5547-2dca-07cf-08bef841bc51	Predstava-write	Predstava - spreminjanje	f
00030000-5547-2dca-c4c6-cbeb2e302bbf	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5547-2dca-fd4d-1a0459c41aa8	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5547-2dca-ba76-cd265ec134e3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5547-2dca-e667-726c55f38ce0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5547-2dca-7f06-e6c2024512fd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5547-2dca-e907-392483ea00e6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5547-2dca-8293-bdd3c98cd8bf	Prostor-read	Prostor - branje	f
00030000-5547-2dca-a878-0af9a723da21	Prostor-write	Prostor - spreminjanje	f
00030000-5547-2dca-fc28-5970633d9c47	Racun-read	Racun - branje	f
00030000-5547-2dca-a260-6229e16af7b0	Racun-write	Racun - spreminjanje	f
00030000-5547-2dca-6b6a-a41f22d39d4f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5547-2dca-788c-bc1f28b745cd	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5547-2dca-1f4f-234fff7ec7aa	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5547-2dca-d14e-be7df0ca695f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5547-2dca-345b-0a82ba983e5b	Rekvizit-read	Rekvizit - branje	f
00030000-5547-2dca-c738-ba74e30957d3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5547-2dca-48b3-6dd3228177e3	Rezervacija-read	Rezervacija - branje	f
00030000-5547-2dca-2de4-f470976ee784	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5547-2dca-110c-778be3acb70e	SedezniRed-read	SedezniRed - branje	f
00030000-5547-2dca-24ae-d2fff427fe59	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5547-2dca-afc1-363476170273	Sedez-read	Sedez - branje	f
00030000-5547-2dca-cd30-5c24ac7917b1	Sedez-write	Sedez - spreminjanje	f
00030000-5547-2dca-6164-18c0985ec755	Sezona-read	Sezona - branje	f
00030000-5547-2dca-79c8-136d842a9bb2	Sezona-write	Sezona - spreminjanje	f
00030000-5547-2dca-154c-c192a5c9c3c1	Telefonska-read	Telefonska - branje	f
00030000-5547-2dca-3329-23430ecd8a5f	Telefonska-write	Telefonska - spreminjanje	f
00030000-5547-2dca-0be9-8adb26eb1387	TerminStoritve-read	TerminStoritve - branje	f
00030000-5547-2dca-db93-beed7e801f8e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5547-2dca-f052-0c208c2cbd07	TipFunkcije-read	TipFunkcije - branje	f
00030000-5547-2dca-165d-a01619d40ede	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5547-2dca-377e-8a7d1df9cccf	Trr-read	Trr - branje	f
00030000-5547-2dca-6068-0437d601bbee	Trr-write	Trr - spreminjanje	f
00030000-5547-2dca-6b4b-06e4af216aae	Uprizoritev-read	Uprizoritev - branje	f
00030000-5547-2dca-6f8d-16bb4b3037f4	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5547-2dca-6415-9262913d1fa3	Vaja-read	Vaja - branje	f
00030000-5547-2dca-f9d6-f72add0a4571	Vaja-write	Vaja - spreminjanje	f
00030000-5547-2dca-f5e9-64e7f7294dc9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5547-2dca-b3f8-84e61a973cca	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5547-2dca-2396-ac65106c5ab9	Zaposlitev-read	Zaposlitev - branje	f
00030000-5547-2dca-383e-477c411494db	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5547-2dca-c48c-27dd46a0b32c	Zasedenost-read	Zasedenost - branje	f
00030000-5547-2dca-207a-a3975ccf7eeb	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5547-2dca-460d-e5f8867a1720	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5547-2dca-fb92-b8a819eae929	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5547-2dca-4cbb-f4039222f36b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5547-2dca-0d61-7f5db5365f14	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 1876360)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5547-2dca-5ab7-944f972db612	00030000-5547-2dca-5369-c55e9a56c91a
00020000-5547-2dca-4f99-379ac98d7c42	00030000-5547-2dca-c930-b97d56c13492
00020000-5547-2dca-4f99-379ac98d7c42	00030000-5547-2dca-5369-c55e9a56c91a
\.


--
-- TOC entry 2663 (class 0 OID 1876648)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 1876678)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1876790)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1876418)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1876460)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5547-2dc9-8396-0e22bc72c757	8341	Adlešiči
00050000-5547-2dc9-bb0a-b6d2fbb5f0bf	5270	Ajdovščina
00050000-5547-2dc9-bc9e-6e0859d8fdd7	6280	Ankaran/Ancarano
00050000-5547-2dc9-8484-1a9251059577	9253	Apače
00050000-5547-2dc9-af4d-effbcb81aea8	8253	Artiče
00050000-5547-2dc9-11d3-639e3125f281	4275	Begunje na Gorenjskem
00050000-5547-2dc9-f1b9-4fbd446405c1	1382	Begunje pri Cerknici
00050000-5547-2dc9-d8a8-73f8c4110beb	9231	Beltinci
00050000-5547-2dc9-00b4-96c1482ee3f0	2234	Benedikt
00050000-5547-2dc9-da40-baeecd68dc27	2345	Bistrica ob Dravi
00050000-5547-2dc9-102e-43ef835b2be7	3256	Bistrica ob Sotli
00050000-5547-2dc9-897e-ca46bf09ddeb	8259	Bizeljsko
00050000-5547-2dc9-6d36-ce76caf52a4b	1223	Blagovica
00050000-5547-2dc9-b0b6-c61545c6a8b0	8283	Blanca
00050000-5547-2dc9-ffce-6325c805afd4	4260	Bled
00050000-5547-2dc9-0141-2a90040220bc	4273	Blejska Dobrava
00050000-5547-2dc9-e0a0-c5555f9e1a0d	9265	Bodonci
00050000-5547-2dc9-1eda-938b19e85978	9222	Bogojina
00050000-5547-2dc9-926a-5a5818e95f9f	4263	Bohinjska Bela
00050000-5547-2dc9-51b0-6f0601cf5269	4264	Bohinjska Bistrica
00050000-5547-2dc9-6ceb-2b5078e0b33c	4265	Bohinjsko jezero
00050000-5547-2dc9-b582-a2406d239bed	1353	Borovnica
00050000-5547-2dc9-d329-f629a492e82a	8294	Boštanj
00050000-5547-2dc9-a217-1849ae600329	5230	Bovec
00050000-5547-2dc9-6540-50193f5c1cf8	5295	Branik
00050000-5547-2dc9-9ee6-f400b403d708	3314	Braslovče
00050000-5547-2dc9-9299-5298d4108a22	5223	Breginj
00050000-5547-2dc9-cd14-76b8d9d26cb5	8280	Brestanica
00050000-5547-2dc9-5ebf-41b9ab923cfb	2354	Bresternica
00050000-5547-2dc9-9222-4efe7fb68779	4243	Brezje
00050000-5547-2dc9-22b4-2470b32df985	1351	Brezovica pri Ljubljani
00050000-5547-2dc9-4dfd-030c5e481d5e	8250	Brežice
00050000-5547-2dc9-e73e-7332bfb61c8f	4210	Brnik - Aerodrom
00050000-5547-2dc9-6654-4db43ded3eba	8321	Brusnice
00050000-5547-2dc9-cf59-891dff287617	3255	Buče
00050000-5547-2dc9-8e51-f7be09d3de15	8276	Bučka 
00050000-5547-2dc9-7429-39404db1a5a7	9261	Cankova
00050000-5547-2dc9-6527-96d1c668461e	3000	Celje 
00050000-5547-2dc9-d20b-cca120ad63e7	3001	Celje - poštni predali
00050000-5547-2dc9-5f4b-c61432764fc2	4207	Cerklje na Gorenjskem
00050000-5547-2dc9-a8c0-ab628af0e903	8263	Cerklje ob Krki
00050000-5547-2dc9-06f5-fb4e9797a032	1380	Cerknica
00050000-5547-2dc9-0d65-2684b613a0d3	5282	Cerkno
00050000-5547-2dc9-518c-2adac5ef9cf5	2236	Cerkvenjak
00050000-5547-2dc9-a4bd-930b9826fcd6	2215	Ceršak
00050000-5547-2dc9-8d38-e120bf363022	2326	Cirkovce
00050000-5547-2dc9-f628-813f30757551	2282	Cirkulane
00050000-5547-2dc9-a467-f7adcc6fb259	5273	Col
00050000-5547-2dc9-9738-3de05dfd6ba2	8251	Čatež ob Savi
00050000-5547-2dc9-a086-ddbd151793c6	1413	Čemšenik
00050000-5547-2dc9-0754-30f71ad49f24	5253	Čepovan
00050000-5547-2dc9-b817-6095e1ce4a4b	9232	Črenšovci
00050000-5547-2dc9-a839-3a001646aa9d	2393	Črna na Koroškem
00050000-5547-2dc9-5be4-9aaceba9be72	6275	Črni Kal
00050000-5547-2dc9-eb8c-81395f668bfe	5274	Črni Vrh nad Idrijo
00050000-5547-2dc9-b0ad-c61064d9c63c	5262	Črniče
00050000-5547-2dc9-67fc-0f9fb4aca9fb	8340	Črnomelj
00050000-5547-2dc9-2828-3138b0de0465	6271	Dekani
00050000-5547-2dc9-fb64-c9308cde846f	5210	Deskle
00050000-5547-2dc9-7ebf-2b9558188ed5	2253	Destrnik
00050000-5547-2dc9-1f5e-8336fc490937	6215	Divača
00050000-5547-2dc9-90fc-fe9691a0e83e	1233	Dob
00050000-5547-2dc9-849b-12c53d56ef09	3224	Dobje pri Planini
00050000-5547-2dc9-c5cf-c6b11180de60	8257	Dobova
00050000-5547-2dc9-dace-418e1b4012e7	1423	Dobovec
00050000-5547-2dc9-e015-41d0f5708589	5263	Dobravlje
00050000-5547-2dc9-a7d9-2112cade6429	3204	Dobrna
00050000-5547-2dc9-96bb-0793440d216f	8211	Dobrnič
00050000-5547-2dc9-4658-f6aabf94b791	1356	Dobrova
00050000-5547-2dc9-8b4d-4e18d0e1b65c	9223	Dobrovnik/Dobronak 
00050000-5547-2dc9-2bf3-191267a31413	5212	Dobrovo v Brdih
00050000-5547-2dc9-68c5-9feaf09e6395	1431	Dol pri Hrastniku
00050000-5547-2dc9-2290-268c0ba4fe1c	1262	Dol pri Ljubljani
00050000-5547-2dc9-7351-a87e1c9e1efb	1273	Dole pri Litiji
00050000-5547-2dc9-1bbb-6d334b7fe2e3	1331	Dolenja vas
00050000-5547-2dc9-bbb2-161d7b9855b9	8350	Dolenjske Toplice
00050000-5547-2dc9-2a1d-11070cbd47a3	1230	Domžale
00050000-5547-2dc9-dd6b-1e3faabc582f	2252	Dornava
00050000-5547-2dc9-c406-5bfb5cafee02	5294	Dornberk
00050000-5547-2dc9-6efb-40c01b426553	1319	Draga
00050000-5547-2dc9-b852-37a0d5f9d49f	8343	Dragatuš
00050000-5547-2dc9-f0bd-920d81d5c51f	3222	Dramlje
00050000-5547-2dc9-9fbd-47fb55d057c6	2370	Dravograd
00050000-5547-2dc9-b494-d9eec78aed5a	4203	Duplje
00050000-5547-2dc9-b3ce-67f9ca912391	6221	Dutovlje
00050000-5547-2dc9-621b-adadc5d54025	8361	Dvor
00050000-5547-2dc9-b796-af59d9999684	2343	Fala
00050000-5547-2dc9-9c8c-21f7599eb0d8	9208	Fokovci
00050000-5547-2dc9-0382-1c938f76251b	2313	Fram
00050000-5547-2dc9-4d08-c8d7a124dcc5	3213	Frankolovo
00050000-5547-2dc9-ce17-9e9c18193305	1274	Gabrovka
00050000-5547-2dc9-199f-814ba709ab90	8254	Globoko
00050000-5547-2dc9-8a3a-110542798405	5275	Godovič
00050000-5547-2dc9-7153-8dfff07fc27d	4204	Golnik
00050000-5547-2dc9-5446-c65fc6be5d1b	3303	Gomilsko
00050000-5547-2dc9-011f-bea2d0f205ce	4224	Gorenja vas
00050000-5547-2dc9-cfe8-dec0b4549b35	3263	Gorica pri Slivnici
00050000-5547-2dc9-f9eb-e460e0fbca4d	2272	Gorišnica
00050000-5547-2dc9-9d6e-9650b870fbc0	9250	Gornja Radgona
00050000-5547-2dc9-7959-631a254411e2	3342	Gornji Grad
00050000-5547-2dc9-3a1f-5e8001184b6c	4282	Gozd Martuljek
00050000-5547-2dc9-b4ac-5082a899e8f4	6272	Gračišče
00050000-5547-2dc9-d3df-58d599223ed2	9264	Grad
00050000-5547-2dc9-516b-5ac0568cf09d	8332	Gradac
00050000-5547-2dc9-6b12-1af6ffef9868	1384	Grahovo
00050000-5547-2dc9-1e8b-66a8c21bb6c0	5242	Grahovo ob Bači
00050000-5547-2dc9-06bb-422eb1bc21f0	5251	Grgar
00050000-5547-2dc9-3126-3209dbe60c86	3302	Griže
00050000-5547-2dc9-a87e-a9c6451bdddc	3231	Grobelno
00050000-5547-2dc9-2618-363a6269a486	1290	Grosuplje
00050000-5547-2dc9-b655-04aaad554f1b	2288	Hajdina
00050000-5547-2dc9-6355-277d5e3483f1	8362	Hinje
00050000-5547-2dc9-fd38-85955a5fcfc8	2311	Hoče
00050000-5547-2dc9-01b1-088e477892ea	9205	Hodoš/Hodos
00050000-5547-2dc9-cbb6-93ae226d8c50	1354	Horjul
00050000-5547-2dc9-2abc-d71d1ad7fe44	1372	Hotedršica
00050000-5547-2dc9-c46f-0aad7d5fc1db	1430	Hrastnik
00050000-5547-2dc9-f154-c49488d4e76b	6225	Hruševje
00050000-5547-2dc9-1536-5988b9d6073b	4276	Hrušica
00050000-5547-2dc9-cc6c-4a562da23eab	5280	Idrija
00050000-5547-2dc9-371f-7b8dc0dfb1f2	1292	Ig
00050000-5547-2dc9-7f69-c5f59ca8cf49	6250	Ilirska Bistrica
00050000-5547-2dc9-bf94-1f26d1c17c09	6251	Ilirska Bistrica-Trnovo
00050000-5547-2dc9-46f9-cd30085c7c54	1295	Ivančna Gorica
00050000-5547-2dc9-ea6f-fc17ac8dae8c	2259	Ivanjkovci
00050000-5547-2dc9-b0c3-d523b9e3829e	1411	Izlake
00050000-5547-2dc9-6bb7-924ae9c8efb7	6310	Izola/Isola
00050000-5547-2dc9-e55c-d44cd049d7ea	2222	Jakobski Dol
00050000-5547-2dc9-a661-17fae0627d3e	2221	Jarenina
00050000-5547-2dc9-6ff7-be1dc95d3075	6254	Jelšane
00050000-5547-2dc9-3257-bc8bf681012c	4270	Jesenice
00050000-5547-2dc9-f0ff-69480c01401b	8261	Jesenice na Dolenjskem
00050000-5547-2dc9-672e-164027ab447c	3273	Jurklošter
00050000-5547-2dc9-6310-51aa24d5ba86	2223	Jurovski Dol
00050000-5547-2dc9-bdaa-7174a58f8c74	2256	Juršinci
00050000-5547-2dc9-8d4a-f38d26445e62	5214	Kal nad Kanalom
00050000-5547-2dc9-04a4-d137d82bb909	3233	Kalobje
00050000-5547-2dc9-37af-043168ccfc48	4246	Kamna Gorica
00050000-5547-2dc9-7bb1-1e2622563040	2351	Kamnica
00050000-5547-2dc9-bbfc-c2ee93754825	1241	Kamnik
00050000-5547-2dc9-4e64-25bc17d107da	5213	Kanal
00050000-5547-2dc9-b543-0b345069ff19	8258	Kapele
00050000-5547-2dc9-cd87-3a31e09f0c8c	2362	Kapla
00050000-5547-2dc9-3c3a-eae88ed76104	2325	Kidričevo
00050000-5547-2dc9-c94d-fc6cb79d3c7e	1412	Kisovec
00050000-5547-2dc9-59de-1e575adc1925	6253	Knežak
00050000-5547-2dc9-e639-0925a05bccca	5222	Kobarid
00050000-5547-2dc9-1092-3d3571cfb309	9227	Kobilje
00050000-5547-2dc9-35c6-7b49401a5d33	1330	Kočevje
00050000-5547-2dc9-2bbd-a79f0cc6443c	1338	Kočevska Reka
00050000-5547-2dc9-eb9d-60ec8d236da4	2276	Kog
00050000-5547-2dc9-d1bf-67538b0a9b85	5211	Kojsko
00050000-5547-2dc9-4549-152957b69006	6223	Komen
00050000-5547-2dc9-91e7-b807c5b7f178	1218	Komenda
00050000-5547-2dc9-5f68-f7af63c70b69	6000	Koper/Capodistria 
00050000-5547-2dc9-8f2b-bdb2fcf88eee	6001	Koper/Capodistria - poštni predali
00050000-5547-2dc9-96f8-69139820c258	8282	Koprivnica
00050000-5547-2dc9-0c38-3e9e43b0c87c	5296	Kostanjevica na Krasu
00050000-5547-2dc9-524f-9498e8d26595	8311	Kostanjevica na Krki
00050000-5547-2dc9-13e8-b02cec8208e2	1336	Kostel
00050000-5547-2dc9-ab44-fa2ceedadf5b	6256	Košana
00050000-5547-2dc9-6d91-7d6090bdb0e2	2394	Kotlje
00050000-5547-2dc9-a1f2-a83eb5892227	6240	Kozina
00050000-5547-2dc9-2336-a9a4dd4d799d	3260	Kozje
00050000-5547-2dc9-5c4f-5f20f7ded0d5	4000	Kranj 
00050000-5547-2dc9-467b-84dab3231ecd	4001	Kranj - poštni predali
00050000-5547-2dc9-490f-579a83be6c7a	4280	Kranjska Gora
00050000-5547-2dc9-73d7-85c9aaac372c	1281	Kresnice
00050000-5547-2dc9-a3eb-0596aeaeeb2f	4294	Križe
00050000-5547-2dc9-46ed-9f8c930f7587	9206	Križevci
00050000-5547-2dc9-abdd-ce26ec6be516	9242	Križevci pri Ljutomeru
00050000-5547-2dc9-7497-41d0de66d9b7	1301	Krka
00050000-5547-2dc9-87e8-1956a6895262	8296	Krmelj
00050000-5547-2dc9-5ab5-3291712bb4c0	4245	Kropa
00050000-5547-2dc9-a4a2-0db65dc0e54f	8262	Krška vas
00050000-5547-2dc9-3431-4aeae108355d	8270	Krško
00050000-5547-2dc9-ca0e-73c00b75dc7a	9263	Kuzma
00050000-5547-2dc9-3174-2a0dfafaa322	2318	Laporje
00050000-5547-2dc9-2457-d9935b6b3f64	3270	Laško
00050000-5547-2dc9-1922-c79edc0c9e89	1219	Laze v Tuhinju
00050000-5547-2dc9-1a39-b4c6085aafdd	2230	Lenart v Slovenskih goricah
00050000-5547-2dc9-1b95-ea79e52ba0dc	9220	Lendava/Lendva
00050000-5547-2dc9-56b5-7d0d8290de02	4248	Lesce
00050000-5547-2dc9-e316-bfc8c81afcf3	3261	Lesično
00050000-5547-2dc9-d93e-772a5831de72	8273	Leskovec pri Krškem
00050000-5547-2dc9-76fe-5b05f36bc8ec	2372	Libeliče
00050000-5547-2dc9-8c5e-683457f5c6d8	2341	Limbuš
00050000-5547-2dc9-a3b7-3b79951c657f	1270	Litija
00050000-5547-2dc9-1d2f-78ceb79775cf	3202	Ljubečna
00050000-5547-2dc9-cfe0-1f021bac73b8	1000	Ljubljana 
00050000-5547-2dc9-7c97-ca054a9cd023	1001	Ljubljana - poštni predali
00050000-5547-2dc9-32b6-dc258f47fdd6	1231	Ljubljana - Črnuče
00050000-5547-2dc9-1750-de9d3a40e2c0	1261	Ljubljana - Dobrunje
00050000-5547-2dc9-4d4f-58d80ae3ab2e	1260	Ljubljana - Polje
00050000-5547-2dc9-3fac-ce69aa319941	1210	Ljubljana - Šentvid
00050000-5547-2dc9-406e-56c8263d71c9	1211	Ljubljana - Šmartno
00050000-5547-2dc9-4b56-28a321bc59f6	3333	Ljubno ob Savinji
00050000-5547-2dc9-401c-319d34189219	9240	Ljutomer
00050000-5547-2dc9-3183-7bc97604eaaf	3215	Loče
00050000-5547-2dc9-04ff-45deead83359	5231	Log pod Mangartom
00050000-5547-2dc9-a551-9f978522028c	1358	Log pri Brezovici
00050000-5547-2dc9-6ffa-fb3a2a1b744e	1370	Logatec
00050000-5547-2dc9-7f47-dd06a03e3cc3	1371	Logatec
00050000-5547-2dc9-9f7e-5c408a625f10	1434	Loka pri Zidanem Mostu
00050000-5547-2dc9-f544-3a8d444b5414	3223	Loka pri Žusmu
00050000-5547-2dc9-623e-05a9109fe68e	6219	Lokev
00050000-5547-2dc9-a1c6-02aec02a8384	1318	Loški Potok
00050000-5547-2dc9-1d9a-054b91c73e4f	2324	Lovrenc na Dravskem polju
00050000-5547-2dc9-db45-b5bb2512256c	2344	Lovrenc na Pohorju
00050000-5547-2dc9-c84b-21868b2d3dec	3334	Luče
00050000-5547-2dc9-8ce0-937a7099adeb	1225	Lukovica
00050000-5547-2dc9-91a8-31e06142ce61	9202	Mačkovci
00050000-5547-2dc9-b4ee-b1fb57ebb478	2322	Majšperk
00050000-5547-2dc9-1d4c-f13eaee29d79	2321	Makole
00050000-5547-2dc9-da86-efe750ed010c	9243	Mala Nedelja
00050000-5547-2dc9-ab3b-9ede0de6292e	2229	Malečnik
00050000-5547-2dc9-d447-33f6d21b53a8	6273	Marezige
00050000-5547-2dc9-408d-a7b181e36432	2000	Maribor 
00050000-5547-2dc9-f1f3-1b694746cbad	2001	Maribor - poštni predali
00050000-5547-2dc9-0429-95d7cbc03ea0	2206	Marjeta na Dravskem polju
00050000-5547-2dc9-692c-8dc0f07410cc	2281	Markovci
00050000-5547-2dc9-60dc-4fd8a949cfb7	9221	Martjanci
00050000-5547-2dc9-6a49-eede48204ea6	6242	Materija
00050000-5547-2dc9-8e5a-eba47b46b25a	4211	Mavčiče
00050000-5547-2dc9-ca02-a0ee427ba8d1	1215	Medvode
00050000-5547-2dc9-fbaf-6b21b2f6076b	1234	Mengeš
00050000-5547-2dc9-7463-933e924a5dd4	8330	Metlika
00050000-5547-2dc9-f485-b25f2762a0c1	2392	Mežica
00050000-5547-2dc9-9d4b-7b51bef39c1b	2204	Miklavž na Dravskem polju
00050000-5547-2dc9-4aba-59794dce77d6	2275	Miklavž pri Ormožu
00050000-5547-2dc9-0967-fe30dc3cb6be	5291	Miren
00050000-5547-2dc9-9611-3e6b97ed1c38	8233	Mirna
00050000-5547-2dc9-6308-9e6fa63cabf6	8216	Mirna Peč
00050000-5547-2dc9-5242-0709629a7434	2382	Mislinja
00050000-5547-2dc9-7718-943c866afecc	4281	Mojstrana
00050000-5547-2dc9-f043-ca87dfddf392	8230	Mokronog
00050000-5547-2dc9-6d8a-91f29f0f892b	1251	Moravče
00050000-5547-2dc9-3dde-5f9df50789b0	9226	Moravske Toplice
00050000-5547-2dc9-1ac1-cc18480ef239	5216	Most na Soči
00050000-5547-2dc9-50e6-49b0fe327748	1221	Motnik
00050000-5547-2dc9-d029-f72c4fd20115	3330	Mozirje
00050000-5547-2dc9-bf25-fec975bcfb24	9000	Murska Sobota 
00050000-5547-2dc9-a655-681b41b4f2b8	9001	Murska Sobota - poštni predali
00050000-5547-2dc9-78f9-ed1196bc2230	2366	Muta
00050000-5547-2dc9-95ac-f1e0735a712e	4202	Naklo
00050000-5547-2dc9-e223-da1636c08992	3331	Nazarje
00050000-5547-2dc9-c787-99533d499ec8	1357	Notranje Gorice
00050000-5547-2dc9-f39a-7eb0e7d147f7	3203	Nova Cerkev
00050000-5547-2dc9-efe6-08ff04ae3c90	5000	Nova Gorica 
00050000-5547-2dc9-6f39-c2672a433b8b	5001	Nova Gorica - poštni predali
00050000-5547-2dc9-c937-396e5637c37c	1385	Nova vas
00050000-5547-2dc9-4c18-0172b34fffb4	8000	Novo mesto
00050000-5547-2dc9-0f93-c2d647e01b8d	8001	Novo mesto - poštni predali
00050000-5547-2dc9-11c9-450e7bb24488	6243	Obrov
00050000-5547-2dc9-87ee-bfdb24ac2177	9233	Odranci
00050000-5547-2dc9-9ef1-d5c008145b4c	2317	Oplotnica
00050000-5547-2dc9-f813-a9d1f2a31159	2312	Orehova vas
00050000-5547-2dc9-f2fa-ef48a736a88c	2270	Ormož
00050000-5547-2dc9-aa93-b644dcaf10ad	1316	Ortnek
00050000-5547-2dc9-5dbd-4e85c3859528	1337	Osilnica
00050000-5547-2dc9-e3da-200ea9ec9601	8222	Otočec
00050000-5547-2dc9-7393-8b62a88b9444	2361	Ožbalt
00050000-5547-2dc9-3605-7cddb2d5b6b7	2231	Pernica
00050000-5547-2dc9-3a57-464408428ae6	2211	Pesnica pri Mariboru
00050000-5547-2dc9-982c-9146499e9efe	9203	Petrovci
00050000-5547-2dc9-bbe7-961bd45a1c9d	3301	Petrovče
00050000-5547-2dc9-7480-9fb7fd273e87	6330	Piran/Pirano
00050000-5547-2dc9-bc4d-1685ab5cecc0	8255	Pišece
00050000-5547-2dc9-d452-1b58bcf2cb2a	6257	Pivka
00050000-5547-2dc9-116d-0ad3aebf196c	6232	Planina
00050000-5547-2dc9-dbd4-b08db09e090b	3225	Planina pri Sevnici
00050000-5547-2dc9-9b9b-a77191d12d73	6276	Pobegi
00050000-5547-2dc9-15a6-6c929b445640	8312	Podbočje
00050000-5547-2dc9-4399-384ed2b95b8d	5243	Podbrdo
00050000-5547-2dc9-ea08-b0c2ea65cbe6	3254	Podčetrtek
00050000-5547-2dc9-b2b9-af3a81721d47	2273	Podgorci
00050000-5547-2dc9-d8b0-1987bb775b88	6216	Podgorje
00050000-5547-2dc9-f4de-b1a95e8e5f33	2381	Podgorje pri Slovenj Gradcu
00050000-5547-2dc9-1770-b49aeac67730	6244	Podgrad
00050000-5547-2dc9-6971-e954be477f13	1414	Podkum
00050000-5547-2dc9-c7ca-789736658f26	2286	Podlehnik
00050000-5547-2dc9-052b-20eb30c1d9c7	5272	Podnanos
00050000-5547-2dc9-0272-e7fd43ab9dfd	4244	Podnart
00050000-5547-2dc9-5744-f0b55c3f036e	3241	Podplat
00050000-5547-2dc9-bb43-afb2ca54887d	3257	Podsreda
00050000-5547-2dc9-4580-e69f0570b62a	2363	Podvelka
00050000-5547-2dc9-8696-ea2d7c447a7a	2208	Pohorje
00050000-5547-2dc9-66e1-c593d89da9eb	2257	Polenšak
00050000-5547-2dc9-1a26-c48d60bdff59	1355	Polhov Gradec
00050000-5547-2dc9-2044-b36535bd3255	4223	Poljane nad Škofjo Loko
00050000-5547-2dc9-ce9d-65894df7a37a	2319	Poljčane
00050000-5547-2dc9-fe02-feaa9110e574	1272	Polšnik
00050000-5547-2dc9-17cd-44ef9ae41e98	3313	Polzela
00050000-5547-2dc9-be74-6c0b9c4e8a2b	3232	Ponikva
00050000-5547-2dc9-ba47-e0a822d3e0c5	6320	Portorož/Portorose
00050000-5547-2dc9-9003-c0f6547db0fc	6230	Postojna
00050000-5547-2dc9-80b2-a341b5563cdc	2331	Pragersko
00050000-5547-2dc9-6aa8-f2d94b836344	3312	Prebold
00050000-5547-2dc9-cad1-b8c07685f807	4205	Preddvor
00050000-5547-2dc9-d5fa-21ae9c9342c7	6255	Prem
00050000-5547-2dc9-6989-0655a442cc2e	1352	Preserje
00050000-5547-2dc9-e96e-ac678f2c9b6e	6258	Prestranek
00050000-5547-2dc9-1cf6-7ed5306f1fe6	2391	Prevalje
00050000-5547-2dc9-1cf5-f5f10e49c31b	3262	Prevorje
00050000-5547-2dc9-e3ae-9c79a423fdba	1276	Primskovo 
00050000-5547-2dc9-b13d-5e62d7cbcb5c	3253	Pristava pri Mestinju
00050000-5547-2dc9-09bd-74ecdeb1c7d6	9207	Prosenjakovci/Partosfalva
00050000-5547-2dc9-9cbc-8c52bed43522	5297	Prvačina
00050000-5547-2dc9-ce00-0d3118d47f81	2250	Ptuj
00050000-5547-2dc9-9eaa-4791edf5e081	2323	Ptujska Gora
00050000-5547-2dc9-1cdf-8f7bddec9810	9201	Puconci
00050000-5547-2dc9-1cec-54f994034678	2327	Rače
00050000-5547-2dc9-c84c-4373d8d5b46c	1433	Radeče
00050000-5547-2dc9-fb82-ad754bd42674	9252	Radenci
00050000-5547-2dc9-d688-ca6634ed96cd	2360	Radlje ob Dravi
00050000-5547-2dc9-5763-f5a9f366064a	1235	Radomlje
00050000-5547-2dc9-5273-e32ed95e8266	4240	Radovljica
00050000-5547-2dc9-214f-327424d046fc	8274	Raka
00050000-5547-2dc9-e40f-f317ce8c3ccb	1381	Rakek
00050000-5547-2dc9-6f81-04a2af376203	4283	Rateče - Planica
00050000-5547-2dc9-1c15-ffe80f52039d	2390	Ravne na Koroškem
00050000-5547-2dc9-09fb-82342f2d1ba2	9246	Razkrižje
00050000-5547-2dc9-6e07-679a1cc5ca51	3332	Rečica ob Savinji
00050000-5547-2dc9-b2e1-bc652dd24d42	5292	Renče
00050000-5547-2dc9-0631-23a65cc85e7c	1310	Ribnica
00050000-5547-2dc9-a040-250773117dd0	2364	Ribnica na Pohorju
00050000-5547-2dc9-2cf2-87ee5b8d29f8	3272	Rimske Toplice
00050000-5547-2dc9-5217-13d312ed7b66	1314	Rob
00050000-5547-2dc9-887c-e9f7b6473100	5215	Ročinj
00050000-5547-2dc9-839d-52f1364cd5f4	3250	Rogaška Slatina
00050000-5547-2dc9-8f81-71ab7abcc2ad	9262	Rogašovci
00050000-5547-2dc9-af9b-e35e7dbe19b2	3252	Rogatec
00050000-5547-2dc9-cf47-0f56223b3b16	1373	Rovte
00050000-5547-2dc9-8421-1fe01a2fc9f3	2342	Ruše
00050000-5547-2dc9-2d99-b9eedc720b79	1282	Sava
00050000-5547-2dc9-df94-37ab1f368b92	6333	Sečovlje/Sicciole
00050000-5547-2dc9-50c3-cb2853e3a023	4227	Selca
00050000-5547-2dc9-076e-ff6abcc7787a	2352	Selnica ob Dravi
00050000-5547-2dc9-e257-4741b9a7648f	8333	Semič
00050000-5547-2dc9-c037-6ba79782dac1	8281	Senovo
00050000-5547-2dc9-8e44-fb0a4efebd6b	6224	Senožeče
00050000-5547-2dc9-3b46-f7e90b1924b9	8290	Sevnica
00050000-5547-2dc9-e77a-56d0f1a741aa	6210	Sežana
00050000-5547-2dc9-9375-e11fd10b4da1	2214	Sladki Vrh
00050000-5547-2dc9-a0b6-6d07416547bc	5283	Slap ob Idrijci
00050000-5547-2dc9-f5d7-2490b1c8f2fb	2380	Slovenj Gradec
00050000-5547-2dc9-7c7d-e2d3b50a4d48	2310	Slovenska Bistrica
00050000-5547-2dc9-26f6-3fef98b41704	3210	Slovenske Konjice
00050000-5547-2dc9-01e7-c722443b6d84	1216	Smlednik
00050000-5547-2dc9-0327-571df25c81b9	5232	Soča
00050000-5547-2dc9-6dfb-c38b4d394623	1317	Sodražica
00050000-5547-2dc9-f6ba-73a18f30e2d5	3335	Solčava
00050000-5547-2dc9-a11d-7c9193e71679	5250	Solkan
00050000-5547-2dc9-a04f-0fe435e27be0	4229	Sorica
00050000-5547-2dc9-a45e-88560058c8d5	4225	Sovodenj
00050000-5547-2dc9-a927-7f08ae9fef3b	5281	Spodnja Idrija
00050000-5547-2dc9-d1b7-fc94c4681aed	2241	Spodnji Duplek
00050000-5547-2dc9-24a1-1363a7bcfcb6	9245	Spodnji Ivanjci
00050000-5547-2dc9-93e3-5a04c510c829	2277	Središče ob Dravi
00050000-5547-2dc9-b423-843bc340c27c	4267	Srednja vas v Bohinju
00050000-5547-2dc9-c139-d0aa478f938e	8256	Sromlje 
00050000-5547-2dc9-5cef-cc8d327adc2f	5224	Srpenica
00050000-5547-2dc9-f895-2a5ec3707fed	1242	Stahovica
00050000-5547-2dc9-2303-d07fea221c50	1332	Stara Cerkev
00050000-5547-2dc9-ab42-591d35ab04d5	8342	Stari trg ob Kolpi
00050000-5547-2dc9-c696-1076143b6456	1386	Stari trg pri Ložu
00050000-5547-2dc9-cf5b-ccabd6b94bd7	2205	Starše
00050000-5547-2dc9-eec1-824109a19486	2289	Stoperce
00050000-5547-2dc9-8250-1f794f496775	8322	Stopiče
00050000-5547-2dc9-109f-12db5ea6c994	3206	Stranice
00050000-5547-2dc9-fb7c-153b64045762	8351	Straža
00050000-5547-2dc9-0f24-617f4df4d266	1313	Struge
00050000-5547-2dc9-df3a-8a11a7ac2d7f	8293	Studenec
00050000-5547-2dc9-afb9-ae89019d3e5d	8331	Suhor
00050000-5547-2dc9-c930-59e94c846dad	2233	Sv. Ana v Slovenskih goricah
00050000-5547-2dc9-bd4e-58909a9a5d98	2235	Sv. Trojica v Slovenskih goricah
00050000-5547-2dc9-6b4b-a8ec9e056b3c	2353	Sveti Duh na Ostrem Vrhu
00050000-5547-2dc9-d81e-6f0d41690576	9244	Sveti Jurij ob Ščavnici
00050000-5547-2dc9-d542-ad2447b0b5d8	3264	Sveti Štefan
00050000-5547-2dc9-38e0-42f50367fd60	2258	Sveti Tomaž
00050000-5547-2dc9-ecd7-fa3fc336744f	9204	Šalovci
00050000-5547-2dc9-7624-ea1fb917d0e5	5261	Šempas
00050000-5547-2dc9-0dc5-3deb9da8b6c8	5290	Šempeter pri Gorici
00050000-5547-2dc9-2a27-9c953c6dc07f	3311	Šempeter v Savinjski dolini
00050000-5547-2dc9-f11c-7483f989d97d	4208	Šenčur
00050000-5547-2dc9-47d7-90ef860d54fe	2212	Šentilj v Slovenskih goricah
00050000-5547-2dc9-a256-4b4de6e2df2f	8297	Šentjanž
00050000-5547-2dc9-b100-2bc60f5dc201	2373	Šentjanž pri Dravogradu
00050000-5547-2dc9-df00-ecc980576728	8310	Šentjernej
00050000-5547-2dc9-8d5b-9e69c912f3b0	3230	Šentjur
00050000-5547-2dc9-38fb-700ff42bdf9a	3271	Šentrupert
00050000-5547-2dc9-67d4-401825c92cd2	8232	Šentrupert
00050000-5547-2dc9-8da1-e4132ccdecf4	1296	Šentvid pri Stični
00050000-5547-2dc9-5554-97416edec042	8275	Škocjan
00050000-5547-2dc9-d3c8-845b7f24e14c	6281	Škofije
00050000-5547-2dc9-8e9a-93064404a565	4220	Škofja Loka
00050000-5547-2dc9-2c3a-575ee09c1db5	3211	Škofja vas
00050000-5547-2dc9-2f73-44c72ebb4379	1291	Škofljica
00050000-5547-2dc9-f939-9b54fa152b1d	6274	Šmarje
00050000-5547-2dc9-590b-2695c7b314d6	1293	Šmarje - Sap
00050000-5547-2dc9-0ead-dd424665a67e	3240	Šmarje pri Jelšah
00050000-5547-2dc9-bc24-811923b6e1e7	8220	Šmarješke Toplice
00050000-5547-2dc9-7842-a1f1e4e6d765	2315	Šmartno na Pohorju
00050000-5547-2dc9-f4e3-8c98c9f37186	3341	Šmartno ob Dreti
00050000-5547-2dc9-b0ef-c2f50a73bb4c	3327	Šmartno ob Paki
00050000-5547-2dc9-7162-3037014633ad	1275	Šmartno pri Litiji
00050000-5547-2dc9-c118-88bc5fb26f7b	2383	Šmartno pri Slovenj Gradcu
00050000-5547-2dc9-d0bb-53f7003fd169	3201	Šmartno v Rožni dolini
00050000-5547-2dc9-a3a3-b24483b2b1e1	3325	Šoštanj
00050000-5547-2dc9-77e5-1acbf57e38b8	6222	Štanjel
00050000-5547-2dc9-7108-83f352eca38a	3220	Štore
00050000-5547-2dc9-7362-c548d3bfa8a0	3304	Tabor
00050000-5547-2dc9-038c-c9e4e5e0585a	3221	Teharje
00050000-5547-2dc9-5d2d-286cb3f376b5	9251	Tišina
00050000-5547-2dc9-7d51-097d1e8786bf	5220	Tolmin
00050000-5547-2dc9-f557-f561f796fedf	3326	Topolšica
00050000-5547-2dc9-b732-89c9b70cca70	2371	Trbonje
00050000-5547-2dc9-971d-43c14789fcff	1420	Trbovlje
00050000-5547-2dc9-3fea-4b0fd72d0722	8231	Trebelno 
00050000-5547-2dc9-300c-456dbd23a552	8210	Trebnje
00050000-5547-2dc9-34a2-ff6b147809c1	5252	Trnovo pri Gorici
00050000-5547-2dc9-9b26-ffa76a39b280	2254	Trnovska vas
00050000-5547-2dc9-4d2a-6d84c3833e13	1222	Trojane
00050000-5547-2dc9-a5e0-658d00157810	1236	Trzin
00050000-5547-2dc9-784a-442ebb03767d	4290	Tržič
00050000-5547-2dc9-2efc-d69b2e861c2e	8295	Tržišče
00050000-5547-2dc9-26b1-9a99d361da1f	1311	Turjak
00050000-5547-2dc9-68f9-1e91228935f0	9224	Turnišče
00050000-5547-2dc9-190e-db9c14d4a5c0	8323	Uršna sela
00050000-5547-2dc9-f0a7-cac4edaebcbf	1252	Vače
00050000-5547-2dc9-7b48-87484a134473	3320	Velenje 
00050000-5547-2dc9-7819-9931e3796bb5	3322	Velenje - poštni predali
00050000-5547-2dc9-b2f4-93eb1cf4cc7b	8212	Velika Loka
00050000-5547-2dc9-2cd5-f64c1c092635	2274	Velika Nedelja
00050000-5547-2dc9-e1e8-4d7eef152c8e	9225	Velika Polana
00050000-5547-2dc9-2b88-187259f659b6	1315	Velike Lašče
00050000-5547-2dc9-cc9a-a33d8b655e44	8213	Veliki Gaber
00050000-5547-2dc9-2926-8e6efe767ed3	9241	Veržej
00050000-5547-2dc9-f3c4-c98d99888db5	1312	Videm - Dobrepolje
00050000-5547-2dc9-e575-af54cf24cc18	2284	Videm pri Ptuju
00050000-5547-2dc9-4bb5-5ce540e6a104	8344	Vinica
00050000-5547-2dc9-d6a0-3b9054fedc25	5271	Vipava
00050000-5547-2dc9-c316-16c09fd4e5cd	4212	Visoko
00050000-5547-2dc9-d42e-7e0f15478347	1294	Višnja Gora
00050000-5547-2dc9-7274-df7531b74ae8	3205	Vitanje
00050000-5547-2dc9-d8ea-4b4064c14238	2255	Vitomarci
00050000-5547-2dc9-c22e-de7c0c7c3326	1217	Vodice
00050000-5547-2dc9-6b15-7df475e607b7	3212	Vojnik\t
00050000-5547-2dc9-ff7c-75357173f320	5293	Volčja Draga
00050000-5547-2dc9-f59d-486529492295	2232	Voličina
00050000-5547-2dc9-4e24-92d779a33c2d	3305	Vransko
00050000-5547-2dc9-1035-15c7af4fb3bc	6217	Vremski Britof
00050000-5547-2dc9-e82b-b362e6a73673	1360	Vrhnika
00050000-5547-2dc9-9c78-4b1449628180	2365	Vuhred
00050000-5547-2dc9-b2dd-e9060540a69b	2367	Vuzenica
00050000-5547-2dc9-0424-8426f71628f3	8292	Zabukovje 
00050000-5547-2dc9-7ba8-4d2314be7f23	1410	Zagorje ob Savi
00050000-5547-2dc9-8ddd-29ed87409dee	1303	Zagradec
00050000-5547-2dc9-3b04-2ac05d21be74	2283	Zavrč
00050000-5547-2dc9-b0b9-1d55857e389e	8272	Zdole 
00050000-5547-2dc9-5285-1733d2a00703	4201	Zgornja Besnica
00050000-5547-2dc9-8c1b-f95db3742a24	2242	Zgornja Korena
00050000-5547-2dc9-2419-60614a935ef5	2201	Zgornja Kungota
00050000-5547-2dc9-f847-d1de270e7978	2316	Zgornja Ložnica
00050000-5547-2dc9-614f-d28154d99e07	2314	Zgornja Polskava
00050000-5547-2dc9-0816-1b1d7bce4c26	2213	Zgornja Velka
00050000-5547-2dc9-5178-961fdb3e17e5	4247	Zgornje Gorje
00050000-5547-2dc9-5c8c-3aec9e2c171d	4206	Zgornje Jezersko
00050000-5547-2dc9-2b0f-5db118e54d7b	2285	Zgornji Leskovec
00050000-5547-2dc9-9f5a-8744f7bdf206	1432	Zidani Most
00050000-5547-2dc9-fa43-6345aef25d85	3214	Zreče
00050000-5547-2dc9-258e-46e52e62362b	4209	Žabnica
00050000-5547-2dc9-bf7c-1f6db0f44785	3310	Žalec
00050000-5547-2dc9-4645-acb9c4a7f6d7	4228	Železniki
00050000-5547-2dc9-0252-fd22c72545e8	2287	Žetale
00050000-5547-2dc9-7b44-21c29505016e	4226	Žiri
00050000-5547-2dc9-b10d-ac4135c7498a	4274	Žirovnica
00050000-5547-2dc9-fe5d-54a8dbe9c66a	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 1876622)
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
-- TOC entry 2642 (class 0 OID 1876445)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1876511)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1876634)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1876739)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1876783)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1876663)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1876607)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1876597)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1876773)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1876729)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 1876311)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5547-2dca-60b6-62e9f7f8fe70	00010000-5547-2dca-820b-78a65a5b7b4f	2015-05-04 10:28:58	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvtVe9shA0zGO.fzOvArzbtWfMN036n.";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 1876672)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1876351)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5547-2dca-c501-b05d8aef57b7	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5547-2dca-d3ea-6d62038bf8b4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5547-2dca-5ab7-944f972db612	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5547-2dca-4b47-80c4a1e13376	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5547-2dca-a91f-88acf539021a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5547-2dca-4f99-379ac98d7c42	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 1876334)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5547-2dca-60b6-62e9f7f8fe70	00020000-5547-2dca-4b47-80c4a1e13376
00010000-5547-2dca-820b-78a65a5b7b4f	00020000-5547-2dca-4b47-80c4a1e13376
\.


--
-- TOC entry 2668 (class 0 OID 1876686)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 1876628)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1876578)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 1876410)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1876584)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1876764)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1876480)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1876320)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5547-2dca-820b-78a65a5b7b4f	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROXxSIzEZTkLUSNn9FzYPGQzTEuB.I/4S	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5547-2dca-60b6-62e9f7f8fe70	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 1876814)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1876526)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 1876655)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1876721)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1876554)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1876804)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 1876711)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 1876375)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 1876853)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 1876846)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 1876763)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 1876544)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 1876577)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 1876506)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 1876707)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 1876524)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 1876571)
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
-- TOC entry 2365 (class 2606 OID 1876620)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 1876647)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 1876478)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 1876384)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 1876442)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 1876408)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 1876364)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 1876349)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 1876653)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 1876685)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 1876800)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 1876435)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 1876466)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 1876626)
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
-- TOC entry 2299 (class 2606 OID 1876456)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 1876515)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 1876638)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 1876745)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 1876788)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 1876670)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 1876611)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 1876602)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 1876782)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 1876736)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 1876319)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 1876676)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 1876338)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 1876358)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 1876694)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 1876633)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 1876583)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 1876415)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 1876593)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 1876772)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 1876491)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 1876332)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 1876828)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 1876530)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 1876661)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 1876727)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 1876566)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 1876813)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 1876720)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 1876551)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 1876437)
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
-- TOC entry 2378 (class 1259 OID 1876654)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 1876640)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 1876639)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 1876531)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 1876710)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 1876708)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 1876709)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 1876801)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 1876802)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 1876803)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 1876831)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 1876830)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 1876829)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 1876493)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 1876492)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 1876444)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 1876443)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 1876677)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 1876572)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 1876365)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 1876366)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 1876697)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 1876696)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 1876695)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 1876516)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 1876518)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 1876517)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 1876606)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 1876604)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 1876603)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 1876605)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 1876339)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 1876340)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 1876662)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 1876627)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 1876737)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 1876738)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 1876458)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 1876457)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 1876459)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 1876746)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 1876747)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 1876856)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 1876855)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 1876858)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 1876854)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 1876857)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 1876728)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 1876615)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 1876614)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 1876612)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 1876613)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2246 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 1876848)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 1876847)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 1876525)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 1876386)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 1876385)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 1876416)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 1876417)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 1876596)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 1876595)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 1876594)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 1876553)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 1876549)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 1876546)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 1876547)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 1876545)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 1876550)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 1876548)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 1876436)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 1876507)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1876509)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 1876508)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 1876510)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 1876621)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 1876409)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 1876479)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2257 (class 1259 OID 1876333)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2386 (class 1259 OID 1876671)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2266 (class 1259 OID 1876350)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2249 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 1876467)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 1876789)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 1876359)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 1876552)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 1876989)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 1876974)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 1876979)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 1876999)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 1876969)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 1876994)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 1876984)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 1876904)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 1877084)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 1877079)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 1877074)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 1876964)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 1877124)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 1877114)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1877119)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 1877064)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 1877159)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 1877164)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 1877169)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 1877184)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 1877179)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 1877174)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 1876939)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 1876934)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 1876914)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 1876909)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 1876889)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 1877094)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 1877004)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 1876869)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 1876874)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 1877109)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 1877104)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 1877099)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 1876944)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 1876954)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 1876949)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 1877039)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 1877029)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 1877024)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 1877034)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 1876859)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 1876864)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 1877089)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 1877069)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 1877134)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 1877139)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 1876924)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 1876919)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 1876929)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 1877144)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 1877149)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 1877209)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 1877204)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 1877219)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 1877199)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 1877214)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 1877129)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 1877059)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 1877054)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 1877044)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 1877049)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 1877194)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 1877189)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 1876959)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1877154)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 1876884)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 1876879)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 1876894)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 1876899)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 1877019)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 1877014)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 1877009)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-04 10:28:59 CEST

--
-- PostgreSQL database dump complete
--

