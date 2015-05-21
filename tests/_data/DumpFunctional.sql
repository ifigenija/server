--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-21 11:45:39 CEST

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
-- TOC entry 2685 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 4369506)
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
-- TOC entry 225 (class 1259 OID 4369985)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_delitev_id uuid,
    pogodba_id uuid,
    zaposlen boolean
);


--
-- TOC entry 224 (class 1259 OID 4369968)
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
-- TOC entry 217 (class 1259 OID 4369881)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine text
);


--
-- TOC entry 193 (class 1259 OID 4369672)
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
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status integer,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 196 (class 1259 OID 4369706)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4369631)
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
-- TOC entry 212 (class 1259 OID 4369831)
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
-- TOC entry 191 (class 1259 OID 4369656)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4369700)
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
-- TOC entry 201 (class 1259 OID 4369749)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4369774)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4369605)
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
-- TOC entry 180 (class 1259 OID 4369515)
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
-- TOC entry 181 (class 1259 OID 4369526)
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
    datumrojstva date,
    emso character varying(255) DEFAULT NULL::character varying,
    davcna character varying(255) DEFAULT NULL::character varying,
    spol character varying(1) DEFAULT NULL::character varying,
    opombe text,
    drzavljanstvo character varying(255) DEFAULT NULL::character varying,
    drzavarojstva character varying(255) DEFAULT NULL::character varying,
    krajrojstva character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 4369576)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4369480)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4369499)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4369781)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4369811)
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
-- TOC entry 221 (class 1259 OID 4369924)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    opis text
);


--
-- TOC entry 183 (class 1259 OID 4369556)
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
-- TOC entry 186 (class 1259 OID 4369597)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4369755)
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
-- TOC entry 185 (class 1259 OID 4369583)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    drzava_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    ulica character varying(50) DEFAULT NULL::character varying,
    ulicadva character varying(50) DEFAULT NULL::character varying,
    posta character varying(50) DEFAULT NULL::character varying,
    postanaziv character varying(50) DEFAULT NULL::character varying,
    pokrajina character varying(50) DEFAULT NULL::character varying,
    jeeu boolean NOT NULL,
    privzeti boolean
);


--
-- TOC entry 190 (class 1259 OID 4369648)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4369767)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4369872)
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
-- TOC entry 220 (class 1259 OID 4369917)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4369796)
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
-- TOC entry 200 (class 1259 OID 4369740)
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
-- TOC entry 199 (class 1259 OID 4369730)
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
-- TOC entry 219 (class 1259 OID 4369907)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4369862)
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
-- TOC entry 173 (class 1259 OID 4369451)
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
-- TOC entry 172 (class 1259 OID 4369449)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2686 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 4369805)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4369489)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4369473)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4369819)
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
-- TOC entry 203 (class 1259 OID 4369761)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4369711)
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
-- TOC entry 182 (class 1259 OID 4369548)
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
-- TOC entry 198 (class 1259 OID 4369717)
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
-- TOC entry 218 (class 1259 OID 4369895)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    dovoliprekrivanje boolean,
    maxprekrivanj integer,
    nastopajoc boolean,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying,
    pomembnost character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 4369617)
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
-- TOC entry 174 (class 1259 OID 4369460)
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
-- TOC entry 223 (class 1259 OID 4369949)
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
    sloavtor boolean,
    kratkinaslov character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 4369663)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4369788)
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
-- TOC entry 214 (class 1259 OID 4369854)
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
-- TOC entry 194 (class 1259 OID 4369695)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4369939)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4369844)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4369454)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2632 (class 0 OID 4369506)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4369985)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4369968)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4369881)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4369672)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4369706)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4369631)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555d-a942-b6d3-fedbd615e4ab	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555d-a942-e3b1-66d18bc505e2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555d-a942-9897-7d0fd469e2fc	AL	ALB	008	Albania 	Albanija	\N
00040000-555d-a942-c42e-d60af7cd9668	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555d-a942-f52d-72b657ad9360	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555d-a942-8d62-879ba0f8abea	AD	AND	020	Andorra 	Andora	\N
00040000-555d-a942-5604-3c2f0cee3e20	AO	AGO	024	Angola 	Angola	\N
00040000-555d-a942-db24-67af7239ff6e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555d-a942-edd6-fc596957dee6	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555d-a942-fba5-2ef09e1c9d8b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-a942-6a31-99021f42c773	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555d-a942-880d-16685c77dcf0	AM	ARM	051	Armenia 	Armenija	\N
00040000-555d-a942-15a6-7f9f1a2fa8ea	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555d-a942-e952-4718578cdfe2	AU	AUS	036	Australia 	Avstralija	\N
00040000-555d-a942-21bd-f555ff122871	AT	AUT	040	Austria 	Avstrija	\N
00040000-555d-a942-3fc3-c8db9ba0e194	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555d-a942-c7ce-8f0615db6e60	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555d-a942-b620-95369369b50f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555d-a942-7e2c-6fc6a1f73e72	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555d-a942-bca2-8d8cb1a9d4b4	BB	BRB	052	Barbados 	Barbados	\N
00040000-555d-a942-c1de-74c5f5849d1c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555d-a942-2bd2-4dca1209bf9e	BE	BEL	056	Belgium 	Belgija	\N
00040000-555d-a942-7a66-2abd7ac541bb	BZ	BLZ	084	Belize 	Belize	\N
00040000-555d-a942-3b30-345765b2631b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555d-a942-a299-a859aec4ca68	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555d-a942-be00-181eeaad3c01	BT	BTN	064	Bhutan 	Butan	\N
00040000-555d-a942-1bef-ff154e94245d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555d-a942-a15b-a56ce50ea458	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555d-a942-31ee-4ceb2cc4c2c6	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555d-a942-00c7-726c5bd24f6e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555d-a942-8b3c-2d8a9ac72ec0	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555d-a942-4eae-95aade6d9cca	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555d-a942-d7b3-2fe8daca91ad	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555d-a942-0949-2e4207b1536b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555d-a942-e440-2ea915287367	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555d-a942-ef34-dbc8924f9bcf	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555d-a942-ccab-ad98fd15199d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555d-a942-adb6-ed40b4941713	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555d-a942-fd26-0b9049559b04	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555d-a942-943e-bb749abc5dc3	CA	CAN	124	Canada 	Kanada	\N
00040000-555d-a942-8e01-820825ba5a70	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555d-a942-8597-66fec94645c4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555d-a942-aa86-19cb201c9471	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555d-a942-c6ba-6eb1e826e5f3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555d-a942-164c-4aaff7e4949c	CL	CHL	152	Chile 	Čile	\N
00040000-555d-a942-bce0-3be0721eb25f	CN	CHN	156	China 	Kitajska	\N
00040000-555d-a942-3754-330037d93b2d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555d-a942-77d7-993978ca71be	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555d-a942-0fee-b10a2f20ad66	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555d-a942-bd73-956b7c9c0c8b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555d-a942-4431-5d4fc41c07ba	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555d-a942-b4c8-adde2b47efcf	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555d-a942-2a61-92c25c569291	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555d-a942-3bb0-ffbe52d762af	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555d-a942-9f04-10bd8b71c11a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555d-a942-1af2-b2bc2e8ecd57	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555d-a942-8866-6a85baa38578	CU	CUB	192	Cuba 	Kuba	\N
00040000-555d-a942-65fc-defc59dee026	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555d-a942-f181-5013fa64de72	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555d-a942-cf27-910c82a8a006	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555d-a942-9b9e-85fc29108c61	DK	DNK	208	Denmark 	Danska	\N
00040000-555d-a942-d63c-46fb11a93820	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555d-a942-034b-e81670a9edba	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-a942-2a62-9b5c7e62da5d	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555d-a942-d0f9-3c3e2ce98aaf	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555d-a942-96c4-c9d2b33cf409	EG	EGY	818	Egypt 	Egipt	\N
00040000-555d-a942-12c0-206823cfc344	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555d-a942-633f-7a9f5e7218cf	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555d-a942-c15e-bd904b0bf920	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555d-a942-9a76-a95d3f92c8aa	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555d-a942-a166-1ecaf6cd9951	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555d-a942-9c54-6d9add7392dc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555d-a942-3f4c-6681cccc8a19	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555d-a942-17c0-a907f9f5cd8e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555d-a942-a164-73da71304528	FI	FIN	246	Finland 	Finska	\N
00040000-555d-a942-dcc2-5663b0e3f3cc	FR	FRA	250	France 	Francija	\N
00040000-555d-a942-8b5f-10235f329ae9	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555d-a942-d600-2df2f7940956	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555d-a942-c74b-5cdbde7c911f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555d-a942-76ae-4905b345fe53	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555d-a942-93de-8d90933cd05d	GA	GAB	266	Gabon 	Gabon	\N
00040000-555d-a942-45ec-30cb31ac7061	GM	GMB	270	Gambia 	Gambija	\N
00040000-555d-a942-b935-ee4f2b7ad342	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555d-a942-0185-edab93a7be10	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555d-a942-2f8f-7b3327baa191	GH	GHA	288	Ghana 	Gana	\N
00040000-555d-a942-d67e-25969511181c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555d-a942-34e1-63c4c31292cb	GR	GRC	300	Greece 	Grčija	\N
00040000-555d-a942-14f1-74c4a5054e9f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555d-a942-109e-459d5c9af6c7	GD	GRD	308	Grenada 	Grenada	\N
00040000-555d-a942-b6dc-e39598360694	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555d-a942-49c8-acbf96f9ff1e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555d-a942-78e7-dfbf979f75d5	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555d-a942-e9cb-405a8f540bf1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555d-a942-d8f2-29b7c07089c6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555d-a942-26da-3546eb60ddbb	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555d-a942-f281-25f9df75483d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555d-a942-3d5f-fde3281c6d67	HT	HTI	332	Haiti 	Haiti	\N
00040000-555d-a942-63b1-95238ff2ef00	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555d-a942-7f08-d07dee25ed61	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555d-a942-daa4-f92d7c650e55	HN	HND	340	Honduras 	Honduras	\N
00040000-555d-a942-48ed-d5f7ef2ffc75	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555d-a942-5035-66d3c18708f4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555d-a942-d4cf-e7bbcbaf6108	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555d-a942-34f2-3e35a4f0e217	IN	IND	356	India 	Indija	\N
00040000-555d-a942-1b10-cd032cdbcaa5	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555d-a942-a6fd-0de7e5f77ee2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555d-a942-e8dc-ea674e37b170	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555d-a942-833c-c770932490bb	IE	IRL	372	Ireland 	Irska	\N
00040000-555d-a942-ac82-6c2e476127fd	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555d-a942-c234-aa907fabcf83	IL	ISR	376	Israel 	Izrael	\N
00040000-555d-a942-14f1-c68b986dc0dc	IT	ITA	380	Italy 	Italija	\N
00040000-555d-a942-ac24-6dcdd1b76735	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555d-a942-dd3f-36cec6be5052	JP	JPN	392	Japan 	Japonska	\N
00040000-555d-a942-3383-71ba2822a433	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555d-a942-c589-d3996525ee4a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555d-a942-7e3c-0afcda5f07e2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555d-a942-799c-db77003582c3	KE	KEN	404	Kenya 	Kenija	\N
00040000-555d-a942-e7f6-4c879573f94f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555d-a942-13ab-5b0d8ef0a676	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555d-a942-ab4c-a165114fba87	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555d-a942-31f2-17a1bb4f0d1a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555d-a942-c692-d6e15aab6c7d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555d-a942-eb7b-96d6a42cd27b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555d-a942-0b27-938582dbc6a0	LV	LVA	428	Latvia 	Latvija	\N
00040000-555d-a942-5d56-3eff690f8dc8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555d-a942-a1e7-5f0e1d82ebf0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555d-a942-ca24-839d5f63e7de	LR	LBR	430	Liberia 	Liberija	\N
00040000-555d-a942-cf34-1e23a26271a7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555d-a942-a974-1f145eead036	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555d-a942-0ce4-e09127850de0	LT	LTU	440	Lithuania 	Litva	\N
00040000-555d-a942-65de-ac98eecc9336	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555d-a942-4dc5-500d5444d1fb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555d-a942-0d2c-5afb7e7a7db8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555d-a942-b4ae-b61b13015d5b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555d-a942-ae11-5ae9fb9b87e5	MW	MWI	454	Malawi 	Malavi	\N
00040000-555d-a942-65d2-03e238d556e9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555d-a942-43f2-b9ce36464510	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555d-a942-4cb7-044b7304d822	ML	MLI	466	Mali 	Mali	\N
00040000-555d-a942-00c7-5279aee9854d	MT	MLT	470	Malta 	Malta	\N
00040000-555d-a942-947f-2990797e0b63	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555d-a942-6691-de766d079305	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555d-a942-45cc-8f82068e2eea	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555d-a942-746d-43ba40e946c0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555d-a942-2d36-9513556d8b23	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555d-a942-0b69-da1876cd879a	MX	MEX	484	Mexico 	Mehika	\N
00040000-555d-a942-abf2-fcb99b0ab139	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555d-a942-7dab-a3f6b4f27363	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555d-a942-d9e3-132481c291e6	MC	MCO	492	Monaco 	Monako	\N
00040000-555d-a942-0b74-2a0bef2e08e6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555d-a942-4321-74871e5383bd	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555d-a942-e060-f5a2c99b16aa	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555d-a942-e967-583e69194cc9	MA	MAR	504	Morocco 	Maroko	\N
00040000-555d-a942-31f8-498c5544cd3e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555d-a942-37b6-646f03c3a983	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555d-a942-1a1d-5b6b903c99f8	NA	NAM	516	Namibia 	Namibija	\N
00040000-555d-a942-20ec-110fd5cce28a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555d-a942-a004-b723addc3e16	NP	NPL	524	Nepal 	Nepal	\N
00040000-555d-a942-6519-90e8379f9913	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555d-a942-230f-a197c8a4dcc8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555d-a942-5cd0-b9921e1e8651	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555d-a942-d35a-c0c75066ed78	NE	NER	562	Niger 	Niger 	\N
00040000-555d-a942-248e-d02844552a65	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555d-a942-92f9-518dec646651	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555d-a942-697c-eedbf7bd2e77	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555d-a942-7da8-d9a6700bbadc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555d-a942-dce4-30236266a742	NO	NOR	578	Norway 	Norveška	\N
00040000-555d-a942-84b1-a8f39fbb6b93	OM	OMN	512	Oman 	Oman	\N
00040000-555d-a942-7450-c42c0812ceda	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555d-a942-3a87-106c1e2d1b96	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555d-a942-2abc-d528bb03a954	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555d-a942-e789-c53569864591	PA	PAN	591	Panama 	Panama	\N
00040000-555d-a942-0b28-28a5081693b0	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555d-a942-3dc5-cdc9fc26f861	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555d-a942-c802-e1d3f03e66d8	PE	PER	604	Peru 	Peru	\N
00040000-555d-a942-f0b6-60f047c313f9	PH	PHL	608	Philippines 	Filipini	\N
00040000-555d-a942-53c0-a36a9b884989	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555d-a942-d940-acb89f942331	PL	POL	616	Poland 	Poljska	\N
00040000-555d-a942-9a8c-44a5208acc6c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555d-a942-1f77-58deb55c76dc	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555d-a942-47f3-5baf3e371106	QA	QAT	634	Qatar 	Katar	\N
00040000-555d-a942-599e-c7667ceede46	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555d-a942-28c3-cb6dbbd69e2a	RO	ROU	642	Romania 	Romunija	\N
00040000-555d-a942-d39f-5015caa7c2bb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555d-a942-36c8-10140c95b0fd	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555d-a942-d3f3-e738926c57aa	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555d-a942-dbe9-95519a9de1aa	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555d-a942-2e64-17cc2d47e6a4	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555d-a942-8e55-98f9373461f8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555d-a942-0844-905942d1315e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555d-a942-13e2-8c12e6597ad9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555d-a942-7bbd-1ee34ac45943	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555d-a942-2d98-9751515e4929	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555d-a942-85d3-81e6b4ec0c3a	SM	SMR	674	San Marino 	San Marino	\N
00040000-555d-a942-5aba-95368baf22e7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555d-a942-33a6-feb57f2d0775	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555d-a942-713b-fa83786673c8	SN	SEN	686	Senegal 	Senegal	\N
00040000-555d-a942-6d3a-a9d2e7201ee6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555d-a942-45e1-c1c53d7d9f92	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555d-a942-323e-5d41c8de53de	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555d-a942-d5f1-15e15904bbfc	SG	SGP	702	Singapore 	Singapur	\N
00040000-555d-a942-4ba5-4feae324d044	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555d-a942-258f-4cff27d9c101	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555d-a942-79ca-e77118dcd9bf	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555d-a942-02ca-df93dd7c1e05	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555d-a942-2f01-15819b71fdb0	SO	SOM	706	Somalia 	Somalija	\N
00040000-555d-a942-2d0a-a150c54879f5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555d-a942-7f82-65b0127794b1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555d-a942-318a-b8f989190aa6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555d-a942-e5a5-6aa50bc3fba1	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555d-a942-c731-e875ce69d885	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555d-a942-b2fa-9730d577ed22	SD	SDN	729	Sudan 	Sudan	\N
00040000-555d-a942-719e-d7da327dba9f	SR	SUR	740	Suriname 	Surinam	\N
00040000-555d-a942-9ec3-2b5f63e7b34d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555d-a942-e049-ca3c99b89d9a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555d-a942-a8a8-c118e83a0d29	SE	SWE	752	Sweden 	Švedska	\N
00040000-555d-a942-3f76-70d216f8be08	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555d-a942-32ba-77dc6f4a15c6	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555d-a942-a5a5-1dd7f9720ee3	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555d-a942-d4de-7f851c9d80e1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555d-a942-a285-8c8d33a0a76d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555d-a942-2ca1-e1e7626c46a3	TH	THA	764	Thailand 	Tajska	\N
00040000-555d-a942-32bd-cdbced5567a4	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555d-a942-d307-d3d31c2419a6	TG	TGO	768	Togo 	Togo	\N
00040000-555d-a942-b66d-88ca978c8195	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555d-a942-ffc2-c2376cc1ff7b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555d-a942-b08c-5f6525b326ec	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555d-a942-61e6-fd2ffea12e5f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555d-a942-5b4b-2a03f6b2db4b	TR	TUR	792	Turkey 	Turčija	\N
00040000-555d-a942-f55f-8cebce9ca42c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555d-a942-2462-f49490c08a23	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-a942-bfae-b0f407eca698	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555d-a942-8cc9-39cd788e2dcf	UG	UGA	800	Uganda 	Uganda	\N
00040000-555d-a942-a6d3-d644d8778627	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555d-a942-a2e3-77859afc2630	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555d-a942-4255-959c1cb16ffc	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555d-a942-3e64-34bfa90acb6c	US	USA	840	United States 	Združene države Amerike	\N
00040000-555d-a942-f002-380b81d93250	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555d-a942-f7ca-dd15d3811424	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555d-a942-3e6f-0a9bf73105c4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555d-a942-ea71-1eaefb8866e9	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555d-a942-73c8-7131a6ec8102	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555d-a942-40fa-60ea06e68b65	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555d-a942-fb5e-051748e33712	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-a942-0236-0b857a3fab98	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555d-a942-9de3-6cd65cf7375f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555d-a942-a8b1-385a1c9d6c76	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555d-a942-fb3c-cde669262ac5	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555d-a942-5465-8f4301834305	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555d-a942-246d-000e34c11b31	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2665 (class 0 OID 4369831)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4369656)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4369700)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2623 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 4369749)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4369774)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4369605)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555d-a942-9c1e-c20637a3c466	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555d-a942-e5b3-546b349ae7d1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555d-a942-6960-63a2345483d7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555d-a942-8f45-41c9a6284170	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555d-a942-a0c8-4c8d96a14cf0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555d-a942-73da-59241b1940a3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555d-a942-8dea-a04556a708d1	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555d-a942-1480-028ced93a9ca	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555d-a942-6d64-f1847d035342	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555d-a942-5a8d-88f6586769f1	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555d-a942-f699-f84939d42902	uprizoritev.faza	array	a:5:{s:7:"osnutek";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:4:"plan";a:1:{s:5:"label";s:14:"Predprodukcija";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
\.


--
-- TOC entry 2633 (class 0 OID 4369515)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555d-a942-ba46-94bb3200c594	00000000-555d-a942-a0c8-4c8d96a14cf0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555d-a942-e2ff-e141c8410837	00000000-555d-a942-a0c8-4c8d96a14cf0	00010000-555d-a942-6a0f-3aa9c34d5d84	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555d-a942-1f9f-ecd93be3e072	00000000-555d-a942-73da-59241b1940a3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2634 (class 0 OID 4369526)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4369576)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4369480)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555d-a942-721e-e4045d1a79ec	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555d-a942-4086-b70225d7bd33	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555d-a942-1344-6616c59be147	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555d-a942-a285-c6fa880a111f	Abonma-read	Abonma - branje	f
00030000-555d-a942-9d36-b19a4a681108	Abonma-write	Abonma - spreminjanje	f
00030000-555d-a942-9b07-6dacb9831a1d	Alternacija-read	Alternacija - branje	f
00030000-555d-a942-0d64-9861d0746d9c	Alternacija-write	Alternacija - spreminjanje	f
00030000-555d-a942-e183-72c3df4c8a04	Arhivalija-read	Arhivalija - branje	f
00030000-555d-a942-37ea-ad5e6aff39f4	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555d-a942-fb85-9d1cfcd3710c	Besedilo-read	Besedilo - branje	f
00030000-555d-a942-75ed-82614b72835e	Besedilo-write	Besedilo - spreminjanje	f
00030000-555d-a942-1c78-fd5b829c930e	DogodekIzven-read	DogodekIzven - branje	f
00030000-555d-a942-a776-ab244e68a73d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555d-a942-23d3-acb758ef33d0	Dogodek-read	Dogodek - branje	f
00030000-555d-a942-f119-b0e14ba45d41	Dogodek-write	Dogodek - spreminjanje	f
00030000-555d-a942-5ded-b998ab9f618a	Drzava-read	Drzava - branje	f
00030000-555d-a942-7012-b5f86b7a118b	Drzava-write	Drzava - spreminjanje	f
00030000-555d-a942-0d31-c85dd503ec01	Funkcija-read	Funkcija - branje	f
00030000-555d-a942-3002-25934d7e69f7	Funkcija-write	Funkcija - spreminjanje	f
00030000-555d-a942-da9a-8031d96f514e	Gostovanje-read	Gostovanje - branje	f
00030000-555d-a942-e516-d75d70c45614	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555d-a942-2c08-5b75714f3b71	Gostujoca-read	Gostujoca - branje	f
00030000-555d-a942-413a-1869b4014a8e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555d-a942-a6e0-5edf93553292	Kupec-read	Kupec - branje	f
00030000-555d-a942-3bce-24d22786fc3f	Kupec-write	Kupec - spreminjanje	f
00030000-555d-a942-2452-5355f0ae2845	NacinPlacina-read	NacinPlacina - branje	f
00030000-555d-a942-2644-f160ba41af16	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555d-a942-8992-8e54674b9d10	Option-read	Option - branje	f
00030000-555d-a942-2b82-105dba2be4ba	Option-write	Option - spreminjanje	f
00030000-555d-a942-2db5-a9b19044f69e	OptionValue-read	OptionValue - branje	f
00030000-555d-a942-1f8c-ef137c64992f	OptionValue-write	OptionValue - spreminjanje	f
00030000-555d-a942-80f1-f4adadfb98dc	Oseba-read	Oseba - branje	f
00030000-555d-a942-4af6-dae091c651c7	Oseba-write	Oseba - spreminjanje	f
00030000-555d-a942-c7e6-ce4b51b89297	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555d-a942-9a52-710cfe4bdb58	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555d-a942-e7d8-e0e931ef3101	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555d-a942-1913-5f13ab75a075	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555d-a942-e9e9-4da4d2e148cc	Pogodba-read	Pogodba - branje	f
00030000-555d-a942-beb6-38ac76ecb9f0	Pogodba-write	Pogodba - spreminjanje	f
00030000-555d-a942-71dd-e2f76e55907f	Popa-read	Popa - branje	f
00030000-555d-a942-b58d-7b3b7ad76dbe	Popa-write	Popa - spreminjanje	f
00030000-555d-a942-34c3-bb8be085d47e	Posta-read	Posta - branje	f
00030000-555d-a942-d215-f9bb1c5da671	Posta-write	Posta - spreminjanje	f
00030000-555d-a942-ae24-b3a1967c4ae8	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555d-a942-5196-67d35c81338a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555d-a942-b6dd-87a55d57d932	PostniNaslov-read	PostniNaslov - branje	f
00030000-555d-a942-399d-c1e7034c9724	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555d-a942-f444-2a9be8ad29b2	Predstava-read	Predstava - branje	f
00030000-555d-a942-f2cd-da72d10e193a	Predstava-write	Predstava - spreminjanje	f
00030000-555d-a942-d783-46d8e90b5667	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555d-a942-14ba-e36f4ea25106	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555d-a942-66b3-f728e2990fb4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555d-a942-773f-15893f0976e1	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555d-a942-47dc-201251702903	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555d-a942-5de5-67ba88a6763d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555d-a942-f949-b6a1caf23eec	Prostor-read	Prostor - branje	f
00030000-555d-a942-7eab-a3770f1ecb9c	Prostor-write	Prostor - spreminjanje	f
00030000-555d-a942-6b71-0951d909c0cf	Racun-read	Racun - branje	f
00030000-555d-a942-366a-55e3fde3994f	Racun-write	Racun - spreminjanje	f
00030000-555d-a942-7ecf-9401cab28292	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555d-a942-6ec1-8d017c03f96c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555d-a942-47ae-5cac68eb116c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555d-a942-9995-f1cc95c30c35	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555d-a942-5819-39b82fd866dc	Rekvizit-read	Rekvizit - branje	f
00030000-555d-a942-f61d-2afde234e4a9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555d-a942-5d93-5ee9378f8f35	Rezervacija-read	Rezervacija - branje	f
00030000-555d-a942-9fbe-2ff18144abb0	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555d-a942-b709-412ccc568fba	SedezniRed-read	SedezniRed - branje	f
00030000-555d-a942-59a7-6a144cee9494	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555d-a942-e7cf-4f2e42976811	Sedez-read	Sedez - branje	f
00030000-555d-a942-e5b2-82b55910e62d	Sedez-write	Sedez - spreminjanje	f
00030000-555d-a942-d16b-f2b5f150fe63	Sezona-read	Sezona - branje	f
00030000-555d-a942-db1f-a908d9c2fae8	Sezona-write	Sezona - spreminjanje	f
00030000-555d-a942-4ba6-8b2643d0e5a6	Telefonska-read	Telefonska - branje	f
00030000-555d-a942-6f2e-a8ec18c12b1b	Telefonska-write	Telefonska - spreminjanje	f
00030000-555d-a942-8c4b-b3c936051e28	TerminStoritve-read	TerminStoritve - branje	f
00030000-555d-a942-c612-a7c8926c5eab	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555d-a942-782f-cc6034771a91	TipFunkcije-read	TipFunkcije - branje	f
00030000-555d-a942-d1e0-50de21d9307f	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555d-a942-e167-49fe9f278452	Trr-read	Trr - branje	f
00030000-555d-a942-6ba9-a42ce4e09cfd	Trr-write	Trr - spreminjanje	f
00030000-555d-a942-2128-d92ca1788c50	Uprizoritev-read	Uprizoritev - branje	f
00030000-555d-a942-355d-ee07277af877	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555d-a942-8c80-fbb6b4136904	Vaja-read	Vaja - branje	f
00030000-555d-a942-8f17-7acfdd75c432	Vaja-write	Vaja - spreminjanje	f
00030000-555d-a942-94f4-0e37de917f0f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555d-a942-4111-1514569dc087	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555d-a942-21e2-87be8b0bdea2	Zaposlitev-read	Zaposlitev - branje	f
00030000-555d-a942-cd62-c32b490b9976	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555d-a942-10dd-f73b343f3144	Zasedenost-read	Zasedenost - branje	f
00030000-555d-a942-4ef0-88cb8c4a7ec9	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555d-a942-41a7-b44678c22506	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555d-a942-43d4-127c17945786	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555d-a942-3831-79e6de9b7e63	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555d-a942-150d-6b686b63d9d6	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2631 (class 0 OID 4369499)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555d-a942-f089-e034257b8af0	00030000-555d-a942-5ded-b998ab9f618a
00020000-555d-a942-0a9e-475e59c5411b	00030000-555d-a942-7012-b5f86b7a118b
00020000-555d-a942-0a9e-475e59c5411b	00030000-555d-a942-5ded-b998ab9f618a
\.


--
-- TOC entry 2659 (class 0 OID 4369781)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4369811)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4369924)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 4369556)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4369597)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555d-a942-9608-497ea5335976	8341	Adlešiči
00050000-555d-a942-81d4-825b687c2bff	5270	Ajdovščina
00050000-555d-a942-d9ac-5d599a59f38e	6280	Ankaran/Ancarano
00050000-555d-a942-c015-142173e0c9dc	9253	Apače
00050000-555d-a942-fa9e-c9548dec9a4e	8253	Artiče
00050000-555d-a942-b86b-08c0ea4abe78	4275	Begunje na Gorenjskem
00050000-555d-a942-33c2-94d5e7b2ae9e	1382	Begunje pri Cerknici
00050000-555d-a942-f84b-a6527b3db53a	9231	Beltinci
00050000-555d-a942-4d23-5c1ff9c62f36	2234	Benedikt
00050000-555d-a942-8f95-bf8487c5230a	2345	Bistrica ob Dravi
00050000-555d-a942-5be4-97fa2fb3fa07	3256	Bistrica ob Sotli
00050000-555d-a942-0887-2bdf897f06eb	8259	Bizeljsko
00050000-555d-a942-7cb3-03e086f78255	1223	Blagovica
00050000-555d-a942-2d97-2a4a5dfd5ffc	8283	Blanca
00050000-555d-a942-e172-3a783c4cdca3	4260	Bled
00050000-555d-a942-c709-71c4dc87e26e	4273	Blejska Dobrava
00050000-555d-a942-2e55-5ee67886ebee	9265	Bodonci
00050000-555d-a942-3a03-f30cb6ba1cdc	9222	Bogojina
00050000-555d-a942-8975-103b323b9946	4263	Bohinjska Bela
00050000-555d-a942-5b98-cda86626956a	4264	Bohinjska Bistrica
00050000-555d-a942-c6a9-66045984c45e	4265	Bohinjsko jezero
00050000-555d-a942-55f7-301d9437097d	1353	Borovnica
00050000-555d-a942-36b5-2f05e4b68651	8294	Boštanj
00050000-555d-a942-c4b5-18f222ace422	5230	Bovec
00050000-555d-a942-6277-a2e9754f54f2	5295	Branik
00050000-555d-a942-7475-6ef9520176d5	3314	Braslovče
00050000-555d-a942-c6e1-59dc8e50e348	5223	Breginj
00050000-555d-a942-9253-9e0861d591bc	8280	Brestanica
00050000-555d-a942-b92e-2594cd7a4199	2354	Bresternica
00050000-555d-a942-b06f-51aeb590a961	4243	Brezje
00050000-555d-a942-9352-2fc3a6a8dd90	1351	Brezovica pri Ljubljani
00050000-555d-a942-e180-a75f909dab3d	8250	Brežice
00050000-555d-a942-587d-ff9d15930dbe	4210	Brnik - Aerodrom
00050000-555d-a942-af3e-5d0910b699e2	8321	Brusnice
00050000-555d-a942-871a-2991798614d7	3255	Buče
00050000-555d-a942-ee87-2ab57d0ae7fb	8276	Bučka 
00050000-555d-a942-f049-ac105372c2c1	9261	Cankova
00050000-555d-a942-ef34-aff8c55c1531	3000	Celje 
00050000-555d-a942-72de-b0b2185c059e	3001	Celje - poštni predali
00050000-555d-a942-3aa8-591952f7a54d	4207	Cerklje na Gorenjskem
00050000-555d-a942-95b4-19347d5ddd97	8263	Cerklje ob Krki
00050000-555d-a942-7612-6c0e615a3049	1380	Cerknica
00050000-555d-a942-bee4-d5b1d7780ddc	5282	Cerkno
00050000-555d-a942-f570-0971488ec54f	2236	Cerkvenjak
00050000-555d-a942-2da5-72d7be14d455	2215	Ceršak
00050000-555d-a942-5934-bd754fa59e5c	2326	Cirkovce
00050000-555d-a942-9666-4140aeb9b2d9	2282	Cirkulane
00050000-555d-a942-c46b-25baa7eaa2a3	5273	Col
00050000-555d-a942-42a7-e84fd1599ae4	8251	Čatež ob Savi
00050000-555d-a942-e540-70523fb611cc	1413	Čemšenik
00050000-555d-a942-853e-a9db3f356e1a	5253	Čepovan
00050000-555d-a942-f6f9-c490a151989e	9232	Črenšovci
00050000-555d-a942-436a-c955d72c9b62	2393	Črna na Koroškem
00050000-555d-a942-6c27-8138a428dc48	6275	Črni Kal
00050000-555d-a942-aa64-164c2ff6b142	5274	Črni Vrh nad Idrijo
00050000-555d-a942-d201-c854d9582fd0	5262	Črniče
00050000-555d-a942-beef-6c31546655b7	8340	Črnomelj
00050000-555d-a942-8c48-94fad68ca608	6271	Dekani
00050000-555d-a942-0400-e6d111d082e2	5210	Deskle
00050000-555d-a942-1735-0a57c40d5511	2253	Destrnik
00050000-555d-a942-81c5-da3dd5b47817	6215	Divača
00050000-555d-a942-482c-c33a52bbc2e7	1233	Dob
00050000-555d-a942-ff7c-d500902709f3	3224	Dobje pri Planini
00050000-555d-a942-9958-49fd184e6e95	8257	Dobova
00050000-555d-a942-12c9-1f9d278f6025	1423	Dobovec
00050000-555d-a942-a4f6-f4a9574ff11f	5263	Dobravlje
00050000-555d-a942-f572-dab47263fe6c	3204	Dobrna
00050000-555d-a942-32b6-959603bbc288	8211	Dobrnič
00050000-555d-a942-7c06-635997b0f175	1356	Dobrova
00050000-555d-a942-d62e-7e360519b222	9223	Dobrovnik/Dobronak 
00050000-555d-a942-41ad-0dba5af35f65	5212	Dobrovo v Brdih
00050000-555d-a942-7079-19170c562615	1431	Dol pri Hrastniku
00050000-555d-a942-dd56-c4ee4eb96513	1262	Dol pri Ljubljani
00050000-555d-a942-9f5b-f9e02a10a65a	1273	Dole pri Litiji
00050000-555d-a942-def3-70e3c5080b47	1331	Dolenja vas
00050000-555d-a942-9584-3f0e81efde19	8350	Dolenjske Toplice
00050000-555d-a942-6854-bc47dd8da8d1	1230	Domžale
00050000-555d-a942-6109-fe2d06a64935	2252	Dornava
00050000-555d-a942-501b-589dbc808360	5294	Dornberk
00050000-555d-a942-f2cc-6c5425148e3a	1319	Draga
00050000-555d-a942-a852-4c1dcfd269fa	8343	Dragatuš
00050000-555d-a942-262b-2ef1ef1bea88	3222	Dramlje
00050000-555d-a942-46ec-3f872bcea536	2370	Dravograd
00050000-555d-a942-98cb-ea46f810693d	4203	Duplje
00050000-555d-a942-bb11-74841c8e97ba	6221	Dutovlje
00050000-555d-a942-b6b9-8dc6a79912ab	8361	Dvor
00050000-555d-a942-a71b-1bf2feddd4ae	2343	Fala
00050000-555d-a942-0985-10a211098dc3	9208	Fokovci
00050000-555d-a942-4c22-2a8036bffc8c	2313	Fram
00050000-555d-a942-f15b-44452397163b	3213	Frankolovo
00050000-555d-a942-dbc6-0e1822fe73db	1274	Gabrovka
00050000-555d-a942-4341-c86563bb6676	8254	Globoko
00050000-555d-a942-9b4a-7e05538e7da5	5275	Godovič
00050000-555d-a942-4641-d401a4ac7bd2	4204	Golnik
00050000-555d-a942-09e8-599f2e7bac47	3303	Gomilsko
00050000-555d-a942-45dd-f05afc17cf2c	4224	Gorenja vas
00050000-555d-a942-fd22-086fb5c3d896	3263	Gorica pri Slivnici
00050000-555d-a942-ab1c-db9401d77eb5	2272	Gorišnica
00050000-555d-a942-a169-6c152414b0e8	9250	Gornja Radgona
00050000-555d-a942-615d-dcdba8d081cb	3342	Gornji Grad
00050000-555d-a942-a18e-506bf5096ad4	4282	Gozd Martuljek
00050000-555d-a942-c80f-226455eb2249	6272	Gračišče
00050000-555d-a942-57c2-196162f965df	9264	Grad
00050000-555d-a942-3340-0f12c7551c83	8332	Gradac
00050000-555d-a942-4172-0b7373bea05b	1384	Grahovo
00050000-555d-a942-d98c-d039c16bd2b3	5242	Grahovo ob Bači
00050000-555d-a942-d6b1-bc3f35472383	5251	Grgar
00050000-555d-a942-de2f-6983d3e3bc64	3302	Griže
00050000-555d-a942-e5ee-1118e104c1b8	3231	Grobelno
00050000-555d-a942-0a6c-b132c80e0421	1290	Grosuplje
00050000-555d-a942-9b5b-437a4cb9c0df	2288	Hajdina
00050000-555d-a942-651b-8c69a74a7f6d	8362	Hinje
00050000-555d-a942-063d-3a466953d6da	2311	Hoče
00050000-555d-a942-49de-b26be7c0db39	9205	Hodoš/Hodos
00050000-555d-a942-08db-0691c2e215a2	1354	Horjul
00050000-555d-a942-1b84-59ff383967e5	1372	Hotedršica
00050000-555d-a942-28d4-400dbd391b11	1430	Hrastnik
00050000-555d-a942-9633-fa763ef09be4	6225	Hruševje
00050000-555d-a942-5142-4fac03e7b9c1	4276	Hrušica
00050000-555d-a942-1ed7-01f4603502e7	5280	Idrija
00050000-555d-a942-753f-b730d8c60996	1292	Ig
00050000-555d-a942-9d20-74ff0349e576	6250	Ilirska Bistrica
00050000-555d-a942-7cf7-69da5475cd47	6251	Ilirska Bistrica-Trnovo
00050000-555d-a942-7950-cb761e391dc4	1295	Ivančna Gorica
00050000-555d-a942-2b2b-d10c386a8cab	2259	Ivanjkovci
00050000-555d-a942-cd12-74605f50d19f	1411	Izlake
00050000-555d-a942-2e1b-352eebcb5899	6310	Izola/Isola
00050000-555d-a942-d97e-ccb26a293b82	2222	Jakobski Dol
00050000-555d-a942-a9c5-f525518b4a85	2221	Jarenina
00050000-555d-a942-d1f4-e3a197c3d654	6254	Jelšane
00050000-555d-a942-9c05-b3c1748cdd11	4270	Jesenice
00050000-555d-a942-944d-ac8d9709b8f6	8261	Jesenice na Dolenjskem
00050000-555d-a942-e772-0aafd4d4f359	3273	Jurklošter
00050000-555d-a942-7fdb-b71e26021945	2223	Jurovski Dol
00050000-555d-a942-b05a-39629ba07003	2256	Juršinci
00050000-555d-a942-c965-d435298eb748	5214	Kal nad Kanalom
00050000-555d-a942-0fd1-58c376fe7da1	3233	Kalobje
00050000-555d-a942-99ec-551a57852995	4246	Kamna Gorica
00050000-555d-a942-48d0-787ba63f0353	2351	Kamnica
00050000-555d-a942-4f62-22173aa6b1fe	1241	Kamnik
00050000-555d-a942-8c7e-711fe19fe531	5213	Kanal
00050000-555d-a942-426f-f97c24a90e8d	8258	Kapele
00050000-555d-a942-6a06-0815da8f3190	2362	Kapla
00050000-555d-a942-2424-323d31061848	2325	Kidričevo
00050000-555d-a942-38f4-4a3dd06d71e4	1412	Kisovec
00050000-555d-a942-6bf4-5228553ba09c	6253	Knežak
00050000-555d-a942-81f9-e4f9810f12b0	5222	Kobarid
00050000-555d-a942-2472-e8ecb2f1bd4b	9227	Kobilje
00050000-555d-a942-472b-785d1b996702	1330	Kočevje
00050000-555d-a942-256f-e0ce69050e7c	1338	Kočevska Reka
00050000-555d-a942-1165-8ee9fe86e090	2276	Kog
00050000-555d-a942-ac46-18f97dd5eba9	5211	Kojsko
00050000-555d-a942-5a1c-8082ccdfd032	6223	Komen
00050000-555d-a942-b29d-ca00e9286ed9	1218	Komenda
00050000-555d-a942-0f1c-3162e3ccc0b6	6000	Koper/Capodistria 
00050000-555d-a942-e465-967e89b78c9b	6001	Koper/Capodistria - poštni predali
00050000-555d-a942-2268-8f6eac888542	8282	Koprivnica
00050000-555d-a942-63ee-a0ae16705b12	5296	Kostanjevica na Krasu
00050000-555d-a942-8ce2-04bdb59ddf28	8311	Kostanjevica na Krki
00050000-555d-a942-7162-54abc7feaa78	1336	Kostel
00050000-555d-a942-29f1-f92a958e39f8	6256	Košana
00050000-555d-a942-0303-e0f8b86cfa2d	2394	Kotlje
00050000-555d-a942-76cb-f4b3caf1de85	6240	Kozina
00050000-555d-a942-d35a-caf64f998d8b	3260	Kozje
00050000-555d-a942-42ab-cc1d1ced15bb	4000	Kranj 
00050000-555d-a942-1b26-945161b5fe6c	4001	Kranj - poštni predali
00050000-555d-a942-5861-4378da5f745a	4280	Kranjska Gora
00050000-555d-a942-7bdf-e4437986ede5	1281	Kresnice
00050000-555d-a942-48ff-51b567153f2b	4294	Križe
00050000-555d-a942-cd4e-86a40a717169	9206	Križevci
00050000-555d-a942-205f-f927f4ebeb6f	9242	Križevci pri Ljutomeru
00050000-555d-a942-621f-5ac661181112	1301	Krka
00050000-555d-a942-56b6-e55f1cf6cba3	8296	Krmelj
00050000-555d-a942-1419-14da34acb8a9	4245	Kropa
00050000-555d-a942-366c-ebd6fab22c8b	8262	Krška vas
00050000-555d-a942-ee79-046350bac6af	8270	Krško
00050000-555d-a942-6802-91bbab398085	9263	Kuzma
00050000-555d-a942-853e-061b934f5171	2318	Laporje
00050000-555d-a942-e822-95078c7177c7	3270	Laško
00050000-555d-a942-034e-91381ba3d8fc	1219	Laze v Tuhinju
00050000-555d-a942-ba79-ea81cdd591a7	2230	Lenart v Slovenskih goricah
00050000-555d-a942-6be9-926082bc03a9	9220	Lendava/Lendva
00050000-555d-a942-153f-f57795960039	4248	Lesce
00050000-555d-a942-d6d8-e2e885f190c5	3261	Lesično
00050000-555d-a942-6d11-abf792a8a94b	8273	Leskovec pri Krškem
00050000-555d-a942-918f-959c700041dc	2372	Libeliče
00050000-555d-a942-1f83-182a4a7a05a8	2341	Limbuš
00050000-555d-a942-45a4-106f37733630	1270	Litija
00050000-555d-a942-94b5-11c4102a48df	3202	Ljubečna
00050000-555d-a942-5153-eda66a729c3c	1000	Ljubljana 
00050000-555d-a942-37ae-a107c84384c8	1001	Ljubljana - poštni predali
00050000-555d-a942-3bcb-cc75f990f4cc	1231	Ljubljana - Črnuče
00050000-555d-a942-06a7-386998708b48	1261	Ljubljana - Dobrunje
00050000-555d-a942-9d5e-7c889b61914c	1260	Ljubljana - Polje
00050000-555d-a942-ce83-b18e2980246a	1210	Ljubljana - Šentvid
00050000-555d-a942-c282-cef02f161157	1211	Ljubljana - Šmartno
00050000-555d-a942-fa8a-04a9144f7f95	3333	Ljubno ob Savinji
00050000-555d-a942-1bf5-f14122db51d7	9240	Ljutomer
00050000-555d-a942-c67c-41c495a73522	3215	Loče
00050000-555d-a942-5542-cceb7be2b346	5231	Log pod Mangartom
00050000-555d-a942-7617-598d4b8c0e9c	1358	Log pri Brezovici
00050000-555d-a942-3fd6-692e6c2581e9	1370	Logatec
00050000-555d-a942-0c7d-a813e9999748	1371	Logatec
00050000-555d-a942-9b13-027986c4dac8	1434	Loka pri Zidanem Mostu
00050000-555d-a942-ac09-43344c1e2015	3223	Loka pri Žusmu
00050000-555d-a942-74f1-616388e563a8	6219	Lokev
00050000-555d-a942-21dd-8efce5241573	1318	Loški Potok
00050000-555d-a942-a036-89b138a56741	2324	Lovrenc na Dravskem polju
00050000-555d-a942-6262-a3c04511f9e9	2344	Lovrenc na Pohorju
00050000-555d-a942-ba2f-6b442ff1cad1	3334	Luče
00050000-555d-a942-0fd4-2cda794bedb8	1225	Lukovica
00050000-555d-a942-1e74-0d048c7c62e4	9202	Mačkovci
00050000-555d-a942-6d1e-fdb1682b44be	2322	Majšperk
00050000-555d-a942-078d-022b6ed245df	2321	Makole
00050000-555d-a942-c9f1-df2996d3fd8b	9243	Mala Nedelja
00050000-555d-a942-f3ae-bbab011815ea	2229	Malečnik
00050000-555d-a942-dcc1-102a2c6efabc	6273	Marezige
00050000-555d-a942-b150-a219e07f563d	2000	Maribor 
00050000-555d-a942-c148-f6579fad0ef3	2001	Maribor - poštni predali
00050000-555d-a942-47c1-72e593a6199b	2206	Marjeta na Dravskem polju
00050000-555d-a942-2300-662a34c08f24	2281	Markovci
00050000-555d-a942-bde3-70a39f4634e5	9221	Martjanci
00050000-555d-a942-5e38-200866832475	6242	Materija
00050000-555d-a942-b93b-c8789e0311fe	4211	Mavčiče
00050000-555d-a942-3571-23a660c6c37f	1215	Medvode
00050000-555d-a942-7729-1e2c9d20df9b	1234	Mengeš
00050000-555d-a942-6534-5a9c4a68933e	8330	Metlika
00050000-555d-a942-8955-a5389a25e78d	2392	Mežica
00050000-555d-a942-9046-063650587302	2204	Miklavž na Dravskem polju
00050000-555d-a942-dc9c-833aac357e57	2275	Miklavž pri Ormožu
00050000-555d-a942-d6c5-e4cda0f36a32	5291	Miren
00050000-555d-a942-25f6-344047ef5f19	8233	Mirna
00050000-555d-a942-d664-cc1baaf9d90f	8216	Mirna Peč
00050000-555d-a942-eded-3e8faebd798a	2382	Mislinja
00050000-555d-a942-8c3b-028ab34f9e1a	4281	Mojstrana
00050000-555d-a942-118d-026edeeaf9f8	8230	Mokronog
00050000-555d-a942-2dce-135fd959934c	1251	Moravče
00050000-555d-a942-949a-01a2a78ad455	9226	Moravske Toplice
00050000-555d-a942-cecc-280ead05a0eb	5216	Most na Soči
00050000-555d-a942-d746-4a529deadde5	1221	Motnik
00050000-555d-a942-1018-ffd1818e78ed	3330	Mozirje
00050000-555d-a942-2fbe-1d4b9ef69d24	9000	Murska Sobota 
00050000-555d-a942-0a32-f7ef90c7e512	9001	Murska Sobota - poštni predali
00050000-555d-a942-aa4f-59da14f635c2	2366	Muta
00050000-555d-a942-8e69-fcfb16405909	4202	Naklo
00050000-555d-a942-3464-ac46c75b0492	3331	Nazarje
00050000-555d-a942-9291-67d3a3a315f7	1357	Notranje Gorice
00050000-555d-a942-b993-42dddd6350f0	3203	Nova Cerkev
00050000-555d-a942-9350-1ac3007affde	5000	Nova Gorica 
00050000-555d-a942-18ed-db2b91abe73e	5001	Nova Gorica - poštni predali
00050000-555d-a942-714e-996e3e2d081d	1385	Nova vas
00050000-555d-a942-87e4-c98f29021d2e	8000	Novo mesto
00050000-555d-a942-f6d9-bbd59af8aa6b	8001	Novo mesto - poštni predali
00050000-555d-a942-4b07-63acb9b09505	6243	Obrov
00050000-555d-a942-2b49-0ddbf4f34cef	9233	Odranci
00050000-555d-a942-6f27-cb186474ff64	2317	Oplotnica
00050000-555d-a942-1b30-500048649b99	2312	Orehova vas
00050000-555d-a942-032f-7394507ced66	2270	Ormož
00050000-555d-a942-2568-3b0e74a1a4be	1316	Ortnek
00050000-555d-a942-25f7-a63186906338	1337	Osilnica
00050000-555d-a942-a87d-56a1a5df4150	8222	Otočec
00050000-555d-a942-ee65-c9a8305f354a	2361	Ožbalt
00050000-555d-a942-1755-d4c8bffde3b4	2231	Pernica
00050000-555d-a942-8841-562fec0b795f	2211	Pesnica pri Mariboru
00050000-555d-a942-a31e-2ce52ab37a4a	9203	Petrovci
00050000-555d-a942-c600-2f0e2f40bef2	3301	Petrovče
00050000-555d-a942-bfb6-8b6fdae6af6c	6330	Piran/Pirano
00050000-555d-a942-1624-4f7f049fca2f	8255	Pišece
00050000-555d-a942-f249-ef4f811d117b	6257	Pivka
00050000-555d-a942-3367-256a223f5436	6232	Planina
00050000-555d-a942-800a-884addf66f19	3225	Planina pri Sevnici
00050000-555d-a942-019d-ca082866ca88	6276	Pobegi
00050000-555d-a942-9887-480e27edfebd	8312	Podbočje
00050000-555d-a942-3d8e-4aa53fefc6c3	5243	Podbrdo
00050000-555d-a942-c48d-4b5471ca279e	3254	Podčetrtek
00050000-555d-a942-b87f-d2301604cfc5	2273	Podgorci
00050000-555d-a942-43ad-ee42289a5eb5	6216	Podgorje
00050000-555d-a942-51c1-f49dd375f83a	2381	Podgorje pri Slovenj Gradcu
00050000-555d-a942-b3ca-5bd2aef713df	6244	Podgrad
00050000-555d-a942-50c8-e801e3a26436	1414	Podkum
00050000-555d-a942-f69f-215bbcb691cd	2286	Podlehnik
00050000-555d-a942-3d3c-7497fc998c61	5272	Podnanos
00050000-555d-a942-2070-b59d747ece87	4244	Podnart
00050000-555d-a942-f50c-a440d3e46c53	3241	Podplat
00050000-555d-a942-9a6f-c6c436f01146	3257	Podsreda
00050000-555d-a942-76e9-c0d8888a28ee	2363	Podvelka
00050000-555d-a942-fba5-21ad9c25ef00	2208	Pohorje
00050000-555d-a942-81bf-49f36bef568c	2257	Polenšak
00050000-555d-a942-046f-a92eb614e898	1355	Polhov Gradec
00050000-555d-a942-c09e-847906cd3f87	4223	Poljane nad Škofjo Loko
00050000-555d-a942-3dc0-57ad365d9b38	2319	Poljčane
00050000-555d-a942-c422-4bf12bc7751e	1272	Polšnik
00050000-555d-a942-febc-b425eb04d464	3313	Polzela
00050000-555d-a942-43d1-aa2f8eeeee90	3232	Ponikva
00050000-555d-a942-d842-8069add6bf3d	6320	Portorož/Portorose
00050000-555d-a942-bef3-b3e20dfc689f	6230	Postojna
00050000-555d-a942-60c1-9391135ff6dc	2331	Pragersko
00050000-555d-a942-03f1-0c75adb18497	3312	Prebold
00050000-555d-a942-6694-30ebb7e1e896	4205	Preddvor
00050000-555d-a942-2e84-7c1c43e3cf6b	6255	Prem
00050000-555d-a942-bed1-140cbd2d8d59	1352	Preserje
00050000-555d-a942-9459-3c776c3ff00d	6258	Prestranek
00050000-555d-a942-6ec2-38b761e1a79a	2391	Prevalje
00050000-555d-a942-da41-993cf763087b	3262	Prevorje
00050000-555d-a942-d991-86b75ca0b76c	1276	Primskovo 
00050000-555d-a942-7ad4-762497ff729f	3253	Pristava pri Mestinju
00050000-555d-a942-17d1-d54b9ef599aa	9207	Prosenjakovci/Partosfalva
00050000-555d-a942-f645-62d682289da3	5297	Prvačina
00050000-555d-a942-8779-3b3ef3bcf6df	2250	Ptuj
00050000-555d-a942-981d-305abb427d61	2323	Ptujska Gora
00050000-555d-a942-dfc5-db62204fad71	9201	Puconci
00050000-555d-a942-991c-3ff485d85043	2327	Rače
00050000-555d-a942-0d64-a1238c91d8aa	1433	Radeče
00050000-555d-a942-6d1d-e332e881f6f6	9252	Radenci
00050000-555d-a942-292b-065b414fc4f8	2360	Radlje ob Dravi
00050000-555d-a942-d0cf-00c29773f20a	1235	Radomlje
00050000-555d-a942-2e10-c3062214c2de	4240	Radovljica
00050000-555d-a942-5e64-db1b448a8099	8274	Raka
00050000-555d-a942-33f9-4cbb26e8639a	1381	Rakek
00050000-555d-a942-e7c4-bbc58711c244	4283	Rateče - Planica
00050000-555d-a942-1a6e-0045280c575d	2390	Ravne na Koroškem
00050000-555d-a942-ee8d-ff6c681a85c2	9246	Razkrižje
00050000-555d-a942-2fda-6a7b30d5636c	3332	Rečica ob Savinji
00050000-555d-a942-c224-462699e1b933	5292	Renče
00050000-555d-a942-7131-210ac880dc30	1310	Ribnica
00050000-555d-a942-8569-066b2e877b25	2364	Ribnica na Pohorju
00050000-555d-a942-a7ee-bbab44ee6948	3272	Rimske Toplice
00050000-555d-a942-ba72-d6cd69453a6b	1314	Rob
00050000-555d-a942-d1cb-2c3ace6efbd3	5215	Ročinj
00050000-555d-a942-3b5e-2ebd08073f97	3250	Rogaška Slatina
00050000-555d-a942-da5f-774696779f21	9262	Rogašovci
00050000-555d-a942-8a50-92161bf0acd3	3252	Rogatec
00050000-555d-a942-3a47-5f77260872f8	1373	Rovte
00050000-555d-a942-8f5d-c4a55c4b901d	2342	Ruše
00050000-555d-a942-e4de-67fdfccdb72a	1282	Sava
00050000-555d-a942-a529-34d9af0716f7	6333	Sečovlje/Sicciole
00050000-555d-a942-42f0-fda56b0a03bb	4227	Selca
00050000-555d-a942-52bc-358ce499750d	2352	Selnica ob Dravi
00050000-555d-a942-583b-9e5b5f346d05	8333	Semič
00050000-555d-a942-d99b-eaf8b4a7e197	8281	Senovo
00050000-555d-a942-7b06-5072e1f5c252	6224	Senožeče
00050000-555d-a942-b08a-dc8fd89421c1	8290	Sevnica
00050000-555d-a942-2cb5-e14a2b86502b	6210	Sežana
00050000-555d-a942-b143-bf851424961c	2214	Sladki Vrh
00050000-555d-a942-786d-a7653c537f9d	5283	Slap ob Idrijci
00050000-555d-a942-3f70-612885457ec4	2380	Slovenj Gradec
00050000-555d-a942-c96e-1d8e06620046	2310	Slovenska Bistrica
00050000-555d-a942-5396-b52aa9c75f07	3210	Slovenske Konjice
00050000-555d-a942-ac7a-b403823143d0	1216	Smlednik
00050000-555d-a942-651b-e83b9edf9723	5232	Soča
00050000-555d-a942-4e3c-5c7e2306fa1b	1317	Sodražica
00050000-555d-a942-d857-054664f9cb8d	3335	Solčava
00050000-555d-a942-a623-47e61a8d9a45	5250	Solkan
00050000-555d-a942-e18c-764c4bb9a811	4229	Sorica
00050000-555d-a942-b60d-5612c55ab47f	4225	Sovodenj
00050000-555d-a942-d4ed-f1fc0d6ad7d0	5281	Spodnja Idrija
00050000-555d-a942-fbaa-8b8e009fc8cd	2241	Spodnji Duplek
00050000-555d-a942-bd6e-3d198a09c9d0	9245	Spodnji Ivanjci
00050000-555d-a942-f2f6-07cda6ab408d	2277	Središče ob Dravi
00050000-555d-a942-aa3b-058afa025b14	4267	Srednja vas v Bohinju
00050000-555d-a942-ab91-563f43505f72	8256	Sromlje 
00050000-555d-a942-ecbb-44fb64d9a3ce	5224	Srpenica
00050000-555d-a942-75e6-eb4f99ddd759	1242	Stahovica
00050000-555d-a942-b6b5-a9c4b7efb75b	1332	Stara Cerkev
00050000-555d-a942-3196-7e7f8d0537b5	8342	Stari trg ob Kolpi
00050000-555d-a942-9ffd-e5f1d76bc8d1	1386	Stari trg pri Ložu
00050000-555d-a942-190c-4a3178aab6a3	2205	Starše
00050000-555d-a942-b4e6-b4f251040076	2289	Stoperce
00050000-555d-a942-92fb-b7b8f61d1769	8322	Stopiče
00050000-555d-a942-a490-8bd978dbdcc1	3206	Stranice
00050000-555d-a942-6c47-69fa12232d4c	8351	Straža
00050000-555d-a942-a5f0-72333f93e800	1313	Struge
00050000-555d-a942-5a78-5fba41930dcc	8293	Studenec
00050000-555d-a942-c0da-b250a5164df9	8331	Suhor
00050000-555d-a942-9ba7-4b27d98ff279	2233	Sv. Ana v Slovenskih goricah
00050000-555d-a942-ee62-1824f617a1a6	2235	Sv. Trojica v Slovenskih goricah
00050000-555d-a942-4bce-63c12cbd5b21	2353	Sveti Duh na Ostrem Vrhu
00050000-555d-a942-c777-d5df140e5635	9244	Sveti Jurij ob Ščavnici
00050000-555d-a942-11fc-b5a01d049096	3264	Sveti Štefan
00050000-555d-a942-f1db-7f91e4f3dc36	2258	Sveti Tomaž
00050000-555d-a942-7315-216c2813b1f1	9204	Šalovci
00050000-555d-a942-888a-46cdfa7f6397	5261	Šempas
00050000-555d-a942-5eeb-b451988001aa	5290	Šempeter pri Gorici
00050000-555d-a942-fb6c-7324d7eb605e	3311	Šempeter v Savinjski dolini
00050000-555d-a942-326d-82d9d6dd1abe	4208	Šenčur
00050000-555d-a942-d762-7723941bd9f9	2212	Šentilj v Slovenskih goricah
00050000-555d-a942-7951-e6c77feaf66b	8297	Šentjanž
00050000-555d-a942-2a20-236ff41ceb22	2373	Šentjanž pri Dravogradu
00050000-555d-a942-a973-122eb258d704	8310	Šentjernej
00050000-555d-a942-48bd-ffaeff1291f3	3230	Šentjur
00050000-555d-a942-627c-cdd4d27d13a9	3271	Šentrupert
00050000-555d-a942-edf8-134aa0f794e6	8232	Šentrupert
00050000-555d-a942-242e-b74b6d0f9b73	1296	Šentvid pri Stični
00050000-555d-a942-78a6-2645eb221996	8275	Škocjan
00050000-555d-a942-6b6c-6fa8ff957446	6281	Škofije
00050000-555d-a942-c3b4-99746dd7fcb0	4220	Škofja Loka
00050000-555d-a942-70f0-0236d293cdfd	3211	Škofja vas
00050000-555d-a942-1de0-462aaa5acd34	1291	Škofljica
00050000-555d-a942-8f99-eb9374c3bd87	6274	Šmarje
00050000-555d-a942-6171-5c2e37b99881	1293	Šmarje - Sap
00050000-555d-a942-3ab9-f522136f204d	3240	Šmarje pri Jelšah
00050000-555d-a942-5201-2fb338799452	8220	Šmarješke Toplice
00050000-555d-a942-c1e8-ae8fe0b4eb68	2315	Šmartno na Pohorju
00050000-555d-a942-f43b-fe76e2f6b579	3341	Šmartno ob Dreti
00050000-555d-a942-4f6b-25f281c4d3c2	3327	Šmartno ob Paki
00050000-555d-a942-93a2-770f7f788ede	1275	Šmartno pri Litiji
00050000-555d-a942-a877-b53f882d35a8	2383	Šmartno pri Slovenj Gradcu
00050000-555d-a942-1e11-8877d025b32c	3201	Šmartno v Rožni dolini
00050000-555d-a942-e2da-1a7285715023	3325	Šoštanj
00050000-555d-a942-895d-a67d5dab8281	6222	Štanjel
00050000-555d-a942-726d-88d27463e0a1	3220	Štore
00050000-555d-a942-aac5-f0dec6469323	3304	Tabor
00050000-555d-a942-4517-b6335e26b611	3221	Teharje
00050000-555d-a942-6122-84cad389bd7a	9251	Tišina
00050000-555d-a942-2a5f-079accfc84a4	5220	Tolmin
00050000-555d-a942-e164-bd19ac4eadf8	3326	Topolšica
00050000-555d-a942-cd6f-ab5b8f6a6c5a	2371	Trbonje
00050000-555d-a942-29bc-76cf72e26726	1420	Trbovlje
00050000-555d-a942-408a-ca6d1c9c511b	8231	Trebelno 
00050000-555d-a942-4d6e-a7a339dd697e	8210	Trebnje
00050000-555d-a942-f803-66fb795cc83e	5252	Trnovo pri Gorici
00050000-555d-a942-3cf3-38c23751e0ce	2254	Trnovska vas
00050000-555d-a942-3e2f-fc224676bd48	1222	Trojane
00050000-555d-a942-14ac-264ed9262891	1236	Trzin
00050000-555d-a942-8c64-05028fbfb35b	4290	Tržič
00050000-555d-a942-2adc-23e7b6b418f5	8295	Tržišče
00050000-555d-a942-b4ae-671305c915da	1311	Turjak
00050000-555d-a942-2bf3-38d3083a82fc	9224	Turnišče
00050000-555d-a942-7c21-e172e448abc5	8323	Uršna sela
00050000-555d-a942-b42c-e83f6c99c2e0	1252	Vače
00050000-555d-a942-08ad-b9f9e6d52bf7	3320	Velenje 
00050000-555d-a942-3dc9-a558b8b3bdc7	3322	Velenje - poštni predali
00050000-555d-a942-37c2-031b47e8a30b	8212	Velika Loka
00050000-555d-a942-95b6-4d66a5022f41	2274	Velika Nedelja
00050000-555d-a942-dc80-5616cd3f25b3	9225	Velika Polana
00050000-555d-a942-fe3d-13ef7966746e	1315	Velike Lašče
00050000-555d-a942-59fc-f34dd0e81b83	8213	Veliki Gaber
00050000-555d-a942-ee4c-1dfadf3f7c6a	9241	Veržej
00050000-555d-a942-c003-0269eaf8b95d	1312	Videm - Dobrepolje
00050000-555d-a942-b9b8-b3422211178f	2284	Videm pri Ptuju
00050000-555d-a942-f1c3-4ea4622da1df	8344	Vinica
00050000-555d-a942-cc03-a775b2413f0c	5271	Vipava
00050000-555d-a942-5ef8-8a3ee4076c82	4212	Visoko
00050000-555d-a942-4e43-9a62cd076f3d	1294	Višnja Gora
00050000-555d-a942-851a-4f1b198b9108	3205	Vitanje
00050000-555d-a942-7ecd-6c37add44864	2255	Vitomarci
00050000-555d-a942-ce56-a520e14783a4	1217	Vodice
00050000-555d-a942-e811-8db7996de579	3212	Vojnik\t
00050000-555d-a942-75a7-9d426cf379a9	5293	Volčja Draga
00050000-555d-a942-29cd-febe7e461ebb	2232	Voličina
00050000-555d-a942-3d56-f9aa87bc2ee3	3305	Vransko
00050000-555d-a942-edf5-619708d6e9e8	6217	Vremski Britof
00050000-555d-a942-aa0d-885a97231532	1360	Vrhnika
00050000-555d-a942-34f1-161dfb560faf	2365	Vuhred
00050000-555d-a942-6faf-ed5828a747eb	2367	Vuzenica
00050000-555d-a942-4aa2-2abe2ba7b024	8292	Zabukovje 
00050000-555d-a942-7498-d9ab4f0b5215	1410	Zagorje ob Savi
00050000-555d-a942-2f90-f28aab60aac7	1303	Zagradec
00050000-555d-a942-d48d-e9d94c0e2218	2283	Zavrč
00050000-555d-a942-9aa3-570e2599f101	8272	Zdole 
00050000-555d-a942-b6a4-53b2044f2f4c	4201	Zgornja Besnica
00050000-555d-a942-3cbb-21f700a5a006	2242	Zgornja Korena
00050000-555d-a942-f52e-e323e9b6a544	2201	Zgornja Kungota
00050000-555d-a942-eb69-339e8850e1cc	2316	Zgornja Ložnica
00050000-555d-a942-f0a0-b48d9c416142	2314	Zgornja Polskava
00050000-555d-a942-972b-fdf8b7c39155	2213	Zgornja Velka
00050000-555d-a942-936e-10795a0f5304	4247	Zgornje Gorje
00050000-555d-a942-6425-c1475eafe15f	4206	Zgornje Jezersko
00050000-555d-a942-9a3d-a25c473dcd3c	2285	Zgornji Leskovec
00050000-555d-a942-ff4e-bd85dae2bec0	1432	Zidani Most
00050000-555d-a942-6181-1c4c932da1cc	3214	Zreče
00050000-555d-a942-0231-1d2b47611e66	4209	Žabnica
00050000-555d-a942-e54e-847dd83213db	3310	Žalec
00050000-555d-a942-76a2-a415f29c8d72	4228	Železniki
00050000-555d-a942-e0d7-b44b0cb4b558	2287	Žetale
00050000-555d-a942-2ca7-84e18b132d82	4226	Žiri
00050000-555d-a942-64e4-2156441806f0	4274	Žirovnica
00050000-555d-a942-3251-5bf58398468d	8360	Žužemberk
\.


--
-- TOC entry 2655 (class 0 OID 4369755)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 4369583)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4369648)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4369767)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4369872)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4369917)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4369796)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4369740)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4369730)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4369907)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4369862)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 4369451)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555d-a942-6a0f-3aa9c34d5d84	00010000-555d-a942-836a-4c3a831abe3d	2015-05-21 11:45:39	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO8WRVMQOqLxHoG0th99EZtcmdvVdQFTu";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2662 (class 0 OID 4369805)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4369489)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555d-a942-be9d-79ad21b3a8bc	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555d-a942-dd04-c0b941674371	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555d-a942-f089-e034257b8af0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555d-a942-f666-12b4d0b5cc9f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555d-a942-13db-5b1d8cd8ab97	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555d-a942-0a9e-475e59c5411b	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2628 (class 0 OID 4369473)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555d-a942-6a0f-3aa9c34d5d84	00020000-555d-a942-f666-12b4d0b5cc9f
00010000-555d-a942-836a-4c3a831abe3d	00020000-555d-a942-f666-12b4d0b5cc9f
\.


--
-- TOC entry 2664 (class 0 OID 4369819)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4369761)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4369711)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 4369548)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4369717)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4369895)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4369617)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 4369460)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555d-a942-836a-4c3a831abe3d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO5vjf0aNRJN.jdqxONWbRmzbDpWCSjNa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555d-a942-6a0f-3aa9c34d5d84	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2676 (class 0 OID 4369949)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4369663)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4369788)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4369854)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4369695)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4369939)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 4369844)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4369514)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4369989)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4369982)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4369894)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4369685)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4369710)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4369643)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4369840)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4369661)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4369704)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2245 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 4369753)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4369780)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4369615)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4369523)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4369580)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4369546)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4369503)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4369488)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4369786)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4369818)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4369934)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4369573)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4369603)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4369759)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 4369593)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4369652)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4369771)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4369878)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4369922)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4369803)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4369744)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4369735)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4369916)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4369869)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4369459)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4369809)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4369477)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4369497)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4369827)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4369766)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4369716)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4369553)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4369726)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4369906)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4369628)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4369472)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4369964)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4369670)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4369794)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4369860)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4369699)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4369948)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4369853)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4369692)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4369575)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2247 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2248 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2249 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2373 (class 1259 OID 4369787)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4369773)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4369772)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4369671)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4369843)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4369841)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4369842)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4369936)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4369937)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4369938)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4369967)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4369966)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2429 (class 1259 OID 4369965)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4369630)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4369629)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4369582)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4369581)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4369810)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4369705)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4369504)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4369505)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4369830)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4369829)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4369828)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4369653)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4369655)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4369654)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4369739)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4369737)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4369736)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4369738)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4369478)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4369479)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4369795)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4369760)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4369870)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4369871)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4369595)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4369594)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4369596)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4369879)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4369880)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2438 (class 1259 OID 4369992)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 4369991)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2440 (class 1259 OID 4369994)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2441 (class 1259 OID 4369990)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2442 (class 1259 OID 4369993)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4369861)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4369748)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4369747)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4369745)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4369746)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2434 (class 1259 OID 4369984)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 4369983)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4369662)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4369525)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4369524)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4369554)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4369555)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4369729)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4369728)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4369727)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4369694)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4369690)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4369687)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4369688)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4369686)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4369691)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4369689)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4369574)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4369644)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4369646)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4369645)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4369647)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4369754)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4369935)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4369547)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4369616)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4369804)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4369604)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4369923)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4369498)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4369693)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2467 (class 2606 OID 4370125)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 4370110)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2469 (class 2606 OID 4370115)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2465 (class 2606 OID 4370135)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2471 (class 2606 OID 4370105)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2466 (class 2606 OID 4370130)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2468 (class 2606 OID 4370120)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2452 (class 2606 OID 4370040)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2488 (class 2606 OID 4370220)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2486 (class 2606 OID 4370215)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2487 (class 2606 OID 4370210)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2464 (class 2606 OID 4370100)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2494 (class 2606 OID 4370260)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2496 (class 2606 OID 4370250)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4370255)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2484 (class 2606 OID 4370200)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2505 (class 2606 OID 4370295)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2504 (class 2606 OID 4370300)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2503 (class 2606 OID 4370305)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2506 (class 2606 OID 4370320)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2507 (class 2606 OID 4370315)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2508 (class 2606 OID 4370310)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2458 (class 2606 OID 4370075)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 4370070)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4370050)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4370045)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2449 (class 2606 OID 4370025)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2490 (class 2606 OID 4370230)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2472 (class 2606 OID 4370140)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2446 (class 2606 OID 4370005)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2445 (class 2606 OID 4370010)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2491 (class 2606 OID 4370245)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2492 (class 2606 OID 4370240)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2493 (class 2606 OID 4370235)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2462 (class 2606 OID 4370080)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4370090)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2461 (class 2606 OID 4370085)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2476 (class 2606 OID 4370175)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2478 (class 2606 OID 4370165)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2479 (class 2606 OID 4370160)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2477 (class 2606 OID 4370170)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2444 (class 2606 OID 4369995)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 4370000)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2489 (class 2606 OID 4370225)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2485 (class 2606 OID 4370205)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2499 (class 2606 OID 4370270)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2498 (class 2606 OID 4370275)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 4370060)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 4370055)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 4370065)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2501 (class 2606 OID 4370280)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 4370285)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2513 (class 2606 OID 4370345)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4370340)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2511 (class 2606 OID 4370355)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 4370335)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2512 (class 2606 OID 4370350)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2497 (class 2606 OID 4370265)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 4370195)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2481 (class 2606 OID 4370190)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2483 (class 2606 OID 4370180)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2482 (class 2606 OID 4370185)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2509 (class 2606 OID 4370330)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 4370325)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2463 (class 2606 OID 4370095)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4370290)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2447 (class 2606 OID 4370020)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 4370015)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2451 (class 2606 OID 4370030)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2450 (class 2606 OID 4370035)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2473 (class 2606 OID 4370155)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2474 (class 2606 OID 4370150)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2475 (class 2606 OID 4370145)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-21 11:45:39 CEST

--
-- PostgreSQL database dump complete
--

