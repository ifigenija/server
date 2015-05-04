--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-01 21:12:30 CEST

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
-- TOC entry 179 (class 1259 OID 1820119)
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
-- TOC entry 225 (class 1259 OID 1820601)
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
-- TOC entry 224 (class 1259 OID 1820584)
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
-- TOC entry 217 (class 1259 OID 1820500)
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
-- TOC entry 193 (class 1259 OID 1820284)
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
-- TOC entry 196 (class 1259 OID 1820325)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1820246)
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
-- TOC entry 212 (class 1259 OID 1820450)
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
-- TOC entry 191 (class 1259 OID 1820271)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1820319)
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
-- TOC entry 201 (class 1259 OID 1820368)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1820393)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1820220)
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
-- TOC entry 180 (class 1259 OID 1820128)
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
-- TOC entry 181 (class 1259 OID 1820139)
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
-- TOC entry 184 (class 1259 OID 1820190)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1820093)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1820112)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1820400)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1820430)
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
-- TOC entry 221 (class 1259 OID 1820542)
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
-- TOC entry 183 (class 1259 OID 1820170)
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
-- TOC entry 186 (class 1259 OID 1820212)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1820374)
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
-- TOC entry 185 (class 1259 OID 1820197)
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
-- TOC entry 190 (class 1259 OID 1820263)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1820386)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1820491)
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
-- TOC entry 220 (class 1259 OID 1820535)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1820415)
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
-- TOC entry 200 (class 1259 OID 1820359)
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
-- TOC entry 199 (class 1259 OID 1820349)
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
-- TOC entry 219 (class 1259 OID 1820525)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1820481)
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
-- TOC entry 173 (class 1259 OID 1820063)
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
-- TOC entry 172 (class 1259 OID 1820061)
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
-- TOC entry 209 (class 1259 OID 1820424)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1820103)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1820086)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1820438)
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
-- TOC entry 203 (class 1259 OID 1820380)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1820330)
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
-- TOC entry 182 (class 1259 OID 1820162)
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
-- TOC entry 198 (class 1259 OID 1820336)
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
-- TOC entry 218 (class 1259 OID 1820516)
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
-- TOC entry 188 (class 1259 OID 1820232)
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
-- TOC entry 174 (class 1259 OID 1820072)
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
-- TOC entry 223 (class 1259 OID 1820566)
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
-- TOC entry 192 (class 1259 OID 1820278)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1820407)
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
-- TOC entry 214 (class 1259 OID 1820473)
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
-- TOC entry 194 (class 1259 OID 1820306)
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
-- TOC entry 222 (class 1259 OID 1820556)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1820463)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1820066)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 1820119)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1820601)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 1820584)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1820500)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1820284)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1820325)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1820246)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5543-d01d-1a56-59405e6eabb7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5543-d01d-39be-fc81fe3e7154	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5543-d01d-6126-3f3640c5c37e	AL	ALB	008	Albania 	Albanija	\N
00040000-5543-d01d-2177-58e70e7a3e72	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5543-d01d-6dd0-bf3b743988d5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5543-d01d-ed7d-b1d6d18b8cea	AD	AND	020	Andorra 	Andora	\N
00040000-5543-d01d-2b98-db0ca7ad4ad3	AO	AGO	024	Angola 	Angola	\N
00040000-5543-d01d-3971-7a77878af7be	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5543-d01d-5ab9-0d9ea9f932a4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5543-d01d-f9ef-a4b4c23f3d45	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5543-d01d-73e2-2c62eea033ce	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5543-d01e-6d54-69ba0b8b6bcc	AM	ARM	051	Armenia 	Armenija	\N
00040000-5543-d01e-3e5b-a0fb020f6548	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5543-d01e-971a-5ed566d4d70d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5543-d01e-2fca-bcef02dcb00e	AT	AUT	040	Austria 	Avstrija	\N
00040000-5543-d01e-542a-ac4e3c0a2339	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5543-d01e-16fa-f0a54fc69096	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5543-d01e-21c3-2b5626d67929	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5543-d01e-655b-3baf8c9dd220	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5543-d01e-3ea0-4ac1ec02cc29	BB	BRB	052	Barbados 	Barbados	\N
00040000-5543-d01e-a146-41f9ac8a9902	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5543-d01e-d391-71016ad2d979	BE	BEL	056	Belgium 	Belgija	\N
00040000-5543-d01e-e3a2-3a24eb9d4662	BZ	BLZ	084	Belize 	Belize	\N
00040000-5543-d01e-2148-16e1c705c94a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5543-d01e-eb11-4376a5cad9f7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5543-d01e-aecb-2e1bff9dd1bd	BT	BTN	064	Bhutan 	Butan	\N
00040000-5543-d01e-aea9-a1d2c59e5fe2	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5543-d01e-fbd5-bd648d19846b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5543-d01e-ca0f-1d7f573dbd97	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5543-d01e-8936-137ffa6776ea	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5543-d01e-4e1e-33d7e169dbb0	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5543-d01e-59cd-f435a77786ca	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5543-d01e-60a8-873c306bb0e0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5543-d01e-cff7-7fd07231a6f5	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5543-d01e-c345-f0d179754585	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5543-d01e-5c71-985126001c1b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5543-d01e-8720-e224bb1d533d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5543-d01e-342d-c468558500c9	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5543-d01e-0de6-b121eff75b22	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5543-d01e-d008-c83410e6a145	CA	CAN	124	Canada 	Kanada	\N
00040000-5543-d01e-ec4d-6c882a9bd228	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5543-d01e-cceb-617411882722	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5543-d01e-7503-edb6d37091a2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5543-d01e-3979-8b3c1094835a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5543-d01e-2d00-ec2834aa1f3c	CL	CHL	152	Chile 	Čile	\N
00040000-5543-d01e-1f27-ec700d3ed9b7	CN	CHN	156	China 	Kitajska	\N
00040000-5543-d01e-8fca-2d59e6a1f60b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5543-d01e-8c7f-2251979a8343	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5543-d01e-47bd-a423bd76eb0f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5543-d01e-bde5-86ff79be4441	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5543-d01e-29ac-e4c9827d23c3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5543-d01e-e0e7-d138c5d3e16d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5543-d01e-0a29-1a6ace7a76dc	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5543-d01e-04fb-7c8fa3962c50	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5543-d01e-f430-b6cbca9f7b9b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5543-d01e-b642-8c1924c9ff2e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5543-d01e-9aa5-f2fc5289b3e3	CU	CUB	192	Cuba 	Kuba	\N
00040000-5543-d01e-0ee5-21c835b28e67	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5543-d01e-cb86-d46e0da76535	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5543-d01e-7c43-7d99e03516f5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5543-d01e-717f-2b93ef10fed6	DK	DNK	208	Denmark 	Danska	\N
00040000-5543-d01e-a4bf-e6366fa8cde0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5543-d01e-4733-c225a407b7b9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5543-d01e-7016-5c8c56425ae7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5543-d01e-0e4b-6e1616ae7103	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5543-d01e-edaa-34bb34f14453	EG	EGY	818	Egypt 	Egipt	\N
00040000-5543-d01e-9b91-32d2e6166bed	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5543-d01e-b67d-4870a6e333a6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5543-d01e-3228-d37236d8d2aa	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5543-d01e-9ba1-4fd4ef81897f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5543-d01e-37b4-5813d3ac9c48	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5543-d01e-0ce7-92e3b77cec9f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5543-d01e-bc36-c665a552da6d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5543-d01e-9c83-96ad2bcf21f1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5543-d01e-f59a-2aa13a058422	FI	FIN	246	Finland 	Finska	\N
00040000-5543-d01e-f3ee-a676ebf8f6f4	FR	FRA	250	France 	Francija	\N
00040000-5543-d01e-2ce0-86e8a7bf1ced	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5543-d01e-879a-94a7edeca906	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5543-d01e-13dc-1ac6fad51759	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5543-d01e-0a2a-c39da3f0fb5d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5543-d01e-fb7d-879ed12ec610	GA	GAB	266	Gabon 	Gabon	\N
00040000-5543-d01e-bcb3-d56287c933bf	GM	GMB	270	Gambia 	Gambija	\N
00040000-5543-d01e-2072-1ef946a8c3f0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5543-d01e-338d-592e48794289	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5543-d01e-9604-d9004072e60b	GH	GHA	288	Ghana 	Gana	\N
00040000-5543-d01e-ed8c-8093907e8a24	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5543-d01e-efd7-5fe802128408	GR	GRC	300	Greece 	Grčija	\N
00040000-5543-d01e-bc9b-eb4ec38286fa	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5543-d01e-bad1-30442324dca4	GD	GRD	308	Grenada 	Grenada	\N
00040000-5543-d01e-4417-f708e0619e82	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5543-d01e-3c4d-15bb484374cf	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5543-d01e-199f-dd743c7b407a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5543-d01e-a574-6568d2899dd2	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5543-d01e-ab21-d70c54297f6d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5543-d01e-b0a4-71856d71489e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5543-d01e-6880-50a71da0325d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5543-d01e-2612-9ad4770efaf8	HT	HTI	332	Haiti 	Haiti	\N
00040000-5543-d01e-ac98-5f66791d6a90	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5543-d01e-d157-5db71054d217	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5543-d01e-5a6b-f32d63609b24	HN	HND	340	Honduras 	Honduras	\N
00040000-5543-d01e-209d-5a5165ba39d2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5543-d01e-1fed-3b624d617dfa	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5543-d01e-94bb-c69230d1c7a0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5543-d01e-95e7-129de4f751c9	IN	IND	356	India 	Indija	\N
00040000-5543-d01e-e419-bd0acee30a67	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5543-d01e-054d-dc4e2ea18f95	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5543-d01e-0138-48fcc4a2b886	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5543-d01e-0da9-bc694a13ba53	IE	IRL	372	Ireland 	Irska	\N
00040000-5543-d01e-835f-7e1e52a8346a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5543-d01e-f486-0e89e131168a	IL	ISR	376	Israel 	Izrael	\N
00040000-5543-d01e-9aaf-b03fb7b3984a	IT	ITA	380	Italy 	Italija	\N
00040000-5543-d01e-5b9e-9876abd4c813	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5543-d01e-0ba4-533cfe951051	JP	JPN	392	Japan 	Japonska	\N
00040000-5543-d01e-f41c-107b64138973	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5543-d01e-587f-19b51bafb495	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5543-d01e-951f-626c9bef5848	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5543-d01e-f576-51f61b0c55ef	KE	KEN	404	Kenya 	Kenija	\N
00040000-5543-d01e-db3c-17d98a7256bb	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5543-d01e-ce0c-39b116b73bdc	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5543-d01e-59b4-63a4c2c94927	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5543-d01e-56fb-7874f9de0265	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5543-d01e-897b-49b924954d9e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5543-d01e-8020-0890a38eaec5	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5543-d01e-8da6-4a12b2561ce6	LV	LVA	428	Latvia 	Latvija	\N
00040000-5543-d01e-a367-3ca35e504314	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5543-d01e-ac8a-62fcade5d4e5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5543-d01e-71fe-f765ac0a03d0	LR	LBR	430	Liberia 	Liberija	\N
00040000-5543-d01e-d4ef-a25ac2bd4e56	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5543-d01e-d53e-f90808e22d2b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5543-d01e-7b50-ab0484af3d5e	LT	LTU	440	Lithuania 	Litva	\N
00040000-5543-d01e-96fc-e829344f7520	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5543-d01e-169d-bcf3fe688500	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5543-d01e-b0af-860da490dab1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5543-d01e-7493-ed7bc8364d17	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5543-d01e-6a35-d7f339a5b145	MW	MWI	454	Malawi 	Malavi	\N
00040000-5543-d01e-39b8-93020f149466	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5543-d01e-cad5-a7bc8f021c89	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5543-d01e-eb41-d9e96f3050a3	ML	MLI	466	Mali 	Mali	\N
00040000-5543-d01e-f3f9-06bb688e9ecf	MT	MLT	470	Malta 	Malta	\N
00040000-5543-d01e-a71e-3780570d2045	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5543-d01e-b54f-51e81e136c07	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5543-d01e-5133-e16a28a846c4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5543-d01e-047a-55a3225c7ba7	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5543-d01e-3317-91ca6d05a7bc	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5543-d01e-9e37-a6a5cd2517c9	MX	MEX	484	Mexico 	Mehika	\N
00040000-5543-d01e-597d-ac284185616b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5543-d01e-dc3f-b5ed5e98eb6a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5543-d01e-b14a-4c736ffcc309	MC	MCO	492	Monaco 	Monako	\N
00040000-5543-d01e-552a-8415fe9c231e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5543-d01e-abee-ece8c5e9cc69	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5543-d01e-c7d8-8fabf6e15399	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5543-d01e-16a9-a3bc49535785	MA	MAR	504	Morocco 	Maroko	\N
00040000-5543-d01e-37e6-7e814cefb389	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5543-d01e-c6e9-46b730ddbe8a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5543-d01e-dbf6-7ad60da782f7	NA	NAM	516	Namibia 	Namibija	\N
00040000-5543-d01e-f634-2b0e25bf5be8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5543-d01e-ff28-20b3b23bee02	NP	NPL	524	Nepal 	Nepal	\N
00040000-5543-d01e-b72a-72975bf5dfc9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5543-d01e-fb03-56a340d7c73e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5543-d01e-9e6d-cd40ec63fbab	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5543-d01e-d1ca-d9fba95e4d48	NE	NER	562	Niger 	Niger 	\N
00040000-5543-d01e-d68d-56d4b54d3af6	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5543-d01e-6191-d67275337041	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5543-d01e-da97-bb2e7075b300	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5543-d01e-4041-69a95da3b5fc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5543-d01e-8c0a-0a889bd90e87	NO	NOR	578	Norway 	Norveška	\N
00040000-5543-d01e-75ad-df27ac9513c9	OM	OMN	512	Oman 	Oman	\N
00040000-5543-d01e-84b0-4f9b5bdc5dc4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5543-d01e-36f1-bb6d0e8af6c2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5543-d01e-15c7-23c0e6a824d3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5543-d01e-dda4-bd3da00a9f19	PA	PAN	591	Panama 	Panama	\N
00040000-5543-d01e-e02e-0b81a8b534e3	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5543-d01e-b1be-f9e30fb8e075	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5543-d01e-f664-a81fbe378dfd	PE	PER	604	Peru 	Peru	\N
00040000-5543-d01e-f479-53b8e9125007	PH	PHL	608	Philippines 	Filipini	\N
00040000-5543-d01e-8b23-e7db519a1f40	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5543-d01e-4f52-c08cbdc374c6	PL	POL	616	Poland 	Poljska	\N
00040000-5543-d01e-7700-42e5a6f5fe28	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5543-d01e-3b04-2f88d8539cec	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5543-d01e-731b-6414e84278cb	QA	QAT	634	Qatar 	Katar	\N
00040000-5543-d01e-5028-ff2c92857b55	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5543-d01e-7cf8-b78ba9719781	RO	ROU	642	Romania 	Romunija	\N
00040000-5543-d01e-1c9d-0d9a32944f8a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5543-d01e-e03a-39a6b270efcf	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5543-d01e-d2f7-e682ee3f5e43	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5543-d01e-f3e6-67415655a1f5	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5543-d01e-4697-2f840223ad0e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5543-d01e-58ab-03ad02a4edb6	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5543-d01e-5d42-380cc343c444	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5543-d01e-5a4a-30c5c3878862	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5543-d01e-bc70-d1e9132e345f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5543-d01e-1889-b750c1e0e3d8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5543-d01e-0fec-09179c4354bd	SM	SMR	674	San Marino 	San Marino	\N
00040000-5543-d01e-b8b4-f9ce80ceb4bd	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5543-d01e-766a-ba82f90fceae	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5543-d01e-350a-95ae99a2931f	SN	SEN	686	Senegal 	Senegal	\N
00040000-5543-d01e-25ad-0657a3c12b27	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5543-d01e-4eac-cedb3a5e4f43	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5543-d01e-12ac-737e4a8f1d06	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5543-d01e-5af4-73aae24a4853	SG	SGP	702	Singapore 	Singapur	\N
00040000-5543-d01e-025e-181cc5d8efe4	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5543-d01e-e64a-79fad498d474	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5543-d01e-6fa2-77638ac7a690	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5543-d01e-eaa6-56bd7d9f8205	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5543-d01e-88e8-f1d1860804c3	SO	SOM	706	Somalia 	Somalija	\N
00040000-5543-d01e-ac37-d8562d4047dc	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5543-d01e-d454-2b6400362bef	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5543-d01e-2b9b-3eccbc6ba0f9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5543-d01e-4cac-8f4b621bcde9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5543-d01e-fdf1-2d62c75775e8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5543-d01e-909b-49bc4da52c3a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5543-d01e-6999-6135952f3f18	SR	SUR	740	Suriname 	Surinam	\N
00040000-5543-d01e-94ad-0d926a4f51da	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5543-d01e-4963-94c704a73e52	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5543-d01e-600c-121764b3fd82	SE	SWE	752	Sweden 	Švedska	\N
00040000-5543-d01e-737a-e5f07c473914	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5543-d01e-c92a-f4d35f9ee980	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5543-d01e-cc02-b7e55dc01d73	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5543-d01e-e7df-4731e418fa3a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5543-d01e-52ee-ff7d77f68d43	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5543-d01e-3d0d-041e67ae880c	TH	THA	764	Thailand 	Tajska	\N
00040000-5543-d01e-8782-6b297bce98e7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5543-d01e-bcb1-739138d427bb	TG	TGO	768	Togo 	Togo	\N
00040000-5543-d01e-525f-1a704013aea0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5543-d01e-05a6-ff858f251192	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5543-d01e-ac52-e2a52b9da097	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5543-d01e-ec95-706a062f37eb	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5543-d01e-bf06-b605dd1b3bab	TR	TUR	792	Turkey 	Turčija	\N
00040000-5543-d01e-9495-ccdcaeefe615	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5543-d01e-6edf-2003f4c4c6e8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5543-d01e-acc8-39dbaf24b085	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5543-d01e-3db8-7f5b44f07144	UG	UGA	800	Uganda 	Uganda	\N
00040000-5543-d01e-6d0c-b38eff586a3c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5543-d01e-b732-6e4a9d13d792	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5543-d01e-ad02-e85a895fb169	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5543-d01e-98cb-56e1d3b38cbe	US	USA	840	United States 	Združene države Amerike	\N
00040000-5543-d01e-ee1f-0d2600326b87	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5543-d01e-1a20-5b5cf6f863ad	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5543-d01e-7292-13a44577a58c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5543-d01e-a95a-dd84ac4da636	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5543-d01e-f517-d051ef394d56	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5543-d01e-d2c9-6b3f8bbab062	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5543-d01e-d960-7c2195a82509	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5543-d01e-744f-17888ca02e93	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5543-d01e-1e90-09e25c1266c5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5543-d01e-2601-20fc6dc30629	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5543-d01e-bc37-692d670d9032	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5543-d01e-dd49-77ce8073a8c8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5543-d01e-8462-deab8ec8fcde	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 1820450)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1820271)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1820319)
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
-- TOC entry 2658 (class 0 OID 1820368)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1820393)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1820220)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5543-d01e-561a-cc2b36259a45	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5543-d01e-17e0-f1ab424fd854	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5543-d01e-b759-1147cc9eeadf	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5543-d01e-7544-5f1445518b7c	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5543-d01e-a441-4a3b932962e6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5543-d01e-ed41-573f9a381129	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5543-d01e-d113-96467166c40d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5543-d01e-9ef8-0d23c88c8144	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5543-d01e-c2be-bf462c498638	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5543-d01e-226e-3e3649bf9ff2	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 1820128)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5543-d01e-a94e-ef9ecf5bb4bf	00000000-5543-d01e-a441-4a3b932962e6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5543-d01e-cd0a-ce9f6eb85443	00000000-5543-d01e-a441-4a3b932962e6	00010000-5543-d01e-29c0-1269c0e2512e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5543-d01e-cb49-fd78ed95cd5b	00000000-5543-d01e-ed41-573f9a381129	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 1820139)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1820190)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 1820093)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5543-d01e-554d-009d2876b4d2	Ass-read	Aaa (User,Role,Permission) - branje	f
00030000-5543-d01e-e956-ed9c71f37c62	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5543-d01e-7efa-cb4fe9a59e24	Abonma-read	Abonma - branje	f
00030000-5543-d01e-71aa-e0a05ec9cd30	Abonma-write	Abonma - spreminjanje	f
00030000-5543-d01e-03ae-9ae88620e6d8	Alternacija-read	Alternacija - branje	f
00030000-5543-d01e-87e4-1e3c64fccfe3	Alternacija-write	Alternacija - spreminjanje	f
00030000-5543-d01e-7195-284ade938202	Arhivalija-read	Arhivalija - branje	f
00030000-5543-d01e-04a3-6076ec7dd0c0	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5543-d01e-3d4b-b263cdbbd329	Besedilo-read	Besedilo - branje	f
00030000-5543-d01e-89ba-f6c6a750785e	Besedilo-write	Besedilo - spreminjanje	f
00030000-5543-d01e-831e-f8604d0e45bb	DogodekIzven-read	DogodekIzven - branje	f
00030000-5543-d01e-0119-735541935102	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5543-d01e-50fa-baa5d23e2ad2	Dogodek-read	Dogodek - branje	f
00030000-5543-d01e-24bd-5a3428ffef24	Dogodek-write	Dogodek - spreminjanje	f
00030000-5543-d01e-427b-d0515a748d55	Drzava-read	Drzava - branje	f
00030000-5543-d01e-7ed6-4f581d9996f6	Drzava-write	Drzava - spreminjanje	f
00030000-5543-d01e-7967-c61e4a32a281	Funkcija-read	Funkcija - branje	f
00030000-5543-d01e-2297-6ba59302d01c	Funkcija-write	Funkcija - spreminjanje	f
00030000-5543-d01e-9bdf-868da1faec18	Gostovanje-read	Gostovanje - branje	f
00030000-5543-d01e-91e0-86cb73c1560b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5543-d01e-2c90-e765c62ee0be	Gostujoca-read	Gostujoca - branje	f
00030000-5543-d01e-e174-1f26c75cd790	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5543-d01e-9715-8c9c7230fcbe	Kupec-read	Kupec - branje	f
00030000-5543-d01e-f8ba-fa87d5a56be2	Kupec-write	Kupec - spreminjanje	f
00030000-5543-d01e-326c-9398c8d74dd6	NacinPlacina-read	NacinPlacina - branje	f
00030000-5543-d01e-7f47-e31281bcd44e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5543-d01e-9743-1359383fd82e	Option-read	Option - branje	f
00030000-5543-d01e-5b7d-1abca0b9e5ec	Option-write	Option - spreminjanje	f
00030000-5543-d01e-c57b-6f006d60c9b4	OptionValue-read	OptionValue - branje	f
00030000-5543-d01e-00b4-97ac8bc89b39	OptionValue-write	OptionValue - spreminjanje	f
00030000-5543-d01e-e9ff-ebaa3ad7488c	Oseba-read	Oseba - branje	f
00030000-5543-d01e-09b3-02040d62eb11	Oseba-write	Oseba - spreminjanje	f
00030000-5543-d01e-99d6-20d8974d4fb2	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5543-d01e-24a8-13c2f5f9d5ec	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5543-d01e-7a5e-c8543d4b610b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5543-d01e-fa4b-f2556e313500	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5543-d01e-5c53-8e1f345f6762	Pogodba-read	Pogodba - branje	f
00030000-5543-d01e-16b6-3b3a816dbee0	Pogodba-write	Pogodba - spreminjanje	f
00030000-5543-d01e-30aa-9cf7c8c88261	Popa-read	Popa - branje	f
00030000-5543-d01e-56e4-cf0178a2a3b8	Popa-write	Popa - spreminjanje	f
00030000-5543-d01e-8a43-867799c873c2	Posta-read	Posta - branje	f
00030000-5543-d01e-b101-2a00819999ba	Posta-write	Posta - spreminjanje	f
00030000-5543-d01e-6d7d-0b0188efd505	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5543-d01e-d79f-9feb02b4e909	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5543-d01e-3a0a-56466234d2a5	PostniNaslov-read	PostniNaslov - branje	f
00030000-5543-d01e-b20a-61c13841ccc1	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5543-d01e-d50e-f9b10cbe4818	Predstava-read	Predstava - branje	f
00030000-5543-d01e-f19a-968778803444	Predstava-write	Predstava - spreminjanje	f
00030000-5543-d01e-eeee-24e81f2485b8	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5543-d01e-eb84-e665991569c2	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5543-d01e-d09b-3bc48778717e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5543-d01e-8af7-85c0c7267839	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5543-d01e-fd9a-d29359fc5ee8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5543-d01e-e7c3-80e4a3942f60	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5543-d01e-174f-80effe305b1e	Prostor-read	Prostor - branje	f
00030000-5543-d01e-2d33-cfb8029541c3	Prostor-write	Prostor - spreminjanje	f
00030000-5543-d01e-b09d-178f9f5b4c28	Racun-read	Racun - branje	f
00030000-5543-d01e-e42a-3992a0d63013	Racun-write	Racun - spreminjanje	f
00030000-5543-d01e-0a79-253b6a2c30f2	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5543-d01e-0c5d-72b1a43fe41b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5543-d01e-cad2-4f620fb1cdf1	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5543-d01e-6698-d0b73cc00c0b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5543-d01e-b604-6ca2b363355f	Rekvizit-read	Rekvizit - branje	f
00030000-5543-d01e-a940-4cd7e9e8ce07	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5543-d01e-a9c1-3fc45e3d0b20	Rezervacija-read	Rezervacija - branje	f
00030000-5543-d01e-1156-3dcea471bfde	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5543-d01e-31f6-9fdde6e7b9aa	SedezniRed-read	SedezniRed - branje	f
00030000-5543-d01e-bed1-a8e437ad3a91	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5543-d01e-4d97-840d84ae2354	Sedez-read	Sedez - branje	f
00030000-5543-d01e-e65d-1fb400fa51fd	Sedez-write	Sedez - spreminjanje	f
00030000-5543-d01e-a651-9282b499f2f0	Sezona-read	Sezona - branje	f
00030000-5543-d01e-230b-b72e78eeed35	Sezona-write	Sezona - spreminjanje	f
00030000-5543-d01e-3b8d-a148a4e97ed3	Telefonska-read	Telefonska - branje	f
00030000-5543-d01e-9ab2-756187d9d9b3	Telefonska-write	Telefonska - spreminjanje	f
00030000-5543-d01e-237d-51791cbb21da	TerminStoritve-read	TerminStoritve - branje	f
00030000-5543-d01e-8692-1a09fa5d298e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5543-d01e-e0f1-2b30d96ce152	TipFunkcije-read	TipFunkcije - branje	f
00030000-5543-d01e-7b46-79168259ca4e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5543-d01e-31bb-4ac4d165ba1b	Trr-read	Trr - branje	f
00030000-5543-d01e-4490-c679a14666c6	Trr-write	Trr - spreminjanje	f
00030000-5543-d01e-760b-85f7e1299f16	Uprizoritev-read	Uprizoritev - branje	f
00030000-5543-d01e-0c56-e43e5761deba	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5543-d01e-d04d-d8b3a9508177	Vaja-read	Vaja - branje	f
00030000-5543-d01e-3a12-4bd71bf5cdcc	Vaja-write	Vaja - spreminjanje	f
00030000-5543-d01e-9953-9c65556e4936	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5543-d01e-75d1-fc89dc459058	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5543-d01e-561a-f6ba07fc579a	Zaposlitev-read	Zaposlitev - branje	f
00030000-5543-d01e-e51f-6317b7842754	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5543-d01e-ff78-16f21ccc17c4	Zasedenost-read	Zasedenost - branje	f
00030000-5543-d01e-bf48-2de38b668de0	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5543-d01e-c916-939331691972	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5543-d01e-b2cc-ada189ac6f7a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5543-d01e-6cae-195114582336	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5543-d01e-7d7b-6ca90f535daa	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 1820112)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5543-d01e-6600-58c7e8a2eb47	00030000-5543-d01e-427b-d0515a748d55
00020000-5543-d01e-8bea-f6a8254301a1	00030000-5543-d01e-7ed6-4f581d9996f6
00020000-5543-d01e-8bea-f6a8254301a1	00030000-5543-d01e-427b-d0515a748d55
\.


--
-- TOC entry 2663 (class 0 OID 1820400)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 1820430)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1820542)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1820170)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1820212)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5543-d01d-1db6-c4f3a4fc430a	8341	Adlešiči
00050000-5543-d01d-7ce2-3f4c4dc2805e	5270	Ajdovščina
00050000-5543-d01d-9e6c-d8c758b8e090	6280	Ankaran/Ancarano
00050000-5543-d01d-5b94-b4059adaa3f1	9253	Apače
00050000-5543-d01d-6dfc-2d3582b108a0	8253	Artiče
00050000-5543-d01d-b646-19e509e09eef	4275	Begunje na Gorenjskem
00050000-5543-d01d-13e2-feec555406dd	1382	Begunje pri Cerknici
00050000-5543-d01d-c91c-41899176938b	9231	Beltinci
00050000-5543-d01d-02d0-53584fdd5900	2234	Benedikt
00050000-5543-d01d-b8b8-c5dcf124f077	2345	Bistrica ob Dravi
00050000-5543-d01d-cc75-227734a3a7d0	3256	Bistrica ob Sotli
00050000-5543-d01d-7858-e5dde6882bf9	8259	Bizeljsko
00050000-5543-d01d-0303-ef1ca525d01f	1223	Blagovica
00050000-5543-d01d-3330-a555f82c1c1c	8283	Blanca
00050000-5543-d01d-90af-5df00002998b	4260	Bled
00050000-5543-d01d-b5b4-f397361439ee	4273	Blejska Dobrava
00050000-5543-d01d-af8c-f5c7d720b4d8	9265	Bodonci
00050000-5543-d01d-c6dd-d71e4fb41879	9222	Bogojina
00050000-5543-d01d-b37c-6d211ca5af03	4263	Bohinjska Bela
00050000-5543-d01d-a957-c4ac06c15341	4264	Bohinjska Bistrica
00050000-5543-d01d-f196-f49a6ff59b55	4265	Bohinjsko jezero
00050000-5543-d01d-bbea-e88bb841323c	1353	Borovnica
00050000-5543-d01d-df9c-5b967c18fd20	8294	Boštanj
00050000-5543-d01d-10f7-2cb4555b9ad8	5230	Bovec
00050000-5543-d01d-b4c8-cb7fad68d7a5	5295	Branik
00050000-5543-d01d-928f-e9cbe0f91f4a	3314	Braslovče
00050000-5543-d01d-73b2-ec0263e1f45c	5223	Breginj
00050000-5543-d01d-66fe-81282cda0ef8	8280	Brestanica
00050000-5543-d01d-561c-b508ffd2e4ed	2354	Bresternica
00050000-5543-d01d-6150-825a54ec0c9c	4243	Brezje
00050000-5543-d01d-1eca-174b4569f7ce	1351	Brezovica pri Ljubljani
00050000-5543-d01d-f1b3-e077f793df8b	8250	Brežice
00050000-5543-d01d-7856-ff6d15044d82	4210	Brnik - Aerodrom
00050000-5543-d01d-4b88-8fe965964c16	8321	Brusnice
00050000-5543-d01d-8874-bc2ea77862cd	3255	Buče
00050000-5543-d01d-d2f5-589c23d01ef4	8276	Bučka 
00050000-5543-d01d-304d-03fd7a1c50db	9261	Cankova
00050000-5543-d01d-737f-1599df1a17d6	3000	Celje 
00050000-5543-d01d-8a41-f7b508390a17	3001	Celje - poštni predali
00050000-5543-d01d-a0bf-4f64b5ce302c	4207	Cerklje na Gorenjskem
00050000-5543-d01d-adcf-d21deba63532	8263	Cerklje ob Krki
00050000-5543-d01d-7327-2b3a6f601bf1	1380	Cerknica
00050000-5543-d01d-eab6-eff67b18e243	5282	Cerkno
00050000-5543-d01d-7058-ddb7356fac37	2236	Cerkvenjak
00050000-5543-d01d-f8f7-d1ff95895ef9	2215	Ceršak
00050000-5543-d01d-cca1-008c6a77d8d2	2326	Cirkovce
00050000-5543-d01d-915c-da5f20788e84	2282	Cirkulane
00050000-5543-d01d-b5a6-fe531d80d0e5	5273	Col
00050000-5543-d01d-79c4-59d612f2745d	8251	Čatež ob Savi
00050000-5543-d01d-3eb6-3c6cdb661c32	1413	Čemšenik
00050000-5543-d01d-adb3-6a7787d9279e	5253	Čepovan
00050000-5543-d01d-d2d0-37e4f69b19dd	9232	Črenšovci
00050000-5543-d01d-62a4-0135dd35ba95	2393	Črna na Koroškem
00050000-5543-d01d-ff96-f768e3467038	6275	Črni Kal
00050000-5543-d01d-b2c3-56bdfc939504	5274	Črni Vrh nad Idrijo
00050000-5543-d01d-3351-e48a1033d3f7	5262	Črniče
00050000-5543-d01d-f59d-dd3eb9e710cb	8340	Črnomelj
00050000-5543-d01d-bae5-1c074fc860f5	6271	Dekani
00050000-5543-d01d-e5fb-8d1981dbed9e	5210	Deskle
00050000-5543-d01d-964b-c5b715061738	2253	Destrnik
00050000-5543-d01d-452b-5a4c860ceea9	6215	Divača
00050000-5543-d01d-ce23-39117621f9c8	1233	Dob
00050000-5543-d01d-f6e0-ae3d3974275e	3224	Dobje pri Planini
00050000-5543-d01d-05f8-65640f8470e9	8257	Dobova
00050000-5543-d01d-b17b-4e77a03f18a8	1423	Dobovec
00050000-5543-d01d-d68f-5e7c62146872	5263	Dobravlje
00050000-5543-d01d-31cd-61371cccd33f	3204	Dobrna
00050000-5543-d01d-0965-ef637a8db54d	8211	Dobrnič
00050000-5543-d01d-aaad-d061dd61df00	1356	Dobrova
00050000-5543-d01d-5010-e357abb18f22	9223	Dobrovnik/Dobronak 
00050000-5543-d01d-b00e-4c5a622d32ed	5212	Dobrovo v Brdih
00050000-5543-d01d-e712-466feb54015f	1431	Dol pri Hrastniku
00050000-5543-d01d-b06f-84d03c3e151e	1262	Dol pri Ljubljani
00050000-5543-d01d-e9dc-d100f59d8020	1273	Dole pri Litiji
00050000-5543-d01d-2ac2-9c22a9e11fc7	1331	Dolenja vas
00050000-5543-d01d-d847-167ce29359eb	8350	Dolenjske Toplice
00050000-5543-d01d-dc54-13e897166f84	1230	Domžale
00050000-5543-d01d-87fb-7907fa68e65f	2252	Dornava
00050000-5543-d01d-d50c-920018aba15f	5294	Dornberk
00050000-5543-d01d-8af8-8859ad332972	1319	Draga
00050000-5543-d01d-9ee5-b993cc02a87e	8343	Dragatuš
00050000-5543-d01d-068d-e2e713e02cb5	3222	Dramlje
00050000-5543-d01d-ab54-9dddb961119f	2370	Dravograd
00050000-5543-d01d-6bd2-ea5664ee18b6	4203	Duplje
00050000-5543-d01d-e0ce-201dc1913cdd	6221	Dutovlje
00050000-5543-d01d-b77a-47a62a5bd64a	8361	Dvor
00050000-5543-d01d-b267-62f28dde1ef8	2343	Fala
00050000-5543-d01d-742f-ebd9a0fc89c2	9208	Fokovci
00050000-5543-d01d-1b2c-7ab3270399e3	2313	Fram
00050000-5543-d01d-521f-bd171d8ff87c	3213	Frankolovo
00050000-5543-d01d-1aab-f912fa2bf5f9	1274	Gabrovka
00050000-5543-d01d-5813-0449db5bfd8d	8254	Globoko
00050000-5543-d01d-d56b-2c5ecc396d0b	5275	Godovič
00050000-5543-d01d-7378-02ffbf62ec0e	4204	Golnik
00050000-5543-d01d-46bc-690b56e6e071	3303	Gomilsko
00050000-5543-d01d-1606-7c13996b256b	4224	Gorenja vas
00050000-5543-d01d-7df6-bf5b27150a29	3263	Gorica pri Slivnici
00050000-5543-d01d-7bb3-38c992af25b7	2272	Gorišnica
00050000-5543-d01d-59e4-91796a88a1f7	9250	Gornja Radgona
00050000-5543-d01d-55d0-534ac52c7c87	3342	Gornji Grad
00050000-5543-d01d-55fa-fa7deb7a19f2	4282	Gozd Martuljek
00050000-5543-d01d-29f0-532b70aa3ac9	6272	Gračišče
00050000-5543-d01d-7fa9-f1bebbcfffb4	9264	Grad
00050000-5543-d01d-6ca3-6490926e7521	8332	Gradac
00050000-5543-d01d-d9c4-a635fa5ac632	1384	Grahovo
00050000-5543-d01d-e6ac-7af9308efd1d	5242	Grahovo ob Bači
00050000-5543-d01d-bb13-bca49f495e62	5251	Grgar
00050000-5543-d01d-187b-69cd97060156	3302	Griže
00050000-5543-d01d-d41d-b8e7eac8d272	3231	Grobelno
00050000-5543-d01d-0b1d-540fb03555d0	1290	Grosuplje
00050000-5543-d01d-3d5e-1f30b86516f0	2288	Hajdina
00050000-5543-d01d-a405-89314126b544	8362	Hinje
00050000-5543-d01d-e7a3-bc851c54761e	2311	Hoče
00050000-5543-d01d-3c85-9e37dce5a617	9205	Hodoš/Hodos
00050000-5543-d01d-d9b8-5701c31c4037	1354	Horjul
00050000-5543-d01d-ef46-23bfdd611d22	1372	Hotedršica
00050000-5543-d01d-f086-182246f0e9dd	1430	Hrastnik
00050000-5543-d01d-3c4b-a27f2a51569c	6225	Hruševje
00050000-5543-d01d-d923-b61ce7ebc018	4276	Hrušica
00050000-5543-d01d-ee0d-4f5a91478a8f	5280	Idrija
00050000-5543-d01d-30ae-cfac9ef2d329	1292	Ig
00050000-5543-d01d-8d48-dd66735c5e3e	6250	Ilirska Bistrica
00050000-5543-d01d-db44-15dbcfcf3e6c	6251	Ilirska Bistrica-Trnovo
00050000-5543-d01d-6689-1d4ad099cfec	1295	Ivančna Gorica
00050000-5543-d01d-04e6-2312665edb5e	2259	Ivanjkovci
00050000-5543-d01d-2196-9e2d7998a0b5	1411	Izlake
00050000-5543-d01d-0697-a46c57d28390	6310	Izola/Isola
00050000-5543-d01d-9792-ca220d5efedb	2222	Jakobski Dol
00050000-5543-d01d-bc33-51b5908cd135	2221	Jarenina
00050000-5543-d01d-b075-6c159052d45b	6254	Jelšane
00050000-5543-d01d-e940-27ce85b08a27	4270	Jesenice
00050000-5543-d01d-914e-55380ab21f05	8261	Jesenice na Dolenjskem
00050000-5543-d01d-73fa-0e996e63925e	3273	Jurklošter
00050000-5543-d01d-e07f-8e6e4610ef43	2223	Jurovski Dol
00050000-5543-d01d-4303-29dd5cf8cea6	2256	Juršinci
00050000-5543-d01d-bf79-2d387fb40f62	5214	Kal nad Kanalom
00050000-5543-d01d-bfa7-614663f224f7	3233	Kalobje
00050000-5543-d01d-a6bd-3100480f4f0c	4246	Kamna Gorica
00050000-5543-d01d-ea0f-86e10a934276	2351	Kamnica
00050000-5543-d01d-a3a9-e0420a1e40f0	1241	Kamnik
00050000-5543-d01d-f702-195a3db458c6	5213	Kanal
00050000-5543-d01d-158a-f398ee66cf81	8258	Kapele
00050000-5543-d01d-aa54-e21da8765590	2362	Kapla
00050000-5543-d01d-9df9-75bf3266b2d0	2325	Kidričevo
00050000-5543-d01d-4fce-9143edd5be6a	1412	Kisovec
00050000-5543-d01d-a579-fe5d6f0e09a7	6253	Knežak
00050000-5543-d01d-c0de-1e25013f5526	5222	Kobarid
00050000-5543-d01d-f076-d732b7d10513	9227	Kobilje
00050000-5543-d01d-00bc-494bc93d171d	1330	Kočevje
00050000-5543-d01d-2ba4-60bde1b14e09	1338	Kočevska Reka
00050000-5543-d01d-b665-257dcd465e69	2276	Kog
00050000-5543-d01d-e692-307c7e32aad7	5211	Kojsko
00050000-5543-d01d-dfb5-ed55bf0171d7	6223	Komen
00050000-5543-d01d-b789-c51345f32c32	1218	Komenda
00050000-5543-d01d-08d6-912e9bc6f38b	6000	Koper/Capodistria 
00050000-5543-d01d-e8fe-cc1665f8d514	6001	Koper/Capodistria - poštni predali
00050000-5543-d01d-3454-5775d527c8b1	8282	Koprivnica
00050000-5543-d01d-3090-1b5194968cf7	5296	Kostanjevica na Krasu
00050000-5543-d01d-8521-85ee229e348e	8311	Kostanjevica na Krki
00050000-5543-d01d-0cff-78af21a0c00f	1336	Kostel
00050000-5543-d01d-7bde-8d38ffe76d43	6256	Košana
00050000-5543-d01d-af64-8f9bd1d7f3fc	2394	Kotlje
00050000-5543-d01d-7c8e-2665f896cd7a	6240	Kozina
00050000-5543-d01d-1a1d-f374b3787585	3260	Kozje
00050000-5543-d01d-ce60-ceda80e66f7f	4000	Kranj 
00050000-5543-d01d-f5ef-3ea1fe48a60b	4001	Kranj - poštni predali
00050000-5543-d01d-531f-213c125358a0	4280	Kranjska Gora
00050000-5543-d01d-08ed-415968d641bc	1281	Kresnice
00050000-5543-d01d-e784-b36b54de7aca	4294	Križe
00050000-5543-d01d-038c-6078150a387e	9206	Križevci
00050000-5543-d01d-0682-bc5f3dd83049	9242	Križevci pri Ljutomeru
00050000-5543-d01d-3b24-42667240b6d7	1301	Krka
00050000-5543-d01d-60b1-82850007395b	8296	Krmelj
00050000-5543-d01d-f21b-94d763ce4d73	4245	Kropa
00050000-5543-d01d-ae26-be932fa45f89	8262	Krška vas
00050000-5543-d01d-2497-5b9c98e0f15f	8270	Krško
00050000-5543-d01d-2649-9453f2a1d277	9263	Kuzma
00050000-5543-d01d-b479-b7786699e684	2318	Laporje
00050000-5543-d01d-f3cb-482e7133c532	3270	Laško
00050000-5543-d01d-a610-552e7f434cfc	1219	Laze v Tuhinju
00050000-5543-d01d-c1b2-68c81d4c8ab5	2230	Lenart v Slovenskih goricah
00050000-5543-d01d-cf7c-78fbb6ee77fc	9220	Lendava/Lendva
00050000-5543-d01d-78e0-358a2855b25e	4248	Lesce
00050000-5543-d01d-9e23-20f6f6f7aed5	3261	Lesično
00050000-5543-d01d-832c-9129b82d2e49	8273	Leskovec pri Krškem
00050000-5543-d01d-97f6-81a7140ebdbe	2372	Libeliče
00050000-5543-d01d-db49-b00a546352f5	2341	Limbuš
00050000-5543-d01d-24da-2e54e63bdae6	1270	Litija
00050000-5543-d01d-6788-1436c6c36e02	3202	Ljubečna
00050000-5543-d01d-65b5-bc4c115d62d9	1000	Ljubljana 
00050000-5543-d01d-0736-78fab59735ee	1001	Ljubljana - poštni predali
00050000-5543-d01d-cd0a-651ac4e7874e	1231	Ljubljana - Črnuče
00050000-5543-d01d-f56f-30bf5c4c15a3	1261	Ljubljana - Dobrunje
00050000-5543-d01d-4d1c-2bdfc4f031ca	1260	Ljubljana - Polje
00050000-5543-d01d-db35-04132a504084	1210	Ljubljana - Šentvid
00050000-5543-d01d-c4fd-617f9ba8e5bc	1211	Ljubljana - Šmartno
00050000-5543-d01d-74f1-bce0ca6bf32a	3333	Ljubno ob Savinji
00050000-5543-d01d-e2d7-3daf8e46ec4c	9240	Ljutomer
00050000-5543-d01d-9028-c3b82a31a738	3215	Loče
00050000-5543-d01d-6bc8-01711268c39a	5231	Log pod Mangartom
00050000-5543-d01d-ebcd-ea787a3bed43	1358	Log pri Brezovici
00050000-5543-d01d-bae8-b8ed533888dc	1370	Logatec
00050000-5543-d01d-4c2b-6100b3c423b7	1371	Logatec
00050000-5543-d01d-6d0b-f91b4a86aca5	1434	Loka pri Zidanem Mostu
00050000-5543-d01d-8db5-251a8d3988ad	3223	Loka pri Žusmu
00050000-5543-d01d-8dca-b692d247c960	6219	Lokev
00050000-5543-d01d-a657-4522abaaa2a0	1318	Loški Potok
00050000-5543-d01d-bb32-d0a456b8b326	2324	Lovrenc na Dravskem polju
00050000-5543-d01d-a0dc-58be5187e93e	2344	Lovrenc na Pohorju
00050000-5543-d01d-2cee-4d94f67998ae	3334	Luče
00050000-5543-d01d-12f9-71f5fc91893b	1225	Lukovica
00050000-5543-d01d-3890-07eb9403d62e	9202	Mačkovci
00050000-5543-d01d-1374-117fb3e09585	2322	Majšperk
00050000-5543-d01d-91bd-5793bb0baadd	2321	Makole
00050000-5543-d01d-178f-52a348e96cb4	9243	Mala Nedelja
00050000-5543-d01d-920f-d1dd582d89af	2229	Malečnik
00050000-5543-d01d-eb2d-3c1a6a96ea2f	6273	Marezige
00050000-5543-d01d-edd2-b6396ed6efc3	2000	Maribor 
00050000-5543-d01d-6039-d2ab5f5f52a1	2001	Maribor - poštni predali
00050000-5543-d01d-f752-e38a1fa819f5	2206	Marjeta na Dravskem polju
00050000-5543-d01d-7ef3-263f840ebed0	2281	Markovci
00050000-5543-d01d-8521-23d20a52d176	9221	Martjanci
00050000-5543-d01d-a21b-348591182144	6242	Materija
00050000-5543-d01d-cdd4-611c473847f1	4211	Mavčiče
00050000-5543-d01d-6657-bb0617d33db8	1215	Medvode
00050000-5543-d01d-ba83-61eae2009b28	1234	Mengeš
00050000-5543-d01d-a692-dd9daef3a8ef	8330	Metlika
00050000-5543-d01d-437e-dc44dae04c65	2392	Mežica
00050000-5543-d01d-6be3-fe04195850ab	2204	Miklavž na Dravskem polju
00050000-5543-d01d-eab4-60b94c0c3610	2275	Miklavž pri Ormožu
00050000-5543-d01d-ae30-4111fcf84fec	5291	Miren
00050000-5543-d01d-3e60-6bac3a47a0aa	8233	Mirna
00050000-5543-d01d-9f1d-b601c1048cb7	8216	Mirna Peč
00050000-5543-d01d-aa82-74f847037d6f	2382	Mislinja
00050000-5543-d01d-6853-3050cd09901a	4281	Mojstrana
00050000-5543-d01d-38d9-87c694745ede	8230	Mokronog
00050000-5543-d01d-c981-2a8bcc1c2247	1251	Moravče
00050000-5543-d01d-f84f-0facce1c5566	9226	Moravske Toplice
00050000-5543-d01d-de60-293576f7d5ec	5216	Most na Soči
00050000-5543-d01d-7272-080405ae6eba	1221	Motnik
00050000-5543-d01d-ccea-51968326e31a	3330	Mozirje
00050000-5543-d01d-00ed-d97ea6156585	9000	Murska Sobota 
00050000-5543-d01d-12b3-f51dd5e99f19	9001	Murska Sobota - poštni predali
00050000-5543-d01d-0a86-5fbeb5692afb	2366	Muta
00050000-5543-d01d-1534-8a118ebbc2b7	4202	Naklo
00050000-5543-d01d-a0e6-acaffe8866de	3331	Nazarje
00050000-5543-d01d-4063-c8e5faf2a1ea	1357	Notranje Gorice
00050000-5543-d01d-c4cb-61ad927ca33e	3203	Nova Cerkev
00050000-5543-d01d-8437-5ece205f60d1	5000	Nova Gorica 
00050000-5543-d01d-38b6-38331c7779df	5001	Nova Gorica - poštni predali
00050000-5543-d01d-4f67-66f05a507f5b	1385	Nova vas
00050000-5543-d01d-6019-f18925acaa6e	8000	Novo mesto
00050000-5543-d01d-6d11-5293ec1cae7b	8001	Novo mesto - poštni predali
00050000-5543-d01d-907a-b4a270ee7b74	6243	Obrov
00050000-5543-d01d-3893-7d1609001ee7	9233	Odranci
00050000-5543-d01d-840c-57552220c01e	2317	Oplotnica
00050000-5543-d01d-dd18-2adefd6110ae	2312	Orehova vas
00050000-5543-d01d-85cd-74e87acbb66b	2270	Ormož
00050000-5543-d01d-8c86-79d65ce7563a	1316	Ortnek
00050000-5543-d01d-4575-fbeb1b9af7ff	1337	Osilnica
00050000-5543-d01d-3345-303c11f354a8	8222	Otočec
00050000-5543-d01d-8a00-1bb5d386fc16	2361	Ožbalt
00050000-5543-d01d-2242-af21082e2922	2231	Pernica
00050000-5543-d01d-4f22-a9eb5a790ca7	2211	Pesnica pri Mariboru
00050000-5543-d01d-53d0-6158a8c63cc1	9203	Petrovci
00050000-5543-d01d-5393-49bfe64e2161	3301	Petrovče
00050000-5543-d01d-cbd0-8ad0316dc9de	6330	Piran/Pirano
00050000-5543-d01d-b60e-3cfefa3e84c7	8255	Pišece
00050000-5543-d01d-e246-305f4403e62a	6257	Pivka
00050000-5543-d01d-8297-844f31f7bddc	6232	Planina
00050000-5543-d01d-c565-bd79ee900890	3225	Planina pri Sevnici
00050000-5543-d01d-a03e-a73d2c864812	6276	Pobegi
00050000-5543-d01d-ca41-14ad4cb4df9e	8312	Podbočje
00050000-5543-d01d-081d-d307ef3a6a64	5243	Podbrdo
00050000-5543-d01d-9aba-33f85e3d4989	3254	Podčetrtek
00050000-5543-d01d-d058-1d424d0d6cfb	2273	Podgorci
00050000-5543-d01d-f6d7-9fb7b9285539	6216	Podgorje
00050000-5543-d01d-ef6b-a847cb9f71b9	2381	Podgorje pri Slovenj Gradcu
00050000-5543-d01d-86ce-e578e2c8cfcd	6244	Podgrad
00050000-5543-d01d-9ede-4618d7d246a3	1414	Podkum
00050000-5543-d01d-ab40-5e1bcde0525b	2286	Podlehnik
00050000-5543-d01d-698f-939b69d95d8f	5272	Podnanos
00050000-5543-d01d-750b-9474d57e9c82	4244	Podnart
00050000-5543-d01d-b427-0d1c7edddcd0	3241	Podplat
00050000-5543-d01d-2734-41fb3f5e434a	3257	Podsreda
00050000-5543-d01d-530b-18e6a7602d09	2363	Podvelka
00050000-5543-d01d-c26a-3ba99aad92de	2208	Pohorje
00050000-5543-d01d-6d26-5957971b7773	2257	Polenšak
00050000-5543-d01d-9184-25003519da77	1355	Polhov Gradec
00050000-5543-d01d-0ba4-dcf07cbc94d3	4223	Poljane nad Škofjo Loko
00050000-5543-d01d-c167-85b0cccfab20	2319	Poljčane
00050000-5543-d01d-aa4a-42c35e3a6e09	1272	Polšnik
00050000-5543-d01d-3946-c279c9ea6555	3313	Polzela
00050000-5543-d01d-8834-164dc46769a2	3232	Ponikva
00050000-5543-d01d-408a-5092aa1c789e	6320	Portorož/Portorose
00050000-5543-d01d-40d6-f402c86748e9	6230	Postojna
00050000-5543-d01d-efa3-5ad8d015bc46	2331	Pragersko
00050000-5543-d01d-aaf9-50c57dd9a354	3312	Prebold
00050000-5543-d01d-99e5-e31d676556aa	4205	Preddvor
00050000-5543-d01d-3b7c-b630eecc5b14	6255	Prem
00050000-5543-d01d-f4e6-bfb5e60b38ff	1352	Preserje
00050000-5543-d01d-2cc4-cf7a4ff6b1ca	6258	Prestranek
00050000-5543-d01d-b8ca-98ee66fcb60a	2391	Prevalje
00050000-5543-d01d-d08f-1eb5ab729c07	3262	Prevorje
00050000-5543-d01d-b56e-932829328808	1276	Primskovo 
00050000-5543-d01d-b4b5-4665de302050	3253	Pristava pri Mestinju
00050000-5543-d01d-e3c1-86f59f9ff97f	9207	Prosenjakovci/Partosfalva
00050000-5543-d01d-a86b-364da1f901b0	5297	Prvačina
00050000-5543-d01d-c973-e122c79d9366	2250	Ptuj
00050000-5543-d01d-2ef5-8a05e85b08ce	2323	Ptujska Gora
00050000-5543-d01d-b7d3-a1b2160aea31	9201	Puconci
00050000-5543-d01d-3b4b-eb062adc573f	2327	Rače
00050000-5543-d01d-56d6-c86a448a58ff	1433	Radeče
00050000-5543-d01d-c5ca-0799e4bb8e5c	9252	Radenci
00050000-5543-d01d-9a9e-8a932d6c7fb5	2360	Radlje ob Dravi
00050000-5543-d01d-8018-679aa95dfd6c	1235	Radomlje
00050000-5543-d01d-58d2-629f8b735d10	4240	Radovljica
00050000-5543-d01d-0a80-cf699959b444	8274	Raka
00050000-5543-d01d-9c1e-52fada429f88	1381	Rakek
00050000-5543-d01d-6ffc-f0105bc5012f	4283	Rateče - Planica
00050000-5543-d01d-1a48-0c5564baacf5	2390	Ravne na Koroškem
00050000-5543-d01d-da9d-d597f4fb7e05	9246	Razkrižje
00050000-5543-d01d-26d6-28810cfaca2d	3332	Rečica ob Savinji
00050000-5543-d01d-3548-2c50fce3066b	5292	Renče
00050000-5543-d01d-f21b-00856a094ae4	1310	Ribnica
00050000-5543-d01d-8490-b91cf6b82be2	2364	Ribnica na Pohorju
00050000-5543-d01d-d5c7-b50054ad5201	3272	Rimske Toplice
00050000-5543-d01d-5a9a-4847692d3055	1314	Rob
00050000-5543-d01d-7801-5dc071eccfc4	5215	Ročinj
00050000-5543-d01d-90b1-305d0a53e19e	3250	Rogaška Slatina
00050000-5543-d01d-cf96-81e56135707f	9262	Rogašovci
00050000-5543-d01d-20aa-47965a7eee4a	3252	Rogatec
00050000-5543-d01d-f53b-d9fe504413d2	1373	Rovte
00050000-5543-d01d-f72f-b8c3c18c4719	2342	Ruše
00050000-5543-d01d-f417-aecb2831fc15	1282	Sava
00050000-5543-d01d-304b-551a85c8734a	6333	Sečovlje/Sicciole
00050000-5543-d01d-3b3f-1eb2f6819bd0	4227	Selca
00050000-5543-d01d-b953-579dac941bd5	2352	Selnica ob Dravi
00050000-5543-d01d-272b-8904ce731955	8333	Semič
00050000-5543-d01d-af88-2e6ef5d02258	8281	Senovo
00050000-5543-d01d-267c-1146ef162909	6224	Senožeče
00050000-5543-d01d-e2b3-3016c3164bc0	8290	Sevnica
00050000-5543-d01d-43a4-a4f4013a232f	6210	Sežana
00050000-5543-d01d-dc56-ed4b0a836b78	2214	Sladki Vrh
00050000-5543-d01d-40ac-2b29e1b8f451	5283	Slap ob Idrijci
00050000-5543-d01d-2cdb-d5ca00095493	2380	Slovenj Gradec
00050000-5543-d01d-abe1-1c81adc09e82	2310	Slovenska Bistrica
00050000-5543-d01d-bd4b-9016c214cecc	3210	Slovenske Konjice
00050000-5543-d01d-c467-263824398d35	1216	Smlednik
00050000-5543-d01d-dbc8-fadadc64a204	5232	Soča
00050000-5543-d01d-4abb-e541352a39c0	1317	Sodražica
00050000-5543-d01d-3bc4-6fe1f9789066	3335	Solčava
00050000-5543-d01d-6382-28ea0a370228	5250	Solkan
00050000-5543-d01d-e49b-26ed9b557c7f	4229	Sorica
00050000-5543-d01d-637a-f3ae865ce347	4225	Sovodenj
00050000-5543-d01d-0302-3eab2cdb747c	5281	Spodnja Idrija
00050000-5543-d01d-b2ad-33ebfa402063	2241	Spodnji Duplek
00050000-5543-d01d-7dec-8040f51e9ab3	9245	Spodnji Ivanjci
00050000-5543-d01d-3eae-8d66596b148e	2277	Središče ob Dravi
00050000-5543-d01d-fa44-54ff46ff9176	4267	Srednja vas v Bohinju
00050000-5543-d01d-9286-277c89a5857d	8256	Sromlje 
00050000-5543-d01d-43f8-ee28c042e0ca	5224	Srpenica
00050000-5543-d01d-3c6b-92c61ffe7210	1242	Stahovica
00050000-5543-d01d-4a49-d2488c7d8c80	1332	Stara Cerkev
00050000-5543-d01d-ea38-957efb3ec9ab	8342	Stari trg ob Kolpi
00050000-5543-d01d-70be-5c5c26f9da25	1386	Stari trg pri Ložu
00050000-5543-d01d-9497-a7e1b54da985	2205	Starše
00050000-5543-d01d-b387-f72408482bf8	2289	Stoperce
00050000-5543-d01d-cab9-f6d97ae52869	8322	Stopiče
00050000-5543-d01d-c3e6-ca149cab71ab	3206	Stranice
00050000-5543-d01d-c1f4-0d6c368859d3	8351	Straža
00050000-5543-d01d-73f2-54c494599062	1313	Struge
00050000-5543-d01d-98ec-36ed6ea795a8	8293	Studenec
00050000-5543-d01d-3f85-ed701518b6ae	8331	Suhor
00050000-5543-d01d-9eb2-b09591910b87	2233	Sv. Ana v Slovenskih goricah
00050000-5543-d01d-d7ec-ef2213333377	2235	Sv. Trojica v Slovenskih goricah
00050000-5543-d01d-30c1-be6661be1311	2353	Sveti Duh na Ostrem Vrhu
00050000-5543-d01d-91f3-516bbc7b9502	9244	Sveti Jurij ob Ščavnici
00050000-5543-d01d-6d28-0be74b8b684e	3264	Sveti Štefan
00050000-5543-d01d-4c00-eb03d15a87ef	2258	Sveti Tomaž
00050000-5543-d01d-2eb0-b76a27a370b8	9204	Šalovci
00050000-5543-d01d-17df-d305065a667c	5261	Šempas
00050000-5543-d01d-a0db-6a6c089a6cb6	5290	Šempeter pri Gorici
00050000-5543-d01d-742f-9048d4b76930	3311	Šempeter v Savinjski dolini
00050000-5543-d01d-f510-f52b59d7b730	4208	Šenčur
00050000-5543-d01d-534c-856b5a36aa5d	2212	Šentilj v Slovenskih goricah
00050000-5543-d01d-598d-94a9fa30774e	8297	Šentjanž
00050000-5543-d01d-3906-e6b796c0a052	2373	Šentjanž pri Dravogradu
00050000-5543-d01d-b50d-ce3337b8f1ea	8310	Šentjernej
00050000-5543-d01d-fa7a-05ff03bd716e	3230	Šentjur
00050000-5543-d01d-2ce1-a7ab1c2be619	3271	Šentrupert
00050000-5543-d01d-151d-466b8874f8f5	8232	Šentrupert
00050000-5543-d01d-e3e4-104239bc816a	1296	Šentvid pri Stični
00050000-5543-d01d-d7bd-87f81109a020	8275	Škocjan
00050000-5543-d01d-f958-215ac46f6dba	6281	Škofije
00050000-5543-d01d-cb25-8d08faec0e74	4220	Škofja Loka
00050000-5543-d01d-93fc-b4e82553eb54	3211	Škofja vas
00050000-5543-d01d-5794-09fa27e2d4eb	1291	Škofljica
00050000-5543-d01d-e1c6-1a957710aa3a	6274	Šmarje
00050000-5543-d01d-719e-04503bff29bd	1293	Šmarje - Sap
00050000-5543-d01d-d366-79c20353529f	3240	Šmarje pri Jelšah
00050000-5543-d01d-1ae0-104de4403098	8220	Šmarješke Toplice
00050000-5543-d01d-4816-5e4f629ade35	2315	Šmartno na Pohorju
00050000-5543-d01d-ed7d-c001640b26c5	3341	Šmartno ob Dreti
00050000-5543-d01d-0618-ab120c32858f	3327	Šmartno ob Paki
00050000-5543-d01d-cc89-41aa6fac1910	1275	Šmartno pri Litiji
00050000-5543-d01d-20de-9367020dffe6	2383	Šmartno pri Slovenj Gradcu
00050000-5543-d01d-b142-2161a533297d	3201	Šmartno v Rožni dolini
00050000-5543-d01d-1bac-7dbcac34b3bb	3325	Šoštanj
00050000-5543-d01d-3393-b8b24da606a7	6222	Štanjel
00050000-5543-d01d-5d38-17afbafe2ab1	3220	Štore
00050000-5543-d01d-ce9c-0e7d72957e5c	3304	Tabor
00050000-5543-d01d-5bad-94aa51fde410	3221	Teharje
00050000-5543-d01d-4f1a-8a048cc6401d	9251	Tišina
00050000-5543-d01d-327a-a17d9bb5b393	5220	Tolmin
00050000-5543-d01d-71a9-f37e7b840e57	3326	Topolšica
00050000-5543-d01d-6b7f-56868fce5138	2371	Trbonje
00050000-5543-d01d-49c3-5003ba249e88	1420	Trbovlje
00050000-5543-d01d-c669-e63f88435799	8231	Trebelno 
00050000-5543-d01d-7f39-1ce65c391ff4	8210	Trebnje
00050000-5543-d01d-2aa3-2fdd3ecc4916	5252	Trnovo pri Gorici
00050000-5543-d01d-5bdd-327050790d76	2254	Trnovska vas
00050000-5543-d01d-61cc-deb26c0b98a9	1222	Trojane
00050000-5543-d01d-19f3-86e91b5489d3	1236	Trzin
00050000-5543-d01d-9cb7-21554970daaa	4290	Tržič
00050000-5543-d01d-2e13-56262d644634	8295	Tržišče
00050000-5543-d01d-25ef-ad392d65f9b7	1311	Turjak
00050000-5543-d01d-f4d9-3d96b55a9387	9224	Turnišče
00050000-5543-d01d-8e62-729d7041a952	8323	Uršna sela
00050000-5543-d01d-b984-8c25bd1f96e6	1252	Vače
00050000-5543-d01d-4615-ad93483f1552	3320	Velenje 
00050000-5543-d01d-0063-96c6c9e56be6	3322	Velenje - poštni predali
00050000-5543-d01d-42b4-2fa95d994eef	8212	Velika Loka
00050000-5543-d01d-88d5-e2efb292afb2	2274	Velika Nedelja
00050000-5543-d01d-886d-2fc82392a5b8	9225	Velika Polana
00050000-5543-d01d-7b48-65fc282dffde	1315	Velike Lašče
00050000-5543-d01d-380e-f7121a0c462c	8213	Veliki Gaber
00050000-5543-d01d-31ae-903ba6392cc6	9241	Veržej
00050000-5543-d01d-9860-5516394ac183	1312	Videm - Dobrepolje
00050000-5543-d01d-bf8c-89d96b65d54d	2284	Videm pri Ptuju
00050000-5543-d01d-ddd6-c6a8225896ab	8344	Vinica
00050000-5543-d01d-e638-a4b759317bd3	5271	Vipava
00050000-5543-d01d-e369-0889a0545d4d	4212	Visoko
00050000-5543-d01d-3f17-b33d561def53	1294	Višnja Gora
00050000-5543-d01d-65ef-3da00fa2fc60	3205	Vitanje
00050000-5543-d01d-1e5e-f1e55b8b0dcf	2255	Vitomarci
00050000-5543-d01d-989d-1ee7d9819e95	1217	Vodice
00050000-5543-d01d-1ccc-4c40434b0407	3212	Vojnik\t
00050000-5543-d01d-75b1-3c0aadeedcb0	5293	Volčja Draga
00050000-5543-d01d-b408-df959de37c3d	2232	Voličina
00050000-5543-d01d-0585-15cb61b023c8	3305	Vransko
00050000-5543-d01d-9a50-a70e50301d2a	6217	Vremski Britof
00050000-5543-d01d-d490-36abb6dbfed6	1360	Vrhnika
00050000-5543-d01d-9423-e9e95e9b0a8a	2365	Vuhred
00050000-5543-d01d-5511-f25502bc7cb1	2367	Vuzenica
00050000-5543-d01d-9ffc-4e925f7cd03b	8292	Zabukovje 
00050000-5543-d01d-67cd-c3b33a49fab8	1410	Zagorje ob Savi
00050000-5543-d01d-283c-9b7eacbb855e	1303	Zagradec
00050000-5543-d01d-81f1-e1bb72948229	2283	Zavrč
00050000-5543-d01d-1828-9bea51d43718	8272	Zdole 
00050000-5543-d01d-e510-af695c785543	4201	Zgornja Besnica
00050000-5543-d01d-ecdf-be274a4606ca	2242	Zgornja Korena
00050000-5543-d01d-555b-9d97026fe11d	2201	Zgornja Kungota
00050000-5543-d01d-0ab1-f29f45a23630	2316	Zgornja Ložnica
00050000-5543-d01d-83d9-ebd070eff398	2314	Zgornja Polskava
00050000-5543-d01d-c4e7-257b02ae9fe2	2213	Zgornja Velka
00050000-5543-d01d-1dd3-867cd501f68c	4247	Zgornje Gorje
00050000-5543-d01d-3a23-897782a4b4a0	4206	Zgornje Jezersko
00050000-5543-d01d-37b0-9cf99c6a4374	2285	Zgornji Leskovec
00050000-5543-d01d-8140-2013499ba623	1432	Zidani Most
00050000-5543-d01d-9bd3-090f1f0fb4d2	3214	Zreče
00050000-5543-d01d-1894-aadd6d1461de	4209	Žabnica
00050000-5543-d01d-a97e-a6f9ec70eb00	3310	Žalec
00050000-5543-d01d-a410-9ef291b7920d	4228	Železniki
00050000-5543-d01d-742d-8aaae2fd4109	2287	Žetale
00050000-5543-d01d-382d-fc46fe0246a2	4226	Žiri
00050000-5543-d01d-92c1-7723b7c45632	4274	Žirovnica
00050000-5543-d01d-d030-3c364ad6544f	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 1820374)
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
-- TOC entry 2642 (class 0 OID 1820197)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1820263)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1820386)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1820491)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1820535)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1820415)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1820359)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1820349)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1820525)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1820481)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 1820063)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5543-d01e-29c0-1269c0e2512e	00010000-5543-d01e-385b-f55857b8affb	2015-05-01 21:12:30	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROd.T3SE9R686pThL7qihjkKUxZ4Rnfkm";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 1820424)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1820103)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5543-d01e-be4b-3f5033822851	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5543-d01e-c304-563ad7a92c61	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5543-d01e-6600-58c7e8a2eb47	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5543-d01e-4cae-cbb5d5f3c634	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5543-d01e-3faf-caa54dad72dc	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5543-d01e-8bea-f6a8254301a1	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 1820086)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5543-d01e-29c0-1269c0e2512e	00020000-5543-d01e-4cae-cbb5d5f3c634
00010000-5543-d01e-385b-f55857b8affb	00020000-5543-d01e-4cae-cbb5d5f3c634
\.


--
-- TOC entry 2668 (class 0 OID 1820438)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 1820380)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1820330)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 1820162)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1820336)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1820516)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1820232)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1820072)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5543-d01e-385b-f55857b8affb	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROQLwDD/egBN0EKBhv7Lz.jvUDwMm4uUm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5543-d01e-29c0-1269c0e2512e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 1820566)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1820278)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 1820407)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1820473)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1820306)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1820556)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 1820463)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 1820127)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 1820605)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 1820598)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 1820515)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 1820296)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 1820329)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 1820258)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 1820459)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 1820276)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 1820323)
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
-- TOC entry 2365 (class 2606 OID 1820372)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 1820399)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 1820230)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 1820136)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 1820194)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 1820160)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 1820116)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 1820101)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 1820405)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 1820437)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 1820552)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 1820187)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 1820218)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 1820378)
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
-- TOC entry 2299 (class 2606 OID 1820208)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 1820267)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 1820390)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 1820497)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 1820540)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 1820422)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 1820363)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 1820354)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 1820534)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 1820488)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 1820071)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 1820428)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 1820090)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 1820110)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 1820446)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 1820385)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 1820335)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 1820167)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 1820345)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 1820524)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 1820243)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 1820084)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 1820580)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 1820282)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 1820413)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 1820479)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 1820318)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 1820565)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 1820472)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 1820303)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 1820189)
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
-- TOC entry 2378 (class 1259 OID 1820406)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 1820392)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 1820391)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 1820283)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 1820462)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 1820460)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 1820461)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 1820553)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 1820554)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 1820555)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 1820583)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 1820582)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 1820581)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 1820245)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 1820244)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 1820196)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 1820195)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 1820429)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 1820324)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 1820117)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 1820118)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 1820449)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 1820448)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 1820447)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 1820268)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 1820270)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 1820269)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 1820358)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 1820356)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 1820355)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 1820357)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 1820091)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 1820092)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 1820414)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 1820379)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 1820489)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 1820490)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 1820210)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 1820209)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 1820211)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 1820498)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 1820499)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 1820608)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 1820607)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 1820610)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 1820606)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 1820609)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 1820480)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 1820367)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 1820366)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 1820364)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 1820365)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2246 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 1820600)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 1820599)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 1820277)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 1820138)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 1820137)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 1820168)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 1820169)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 1820348)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 1820347)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 1820346)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 1820305)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 1820301)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 1820298)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 1820299)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 1820297)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 1820302)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 1820300)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 1820188)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 1820259)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1820261)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 1820260)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 1820262)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 1820373)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 1820161)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 1820231)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2257 (class 1259 OID 1820085)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2386 (class 1259 OID 1820423)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2266 (class 1259 OID 1820102)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2249 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 1820219)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 1820541)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 1820111)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 1820304)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 1820741)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 1820726)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 1820731)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 1820751)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 1820721)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 1820746)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 1820736)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 1820656)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 1820836)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 1820831)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 1820826)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 1820716)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 1820876)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 1820866)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1820871)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 1820816)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 1820911)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 1820916)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 1820921)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 1820936)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 1820931)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 1820926)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 1820691)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 1820686)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 1820666)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 1820661)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 1820641)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 1820846)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 1820756)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 1820621)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 1820626)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 1820861)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 1820856)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 1820851)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 1820696)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 1820706)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 1820701)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 1820791)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 1820781)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 1820776)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 1820786)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 1820611)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 1820616)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 1820841)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 1820821)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 1820886)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 1820891)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 1820676)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 1820671)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 1820681)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 1820896)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 1820901)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 1820961)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 1820956)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 1820971)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 1820951)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 1820966)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 1820881)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 1820811)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 1820806)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 1820796)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 1820801)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 1820946)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 1820941)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 1820711)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1820906)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 1820636)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 1820631)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 1820646)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 1820651)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 1820771)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 1820766)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 1820761)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-01 21:12:31 CEST

--
-- PostgreSQL database dump complete
--

