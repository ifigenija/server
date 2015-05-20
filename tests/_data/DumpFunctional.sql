--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-20 16:40:07 CEST

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
-- TOC entry 179 (class 1259 OID 4202770)
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
-- TOC entry 225 (class 1259 OID 4203253)
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
-- TOC entry 224 (class 1259 OID 4203236)
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
-- TOC entry 217 (class 1259 OID 4203147)
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
-- TOC entry 193 (class 1259 OID 4202938)
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
-- TOC entry 196 (class 1259 OID 4202972)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4202897)
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
-- TOC entry 212 (class 1259 OID 4203097)
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
-- TOC entry 191 (class 1259 OID 4202922)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4202966)
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
-- TOC entry 201 (class 1259 OID 4203015)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4203040)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4202871)
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
-- TOC entry 180 (class 1259 OID 4202779)
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
-- TOC entry 181 (class 1259 OID 4202790)
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
-- TOC entry 184 (class 1259 OID 4202841)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4202744)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4202763)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4203047)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4203077)
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
-- TOC entry 221 (class 1259 OID 4203192)
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
-- TOC entry 183 (class 1259 OID 4202821)
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
-- TOC entry 186 (class 1259 OID 4202863)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4203021)
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
-- TOC entry 185 (class 1259 OID 4202848)
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
-- TOC entry 190 (class 1259 OID 4202914)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4203033)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4203138)
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
-- TOC entry 220 (class 1259 OID 4203185)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4203062)
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
-- TOC entry 200 (class 1259 OID 4203006)
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
-- TOC entry 199 (class 1259 OID 4202996)
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
-- TOC entry 219 (class 1259 OID 4203175)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4203128)
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
-- TOC entry 173 (class 1259 OID 4202715)
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
-- TOC entry 172 (class 1259 OID 4202713)
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
-- TOC entry 209 (class 1259 OID 4203071)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4202753)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4202737)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4203085)
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
-- TOC entry 203 (class 1259 OID 4203027)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4202977)
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
-- TOC entry 182 (class 1259 OID 4202813)
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
-- TOC entry 198 (class 1259 OID 4202983)
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
-- TOC entry 218 (class 1259 OID 4203163)
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
-- TOC entry 188 (class 1259 OID 4202883)
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
-- TOC entry 174 (class 1259 OID 4202724)
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
-- TOC entry 223 (class 1259 OID 4203217)
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
-- TOC entry 192 (class 1259 OID 4202929)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4203054)
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
-- TOC entry 214 (class 1259 OID 4203120)
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
-- TOC entry 194 (class 1259 OID 4202961)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4203207)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4203110)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4202718)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 4202770)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 4203253)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 4203236)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4203147)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4202938)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4202972)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4202897)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555c-9cc6-71fb-bb92ccdf28c5	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555c-9cc6-f974-09e8724a4aed	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555c-9cc6-e099-253f92eb681d	AL	ALB	008	Albania 	Albanija	\N
00040000-555c-9cc6-8bd2-3e37075c1eb8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555c-9cc6-aca8-e1edbf695078	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555c-9cc6-08cb-eced09ecfd01	AD	AND	020	Andorra 	Andora	\N
00040000-555c-9cc6-62ef-3c609d744e3e	AO	AGO	024	Angola 	Angola	\N
00040000-555c-9cc6-9cda-d3f1b12daa89	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555c-9cc6-049c-61af328ab173	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555c-9cc6-dd6f-986963533407	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555c-9cc6-5874-cf66d817e26e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555c-9cc6-0192-402f74a5bd83	AM	ARM	051	Armenia 	Armenija	\N
00040000-555c-9cc6-ec7b-8bf2f7e6af36	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555c-9cc6-1581-e23914a4a23e	AU	AUS	036	Australia 	Avstralija	\N
00040000-555c-9cc6-f8c1-09e1bfb5756c	AT	AUT	040	Austria 	Avstrija	\N
00040000-555c-9cc6-4691-d897c49596b7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555c-9cc6-492d-d2180f9aa9f7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555c-9cc6-b27a-6d878d4a6192	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555c-9cc6-e727-0d85f6d87be3	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555c-9cc6-7bb2-4768bd79e1fb	BB	BRB	052	Barbados 	Barbados	\N
00040000-555c-9cc6-7bfb-cc6d10aa959f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555c-9cc6-db9b-3663bbfd7bf6	BE	BEL	056	Belgium 	Belgija	\N
00040000-555c-9cc6-c402-d43588ad347b	BZ	BLZ	084	Belize 	Belize	\N
00040000-555c-9cc6-2ca8-d67fdaeb7271	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555c-9cc6-49e4-980478f1441c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555c-9cc6-52d8-a056dbfb41f4	BT	BTN	064	Bhutan 	Butan	\N
00040000-555c-9cc6-22a9-7b56a9b7568d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555c-9cc6-c44c-57a2b1955281	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555c-9cc6-fb4b-789e696f6b79	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555c-9cc6-7d45-93ca716fe4be	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555c-9cc6-fd5c-f67c70dd30be	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555c-9cc6-50a6-475d468ac736	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555c-9cc6-914d-cf64f3d8f909	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555c-9cc6-0270-381c40601fec	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555c-9cc6-d773-c6f189184e4d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555c-9cc6-a94a-9c2e773cc63c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555c-9cc6-3348-261956eb5c47	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555c-9cc6-c095-8d0927ee9394	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555c-9cc6-8d2e-19c1a0ffa550	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555c-9cc6-878c-4da24892080c	CA	CAN	124	Canada 	Kanada	\N
00040000-555c-9cc6-1f28-898ef4c1ba11	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555c-9cc6-0ce7-0db141508419	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555c-9cc6-08ac-2ffe79a67486	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555c-9cc6-8c9b-c7aea5b16daf	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555c-9cc6-5c52-1e9d9afe50fd	CL	CHL	152	Chile 	Čile	\N
00040000-555c-9cc6-a853-40e97a66f893	CN	CHN	156	China 	Kitajska	\N
00040000-555c-9cc6-35eb-a3aa56c61b7d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555c-9cc6-4a2e-e333e9aca033	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555c-9cc6-6b61-3b24cb7f85e1	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555c-9cc6-07c1-cae109dbb087	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555c-9cc6-07b6-2bd7b347678f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555c-9cc6-084c-d674d1025830	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555c-9cc6-ac90-ff73252b640c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555c-9cc6-0d73-ecec1d85ee21	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555c-9cc6-37b0-2e556ecc8d5b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555c-9cc6-dd9e-a017b336b1ae	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555c-9cc6-33e9-42a709787a57	CU	CUB	192	Cuba 	Kuba	\N
00040000-555c-9cc6-555d-b2c6e66a5d0b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555c-9cc6-6122-924bdacd3183	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555c-9cc6-5322-ddafd6651210	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555c-9cc6-3dfc-70ea53396b90	DK	DNK	208	Denmark 	Danska	\N
00040000-555c-9cc6-ad9b-d0130937d094	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555c-9cc6-6a7e-61a14075291d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555c-9cc6-0c66-7d7377a1cd12	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555c-9cc6-b18c-e2e95a346ab8	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555c-9cc6-253a-c992885dcb44	EG	EGY	818	Egypt 	Egipt	\N
00040000-555c-9cc6-09b9-671f99933e20	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555c-9cc6-9f39-30b75104cbe2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555c-9cc6-7ea2-671678a607c8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555c-9cc6-9c5b-cceb3180ca73	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555c-9cc6-4eee-dd05d580870b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555c-9cc6-b8bc-495216a50f12	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555c-9cc6-5300-ef7945e81f64	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555c-9cc6-c859-b0cb764053ee	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555c-9cc6-3d5f-44e064ce35d3	FI	FIN	246	Finland 	Finska	\N
00040000-555c-9cc6-672a-d5557376a3fa	FR	FRA	250	France 	Francija	\N
00040000-555c-9cc6-fe14-0cba44f78873	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555c-9cc7-fccf-52d61f51e7e0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555c-9cc6-7049-5c884d492b72	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555c-9cc6-f919-dd47f8e7ebcf	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555c-9cc6-bafb-835d5a9df568	GA	GAB	266	Gabon 	Gabon	\N
00040000-555c-9cc6-0394-c364ea6c3d85	GM	GMB	270	Gambia 	Gambija	\N
00040000-555c-9cc6-0a80-6bfae1c09f3c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555c-9cc6-aaab-246d20377115	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555c-9cc6-1946-88075628d7b2	GH	GHA	288	Ghana 	Gana	\N
00040000-555c-9cc6-7e00-d8fb3045867f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555c-9cc6-9e46-44f14ca3088b	GR	GRC	300	Greece 	Grčija	\N
00040000-555c-9cc6-ebe3-4dd39a413b93	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555c-9cc6-e0de-284e7904807d	GD	GRD	308	Grenada 	Grenada	\N
00040000-555c-9cc6-064b-64b59201fbfe	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555c-9cc6-4057-ec0f41572dd0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555c-9cc6-9a96-1e30780a5e56	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555c-9cc6-a86c-b9cd20e7186f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555c-9cc6-e1d9-0ae62dc53f84	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555c-9cc6-16d5-a834949c9a6f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555c-9cc6-5fbb-5ddbd0d82aaf	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555c-9cc6-5aab-c8ef99635ecd	HT	HTI	332	Haiti 	Haiti	\N
00040000-555c-9cc6-67c6-aebd4e3f254e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555c-9cc6-84a0-21ae289067ec	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555c-9cc6-50e4-b6de2dc24ee5	HN	HND	340	Honduras 	Honduras	\N
00040000-555c-9cc6-77cb-3ccc75f6feac	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555c-9cc6-b4a7-edc152ab2744	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555c-9cc6-3e38-62f2d97e2a9b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555c-9cc6-bb29-c056b1e96bde	IN	IND	356	India 	Indija	\N
00040000-555c-9cc6-c7dd-86097b1476e5	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555c-9cc6-1a9e-cacaadbc6d68	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555c-9cc6-e9a0-f7de38aedf8a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555c-9cc6-c095-414611572f64	IE	IRL	372	Ireland 	Irska	\N
00040000-555c-9cc6-cba1-7f467ff2e657	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555c-9cc6-c43b-6eea958ae162	IL	ISR	376	Israel 	Izrael	\N
00040000-555c-9cc6-89a2-51622a449375	IT	ITA	380	Italy 	Italija	\N
00040000-555c-9cc6-1a73-46e4b840c8ed	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555c-9cc6-3162-63111d1df903	JP	JPN	392	Japan 	Japonska	\N
00040000-555c-9cc6-ac82-a6b176110191	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555c-9cc6-847a-69d5e7615772	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555c-9cc6-4d69-ac97b93031f9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555c-9cc6-9073-4666768108f2	KE	KEN	404	Kenya 	Kenija	\N
00040000-555c-9cc6-ea7c-fcb050acb3ed	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555c-9cc6-0602-6aa5e6d1a908	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555c-9cc6-350a-7a373230e4ff	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555c-9cc6-6f5f-99122727fe7f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555c-9cc6-a82d-a3f15f9b2b60	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555c-9cc6-04c9-3829b62afd19	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555c-9cc6-0f22-8163ff1ae898	LV	LVA	428	Latvia 	Latvija	\N
00040000-555c-9cc6-27b6-40dc0119c08a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555c-9cc6-1f56-fd0e5097fe70	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555c-9cc6-b0fd-627248a7b9ef	LR	LBR	430	Liberia 	Liberija	\N
00040000-555c-9cc6-c826-5327a25b7b2c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555c-9cc6-0d13-0d188efd822b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555c-9cc6-0167-34e27a9d404e	LT	LTU	440	Lithuania 	Litva	\N
00040000-555c-9cc6-7b59-ba3dc1302455	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555c-9cc6-fe8a-164bf3972912	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555c-9cc6-5e77-f687b37845cc	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555c-9cc6-31c1-cd8d84fc1cf5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555c-9cc7-e00d-7d2cb3950cc7	MW	MWI	454	Malawi 	Malavi	\N
00040000-555c-9cc7-322c-b976cbc21755	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555c-9cc7-f437-530725039811	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555c-9cc7-2c55-83fa461e86f3	ML	MLI	466	Mali 	Mali	\N
00040000-555c-9cc7-0d46-48e45cd4decd	MT	MLT	470	Malta 	Malta	\N
00040000-555c-9cc7-e3a5-77feaab4b6ce	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555c-9cc7-d8a0-9c06da442c82	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555c-9cc7-036a-99f546455477	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555c-9cc7-2468-6ba56f3d8f17	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555c-9cc7-a039-72fe0999d19c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555c-9cc7-8d9d-a6611f8ddf6f	MX	MEX	484	Mexico 	Mehika	\N
00040000-555c-9cc7-7105-f7b5884c500f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555c-9cc7-fa71-6035bd05f0ce	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555c-9cc7-2ed9-896456b053d4	MC	MCO	492	Monaco 	Monako	\N
00040000-555c-9cc7-b010-91a01ff76a8a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555c-9cc7-b9fc-73e1cd040fd9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555c-9cc7-9e2f-920c8fde2a0c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555c-9cc7-2268-81a411eb604f	MA	MAR	504	Morocco 	Maroko	\N
00040000-555c-9cc7-3e2b-9eebe274cdf6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555c-9cc7-87b2-f06ac8e2a287	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555c-9cc7-2dce-7eba820b5427	NA	NAM	516	Namibia 	Namibija	\N
00040000-555c-9cc7-5d6d-266eeee9ee76	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555c-9cc7-7b97-6f2a790a069a	NP	NPL	524	Nepal 	Nepal	\N
00040000-555c-9cc7-bba6-53a9cac0d424	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555c-9cc7-6ed3-7d3359413bcd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555c-9cc7-f97c-2a66883f8208	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555c-9cc7-3d01-ab9c9dce59ce	NE	NER	562	Niger 	Niger 	\N
00040000-555c-9cc7-1bb5-af5f4b3a36d2	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555c-9cc7-0ed1-90f34f48f3ee	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555c-9cc7-f28e-f3c16a50bb26	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555c-9cc7-c010-43d823f4cc1f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555c-9cc7-be13-463d1bd7c97b	NO	NOR	578	Norway 	Norveška	\N
00040000-555c-9cc7-80d2-0d3afe3d12d0	OM	OMN	512	Oman 	Oman	\N
00040000-555c-9cc7-8eee-983dd863ae07	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555c-9cc7-e35e-b68edb752c42	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555c-9cc7-c589-7fd124d89fe1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555c-9cc7-e5b2-92b5f13b7bdc	PA	PAN	591	Panama 	Panama	\N
00040000-555c-9cc7-5358-2dba6c10f710	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555c-9cc7-40fd-31ced10018de	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555c-9cc7-9485-33dc0e97f827	PE	PER	604	Peru 	Peru	\N
00040000-555c-9cc7-6898-71541d0873c8	PH	PHL	608	Philippines 	Filipini	\N
00040000-555c-9cc7-8fbb-addf0397f45a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555c-9cc7-c186-aa6d6bd16d3c	PL	POL	616	Poland 	Poljska	\N
00040000-555c-9cc7-45bb-c5469f967fbc	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555c-9cc7-6c27-832d26bce409	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555c-9cc7-848d-d457a1a148dd	QA	QAT	634	Qatar 	Katar	\N
00040000-555c-9cc7-18d1-db6783a714c8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555c-9cc7-9ea4-a2131987f1d2	RO	ROU	642	Romania 	Romunija	\N
00040000-555c-9cc7-e93b-c81e99f6f0be	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555c-9cc7-64d9-ff7b6e93272a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555c-9cc7-7d06-b9e595c69ba0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555c-9cc7-cb3d-dc599dd89df5	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555c-9cc7-5859-6d0558fc1efc	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555c-9cc7-903b-acde43aac2e2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555c-9cc7-154d-d9b6784c728d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555c-9cc7-7b1e-cbe67b143f4d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555c-9cc7-f95c-3979c33da3b5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555c-9cc7-9ee0-a7ad1c79d9fd	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555c-9cc7-7c62-ed1d5bce6217	SM	SMR	674	San Marino 	San Marino	\N
00040000-555c-9cc7-0f02-c14fde3f9d7f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555c-9cc7-d650-fa8b973656cd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555c-9cc7-2f9d-d5eade768211	SN	SEN	686	Senegal 	Senegal	\N
00040000-555c-9cc7-9f2a-a44a4f6ae525	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555c-9cc7-3309-b74f6ccd0582	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555c-9cc7-6ec6-1f2a13155c68	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555c-9cc7-64eb-4f53f070d47a	SG	SGP	702	Singapore 	Singapur	\N
00040000-555c-9cc7-3dbe-aae7287d7e02	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555c-9cc7-7a20-1cb9f4c386d4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555c-9cc7-4cfe-ac758a5f6113	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555c-9cc7-ccdf-9a056b04fa12	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555c-9cc7-4f86-ae7c0730f904	SO	SOM	706	Somalia 	Somalija	\N
00040000-555c-9cc7-dabd-75816a3b6232	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555c-9cc7-42ef-54a4c0d651fc	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555c-9cc7-1a79-e1c6cb8224f5	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555c-9cc7-b1a4-f27ec9f88766	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555c-9cc7-115e-e1fb3413bfec	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555c-9cc7-854c-3b31973a04a0	SD	SDN	729	Sudan 	Sudan	\N
00040000-555c-9cc7-cad4-3a86aa8f3fc3	SR	SUR	740	Suriname 	Surinam	\N
00040000-555c-9cc7-81c6-94ed077eaf86	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555c-9cc7-8a8c-ab0ada5e2111	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555c-9cc7-7646-329c36ffaa97	SE	SWE	752	Sweden 	Švedska	\N
00040000-555c-9cc7-7ea4-1ac4d68ebd5a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555c-9cc7-0f4c-4e2eedf8fc9d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555c-9cc7-0ab4-50f910d5a839	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555c-9cc7-ec5f-c2808955e4a6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555c-9cc7-dfef-2eb61d026318	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555c-9cc7-5a82-c696d1ec15a5	TH	THA	764	Thailand 	Tajska	\N
00040000-555c-9cc7-1cd8-7acbf48b1f39	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555c-9cc7-447b-c886c3862e85	TG	TGO	768	Togo 	Togo	\N
00040000-555c-9cc7-0096-778b0296745a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555c-9cc7-9ab9-f3456aeaa497	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555c-9cc7-cd09-21820fd6a0ce	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555c-9cc7-a9c9-445ce54d86e1	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555c-9cc7-68c7-00b6db3cc6c5	TR	TUR	792	Turkey 	Turčija	\N
00040000-555c-9cc7-5ba7-ba2f0578db72	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555c-9cc7-e81f-b8473150a17c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555c-9cc7-474a-1d59dd9a94e8	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555c-9cc7-33a1-2cf9c1344ef8	UG	UGA	800	Uganda 	Uganda	\N
00040000-555c-9cc7-c9a0-71db61c82015	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555c-9cc7-8401-992196d4741f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555c-9cc7-1c06-e5335328240c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555c-9cc7-a115-56713453fdd2	US	USA	840	United States 	Združene države Amerike	\N
00040000-555c-9cc7-d85c-338c206fd617	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555c-9cc7-cd39-6cd7ea9264d0	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555c-9cc7-aab8-d99898838cd9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555c-9cc7-a563-32c8759c933e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555c-9cc7-70d5-4217dece04bb	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555c-9cc7-b747-66b7f557fe90	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555c-9cc7-92a9-a73f51da6980	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555c-9cc7-e270-ff81ec6315b3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555c-9cc7-cb2e-69391983a552	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555c-9cc7-da09-2294d9cf4526	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555c-9cc7-e16f-88b41fb0e6d3	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555c-9cc7-9086-dceda29c7cb9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555c-9cc7-4fca-ef059e4ed002	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 4203097)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4202922)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4202966)
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
-- TOC entry 2658 (class 0 OID 4203015)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 4203040)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4202871)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555c-9cc7-0c17-d6d97105842b	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555c-9cc7-b15b-d9a117d5f621	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555c-9cc7-0972-d7af1b3c2d25	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555c-9cc7-ee9f-2bcdfc55467e	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555c-9cc7-b4df-b69759917b61	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555c-9cc7-a958-433e7fa17b62	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555c-9cc7-eead-988095d1e916	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555c-9cc7-a0a3-68c6a4bf2ca5	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555c-9cc7-9840-ac7f5a0e9168	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555c-9cc7-8cfa-aed2e96c2fd0	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 4202779)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555c-9cc7-7306-66208605363a	00000000-555c-9cc7-b4df-b69759917b61	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555c-9cc7-d418-52d6fd272e1e	00000000-555c-9cc7-b4df-b69759917b61	00010000-555c-9cc7-c694-d108d1ee31c2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555c-9cc7-ba95-b7b011c55f61	00000000-555c-9cc7-a958-433e7fa17b62	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 4202790)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4202841)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 4202744)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555c-9cc7-b886-60d3c3db8f36	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555c-9cc7-5024-294ca4105de7	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555c-9cc7-a794-8ae49f8afef4	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555c-9cc7-ec9a-3d6959edb77d	Abonma-read	Abonma - branje	f
00030000-555c-9cc7-d004-0b883872f1f7	Abonma-write	Abonma - spreminjanje	f
00030000-555c-9cc7-f594-e53659709044	Alternacija-read	Alternacija - branje	f
00030000-555c-9cc7-5964-7d71d9f8455d	Alternacija-write	Alternacija - spreminjanje	f
00030000-555c-9cc7-c15e-628039cca29b	Arhivalija-read	Arhivalija - branje	f
00030000-555c-9cc7-575d-8b28b64e78c5	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555c-9cc7-b254-66c2ec546317	Besedilo-read	Besedilo - branje	f
00030000-555c-9cc7-8d4d-850e05f45f52	Besedilo-write	Besedilo - spreminjanje	f
00030000-555c-9cc7-434d-58e7d9ff0806	DogodekIzven-read	DogodekIzven - branje	f
00030000-555c-9cc7-7f5a-96568fb24912	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555c-9cc7-5466-0be00c6a3bf4	Dogodek-read	Dogodek - branje	f
00030000-555c-9cc7-e27b-fa49d64bc4f4	Dogodek-write	Dogodek - spreminjanje	f
00030000-555c-9cc7-b150-0dfbf5249c6d	Drzava-read	Drzava - branje	f
00030000-555c-9cc7-71d8-e060fc44c00e	Drzava-write	Drzava - spreminjanje	f
00030000-555c-9cc7-a913-da1338166fd5	Funkcija-read	Funkcija - branje	f
00030000-555c-9cc7-2334-e826f0979582	Funkcija-write	Funkcija - spreminjanje	f
00030000-555c-9cc7-8a4a-cae77e6926d1	Gostovanje-read	Gostovanje - branje	f
00030000-555c-9cc7-b5cd-59055a458975	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555c-9cc7-db49-e4a4d46da00b	Gostujoca-read	Gostujoca - branje	f
00030000-555c-9cc7-5e51-d5d924f004ed	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555c-9cc7-8654-55f6031d2f15	Kupec-read	Kupec - branje	f
00030000-555c-9cc7-b011-b5058a7fe891	Kupec-write	Kupec - spreminjanje	f
00030000-555c-9cc7-3c13-c056f29747ce	NacinPlacina-read	NacinPlacina - branje	f
00030000-555c-9cc7-f829-3f56095ad49e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555c-9cc7-c158-4f3fd8d74a69	Option-read	Option - branje	f
00030000-555c-9cc7-070f-31c30171dd1f	Option-write	Option - spreminjanje	f
00030000-555c-9cc7-72b8-fa68f0b53a94	OptionValue-read	OptionValue - branje	f
00030000-555c-9cc7-0e28-89a0f03a8761	OptionValue-write	OptionValue - spreminjanje	f
00030000-555c-9cc7-ad12-b627219fe525	Oseba-read	Oseba - branje	f
00030000-555c-9cc7-f1f1-b88c363ecfda	Oseba-write	Oseba - spreminjanje	f
00030000-555c-9cc7-4396-65ae6632e39d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555c-9cc7-2906-aa1b75122f8d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555c-9cc7-9b4a-2d67644a0cf6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555c-9cc7-099f-829112a18d7e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555c-9cc7-8be1-c5c129406b02	Pogodba-read	Pogodba - branje	f
00030000-555c-9cc7-2b42-ad3b4c006c6e	Pogodba-write	Pogodba - spreminjanje	f
00030000-555c-9cc7-a045-26420d2357e1	Popa-read	Popa - branje	f
00030000-555c-9cc7-7ec4-5381538060a9	Popa-write	Popa - spreminjanje	f
00030000-555c-9cc7-8e64-afae3e624a5d	Posta-read	Posta - branje	f
00030000-555c-9cc7-4221-e77528e19e2e	Posta-write	Posta - spreminjanje	f
00030000-555c-9cc7-eb88-260912b82d4e	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555c-9cc7-82ac-b921a535d18c	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555c-9cc7-0745-3cff14bac457	PostniNaslov-read	PostniNaslov - branje	f
00030000-555c-9cc7-deb3-c62893a8824b	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555c-9cc7-4bb8-7eb32bb406b3	Predstava-read	Predstava - branje	f
00030000-555c-9cc7-1700-2f3186b4f2d3	Predstava-write	Predstava - spreminjanje	f
00030000-555c-9cc7-82db-cb06ee2f5acf	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555c-9cc7-a2d7-4857953de98f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555c-9cc7-eea3-d3bf41cfc141	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555c-9cc7-963b-e80a537e8265	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555c-9cc7-0973-8556ee65d93d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555c-9cc7-a79f-05ad3c78eb93	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555c-9cc7-6e6e-b5d12ac534a4	Prostor-read	Prostor - branje	f
00030000-555c-9cc7-caa9-1bb9e9bf76a3	Prostor-write	Prostor - spreminjanje	f
00030000-555c-9cc7-f80e-a56ad7e49b3a	Racun-read	Racun - branje	f
00030000-555c-9cc7-ac81-6e5ef4167ebf	Racun-write	Racun - spreminjanje	f
00030000-555c-9cc7-b0bc-8622af96707d	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555c-9cc7-253d-38cd5870a3d1	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555c-9cc7-fcda-7bc101764ae0	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555c-9cc7-8da6-f0ee5d53a50c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555c-9cc7-3395-f380075e5df0	Rekvizit-read	Rekvizit - branje	f
00030000-555c-9cc7-6fda-d86c0923d0cd	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555c-9cc7-2282-55ab375c65be	Rezervacija-read	Rezervacija - branje	f
00030000-555c-9cc7-4bdf-209afb080b20	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555c-9cc7-1eaf-d8cbadde2976	SedezniRed-read	SedezniRed - branje	f
00030000-555c-9cc7-10ba-c9e3cc32ce88	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555c-9cc7-819c-a5b7787e8b53	Sedez-read	Sedez - branje	f
00030000-555c-9cc7-eee1-ae35cfbbfe64	Sedez-write	Sedez - spreminjanje	f
00030000-555c-9cc7-8fd5-995be93ffc3c	Sezona-read	Sezona - branje	f
00030000-555c-9cc7-9a1e-6a3a65c90d8d	Sezona-write	Sezona - spreminjanje	f
00030000-555c-9cc7-00c2-14706574107a	Telefonska-read	Telefonska - branje	f
00030000-555c-9cc7-ead6-73ac94985403	Telefonska-write	Telefonska - spreminjanje	f
00030000-555c-9cc7-5603-d0512505352c	TerminStoritve-read	TerminStoritve - branje	f
00030000-555c-9cc7-51b6-0c3237b8a368	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555c-9cc7-6f98-638fee43d4d2	TipFunkcije-read	TipFunkcije - branje	f
00030000-555c-9cc7-076e-86d79d781962	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555c-9cc7-23d3-16dff3847cd6	Trr-read	Trr - branje	f
00030000-555c-9cc7-506f-a73b81e662b8	Trr-write	Trr - spreminjanje	f
00030000-555c-9cc7-bca6-0ac8a67ec7bc	Uprizoritev-read	Uprizoritev - branje	f
00030000-555c-9cc7-f1ec-2fe62ce1970c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555c-9cc7-b6e2-e97f4e4361bd	Vaja-read	Vaja - branje	f
00030000-555c-9cc7-9d11-a877d65e0010	Vaja-write	Vaja - spreminjanje	f
00030000-555c-9cc7-e916-4a48a416af42	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555c-9cc7-3e54-e37ae0d2cbca	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555c-9cc7-94bf-fd600695df23	Zaposlitev-read	Zaposlitev - branje	f
00030000-555c-9cc7-32dc-fb69b0724170	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555c-9cc7-5064-38c8179d1b70	Zasedenost-read	Zasedenost - branje	f
00030000-555c-9cc7-6d0a-91a722e6a26a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555c-9cc7-403d-80f822478e26	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555c-9cc7-af4b-e355b064efb1	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555c-9cc7-df3c-66b9b325c21f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555c-9cc7-098d-7238c7667486	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 4202763)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555c-9cc7-3309-d8838399d210	00030000-555c-9cc7-b150-0dfbf5249c6d
00020000-555c-9cc7-d0eb-b0248a52ce5d	00030000-555c-9cc7-71d8-e060fc44c00e
00020000-555c-9cc7-d0eb-b0248a52ce5d	00030000-555c-9cc7-b150-0dfbf5249c6d
\.


--
-- TOC entry 2663 (class 0 OID 4203047)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4203077)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4203192)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4202821)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4202863)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555c-9cc6-d49b-4635e4e3e0e1	8341	Adlešiči
00050000-555c-9cc6-495b-815483adc352	5270	Ajdovščina
00050000-555c-9cc6-5df9-1d2d815d7c26	6280	Ankaran/Ancarano
00050000-555c-9cc6-6cb2-01c6e002433f	9253	Apače
00050000-555c-9cc6-a310-8bc03bfe24d7	8253	Artiče
00050000-555c-9cc6-81a8-9c8dcb56c6ec	4275	Begunje na Gorenjskem
00050000-555c-9cc6-e9be-81d333ce0709	1382	Begunje pri Cerknici
00050000-555c-9cc6-3de8-d0dbcc9409ba	9231	Beltinci
00050000-555c-9cc6-21f3-f41a98deb9a9	2234	Benedikt
00050000-555c-9cc6-b0ca-bf7f31b08414	2345	Bistrica ob Dravi
00050000-555c-9cc6-8a8f-847cc8a2ac27	3256	Bistrica ob Sotli
00050000-555c-9cc6-f7b1-1bc1afedcef4	8259	Bizeljsko
00050000-555c-9cc6-1e3a-ca57fd2213d2	1223	Blagovica
00050000-555c-9cc6-d8d8-8e55547698a6	8283	Blanca
00050000-555c-9cc6-85e1-4f6605f822a9	4260	Bled
00050000-555c-9cc6-f191-c0e248f60221	4273	Blejska Dobrava
00050000-555c-9cc6-6b89-f8f379a2664f	9265	Bodonci
00050000-555c-9cc6-904a-dc58b4c4c424	9222	Bogojina
00050000-555c-9cc6-e45f-4841eed85f16	4263	Bohinjska Bela
00050000-555c-9cc6-a930-45513d59de60	4264	Bohinjska Bistrica
00050000-555c-9cc6-64fc-b0c866e2cbbd	4265	Bohinjsko jezero
00050000-555c-9cc6-67ec-b8df9590fa67	1353	Borovnica
00050000-555c-9cc6-01f2-dc80834e2838	8294	Boštanj
00050000-555c-9cc6-f975-61734611c3cf	5230	Bovec
00050000-555c-9cc6-849f-af0678efa21a	5295	Branik
00050000-555c-9cc6-75f6-74a14d64c188	3314	Braslovče
00050000-555c-9cc6-3d8c-949a69046e69	5223	Breginj
00050000-555c-9cc6-70e8-76a5647e2fe3	8280	Brestanica
00050000-555c-9cc6-dd82-15774d941784	2354	Bresternica
00050000-555c-9cc6-ca92-36028424dce4	4243	Brezje
00050000-555c-9cc6-8975-f5e2d66b40bf	1351	Brezovica pri Ljubljani
00050000-555c-9cc6-95f2-af06aa018c81	8250	Brežice
00050000-555c-9cc6-ed1f-e1c7e7877ef2	4210	Brnik - Aerodrom
00050000-555c-9cc6-1b52-16a5879cc860	8321	Brusnice
00050000-555c-9cc6-db02-be9cbaf761db	3255	Buče
00050000-555c-9cc6-fdcd-42326a70339c	8276	Bučka 
00050000-555c-9cc6-5dd9-73e50adb42c8	9261	Cankova
00050000-555c-9cc6-7596-823c35bf53b9	3000	Celje 
00050000-555c-9cc6-14d6-00af7d60ee26	3001	Celje - poštni predali
00050000-555c-9cc6-afcf-5cae46f32008	4207	Cerklje na Gorenjskem
00050000-555c-9cc6-6102-93e56912e327	8263	Cerklje ob Krki
00050000-555c-9cc6-c538-ff83ad71d1a6	1380	Cerknica
00050000-555c-9cc6-9f9f-04fa83d4c992	5282	Cerkno
00050000-555c-9cc6-dd94-5ec0c91c22a5	2236	Cerkvenjak
00050000-555c-9cc6-9413-35cd577ee293	2215	Ceršak
00050000-555c-9cc6-af37-71388eb4089e	2326	Cirkovce
00050000-555c-9cc6-0871-f133906d40fb	2282	Cirkulane
00050000-555c-9cc6-ff79-786982cb7331	5273	Col
00050000-555c-9cc6-07e6-11bc155c8790	8251	Čatež ob Savi
00050000-555c-9cc6-3550-028b1411296d	1413	Čemšenik
00050000-555c-9cc6-b5a1-ba6c88f17904	5253	Čepovan
00050000-555c-9cc6-3803-ebb768b079d3	9232	Črenšovci
00050000-555c-9cc6-dd9e-de49a790374e	2393	Črna na Koroškem
00050000-555c-9cc6-40b0-72a468654ca0	6275	Črni Kal
00050000-555c-9cc6-16eb-b3cefdf8d6f1	5274	Črni Vrh nad Idrijo
00050000-555c-9cc6-cae6-39915ce538d3	5262	Črniče
00050000-555c-9cc6-359c-c9eb216bfce2	8340	Črnomelj
00050000-555c-9cc6-d345-e5b30caf8078	6271	Dekani
00050000-555c-9cc6-78c8-d0d7bd1b0553	5210	Deskle
00050000-555c-9cc6-400b-c5e5db584bb5	2253	Destrnik
00050000-555c-9cc6-1324-10c35c43eed0	6215	Divača
00050000-555c-9cc6-4fe8-34754b3839df	1233	Dob
00050000-555c-9cc6-8013-33c0ec3b75a0	3224	Dobje pri Planini
00050000-555c-9cc6-9b9c-35d72fb64b47	8257	Dobova
00050000-555c-9cc6-181e-4481054e1e38	1423	Dobovec
00050000-555c-9cc6-08f8-ce81d8530c7f	5263	Dobravlje
00050000-555c-9cc6-f62c-c1c21d14b5de	3204	Dobrna
00050000-555c-9cc6-403f-35e9e8c9dc0c	8211	Dobrnič
00050000-555c-9cc6-1986-bbbded110cad	1356	Dobrova
00050000-555c-9cc6-fb13-5a82af97fae1	9223	Dobrovnik/Dobronak 
00050000-555c-9cc6-5dbb-2154007cbfed	5212	Dobrovo v Brdih
00050000-555c-9cc6-6b4f-2f2f654b75f5	1431	Dol pri Hrastniku
00050000-555c-9cc6-d55c-7e7270bbbb54	1262	Dol pri Ljubljani
00050000-555c-9cc6-7fdf-0bfab7021013	1273	Dole pri Litiji
00050000-555c-9cc6-3237-86717bd16958	1331	Dolenja vas
00050000-555c-9cc6-619a-e76042e6ea36	8350	Dolenjske Toplice
00050000-555c-9cc6-9fd3-f69558564dc6	1230	Domžale
00050000-555c-9cc6-97c6-23626fce679e	2252	Dornava
00050000-555c-9cc6-9a34-bbe46f0986ce	5294	Dornberk
00050000-555c-9cc6-1196-496cda0c8fa0	1319	Draga
00050000-555c-9cc6-144d-3fe59909eed6	8343	Dragatuš
00050000-555c-9cc6-fb7f-914e6845f7c1	3222	Dramlje
00050000-555c-9cc6-aa7c-0c127bfde9de	2370	Dravograd
00050000-555c-9cc6-55ff-921f77d6da28	4203	Duplje
00050000-555c-9cc6-536a-0494463a10c9	6221	Dutovlje
00050000-555c-9cc6-e936-9c26ca01349b	8361	Dvor
00050000-555c-9cc6-2520-07f3881c81c1	2343	Fala
00050000-555c-9cc6-a1b0-254a7396dedc	9208	Fokovci
00050000-555c-9cc6-a577-eee39d1a31d5	2313	Fram
00050000-555c-9cc6-a1ad-572fc5358ecb	3213	Frankolovo
00050000-555c-9cc6-2527-a6a0dcc278bc	1274	Gabrovka
00050000-555c-9cc6-b870-dc9ed3d7bac0	8254	Globoko
00050000-555c-9cc6-2932-6468fb691051	5275	Godovič
00050000-555c-9cc6-5b12-60a6b4e98b7a	4204	Golnik
00050000-555c-9cc6-0fb5-6c0815ce9018	3303	Gomilsko
00050000-555c-9cc6-4d4b-2c1d196898d7	4224	Gorenja vas
00050000-555c-9cc6-5b60-c612581f35dd	3263	Gorica pri Slivnici
00050000-555c-9cc6-9e4a-bced93f28f49	2272	Gorišnica
00050000-555c-9cc6-9713-d3bb63e3b7ff	9250	Gornja Radgona
00050000-555c-9cc6-c8a2-ff9f0b489ba9	3342	Gornji Grad
00050000-555c-9cc6-6d3f-e47b16fa1f3a	4282	Gozd Martuljek
00050000-555c-9cc6-1e08-6820db6c319a	6272	Gračišče
00050000-555c-9cc6-808b-d01577c8aa1d	9264	Grad
00050000-555c-9cc6-588c-ba208ee104a4	8332	Gradac
00050000-555c-9cc6-d4b0-cbaa5a73aff3	1384	Grahovo
00050000-555c-9cc6-1fd1-8d1457d66878	5242	Grahovo ob Bači
00050000-555c-9cc6-43c7-2242b6b7ac5b	5251	Grgar
00050000-555c-9cc6-ad8e-e86a885d6c6e	3302	Griže
00050000-555c-9cc6-96ab-cc81dc370ca7	3231	Grobelno
00050000-555c-9cc6-64f2-6f243df6b64f	1290	Grosuplje
00050000-555c-9cc6-839d-a268b67d411a	2288	Hajdina
00050000-555c-9cc6-afa1-9042f3d01e79	8362	Hinje
00050000-555c-9cc6-9470-571c9bf89579	2311	Hoče
00050000-555c-9cc6-4fbf-88b77aeb9a70	9205	Hodoš/Hodos
00050000-555c-9cc6-137e-7a896aed65a7	1354	Horjul
00050000-555c-9cc6-bbb8-67fea70dec56	1372	Hotedršica
00050000-555c-9cc6-edba-61a8c0c48ea3	1430	Hrastnik
00050000-555c-9cc6-b7ca-fa782acbbbcf	6225	Hruševje
00050000-555c-9cc6-2711-ca2439cc095e	4276	Hrušica
00050000-555c-9cc6-6247-895e24657063	5280	Idrija
00050000-555c-9cc6-76f3-cdcc4ca5083b	1292	Ig
00050000-555c-9cc6-77c9-fe24b046f97a	6250	Ilirska Bistrica
00050000-555c-9cc6-80b1-284f83c501b0	6251	Ilirska Bistrica-Trnovo
00050000-555c-9cc6-9ae8-62ce148b1b35	1295	Ivančna Gorica
00050000-555c-9cc6-377a-8e223a630ac7	2259	Ivanjkovci
00050000-555c-9cc6-bcf4-eb248402cbe9	1411	Izlake
00050000-555c-9cc6-83ef-050b0b94f70d	6310	Izola/Isola
00050000-555c-9cc6-2331-36c1dc819e97	2222	Jakobski Dol
00050000-555c-9cc6-14ac-fb6fe36c8fff	2221	Jarenina
00050000-555c-9cc6-d2c0-496a03970045	6254	Jelšane
00050000-555c-9cc6-e03c-46d3f86cebec	4270	Jesenice
00050000-555c-9cc6-4863-729c6c94768d	8261	Jesenice na Dolenjskem
00050000-555c-9cc6-1779-23ba8e690eed	3273	Jurklošter
00050000-555c-9cc6-b72f-a078b1821555	2223	Jurovski Dol
00050000-555c-9cc6-1f18-9f3831fc01f3	2256	Juršinci
00050000-555c-9cc6-1ac1-c77e642352f4	5214	Kal nad Kanalom
00050000-555c-9cc6-0c52-72e01abe05e0	3233	Kalobje
00050000-555c-9cc6-34b7-dbdc2effc051	4246	Kamna Gorica
00050000-555c-9cc6-12fe-7e3dba1feb3d	2351	Kamnica
00050000-555c-9cc6-58f1-7835a5042eff	1241	Kamnik
00050000-555c-9cc6-d746-7111dd2a7d40	5213	Kanal
00050000-555c-9cc6-0890-802f7689879a	8258	Kapele
00050000-555c-9cc6-c408-cc30882696e9	2362	Kapla
00050000-555c-9cc6-4ab9-f8245f780497	2325	Kidričevo
00050000-555c-9cc6-3956-2453ecbc842a	1412	Kisovec
00050000-555c-9cc6-e467-c1d054ebce0c	6253	Knežak
00050000-555c-9cc6-7c80-86e769e18b54	5222	Kobarid
00050000-555c-9cc6-96df-0dc7dad9f514	9227	Kobilje
00050000-555c-9cc6-dd2b-4c84fbdb9490	1330	Kočevje
00050000-555c-9cc6-057f-511e3850fedb	1338	Kočevska Reka
00050000-555c-9cc6-4c11-ae4423c4d1dc	2276	Kog
00050000-555c-9cc6-07aa-bb76320a4ecd	5211	Kojsko
00050000-555c-9cc6-1bf7-522266e7643a	6223	Komen
00050000-555c-9cc6-5877-6ad07735749f	1218	Komenda
00050000-555c-9cc6-03ac-60e933e6e81f	6000	Koper/Capodistria 
00050000-555c-9cc6-272f-c40a22756450	6001	Koper/Capodistria - poštni predali
00050000-555c-9cc6-ed5c-02079e81f728	8282	Koprivnica
00050000-555c-9cc6-8a3d-19d7f4bd03b3	5296	Kostanjevica na Krasu
00050000-555c-9cc6-8f5b-5e1458932a7a	8311	Kostanjevica na Krki
00050000-555c-9cc6-1573-2dba65d2dd12	1336	Kostel
00050000-555c-9cc6-8a28-a4fb0fd2aece	6256	Košana
00050000-555c-9cc6-9237-cce1ac9179d0	2394	Kotlje
00050000-555c-9cc6-fbf0-f550055aa082	6240	Kozina
00050000-555c-9cc6-9e22-70f3e385dccf	3260	Kozje
00050000-555c-9cc6-8e07-9476c90046d7	4000	Kranj 
00050000-555c-9cc6-51e6-6d9af5cfc310	4001	Kranj - poštni predali
00050000-555c-9cc6-127e-94330b04d8a7	4280	Kranjska Gora
00050000-555c-9cc6-9a21-e692dfe5047d	1281	Kresnice
00050000-555c-9cc6-10ca-a19f5f903a96	4294	Križe
00050000-555c-9cc6-4088-67008bd6403f	9206	Križevci
00050000-555c-9cc6-4437-5ee54e598eb2	9242	Križevci pri Ljutomeru
00050000-555c-9cc6-b217-14dc3b8b491f	1301	Krka
00050000-555c-9cc6-46aa-d9a2e0b4cbeb	8296	Krmelj
00050000-555c-9cc6-4009-59a115db0620	4245	Kropa
00050000-555c-9cc6-426f-ab9bb2c3e3dd	8262	Krška vas
00050000-555c-9cc6-afa2-8e5cb5da6eb6	8270	Krško
00050000-555c-9cc6-8c77-f1f8718e2303	9263	Kuzma
00050000-555c-9cc6-b685-f675b21a0129	2318	Laporje
00050000-555c-9cc6-0249-5e77e81787bb	3270	Laško
00050000-555c-9cc6-10ce-a5ce0d68944e	1219	Laze v Tuhinju
00050000-555c-9cc6-d4ab-a222766cf0b6	2230	Lenart v Slovenskih goricah
00050000-555c-9cc6-d8c2-dcafd4b6024a	9220	Lendava/Lendva
00050000-555c-9cc6-5379-36b180bfda44	4248	Lesce
00050000-555c-9cc6-aec5-9b6c4fe13eb4	3261	Lesično
00050000-555c-9cc6-5e79-2211433fae84	8273	Leskovec pri Krškem
00050000-555c-9cc6-f333-495be42e6896	2372	Libeliče
00050000-555c-9cc6-0529-4b37e2290ec3	2341	Limbuš
00050000-555c-9cc6-a5b1-7f3748a05b07	1270	Litija
00050000-555c-9cc6-5765-790e20948a19	3202	Ljubečna
00050000-555c-9cc6-8c71-e8887cd31644	1000	Ljubljana 
00050000-555c-9cc6-2b4f-3aae8d32205f	1001	Ljubljana - poštni predali
00050000-555c-9cc6-7832-c30033b54678	1231	Ljubljana - Črnuče
00050000-555c-9cc6-e4ec-b39914f03959	1261	Ljubljana - Dobrunje
00050000-555c-9cc6-12a5-e57eb01a0a13	1260	Ljubljana - Polje
00050000-555c-9cc6-9f59-19c306782469	1210	Ljubljana - Šentvid
00050000-555c-9cc6-75c2-4c5c09d1e1ae	1211	Ljubljana - Šmartno
00050000-555c-9cc6-7fdf-8c92e11ba69b	3333	Ljubno ob Savinji
00050000-555c-9cc6-ba5e-fce0b7f193be	9240	Ljutomer
00050000-555c-9cc6-c9f1-98dade1595db	3215	Loče
00050000-555c-9cc6-2ac2-77b6193a734e	5231	Log pod Mangartom
00050000-555c-9cc6-022c-f8f8abdc998a	1358	Log pri Brezovici
00050000-555c-9cc6-7bc1-fcb9e3c539b8	1370	Logatec
00050000-555c-9cc6-fd1a-eacfa9cfa1b2	1371	Logatec
00050000-555c-9cc6-795d-c4973d0beb08	1434	Loka pri Zidanem Mostu
00050000-555c-9cc6-da25-8f8f1ef1d2de	3223	Loka pri Žusmu
00050000-555c-9cc6-e2af-fe828e62014d	6219	Lokev
00050000-555c-9cc6-458c-c7a15718290b	1318	Loški Potok
00050000-555c-9cc6-24a5-4773330bb4ef	2324	Lovrenc na Dravskem polju
00050000-555c-9cc6-0f49-63323780c2d0	2344	Lovrenc na Pohorju
00050000-555c-9cc6-df27-7464726fb0bf	3334	Luče
00050000-555c-9cc6-b928-cb9494120b0d	1225	Lukovica
00050000-555c-9cc6-b1c7-478adcd71609	9202	Mačkovci
00050000-555c-9cc6-1a0b-0f55955f9ff1	2322	Majšperk
00050000-555c-9cc6-f9b1-476d77aa3bac	2321	Makole
00050000-555c-9cc6-5eed-32d55a0bf553	9243	Mala Nedelja
00050000-555c-9cc6-2f8a-4fc464c394a0	2229	Malečnik
00050000-555c-9cc6-c4d4-f66d284a73e1	6273	Marezige
00050000-555c-9cc6-6dd9-b1287e7530de	2000	Maribor 
00050000-555c-9cc6-225c-8d9f6229e585	2001	Maribor - poštni predali
00050000-555c-9cc6-3215-c35d2e7b4dec	2206	Marjeta na Dravskem polju
00050000-555c-9cc6-d8cd-352cef26a89f	2281	Markovci
00050000-555c-9cc6-5a38-bee6773dcde8	9221	Martjanci
00050000-555c-9cc6-1987-a7a604239fa2	6242	Materija
00050000-555c-9cc6-9e13-90e0162951fb	4211	Mavčiče
00050000-555c-9cc6-831d-1b45eac54b6e	1215	Medvode
00050000-555c-9cc6-f8f4-23f7eb1731de	1234	Mengeš
00050000-555c-9cc6-b6ee-6bd130d3d3d9	8330	Metlika
00050000-555c-9cc6-d24c-c9edb69d84e8	2392	Mežica
00050000-555c-9cc6-15ca-7d6375f1219c	2204	Miklavž na Dravskem polju
00050000-555c-9cc6-088a-2e08052e6f96	2275	Miklavž pri Ormožu
00050000-555c-9cc6-8150-459edfd4b301	5291	Miren
00050000-555c-9cc6-596c-9fe54cb84ee7	8233	Mirna
00050000-555c-9cc6-3b21-d030966d4e2d	8216	Mirna Peč
00050000-555c-9cc6-fb28-b0fbda861c7c	2382	Mislinja
00050000-555c-9cc6-666d-92d121fd82ca	4281	Mojstrana
00050000-555c-9cc6-75de-5521f3fb0bb4	8230	Mokronog
00050000-555c-9cc6-60d0-cfd1161ed3dc	1251	Moravče
00050000-555c-9cc6-6c0c-be996e0a4be5	9226	Moravske Toplice
00050000-555c-9cc6-77d1-5d33c93b5066	5216	Most na Soči
00050000-555c-9cc6-b662-3b28d2b3299d	1221	Motnik
00050000-555c-9cc6-48b5-34492309fbcd	3330	Mozirje
00050000-555c-9cc6-286a-a60dfe83ec99	9000	Murska Sobota 
00050000-555c-9cc6-bb44-20b0c51ca228	9001	Murska Sobota - poštni predali
00050000-555c-9cc6-e045-d814e6e3f2ad	2366	Muta
00050000-555c-9cc6-e374-0df42f8a0275	4202	Naklo
00050000-555c-9cc6-9c78-5e7d0197c7d1	3331	Nazarje
00050000-555c-9cc6-ef88-c43d766fcc45	1357	Notranje Gorice
00050000-555c-9cc6-c078-c46b01115d10	3203	Nova Cerkev
00050000-555c-9cc6-ba28-5abfb0311684	5000	Nova Gorica 
00050000-555c-9cc6-e13f-7f95485ab9ef	5001	Nova Gorica - poštni predali
00050000-555c-9cc6-2cc3-e99bfb8f7594	1385	Nova vas
00050000-555c-9cc6-825f-d454c513d9d2	8000	Novo mesto
00050000-555c-9cc6-fd54-b6247c8e9ebb	8001	Novo mesto - poštni predali
00050000-555c-9cc6-8b23-cd293a7ec405	6243	Obrov
00050000-555c-9cc6-1e83-cf5c79d8b254	9233	Odranci
00050000-555c-9cc6-af08-075bcb36c8e7	2317	Oplotnica
00050000-555c-9cc6-ab05-55fb702eb3f4	2312	Orehova vas
00050000-555c-9cc6-ff83-590c3bb967ed	2270	Ormož
00050000-555c-9cc6-d24c-eb6d20c17881	1316	Ortnek
00050000-555c-9cc6-b2c2-38316da1a586	1337	Osilnica
00050000-555c-9cc6-f368-84d897e8bcd5	8222	Otočec
00050000-555c-9cc6-d90b-15348e14e3ff	2361	Ožbalt
00050000-555c-9cc6-9269-995b8ef0f6b0	2231	Pernica
00050000-555c-9cc6-ba2f-34c8b1aee412	2211	Pesnica pri Mariboru
00050000-555c-9cc6-b2f0-437e1eb958ca	9203	Petrovci
00050000-555c-9cc6-e7e0-e596ca0c2187	3301	Petrovče
00050000-555c-9cc6-d693-9171f9795709	6330	Piran/Pirano
00050000-555c-9cc6-7937-75de378df43c	8255	Pišece
00050000-555c-9cc6-6472-fea108e2a65d	6257	Pivka
00050000-555c-9cc6-6e2e-725acb69722f	6232	Planina
00050000-555c-9cc6-7597-fff1bdcdd323	3225	Planina pri Sevnici
00050000-555c-9cc6-1363-6809c99750e5	6276	Pobegi
00050000-555c-9cc6-4530-b0cb239d2c31	8312	Podbočje
00050000-555c-9cc6-338d-d22a4c49e37b	5243	Podbrdo
00050000-555c-9cc6-f81f-2851c9bf7001	3254	Podčetrtek
00050000-555c-9cc6-08e7-479bd72acfbc	2273	Podgorci
00050000-555c-9cc6-bbd6-c7cee78dc2a7	6216	Podgorje
00050000-555c-9cc6-0e50-9213f91b4097	2381	Podgorje pri Slovenj Gradcu
00050000-555c-9cc6-49c6-86ff043a13bc	6244	Podgrad
00050000-555c-9cc6-7ef8-696579ec1943	1414	Podkum
00050000-555c-9cc6-f93a-ace4ea15e5cb	2286	Podlehnik
00050000-555c-9cc6-4945-45aba5beb787	5272	Podnanos
00050000-555c-9cc6-a8a7-6aea902981b7	4244	Podnart
00050000-555c-9cc6-963a-07db3cdbed8e	3241	Podplat
00050000-555c-9cc6-41e6-f4b0289c71ca	3257	Podsreda
00050000-555c-9cc6-137e-1004eb70a83c	2363	Podvelka
00050000-555c-9cc6-1ec3-729db322e212	2208	Pohorje
00050000-555c-9cc6-999d-478f8f661b2f	2257	Polenšak
00050000-555c-9cc6-ff2a-0c226b15be54	1355	Polhov Gradec
00050000-555c-9cc6-ba11-2ca258977ec0	4223	Poljane nad Škofjo Loko
00050000-555c-9cc6-a377-6f9a02df2272	2319	Poljčane
00050000-555c-9cc6-4a8e-13beaa3bd9d0	1272	Polšnik
00050000-555c-9cc6-3e55-6680682088bd	3313	Polzela
00050000-555c-9cc6-6780-cd8cdf45ae09	3232	Ponikva
00050000-555c-9cc6-2296-b57a84c2c20b	6320	Portorož/Portorose
00050000-555c-9cc6-7705-18a4337bef23	6230	Postojna
00050000-555c-9cc6-9f10-88d86109127b	2331	Pragersko
00050000-555c-9cc6-062e-b5f32ace74af	3312	Prebold
00050000-555c-9cc6-7f64-f373aa45562a	4205	Preddvor
00050000-555c-9cc6-bce4-8d614c6a45fa	6255	Prem
00050000-555c-9cc6-e379-85d15f24b3a2	1352	Preserje
00050000-555c-9cc6-6db3-276777508f65	6258	Prestranek
00050000-555c-9cc6-5a74-72ac6a2858c7	2391	Prevalje
00050000-555c-9cc6-56b5-84f04c448dad	3262	Prevorje
00050000-555c-9cc6-f754-17ac181e535a	1276	Primskovo 
00050000-555c-9cc6-78c3-a7646e46ce5d	3253	Pristava pri Mestinju
00050000-555c-9cc6-bf62-b8c853b55f8e	9207	Prosenjakovci/Partosfalva
00050000-555c-9cc6-80b4-7153698aefcd	5297	Prvačina
00050000-555c-9cc6-6457-05fc575ff35f	2250	Ptuj
00050000-555c-9cc6-7ef3-32ac4677faa4	2323	Ptujska Gora
00050000-555c-9cc6-6410-0081afc3538d	9201	Puconci
00050000-555c-9cc6-75b2-336219f4cf16	2327	Rače
00050000-555c-9cc6-6a63-656aacc796d2	1433	Radeče
00050000-555c-9cc6-09bd-ec55a20b2ef4	9252	Radenci
00050000-555c-9cc6-7420-48db0026274f	2360	Radlje ob Dravi
00050000-555c-9cc6-cf66-752c9656be08	1235	Radomlje
00050000-555c-9cc6-868b-07a61d9afb49	4240	Radovljica
00050000-555c-9cc6-69e1-ab0c370f567b	8274	Raka
00050000-555c-9cc6-463f-6416c13ffb08	1381	Rakek
00050000-555c-9cc6-a4f9-7fb029aa24f0	4283	Rateče - Planica
00050000-555c-9cc6-e2f5-7f7bba0f5e55	2390	Ravne na Koroškem
00050000-555c-9cc6-8e05-9748e2fc8b8a	9246	Razkrižje
00050000-555c-9cc6-8afa-318e46c524cf	3332	Rečica ob Savinji
00050000-555c-9cc6-c5f8-82f4921b3502	5292	Renče
00050000-555c-9cc6-bc39-9f2f0ffb75a4	1310	Ribnica
00050000-555c-9cc6-fd56-71e337d2202f	2364	Ribnica na Pohorju
00050000-555c-9cc6-469c-5433e6509062	3272	Rimske Toplice
00050000-555c-9cc6-13c5-1418a46a2b5d	1314	Rob
00050000-555c-9cc6-e9bc-91cc947ea19d	5215	Ročinj
00050000-555c-9cc6-32bf-fb9ed6e3818d	3250	Rogaška Slatina
00050000-555c-9cc6-724b-b5803e06234b	9262	Rogašovci
00050000-555c-9cc6-dea4-f0571c1b7ae5	3252	Rogatec
00050000-555c-9cc6-86f3-dbbafc5c5c38	1373	Rovte
00050000-555c-9cc6-0fb4-8b96c01d65c5	2342	Ruše
00050000-555c-9cc6-4c82-70565e6288d7	1282	Sava
00050000-555c-9cc6-c4d0-4c88fe0f0f04	6333	Sečovlje/Sicciole
00050000-555c-9cc6-25fe-aad0f0d3b756	4227	Selca
00050000-555c-9cc6-c069-18e8a6427012	2352	Selnica ob Dravi
00050000-555c-9cc6-5c5b-bef5c73b9971	8333	Semič
00050000-555c-9cc6-8d21-e5238c705e15	8281	Senovo
00050000-555c-9cc6-49ab-6a2b34ed7764	6224	Senožeče
00050000-555c-9cc6-74fa-7300968ae0e1	8290	Sevnica
00050000-555c-9cc6-a379-2793688c27e3	6210	Sežana
00050000-555c-9cc6-7358-c937e606d78d	2214	Sladki Vrh
00050000-555c-9cc6-503c-9a41eb23941b	5283	Slap ob Idrijci
00050000-555c-9cc6-46a5-d579c131dfd3	2380	Slovenj Gradec
00050000-555c-9cc6-c961-f89142abd6fc	2310	Slovenska Bistrica
00050000-555c-9cc6-c503-a031fa571a9f	3210	Slovenske Konjice
00050000-555c-9cc6-5a68-504e606ec5cf	1216	Smlednik
00050000-555c-9cc6-0f94-5cf034530389	5232	Soča
00050000-555c-9cc6-6e55-be3bb527a5cc	1317	Sodražica
00050000-555c-9cc6-4351-6d59cad8c569	3335	Solčava
00050000-555c-9cc6-5c6b-43321df11b9b	5250	Solkan
00050000-555c-9cc6-097b-8701b1edc5e5	4229	Sorica
00050000-555c-9cc6-8b1c-9c428171fb3a	4225	Sovodenj
00050000-555c-9cc6-75db-fe413d0f98d1	5281	Spodnja Idrija
00050000-555c-9cc6-c15e-bc6730178b67	2241	Spodnji Duplek
00050000-555c-9cc6-2e98-9afa0e08db05	9245	Spodnji Ivanjci
00050000-555c-9cc6-951f-bfa99437255b	2277	Središče ob Dravi
00050000-555c-9cc6-2339-0af0b9081f4e	4267	Srednja vas v Bohinju
00050000-555c-9cc6-e129-045ec46a8589	8256	Sromlje 
00050000-555c-9cc6-9aea-42fa03e7c7bc	5224	Srpenica
00050000-555c-9cc6-acc3-761a09bc2130	1242	Stahovica
00050000-555c-9cc6-9b2c-e6e753fdb668	1332	Stara Cerkev
00050000-555c-9cc6-c468-16ad79028998	8342	Stari trg ob Kolpi
00050000-555c-9cc6-07c8-d7823bfcf150	1386	Stari trg pri Ložu
00050000-555c-9cc6-dcb8-2a72a962aafe	2205	Starše
00050000-555c-9cc6-b6eb-16b689d13afd	2289	Stoperce
00050000-555c-9cc6-5411-96ad8e230d13	8322	Stopiče
00050000-555c-9cc6-7226-19edb0ed3bc1	3206	Stranice
00050000-555c-9cc6-2c46-d691443bdbc8	8351	Straža
00050000-555c-9cc6-578a-dbda8a50acca	1313	Struge
00050000-555c-9cc6-e81f-5127687cbb0a	8293	Studenec
00050000-555c-9cc6-8eed-60137526a748	8331	Suhor
00050000-555c-9cc6-6051-ad442d29c93a	2233	Sv. Ana v Slovenskih goricah
00050000-555c-9cc6-6ea9-ff6e14e54f5e	2235	Sv. Trojica v Slovenskih goricah
00050000-555c-9cc6-76e1-e655cb285e75	2353	Sveti Duh na Ostrem Vrhu
00050000-555c-9cc6-720e-069ad9d87ccd	9244	Sveti Jurij ob Ščavnici
00050000-555c-9cc6-b93f-1060e16d3f5c	3264	Sveti Štefan
00050000-555c-9cc6-acb6-d62e90fd9955	2258	Sveti Tomaž
00050000-555c-9cc6-c03f-c930ce6f2514	9204	Šalovci
00050000-555c-9cc6-3332-a6c1fba62363	5261	Šempas
00050000-555c-9cc6-7a0e-bd36f87de068	5290	Šempeter pri Gorici
00050000-555c-9cc6-6026-c0bcd21be3de	3311	Šempeter v Savinjski dolini
00050000-555c-9cc6-2878-384148a03372	4208	Šenčur
00050000-555c-9cc6-79c3-ad18c4eda932	2212	Šentilj v Slovenskih goricah
00050000-555c-9cc6-0eb5-2a4bcf6f82b3	8297	Šentjanž
00050000-555c-9cc6-ed60-a02f9e325693	2373	Šentjanž pri Dravogradu
00050000-555c-9cc6-b729-fd35651ab952	8310	Šentjernej
00050000-555c-9cc6-64b0-2c0f13a06f2d	3230	Šentjur
00050000-555c-9cc6-7922-e7a070e1a980	3271	Šentrupert
00050000-555c-9cc6-399c-115a637cee37	8232	Šentrupert
00050000-555c-9cc6-3714-783bc2fad9a7	1296	Šentvid pri Stični
00050000-555c-9cc6-2abd-0fb9396084d0	8275	Škocjan
00050000-555c-9cc6-a826-884cf8ef064a	6281	Škofije
00050000-555c-9cc6-010c-4ff413d27399	4220	Škofja Loka
00050000-555c-9cc6-342e-6d679169429d	3211	Škofja vas
00050000-555c-9cc6-1870-224db8a7b61d	1291	Škofljica
00050000-555c-9cc6-3c19-d7248f775c6d	6274	Šmarje
00050000-555c-9cc6-9053-3c1fd2ade3e0	1293	Šmarje - Sap
00050000-555c-9cc6-946a-4fb1345106e9	3240	Šmarje pri Jelšah
00050000-555c-9cc6-0ecd-eaa8ac55f186	8220	Šmarješke Toplice
00050000-555c-9cc6-45a3-9d2b063e8902	2315	Šmartno na Pohorju
00050000-555c-9cc6-b623-4dd06d9d8592	3341	Šmartno ob Dreti
00050000-555c-9cc6-cb31-943ca84a0620	3327	Šmartno ob Paki
00050000-555c-9cc6-1551-6e7f69bfed6e	1275	Šmartno pri Litiji
00050000-555c-9cc6-0e09-b086d8b91020	2383	Šmartno pri Slovenj Gradcu
00050000-555c-9cc6-fb81-6e25d8c2f2f1	3201	Šmartno v Rožni dolini
00050000-555c-9cc6-faba-865ec2292260	3325	Šoštanj
00050000-555c-9cc6-61ba-e6938e16c747	6222	Štanjel
00050000-555c-9cc6-1015-af19174295a6	3220	Štore
00050000-555c-9cc6-2614-72a8d4cf772e	3304	Tabor
00050000-555c-9cc6-fc2e-62e2fcc0cd95	3221	Teharje
00050000-555c-9cc6-99a6-9e78ef6cd43d	9251	Tišina
00050000-555c-9cc6-e9f8-d252d064d2b5	5220	Tolmin
00050000-555c-9cc6-9bcc-58006728b608	3326	Topolšica
00050000-555c-9cc6-20db-372af94f18a0	2371	Trbonje
00050000-555c-9cc6-5452-0a9f3bac5f49	1420	Trbovlje
00050000-555c-9cc6-63d7-72a31d91b969	8231	Trebelno 
00050000-555c-9cc6-9157-97bc203acb8e	8210	Trebnje
00050000-555c-9cc6-9d45-ebacf972183b	5252	Trnovo pri Gorici
00050000-555c-9cc6-97e1-3c79b1b3d916	2254	Trnovska vas
00050000-555c-9cc6-b44b-d92fb354f0c5	1222	Trojane
00050000-555c-9cc6-f587-e2ba5f46de59	1236	Trzin
00050000-555c-9cc6-c98e-c12d0eee0d99	4290	Tržič
00050000-555c-9cc6-9f27-1b12843416f0	8295	Tržišče
00050000-555c-9cc6-b726-e3eab1d5c73e	1311	Turjak
00050000-555c-9cc6-76d7-ac6d579edc85	9224	Turnišče
00050000-555c-9cc6-9022-87216668a49d	8323	Uršna sela
00050000-555c-9cc6-4568-93607d66c8de	1252	Vače
00050000-555c-9cc6-1fe9-7ae430a75ec1	3320	Velenje 
00050000-555c-9cc6-6c86-c7891df14433	3322	Velenje - poštni predali
00050000-555c-9cc6-c176-d25b3e969130	8212	Velika Loka
00050000-555c-9cc6-ec5a-d81069223ce1	2274	Velika Nedelja
00050000-555c-9cc6-da63-54280b6961da	9225	Velika Polana
00050000-555c-9cc6-7551-4e4ce03a4023	1315	Velike Lašče
00050000-555c-9cc6-4319-2ff9fd758605	8213	Veliki Gaber
00050000-555c-9cc6-e633-14c6e12323da	9241	Veržej
00050000-555c-9cc6-b4c8-0492cd4a1a0b	1312	Videm - Dobrepolje
00050000-555c-9cc6-aec8-b10a701b5fb6	2284	Videm pri Ptuju
00050000-555c-9cc6-e8f9-1f96aff0c216	8344	Vinica
00050000-555c-9cc6-e3cb-14e16dae6c90	5271	Vipava
00050000-555c-9cc6-4f34-095b9095c057	4212	Visoko
00050000-555c-9cc6-4da2-bacdc2646983	1294	Višnja Gora
00050000-555c-9cc6-1633-3fff999561aa	3205	Vitanje
00050000-555c-9cc6-e598-b51932356266	2255	Vitomarci
00050000-555c-9cc6-1803-56ab5afaaaba	1217	Vodice
00050000-555c-9cc6-8df4-9d36ceaecf73	3212	Vojnik\t
00050000-555c-9cc6-559c-9281b2abfda4	5293	Volčja Draga
00050000-555c-9cc6-789c-7d41590b2317	2232	Voličina
00050000-555c-9cc6-87e7-1b554afab3c9	3305	Vransko
00050000-555c-9cc6-ea45-09ffd9f54213	6217	Vremski Britof
00050000-555c-9cc6-698b-1313f2118f73	1360	Vrhnika
00050000-555c-9cc6-ecc8-502be25bfbcc	2365	Vuhred
00050000-555c-9cc6-fcf7-8cfba0fe5c28	2367	Vuzenica
00050000-555c-9cc6-b127-13488645bd5f	8292	Zabukovje 
00050000-555c-9cc6-522a-6b18fbd2a286	1410	Zagorje ob Savi
00050000-555c-9cc6-c360-104b8afde31b	1303	Zagradec
00050000-555c-9cc6-83a6-ee2091c054b7	2283	Zavrč
00050000-555c-9cc6-71ff-40fc46f372e8	8272	Zdole 
00050000-555c-9cc6-fc0a-e654db5858e0	4201	Zgornja Besnica
00050000-555c-9cc6-cd03-488bfb4de01f	2242	Zgornja Korena
00050000-555c-9cc6-4e24-10af8e10735b	2201	Zgornja Kungota
00050000-555c-9cc6-3850-6ab998bf446c	2316	Zgornja Ložnica
00050000-555c-9cc6-85d0-56b4b79ac095	2314	Zgornja Polskava
00050000-555c-9cc6-679b-fcc43c6306ef	2213	Zgornja Velka
00050000-555c-9cc6-f07f-5ba4fa86be91	4247	Zgornje Gorje
00050000-555c-9cc6-bb47-44fafac774df	4206	Zgornje Jezersko
00050000-555c-9cc6-bdcf-19e7ab09f11a	2285	Zgornji Leskovec
00050000-555c-9cc6-eff1-2d5f70706272	1432	Zidani Most
00050000-555c-9cc6-8805-12058300d274	3214	Zreče
00050000-555c-9cc6-4c9e-5b8c7e8f9f9e	4209	Žabnica
00050000-555c-9cc6-3635-0649c3dab937	3310	Žalec
00050000-555c-9cc6-f3a8-db11a3755df5	4228	Železniki
00050000-555c-9cc6-cc11-f31c1792c268	2287	Žetale
00050000-555c-9cc6-8332-ff03ecad9453	4226	Žiri
00050000-555c-9cc6-f001-6750be09b07b	4274	Žirovnica
00050000-555c-9cc6-75c8-272593c8c429	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 4203021)
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
-- TOC entry 2642 (class 0 OID 4202848)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4202914)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4203033)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4203138)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4203185)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 4203062)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4203006)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4202996)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 4203175)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4203128)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4202715)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555c-9cc7-c694-d108d1ee31c2	00010000-555c-9cc7-3d37-f57eda3e676b	2015-05-20 16:40:07	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROafPVyDNao3I051Nbkx4NKmcHDFrKQda";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 4203071)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 4202753)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555c-9cc7-b5fa-759e283f9b89	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555c-9cc7-0117-84645678eae0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555c-9cc7-3309-d8838399d210	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555c-9cc7-714a-fd2c19722af7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555c-9cc7-b001-7cd2cd200294	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555c-9cc7-d0eb-b0248a52ce5d	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 4202737)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555c-9cc7-c694-d108d1ee31c2	00020000-555c-9cc7-714a-fd2c19722af7
00010000-555c-9cc7-3d37-f57eda3e676b	00020000-555c-9cc7-714a-fd2c19722af7
\.


--
-- TOC entry 2668 (class 0 OID 4203085)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4203027)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 4202977)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4202813)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 4202983)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4203163)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4202883)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 4202724)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555c-9cc7-3d37-f57eda3e676b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO/kKwFK2YaS1Drzix1tGmOh6m2wede5W	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555c-9cc7-c694-d108d1ee31c2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 4203217)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4202929)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 4203054)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4203120)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4202961)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 4203207)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4203110)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 4202778)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 4203257)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4203250)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4203162)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 4202951)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 4202976)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 4202909)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 4203106)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4202927)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 4202970)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2249 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4203019)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 4203046)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 4202881)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 4202787)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 4202845)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 4202811)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 4202767)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 4202752)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 4203052)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 4203084)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 4203202)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 4202838)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 4202869)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 4203025)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 4202859)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 4202918)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 4203037)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4203144)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 4203190)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4203069)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 4203010)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 4203001)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 4203184)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4203135)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 4202723)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4203075)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 4202741)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 4202761)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 4203093)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4203032)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 4202982)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 4202818)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 4202992)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4203174)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 4202894)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4202736)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 4203232)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 4202936)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 4203060)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4203126)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 4202965)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 4203216)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 4203119)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 4202958)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 4202840)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2251 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2252 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2253 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2377 (class 1259 OID 4203053)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 4203039)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 4203038)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 4202937)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 4203109)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 4203107)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 4203108)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 4203204)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 4203205)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 4203206)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 4203235)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 4203234)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 4203233)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 4202896)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 4202895)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 4202847)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4202846)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 4203076)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 4202971)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 4202768)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 4202769)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 4203096)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 4203095)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 4203094)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 4202919)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 4202921)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 4202920)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 4203005)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 4203003)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 4203002)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 4203004)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 4202742)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 4202743)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 4203061)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 4203026)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 4203136)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 4203137)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 4202861)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 4202860)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 4202862)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 4203145)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 4203146)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 4203260)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 4203259)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 4203262)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 4203258)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 4203261)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 4203127)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 4203014)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 4203013)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 4203011)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 4203012)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 4203252)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 4203251)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 4202928)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 4202789)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 4202788)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 4202819)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 4202820)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 4202995)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 4202994)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 4202993)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 4202960)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 4202956)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 4202953)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 4202954)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 4202952)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 4202957)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 4202955)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 4202839)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 4202910)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 4202912)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 4202911)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 4202913)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 4203020)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 4203203)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 4202812)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 4202882)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 4203070)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 4202870)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 4203191)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 4202762)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 4202959)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 4203393)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 4203378)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 4203383)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 4203403)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 4203373)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 4203398)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 4203388)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 4203308)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 4203488)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 4203483)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 4203478)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 4203368)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 4203528)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 4203518)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 4203523)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 4203468)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 4203563)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 4203568)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 4203573)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 4203588)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 4203583)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 4203578)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 4203343)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 4203338)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 4203318)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 4203313)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4203293)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 4203498)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 4203408)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 4203273)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 4203278)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 4203513)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 4203508)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 4203503)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 4203348)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 4203358)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 4203353)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 4203443)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 4203433)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 4203428)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 4203438)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 4203263)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 4203268)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 4203493)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 4203473)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 4203538)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 4203543)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4203328)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 4203323)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 4203333)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 4203548)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 4203553)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 4203613)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 4203608)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 4203623)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 4203603)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 4203618)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 4203533)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 4203463)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 4203458)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 4203448)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 4203453)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 4203598)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 4203593)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 4203363)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 4203558)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 4203288)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 4203283)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 4203298)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4203303)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 4203423)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 4203418)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 4203413)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-20 16:40:08 CEST

--
-- PostgreSQL database dump complete
--

