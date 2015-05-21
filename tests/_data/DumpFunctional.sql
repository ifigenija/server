--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-21 16:07:02 CEST

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
-- TOC entry 179 (class 1259 OID 4544381)
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
-- TOC entry 225 (class 1259 OID 4544860)
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
-- TOC entry 224 (class 1259 OID 4544843)
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
-- TOC entry 217 (class 1259 OID 4544756)
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
-- TOC entry 193 (class 1259 OID 4544547)
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
-- TOC entry 196 (class 1259 OID 4544581)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4544506)
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
-- TOC entry 212 (class 1259 OID 4544706)
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
-- TOC entry 191 (class 1259 OID 4544531)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4544575)
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
-- TOC entry 201 (class 1259 OID 4544624)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4544649)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4544480)
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
-- TOC entry 180 (class 1259 OID 4544390)
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
-- TOC entry 181 (class 1259 OID 4544401)
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
-- TOC entry 184 (class 1259 OID 4544451)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4544355)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4544374)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4544656)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4544686)
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
-- TOC entry 221 (class 1259 OID 4544799)
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
-- TOC entry 183 (class 1259 OID 4544431)
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
-- TOC entry 186 (class 1259 OID 4544472)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4544630)
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
-- TOC entry 185 (class 1259 OID 4544458)
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
-- TOC entry 190 (class 1259 OID 4544523)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4544642)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4544747)
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
-- TOC entry 220 (class 1259 OID 4544792)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4544671)
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
-- TOC entry 200 (class 1259 OID 4544615)
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
-- TOC entry 199 (class 1259 OID 4544605)
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
-- TOC entry 219 (class 1259 OID 4544782)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4544737)
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
-- TOC entry 173 (class 1259 OID 4544326)
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
-- TOC entry 172 (class 1259 OID 4544324)
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
-- TOC entry 209 (class 1259 OID 4544680)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4544364)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4544348)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4544694)
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
-- TOC entry 203 (class 1259 OID 4544636)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4544586)
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
-- TOC entry 182 (class 1259 OID 4544423)
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
-- TOC entry 198 (class 1259 OID 4544592)
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
-- TOC entry 218 (class 1259 OID 4544770)
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
-- TOC entry 188 (class 1259 OID 4544492)
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
-- TOC entry 174 (class 1259 OID 4544335)
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
-- TOC entry 223 (class 1259 OID 4544824)
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
-- TOC entry 192 (class 1259 OID 4544538)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4544663)
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
-- TOC entry 214 (class 1259 OID 4544729)
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
-- TOC entry 194 (class 1259 OID 4544570)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4544814)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4544719)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4544329)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2632 (class 0 OID 4544381)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4544860)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4544843)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4544756)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4544547)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4544581)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4544506)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555d-e685-9c6c-754b6d7ca639	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555d-e685-af74-32774050c290	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555d-e685-a3e4-68f091972bd7	AL	ALB	008	Albania 	Albanija	\N
00040000-555d-e685-c4f4-5a161f865f77	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555d-e685-d1be-cb6af5bbc087	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555d-e685-63a7-1bc843aeb247	AD	AND	020	Andorra 	Andora	\N
00040000-555d-e685-8fa5-b4b59924ac93	AO	AGO	024	Angola 	Angola	\N
00040000-555d-e685-9668-c4531e2d799a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555d-e685-9d80-17d97367cbe3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555d-e685-c1e8-519a9cb060f9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-e685-3f7c-9adcee94ec83	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555d-e685-1802-db2d56c504f1	AM	ARM	051	Armenia 	Armenija	\N
00040000-555d-e685-c7c9-20429fd68ba1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555d-e685-7a2a-70dc72a36b9f	AU	AUS	036	Australia 	Avstralija	\N
00040000-555d-e685-7733-e8975bff418c	AT	AUT	040	Austria 	Avstrija	\N
00040000-555d-e685-209c-9dc5aacddf5d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555d-e685-877f-182eebfbbb26	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555d-e685-4998-9c3fcad1e271	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555d-e685-01fe-74703f1b9c8a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555d-e685-a23a-e2face1e4d86	BB	BRB	052	Barbados 	Barbados	\N
00040000-555d-e685-61f5-60c591a92fc5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555d-e685-176d-f7dcb2e40ce6	BE	BEL	056	Belgium 	Belgija	\N
00040000-555d-e685-dddb-4858d855bc2d	BZ	BLZ	084	Belize 	Belize	\N
00040000-555d-e685-d6d7-99356a4ae4ac	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555d-e685-8f63-3119a8d7fb89	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555d-e685-5646-94bf13bb07d1	BT	BTN	064	Bhutan 	Butan	\N
00040000-555d-e685-81ad-f60acf190d60	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555d-e685-bcdb-70aaab95f6b3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555d-e685-7767-83fe86ce3161	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555d-e685-50c5-d15c9bb4553c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555d-e685-464a-1590b8f69202	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555d-e685-89a2-bf8112b6c6cd	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555d-e685-7e39-7a5f0319ffc6	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555d-e685-cc20-cc291ffc83fb	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555d-e685-1b55-6fc35759729a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555d-e685-9765-96828b41518f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555d-e685-8d81-9ab30eb8194b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555d-e685-14b8-44b944bfda29	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555d-e685-b1f2-8c0f06404da6	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555d-e685-23a9-a6b3c3758410	CA	CAN	124	Canada 	Kanada	\N
00040000-555d-e685-e6d4-10423115ec26	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555d-e685-89f3-aec0f4fc392a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555d-e685-c9c1-5dc7c58dfaf9	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555d-e685-8f50-bafd05dc81d3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555d-e685-1729-df8f0c565400	CL	CHL	152	Chile 	Čile	\N
00040000-555d-e685-e71d-5c99d8c42516	CN	CHN	156	China 	Kitajska	\N
00040000-555d-e685-08ab-3916cc66e212	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555d-e685-618e-f748d2cea4f3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555d-e685-da24-308fd1735063	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555d-e685-35e5-e6d4b05ac289	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555d-e685-ee7d-fedfa86a5695	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555d-e685-4aea-afc25d137d94	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555d-e685-f9a1-8ec3149b7bff	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555d-e685-9008-9dfd320d3a3f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555d-e685-2791-af1c7688b1d5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555d-e685-6d7a-11ec19da8a83	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555d-e685-9e2f-1eeef06c4150	CU	CUB	192	Cuba 	Kuba	\N
00040000-555d-e685-a716-268b0861e166	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555d-e685-55c5-ea1421674bf8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555d-e685-8136-429d1feebb37	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555d-e685-5d8e-14c27941c89e	DK	DNK	208	Denmark 	Danska	\N
00040000-555d-e685-44fa-9bdcfea26ebe	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555d-e685-ccf9-b967a1e94a82	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-e685-f6cd-389850a00224	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555d-e685-dbd6-720c36f8aecc	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555d-e685-3021-d5a7a31a7493	EG	EGY	818	Egypt 	Egipt	\N
00040000-555d-e685-c34e-4677d26d007c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555d-e685-cc3c-34b63b321695	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555d-e685-3766-05f3e652737d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555d-e685-edff-64db4b857b56	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555d-e685-4360-a164fb8a37a6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555d-e685-f080-ce99e5d1693b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555d-e685-280b-b6c6ffcc6c4e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555d-e685-a4b7-c748e06c1274	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555d-e685-325b-8382fc5b7980	FI	FIN	246	Finland 	Finska	\N
00040000-555d-e685-6a24-037d45e98cc5	FR	FRA	250	France 	Francija	\N
00040000-555d-e685-2f5a-cd78d2782f36	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555d-e685-f675-dddcfeec23f7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555d-e685-bb48-6af2646965d1	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555d-e685-d67e-965715e9e1d9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555d-e685-b643-96913a3f70ab	GA	GAB	266	Gabon 	Gabon	\N
00040000-555d-e685-e35f-0119112af94a	GM	GMB	270	Gambia 	Gambija	\N
00040000-555d-e685-dcd4-9c1456af8843	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555d-e685-3317-f386bf49d967	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555d-e685-1939-58f4d000ff71	GH	GHA	288	Ghana 	Gana	\N
00040000-555d-e685-7ab6-74ba1eb2fb0c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555d-e685-d211-69c905ace1d3	GR	GRC	300	Greece 	Grčija	\N
00040000-555d-e685-b361-515d7958bca5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555d-e685-3ab7-7535dd2b0763	GD	GRD	308	Grenada 	Grenada	\N
00040000-555d-e685-2982-277dac5e7cce	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555d-e685-a216-946e2258d978	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555d-e685-a67c-a34f81489101	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555d-e685-6b87-e121d4ae7008	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555d-e685-80b6-e72fc6829720	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555d-e685-4921-a8f5d121e494	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555d-e685-270e-38a2117e72ee	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555d-e685-a890-2627065205c3	HT	HTI	332	Haiti 	Haiti	\N
00040000-555d-e685-c539-936fa0190c0c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555d-e685-16cb-5cbc05d68ecb	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555d-e685-45cc-d97cbdd08d74	HN	HND	340	Honduras 	Honduras	\N
00040000-555d-e685-3b61-aee9c1ebc458	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555d-e685-8668-0a8d3bdbcbf1	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555d-e685-94e3-4344d9653606	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555d-e685-3f6d-a9d439ebdc47	IN	IND	356	India 	Indija	\N
00040000-555d-e685-10bf-a7229210923e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555d-e685-8cfd-af70eb0007b2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555d-e685-b466-98c070882f9f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555d-e685-0dc9-c48a3164b167	IE	IRL	372	Ireland 	Irska	\N
00040000-555d-e685-e518-4a9e63b05f18	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555d-e685-a26f-3ad6d07c7232	IL	ISR	376	Israel 	Izrael	\N
00040000-555d-e685-52f2-7ea058f7a1ef	IT	ITA	380	Italy 	Italija	\N
00040000-555d-e685-345e-09f3d613f2ec	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555d-e685-1325-4fadecefd3c1	JP	JPN	392	Japan 	Japonska	\N
00040000-555d-e685-d37d-fce7fd96794a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555d-e685-c7bf-b08df1d214c4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555d-e685-9424-e4a8ed2ce8d1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555d-e685-e8d0-3b9c69424ef3	KE	KEN	404	Kenya 	Kenija	\N
00040000-555d-e685-9d6b-d0a1f9eeaff1	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555d-e685-e226-cd6d1d28f36c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555d-e685-2444-4cabdbb2339c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555d-e685-2ab4-c5415cef90ff	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555d-e685-d7f4-8f7498b4852b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555d-e685-ad6e-111c8161eaba	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555d-e685-b8e1-bb72c0b3c9ae	LV	LVA	428	Latvia 	Latvija	\N
00040000-555d-e685-257e-5c445feacaad	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555d-e685-0561-d133b1ccf873	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555d-e685-5916-b495b7fc3ddf	LR	LBR	430	Liberia 	Liberija	\N
00040000-555d-e685-e061-126a6b1fbcb8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555d-e685-ef57-8dec45a89bb3	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555d-e685-fa7e-162ba8bbad57	LT	LTU	440	Lithuania 	Litva	\N
00040000-555d-e685-2c57-e4abc5585fff	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555d-e685-7b0e-c76bbf129fab	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555d-e685-53d3-5ae2487c0092	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555d-e685-620c-c2c720a1da5f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555d-e685-d184-7f5c5aacbd0f	MW	MWI	454	Malawi 	Malavi	\N
00040000-555d-e685-94df-24258fc3d246	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555d-e685-2f08-c129316aad4e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555d-e685-9713-d89ab4aec0f5	ML	MLI	466	Mali 	Mali	\N
00040000-555d-e685-e4a4-731f3bd23ad2	MT	MLT	470	Malta 	Malta	\N
00040000-555d-e685-39e0-c2b93ae10345	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555d-e685-188d-81e9fdb04940	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555d-e685-d8c8-9f12b3189ce3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555d-e685-7873-b3abf676d2c9	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555d-e685-8c3f-615610c809cf	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555d-e685-9c26-7f87abf47c63	MX	MEX	484	Mexico 	Mehika	\N
00040000-555d-e685-eed3-b968c44f0107	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555d-e685-cf41-f6857b68b1f9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555d-e685-3a1a-a38192ea370a	MC	MCO	492	Monaco 	Monako	\N
00040000-555d-e685-8ab5-dbe4be9c6a4e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555d-e685-1d01-0718f86a6c9e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555d-e685-ed9b-f59ffe9e476d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555d-e685-5668-8ac9282340c6	MA	MAR	504	Morocco 	Maroko	\N
00040000-555d-e685-456f-deb6ad3502f0	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555d-e685-0f0f-5044244249e4	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555d-e685-4912-a6669a94a417	NA	NAM	516	Namibia 	Namibija	\N
00040000-555d-e685-ec55-c79cc589f58c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555d-e685-fefd-64536f90ee6d	NP	NPL	524	Nepal 	Nepal	\N
00040000-555d-e685-652b-f214a06473fc	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555d-e685-244f-13645b7142db	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555d-e685-7c79-d35e912ec1ee	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555d-e685-306e-80daaf81cbff	NE	NER	562	Niger 	Niger 	\N
00040000-555d-e685-13b4-d991b687f1d2	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555d-e685-62d1-fb47fecce880	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555d-e685-7adf-14f12a4e70a3	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555d-e685-2e76-9bd85001d8f1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555d-e685-dc8f-a272b2046c1f	NO	NOR	578	Norway 	Norveška	\N
00040000-555d-e685-6e9f-05365619b5f5	OM	OMN	512	Oman 	Oman	\N
00040000-555d-e685-5ff8-96b9185a60c5	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555d-e685-4d80-0ddaa91c946c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555d-e685-330e-0a5f02761659	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555d-e685-51d9-80b0d8e9cccb	PA	PAN	591	Panama 	Panama	\N
00040000-555d-e685-3662-50d994f69f92	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555d-e685-b26b-ec319b4c69ec	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555d-e685-bfb8-43d4186d6e65	PE	PER	604	Peru 	Peru	\N
00040000-555d-e685-7838-1c16e42d143f	PH	PHL	608	Philippines 	Filipini	\N
00040000-555d-e685-35fe-a4a1deb5318c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555d-e685-dc91-79abbed4a9fe	PL	POL	616	Poland 	Poljska	\N
00040000-555d-e685-a308-08b2fb876109	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555d-e685-31c1-cc9ee3d46b2e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555d-e685-31b3-d8997ced1218	QA	QAT	634	Qatar 	Katar	\N
00040000-555d-e685-c859-00398c3424a1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555d-e685-a332-c6d990f9f09b	RO	ROU	642	Romania 	Romunija	\N
00040000-555d-e685-0ec9-6d7fcbe7cdc1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555d-e685-672a-e5b993aa901a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555d-e685-07cf-d08fd277d2b3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555d-e685-a622-e34d1e39ec08	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555d-e685-ff30-37ed11bd2576	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555d-e685-10bd-b7651d1961ea	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555d-e685-c0c9-6c3bd1e365ea	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555d-e685-ba58-f41b1bc8b354	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555d-e685-764c-faa03ba32e05	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555d-e685-7596-819ccb59ec2f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555d-e685-2f09-44afc1545e72	SM	SMR	674	San Marino 	San Marino	\N
00040000-555d-e685-16d5-e52a44e546b0	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555d-e685-16dc-7a476e352dd9	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555d-e685-022c-8a6150951bbb	SN	SEN	686	Senegal 	Senegal	\N
00040000-555d-e685-3de8-4896294eea83	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555d-e685-a8ee-6223985a5f08	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555d-e685-85b0-0129514fb260	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555d-e685-b9fe-ea4d82d31906	SG	SGP	702	Singapore 	Singapur	\N
00040000-555d-e685-d522-e5ae5bd5e84c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555d-e685-eaf3-f537226e64b3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555d-e685-3192-b408886b5e2a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555d-e685-c2f6-64d40a0ede8c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555d-e685-dac1-861fcf0c8e82	SO	SOM	706	Somalia 	Somalija	\N
00040000-555d-e685-f955-ec09be65238b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555d-e685-0a64-3eef710f9691	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555d-e685-488b-d9b4b5bfaf7b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555d-e685-490a-4f6a09c35a73	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555d-e685-38c1-36d76991909e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555d-e685-a23a-bb730fb8d7e1	SD	SDN	729	Sudan 	Sudan	\N
00040000-555d-e685-7da2-403e4623afe3	SR	SUR	740	Suriname 	Surinam	\N
00040000-555d-e685-882d-48c55e9700f0	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555d-e685-d9c2-a7a780619e6a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555d-e685-a27b-39d429d9c7f5	SE	SWE	752	Sweden 	Švedska	\N
00040000-555d-e685-f08c-f942fbbb0070	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555d-e685-f0dc-f7c0589e7625	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555d-e685-a645-4c8f536418ba	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555d-e685-8deb-b9fe5f1a67f3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555d-e685-ec7f-6b9c85f3f009	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555d-e685-2e11-837021e19d67	TH	THA	764	Thailand 	Tajska	\N
00040000-555d-e685-1cdb-c0b187e51e33	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555d-e685-efc9-e6134e6335a5	TG	TGO	768	Togo 	Togo	\N
00040000-555d-e685-1c44-12fc54b25cbf	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555d-e685-7ea8-c5834bf50b5f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555d-e685-bdfc-8da75e688881	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555d-e685-18eb-b283576f347f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555d-e685-ecdb-9de16cea6461	TR	TUR	792	Turkey 	Turčija	\N
00040000-555d-e685-384d-397a6d1a8c74	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555d-e685-73d8-3a2f21d5596c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-e685-00da-b530cb990e44	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555d-e685-e74f-5629dd6cf6d9	UG	UGA	800	Uganda 	Uganda	\N
00040000-555d-e685-1b44-dbfceb2d555d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555d-e685-12a9-182a4391d52d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555d-e685-8eae-1af2d790dd29	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555d-e685-2989-7d644e4048a7	US	USA	840	United States 	Združene države Amerike	\N
00040000-555d-e685-3ab0-b1cf3975852f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555d-e685-7fd9-832de74e86b4	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555d-e685-364e-4e82ed2000d9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555d-e685-4ae6-4c0a01b2299c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555d-e685-437d-f0d82d0697f3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555d-e685-c0bd-05ed9886a58d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555d-e685-2d04-ccd25e73db53	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-e685-8885-67b9a20e1b96	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555d-e685-82ed-21cbcac6f6b8	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555d-e685-2940-aa1068d440f7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555d-e685-1469-0169d7729899	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555d-e685-635c-d057a9054abb	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555d-e685-8fef-d999ee2da8d1	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2665 (class 0 OID 4544706)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4544531)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4544575)
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
-- TOC entry 2654 (class 0 OID 4544624)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4544649)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4544480)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555d-e685-6cff-f64a7654840c	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555d-e685-d562-de81e5737754	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555d-e685-5c06-dfd43a82027e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555d-e685-a39e-2a5e91ff895d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555d-e685-7169-6ddc618b07d9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555d-e685-cafd-2641e08f833a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555d-e685-e2c4-a1c20169635a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555d-e685-e7e7-19db2b51ab1d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555d-e685-2586-690131fc46be	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555d-e685-a805-381e0b6596d5	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555d-e685-9f05-4563a89f3055	uprizoritev.faza	array	a:5:{s:7:"osnutek";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:4:"plan";a:1:{s:5:"label";s:14:"Predprodukcija";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
\.


--
-- TOC entry 2633 (class 0 OID 4544390)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555d-e685-2a30-0aa0a9d22a4b	00000000-555d-e685-7169-6ddc618b07d9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555d-e685-496a-08b414207717	00000000-555d-e685-7169-6ddc618b07d9	00010000-555d-e685-1725-13a85ecda57a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555d-e685-8f40-dcbda4caa226	00000000-555d-e685-cafd-2641e08f833a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2634 (class 0 OID 4544401)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4544451)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4544355)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555d-e685-aa9f-10f8272764af	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555d-e685-6abf-04323963cbaf	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555d-e685-9fe0-57fbbdf46133	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555d-e685-94d2-3107dc4dfbe6	Abonma-read	Abonma - branje	f
00030000-555d-e685-3811-6b8b76fefc2c	Abonma-write	Abonma - spreminjanje	f
00030000-555d-e685-f561-33dcda0fe173	Alternacija-read	Alternacija - branje	f
00030000-555d-e685-8d3e-31613e8c8635	Alternacija-write	Alternacija - spreminjanje	f
00030000-555d-e685-077b-7b545eebee87	Arhivalija-read	Arhivalija - branje	f
00030000-555d-e685-93bb-17b81a20c263	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555d-e685-d2cd-c8be82c39a33	Besedilo-read	Besedilo - branje	f
00030000-555d-e685-5b4d-03a3367313a4	Besedilo-write	Besedilo - spreminjanje	f
00030000-555d-e685-5fc5-c544883b8a1e	DogodekIzven-read	DogodekIzven - branje	f
00030000-555d-e685-4e59-4b3c76d58435	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555d-e685-5f28-b69871e7f899	Dogodek-read	Dogodek - branje	f
00030000-555d-e685-36c0-e0b0883612c1	Dogodek-write	Dogodek - spreminjanje	f
00030000-555d-e685-cbcc-76a3d7f00bea	Drzava-read	Drzava - branje	f
00030000-555d-e685-d986-6d6f9c7a0570	Drzava-write	Drzava - spreminjanje	f
00030000-555d-e685-fb97-8d04e7eb8bea	Funkcija-read	Funkcija - branje	f
00030000-555d-e685-6ee2-8efa6a5df9ec	Funkcija-write	Funkcija - spreminjanje	f
00030000-555d-e685-c769-8146cdbe956d	Gostovanje-read	Gostovanje - branje	f
00030000-555d-e685-d280-a22a788d8717	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555d-e685-8430-6af920b3ed17	Gostujoca-read	Gostujoca - branje	f
00030000-555d-e685-b8d6-1cb40e34cb64	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555d-e685-65c9-a12bc5306ad4	Kupec-read	Kupec - branje	f
00030000-555d-e685-7028-00ee6ac1925d	Kupec-write	Kupec - spreminjanje	f
00030000-555d-e685-e89e-f9ed1d282fc7	NacinPlacina-read	NacinPlacina - branje	f
00030000-555d-e685-446d-165fb406e8cd	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555d-e685-c347-8fa308d75ec3	Option-read	Option - branje	f
00030000-555d-e685-adea-a7c15d4696ab	Option-write	Option - spreminjanje	f
00030000-555d-e685-e58b-531351bb92b1	OptionValue-read	OptionValue - branje	f
00030000-555d-e685-2c0e-8d8ef1a4ede2	OptionValue-write	OptionValue - spreminjanje	f
00030000-555d-e685-de3b-88dc9fb2c32f	Oseba-read	Oseba - branje	f
00030000-555d-e685-7dff-31841cf1f6f0	Oseba-write	Oseba - spreminjanje	f
00030000-555d-e685-dfd8-8eb6212a0a96	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555d-e685-cd58-eb064b4fae62	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555d-e685-5118-d3502d47aac8	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555d-e685-3926-489bab7709b0	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555d-e685-ef19-6c0c38a8a01d	Pogodba-read	Pogodba - branje	f
00030000-555d-e685-3fe9-8ef71284c069	Pogodba-write	Pogodba - spreminjanje	f
00030000-555d-e685-306f-e11944d8c9e3	Popa-read	Popa - branje	f
00030000-555d-e685-b4a9-1412c3bed3b6	Popa-write	Popa - spreminjanje	f
00030000-555d-e685-06af-c2a653728282	Posta-read	Posta - branje	f
00030000-555d-e685-aae6-4aeb58d80962	Posta-write	Posta - spreminjanje	f
00030000-555d-e685-2e76-61a0a280357d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555d-e685-07c4-335c861dea53	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555d-e685-69ae-67c9bccc96ad	PostniNaslov-read	PostniNaslov - branje	f
00030000-555d-e685-8b5e-09e7adea6746	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555d-e685-c71f-aff5faddf45c	Predstava-read	Predstava - branje	f
00030000-555d-e685-8511-75fdf420b182	Predstava-write	Predstava - spreminjanje	f
00030000-555d-e685-c4bf-4970d5ccbdce	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555d-e685-c0e2-544dd07cb4ee	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555d-e685-4397-02930108e967	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555d-e685-73db-4bf22a022611	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555d-e685-de2c-19bbf1e07761	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555d-e685-d754-9896dcf1a71e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555d-e685-6484-2986697ca234	Prostor-read	Prostor - branje	f
00030000-555d-e685-dd5e-f23ad60fc5be	Prostor-write	Prostor - spreminjanje	f
00030000-555d-e685-6a57-e7d47ecda81c	Racun-read	Racun - branje	f
00030000-555d-e685-2cb5-1403b59252e4	Racun-write	Racun - spreminjanje	f
00030000-555d-e685-4cc5-d6259053dd84	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555d-e685-12a7-8e3e12f4c359	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555d-e685-9048-c898d1ff099a	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555d-e685-bb0a-a3affa27186a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555d-e685-ba6b-2fe325d83fd4	Rekvizit-read	Rekvizit - branje	f
00030000-555d-e685-af24-cc6ef031b35a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555d-e685-cf50-cbfb0e5af8cf	Rezervacija-read	Rezervacija - branje	f
00030000-555d-e685-7c7e-c921188812e6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555d-e685-1a96-6b67a40ffe81	SedezniRed-read	SedezniRed - branje	f
00030000-555d-e685-81b3-39d68413f567	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555d-e685-d694-254771a34cef	Sedez-read	Sedez - branje	f
00030000-555d-e685-3da2-54975153ee0b	Sedez-write	Sedez - spreminjanje	f
00030000-555d-e685-bbe1-86b854758686	Sezona-read	Sezona - branje	f
00030000-555d-e685-2d23-39c3bc37551c	Sezona-write	Sezona - spreminjanje	f
00030000-555d-e685-1a93-faed6e84e55d	Telefonska-read	Telefonska - branje	f
00030000-555d-e685-a42b-6e2fcae630b7	Telefonska-write	Telefonska - spreminjanje	f
00030000-555d-e685-0722-ee5d1a5d5bf0	TerminStoritve-read	TerminStoritve - branje	f
00030000-555d-e685-0c66-8b358262b549	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555d-e685-8bd3-1272df3b687f	TipFunkcije-read	TipFunkcije - branje	f
00030000-555d-e685-a807-c947c82feb9d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555d-e685-60f5-10e8b6a3431d	Trr-read	Trr - branje	f
00030000-555d-e685-cdb3-d54863786f8c	Trr-write	Trr - spreminjanje	f
00030000-555d-e685-3b6b-a8d1fb264e7a	Uprizoritev-read	Uprizoritev - branje	f
00030000-555d-e685-6f3d-2f11c996ed42	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555d-e685-97ea-96c8ee3ce271	Vaja-read	Vaja - branje	f
00030000-555d-e685-26c1-9c96f3a7c335	Vaja-write	Vaja - spreminjanje	f
00030000-555d-e685-18b9-b8d7902c6618	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555d-e685-1455-f0d7719566a1	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555d-e685-a8bf-ee8295d2e495	Zaposlitev-read	Zaposlitev - branje	f
00030000-555d-e685-3493-a5cb2215e887	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555d-e685-5368-7eb523d4940b	Zasedenost-read	Zasedenost - branje	f
00030000-555d-e685-4d30-8b989c5b693c	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555d-e685-c48f-5d9e999e9ee8	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555d-e685-319c-89ba09a7b643	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555d-e685-8840-c265adaa987b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555d-e685-763d-91d44a3840e6	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2631 (class 0 OID 4544374)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555d-e685-4c4f-0342fdf3f94c	00030000-555d-e685-cbcc-76a3d7f00bea
00020000-555d-e685-bb68-b53def6d050b	00030000-555d-e685-d986-6d6f9c7a0570
00020000-555d-e685-bb68-b53def6d050b	00030000-555d-e685-cbcc-76a3d7f00bea
\.


--
-- TOC entry 2659 (class 0 OID 4544656)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4544686)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4544799)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 4544431)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4544472)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555d-e685-42f1-2dab17344f2f	8341	Adlešiči
00050000-555d-e685-0db0-1c5041eb1a30	5270	Ajdovščina
00050000-555d-e685-a01f-9c450929fb70	6280	Ankaran/Ancarano
00050000-555d-e685-9d07-62ecf484c602	9253	Apače
00050000-555d-e685-2271-00324743cc66	8253	Artiče
00050000-555d-e685-e734-3f451ec5c32c	4275	Begunje na Gorenjskem
00050000-555d-e685-fbf9-214abc11de51	1382	Begunje pri Cerknici
00050000-555d-e685-0ab1-a1fe40ecaf02	9231	Beltinci
00050000-555d-e685-2ce9-759485098f39	2234	Benedikt
00050000-555d-e685-45e4-4f60e7f07065	2345	Bistrica ob Dravi
00050000-555d-e685-4d86-8bd4ec9fad5c	3256	Bistrica ob Sotli
00050000-555d-e685-12c0-76d6a042fc4c	8259	Bizeljsko
00050000-555d-e685-845f-79a043179095	1223	Blagovica
00050000-555d-e685-1f0a-65dcd56503b2	8283	Blanca
00050000-555d-e685-b15e-0f87df8f8236	4260	Bled
00050000-555d-e685-9f76-fbd2f9a4c51a	4273	Blejska Dobrava
00050000-555d-e685-7bd3-514fadb591e5	9265	Bodonci
00050000-555d-e685-9e3d-ba22fe9f7c51	9222	Bogojina
00050000-555d-e685-2595-5a31f3c554d4	4263	Bohinjska Bela
00050000-555d-e685-7be4-18b3d493d12a	4264	Bohinjska Bistrica
00050000-555d-e685-741f-04bf2a8f73b6	4265	Bohinjsko jezero
00050000-555d-e685-01ee-856820fc0025	1353	Borovnica
00050000-555d-e685-65c4-2c4930f2d91a	8294	Boštanj
00050000-555d-e685-919f-d6fc09f24b70	5230	Bovec
00050000-555d-e685-e194-600e4dc8b2c2	5295	Branik
00050000-555d-e685-a372-baa14cab2b8e	3314	Braslovče
00050000-555d-e685-c890-3b7015c0df91	5223	Breginj
00050000-555d-e685-1c57-7ce0476d81dd	8280	Brestanica
00050000-555d-e685-72f0-8661b2dcd810	2354	Bresternica
00050000-555d-e685-61bd-2fbf1b47bca7	4243	Brezje
00050000-555d-e685-1bbd-6f3affb99c1d	1351	Brezovica pri Ljubljani
00050000-555d-e685-b171-cf2514f47cc0	8250	Brežice
00050000-555d-e685-27a8-615fc2c81460	4210	Brnik - Aerodrom
00050000-555d-e685-07ad-d86b7be300c4	8321	Brusnice
00050000-555d-e685-221b-4496bb76acae	3255	Buče
00050000-555d-e685-ce7f-6c62f5a0f507	8276	Bučka 
00050000-555d-e685-013d-a6f951765753	9261	Cankova
00050000-555d-e685-0448-fb6b9de34e75	3000	Celje 
00050000-555d-e685-7ce9-a69641e83d59	3001	Celje - poštni predali
00050000-555d-e685-3f15-9b01d60f1854	4207	Cerklje na Gorenjskem
00050000-555d-e685-3667-05ccb31d826b	8263	Cerklje ob Krki
00050000-555d-e685-59c0-e44ec9874283	1380	Cerknica
00050000-555d-e685-44c2-432d1c9d3dad	5282	Cerkno
00050000-555d-e685-33d0-7ccee9d379d1	2236	Cerkvenjak
00050000-555d-e685-2bef-84c2f4a1d38b	2215	Ceršak
00050000-555d-e685-00f0-f672de36d4d9	2326	Cirkovce
00050000-555d-e685-a01b-df93e4e27ba1	2282	Cirkulane
00050000-555d-e685-f591-b42c1633f23e	5273	Col
00050000-555d-e685-4995-76d7948baae9	8251	Čatež ob Savi
00050000-555d-e685-8c31-40684cf9b257	1413	Čemšenik
00050000-555d-e685-4606-e0c4ad2e97de	5253	Čepovan
00050000-555d-e685-6d15-2d84a2b3ff19	9232	Črenšovci
00050000-555d-e685-b614-2c49ff82aa59	2393	Črna na Koroškem
00050000-555d-e685-66d1-05bfef5e18e3	6275	Črni Kal
00050000-555d-e685-f165-ad46a9d49d4c	5274	Črni Vrh nad Idrijo
00050000-555d-e685-1dbd-3418e676163e	5262	Črniče
00050000-555d-e685-acf1-d0d7af94f51c	8340	Črnomelj
00050000-555d-e685-8a81-d10dfff5a79e	6271	Dekani
00050000-555d-e685-581d-ed289d9db241	5210	Deskle
00050000-555d-e685-424e-c8a1d2e3740e	2253	Destrnik
00050000-555d-e685-4c6a-cd5eefac100f	6215	Divača
00050000-555d-e685-118d-8cb59614edf2	1233	Dob
00050000-555d-e685-e1ec-b98fa57ef0c9	3224	Dobje pri Planini
00050000-555d-e685-208d-0b58a1301b36	8257	Dobova
00050000-555d-e685-2092-7b375c93a6fe	1423	Dobovec
00050000-555d-e685-6f6f-4cfe7918066f	5263	Dobravlje
00050000-555d-e685-6b6b-eb8511403cd6	3204	Dobrna
00050000-555d-e685-db18-8b604d099bab	8211	Dobrnič
00050000-555d-e685-bd61-315810e9c6fe	1356	Dobrova
00050000-555d-e685-2fb5-cfc39962ad49	9223	Dobrovnik/Dobronak 
00050000-555d-e685-5801-f17e150174e8	5212	Dobrovo v Brdih
00050000-555d-e685-7866-2bd2459f4dc6	1431	Dol pri Hrastniku
00050000-555d-e685-465a-11e9ecb85ec2	1262	Dol pri Ljubljani
00050000-555d-e685-cc52-b43bec3f6c3a	1273	Dole pri Litiji
00050000-555d-e685-9f7f-f6eaad8f0c8b	1331	Dolenja vas
00050000-555d-e685-8da0-cba20fd9e851	8350	Dolenjske Toplice
00050000-555d-e685-8f46-3a1dd6cc659e	1230	Domžale
00050000-555d-e685-95b2-b09f060ef5a2	2252	Dornava
00050000-555d-e685-cd40-9bfa5fa70a51	5294	Dornberk
00050000-555d-e685-6dcd-6b9fdb791a61	1319	Draga
00050000-555d-e685-86d7-c9d23a6c212e	8343	Dragatuš
00050000-555d-e685-e41f-a81dbe035b7b	3222	Dramlje
00050000-555d-e685-8159-33bc4de8a6c3	2370	Dravograd
00050000-555d-e685-5af4-25aaf88256e3	4203	Duplje
00050000-555d-e685-f80d-8054420a4334	6221	Dutovlje
00050000-555d-e685-1808-185aac657591	8361	Dvor
00050000-555d-e685-ccba-81ba8fa23253	2343	Fala
00050000-555d-e685-acdc-a4fbd69f3608	9208	Fokovci
00050000-555d-e685-5112-cfc918c0f10e	2313	Fram
00050000-555d-e685-8157-061e92d6f764	3213	Frankolovo
00050000-555d-e685-bd00-59a454c6cb95	1274	Gabrovka
00050000-555d-e685-0357-d417b4006a24	8254	Globoko
00050000-555d-e685-ab8d-3117ee136825	5275	Godovič
00050000-555d-e685-0874-397b83fb912e	4204	Golnik
00050000-555d-e685-8294-e90d4835fbe5	3303	Gomilsko
00050000-555d-e685-ecd1-fb30e94e1544	4224	Gorenja vas
00050000-555d-e685-5f63-bcec00621af1	3263	Gorica pri Slivnici
00050000-555d-e685-223e-897a98eb65d6	2272	Gorišnica
00050000-555d-e685-7289-cffeca5cf5b1	9250	Gornja Radgona
00050000-555d-e685-d9d7-5269346c7bb7	3342	Gornji Grad
00050000-555d-e685-da05-a3e56d9e8db1	4282	Gozd Martuljek
00050000-555d-e685-2022-6b4d97c881d8	6272	Gračišče
00050000-555d-e685-5c7b-2c8d89d6f24f	9264	Grad
00050000-555d-e685-acfb-42ba61482e4f	8332	Gradac
00050000-555d-e685-579f-e2dd55764486	1384	Grahovo
00050000-555d-e685-b328-286792975af6	5242	Grahovo ob Bači
00050000-555d-e685-91a9-d8bd4bd8930b	5251	Grgar
00050000-555d-e685-3e17-11828d7d567c	3302	Griže
00050000-555d-e685-0058-272d36d5e3b9	3231	Grobelno
00050000-555d-e685-07df-bd1b72918330	1290	Grosuplje
00050000-555d-e685-e616-1f78ad52b253	2288	Hajdina
00050000-555d-e685-17fe-edd3749ea311	8362	Hinje
00050000-555d-e685-9511-c73be95d2d97	2311	Hoče
00050000-555d-e685-b9af-24d2b8448612	9205	Hodoš/Hodos
00050000-555d-e685-f492-1888fe751d19	1354	Horjul
00050000-555d-e685-4d49-3d5669a1a8a3	1372	Hotedršica
00050000-555d-e685-811d-467b9aacb666	1430	Hrastnik
00050000-555d-e685-ba38-3023d02496d8	6225	Hruševje
00050000-555d-e685-8120-4e2c86c6aa3c	4276	Hrušica
00050000-555d-e685-53ee-7a283a3e935e	5280	Idrija
00050000-555d-e685-26b4-546db29f6fb2	1292	Ig
00050000-555d-e685-ed56-580b57ce7635	6250	Ilirska Bistrica
00050000-555d-e685-a26e-5aadee7a6b69	6251	Ilirska Bistrica-Trnovo
00050000-555d-e685-04cf-66d3f6f70905	1295	Ivančna Gorica
00050000-555d-e685-ee8f-848a9b03fa85	2259	Ivanjkovci
00050000-555d-e685-a7a2-c421d5437178	1411	Izlake
00050000-555d-e685-e9bd-aec4582c0727	6310	Izola/Isola
00050000-555d-e685-87c4-84c09f463f95	2222	Jakobski Dol
00050000-555d-e685-0566-640ee8ea1b1d	2221	Jarenina
00050000-555d-e685-81b9-a6c6be88ab6d	6254	Jelšane
00050000-555d-e685-1abf-fb3c5a70abdc	4270	Jesenice
00050000-555d-e685-cd09-d910c2a867ea	8261	Jesenice na Dolenjskem
00050000-555d-e685-87eb-cbb1543fa0a6	3273	Jurklošter
00050000-555d-e685-9d05-a6f4f5e6b396	2223	Jurovski Dol
00050000-555d-e685-d567-0e92ed5b8b67	2256	Juršinci
00050000-555d-e685-78df-a44ed1cc357c	5214	Kal nad Kanalom
00050000-555d-e685-0a0f-80007716d750	3233	Kalobje
00050000-555d-e685-b7af-081518024bb3	4246	Kamna Gorica
00050000-555d-e685-afa0-6e12b44f9c36	2351	Kamnica
00050000-555d-e685-bc66-97eced6d6ee6	1241	Kamnik
00050000-555d-e685-544e-41ecd096b858	5213	Kanal
00050000-555d-e685-636c-106316749e1c	8258	Kapele
00050000-555d-e685-d60c-90e5c61db87d	2362	Kapla
00050000-555d-e685-758b-0df949ac390c	2325	Kidričevo
00050000-555d-e685-2cfd-805b44b25053	1412	Kisovec
00050000-555d-e685-f475-329168d75243	6253	Knežak
00050000-555d-e685-2b21-5e1c043c16df	5222	Kobarid
00050000-555d-e685-5621-83e6fa563486	9227	Kobilje
00050000-555d-e685-a08f-af2a1730656a	1330	Kočevje
00050000-555d-e685-e406-3bf256832400	1338	Kočevska Reka
00050000-555d-e685-9ff1-fb6392362e06	2276	Kog
00050000-555d-e685-a010-06131065fb5c	5211	Kojsko
00050000-555d-e685-f2f6-608c408cd2c0	6223	Komen
00050000-555d-e685-63c1-8ff1281108e9	1218	Komenda
00050000-555d-e685-20c8-308914123b0d	6000	Koper/Capodistria 
00050000-555d-e685-cc6d-9d2ecb1e63bb	6001	Koper/Capodistria - poštni predali
00050000-555d-e685-0685-867b00f072c8	8282	Koprivnica
00050000-555d-e685-71fb-ef66668ecdd1	5296	Kostanjevica na Krasu
00050000-555d-e685-af12-0de64e21c1a4	8311	Kostanjevica na Krki
00050000-555d-e685-8510-6125e8a9568e	1336	Kostel
00050000-555d-e685-3775-c1b171a79847	6256	Košana
00050000-555d-e685-74b6-6039f13dec4c	2394	Kotlje
00050000-555d-e685-11c4-37565f9c1776	6240	Kozina
00050000-555d-e685-b85d-aeaeecd3f3ef	3260	Kozje
00050000-555d-e685-cbae-ca8485f514c5	4000	Kranj 
00050000-555d-e685-ce25-e66aa755a8f5	4001	Kranj - poštni predali
00050000-555d-e685-e271-83b3dca058ca	4280	Kranjska Gora
00050000-555d-e685-26b6-b6eda366f3b2	1281	Kresnice
00050000-555d-e685-424e-533c6dbfe515	4294	Križe
00050000-555d-e685-cc6f-79f3271cfa78	9206	Križevci
00050000-555d-e685-ac67-25fb6c416968	9242	Križevci pri Ljutomeru
00050000-555d-e685-6c63-8e50c09b1714	1301	Krka
00050000-555d-e685-f23e-df38969a5864	8296	Krmelj
00050000-555d-e685-1312-134f05e2708b	4245	Kropa
00050000-555d-e685-c21b-9b0a3debb0b0	8262	Krška vas
00050000-555d-e685-7ebf-eac4f5db52c3	8270	Krško
00050000-555d-e685-39c3-7028e7943d12	9263	Kuzma
00050000-555d-e685-d297-ae7a98dc9d5e	2318	Laporje
00050000-555d-e685-843f-3ba93d474700	3270	Laško
00050000-555d-e685-9a35-834d848a5564	1219	Laze v Tuhinju
00050000-555d-e685-fd8a-fa9384c825b8	2230	Lenart v Slovenskih goricah
00050000-555d-e685-1a40-696d22f62586	9220	Lendava/Lendva
00050000-555d-e685-7a05-e86e807141dc	4248	Lesce
00050000-555d-e685-94a4-47777b4fe9f4	3261	Lesično
00050000-555d-e685-e390-610a4d149ff2	8273	Leskovec pri Krškem
00050000-555d-e685-a136-125cdb4eb94d	2372	Libeliče
00050000-555d-e685-736c-9bd5219f3915	2341	Limbuš
00050000-555d-e685-b6fd-5f44158c5c7c	1270	Litija
00050000-555d-e685-4088-f459ab9872d6	3202	Ljubečna
00050000-555d-e685-59b0-571cd45d8b61	1000	Ljubljana 
00050000-555d-e685-d704-f18bc102b2e9	1001	Ljubljana - poštni predali
00050000-555d-e685-43e7-4e47cf84edd8	1231	Ljubljana - Črnuče
00050000-555d-e685-fe14-18f7e9f9c299	1261	Ljubljana - Dobrunje
00050000-555d-e685-2574-783be095799e	1260	Ljubljana - Polje
00050000-555d-e685-6532-cd8c5fa9790e	1210	Ljubljana - Šentvid
00050000-555d-e685-e73e-82659218e2c4	1211	Ljubljana - Šmartno
00050000-555d-e685-36a7-0c372375c9c1	3333	Ljubno ob Savinji
00050000-555d-e685-d7fe-9bfd929456fb	9240	Ljutomer
00050000-555d-e685-218a-6d4d83a5348d	3215	Loče
00050000-555d-e685-244f-ddcd2402f768	5231	Log pod Mangartom
00050000-555d-e685-f603-ff926e4abf13	1358	Log pri Brezovici
00050000-555d-e685-633f-9c34a23747d8	1370	Logatec
00050000-555d-e685-e27a-2360766d573b	1371	Logatec
00050000-555d-e685-32a7-cc6c51d3441f	1434	Loka pri Zidanem Mostu
00050000-555d-e685-7fdc-5bcc0ef336fa	3223	Loka pri Žusmu
00050000-555d-e685-8d90-00a737db5328	6219	Lokev
00050000-555d-e685-08b8-8a02ac725a98	1318	Loški Potok
00050000-555d-e685-8718-f5047f76f7e1	2324	Lovrenc na Dravskem polju
00050000-555d-e685-d9a0-282f2382b22c	2344	Lovrenc na Pohorju
00050000-555d-e685-1ad2-f7345043ee11	3334	Luče
00050000-555d-e685-f104-a6373b0d5b03	1225	Lukovica
00050000-555d-e685-9bd7-8a471042ee3d	9202	Mačkovci
00050000-555d-e685-6bb2-ea5285225c60	2322	Majšperk
00050000-555d-e685-909c-2bb20fba109b	2321	Makole
00050000-555d-e685-b9ce-ccb7755957de	9243	Mala Nedelja
00050000-555d-e685-fb04-986f29acaf34	2229	Malečnik
00050000-555d-e685-a166-51cfb1ab34a7	6273	Marezige
00050000-555d-e685-6c6e-959175d2e842	2000	Maribor 
00050000-555d-e685-5abb-0e0b8d198281	2001	Maribor - poštni predali
00050000-555d-e685-b50d-5d48eed9ad79	2206	Marjeta na Dravskem polju
00050000-555d-e685-bbd1-8acf77f73e1e	2281	Markovci
00050000-555d-e685-2c81-1832df296e1b	9221	Martjanci
00050000-555d-e685-d9a9-209bae48ad6c	6242	Materija
00050000-555d-e685-a5a2-8b5d33cf99b1	4211	Mavčiče
00050000-555d-e685-4ca5-ac6630140d02	1215	Medvode
00050000-555d-e685-d29e-7d776e81890c	1234	Mengeš
00050000-555d-e685-9212-8cfd4c07a685	8330	Metlika
00050000-555d-e685-124c-c254ccad4150	2392	Mežica
00050000-555d-e685-06d5-b3c40fd591f6	2204	Miklavž na Dravskem polju
00050000-555d-e685-42b7-55b1b01fa3e6	2275	Miklavž pri Ormožu
00050000-555d-e685-685c-5141a96d4717	5291	Miren
00050000-555d-e685-b0bd-78a68a77f1a9	8233	Mirna
00050000-555d-e685-c865-509efe09a586	8216	Mirna Peč
00050000-555d-e685-9e77-2ebc95ac53a3	2382	Mislinja
00050000-555d-e685-31f5-75e708f41744	4281	Mojstrana
00050000-555d-e685-cc02-4773af7eaae1	8230	Mokronog
00050000-555d-e685-7831-2b4f7469803a	1251	Moravče
00050000-555d-e685-6d89-6467054138da	9226	Moravske Toplice
00050000-555d-e685-2ca8-2cdfe6953f36	5216	Most na Soči
00050000-555d-e685-e45c-d94724044ee5	1221	Motnik
00050000-555d-e685-1c86-f939a9ac5b90	3330	Mozirje
00050000-555d-e685-3b64-1292607662ed	9000	Murska Sobota 
00050000-555d-e685-1fb8-0112a25310b0	9001	Murska Sobota - poštni predali
00050000-555d-e685-1bc5-a0c222141d12	2366	Muta
00050000-555d-e685-fe09-5ddb33c745e2	4202	Naklo
00050000-555d-e685-3d79-4a423ae02441	3331	Nazarje
00050000-555d-e685-dcd8-d39051bd3ebc	1357	Notranje Gorice
00050000-555d-e685-07b8-b87aac9a70f7	3203	Nova Cerkev
00050000-555d-e685-e747-1387aa8da4d2	5000	Nova Gorica 
00050000-555d-e685-5105-533243005019	5001	Nova Gorica - poštni predali
00050000-555d-e685-cbd1-d8c35fa9b0a9	1385	Nova vas
00050000-555d-e685-c406-be5a7045caf4	8000	Novo mesto
00050000-555d-e685-c3a0-875bec789acf	8001	Novo mesto - poštni predali
00050000-555d-e685-9806-8e34b1e90b0e	6243	Obrov
00050000-555d-e685-c907-986c20315f97	9233	Odranci
00050000-555d-e685-50e1-a4cd3e0c10f5	2317	Oplotnica
00050000-555d-e685-dc5f-6d9eb8e84842	2312	Orehova vas
00050000-555d-e685-36d1-15117090617f	2270	Ormož
00050000-555d-e685-d103-3f94a7c094a1	1316	Ortnek
00050000-555d-e685-9c31-addd2075e27c	1337	Osilnica
00050000-555d-e685-2160-9af6b320643f	8222	Otočec
00050000-555d-e685-c5ce-c05fa3bf8e1c	2361	Ožbalt
00050000-555d-e685-edb5-c141a70704b7	2231	Pernica
00050000-555d-e685-950b-a2a10d68bbed	2211	Pesnica pri Mariboru
00050000-555d-e685-55a8-c7ae77d2a50c	9203	Petrovci
00050000-555d-e685-f179-67190621957d	3301	Petrovče
00050000-555d-e685-5d8b-b0dbadd3e4f5	6330	Piran/Pirano
00050000-555d-e685-b6e9-16fb702fe18a	8255	Pišece
00050000-555d-e685-cb8c-7d5439a637fa	6257	Pivka
00050000-555d-e685-9466-09d15b43faa7	6232	Planina
00050000-555d-e685-3e07-97a828134b88	3225	Planina pri Sevnici
00050000-555d-e685-fbd9-de9da4ebd0e8	6276	Pobegi
00050000-555d-e685-fa91-7d534cadaeb2	8312	Podbočje
00050000-555d-e685-b214-1d61660b70ef	5243	Podbrdo
00050000-555d-e685-abc3-8a245e471bdb	3254	Podčetrtek
00050000-555d-e685-855f-1a268a956601	2273	Podgorci
00050000-555d-e685-64cf-dd7519f66a64	6216	Podgorje
00050000-555d-e685-902d-89ac59e59f54	2381	Podgorje pri Slovenj Gradcu
00050000-555d-e685-4599-ce028a541524	6244	Podgrad
00050000-555d-e685-d4df-97fd00c1ab1b	1414	Podkum
00050000-555d-e685-0bfa-5bcc5c84a6cc	2286	Podlehnik
00050000-555d-e685-a677-3db3b3db6973	5272	Podnanos
00050000-555d-e685-ba1e-053758d7df63	4244	Podnart
00050000-555d-e685-8022-c11e30d96a52	3241	Podplat
00050000-555d-e685-5dd7-b4c6b772eec6	3257	Podsreda
00050000-555d-e685-4a18-137052cd95a4	2363	Podvelka
00050000-555d-e685-1987-1c1d5c794403	2208	Pohorje
00050000-555d-e685-87cf-f0efdf82f34e	2257	Polenšak
00050000-555d-e685-3220-60726a9bf4d3	1355	Polhov Gradec
00050000-555d-e685-e154-4a91b0bf862a	4223	Poljane nad Škofjo Loko
00050000-555d-e685-3021-a28506adcf3c	2319	Poljčane
00050000-555d-e685-e85a-f8c89dc45748	1272	Polšnik
00050000-555d-e685-a886-c01fdc6eb673	3313	Polzela
00050000-555d-e685-2396-6276073cb0da	3232	Ponikva
00050000-555d-e685-e8df-5b754bb1c40b	6320	Portorož/Portorose
00050000-555d-e685-e605-e79b2810d59d	6230	Postojna
00050000-555d-e685-8161-6cc8bcfae33b	2331	Pragersko
00050000-555d-e685-c13f-eaba71655ce3	3312	Prebold
00050000-555d-e685-b701-882fd0a374f2	4205	Preddvor
00050000-555d-e685-fa2a-b8a8d7ae20a6	6255	Prem
00050000-555d-e685-9f22-3c06ae34fd8b	1352	Preserje
00050000-555d-e685-ac77-7f2e3a6e2efd	6258	Prestranek
00050000-555d-e685-40a8-a8cba2a16950	2391	Prevalje
00050000-555d-e685-3e99-360c32ecb065	3262	Prevorje
00050000-555d-e685-bd8f-bd2ca5908817	1276	Primskovo 
00050000-555d-e685-6e81-fc83ddaa3b8a	3253	Pristava pri Mestinju
00050000-555d-e685-d364-3c7abdc9b51a	9207	Prosenjakovci/Partosfalva
00050000-555d-e685-e813-7d2152eab0b3	5297	Prvačina
00050000-555d-e685-e79b-f5405973ae33	2250	Ptuj
00050000-555d-e685-07d1-480338c59125	2323	Ptujska Gora
00050000-555d-e685-9528-567fd4cfb170	9201	Puconci
00050000-555d-e685-bb9f-618b081a9481	2327	Rače
00050000-555d-e685-ff92-a3a9f8516559	1433	Radeče
00050000-555d-e685-ebfa-b48947d10564	9252	Radenci
00050000-555d-e685-9236-1ba1cb8ec656	2360	Radlje ob Dravi
00050000-555d-e685-6d5f-1371efb2f40d	1235	Radomlje
00050000-555d-e685-61cc-849e055b83c8	4240	Radovljica
00050000-555d-e685-0d2e-a513e733e2e4	8274	Raka
00050000-555d-e685-79ae-05772adda961	1381	Rakek
00050000-555d-e685-c7fa-c0dd763e704b	4283	Rateče - Planica
00050000-555d-e685-24cb-e4a7f3121048	2390	Ravne na Koroškem
00050000-555d-e685-1776-3c6f6c4a9c48	9246	Razkrižje
00050000-555d-e685-7398-0472afd0050a	3332	Rečica ob Savinji
00050000-555d-e685-eb83-b5f2b0800990	5292	Renče
00050000-555d-e685-896a-ce0b48b8c304	1310	Ribnica
00050000-555d-e685-3a13-f604b33b82cf	2364	Ribnica na Pohorju
00050000-555d-e685-b209-84152b4c031a	3272	Rimske Toplice
00050000-555d-e685-fa0c-047620e5f970	1314	Rob
00050000-555d-e685-e6e6-e966d3f6f6a2	5215	Ročinj
00050000-555d-e685-7f51-d903f47971e0	3250	Rogaška Slatina
00050000-555d-e685-6a4b-dd59e6866d6d	9262	Rogašovci
00050000-555d-e685-24d2-aee7696172dd	3252	Rogatec
00050000-555d-e685-7d08-64713bf8b19c	1373	Rovte
00050000-555d-e685-ea23-746a1ea23362	2342	Ruše
00050000-555d-e685-202a-91e27c677cbb	1282	Sava
00050000-555d-e685-4e28-12010bbca3ee	6333	Sečovlje/Sicciole
00050000-555d-e685-0394-14807eac05d3	4227	Selca
00050000-555d-e685-504a-aa08ab20eb9f	2352	Selnica ob Dravi
00050000-555d-e685-ea0d-de0e815240d4	8333	Semič
00050000-555d-e685-c01f-ce61e831fff2	8281	Senovo
00050000-555d-e685-de10-62c2aaad0819	6224	Senožeče
00050000-555d-e685-bde8-b4044ea44538	8290	Sevnica
00050000-555d-e685-0e46-2fcc5263963b	6210	Sežana
00050000-555d-e685-cc27-10d2cb604c0a	2214	Sladki Vrh
00050000-555d-e685-f290-8e817116b176	5283	Slap ob Idrijci
00050000-555d-e685-bc45-ad7c9e5be1b6	2380	Slovenj Gradec
00050000-555d-e685-2700-929e174b9ec1	2310	Slovenska Bistrica
00050000-555d-e685-515c-b8ab6552d1f1	3210	Slovenske Konjice
00050000-555d-e685-204e-9fd5c31e2d93	1216	Smlednik
00050000-555d-e685-71e7-888b6a413f9f	5232	Soča
00050000-555d-e685-c6ab-bcd973e31915	1317	Sodražica
00050000-555d-e685-2f7a-71442d1140cd	3335	Solčava
00050000-555d-e685-ef5f-3a52335dfdf2	5250	Solkan
00050000-555d-e685-dcbc-31712672a081	4229	Sorica
00050000-555d-e685-3fce-57988bf4a834	4225	Sovodenj
00050000-555d-e685-b203-bdc35aa9d01f	5281	Spodnja Idrija
00050000-555d-e685-26cf-e6552ceb24d4	2241	Spodnji Duplek
00050000-555d-e685-42b7-7481acdecefa	9245	Spodnji Ivanjci
00050000-555d-e685-e515-d23e3c253426	2277	Središče ob Dravi
00050000-555d-e685-e9c2-66f673a4de99	4267	Srednja vas v Bohinju
00050000-555d-e685-6b05-5cc373d009f5	8256	Sromlje 
00050000-555d-e685-d369-ca9809d1853f	5224	Srpenica
00050000-555d-e685-c892-00ba1c83ba3a	1242	Stahovica
00050000-555d-e685-f7b4-a0c63e8b0c3c	1332	Stara Cerkev
00050000-555d-e685-1446-901db7b8a32d	8342	Stari trg ob Kolpi
00050000-555d-e685-3613-e02215fe416a	1386	Stari trg pri Ložu
00050000-555d-e685-7714-413282b83515	2205	Starše
00050000-555d-e685-1116-56f8fab0237a	2289	Stoperce
00050000-555d-e685-20e6-c59fa3a3eed0	8322	Stopiče
00050000-555d-e685-8341-28389f79a961	3206	Stranice
00050000-555d-e685-825a-7ed9b84b2f8e	8351	Straža
00050000-555d-e685-1132-2970c08561ad	1313	Struge
00050000-555d-e685-4a2c-dafcb7e9e1a3	8293	Studenec
00050000-555d-e685-62de-7855f5346796	8331	Suhor
00050000-555d-e685-e451-b4ea1d0d6b4a	2233	Sv. Ana v Slovenskih goricah
00050000-555d-e685-e8fd-81a28e0dbec2	2235	Sv. Trojica v Slovenskih goricah
00050000-555d-e685-7581-2c16117f6d53	2353	Sveti Duh na Ostrem Vrhu
00050000-555d-e685-c7c6-4cc24351d73f	9244	Sveti Jurij ob Ščavnici
00050000-555d-e685-5691-afefe759bbac	3264	Sveti Štefan
00050000-555d-e685-35ac-8d44f500ffb4	2258	Sveti Tomaž
00050000-555d-e685-82c3-857a2234c594	9204	Šalovci
00050000-555d-e685-066a-6ce4635a3ace	5261	Šempas
00050000-555d-e685-3c2b-6e120ecc3a41	5290	Šempeter pri Gorici
00050000-555d-e685-bec8-d696f2db593f	3311	Šempeter v Savinjski dolini
00050000-555d-e685-03f9-98cb0cdf7771	4208	Šenčur
00050000-555d-e685-48a3-12b897c3c132	2212	Šentilj v Slovenskih goricah
00050000-555d-e685-ce36-0b3e5279a252	8297	Šentjanž
00050000-555d-e685-7f94-3f832b0c35e1	2373	Šentjanž pri Dravogradu
00050000-555d-e685-c3bd-5baf0f6d1e52	8310	Šentjernej
00050000-555d-e685-d60a-f47522253fd5	3230	Šentjur
00050000-555d-e685-16e0-0cc20e0584a7	3271	Šentrupert
00050000-555d-e685-cf04-7cd13d2d7fe1	8232	Šentrupert
00050000-555d-e685-0638-15917e7cfc59	1296	Šentvid pri Stični
00050000-555d-e685-2c85-24a43ab3a160	8275	Škocjan
00050000-555d-e685-2a8d-4d069e23d3da	6281	Škofije
00050000-555d-e685-ca5c-14e155583962	4220	Škofja Loka
00050000-555d-e685-987d-a903530e271a	3211	Škofja vas
00050000-555d-e685-0c7e-5e0cf309022e	1291	Škofljica
00050000-555d-e685-6117-49f5b79427e0	6274	Šmarje
00050000-555d-e685-37a1-a1787291d501	1293	Šmarje - Sap
00050000-555d-e685-9506-8111ab350cfb	3240	Šmarje pri Jelšah
00050000-555d-e685-5f0d-c3b47b08a92a	8220	Šmarješke Toplice
00050000-555d-e685-1a5a-3f236b853bff	2315	Šmartno na Pohorju
00050000-555d-e685-6104-3a466941e45c	3341	Šmartno ob Dreti
00050000-555d-e685-81f8-d8efc1c5f72b	3327	Šmartno ob Paki
00050000-555d-e685-70f5-1c5f9f4eb1eb	1275	Šmartno pri Litiji
00050000-555d-e685-6dc6-5df92af8aa16	2383	Šmartno pri Slovenj Gradcu
00050000-555d-e685-bebf-c75337ac5493	3201	Šmartno v Rožni dolini
00050000-555d-e685-a562-d78a3d254e8b	3325	Šoštanj
00050000-555d-e685-43e8-12e35ec2bc08	6222	Štanjel
00050000-555d-e685-fdd0-566cc2befa17	3220	Štore
00050000-555d-e685-db43-8cd97dbde87b	3304	Tabor
00050000-555d-e685-d965-ffa00a51dd32	3221	Teharje
00050000-555d-e685-7fb3-0f9d49ac8f59	9251	Tišina
00050000-555d-e685-5a10-0cb71c8708c5	5220	Tolmin
00050000-555d-e685-df95-99ec808184c0	3326	Topolšica
00050000-555d-e685-2a9b-9524411c94b3	2371	Trbonje
00050000-555d-e685-ab74-c9b82bcbb821	1420	Trbovlje
00050000-555d-e685-a073-0e111263d43c	8231	Trebelno 
00050000-555d-e685-4391-7ba0c10d8fae	8210	Trebnje
00050000-555d-e685-446c-f42d75eed2cd	5252	Trnovo pri Gorici
00050000-555d-e685-fa89-7514e1e308f9	2254	Trnovska vas
00050000-555d-e685-7014-c41d696e24ec	1222	Trojane
00050000-555d-e685-dffa-486569b69eeb	1236	Trzin
00050000-555d-e685-fa24-66ebdccb9519	4290	Tržič
00050000-555d-e685-3ac7-554bc86f2955	8295	Tržišče
00050000-555d-e685-f351-d11bec1f40f0	1311	Turjak
00050000-555d-e685-0a99-2809967aa01c	9224	Turnišče
00050000-555d-e685-1d62-dbb20f436db5	8323	Uršna sela
00050000-555d-e685-0dbc-61a29b5f2a03	1252	Vače
00050000-555d-e685-d7dc-a530ca650fb9	3320	Velenje 
00050000-555d-e685-376c-b8b921811a8a	3322	Velenje - poštni predali
00050000-555d-e685-7073-ab584b54cdc4	8212	Velika Loka
00050000-555d-e685-4808-75b5faaa37ce	2274	Velika Nedelja
00050000-555d-e685-19f2-06fc9a28026d	9225	Velika Polana
00050000-555d-e685-8c1f-63dd01e92317	1315	Velike Lašče
00050000-555d-e685-c145-a869968e68ae	8213	Veliki Gaber
00050000-555d-e685-b205-f01151e17b7c	9241	Veržej
00050000-555d-e685-8421-ee3393acf2ef	1312	Videm - Dobrepolje
00050000-555d-e685-ea22-6c0c46eb8af7	2284	Videm pri Ptuju
00050000-555d-e685-a622-1053e9a9b26f	8344	Vinica
00050000-555d-e685-df83-f2570122db15	5271	Vipava
00050000-555d-e685-bb63-02b07a71da6e	4212	Visoko
00050000-555d-e685-17f7-1a611ccd4e3d	1294	Višnja Gora
00050000-555d-e685-7b7c-d7cc009f6b7b	3205	Vitanje
00050000-555d-e685-5685-02e62112b010	2255	Vitomarci
00050000-555d-e685-11de-0ee0f9f229a9	1217	Vodice
00050000-555d-e685-86d3-3ba50f1d000c	3212	Vojnik\t
00050000-555d-e685-73eb-e8b9146218f7	5293	Volčja Draga
00050000-555d-e685-42e0-4e98362cd5bb	2232	Voličina
00050000-555d-e685-4f99-d63443bc1ee1	3305	Vransko
00050000-555d-e685-f6ed-57195ac6cac7	6217	Vremski Britof
00050000-555d-e685-ca4e-dab16e16d7f8	1360	Vrhnika
00050000-555d-e685-ae31-d40181ce2c35	2365	Vuhred
00050000-555d-e685-c651-909789b9d66b	2367	Vuzenica
00050000-555d-e685-93b1-bdf99623b05b	8292	Zabukovje 
00050000-555d-e685-af79-07928f3719f8	1410	Zagorje ob Savi
00050000-555d-e685-7f1c-59acd97e3631	1303	Zagradec
00050000-555d-e685-43d6-af677f69eb7b	2283	Zavrč
00050000-555d-e685-301e-b202b7fbdd15	8272	Zdole 
00050000-555d-e685-bb9a-e3eafcd80b7c	4201	Zgornja Besnica
00050000-555d-e685-5de6-244aa664141c	2242	Zgornja Korena
00050000-555d-e685-8fa2-08aac193b903	2201	Zgornja Kungota
00050000-555d-e685-8ccd-8e0165da8b8a	2316	Zgornja Ložnica
00050000-555d-e685-432a-d85659e5789f	2314	Zgornja Polskava
00050000-555d-e685-0352-fb731a2a3ac5	2213	Zgornja Velka
00050000-555d-e685-257c-0a4083461dca	4247	Zgornje Gorje
00050000-555d-e685-ff0b-f4b5a0521ce1	4206	Zgornje Jezersko
00050000-555d-e685-a400-a29b3ec14529	2285	Zgornji Leskovec
00050000-555d-e685-446c-bfa180fd6074	1432	Zidani Most
00050000-555d-e685-1190-50faa823dc07	3214	Zreče
00050000-555d-e685-b904-da9307470a8c	4209	Žabnica
00050000-555d-e685-ea33-7dfb6c71fd78	3310	Žalec
00050000-555d-e685-9aa0-11345353e768	4228	Železniki
00050000-555d-e685-c92e-ac58edc7586d	2287	Žetale
00050000-555d-e685-bcc0-02a275e1d8aa	4226	Žiri
00050000-555d-e685-9c2f-6af9f6b42a62	4274	Žirovnica
00050000-555d-e685-1ab8-d7b662ba6e05	8360	Žužemberk
\.


--
-- TOC entry 2655 (class 0 OID 4544630)
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
-- TOC entry 2638 (class 0 OID 4544458)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4544523)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4544642)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4544747)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4544792)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4544671)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4544615)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4544605)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4544782)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4544737)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 4544326)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555d-e685-1725-13a85ecda57a	00010000-555d-e685-cd33-a92086d50ee7	2015-05-21 16:07:02	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRObhifgr.HfX43jQsneQrgPLrpEawGz/O";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2662 (class 0 OID 4544680)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4544364)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555d-e685-cd15-5b5d3bf41349	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555d-e685-a59b-d2572d881a89	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555d-e685-4c4f-0342fdf3f94c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555d-e685-cea0-a787c4be9c57	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555d-e685-de47-b6f1a9e12e8c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555d-e685-bb68-b53def6d050b	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2628 (class 0 OID 4544348)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555d-e685-1725-13a85ecda57a	00020000-555d-e685-cea0-a787c4be9c57
00010000-555d-e685-cd33-a92086d50ee7	00020000-555d-e685-cea0-a787c4be9c57
\.


--
-- TOC entry 2664 (class 0 OID 4544694)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4544636)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4544586)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 4544423)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4544592)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4544770)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4544492)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 4544335)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555d-e685-cd33-a92086d50ee7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROtLbWqW5Y2oe04Fu8vuTt54co14m0.Eu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555d-e685-1725-13a85ecda57a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2676 (class 0 OID 4544824)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4544538)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4544663)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4544729)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4544570)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4544814)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 4544719)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4544389)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4544864)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4544857)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4544769)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4544560)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4544585)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4544518)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4544715)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4544536)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4544579)
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
-- TOC entry 2360 (class 2606 OID 4544628)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4544655)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4544490)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4544398)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4544455)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4544421)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4544378)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4544363)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4544661)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4544693)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4544809)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4544448)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4544478)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4544634)
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
-- TOC entry 2294 (class 2606 OID 4544468)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4544527)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4544646)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4544753)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4544797)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4544678)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4544619)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4544610)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4544791)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4544744)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4544334)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4544684)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4544352)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4544372)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4544702)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4544641)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4544591)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4544428)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4544601)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4544781)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4544503)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4544347)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4544839)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4544545)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4544669)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4544735)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4544574)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4544823)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4544728)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4544567)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4544450)
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
-- TOC entry 2373 (class 1259 OID 4544662)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4544648)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4544647)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4544546)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4544718)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4544716)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4544717)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4544811)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4544812)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4544813)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4544842)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4544841)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2429 (class 1259 OID 4544840)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4544505)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4544504)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4544457)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4544456)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4544685)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4544580)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4544379)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4544380)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4544705)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4544704)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4544703)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4544528)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4544530)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4544529)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4544614)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4544612)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4544611)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4544613)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4544353)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4544354)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4544670)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4544635)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4544745)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4544746)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4544470)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4544469)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4544471)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4544754)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4544755)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2438 (class 1259 OID 4544867)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 4544866)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2440 (class 1259 OID 4544869)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2441 (class 1259 OID 4544865)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2442 (class 1259 OID 4544868)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4544736)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4544623)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4544622)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4544620)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4544621)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2434 (class 1259 OID 4544859)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 4544858)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4544537)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4544400)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4544399)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4544429)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4544430)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4544604)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4544603)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4544602)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4544569)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4544565)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4544562)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4544563)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4544561)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4544566)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4544564)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4544449)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4544519)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4544521)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4544520)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4544522)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4544629)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4544810)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4544422)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4544491)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4544679)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4544479)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4544798)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4544373)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4544568)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2467 (class 2606 OID 4545000)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 4544985)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2469 (class 2606 OID 4544990)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2465 (class 2606 OID 4545010)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2471 (class 2606 OID 4544980)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2466 (class 2606 OID 4545005)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2468 (class 2606 OID 4544995)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2452 (class 2606 OID 4544915)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2488 (class 2606 OID 4545095)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2486 (class 2606 OID 4545090)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2487 (class 2606 OID 4545085)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2464 (class 2606 OID 4544975)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2494 (class 2606 OID 4545135)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2496 (class 2606 OID 4545125)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4545130)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2484 (class 2606 OID 4545075)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2505 (class 2606 OID 4545170)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2504 (class 2606 OID 4545175)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2503 (class 2606 OID 4545180)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2506 (class 2606 OID 4545195)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2507 (class 2606 OID 4545190)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2508 (class 2606 OID 4545185)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2458 (class 2606 OID 4544950)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 4544945)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4544925)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4544920)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2449 (class 2606 OID 4544900)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2490 (class 2606 OID 4545105)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2472 (class 2606 OID 4545015)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2446 (class 2606 OID 4544880)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2445 (class 2606 OID 4544885)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2491 (class 2606 OID 4545120)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2492 (class 2606 OID 4545115)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2493 (class 2606 OID 4545110)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2462 (class 2606 OID 4544955)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4544965)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2461 (class 2606 OID 4544960)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2476 (class 2606 OID 4545050)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2478 (class 2606 OID 4545040)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2479 (class 2606 OID 4545035)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2477 (class 2606 OID 4545045)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2444 (class 2606 OID 4544870)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 4544875)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2489 (class 2606 OID 4545100)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2485 (class 2606 OID 4545080)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2499 (class 2606 OID 4545145)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2498 (class 2606 OID 4545150)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 4544935)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 4544930)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 4544940)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2501 (class 2606 OID 4545155)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 4545160)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2513 (class 2606 OID 4545220)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4545215)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2511 (class 2606 OID 4545230)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 4545210)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2512 (class 2606 OID 4545225)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2497 (class 2606 OID 4545140)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 4545070)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2481 (class 2606 OID 4545065)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2483 (class 2606 OID 4545055)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2482 (class 2606 OID 4545060)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2509 (class 2606 OID 4545205)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 4545200)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2463 (class 2606 OID 4544970)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4545165)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2447 (class 2606 OID 4544895)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 4544890)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2451 (class 2606 OID 4544905)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2450 (class 2606 OID 4544910)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2473 (class 2606 OID 4545030)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2474 (class 2606 OID 4545025)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2475 (class 2606 OID 4545020)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-21 16:07:02 CEST

--
-- PostgreSQL database dump complete
--

