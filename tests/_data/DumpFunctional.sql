--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-22 14:10:57 CEST

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
-- TOC entry 179 (class 1259 OID 743940)
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
-- TOC entry 225 (class 1259 OID 744424)
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
-- TOC entry 224 (class 1259 OID 744407)
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
-- TOC entry 217 (class 1259 OID 744323)
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
-- TOC entry 193 (class 1259 OID 744107)
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
-- TOC entry 196 (class 1259 OID 744148)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 744069)
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
-- TOC entry 212 (class 1259 OID 744273)
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
-- TOC entry 191 (class 1259 OID 744094)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 744142)
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
-- TOC entry 201 (class 1259 OID 744191)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 744216)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 744043)
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
-- TOC entry 180 (class 1259 OID 743949)
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
-- TOC entry 181 (class 1259 OID 743960)
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
-- TOC entry 184 (class 1259 OID 744013)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 743914)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 743933)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 744223)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 744253)
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
-- TOC entry 221 (class 1259 OID 744365)
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
-- TOC entry 183 (class 1259 OID 743993)
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
-- TOC entry 186 (class 1259 OID 744035)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 744197)
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
-- TOC entry 185 (class 1259 OID 744020)
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
-- TOC entry 190 (class 1259 OID 744086)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 744209)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 744314)
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
-- TOC entry 220 (class 1259 OID 744358)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 744238)
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
-- TOC entry 200 (class 1259 OID 744182)
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
-- TOC entry 199 (class 1259 OID 744172)
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
-- TOC entry 219 (class 1259 OID 744348)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 744304)
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
-- TOC entry 173 (class 1259 OID 743885)
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
-- TOC entry 172 (class 1259 OID 743883)
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
-- TOC entry 209 (class 1259 OID 744247)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 743923)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 743907)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 744261)
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
-- TOC entry 203 (class 1259 OID 744203)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 744153)
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
-- TOC entry 182 (class 1259 OID 743985)
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
-- TOC entry 198 (class 1259 OID 744159)
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
-- TOC entry 218 (class 1259 OID 744339)
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
-- TOC entry 188 (class 1259 OID 744055)
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
-- TOC entry 174 (class 1259 OID 743894)
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
-- TOC entry 223 (class 1259 OID 744389)
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
-- TOC entry 192 (class 1259 OID 744101)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 744230)
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
-- TOC entry 214 (class 1259 OID 744296)
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
-- TOC entry 194 (class 1259 OID 744129)
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
-- TOC entry 222 (class 1259 OID 744379)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 744286)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 743888)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2638 (class 0 OID 743940)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2684 (class 0 OID 744424)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 744407)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 744323)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 744107)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 744148)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 744069)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5537-8fcf-1c84-ab33f18e6a1f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5537-8fcf-f435-f7deaa755657	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5537-8fcf-a234-7b29e1624172	AL	ALB	008	Albania 	Albanija	\N
00040000-5537-8fcf-74c9-b4872e1b07cb	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5537-8fcf-c024-ef2a0c3210e3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5537-8fcf-b6fa-38d3eaa3d692	AD	AND	020	Andorra 	Andora	\N
00040000-5537-8fcf-3d7c-11841185948d	AO	AGO	024	Angola 	Angola	\N
00040000-5537-8fcf-9af1-91a81e90d07f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5537-8fcf-bde9-8b6bdb7651a7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5537-8fcf-65fc-9a8632c9a624	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5537-8fcf-0407-78b17e647302	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5537-8fcf-2f7f-479c6909212a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5537-8fcf-b6bb-d6db2cf3f363	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5537-8fcf-ee81-658ded9afd3f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5537-8fcf-e501-70d80c8dd392	AT	AUT	040	Austria 	Avstrija	\N
00040000-5537-8fcf-8331-4758712b4846	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5537-8fcf-bff6-78588b726c0d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5537-8fcf-b28e-a15e3337296e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5537-8fcf-df74-87b3967d141c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5537-8fcf-f61c-d9d8ea6cc00e	BB	BRB	052	Barbados 	Barbados	\N
00040000-5537-8fcf-3a1f-2266508f14e5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5537-8fcf-f0c8-c68b0d372c0a	BE	BEL	056	Belgium 	Belgija	\N
00040000-5537-8fcf-78c8-7c3480992478	BZ	BLZ	084	Belize 	Belize	\N
00040000-5537-8fcf-b3f7-1de3f3a6ac45	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5537-8fcf-d3cf-c894a9812ae3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5537-8fcf-66f2-337eaed17e99	BT	BTN	064	Bhutan 	Butan	\N
00040000-5537-8fcf-0e75-169e1550fa53	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5537-8fcf-336c-6ac2fd20cad3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5537-8fcf-ee98-a4818863925b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5537-8fcf-e24f-fcb2f0a28067	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5537-8fcf-b3f2-b2565f34c795	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5537-8fcf-fa33-709d5b443cdc	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5537-8fcf-2f6d-91d7f216bd95	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5537-8fcf-30a4-e6723a52d9f0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5537-8fcf-0ead-05ae17cedd88	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5537-8fcf-0ade-5add0aca3970	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5537-8fcf-880a-e7a0a3f59ef0	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5537-8fcf-eaa8-aec5642b2f6f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5537-8fcf-5e74-455b0632ae1f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5537-8fcf-8418-d066883730ca	CA	CAN	124	Canada 	Kanada	\N
00040000-5537-8fcf-1530-0909a216aef0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5537-8fcf-ebe4-3836f9083dc7	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5537-8fcf-2e7d-3893f5ee9234	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5537-8fcf-7cfc-bcc6be89c07e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5537-8fcf-0231-255d7ae6578f	CL	CHL	152	Chile 	Čile	\N
00040000-5537-8fcf-5ba0-77997b2ce2fa	CN	CHN	156	China 	Kitajska	\N
00040000-5537-8fcf-b253-7940c50da330	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5537-8fcf-e725-ebc5507d0373	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5537-8fcf-347d-810ebe97e0c5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5537-8fcf-689f-8955307c34fd	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5537-8fcf-cb89-03c6b1e47ccc	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5537-8fcf-8ff5-90a984af2a98	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5537-8fcf-059a-530c94c6948c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5537-8fcf-465b-732d78e34eec	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5537-8fcf-1730-8d6186ea7c87	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5537-8fcf-afce-7416c1d16e0b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5537-8fcf-d19d-ef815a97ac66	CU	CUB	192	Cuba 	Kuba	\N
00040000-5537-8fcf-8e61-5aada4a30df6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5537-8fcf-a0e9-59cb6f3820e9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5537-8fcf-804f-fd09ebd203d2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5537-8fcf-c48c-079681a3bd80	DK	DNK	208	Denmark 	Danska	\N
00040000-5537-8fcf-911e-0910f3d7a866	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5537-8fcf-e707-276546ee882c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5537-8fcf-bc8a-3ea5811492b8	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5537-8fcf-a0b0-c2546577453d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5537-8fcf-ee8c-60a31fe27b02	EG	EGY	818	Egypt 	Egipt	\N
00040000-5537-8fcf-56f1-30e577979598	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5537-8fcf-e5c1-302d20b34fc7	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5537-8fcf-8625-07d32afde5a7	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5537-8fcf-6856-24d345d703c6	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5537-8fcf-6541-b014ac318c43	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5537-8fcf-aeb1-ca171c77f289	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5537-8fcf-cb1e-36d5ec78e097	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5537-8fcf-d110-560e3d3c536e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5537-8fcf-dab8-a2e49857d005	FI	FIN	246	Finland 	Finska	\N
00040000-5537-8fcf-cb1b-bc28d7ae59b6	FR	FRA	250	France 	Francija	\N
00040000-5537-8fcf-eaee-0109b578698c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5537-8fcf-f191-14a31145a045	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5537-8fcf-9f73-526531bcabdc	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5537-8fcf-eaae-c3e6a072b08e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5537-8fcf-17cc-3ea0e25a5a32	GA	GAB	266	Gabon 	Gabon	\N
00040000-5537-8fcf-65ca-cd05bf5a381e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5537-8fcf-290d-1f03ecc6e132	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5537-8fcf-26dd-133df84dd8e3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5537-8fcf-fee3-043d6561ca26	GH	GHA	288	Ghana 	Gana	\N
00040000-5537-8fcf-a986-3cd8c5d49d65	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5537-8fcf-aebd-4800b8a78378	GR	GRC	300	Greece 	Grčija	\N
00040000-5537-8fcf-7e00-f327a00107fb	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5537-8fcf-ef72-404d9a5efd0d	GD	GRD	308	Grenada 	Grenada	\N
00040000-5537-8fcf-d4e9-e1d83de5b40a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5537-8fcf-e56f-c0c909e16adf	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5537-8fcf-db74-e9c33c32075f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5537-8fcf-bcbc-566888da6ab3	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5537-8fcf-fdcd-485721e10a62	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5537-8fcf-5f1d-eb12f24e7256	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5537-8fcf-6d81-c1fb142f2244	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5537-8fcf-4129-2bbcfd935426	HT	HTI	332	Haiti 	Haiti	\N
00040000-5537-8fcf-f362-bf7b96e8ee02	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5537-8fcf-b23b-221573257527	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5537-8fcf-dd47-d5a4a1e6987f	HN	HND	340	Honduras 	Honduras	\N
00040000-5537-8fcf-6b4e-4fb0daeb9c91	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5537-8fcf-db94-597c1c6bf76c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5537-8fcf-b39c-96ae8478569c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5537-8fcf-2dde-b6d1d1a6309c	IN	IND	356	India 	Indija	\N
00040000-5537-8fcf-768d-74f3bb781d04	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5537-8fcf-bc5c-3659c588e50b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5537-8fcf-679f-e50e3895d48e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5537-8fcf-8881-d51a305b15a2	IE	IRL	372	Ireland 	Irska	\N
00040000-5537-8fcf-ea08-b9afd1f9511d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5537-8fcf-8659-43530835c4f4	IL	ISR	376	Israel 	Izrael	\N
00040000-5537-8fcf-65e0-e7dd5f9bb605	IT	ITA	380	Italy 	Italija	\N
00040000-5537-8fcf-2351-4e179227d87f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5537-8fcf-698e-e29fa30d1510	JP	JPN	392	Japan 	Japonska	\N
00040000-5537-8fcf-e5cd-01f67582177f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5537-8fcf-2ca7-5aad7956c05f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5537-8fcf-9446-e1ed7747efc2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5537-8fcf-6de8-cd9990fc55af	KE	KEN	404	Kenya 	Kenija	\N
00040000-5537-8fcf-13c5-98f08042c586	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5537-8fcf-c384-d35d370d468f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5537-8fcf-46a5-2eca8a3a8bca	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5537-8fcf-1a90-8aeb2b308bbb	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5537-8fcf-a7a3-1f1267698bb6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5537-8fcf-f149-e7ca2a8ef664	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5537-8fcf-0ef5-876793250697	LV	LVA	428	Latvia 	Latvija	\N
00040000-5537-8fcf-2a81-6797d2f340bd	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5537-8fcf-5ce7-95245abb20c0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5537-8fcf-b6f2-a8801448134d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5537-8fcf-24c0-7a43b60657f6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5537-8fcf-164a-cbb73699a14b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5537-8fcf-6512-02402588a67f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5537-8fcf-194b-55a11c7aeaed	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5537-8fcf-dd23-0ba509c5ac15	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5537-8fcf-a5d5-0ebc65f97c21	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5537-8fcf-a96c-8de282cb790a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5537-8fcf-254a-0dcdef00f3f0	MW	MWI	454	Malawi 	Malavi	\N
00040000-5537-8fcf-1d47-8cb2a12e18df	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5537-8fcf-2bfc-cf70f2266039	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5537-8fcf-44ec-e5ebbe826b3c	ML	MLI	466	Mali 	Mali	\N
00040000-5537-8fcf-9b01-29b18485c841	MT	MLT	470	Malta 	Malta	\N
00040000-5537-8fcf-54c1-8804f3f87a0c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5537-8fcf-e81c-89b6185fa6d0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5537-8fcf-8011-e6be627d81ea	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5537-8fcf-2a9c-6c2e496e48de	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5537-8fcf-f6ac-1ffa9a725eca	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5537-8fcf-a14e-472532e3b6e9	MX	MEX	484	Mexico 	Mehika	\N
00040000-5537-8fcf-c62b-868ec2551bd2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5537-8fcf-7efc-3ab68fe37f39	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5537-8fcf-9553-abcf4099555b	MC	MCO	492	Monaco 	Monako	\N
00040000-5537-8fcf-bbe0-8eef9623410c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5537-8fcf-7822-cde639e02399	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5537-8fcf-76cc-f33074d4e58c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5537-8fcf-06d0-47e0267a7481	MA	MAR	504	Morocco 	Maroko	\N
00040000-5537-8fcf-e7a9-b6624fc1d357	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5537-8fcf-40f5-6da1336e1a37	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5537-8fcf-ebe7-47f036287fa3	NA	NAM	516	Namibia 	Namibija	\N
00040000-5537-8fcf-4ede-394d16e9e2f7	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5537-8fcf-5a1b-822416c8b070	NP	NPL	524	Nepal 	Nepal	\N
00040000-5537-8fcf-216b-4a54d0de1d8a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5537-8fcf-8606-30caeb17a6fd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5537-8fcf-dd22-e288f991ff79	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5537-8fcf-558c-09b642cecc8b	NE	NER	562	Niger 	Niger 	\N
00040000-5537-8fcf-0994-8a966f6d8de8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5537-8fcf-128e-a922312a85d8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5537-8fcf-7dbc-e4887869f963	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5537-8fcf-8be7-ef9d6929a4fd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5537-8fcf-b15a-2b3eed7b5d07	NO	NOR	578	Norway 	Norveška	\N
00040000-5537-8fcf-9a3e-2d4368f71623	OM	OMN	512	Oman 	Oman	\N
00040000-5537-8fcf-8831-c073911d735f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5537-8fcf-ab7c-852f00fc8855	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5537-8fcf-9d1d-b9219899d2f5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5537-8fcf-52ed-b34fb1b6dd76	PA	PAN	591	Panama 	Panama	\N
00040000-5537-8fcf-8f6a-d141fdbf5bb9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5537-8fcf-a48b-e144695c70e8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5537-8fcf-090d-79a47102eae6	PE	PER	604	Peru 	Peru	\N
00040000-5537-8fcf-c9ec-f5b961b7eb8b	PH	PHL	608	Philippines 	Filipini	\N
00040000-5537-8fcf-2dcb-914d4841ea21	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5537-8fcf-596c-808402fda4e9	PL	POL	616	Poland 	Poljska	\N
00040000-5537-8fcf-96fc-dfbeae0f5a96	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5537-8fcf-0963-eb75535a088b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5537-8fcf-50c0-f42c29d248c9	QA	QAT	634	Qatar 	Katar	\N
00040000-5537-8fcf-c10e-eb3f071777b0	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5537-8fcf-eb28-9125fbcffbe6	RO	ROU	642	Romania 	Romunija	\N
00040000-5537-8fcf-8dda-f6e549c70afc	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5537-8fcf-8517-b1a46f2cb385	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5537-8fcf-e5a9-eb350e06f9ab	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5537-8fcf-b5d4-299a0da4ea97	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5537-8fcf-6c84-1ee2964033b4	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5537-8fcf-cd52-5330677ad2c4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5537-8fcf-e7f0-0427b249b85a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5537-8fcf-2a21-3aaa7af5bbab	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5537-8fcf-25f7-3fbe39554343	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5537-8fcf-e5d8-d7af24c01846	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5537-8fcf-1d22-c6457dea8960	SM	SMR	674	San Marino 	San Marino	\N
00040000-5537-8fcf-5e31-3c1f7aa204c3	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5537-8fcf-c65a-9f8a4e02c228	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5537-8fcf-e596-d0239b0f419a	SN	SEN	686	Senegal 	Senegal	\N
00040000-5537-8fcf-08ba-4f76ba98076d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5537-8fcf-789f-4ba8daed82f2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5537-8fcf-fbb4-6a37d55b6a5d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5537-8fcf-fb68-09318b989a2e	SG	SGP	702	Singapore 	Singapur	\N
00040000-5537-8fcf-bf7c-65f75bc18cc5	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5537-8fcf-ac39-8f5ac73b26bb	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5537-8fcf-9ec9-d5349aeaaddf	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5537-8fcf-716d-82592bfd903a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5537-8fcf-83f9-3be3293ad8b8	SO	SOM	706	Somalia 	Somalija	\N
00040000-5537-8fcf-a817-8a4623278db2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5537-8fcf-18ff-6df40f62d0db	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5537-8fcf-c79e-5b2e7c245be3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5537-8fcf-61ba-277c0472ba4c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5537-8fcf-eea5-a557eb9c7a81	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5537-8fcf-da83-b0f567b75ebf	SD	SDN	729	Sudan 	Sudan	\N
00040000-5537-8fcf-4a5a-852e434d8f24	SR	SUR	740	Suriname 	Surinam	\N
00040000-5537-8fcf-2487-f4aa3ad6bf02	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5537-8fcf-c6aa-42cc8f576431	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5537-8fcf-754d-9d98d378c0b7	SE	SWE	752	Sweden 	Švedska	\N
00040000-5537-8fcf-8f33-5efb0869070c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5537-8fcf-d773-a283acc56410	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5537-8fcf-7fa0-32dbd0df57a3	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5537-8fcf-70a2-be7daeb46df1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5537-8fcf-74aa-4e47a2601e62	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5537-8fcf-d55a-db341b5b1adc	TH	THA	764	Thailand 	Tajska	\N
00040000-5537-8fcf-939e-03519728bbc4	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5537-8fcf-74a4-df3789233868	TG	TGO	768	Togo 	Togo	\N
00040000-5537-8fcf-19c9-b15295da78d0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5537-8fcf-0b13-d3fa0dc10f14	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5537-8fcf-49cb-f5d75348c0ee	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5537-8fcf-0129-e7b4a88d1334	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5537-8fcf-3654-4b7781ab1269	TR	TUR	792	Turkey 	Turčija	\N
00040000-5537-8fcf-7f66-a1354ee6063b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5537-8fcf-36d9-ee50edaaa387	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5537-8fcf-783f-1c4e753c5352	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5537-8fcf-468a-2bc75f90180a	UG	UGA	800	Uganda 	Uganda	\N
00040000-5537-8fcf-585a-9613f5580e56	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5537-8fcf-c1c6-8d13e06c5f78	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5537-8fcf-ee47-06a1c6df3eb3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5537-8fcf-022c-f6701a148fdb	US	USA	840	United States 	Združene države Amerike	\N
00040000-5537-8fcf-00f4-256ac08404cb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5537-8fcf-9064-61d50fa1f96f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5537-8fcf-a846-45a8bbbc73df	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5537-8fcf-d0b8-322ad7db31ab	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5537-8fcf-b0d5-18489ce6bd08	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5537-8fcf-832a-faefd354e8b8	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5537-8fcf-e5a3-fd8fdda97b16	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5537-8fcf-68a3-be123c88aecf	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5537-8fcf-6d4d-7e3b4d31ff06	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5537-8fcf-1731-d8df4eaa32d9	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5537-8fcf-ab31-6f2e6ec7fa6a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5537-8fcf-7e86-0353873488ba	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5537-8fcf-83d9-16b7c0b982e2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2671 (class 0 OID 744273)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 744094)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 744142)
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
-- TOC entry 2660 (class 0 OID 744191)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 744216)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 744043)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5537-8fd1-66d4-12ce19eb39eb	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5537-8fd1-a6cb-26ee104f70f0	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5537-8fd1-a412-19cb98f12f26	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5537-8fd1-95a3-7f8aefd915f8	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5537-8fd1-63b3-2958d9305f8e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5537-8fd1-369e-96ff7340fba5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5537-8fd1-07a9-55833e1675ff	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5537-8fd1-9af7-3109f1df0c47	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5537-8fd1-178f-bd249f492a0c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5537-8fd1-acc6-69760003cd6b	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2639 (class 0 OID 743949)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5537-8fd1-2b46-f92af2e26077	00000000-5537-8fd1-63b3-2958d9305f8e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5537-8fd1-9d39-b40358a90d17	00000000-5537-8fd1-63b3-2958d9305f8e	00010000-5537-8fd1-9fd5-f96675712b3c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5537-8fd1-9954-acd50cd99fa1	00000000-5537-8fd1-369e-96ff7340fba5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2640 (class 0 OID 743960)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 744013)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 743914)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5537-8fd0-8567-df69f85347eb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-48a2-d037260209c5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-9e73-83b88477e718	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-3136-ea5469b8c24c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-bf60-398e83ece0c5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-0a3e-d3dea74f5e46	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-d6c7-4bc133e92ae2	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-9e9f-6f3ebc79ac8c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-586d-bee6725cba81	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-59fe-7bd0559544bc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-4d69-ce3bd2d59f00	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-11a9-056da5b5062f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-d2c4-1347a57322b4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-eaf7-b975528831b7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-a5b0-8888f7163474	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-45d5-911d55d10319	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-54a5-15fe86432d2e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-098d-b56e3bf6f68a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-d282-fce96ccf7c70	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-2ebd-9c7d6b685bd8	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-135b-5d05db0f84a6	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-9310-18a2d943b381	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-cbfe-bd20c0341490	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-2d05-45838df61298	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-9a83-774d67f5b7f4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-9abc-0542f6d48d88	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-2d02-331ed0f8c3b1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-b4cd-538c4e7063aa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-b684-d5625e477f2b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-1f4a-5c870f34a3d1	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-dcdd-a6fa75fe84c4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-1f0e-1bc0f756f185	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-7122-c8a81f7f6342	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-767b-cc50a86629a4	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-ab70-e2a49a0d7175	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-68c9-d8b044109001	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-a33f-e31d453c6749	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-b5fb-d68672dd4088	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-5279-f61de7598887	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-8ad1-e1c888bc9c7c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-4b97-38c3179428d0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-cfcf-151dbc368fcc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-e4d8-3d2c931e30e7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-8b11-422195bb41b5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-c5ed-065d2b00faa2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-bb6f-37f8cbd74aaa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-eb66-66d52aae8874	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-db69-6c6355ed4e5a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-4f75-0a5133361768	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-f8af-417f3939b0a3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-1283-527930d0d329	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-f85a-4d4bd0859f15	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-f394-b1d6ae47a98f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-dd77-c6a8d409fc60	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-712b-ceea783890fb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-5cc0-cd2d473a5039	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-1032-61651e663557	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-0b29-efcbb830e6e5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-0df4-2d8cdca1decf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-2dcf-19f52ee39118	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-a02a-fce95100474d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-b4cc-f62dfb275f18	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-d372-0558c30ae0bb	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-6c19-384aee137c09	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-4e63-1d0e3cc7a029	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-1d9f-92d1984434bc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-fe3e-13311b6180a1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-ccc5-c7473aa66fbe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-a4d6-0435fcdb25bb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-542b-038d5a50f809	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-62c1-86c398605c34	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-f4ba-1f001e714beb	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-f14a-af983be74b34	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-35e1-b025fc744804	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-15d7-bfd0da591410	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-b48d-69e9d756ef07	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-c15d-c664abedd535	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-f486-e5b762c8f141	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-6d2e-bf42fc483889	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-e395-b8dfa7fc96f4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-cf3c-2feea634ad93	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-77f5-d82e8a31d75d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-52ad-b6c0bde329a0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-1a37-5dfe8f2e11f2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-66eb-08992b3800f6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-9007-977cdad2b3da	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-5d0d-03869760b744	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-1859-d4e519336b31	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-ff5c-873f33ad65fd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-ed6e-bf83cdb16cff	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-4aaa-26e81ecdcd9f	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-bf20-0f609309015d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-eba5-d8bd822e82cc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-b797-2aaf53262ca3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-de85-f6f6aea62530	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-0cbf-7207f13cb608	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-7d63-01190a16a052	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-40be-b14e65e0600f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-e5a8-0ec5ad6c977d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-687b-a7c068ad3149	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-9754-aca0cdc13346	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-b446-5ea448be5757	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-63fe-fabcb8a20ddb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-4be4-4c7b57632279	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-b3c1-d3badfd9804b	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-2ed8-284679ea57e2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-0914-3d133f31550f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-d0a9-ed5fb5ff6197	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-8422-b99eb6a97da6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-ecbd-dfbdaf5af63c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-c5b5-bb8887b6b777	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-3df6-81690d9563d6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-b91e-09aafd82c53f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-a449-694b80e73bed	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-e9f9-fb87d4fb9752	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-90c3-36b38281a767	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-dc93-596b95f213e5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-78d9-f47ff7c8f7ce	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-7640-cee73a9d5447	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-bbd9-24c6e7a844b2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-7634-37bbe115762a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-c395-550bf1178ad4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-3d3a-71db46e504c3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-7b45-30caa90a2fd4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-a74f-468e89201925	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-c132-f48c3d800657	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-684e-6537b1f1db78	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-b2ba-a7da2bfe6851	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-a057-47e3dde6dd1b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-c50f-086a8868d87b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-5315-b80818cfac35	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-81bb-70d8f418e870	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-655f-73454faac4de	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-5936-d4cd0288494c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-2cc8-48c6f0bb00c4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-f9f8-bcedcf372257	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-59f8-0f6718ab9375	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-687a-980180da9fab	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-813f-eb48f550aff5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-f286-7481bae13716	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-da97-7917d0d69321	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-c357-0ecb8cdb9ea8	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-9fd1-7acc81c81172	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-3b66-d91ff274c9ee	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-fe5e-045b64cbd4d9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-5dbc-8dbff3761d6b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-1555-842b2126c0bf	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-b696-1ea40b222bff	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-bef6-97ded66ba0b9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-6a57-7dfea246ace0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-6098-9495982b823a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-a7c8-59455fb22632	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-ba20-53039eb88fec	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-477c-0f9e7cec12f2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-1b07-6fa37b16c884	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-d312-241d4418254e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-56cd-8821e86ac6ab	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-5a6c-add78369ad76	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-d4e1-ea43040ed0ed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-550e-93abcb5287c3	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-0ff1-cbe4a4b3a2bb	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-6757-1287f03439b1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-2099-3ffa94f39397	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-4420-3fa8dd69ee67	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-73bb-47ce3c23ab53	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-12a7-1f89d872852e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-8742-507c2e882a8a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-6ef2-895606547bf1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-a55a-f49c36139da5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-6206-b15cb7a21daa	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-011d-3d637bab7155	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-5a72-83eaaecfe708	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-03d5-3897856a6ad1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-1e48-75546985962b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-4be8-6ab3c015e42b	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-8efe-92c02d1a441c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-f310-42d25e978628	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-dc05-41e0f12fee6c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-1d46-be1581816d4c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-d05d-7feac2229055	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-cb99-dd55867dac85	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-0276-5f39f251aced	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-da0c-c417e39060ee	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-e925-aa6353b33630	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-458d-3b416ccc6430	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-8ddc-40d8441fee6a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-b925-e918b707b6c3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-5f55-052e434619c7	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-1401-51b4cb43f0e4	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-1440-bc65aea1a18b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-e323-b080ab23b217	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-1071-3da609a286bb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-a2b8-18748ecc02cd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-7e8d-b95c119ea884	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-820b-f0f6cf792679	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-dd94-fb33b377b917	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-4ed1-abf82874b341	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-6683-25d4efef8306	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-61f9-fe1e5a754d7c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-b8a4-dab88d27f0b1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-d621-cfbdecd0126e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-e494-eeac59c0147b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-9245-a890625b25e4	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-2e06-52a8ecff4f8b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-986a-fb9721205d8e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-b140-4d045a706440	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-9c2f-b7d143b7129f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-97cc-0aeb083fd919	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-b29f-a5a700e52dca	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-a294-6efa1143865d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-dcd7-173e997a68dd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-2d40-e5569faabdf6	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-f14d-acb401ef068a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-dcbe-cc09d0473df6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-5fa5-24867dfcd425	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-adeb-433386a42ef3	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-eaf7-3337cc051313	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-3917-0edced530eae	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-b897-b7d2059bb370	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-0dc9-41149f40f248	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-c141-5bb5748b5885	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-c240-187011e6398f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-1d44-72a9a2e90cd1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-98d5-3faca8226d43	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-43cf-e6b81f3262be	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-f3fd-14980cc6ceb9	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-f246-1603d3a83995	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-8881-ca1ef33f1b3e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-4a54-e332cf92aab2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-759d-acd368777b0b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-9713-c6de6b89bb82	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-ab76-904ab8b0be9c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-fe34-bf1e5df5edc7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-7378-2476b80d265a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-ef9a-2780ec762ea2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-da14-48e89c3efcd6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-2034-417d963c203f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-f304-355d85d552a5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-d0b7-53c8884d42ca	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-cd0b-310b431cea8a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-3507-8d7a4ee70cd0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-de55-e123b4763bc1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-210f-4246e4856b5f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-5de5-b2750d9d0bcf	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-c7ca-e0f9441c6e5c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-75d6-55a271b55920	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-7857-8c79a631e511	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-585f-758d7c98e2c6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-6802-fd269015f75e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-68d5-d3406680bf48	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-5c9b-06d2abc7a712	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-ce7d-76cea9f05cbd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-90ad-d822b43a8b05	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-3a33-d94596f1e28e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-f91f-e91f0def8e81	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-3334-8eee3067edbd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-fd2e-d96dff2c878a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-9275-c1f5453cef45	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-dbd3-cfaf7761aeb2	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-51a3-a84a0e5a7b79	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-6bd9-0ec78fd9c446	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-b9e3-a659d6f2cdec	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-d910-c7bfa5188c04	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-b16e-ba4107ede29c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-d611-5f135bdaa27f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-d221-4b373306d1e9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-5716-05d7613682ff	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-fbd2-36ff70863bcc	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-59e3-0b01d7d61a5c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-a03b-36cb5dbfbd45	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-0206-816844a35863	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-dcd8-99686bcd4abf	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-577b-08ced244df20	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-0948-3c1fa2c25ee6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-73d0-3292e100d860	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-61a6-4ea1d072ddfe	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-3514-1f97ee80b714	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-d3b5-fd4f4e8f4d15	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-a0fc-b76fa08776a1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-298d-40f7fe602b54	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-8b02-5a4ab01006bb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-7abb-7cc9404ba577	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-1dfe-ae2f0c947bcf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-987e-68a5f0325ceb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-23f9-f8f4ef004746	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-cfca-73186233f4f3	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-9e1c-5883d61162f3	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-aea5-75ce65d556db	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-bb0e-485b8954219d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-6ea5-ab86d8331551	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-b8fa-79967dd1a316	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-d1e3-0fe71741965b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-e73e-32404b939c63	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-63b8-7c4a18bcbd4e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-dfce-2eeea17d4b10	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-febc-47b73432b5b2	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-cc59-a7826898367a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-fde9-6e7e5d5b3527	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-ffe6-40d5b0a3c0a7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-9b42-faec5ae28d05	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-7e5b-419182390b31	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-001b-b66d16652f9c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-f530-fd60719912f1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-7dce-26977128c690	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-3215-dc9f520b0f73	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-11f0-c8fc85ca0cac	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-4e33-ece63d1fcec0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-4e28-45c7300eb807	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-5089-97c21a84c69d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-ea56-9fae40d14360	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-997f-f424def9af86	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-4a85-d2e917dd99b5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-835d-d7c57be9b305	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-c306-ad8bb786330c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-a817-b658c6a34abb	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-3ef5-db8218c367fe	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-0869-53d02d84aa17	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-8595-dbca5714483e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-56f9-31eec30abd1e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-4098-f579e0133f73	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-08f4-778940ecda58	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-ad72-5028fa2f0afb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-17e7-239d5aaae81b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-7e03-b49175080928	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-8472-1b209581f08d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-45bd-fc4630dde8b7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-d5bb-d018185f680f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-4d70-edfd32fd0d56	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-6568-cf05ba0821a5	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-977c-dacbf8dbcc7b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-2cfc-7cd47755a835	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-d9cc-02170208719f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-5868-a19e8c221213	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-96f6-c7d7c0e40731	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-d42f-ae6054b732a9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-35e5-307ed7ff5a84	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-46fc-55d481ee42f7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-376f-88040b668dd6	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-2956-873df3ee93d7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-bb60-a1be1fe85814	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-856f-380c7d8d5e7c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-2b68-f4f7191e3879	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-0961-ba37947dbf5c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-c7dc-b1825267cf20	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-44dd-6d1b2bab7c9b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-a558-f517f3159231	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-cc79-ae789f142da3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-a6f6-51f890940715	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-6242-b20d731e835d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-ea6f-750d84334d77	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-d7cd-52b78cb5b93f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-3aac-fa3a0a8f8de7	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-f175-4862e6580c75	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-10a1-2945ef41d591	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-0e4e-29801766ed3c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-e828-ba6ff6ad0bf5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-58a2-5c627427236d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-e83a-c8029e6cfd57	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-b22a-2c700eef2bcf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-ce63-9ba160e4d9d3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-c782-7c8077d5ab7a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-ccae-9037d75362d3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-f9fa-35fea69d6ddd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-42a7-71f310370484	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-670c-19bdb72ddbb9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-e54e-9250913c7868	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-c52c-64964f902946	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-109c-489124a6c9c7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-cfc8-97011d848140	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-6210-f59542f8152b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-c17c-c9311936fba1	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-e166-26d9f7306424	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-7cf3-6ffe0b8708be	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-5f6e-8d1e2144b639	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-0d35-8bc3112b39b6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-ceb8-0a3bb2209315	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-6700-042b3a948554	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-f786-b1c10e94e424	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-6bd2-2d82d14d94aa	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-48a7-573e1e7c72ba	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-0428-06c774c005ff	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-e858-5a12b023ac8f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-7d26-1d7fc892772e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-4ff7-18215474f69d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-3b2e-b4b228e6495d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-0e13-cf972ec38add	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-b9b9-d412f5e60431	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-3af2-9d70a03d3807	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-f5d1-f7f3c3f5036c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-bb9b-e0d18a90ac62	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-b975-708eb2e066a9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-92af-1e130ee4c691	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-b2d7-a3b1c956792f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-22f2-15a792f68a73	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-e931-5cff81857112	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-7444-7b21ca0db2bc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-031c-8417930db756	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-2bed-a48958c8af7a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-2097-255c42783753	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-ecc1-870f3074e7ff	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-5623-da5b2f3a4a2d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-627e-a2219618a0f8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-7df7-e9e143e63d21	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-48d0-efe35f61493a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-29f4-97b013bc5605	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-c42f-2c38c5d5bc26	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-3bad-1b730dc964a5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-1036-3b1c7c5984b9	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-9e0d-5ccc72aefc34	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-4307-a6888156e6cb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-8acc-9ec49ed08b05	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-282d-5aa8b6fac046	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-6b58-bbaf2209bbe4	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-b885-90da95d0bb76	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-65c6-a9dfb1316603	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-e9f3-f71432ae6ec4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-0b4a-475c6a729584	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-0038-04dfede64ced	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-1a21-5527aa8fe3fe	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-6aac-e2c5d789eb98	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-0a0c-dbda2e1b6600	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-56dc-bdb4948af51e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-7e6d-5189db2ebfe2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-e6f3-a5f1bd2cea31	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-4576-4de6b244eaef	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-767b-61b5064cf6f1	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-ca04-e328ce11f5a6	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-feba-76dd7c9b4d08	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-f95b-d9917ea15873	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-f83d-9dd2adb4ffc4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-844f-562e3bb7856c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-8f55-79996c1ef902	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-288e-4fa6e90df7b0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-43c7-b54bbfea71d8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-372f-23c2f84bb61d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-98d5-2d6d19e52ca1	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-e8c1-a4a8d77592c4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-9619-77794d53056b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-6fab-522420ce8f77	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-5c53-c37083063298	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-fdd8-b5f551236ed5	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-2940-6e9518ba1f7d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-4824-663da884e523	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-51bc-c716535e8d2b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-0b64-ee9cdfe5367d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-2bd3-89cd2228701d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-4b5f-94f20c31852b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-a54d-097d28b60ea2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-d493-912eb9241335	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-8d60-e8261d0a1643	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-9c6d-0f175e297204	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-f3ee-4eaa210f2348	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-b6cd-ddaace6d675d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-e39e-066f2681aa52	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-5415-32a0a9956ead	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-c371-a04233c9e707	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-d956-12e17f4aebfe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-26f7-313eeb2cc70e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-6ab2-73cf1bdd0f48	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-d252-c5a70884108d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-86e2-2fd6448a300b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-4a5a-e78ffd2a93c9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-51b1-f71c3854d956	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-855a-6feadfedc593	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-5abb-118058ccf1e4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-6bb0-38c659e65f99	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-af5a-5d1a6687db59	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-f6ff-d856a49d2be0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-6471-368781586ffb	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-d891-0f8b6beed646	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-3b14-25ee3cd52bed	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-f2f8-12e966066853	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-51ec-a3078eb35faa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-7214-b31a657eea51	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-9965-60a47aabf70a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-b3d7-8ab2e3d90a4d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-a209-2196f8780948	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-e014-e64d52ce7288	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-3dc3-8a45fdab0d2d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-0b67-dd7abd4e7bfb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-471f-df6b17020acb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-817b-0155cf237e4b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-dbb9-733c7e425e67	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-79db-f0f2b0bb9793	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-07c6-b0eac0498327	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-ee17-806833ea9d88	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-0805-3e42e4153408	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-e471-3c0de711431f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-c32e-d6ae9a561c30	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-2e05-2998efdccda1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-89b7-7db08dd48719	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-5c72-cb31f8d65a8c	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-5c5f-43139de02691	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-5d41-c7e3f875a203	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-3110-80a9be436577	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-6263-66600b4621b0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-fb04-3ba6d0e7c030	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-a5be-9622293dedb5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-d89d-c1fa4977ce96	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-eec0-0327b977a0b5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-3a3e-be1708b5c0b4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-f7c2-ebd34222242a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-6162-9a89c7edb5ab	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-1e1f-f0d9e1581bfd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-516e-a64d32fb6e82	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-1ea8-e22ea4974cde	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-a5ce-a5efc94de7fd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-c5c8-35d412ee93b7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-c73e-55605076b6ae	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-9f3d-bea4a8559a9e	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-ed7a-f1d03bdd20e9	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-96b9-f9ec3aceb21b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-8f71-1ce57859b3f3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-e07c-4c09c52c413c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-6558-ff3b1a30434f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-c486-9be1e50ddc7d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-01b8-46927f4748c8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-9652-ae8fdbb80b5c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-027e-d3e4116339d1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-cf66-f4b4adbae6da	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-89ad-c84f0280d0b6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-33af-1a44d6b09218	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-c60e-3b825c2c41d7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-99a4-a9a10f9a51a0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-c00a-a77febebfd46	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-9572-6cc45d780761	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-c3b1-fccf3fd99d0b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-dec8-909b9dad39c2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-3153-5e95145606ba	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-fb45-ae228872fb7b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-d5ed-c88269831902	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-08ea-ce5039217b9a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-9c13-2a01d4962186	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-e083-5dcd7846d45a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-96dc-2e18a594696e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-3d8c-d939975da578	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-8198-3ed5c6c83374	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-d65d-ff9bfbfc3459	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-fb30-83ce41103758	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-8495-69cf27d7a71d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-1c1b-17b9d73a82c3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-7dea-91c982e8593f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-ab3b-4571711d1fda	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-b4f6-a5601797a353	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-5023-1ea8ef29255b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-1550-6fddeb794cfc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-3201-e46604c23fba	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-f2fe-cb3c9a0bc8dc	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-4fe0-3d3260d72a39	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-9eea-3cc081da5e96	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-1a08-ed9fe947a6ee	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-7565-d8e8cb5d5c52	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-fc39-20018526b3ee	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-8713-c1c34828b1d1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-18a9-2be2541ebd23	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-2a71-06207a045364	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-a539-0337887e7b87	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-13a4-0532e976b420	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-2dd1-8062b2639302	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-d7df-da31ecc8502f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-3f96-731d0881b9bb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-023d-9cf7b0f2ea13	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-bff2-9df369c056e4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-bb12-ab7cc417be5d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-1a7b-aa1c319c97b3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-de19-9a0539a49008	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-1b4c-12125f10630a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-17b8-af2fbd5c2e3b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-57f6-2b62b47353ca	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-c8d3-6ba10a339d3a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-94ed-7750f8441cf8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-b75a-ec044a2f6a9b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-2f3d-280e4998dba5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-67b1-5bd956434427	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-d3df-76058097eda9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-6570-5de6d1501f2d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-8cdf-c791e6550774	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-e168-163205c0bd35	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-e976-23c3125e7915	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-558d-386156ca7222	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-f971-9a3ad0ab8869	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-5618-cf97aeab3dbb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-38c3-d5e5942e18ac	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-0cf8-db7960e7704a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-0a14-575f7d8c1c0f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-51f3-ddf3f192ede6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-947e-8c8ef20015b0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-617d-468bf20cde13	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-1c94-00761331dfe5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-b632-f03efe24eefd	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-9944-5f380601ad11	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-a1dd-6d0ef63ed417	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-281b-aa4f034c72d9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-1491-49804b0c89b5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-53c6-f1ee40102c73	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-710c-3ac7b71f814f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-9f5b-90b1ad574d1d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-6265-ff770ed0b00e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-42cf-99610595bba1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-b635-0c6a7d3d14de	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-2e8c-51fc844b5264	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-471a-01d5071977dc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-ffab-829d0fcd6a97	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-db50-3e4140139f21	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-2f38-fb4f7b0a53f6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-abd8-b5ae78fa7bb2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-6649-e8e64c91a46b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-b23d-c2b60885005a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-d89a-a58742fbdaa4	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-bf01-a70dbb949238	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-fa43-27550f69aece	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-b787-48dc0f0ef94e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-a9b2-1934fa86c4be	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-1fd5-22a1e5fc09a5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-5ea4-b75afee4ae2c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-c19e-5c52d61b6e4f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-1993-4ed343ade5d5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-f1d2-54a4d9723331	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-0069-090992f73995	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-3ff7-be44f7a585e0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-b903-f886b11a0618	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-764f-c57c294476d5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-47d6-34d9064f0b61	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-a784-f8f6afdcf252	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-1b62-0317f092d816	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-3b99-d7c333bff147	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-7a58-369591a5ab0f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-3d1c-f8b080778d50	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-5197-dc0cf95f2015	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-806d-fb7e1576856d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-023b-d52c87b0bcf3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-c25a-5578c637129f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-cd99-2466fd306cae	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-89ad-7ce8cf412edb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-8853-94e29c0e064a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-13cd-bac95580bae6	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-ac8d-9e1d4619e3c7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-a2fe-c03d4664357d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-427f-5a9a965abef3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-aa86-597d832f1967	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-c613-1304d73b1012	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-c8fb-e92b4089b45c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-560a-38d3cde82dec	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-7569-23f628d60201	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-7434-e016667d6bd4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-e2f3-1df89f11b6a4	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-0b23-eda76868ccfd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-721e-541b421a956e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-afe4-3d2c8b7e754e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-e499-7ae61ff7a66a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-f90e-7d8e5d165390	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-9a92-26ba51a99371	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-99d1-b01233691a30	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-dccb-f024ab3b83a3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-2989-1e0383338e6f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-1e9e-b5c635e4b301	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-6422-3aeddcb051b4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-0c77-f615566c3b5e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-0c81-12a36b516f54	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-6978-db72a0995314	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-ef60-4621c1885ce6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-3537-99b80a8e7d1d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-04bc-425e25659027	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-cb2c-79794aba48b9	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-a680-fc7495a955c9	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-307a-7fb27c15a39f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-4621-8452478d4e83	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-3edc-87debc0e4235	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-30aa-9fd75ca07566	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-0c68-de85dedcc52e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-8d37-15cf0fdd311e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-46f5-cd368bd3daa4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-da00-7e615fcdcf33	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-06f9-f4fec558a187	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-adbe-33d4c4b69ca0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-e459-2c975b2a6d5c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-31a4-b3cf8a2ee89f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-99ca-7a4578335baf	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-4f6f-bc3df042153f	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-e180-483234715e68	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-dafa-510c28d4d1aa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-b7e1-742dfa867138	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-c677-e6554bce4895	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-a0f9-02bdcf46e1a6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-6eec-762e743a8a41	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-8e1b-8ea5c998cd23	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-b958-4d547a627b55	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-8c20-628d31667e75	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-2836-94b6ebf64c7a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-3718-a5a91d2a9c92	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-b6b9-06d8189fc8af	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-a7e1-7e271e11be50	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-c30e-95a52459dbc3	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-6e8a-63d3d4b501a5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-cb7c-12e2f591d955	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-bc4f-7730b8962820	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-74b3-35b41e983283	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-5b61-f688ffe2f417	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-02aa-a25816022b38	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-55e8-0eb5d58d88da	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-0488-815c614259ad	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-4645-33740c86bb32	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-0f1e-2d1080dbe690	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-0900-fb548ed55ba6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-6166-7030b2437888	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-0caf-0ac7fb8ff234	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-618a-07ada0a16cf7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-80fa-b0b518f0fe97	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-1a8c-669de45aad33	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-8b05-b1148219822d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-5bb9-f212886fc76e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-4314-545760ea1dc3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-ddf0-d84953422eb0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-2cf1-efda6bfc070b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-740c-73de4da707ab	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-a5d7-86f5dbd4da2b	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-a9eb-7c98ecbd4cfc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-2cc1-2ab3d21eb435	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-a0f4-3ff185e20da1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-ce09-7d9e5d90cb8a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-cba7-8b205b29ce5e	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-3c84-8c7f24e33a10	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-80b1-8753dabc0836	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-313b-43dd6382a8be	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-27cc-8e3bb55a8665	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-9670-af30e5dd7fe6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-a1c5-8101d3112d8f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-f369-20acf614629e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-e40e-f410d9430620	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-08fc-6cae6c7381af	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-9d49-b2ca8932d739	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-6c59-98935fb8023f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-14a4-5fe8db3c8e52	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-7588-e414078f675f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-d099-5e70f7917fdd	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-8263-67073f0d3119	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-3455-bc10f7d50961	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-caf3-8cbbfbade120	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-c4dc-9a8410d34808	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-b7a9-8c13092c41b8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-f09a-da8e9f2afcd5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-68dc-baa55d6b5900	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-041b-380714433de0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-25e6-fa26d149cf74	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-d30b-a75435ba6dd6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-12ea-7dd0f074e842	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-3b0a-38d426d8f74d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-c19d-2d42109054f5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-8775-91c29f9ab5a1	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-2c59-02bc68f72f58	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-4bba-1443ad2d2eea	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-3f53-2b94de380a65	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-8b25-65d135c2fb61	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-71e9-cb46e7300297	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-21cd-3b56072ba17c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-028d-c7d5c2e9bbc9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-3ccf-ef7cea6dde24	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-10fc-5dabf452aea1	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-ec6c-df75f30131a6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-f554-656c17f39b48	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-c384-452844d5b2a9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-ca0e-689fdfe82e8b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-ccdc-b8adc3a5fcea	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-84f2-45573af381d3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-0529-8b1ea237ee0f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-d054-7d72f40d348d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-02d7-4820eb6d83fa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-52f6-09010639c8ab	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-c9ff-07026e6fe49c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-c9e0-85231078f282	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-d26d-0aed678542ff	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-6422-ea9f151babc6	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-c3a8-227bfa1d2849	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-5938-eca6c0b85759	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-c77f-29af06bb8ac5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-c7f5-9a9e2d27abed	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-c89f-0135d7ac5394	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-4a5c-03a72be2704a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-4bc1-d9572b18d42c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-89a6-a2e9790b0428	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-d832-0830b4e5f3d7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-6bfd-2cec8fc56779	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-b40b-29647dd08a82	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-a47c-b4fa80c8df41	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-5c9a-cecbe2c81a83	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-141e-5e7eebc5fe7d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-79ba-f61ed917e7b5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-adf7-fd134f62806c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-d0ab-b8048c926f01	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-9f69-479af6b01db4	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-1855-86815a0c0d0c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-2b84-212cafc0f9f0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-60cc-484059f41f7e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-5c28-9fb77a7dd47b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-eb86-14c964108253	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-51c2-8ca65e482361	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-8037-4817e6ea7e2f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-d7e6-d4cb05b8d1f6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-e56e-f5607ba6d76c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-b7d6-d357a182c62a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-b477-dd70abb4b29f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-8fe4-e40b8dffca95	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-2048-134f0074b0c4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-1726-9bfca8cc4699	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-3d78-7b7337e01ac7	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-18a2-db49f1b0fb9f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-e7c0-4edbb70ae9d4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-e653-4be0907aa733	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-4ae8-dc50ce744aaa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-91b2-9e725a285b63	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-2a1d-8a7a5af8cbbb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-25e1-0b5954b015c1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-2813-d4ac0a8fc290	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-6e9c-965a275bafcc	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-d93c-14a6efbebf35	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-6cb9-a3e8d76eb375	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-61c2-0f5ee49a54f5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-b3fa-15b78ecc0443	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-8c31-2725f7dd618a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-f613-3c0a6449b5ed	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-3af1-461e74d18e56	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-feae-93c08763eff6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-f6a7-49ef1ba0c812	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-ae7f-d39dc6e37cac	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-552a-ac0b7bb6715f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-b871-98a3b9cfcd30	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-a930-dd74fb5398f6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-d799-30e2fdf976d1	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-824c-948beaca8063	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-8c70-f612c7b70cfd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-197e-a354bd6c9f87	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-d242-4bd43dedd2e5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-43c0-403946c0d4a1	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-4d5b-76fad3314d97	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-6f41-4b7ec4315ae7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-df59-0efaa6bb240e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-5de6-6acfe67e4ff1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-08b7-5b74a364bd88	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-7f9b-d8747b8f652f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-619a-69fa2f20f528	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-4ae3-4b8c5ea05e60	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-cca4-e8b4fbfb239b	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-d52c-9784ec736e83	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-f17c-a92695922b45	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-24e5-6d3b182c8ff3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-1757-4b2f4fd293ad	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-4218-569b047967bd	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-eb10-bb5f72148613	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-6ece-66d109572291	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-ca7d-c58b444e2dbe	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-d031-b6261761eaa8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-4244-ec83a960db69	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-6e4f-ed46eb457a99	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-2c69-d6dd0cda17b8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-7c18-79140551a383	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-cfe7-af116076171f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-c8aa-8566ca553ab6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-aa4f-f1c24d6d3977	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-067c-36d037119d5d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-b050-294c14f092fc	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-a85f-b90890b73608	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-1b2c-c5b8c537643b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-6bc9-555cab456e86	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-add7-0ef852dc39c3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-a9c4-6bf43485d40c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-1042-6870c1b2a4c5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-69bf-2181703fcf00	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-6082-539c7a655c93	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-7bd2-53edecf5231a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-1435-02e5b81f7f3f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-f8fa-6c819417a692	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-9d77-e3913d78a052	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-5fd6-c41cb3d7cedf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-fdbd-e343a0799f54	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-97e1-ae5ba1057690	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-f432-b97bb8796e9c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-84dc-6333e55ce5fc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-9b05-38e6646cad75	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-7a6a-c70317f8b173	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-36d9-845a5d0252cd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-6bb3-8fc075b7a0ae	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-96b3-ac247e5cf0db	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-af12-c17c3501e3be	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-651c-3badcaeb0fd6	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-b839-05d1ff4cca90	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-786e-8ce1d341c208	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-9c36-6b5783b450b9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-6395-b9ac3ac6cca6	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-27a2-bb2613a216c1	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-70fe-bcba9f0fe44b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-4c52-68fe44017eae	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-ce23-4a4fbd566f3c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-5cfa-7ef803df6853	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-a87a-35981a64f93e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-285a-f4936e193824	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-30ad-068ca26c6ac5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-2190-63155e469d07	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-0f43-76876c510d63	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-751e-2fe6574a106a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-2163-a0caf784c137	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-63ed-2b0650fedf28	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-89d7-15f7c2e98ca5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-6602-22ccf1a4a83f	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-f3e9-25e096588b0b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-6712-2e196bea52c5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-4dc3-028dc6066d74	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-9cd2-84ffe06dbbc4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-53db-de4f0dc01122	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-3427-6c832f4eda36	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-627f-f8af8413452a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-4627-51c44774052a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-c8b3-2b2559a8340c	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-5bea-1ab2d4baa98e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-ff95-639bd9becc7d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-1323-8cfc292c0cab	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-a819-fb191e8f1ea0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-685c-12c69597f8a3	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-28d2-fa77084d533f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-cad9-a48b3b1e6695	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-8a88-d307d20874b6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-13af-dfd83f5b17e1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-0c9f-553736c9ddc7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-144c-1421eaba2647	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-2d66-4bd191b0c6ab	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-405e-7c12e7810b88	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-eab5-6fb7914d2f8f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-7bfa-b7ad8fb466f7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-eb6d-c9d1f7a936c6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-c7aa-f3710ae520c9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-9149-528e9c54fd93	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-74f3-79178c506913	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-e8b6-9a125572ff4a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-c1c4-d4829ad547fc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-8f81-61f9402ba106	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-77d8-622842815a8a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-c271-6c2f9a10d05f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-3b1c-626407f787d2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-6631-cef32a655f5b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-87aa-53a8f55547c1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-c790-ef916368c6e2	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-abe2-4b4eabc60aa0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-55e7-d1d949178161	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-be69-f57570e06f29	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-e8c1-f5a6daf26e53	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-b72a-164c00ed5f0c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-d732-acc108566d6e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-6f59-ccde3f54bed8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-35ba-a2ff13aa9d90	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-894a-aff7f41e55ca	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-3f20-93d606f1963c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-29c7-d0f56dcf732e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-9741-bbe2fc98a7a7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-931a-df1d077fb0b0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-e6d6-384046f43140	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-2c0b-7b3721a82094	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-ae41-4b223d23a9eb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-94b7-7ef68063ffef	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-e030-9089cf5842d1	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-2f7b-5cfa8565711a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-bbd0-79be8cfd62cf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-f7d9-3cb78fa141de	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-cb86-9a51d623052a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-5780-e6d2b7e7279f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-22cf-fd72c0701319	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-2090-4aed35235adc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-4e38-e3ddd9bd3215	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-df86-81638b6210e3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-b7ba-f664263379a0	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-0d05-6e78cf22821d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-1f26-5b3f259cb228	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-19a7-da81d56a7682	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-14a3-11af554010d1	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-f59e-ba748d7a6a05	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-4156-f54041a8279d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-362a-3b34617d816a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-6fca-31d2a5000bd7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-7ce4-c2d4c516bd88	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-b021-21a8467acd39	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-a0c7-b2cd47b96bfd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-3103-bc9e12b37e99	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-8114-ab990c3edcc0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-15d6-5cb0142ecb53	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-4d36-a486ed422895	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-450d-9a96060899f4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-daed-225cb9b91ff3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-aad7-93af4a64c853	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-a17a-a0836baa1d29	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-94d2-5903db05ca07	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-8328-464cec494479	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-efc6-7cbcb2d906a4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-2040-dde1e4c6e941	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-c5f9-d0224d499b11	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-4642-3716b1461b16	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-b16f-d7f2f768530f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-58a7-6913beb1fc2f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-b1a7-40a34c80b120	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-4aa5-1fc4cf2223f3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-7ea8-ec35c49eea22	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-5508-cdc989289dd7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-c5fa-f472e23fabff	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-b10c-d886ffdf5b1b	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-2556-afef563b239e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-70cc-c6a313814350	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-94da-bf68f6c0cf3c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-d071-5bad27ec23e7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-a52b-c7e2f2293541	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-d468-e28e5b40a3ad	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-4280-17555fa6491c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-570d-21248ddd033b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-a254-b8b5392cd0e9	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-227d-1f192cc844e8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-51eb-e2f6d9417bea	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-1498-26cb4abc83fd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-7fba-814439d27528	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-3013-ff10ae7b1cf8	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-0b57-3fc804f9a49a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-de8b-86bd03e2d48f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-1f94-b9b024acee7e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-ded7-f5f4917c4d2e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-048d-2ce95f7d8565	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-b9eb-4d3fc633060d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-7fcf-6e1f16a9534d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-9612-f7ea19ea4110	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-fe1c-6dd33f51522d	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-66da-99a44be97f37	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-3c7c-b584778069cc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-4d4d-1dab2dede458	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-f422-e62f30b2abc5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-9d11-80301ee007f6	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-1bee-ce38455a4212	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-8514-d4569ebaff6a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-8c89-382ef16d6b7e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-42c6-086dd06d7dfa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-105c-bc1df1e53083	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-e64a-92484a6d51fb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-6e86-eaf4549721ab	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-b236-99ba715af827	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-f142-ff2496091891	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-bd30-51ae627a943c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-bfef-81c5b8822842	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-2b5f-9638135c76b3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-4cc3-ef911f5861ec	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-b803-0e58ac0746c2	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-5288-40c998c602e1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-f360-c3c71aaf0cc9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-471c-6c1ba64dc18e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-08c9-668a247a097f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-73db-2a8d3d9ad33c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-8927-8a8ecd2a57f4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-d6fd-a5e6edfad7ed	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-8237-b2b76b316126	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-b7de-a6cacf633830	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-4656-c7d47f12d841	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-e0ce-0cf54a0a17ec	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-5ba1-39b28f0bf895	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-5a94-abddf5535877	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-313a-5e11541751d0	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-fe0d-107fbee2b395	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-93ff-f1ab69a9dfbe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-3811-153f164c79f6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-f667-5b67b7ef81f1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-2b81-3aa012778486	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-ce3c-d13767a148dd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-6948-4a21e82fc408	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-f26e-d49ec4d36fcb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-e7f4-a100ea3e2bc5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-1c8e-06e853f210d5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-76fb-b865ae7633b8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-b796-40f6f8c0b1bf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-01ab-dcd064aca7cb	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-3274-59d44c179a26	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-5813-2310a70c5000	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-c7c9-8040b5e1a618	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-3684-db28b9806f68	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-9a6d-c4819530360e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-6800-4ed34f32deca	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-8c4a-af11030a286f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-02c1-c8f7c9cf0f62	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-3ca8-46e096254aee	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-cab4-b7b42e884ab5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-4221-045d0553c520	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-ffab-00429ea1b68b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-4242-3b43634b0f81	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-2eee-4293501ddfda	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-1aa2-2c414a36bb6d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-56a1-b4d784d26339	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-84ee-5f08729fd7a0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-6532-18f7c10b5e33	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-0dc2-cb5a58e3b13a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-60b7-d51d8e66f118	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-3bd3-8e8b4e704cac	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-4adb-13cb15499bf2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-df90-871e069cd4db	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-1ec9-8a8f81a30ce2	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-d25a-35731dbe6907	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-110d-cb1fe007df74	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-f58b-dab909f6f9bf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-cb80-44b9f6c8feda	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-18db-a0babc698feb	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-a1b1-8999ad474597	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-8a20-5ebf09821ce7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-a069-4438491f5705	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-9925-b5f6478e7860	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-d400-f9cf7f8d661a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-7a5f-e11def4275ed	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-f81c-ff3ac9a52457	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-aca0-6ffcd22be8eb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-ad1b-cce9880aca99	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-765a-0a19cefea8d0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-85de-9f36acb233ac	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-d878-6b6849dfb5af	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-90e2-d07a863ee755	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-37ce-b5dd1a0ce3ed	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-ffad-695d1d0b58c4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-bf9a-ad2ca2150f06	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-5304-8908398ac6b0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-4f08-2356afc45158	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-727e-53dcbff9c4d9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-2805-877dd3deb994	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-06ea-95170bf87e53	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-efa4-ecd560077033	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-6ecd-a18c36b0b24c	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-504d-aa44589b2c73	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-fe8f-5fdeecb235ae	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-977a-354d0ca8bd68	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-22e4-cb93deae9ed2	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-e7bc-7fd2777c7773	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-3d50-ad8fcaf5340f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-4e06-03c08c649800	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-b333-a1d4e2fe5e97	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-77fc-ffe244d4a1f7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-1b22-b57c411c8ba0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-f9d8-a88453717ae0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-5852-56f54ddd2874	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-43d0-1931ef1f37cd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-da99-a47ef5b59e01	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-f9d5-c184613aecf5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-8275-5e54f3a7363f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-9bdc-10c28dda8f05	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-d3fa-c70292b07437	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-e1a6-63b52ff7e41d	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-e55b-143fdc5033c6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-7d5e-fce393fa4d1f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-2b54-8795d1339dc8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-c02d-2e079798391c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-c74f-e3e5a845f35f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-59fc-4dd9e84d1a56	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-9b28-fcc22306be8d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-e7e9-5868fca4bc54	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-ed97-81f60b742080	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-c328-c049d7f8d782	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-9867-f829f72729d8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-fecb-fb8bd23ab4f9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-21a1-000ee6c2e71b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-3fd6-99d5c407182c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-dcb7-6016b285dc00	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-fe01-189a69936bb7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-7b21-56ece7ef862e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-435d-174cab180076	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-e3fb-52ac99f3be89	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-6755-48cb9ba5cbe4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-1e94-072027756c11	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-db23-01643ccd2514	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-498f-dc904163eebb	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-f27e-64b549b4268f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-f776-0fde3786e870	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-af3a-2e175f5ceca8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-2bb3-9063fce0e269	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-f394-235101bfce00	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-f0de-27d617b49b00	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-a74d-4b8d0c7bb2e0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-c4bf-0cc472c1cf01	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-ed2d-d25060ed0f0b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-3d78-dfcc15bb9e06	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-127e-9763734865f2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-46f2-c8e4b077b12a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-d965-ba7d182a84ab	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-77f4-76dd7c44c728	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-d0af-135446629db4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-8ecf-1c4f79bf208e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-afbe-716d13f457f9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-1ae4-008476207742	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-3217-69d06db15e4f	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-d797-9357a49f5e77	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-5c4c-0cc14ac52dfe	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-f03b-30255d9f515a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-d09c-fc7aad2a1d3d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-ce76-4408094aa377	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-ceb6-22d821f6d676	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-f5fa-5462b56c4cd3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-d1ec-1d1bfbe064a7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-fb44-dce3a4c4c70e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-759c-51022ddf3065	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-ac13-15d3f4b05117	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-b0a4-401bc5c9a7d5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-8070-04ab021b3e63	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-0bae-7b8f406ff072	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-1453-4226e571e9be	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-9d52-03fe6c632ddb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-128d-87f955530db3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-90f4-c0298876eeca	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-a3e4-df062a4885b8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-c53d-64042ec81aa3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-d97d-4324081831c2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-6ef4-baf436da0b4b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-c9d6-dfa5e4b9e1ed	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-fbdb-036bc325ed64	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-8472-59f3eff8b4e3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-8f1b-6478b7693612	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-f84f-b2654cc7a6f3	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-7028-885318977043	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-3472-c1a746fc366e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-6453-2fa85257c0af	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-3653-bce6c14acfaa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-47ee-128f4d2e21ec	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-3408-ef7ad1644080	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-8da3-0e2bd16995f6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-573e-1fddec1f9495	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-2dfa-c79e0e383c36	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-e094-c8053f1724ba	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-f674-1193c92177c7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-bccf-0302979056a8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-3c3a-d0c931d04bed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-d6ae-8619e7cb43d5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-b00b-e45b8276b7a0	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-ba60-93bc05607fc7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-ce72-fc9f95605eed	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-71d3-1a457576c178	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-ef8d-cbf1dfcc0ff7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-d633-0e03119b2abb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-3976-434c1d2a2a05	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-4105-ec5b3886a94d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-a00a-ed1c6f75375f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-9863-212b46dbb6a3	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-afc0-a588248e0e56	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-c173-f2cc2b1d0345	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-bacd-b89fec1fd35b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-e706-d05ad16bc03d	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-3f84-7f95b4bf3a15	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-6d7c-2698bb498274	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-7f23-208cd50ba0d4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-8e15-a0fe18d8d880	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-f5f8-93a684a2eae6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-1e49-721531b9d355	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-77b0-24dcf3556027	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-9e03-e24a5ca42a30	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-a67f-d7906ffc1eb4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-74cc-197f1db28e26	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-9082-a1c524f1911f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-7a76-ffee391219f5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-2242-224dee689578	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-b73e-2fc97bcb3c98	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-f359-0c8cbe8ba0ef	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-0da5-c882a170924e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-3d46-cb9f095a9d9f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-63e3-b1b5eac15a24	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-d03b-0f3aa951132e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-d4fd-06a6fc23eb2d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-2e90-992d2d401056	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-d8e8-58002a785a8c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-c3a7-512762441497	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-4423-1e4397992f49	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-81c7-9c29fb59448a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-cfc8-9ae5eb9fa689	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-4592-541952ca142c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-878b-c57cccfb9c1c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-3f7e-0203f9a312c2	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-7be8-f6273831aa88	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-9db3-14023b48b8aa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-eede-e6f87201097f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-edfe-4c47318f64d4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-df9c-5630f9544b81	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-baf8-7faca8c93e7c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-168a-086e28270001	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-86eb-afb345b1e398	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-1671-f6aa5d58352e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-17ad-bde9ee61d985	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-ed77-f4d7bf2a6924	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-99fa-f12244641b09	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-e33f-e7d1a5862b43	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-f2e7-a5b9956b7990	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-fc73-c39f311b2cc7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-7251-c444ea03efa7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-fa6b-bf42aaa0eab5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-1104-6de9d49a734f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-9c53-24cee7441325	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-a9a1-996e259665e2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-0743-5e6c85c62919	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-3b9f-314ea4eec9f2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-c596-0955fe908cac	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-07d1-eca7ee5ff02d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-f2b2-b1f3793c0cd1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-87c6-abd8821523dc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-f264-e7a77f5c4fc7	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-aad7-830e0d6134c9	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-e0c0-c1693175b9a9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-32d9-1274f0e7f888	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-7ae0-9785526d1287	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-35ec-6764e94b9f55	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-5ffe-4f816965e8d8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-1404-39f0888803d9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-f9fb-bd8a3ca321fa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-3720-b1e2acea3c1b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-cd1b-48954d7a2c63	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-9f75-75c5738ecbc7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-68a1-7f15815cd80a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-ccc8-ca653e409ec4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-b84d-a540c1631ec5	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-eb34-f895aa7a5b85	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-bc88-b30b03307e08	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-42cd-9acc7d47ec65	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-73a5-6b4dae605bca	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-4b73-3b31ba2c2609	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-c8c1-00fe44025243	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-ea7f-f5d2ff19d816	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-19d5-49a6c5d16d74	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-9781-5105796ff281	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-f9a9-66312b9a9907	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-8ce7-0e966447cc29	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-cf2d-f2a3570b8452	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-4810-e5597b366096	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-9aa3-44c4a902b922	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-f293-14b6151af633	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-6312-40ef646a33fc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-ae7c-fbb8578a972c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-22a0-8279cf1b2edc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-6561-cfd7623f1063	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-b327-e0e18088c76f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-a7f2-ca36b5a6d01e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-9962-1c6b7636fd7c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-6281-29edda64ce08	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-b04e-c3358a04cdcf	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-0241-78773384c243	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-8504-62b5aa0d6db9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-957e-fe9d72a3601e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-2168-04a670f5c81b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-9be4-8c93f0f2d913	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-1d0e-d68c85c3a922	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-3385-477a09bcc2c2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-5132-768e5cf1faff	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-7345-aba6b6144887	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-3deb-9e0ca4bc887b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-92fd-36f922d948b2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-99d7-9430728d985a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-271f-bd727327ebe3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-922b-4cd6f07db0ca	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-1b7a-8f2e5089005c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-96d9-5738820bd663	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-5c80-13f6b7049659	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-5b5b-4c9a3385876b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-0299-c473afa6d09a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-0f8b-c5a2e89e7a14	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-8696-fd0727c786cc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-53fb-583b26c8695e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-91bd-02934a51cc60	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-b8ba-b5919c732993	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-c128-a1fc19c09646	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-5688-039a01772a72	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-cf9d-cc1762aaf84e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-1ebe-18de68ac7fad	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-899e-deb5124ebb8e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-ad07-d719362a7034	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-67e2-8c99913fe18b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-5814-73da8c55a52c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-7e50-a9ac92663351	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-5907-d95a4badb7cf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-449f-1be6b47e1229	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-12a2-f64ca8fe0d57	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-cb98-f897205fd864	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-eebd-9b98839310dc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-7c0a-016dea39d167	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-0e23-5764117e60bc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-630a-bc26f8dc23eb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-aedb-ad42bfda114b	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-43d3-ddc5ec2674f6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-322a-292ea3992d86	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-fc7b-3c4c404a2a30	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-69ab-bf2b869dd594	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-2f7f-dc3b8c48e5a2	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-16bb-ddac41b5b83a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-9dfd-dee17ba4f167	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-78e9-7cdf11fa4360	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-b4bb-46b82e77cd1a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-07d9-9ad686471ca4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-7ee2-ff9a5887cd84	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-029e-e1e80f140631	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-265d-2be95ec1e659	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-cf80-cd1539920374	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-08a1-c7e0384dc321	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-e2c5-3e73b6558fa0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-205d-ed201d3da8f0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-3623-0be1b7684d3c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-550c-bca014212199	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-4b93-95498e90e1e8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-ddee-7f1cd6d97e25	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-5ac8-8da5a82d94d5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-3aeb-63c3d1faa3c9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-f171-f65343410e4f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-abfc-0a994d0c1eb6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-6b5b-e18dce86563e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-3800-a0bd690d7659	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-374a-7868c94b0626	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-70ea-fe971aa243eb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-099f-5134baa262bc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-a0a9-fdfb0050ef48	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-f93a-3c38bf5df840	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-51b7-b0e318364186	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-537f-e1b29c0b6609	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-30d2-71b84a7f33ed	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-ec33-f5a29292c1e6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-55f5-f96dfdf4dfb0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-1017-bb792d373740	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-3779-94eba05720b6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-843e-8746ce3cfd29	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-5fa3-01c40e13f14c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-4afe-01aecee698e5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-104b-dbe198c9851d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-d76a-3fd161bc9511	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-1ebb-59f96ab70dfa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-e2d5-4f6f3c965d87	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-303f-bc11df6caafe	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-e536-23c27c7b613b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-2896-1f544a8112c3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-fb8a-174960b69704	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-3bc9-4e93d986058e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-e378-dee6aaaf81fb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-6b53-82af44967175	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-8279-c54dfcf7eb93	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-3454-3f1745147034	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-ce59-5fbe0cee566a	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-0ba4-c9ee4f8aba8c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-34c8-5bb72126af26	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-c75a-baf7c76bd078	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-9f83-940e4d5c2b53	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-aab8-8a3df0e2bdb9	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-0443-6721853c5d78	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-8fa6-2f7cedf8bc96	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-fc33-109ee1f1371f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-46fa-af681e0f9d38	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-a78c-211c1b588dff	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-d0f8-566b0f44701d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-7920-8c37562a5fc4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-a7e9-c389963ee16b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-1c48-e36e98639cd0	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-5e27-085592448e2c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-b0da-d08b89dcba3e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-5866-cf00b364b4a1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-30ab-0ab5050fa87a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-7096-ff3e1d134142	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-0c16-7fc9c47aedd5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-f351-f3e4511fae38	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-485d-a0210694afd9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-151e-6ea4432ad72c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-ac5c-4ae18baee080	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-54d3-963a10c05fc9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-12bf-e24a73967f32	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-c674-c43da7674d19	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-5176-249132bc2914	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-7399-f370a875ad89	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-7e5c-d94c0acdce03	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-8a63-db7992601656	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-13c1-d410ae4d2d4e	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-c83d-b6f06e5c5f80	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-0a49-345904c33e53	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-3f06-0a1f1878a704	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-ad00-09250e1bd88c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-81ed-33a4829102b6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-b337-e58d3ed6c492	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-f2b5-a4253a404753	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-ad60-4c124974935c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-06c7-57c84acdce8a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-7c82-7faa8d631bf0	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-9d11-6e6896a84ab6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-5c15-39d3c0c14bfb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-ed09-3dda99e8f907	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-0e76-70c08e4b76f0	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-067a-94d97acafb2a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-50bc-d6b278ef4763	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-19d7-5446420c3992	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-e78d-d07249503d5e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-557b-3fb016f71f0b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-e9fe-97edcb6eb5aa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-0d44-48fa77e5340d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-b6a3-e829200f79fb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-eda9-36e227cf8e12	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-0b85-8b268528e8aa	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-5733-6de33787241f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-4ce8-b9a3a8845e9a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-c256-b476a0744268	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-1f31-7d42f4c7247f	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-eab3-048a209e0d8c	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-536c-110f36b72012	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-794e-ff166fa77c65	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-edd4-5f224318e08f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-eeb5-b99bf3736d34	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-eebc-474d43948ae1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-9957-9135760f4ced	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-3bb2-039edf69fdc4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-cf15-90537bc18704	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-597c-21038113ce36	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-7588-18eda4c61ddd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-41f5-833b3c49d648	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-c5a2-79c9b7f8666d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-b60a-927588f8b135	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-df4b-9d22a258e452	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-39a9-d7203c45aa80	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-57aa-d4209a72d813	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-4d75-e191e51b1fa0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-2b48-8996d887ca46	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-3243-cf18dc2cda37	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-2df3-361ae75b8517	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-cc96-b09d9e354bd2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-f558-a415d92aa245	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-bb17-ab45b80e22ee	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-389c-6a4d7708bdab	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-6fe4-679346dd0474	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-41c2-1dfcabbd6454	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-a3ee-7a3d4889dd5b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-39c0-e76104cf4689	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-4194-3d18bd05025e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-bf2e-065547ad5324	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-b900-a11b5e36d82f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-1d7c-867a123192cd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-1a4d-73be9cd6f4e5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-1623-076bce769b49	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-9df3-bbb4e4fd624d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-89ef-a97b5893394c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-3dba-19a08c0ce44e	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-6e3e-fab6f6aa80ce	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-dd36-d5393884df0d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-3138-3e70411608f0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-2281-0f9887f4a7a2	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-5181-921274e4d134	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-e42b-6572fd775bd8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-8b77-8b3c9370e228	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-a31a-e4f2a1341fcd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-5c66-bfadcddc3261	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-f806-877b94d86217	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-721a-95e35df023d0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-b727-4398bfc84601	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-0eeb-00b00e4e3666	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-a8b4-7e8ce2c433c5	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-5216-3168c89686df	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-8a14-b1310e963c17	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-4f54-28dfd26c4cc3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-7cdf-1788d3a46c00	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-f80c-fac4c278aa05	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-a415-6a3c3e0645bf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-09a1-4e708ec1c897	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-3018-f62ac979961d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-5a08-9e42e2572ab9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-185e-a4f94cfd2304	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-067e-d6fff12da3ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-2d3b-8ef9b30d0c35	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-3711-d34c19488636	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-fa6f-c21dd6fae19b	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-0468-cc0f4e63f0d7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-2a26-5e6d7d55762f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-6691-0335e48d71a8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-5bf9-789f63b0993c	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-98c8-830ff2b6a9c9	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-c4d4-258640ed43d2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-e4bc-f04983162e9f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-6086-c3356eba4563	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-289b-27d9d76b2d3a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-2997-a1c69b16b052	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-bd33-27e7f7fc0b38	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-893a-37cc43d8e8e1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-a23f-cb04c5b9bb58	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-1b99-70fe57ad019f	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-24fd-41ef6211baea	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-148d-ccb181b958ea	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-0daf-71be250da33e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-2b68-1a746f8b4147	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-f1dd-fe866322ab27	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-932e-8a1f8f3fb13c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-78f7-8fa0279feaab	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-895c-ae52326d6508	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-b8c2-ca1901c1d507	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-c1df-d8ddb7282f7f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-c4a7-a5c27c30c2dc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-c43f-3f825957f7c3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-2a95-a24622f036a6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-48a2-2f07af4a7faa	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-69b3-2cb635bf33da	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-cf71-54ac2bfd7e90	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-0a7e-0b2af4cc7828	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-7448-cf2134daeeaf	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-2169-1611955b4012	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-0504-afbdb59eb4e9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-7d6a-0967e8f911c8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-27e5-f4b3a5b12018	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-7e19-61dfbae323bc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-3e0b-9fc8e26ca7ec	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-56c7-33a6b692051f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-4387-ad05d614171b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-3cfe-3f41e4ccf89d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-2178-5085e3e14f73	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-937f-8e844172a37c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-a526-d7e28afdf0a0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-005b-bcc6486af1fd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-542e-9368d9cd6e3b	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-eb1c-4cce6824c9dd	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-8530-e41d438ab61e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-4337-f72cd84afb42	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-de7f-a1969cf4966d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-796d-ed9a88ea2417	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-295a-c134e7d2bdd0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-f701-9776edc96f51	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-c059-f715cf63287c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-b51e-8848b00ab17c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-ea9c-5efe1e57d0c8	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-72b1-ea3e70f9db05	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-0103-ac0b115c204b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-0a07-4f87e9ee3d49	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-c539-fae939524f7e	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-f042-4fb201dd310e	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-c3a1-e15e8455525f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-aa1c-b67b05c8fec0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-9b6e-e4528ce0d798	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-24f3-620da659b0e9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-af4c-e0ab7117d1cc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-1463-0c1f38efee45	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-a5ec-54435cfbdffa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-7443-31a59c91d3d0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-98f1-5d7d22c4ed1c	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-b8f0-bbd61500c820	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-6b89-00f664c7e3d1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-59e1-c243bdde691a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-d106-5113ce90524a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-c1bd-de07068d79c4	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-5f8b-740dc8a41ce3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-dfcd-3d6f98c41973	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-4649-944cbefb7293	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-4483-6fce8c7fdc47	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-7c4d-870146f7e7ac	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-6779-7ad302c5f178	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-ec53-e8c1b964b20a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-9a87-a45d2a02f03b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5537-8fd0-c2bb-8a1b4835b2ed	User-read	Aaa - Uporabnik - Beri	f
00020000-5537-8fd0-98af-49ee14cf0b2e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5537-8fd0-bfb4-531bc6f040b6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5537-8fd0-5ff1-118eaeca6674	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5537-8fd0-9aeb-55796338b82a	Role-delete	Aaa - Vloga - Briši	f
00020000-5537-8fd0-c9f3-9e782548161a	Role-read	Aaa - Vloga - Beri	f
00020000-5537-8fd0-b4af-463cfe79f9d9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5537-8fd0-f353-f950f8c59a07	Role-create	Aaa - Vloga - Ustvari	f
00020000-5537-8fd0-52b3-b3c243e01ff5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5537-8fd0-c1c3-a500c7b588ea	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5537-8fd0-2e4a-48bb4fb83fa7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5537-8fd0-7c31-a1ee5dc3bc72	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5537-8fd0-85f7-10aff5282772	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5537-8fd0-23b5-ad43cc29057f	Drzava-read	Seznam držav	f
00020000-5537-8fd0-93ec-0e9778ebceb0	Drzava-write	Urejanje držav	f
00020000-5537-8fd0-e109-ff1f530aa65e	Popa-delete	Poslovni partner - Briši	f
00020000-5537-8fd0-c21a-bef029ffa5b1	Popa-list	Poslovni partner - Beri	f
00020000-5537-8fd0-a942-4d1ed9b994b6	Popa-update	Poslovni partner - Posodobi	f
00020000-5537-8fd0-f0db-32d312a20249	Popa-create	Poslovni partner - Ustvari	f
00020000-5537-8fd0-54af-24547a32d744	Posta-delete	Pošta - Briši	f
00020000-5537-8fd0-b0ee-33f51a06f332	Posta-list	Pošta - Beri	f
00020000-5537-8fd0-4e72-e0b80845bd73	Posta-update	Pošta - Posodobi	f
00020000-5537-8fd0-7e94-163e61942300	Posta-create	Pošta - Ustvari	f
00020000-5537-8fd0-5126-1af0b27c2307	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5537-8fd0-a1d5-a8fc80f865c3	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5537-8fd0-7b13-b3adf123b2b6	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5537-8fd0-3acd-f47041d17e47	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2637 (class 0 OID 743933)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5537-8fd1-55f4-f9850c87afc8	00020000-5537-8fd0-23b5-ad43cc29057f
00000000-5537-8fd1-55f4-f9850c87afc8	00020000-5537-8fd0-eaf7-b975528831b7
00000000-5537-8fd1-bdc8-15feafcf039f	00020000-5537-8fd0-93ec-0e9778ebceb0
00000000-5537-8fd1-bdc8-15feafcf039f	00020000-5537-8fd0-23b5-ad43cc29057f
\.


--
-- TOC entry 2665 (class 0 OID 744223)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 744253)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 744365)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 743993)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 744035)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5537-8fcf-68f5-cc872c42c5d4	8341	Adlešiči
00050000-5537-8fcf-b4b5-0389cc42ba87	5270	Ajdovščina
00050000-5537-8fcf-4d7c-37c3990b46a9	6280	Ankaran/Ancarano
00050000-5537-8fcf-f62b-ce73d7b7188a	9253	Apače
00050000-5537-8fcf-91c2-74d41ecc9101	8253	Artiče
00050000-5537-8fcf-042d-8467df85f200	4275	Begunje na Gorenjskem
00050000-5537-8fcf-5630-e48a3d072ae6	1382	Begunje pri Cerknici
00050000-5537-8fcf-0de3-a03310f9811c	9231	Beltinci
00050000-5537-8fcf-b2c6-fb22fb8a91c9	2234	Benedikt
00050000-5537-8fcf-d70a-fcf34a2e38ce	2345	Bistrica ob Dravi
00050000-5537-8fcf-27ee-5a747969487c	3256	Bistrica ob Sotli
00050000-5537-8fcf-f21d-1a0937332576	8259	Bizeljsko
00050000-5537-8fcf-00a3-f8ed112d35cc	1223	Blagovica
00050000-5537-8fcf-693e-ccdf8417d453	8283	Blanca
00050000-5537-8fcf-6a5a-bb994eece92f	4260	Bled
00050000-5537-8fcf-e6e0-5e95a3982dc5	4273	Blejska Dobrava
00050000-5537-8fcf-8800-b97464c864f7	9265	Bodonci
00050000-5537-8fcf-e743-8fb7305b946d	9222	Bogojina
00050000-5537-8fcf-66ad-036657efa5dd	4263	Bohinjska Bela
00050000-5537-8fcf-fc65-274eb7b936a6	4264	Bohinjska Bistrica
00050000-5537-8fcf-0056-6aa30bd8f4d4	4265	Bohinjsko jezero
00050000-5537-8fcf-168a-e697cee82f34	1353	Borovnica
00050000-5537-8fcf-25b7-d1ef516499e0	8294	Boštanj
00050000-5537-8fcf-cbdf-fb1998cd6da0	5230	Bovec
00050000-5537-8fcf-deee-39186d6c37a6	5295	Branik
00050000-5537-8fcf-1e7f-ccf015860f9e	3314	Braslovče
00050000-5537-8fcf-2a57-e46f66d0603a	5223	Breginj
00050000-5537-8fcf-2748-009b1cdf1026	8280	Brestanica
00050000-5537-8fcf-2293-be0b87fbfe0d	2354	Bresternica
00050000-5537-8fcf-58e5-4317d4edc48f	4243	Brezje
00050000-5537-8fcf-7d08-29abdfbf3b91	1351	Brezovica pri Ljubljani
00050000-5537-8fcf-60f1-b4f1737ebd2f	8250	Brežice
00050000-5537-8fcf-ee6c-0b9563e2447f	4210	Brnik - Aerodrom
00050000-5537-8fcf-bde4-b44dafe60ce8	8321	Brusnice
00050000-5537-8fcf-a001-c826de5453c8	3255	Buče
00050000-5537-8fcf-eff5-7f24a2802d24	8276	Bučka 
00050000-5537-8fcf-cb9a-911ec5ca81d3	9261	Cankova
00050000-5537-8fcf-e13a-7352fb1d1822	3000	Celje 
00050000-5537-8fcf-92fc-c04ca345c3df	3001	Celje - poštni predali
00050000-5537-8fcf-a547-c1dc6e060145	4207	Cerklje na Gorenjskem
00050000-5537-8fcf-e354-217ef715907b	8263	Cerklje ob Krki
00050000-5537-8fcf-547a-d1b095866a8d	1380	Cerknica
00050000-5537-8fcf-3eb2-55c91b6da3fa	5282	Cerkno
00050000-5537-8fcf-4d95-2c73407d51f0	2236	Cerkvenjak
00050000-5537-8fcf-740c-1dba1555042a	2215	Ceršak
00050000-5537-8fcf-035d-17b01b0849d6	2326	Cirkovce
00050000-5537-8fcf-e5ef-3c2cb4748941	2282	Cirkulane
00050000-5537-8fcf-8ea9-ad832affcf87	5273	Col
00050000-5537-8fcf-a02c-17e1a1dc1223	8251	Čatež ob Savi
00050000-5537-8fcf-4e0f-5f27d80e4ffc	1413	Čemšenik
00050000-5537-8fcf-36b5-b6829141cb76	5253	Čepovan
00050000-5537-8fcf-1478-3c0bbdc6767f	9232	Črenšovci
00050000-5537-8fcf-0c96-52403a68c7a7	2393	Črna na Koroškem
00050000-5537-8fcf-6608-f0fc327577ab	6275	Črni Kal
00050000-5537-8fcf-1666-e51a309992fc	5274	Črni Vrh nad Idrijo
00050000-5537-8fcf-49e4-bdcea8a3f731	5262	Črniče
00050000-5537-8fcf-705f-ef835af44764	8340	Črnomelj
00050000-5537-8fcf-3786-a7f982ea2de8	6271	Dekani
00050000-5537-8fcf-61d5-5d72f7c5eee0	5210	Deskle
00050000-5537-8fcf-19e4-b59d8ad0314a	2253	Destrnik
00050000-5537-8fcf-7189-68a22288589e	6215	Divača
00050000-5537-8fcf-2b55-49695aeb0338	1233	Dob
00050000-5537-8fcf-bb28-55b2a3d87951	3224	Dobje pri Planini
00050000-5537-8fcf-0889-57971c6f55e2	8257	Dobova
00050000-5537-8fcf-8169-3d4de847f134	1423	Dobovec
00050000-5537-8fcf-9d0b-4e67a845c5a8	5263	Dobravlje
00050000-5537-8fcf-85b9-3789f4c5d8fd	3204	Dobrna
00050000-5537-8fcf-4b6c-83eff7ab9bfd	8211	Dobrnič
00050000-5537-8fcf-7aa4-b9b149672d08	1356	Dobrova
00050000-5537-8fcf-1667-63a3a39c7b8c	9223	Dobrovnik/Dobronak 
00050000-5537-8fcf-1395-2b289c09626d	5212	Dobrovo v Brdih
00050000-5537-8fcf-900f-450c064bb378	1431	Dol pri Hrastniku
00050000-5537-8fcf-9894-f56aecc738bd	1262	Dol pri Ljubljani
00050000-5537-8fcf-f452-8938f829d4da	1273	Dole pri Litiji
00050000-5537-8fcf-835f-c0b0dbc9d888	1331	Dolenja vas
00050000-5537-8fcf-6af8-7ecb50a209c3	8350	Dolenjske Toplice
00050000-5537-8fcf-a8f4-81af9dbb9630	1230	Domžale
00050000-5537-8fcf-f05d-433d5e033a9e	2252	Dornava
00050000-5537-8fcf-6470-801c430bd415	5294	Dornberk
00050000-5537-8fcf-a7a4-74757f89f82c	1319	Draga
00050000-5537-8fcf-99a3-2e64bcc23353	8343	Dragatuš
00050000-5537-8fcf-aa55-f8481344c6ed	3222	Dramlje
00050000-5537-8fcf-5f1c-54ae25f1a6da	2370	Dravograd
00050000-5537-8fcf-45c4-0be67e4b2709	4203	Duplje
00050000-5537-8fcf-8d10-0a9e57d933e4	6221	Dutovlje
00050000-5537-8fcf-259e-3da22192f90d	8361	Dvor
00050000-5537-8fcf-ae41-8dee188f38b7	2343	Fala
00050000-5537-8fcf-b78a-9d3568fccd3a	9208	Fokovci
00050000-5537-8fcf-1bc8-83693bbc184a	2313	Fram
00050000-5537-8fcf-7c0b-cf3f57160c84	3213	Frankolovo
00050000-5537-8fcf-26da-cb94cf69900a	1274	Gabrovka
00050000-5537-8fcf-3512-34dc77e79741	8254	Globoko
00050000-5537-8fcf-9c2a-c7191ca2c0d7	5275	Godovič
00050000-5537-8fcf-d41b-777d0cf46208	4204	Golnik
00050000-5537-8fcf-2393-6ae95fbda6e4	3303	Gomilsko
00050000-5537-8fcf-1c9d-ead1f22b0f55	4224	Gorenja vas
00050000-5537-8fcf-d9df-a85904785eaf	3263	Gorica pri Slivnici
00050000-5537-8fcf-4cbf-8b251674a9b9	2272	Gorišnica
00050000-5537-8fcf-9a16-3f4d9cf7fd1b	9250	Gornja Radgona
00050000-5537-8fcf-bc28-98b59a95b673	3342	Gornji Grad
00050000-5537-8fcf-e76f-ff0243db3797	4282	Gozd Martuljek
00050000-5537-8fcf-8dd5-82a8439beb6c	6272	Gračišče
00050000-5537-8fcf-8a7f-4c927989cdb8	9264	Grad
00050000-5537-8fcf-1ca2-ae48dcbddd21	8332	Gradac
00050000-5537-8fcf-a24a-dbbc81fa736b	1384	Grahovo
00050000-5537-8fcf-c70a-79be60ab031c	5242	Grahovo ob Bači
00050000-5537-8fcf-5c37-27bc0027b5f8	5251	Grgar
00050000-5537-8fcf-b07f-de0cf52ed484	3302	Griže
00050000-5537-8fcf-3259-4a3a728ee8ba	3231	Grobelno
00050000-5537-8fcf-e0f1-48f413ea7dc2	1290	Grosuplje
00050000-5537-8fcf-08a3-5942aa321946	2288	Hajdina
00050000-5537-8fcf-67eb-4c74fa758119	8362	Hinje
00050000-5537-8fcf-874f-eef4b53d9093	2311	Hoče
00050000-5537-8fcf-ba6a-4b1eb5053e17	9205	Hodoš/Hodos
00050000-5537-8fcf-ad00-c9ab5554dc1b	1354	Horjul
00050000-5537-8fcf-ae0e-a04761ba0add	1372	Hotedršica
00050000-5537-8fcf-7346-793f8de1004b	1430	Hrastnik
00050000-5537-8fcf-dfef-13f64e82df3f	6225	Hruševje
00050000-5537-8fcf-25dd-dc494a0187a6	4276	Hrušica
00050000-5537-8fcf-4fd6-fff4f6438b90	5280	Idrija
00050000-5537-8fcf-1220-2ba00a2248a0	1292	Ig
00050000-5537-8fcf-cff5-6130a42d5db8	6250	Ilirska Bistrica
00050000-5537-8fcf-7cc3-40fc542e7c20	6251	Ilirska Bistrica-Trnovo
00050000-5537-8fcf-b8da-e32ffc1cbbb7	1295	Ivančna Gorica
00050000-5537-8fcf-7b18-6f8566d0d47d	2259	Ivanjkovci
00050000-5537-8fcf-ee97-b3b02143a321	1411	Izlake
00050000-5537-8fcf-ee97-367dbf98ac9a	6310	Izola/Isola
00050000-5537-8fcf-9e2c-f4be1e18d392	2222	Jakobski Dol
00050000-5537-8fcf-1ac3-0e3acb385569	2221	Jarenina
00050000-5537-8fcf-9f5f-ba8d5fcff94f	6254	Jelšane
00050000-5537-8fcf-f52b-9621b9b80823	4270	Jesenice
00050000-5537-8fcf-3f34-aa6bd92575a7	8261	Jesenice na Dolenjskem
00050000-5537-8fcf-e5a5-be59f095afff	3273	Jurklošter
00050000-5537-8fcf-c09b-c2e10388e2c4	2223	Jurovski Dol
00050000-5537-8fcf-1cdd-09cfd87181fa	2256	Juršinci
00050000-5537-8fcf-c748-293b9f205301	5214	Kal nad Kanalom
00050000-5537-8fcf-6a49-93ac9bd45d1b	3233	Kalobje
00050000-5537-8fcf-67a4-8bcff1146773	4246	Kamna Gorica
00050000-5537-8fcf-2cd1-4fa6eb987600	2351	Kamnica
00050000-5537-8fcf-753f-8bc330c10cdf	1241	Kamnik
00050000-5537-8fcf-1e38-35697aebb0ab	5213	Kanal
00050000-5537-8fcf-d782-c3ecc0e5eb48	8258	Kapele
00050000-5537-8fcf-33e8-f79f4b994baa	2362	Kapla
00050000-5537-8fcf-75b6-0c98e67b213b	2325	Kidričevo
00050000-5537-8fcf-fe79-c112c78e3201	1412	Kisovec
00050000-5537-8fcf-22f7-65f18eb17266	6253	Knežak
00050000-5537-8fcf-7cf6-dce346e695c1	5222	Kobarid
00050000-5537-8fcf-65ea-1e63df2ae9a1	9227	Kobilje
00050000-5537-8fcf-6c99-4189f5d560de	1330	Kočevje
00050000-5537-8fcf-5cb6-0e9e94d1b5dd	1338	Kočevska Reka
00050000-5537-8fcf-09ac-000b961114a1	2276	Kog
00050000-5537-8fcf-bf03-cc708b47a647	5211	Kojsko
00050000-5537-8fcf-35b9-e72647236d7e	6223	Komen
00050000-5537-8fcf-7344-32c6f1bdb8a7	1218	Komenda
00050000-5537-8fcf-0e67-63d7ba70b80f	6000	Koper/Capodistria 
00050000-5537-8fcf-001f-92c897e71236	6001	Koper/Capodistria - poštni predali
00050000-5537-8fcf-a5c2-e149309b5267	8282	Koprivnica
00050000-5537-8fcf-e521-4b0bc8e689d5	5296	Kostanjevica na Krasu
00050000-5537-8fcf-860e-b051824ed5c3	8311	Kostanjevica na Krki
00050000-5537-8fcf-6abf-6a8c946cfb30	1336	Kostel
00050000-5537-8fcf-e2a2-ce6b911b74f1	6256	Košana
00050000-5537-8fcf-1ea4-6068a4151495	2394	Kotlje
00050000-5537-8fcf-d374-260ecc4cb3cd	6240	Kozina
00050000-5537-8fcf-89bc-6f9284459666	3260	Kozje
00050000-5537-8fcf-aeea-88fde481fa9f	4000	Kranj 
00050000-5537-8fcf-721d-c440c1d9a602	4001	Kranj - poštni predali
00050000-5537-8fcf-94a8-1343bc3ff9c1	4280	Kranjska Gora
00050000-5537-8fcf-fbc5-cd856eafdad7	1281	Kresnice
00050000-5537-8fcf-cdc3-5f50ffeafaa1	4294	Križe
00050000-5537-8fcf-fd46-59e90f63d98b	9206	Križevci
00050000-5537-8fcf-a3e7-927968a1062b	9242	Križevci pri Ljutomeru
00050000-5537-8fcf-4381-cffa81be0acf	1301	Krka
00050000-5537-8fcf-1951-0712b30560ce	8296	Krmelj
00050000-5537-8fcf-3b9e-0dafbfbf9e4e	4245	Kropa
00050000-5537-8fcf-6f9f-c13accfd5781	8262	Krška vas
00050000-5537-8fcf-de51-d4d964990b39	8270	Krško
00050000-5537-8fcf-ce63-f3c50aff0162	9263	Kuzma
00050000-5537-8fcf-04ea-e27d6c96a387	2318	Laporje
00050000-5537-8fcf-ec5b-c218bb6a6ae1	3270	Laško
00050000-5537-8fcf-342f-916be03e931f	1219	Laze v Tuhinju
00050000-5537-8fcf-3716-3f522762b2bb	2230	Lenart v Slovenskih goricah
00050000-5537-8fcf-3b40-987bfc68178e	9220	Lendava/Lendva
00050000-5537-8fcf-2be2-eb5900e3c5b0	4248	Lesce
00050000-5537-8fcf-ad83-98d24bc6ef33	3261	Lesično
00050000-5537-8fcf-1b37-7b76b90e8b7c	8273	Leskovec pri Krškem
00050000-5537-8fcf-baa9-13f11a0c7d82	2372	Libeliče
00050000-5537-8fcf-d29f-16df4c9fe1ed	2341	Limbuš
00050000-5537-8fcf-7441-a253fa0536d7	1270	Litija
00050000-5537-8fcf-94a1-ab27f6de3329	3202	Ljubečna
00050000-5537-8fcf-ecaa-d976fa9bde6a	1000	Ljubljana 
00050000-5537-8fcf-aa5c-317fb3cf5084	1001	Ljubljana - poštni predali
00050000-5537-8fcf-0faa-4494cb79bb31	1231	Ljubljana - Črnuče
00050000-5537-8fcf-50d3-7e7e6619fa14	1261	Ljubljana - Dobrunje
00050000-5537-8fcf-d239-3cbd9a561e2f	1260	Ljubljana - Polje
00050000-5537-8fcf-b842-031a642daa0f	1210	Ljubljana - Šentvid
00050000-5537-8fcf-e705-81401e19de75	1211	Ljubljana - Šmartno
00050000-5537-8fcf-8de6-f29130011cc0	3333	Ljubno ob Savinji
00050000-5537-8fcf-41f0-911350f6c457	9240	Ljutomer
00050000-5537-8fcf-35c6-21b3f54b2cb2	3215	Loče
00050000-5537-8fcf-1903-1cde35d03ee9	5231	Log pod Mangartom
00050000-5537-8fcf-4023-88dd6fc2e149	1358	Log pri Brezovici
00050000-5537-8fcf-dea8-6746e7b2a699	1370	Logatec
00050000-5537-8fcf-da8c-437a36ecd2d0	1371	Logatec
00050000-5537-8fcf-057a-e6ec437b54bd	1434	Loka pri Zidanem Mostu
00050000-5537-8fcf-532f-8881b440b6cc	3223	Loka pri Žusmu
00050000-5537-8fcf-bc80-ce975c3a1153	6219	Lokev
00050000-5537-8fcf-ddb2-c7c1996b34bc	1318	Loški Potok
00050000-5537-8fcf-cb9b-27ca2c9f87b3	2324	Lovrenc na Dravskem polju
00050000-5537-8fcf-1253-8e5f6f749204	2344	Lovrenc na Pohorju
00050000-5537-8fcf-37f4-237b17fdb179	3334	Luče
00050000-5537-8fcf-807e-9d755a19d512	1225	Lukovica
00050000-5537-8fcf-0705-a15c22f89ba2	9202	Mačkovci
00050000-5537-8fcf-97a5-79b8914e684d	2322	Majšperk
00050000-5537-8fcf-77be-04ad2f3a9e22	2321	Makole
00050000-5537-8fcf-00fe-5e5bfee62666	9243	Mala Nedelja
00050000-5537-8fcf-d8b4-8a76a3c77271	2229	Malečnik
00050000-5537-8fcf-5a21-d6522b63f068	6273	Marezige
00050000-5537-8fcf-29ae-5efc5cf995a0	2000	Maribor 
00050000-5537-8fcf-d5ee-c9417f2116d3	2001	Maribor - poštni predali
00050000-5537-8fcf-d9ce-e43734cf340f	2206	Marjeta na Dravskem polju
00050000-5537-8fcf-addf-b3e31a84dcfb	2281	Markovci
00050000-5537-8fcf-3b7d-2927e22c3668	9221	Martjanci
00050000-5537-8fcf-50e7-63817814dcf7	6242	Materija
00050000-5537-8fcf-59d2-37544b1bf7a8	4211	Mavčiče
00050000-5537-8fcf-cdbb-094f19731900	1215	Medvode
00050000-5537-8fcf-bc3d-14f6c3147af3	1234	Mengeš
00050000-5537-8fcf-ad63-535fbba88060	8330	Metlika
00050000-5537-8fcf-522b-e57da143c871	2392	Mežica
00050000-5537-8fcf-b80b-71d8cc06e987	2204	Miklavž na Dravskem polju
00050000-5537-8fcf-ead7-58dbe4e086ef	2275	Miklavž pri Ormožu
00050000-5537-8fcf-2173-a20395ec0a30	5291	Miren
00050000-5537-8fcf-d9e1-35bc1333e3ed	8233	Mirna
00050000-5537-8fcf-87eb-bf10ca1f7614	8216	Mirna Peč
00050000-5537-8fcf-091b-aee07d348a37	2382	Mislinja
00050000-5537-8fcf-d13b-5a76d7b963a9	4281	Mojstrana
00050000-5537-8fcf-8d60-2e4065874058	8230	Mokronog
00050000-5537-8fcf-73f1-4f0fefdc0ae8	1251	Moravče
00050000-5537-8fcf-7089-4b24927f7d3d	9226	Moravske Toplice
00050000-5537-8fcf-a8b6-6b5e3c0bcf40	5216	Most na Soči
00050000-5537-8fcf-c969-b07785dd64af	1221	Motnik
00050000-5537-8fcf-de30-c71936a60fb9	3330	Mozirje
00050000-5537-8fcf-6a62-7e1440bd75dc	9000	Murska Sobota 
00050000-5537-8fcf-80da-97db56e0ff9a	9001	Murska Sobota - poštni predali
00050000-5537-8fcf-0a34-e4066613f169	2366	Muta
00050000-5537-8fcf-b0db-d2123ce691f1	4202	Naklo
00050000-5537-8fcf-3f2d-9b87d69caf02	3331	Nazarje
00050000-5537-8fcf-076f-8926768311c9	1357	Notranje Gorice
00050000-5537-8fcf-467d-eeb0119a29fb	3203	Nova Cerkev
00050000-5537-8fcf-d67b-2236f4b9ae8c	5000	Nova Gorica 
00050000-5537-8fcf-8cc2-e7783bef7e01	5001	Nova Gorica - poštni predali
00050000-5537-8fcf-c61c-f930c9f261dd	1385	Nova vas
00050000-5537-8fcf-8a6a-7ef39c5e58a5	8000	Novo mesto
00050000-5537-8fcf-8641-7f7d0da80aa9	8001	Novo mesto - poštni predali
00050000-5537-8fcf-0a90-bc2fb5a7f5c1	6243	Obrov
00050000-5537-8fcf-00d1-e453e0b0bcbd	9233	Odranci
00050000-5537-8fcf-6724-affb1d784f24	2317	Oplotnica
00050000-5537-8fcf-b54d-7c53360bbc5b	2312	Orehova vas
00050000-5537-8fcf-6e00-c68089a85479	2270	Ormož
00050000-5537-8fcf-f810-0fe46a939dee	1316	Ortnek
00050000-5537-8fcf-938d-5a0e5ff09d51	1337	Osilnica
00050000-5537-8fcf-9393-64d2d4dd7741	8222	Otočec
00050000-5537-8fcf-e7cc-3b30a253a39d	2361	Ožbalt
00050000-5537-8fcf-06f8-6336a9a8aba4	2231	Pernica
00050000-5537-8fcf-2509-df1057c1b6cb	2211	Pesnica pri Mariboru
00050000-5537-8fcf-96a3-1039693be330	9203	Petrovci
00050000-5537-8fcf-fea7-d99132f91be9	3301	Petrovče
00050000-5537-8fcf-43f4-c208a885b553	6330	Piran/Pirano
00050000-5537-8fcf-3389-93b9a4ed542e	8255	Pišece
00050000-5537-8fcf-6dbd-e8e8303105f1	6257	Pivka
00050000-5537-8fcf-beef-9880281a2c9e	6232	Planina
00050000-5537-8fcf-db06-1d72c6cc1c05	3225	Planina pri Sevnici
00050000-5537-8fcf-92b6-3fc4a4827e47	6276	Pobegi
00050000-5537-8fcf-9130-5bef22a49cf7	8312	Podbočje
00050000-5537-8fcf-30d4-e0c683405e23	5243	Podbrdo
00050000-5537-8fcf-1f22-0f20f3faf1c1	3254	Podčetrtek
00050000-5537-8fcf-0e3c-4a37749d9065	2273	Podgorci
00050000-5537-8fcf-2462-70284326f417	6216	Podgorje
00050000-5537-8fcf-9387-da4ebf921fbe	2381	Podgorje pri Slovenj Gradcu
00050000-5537-8fcf-1c7e-083f68cfa499	6244	Podgrad
00050000-5537-8fcf-67a3-1a530b154a8e	1414	Podkum
00050000-5537-8fcf-29bc-a20483b0d1ee	2286	Podlehnik
00050000-5537-8fcf-23a7-577b7056ed14	5272	Podnanos
00050000-5537-8fcf-d22f-f57b4442e4e8	4244	Podnart
00050000-5537-8fcf-1902-8ecdc1a8a578	3241	Podplat
00050000-5537-8fcf-538a-fdbcc4c42b07	3257	Podsreda
00050000-5537-8fcf-a962-66b433f1cebd	2363	Podvelka
00050000-5537-8fcf-829c-5823170949fd	2208	Pohorje
00050000-5537-8fcf-0940-0c50579a65ba	2257	Polenšak
00050000-5537-8fcf-19f2-38e48bde9e8f	1355	Polhov Gradec
00050000-5537-8fcf-7487-123fa39ab6a7	4223	Poljane nad Škofjo Loko
00050000-5537-8fcf-22d5-af55591d9486	2319	Poljčane
00050000-5537-8fcf-186f-2ceec431e70c	1272	Polšnik
00050000-5537-8fcf-fc24-e6d15190abbe	3313	Polzela
00050000-5537-8fcf-66d0-27f01bdf9b36	3232	Ponikva
00050000-5537-8fcf-2e7d-7f68094ab477	6320	Portorož/Portorose
00050000-5537-8fcf-767c-47767ea07c7d	6230	Postojna
00050000-5537-8fcf-5cd1-b6aa22d75a0f	2331	Pragersko
00050000-5537-8fcf-64e9-320ec4b67bfe	3312	Prebold
00050000-5537-8fcf-b5ee-8c9d49275b36	4205	Preddvor
00050000-5537-8fcf-b3a4-30d22dfa2515	6255	Prem
00050000-5537-8fcf-3b8e-e41664a80c46	1352	Preserje
00050000-5537-8fcf-1d34-c7cd0b2436b0	6258	Prestranek
00050000-5537-8fcf-bb21-6b1dabf3f53d	2391	Prevalje
00050000-5537-8fcf-8f5a-a079333b3de3	3262	Prevorje
00050000-5537-8fcf-8975-e8bcfbb48aa2	1276	Primskovo 
00050000-5537-8fcf-1104-d55e824ed952	3253	Pristava pri Mestinju
00050000-5537-8fcf-c63b-c72c84a8eb8f	9207	Prosenjakovci/Partosfalva
00050000-5537-8fcf-e7fe-737cad9b72d4	5297	Prvačina
00050000-5537-8fcf-639e-8a7c3d43afb3	2250	Ptuj
00050000-5537-8fcf-8594-6611c9918992	2323	Ptujska Gora
00050000-5537-8fcf-a284-6a000b58311f	9201	Puconci
00050000-5537-8fcf-ab13-fa2dbac35fe1	2327	Rače
00050000-5537-8fcf-d571-f5610abc7548	1433	Radeče
00050000-5537-8fcf-b07d-8e99f2c76c03	9252	Radenci
00050000-5537-8fcf-3498-4bdca1a78b3a	2360	Radlje ob Dravi
00050000-5537-8fcf-b795-2c2876de3cf1	1235	Radomlje
00050000-5537-8fcf-93c3-163d1d8f8b5e	4240	Radovljica
00050000-5537-8fcf-c2b6-2f1c9d567c39	8274	Raka
00050000-5537-8fcf-a0f6-1ae85be42090	1381	Rakek
00050000-5537-8fcf-7edc-cd6d21f03c01	4283	Rateče - Planica
00050000-5537-8fcf-a246-da06a2652b09	2390	Ravne na Koroškem
00050000-5537-8fcf-620c-3260b2e7a9fd	9246	Razkrižje
00050000-5537-8fcf-4eef-346f3e5b273a	3332	Rečica ob Savinji
00050000-5537-8fcf-536f-36cdf9ca2715	5292	Renče
00050000-5537-8fcf-568d-d18abb495d65	1310	Ribnica
00050000-5537-8fcf-ee6d-9037de672499	2364	Ribnica na Pohorju
00050000-5537-8fcf-baf6-fe9694492508	3272	Rimske Toplice
00050000-5537-8fcf-435a-48b5629b2f2f	1314	Rob
00050000-5537-8fcf-8adf-75f55961e1e5	5215	Ročinj
00050000-5537-8fcf-417e-bfe5b851ea67	3250	Rogaška Slatina
00050000-5537-8fcf-879a-e8a26d1176bd	9262	Rogašovci
00050000-5537-8fcf-fea4-277a7a369e19	3252	Rogatec
00050000-5537-8fcf-35d6-ba1759efe1a9	1373	Rovte
00050000-5537-8fcf-f1ab-d27234ba1049	2342	Ruše
00050000-5537-8fcf-d39b-9e39440df086	1282	Sava
00050000-5537-8fcf-566e-3ca7ad949690	6333	Sečovlje/Sicciole
00050000-5537-8fcf-3f64-8e460b33359c	4227	Selca
00050000-5537-8fcf-ce96-3424e7fd0f5b	2352	Selnica ob Dravi
00050000-5537-8fcf-1c6d-fc98c518d6fd	8333	Semič
00050000-5537-8fcf-91b3-2341ae1e5583	8281	Senovo
00050000-5537-8fcf-d251-1750bbd843d1	6224	Senožeče
00050000-5537-8fcf-8520-a30edd907a34	8290	Sevnica
00050000-5537-8fcf-3e6b-e563e57e7d68	6210	Sežana
00050000-5537-8fcf-97df-b7b8cb18206b	2214	Sladki Vrh
00050000-5537-8fcf-c794-aa7b0785a7ce	5283	Slap ob Idrijci
00050000-5537-8fcf-c2a7-feddb51bbc50	2380	Slovenj Gradec
00050000-5537-8fcf-f85c-6f09e2be6243	2310	Slovenska Bistrica
00050000-5537-8fcf-a6db-25b39c0a2f15	3210	Slovenske Konjice
00050000-5537-8fcf-aec6-03cb01cb1362	1216	Smlednik
00050000-5537-8fcf-fc2c-ef8a02330942	5232	Soča
00050000-5537-8fcf-2616-3e054c6ce498	1317	Sodražica
00050000-5537-8fcf-2d7e-7fbba47e4d4c	3335	Solčava
00050000-5537-8fcf-a74f-21d43dc6d25b	5250	Solkan
00050000-5537-8fcf-3c0d-76f69ac87fcc	4229	Sorica
00050000-5537-8fcf-70e3-ca89ad850210	4225	Sovodenj
00050000-5537-8fcf-06f2-7737b1a33de7	5281	Spodnja Idrija
00050000-5537-8fcf-f2af-b7c64b5079f1	2241	Spodnji Duplek
00050000-5537-8fcf-4d62-01691bba19ff	9245	Spodnji Ivanjci
00050000-5537-8fcf-3d3f-771994944815	2277	Središče ob Dravi
00050000-5537-8fcf-69bb-1e69798dcf6e	4267	Srednja vas v Bohinju
00050000-5537-8fcf-3b2b-a7a66faea385	8256	Sromlje 
00050000-5537-8fcf-4c0b-648c4e33a40c	5224	Srpenica
00050000-5537-8fcf-42d0-05db24f275c9	1242	Stahovica
00050000-5537-8fcf-e4ed-7b340b0611c3	1332	Stara Cerkev
00050000-5537-8fcf-427e-3ce373ab6fe1	8342	Stari trg ob Kolpi
00050000-5537-8fcf-e25b-202d8605e7b3	1386	Stari trg pri Ložu
00050000-5537-8fcf-ea91-703bdb955ef0	2205	Starše
00050000-5537-8fcf-b4b2-f3501891ec72	2289	Stoperce
00050000-5537-8fcf-255f-43c7cf0f3c6e	8322	Stopiče
00050000-5537-8fcf-21e4-c8b2b3572260	3206	Stranice
00050000-5537-8fcf-dca5-df23e84959aa	8351	Straža
00050000-5537-8fcf-0d8d-d00f8277320f	1313	Struge
00050000-5537-8fcf-3ca7-403bc37228a5	8293	Studenec
00050000-5537-8fcf-e309-a629b7c78ea4	8331	Suhor
00050000-5537-8fcf-8e14-403dad98b66a	2233	Sv. Ana v Slovenskih goricah
00050000-5537-8fcf-ea03-b05b3962e684	2235	Sv. Trojica v Slovenskih goricah
00050000-5537-8fcf-5a97-b14877090a3b	2353	Sveti Duh na Ostrem Vrhu
00050000-5537-8fcf-40f1-70cad9b8df31	9244	Sveti Jurij ob Ščavnici
00050000-5537-8fcf-643b-b51dca881a10	3264	Sveti Štefan
00050000-5537-8fcf-785a-ba06762e0556	2258	Sveti Tomaž
00050000-5537-8fcf-80f4-f68a30e1d627	9204	Šalovci
00050000-5537-8fcf-40b9-341170ac7301	5261	Šempas
00050000-5537-8fcf-fd80-f00e282ff2f4	5290	Šempeter pri Gorici
00050000-5537-8fcf-af37-d5f6f53f99e6	3311	Šempeter v Savinjski dolini
00050000-5537-8fcf-eec0-6bd1d42c15fa	4208	Šenčur
00050000-5537-8fcf-f03b-4b4f543bf0d2	2212	Šentilj v Slovenskih goricah
00050000-5537-8fcf-6448-97e180a184be	8297	Šentjanž
00050000-5537-8fcf-ad3f-6e69ceb6ce67	2373	Šentjanž pri Dravogradu
00050000-5537-8fcf-f1f1-87c340d878d8	8310	Šentjernej
00050000-5537-8fcf-68e8-50fdf884fc94	3230	Šentjur
00050000-5537-8fcf-d244-16bd02fbbb50	3271	Šentrupert
00050000-5537-8fcf-85f1-659d73c6dd00	8232	Šentrupert
00050000-5537-8fcf-8584-70829aaadbae	1296	Šentvid pri Stični
00050000-5537-8fcf-8c7a-d90f6e13f9f5	8275	Škocjan
00050000-5537-8fcf-5b7f-80b52e551fa7	6281	Škofije
00050000-5537-8fcf-d761-3c22546214d0	4220	Škofja Loka
00050000-5537-8fcf-2bf1-8150d066f02e	3211	Škofja vas
00050000-5537-8fcf-67df-1468cfed2781	1291	Škofljica
00050000-5537-8fcf-1681-1b3d426fd59d	6274	Šmarje
00050000-5537-8fcf-728c-33cd8be29944	1293	Šmarje - Sap
00050000-5537-8fcf-0906-4eb2b14d9600	3240	Šmarje pri Jelšah
00050000-5537-8fcf-bc0c-9b68b5ddf8e6	8220	Šmarješke Toplice
00050000-5537-8fcf-087e-9d68be23e026	2315	Šmartno na Pohorju
00050000-5537-8fcf-b123-bed438a004cc	3341	Šmartno ob Dreti
00050000-5537-8fcf-4dd4-7e397b8ec78b	3327	Šmartno ob Paki
00050000-5537-8fcf-7f49-8e693a5dd30c	1275	Šmartno pri Litiji
00050000-5537-8fcf-7652-275fff8e574c	2383	Šmartno pri Slovenj Gradcu
00050000-5537-8fcf-b754-7e326fb72814	3201	Šmartno v Rožni dolini
00050000-5537-8fcf-5472-df8fd5979be5	3325	Šoštanj
00050000-5537-8fcf-caa4-0c41b62aba43	6222	Štanjel
00050000-5537-8fcf-4ea9-452f182953c1	3220	Štore
00050000-5537-8fcf-30bc-627b0ee07b8e	3304	Tabor
00050000-5537-8fcf-9099-467b52cbc217	3221	Teharje
00050000-5537-8fcf-76a2-108f9866d802	9251	Tišina
00050000-5537-8fcf-5ce2-4885ee102a84	5220	Tolmin
00050000-5537-8fcf-2d20-c96216ed5728	3326	Topolšica
00050000-5537-8fcf-1465-9068968db645	2371	Trbonje
00050000-5537-8fcf-7406-7ded032a571e	1420	Trbovlje
00050000-5537-8fcf-64a5-52a7590c69c1	8231	Trebelno 
00050000-5537-8fcf-5869-8db361ab0af5	8210	Trebnje
00050000-5537-8fcf-a696-3832672031d2	5252	Trnovo pri Gorici
00050000-5537-8fcf-4b1e-c0ef2e68b1e5	2254	Trnovska vas
00050000-5537-8fcf-4204-34678406f618	1222	Trojane
00050000-5537-8fcf-1904-69183027334a	1236	Trzin
00050000-5537-8fcf-33ba-af64b5199c80	4290	Tržič
00050000-5537-8fcf-b2a4-fd90402ade53	8295	Tržišče
00050000-5537-8fcf-4df1-5a55f6aaefed	1311	Turjak
00050000-5537-8fcf-598a-2292d285079b	9224	Turnišče
00050000-5537-8fcf-82cc-8b56ac6d3969	8323	Uršna sela
00050000-5537-8fcf-8a81-800944763d2b	1252	Vače
00050000-5537-8fcf-9750-300c9211eb85	3320	Velenje 
00050000-5537-8fcf-33fa-31e724b711cc	3322	Velenje - poštni predali
00050000-5537-8fcf-ec25-527b2db58cb7	8212	Velika Loka
00050000-5537-8fcf-fd57-b8a1cb0f19ef	2274	Velika Nedelja
00050000-5537-8fcf-383f-a1ec8e81b132	9225	Velika Polana
00050000-5537-8fcf-b5b4-09a2b600c712	1315	Velike Lašče
00050000-5537-8fcf-5039-1110798e6c8a	8213	Veliki Gaber
00050000-5537-8fcf-b72b-d0cf2de5d3fe	9241	Veržej
00050000-5537-8fcf-e852-bbbafaa57df1	1312	Videm - Dobrepolje
00050000-5537-8fcf-251a-265cb48d85e4	2284	Videm pri Ptuju
00050000-5537-8fcf-3a73-b681982db1b2	8344	Vinica
00050000-5537-8fcf-b843-f1e59e21090c	5271	Vipava
00050000-5537-8fcf-34ed-4ad84181b62d	4212	Visoko
00050000-5537-8fcf-8917-4f1da209b529	1294	Višnja Gora
00050000-5537-8fcf-8e47-a89d5414588e	3205	Vitanje
00050000-5537-8fcf-e9dd-6f04c86a000b	2255	Vitomarci
00050000-5537-8fcf-6b22-3c517e9a65cf	1217	Vodice
00050000-5537-8fcf-3010-26203b3fc8d4	3212	Vojnik\t
00050000-5537-8fcf-dbf5-46cf986b0e8a	5293	Volčja Draga
00050000-5537-8fcf-247e-9482918729e4	2232	Voličina
00050000-5537-8fcf-f312-7fd0561e10ef	3305	Vransko
00050000-5537-8fcf-1a1e-87e8eb40b7d1	6217	Vremski Britof
00050000-5537-8fcf-71c0-51693538542c	1360	Vrhnika
00050000-5537-8fcf-0223-b13b7426d7a6	2365	Vuhred
00050000-5537-8fcf-cab4-1ae23967f443	2367	Vuzenica
00050000-5537-8fcf-e73c-1d427287d785	8292	Zabukovje 
00050000-5537-8fcf-5077-1d9dde39b5c4	1410	Zagorje ob Savi
00050000-5537-8fcf-e668-b397074b7e76	1303	Zagradec
00050000-5537-8fcf-c26f-1c5f765bba72	2283	Zavrč
00050000-5537-8fcf-efef-fa865d4c8905	8272	Zdole 
00050000-5537-8fcf-2a7b-e88c0f8ddb21	4201	Zgornja Besnica
00050000-5537-8fcf-f8e7-e1fbdfacde9b	2242	Zgornja Korena
00050000-5537-8fcf-2601-4c9095a03f2f	2201	Zgornja Kungota
00050000-5537-8fcf-3b6e-976b3b77983c	2316	Zgornja Ložnica
00050000-5537-8fcf-f9a5-874187b55d6f	2314	Zgornja Polskava
00050000-5537-8fcf-3972-0d51aef9276a	2213	Zgornja Velka
00050000-5537-8fcf-9081-6911961899c3	4247	Zgornje Gorje
00050000-5537-8fcf-c6d4-62dd167f2f73	4206	Zgornje Jezersko
00050000-5537-8fcf-9067-24131c7ec37d	2285	Zgornji Leskovec
00050000-5537-8fcf-b30f-88a51e7f55d8	1432	Zidani Most
00050000-5537-8fcf-f742-7328faf67883	3214	Zreče
00050000-5537-8fcf-9df0-f928ae0bb658	4209	Žabnica
00050000-5537-8fcf-4630-3ea2cbd908fc	3310	Žalec
00050000-5537-8fcf-4cda-d196f09132b2	4228	Železniki
00050000-5537-8fcf-8179-c82a89485f40	2287	Žetale
00050000-5537-8fcf-94ef-f408b463037d	4226	Žiri
00050000-5537-8fcf-0e13-817047dc5f7c	4274	Žirovnica
00050000-5537-8fcf-aea3-e31e8cc05316	8360	Žužemberk
\.


--
-- TOC entry 2661 (class 0 OID 744197)
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
-- TOC entry 2644 (class 0 OID 744020)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 744086)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 744209)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 744314)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 744358)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 744238)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 744182)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 744172)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 744348)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 744304)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 743885)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5537-8fd1-9fd5-f96675712b3c	00010000-5537-8fd1-92ca-82db6d182932	2015-04-22 14:10:57	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROVI7Vm99/iNW1Wyxz7YZKCHbk5mhQ6OK";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2668 (class 0 OID 744247)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 743923)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5537-8fd1-1c94-f609cd8a98ad	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5537-8fd1-b5c1-75fd93b5e6b9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5537-8fd1-55f4-f9850c87afc8	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5537-8fd1-fc02-94e6c0a0a058	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5537-8fd1-a1a1-f2e43805b255	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5537-8fd1-bdc8-15feafcf039f	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2634 (class 0 OID 743907)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5537-8fd1-9fd5-f96675712b3c	00000000-5537-8fd1-fc02-94e6c0a0a058
00010000-5537-8fd1-92ca-82db6d182932	00000000-5537-8fd1-fc02-94e6c0a0a058
\.


--
-- TOC entry 2670 (class 0 OID 744261)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 744203)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 744153)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 743985)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 744159)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 744339)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 744055)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 743894)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5537-8fd1-92ca-82db6d182932	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROpiwyjyDZCL4U4FSa./B955Veeli5qX2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5537-8fd1-9fd5-f96675712b3c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2682 (class 0 OID 744389)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 744101)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 744230)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 744296)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 744129)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 744379)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 744286)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 743948)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 744428)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 744421)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 744338)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 744119)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 744152)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 744081)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 744282)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 744099)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 744146)
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
-- TOC entry 2366 (class 2606 OID 744195)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 744222)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 744053)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 743957)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 744017)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2282 (class 2606 OID 743982)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 743937)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 743922)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 744228)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 744260)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 744375)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 744010)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 744041)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 744201)
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
-- TOC entry 2300 (class 2606 OID 744031)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 744090)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 744213)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 744320)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 744363)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 744245)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 744186)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 744177)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 744357)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 744311)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 743893)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 744251)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 743911)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 743931)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 744269)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 744208)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 744158)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 743990)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 744168)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 744347)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 744066)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 743906)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 744403)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 744105)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 744236)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 744302)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 744141)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 744388)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 744295)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 1259 OID 744126)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2288 (class 1259 OID 744012)
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
-- TOC entry 2379 (class 1259 OID 744229)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2373 (class 1259 OID 744215)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2374 (class 1259 OID 744214)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2325 (class 1259 OID 744106)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 744285)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2401 (class 1259 OID 744283)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 744284)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2425 (class 1259 OID 744376)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 744377)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2427 (class 1259 OID 744378)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2432 (class 1259 OID 744406)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2433 (class 1259 OID 744405)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2434 (class 1259 OID 744404)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2307 (class 1259 OID 744068)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2308 (class 1259 OID 744067)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 744019)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2293 (class 1259 OID 744018)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2280 (class 1259 OID 743984)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2388 (class 1259 OID 744252)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2343 (class 1259 OID 744147)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 743938)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 743939)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2393 (class 1259 OID 744272)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2394 (class 1259 OID 744271)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2395 (class 1259 OID 744270)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2317 (class 1259 OID 744091)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2318 (class 1259 OID 744093)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2319 (class 1259 OID 744092)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2353 (class 1259 OID 744181)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2354 (class 1259 OID 744179)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2355 (class 1259 OID 744178)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2356 (class 1259 OID 744180)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 743912)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 743913)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2382 (class 1259 OID 744237)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2368 (class 1259 OID 744202)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2408 (class 1259 OID 744312)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2409 (class 1259 OID 744313)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2296 (class 1259 OID 744033)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2297 (class 1259 OID 744032)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2298 (class 1259 OID 744034)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2412 (class 1259 OID 744321)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2413 (class 1259 OID 744322)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2443 (class 1259 OID 744431)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2444 (class 1259 OID 744430)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2445 (class 1259 OID 744433)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2446 (class 1259 OID 744429)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2447 (class 1259 OID 744432)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2405 (class 1259 OID 744303)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2359 (class 1259 OID 744190)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2360 (class 1259 OID 744189)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2361 (class 1259 OID 744187)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2362 (class 1259 OID 744188)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2439 (class 1259 OID 744423)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 744422)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2324 (class 1259 OID 744100)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 743959)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 743958)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2284 (class 1259 OID 743991)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2285 (class 1259 OID 743992)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 744171)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2349 (class 1259 OID 744170)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2350 (class 1259 OID 744169)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2331 (class 1259 OID 744128)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2332 (class 1259 OID 744124)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2333 (class 1259 OID 744121)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2334 (class 1259 OID 744122)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2335 (class 1259 OID 744120)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2336 (class 1259 OID 744125)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2337 (class 1259 OID 744123)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2291 (class 1259 OID 744011)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 744082)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2314 (class 1259 OID 744084)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2315 (class 1259 OID 744083)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2316 (class 1259 OID 744085)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2367 (class 1259 OID 744196)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2283 (class 1259 OID 743983)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2306 (class 1259 OID 744054)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2387 (class 1259 OID 744246)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2303 (class 1259 OID 744042)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2424 (class 1259 OID 744364)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 743932)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2338 (class 1259 OID 744127)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2473 (class 2606 OID 744569)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2476 (class 2606 OID 744554)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2475 (class 2606 OID 744559)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2471 (class 2606 OID 744579)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2477 (class 2606 OID 744549)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2472 (class 2606 OID 744574)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2474 (class 2606 OID 744564)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2458 (class 2606 OID 744484)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2494 (class 2606 OID 744664)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2492 (class 2606 OID 744659)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2493 (class 2606 OID 744654)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2470 (class 2606 OID 744544)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 744704)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2502 (class 2606 OID 744694)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2501 (class 2606 OID 744699)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2490 (class 2606 OID 744644)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 744739)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2510 (class 2606 OID 744744)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 744749)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2512 (class 2606 OID 744764)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2513 (class 2606 OID 744759)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2514 (class 2606 OID 744754)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2464 (class 2606 OID 744519)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2465 (class 2606 OID 744514)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 744494)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2460 (class 2606 OID 744489)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 744469)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2455 (class 2606 OID 744464)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2496 (class 2606 OID 744674)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2478 (class 2606 OID 744584)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2451 (class 2606 OID 744444)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 744449)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2497 (class 2606 OID 744689)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2498 (class 2606 OID 744684)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2499 (class 2606 OID 744679)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2468 (class 2606 OID 744524)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2466 (class 2606 OID 744534)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2467 (class 2606 OID 744529)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2482 (class 2606 OID 744619)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2484 (class 2606 OID 744609)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2485 (class 2606 OID 744604)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2483 (class 2606 OID 744614)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2449 (class 2606 OID 744434)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 744439)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2495 (class 2606 OID 744669)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2491 (class 2606 OID 744649)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2505 (class 2606 OID 744714)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2504 (class 2606 OID 744719)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2462 (class 2606 OID 744504)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 744499)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 744509)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2507 (class 2606 OID 744724)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2506 (class 2606 OID 744729)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2519 (class 2606 OID 744789)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 744784)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2517 (class 2606 OID 744799)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2521 (class 2606 OID 744779)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2518 (class 2606 OID 744794)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2503 (class 2606 OID 744709)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2486 (class 2606 OID 744639)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2487 (class 2606 OID 744634)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2489 (class 2606 OID 744624)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2488 (class 2606 OID 744629)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2515 (class 2606 OID 744774)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2516 (class 2606 OID 744769)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2469 (class 2606 OID 744539)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2508 (class 2606 OID 744734)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 744459)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2453 (class 2606 OID 744454)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2457 (class 2606 OID 744474)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2456 (class 2606 OID 744479)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2479 (class 2606 OID 744599)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 744594)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2481 (class 2606 OID 744589)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-22 14:10:57 CEST

--
-- PostgreSQL database dump complete
--

