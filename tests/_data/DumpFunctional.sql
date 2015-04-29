--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-29 14:27:54 CEST

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
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 1720678)
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
-- TOC entry 225 (class 1259 OID 1721161)
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
-- TOC entry 224 (class 1259 OID 1721144)
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
-- TOC entry 217 (class 1259 OID 1721060)
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
-- TOC entry 193 (class 1259 OID 1720844)
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
-- TOC entry 196 (class 1259 OID 1720885)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1720806)
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
-- TOC entry 212 (class 1259 OID 1721010)
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
-- TOC entry 191 (class 1259 OID 1720831)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1720879)
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
-- TOC entry 201 (class 1259 OID 1720928)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1720953)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1720780)
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
-- TOC entry 180 (class 1259 OID 1720687)
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
-- TOC entry 181 (class 1259 OID 1720698)
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
-- TOC entry 184 (class 1259 OID 1720750)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1720652)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1720671)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1720960)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1720990)
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
-- TOC entry 221 (class 1259 OID 1721102)
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
-- TOC entry 183 (class 1259 OID 1720730)
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
-- TOC entry 186 (class 1259 OID 1720772)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1720934)
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
-- TOC entry 185 (class 1259 OID 1720757)
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
-- TOC entry 190 (class 1259 OID 1720823)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1720946)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1721051)
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
-- TOC entry 220 (class 1259 OID 1721095)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1720975)
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
-- TOC entry 200 (class 1259 OID 1720919)
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
-- TOC entry 199 (class 1259 OID 1720909)
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
-- TOC entry 219 (class 1259 OID 1721085)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1721041)
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
-- TOC entry 173 (class 1259 OID 1720622)
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
-- TOC entry 172 (class 1259 OID 1720620)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 1720984)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1720662)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1720645)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1720998)
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
-- TOC entry 203 (class 1259 OID 1720940)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1720890)
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
-- TOC entry 182 (class 1259 OID 1720722)
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
-- TOC entry 198 (class 1259 OID 1720896)
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
-- TOC entry 218 (class 1259 OID 1721076)
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
-- TOC entry 188 (class 1259 OID 1720792)
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
-- TOC entry 174 (class 1259 OID 1720631)
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
-- TOC entry 223 (class 1259 OID 1721126)
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
-- TOC entry 192 (class 1259 OID 1720838)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1720967)
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
-- TOC entry 214 (class 1259 OID 1721033)
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
-- TOC entry 194 (class 1259 OID 1720866)
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
-- TOC entry 222 (class 1259 OID 1721116)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1721023)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1720625)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2637 (class 0 OID 1720678)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 1721161)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1721144)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1721060)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1720844)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1720885)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1720806)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5540-ce49-8891-1940620a17ec	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5540-ce49-13e4-bacceaaf6a07	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5540-ce49-dcc9-638a2047685f	AL	ALB	008	Albania 	Albanija	\N
00040000-5540-ce49-58b7-e3cc01671a3c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5540-ce49-e128-dce4be69c3c7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5540-ce49-1985-5ebf82205617	AD	AND	020	Andorra 	Andora	\N
00040000-5540-ce49-f330-1417356dda58	AO	AGO	024	Angola 	Angola	\N
00040000-5540-ce49-6b1c-8bfe64c26b8c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5540-ce49-0df6-9fa0c3f2d615	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5540-ce49-c7d3-b1eb6b3a2b76	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5540-ce49-b3d5-ec94ff44dab9	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5540-ce49-4bb5-5bfb99f90211	AM	ARM	051	Armenia 	Armenija	\N
00040000-5540-ce49-eb09-4721028e03f7	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5540-ce49-c778-2a91f7ccbc40	AU	AUS	036	Australia 	Avstralija	\N
00040000-5540-ce49-df0e-21ccfedf78ca	AT	AUT	040	Austria 	Avstrija	\N
00040000-5540-ce49-4c38-9bcc209d6297	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5540-ce49-2788-ce30e55a7476	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5540-ce49-3f40-a19c2ee8fa9a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5540-ce49-2799-1da3e8641e2c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5540-ce49-fc75-f60b2fa6bd31	BB	BRB	052	Barbados 	Barbados	\N
00040000-5540-ce49-de8a-0128a4321573	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5540-ce49-b16a-71819e5752a2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5540-ce49-b4af-0891b6871d7e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5540-ce49-13ea-4b6c04fab7a6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5540-ce49-ac05-5360014da080	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5540-ce49-acf8-507e64e626c7	BT	BTN	064	Bhutan 	Butan	\N
00040000-5540-ce49-847a-a0197b6470bf	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5540-ce49-ca37-ed51276e3697	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5540-ce49-35e4-33f3898a692c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5540-ce49-e370-02af28dda99f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5540-ce49-7131-8dfa36175f57	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5540-ce49-1a77-59f33261e781	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5540-ce49-a37b-e2ec86cac214	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5540-ce49-5bd9-f2f65648c707	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5540-ce49-99f1-edab258553d8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5540-ce49-7119-bad62a3721b3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5540-ce49-0c88-71e83c9c2ec5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5540-ce49-776c-f6f3f73218bd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5540-ce49-7b5b-83e8f902ac24	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5540-ce49-eedb-5fa1ef3186f9	CA	CAN	124	Canada 	Kanada	\N
00040000-5540-ce49-5f5b-baea49f78085	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5540-ce49-4bf5-25e91722bc56	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5540-ce49-2a74-70267c43aed6	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5540-ce49-cd36-d101658eacad	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5540-ce49-b72a-2a5a656b0dff	CL	CHL	152	Chile 	Čile	\N
00040000-5540-ce49-c275-290980879f5f	CN	CHN	156	China 	Kitajska	\N
00040000-5540-ce49-7bac-c34d224de6e5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5540-ce49-ede3-da885e3216d3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5540-ce49-be16-d7fa3ff8de8f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5540-ce49-1981-968a664e26e8	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5540-ce49-2eac-a5c5117e4416	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5540-ce49-0679-de29b5b71c18	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5540-ce49-26b1-07d9ab5ee654	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5540-ce49-ca7d-d48ee4e38998	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5540-ce49-7c13-f0544a64242d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5540-ce49-941a-a170c9b606f3	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5540-ce49-319d-3cabd7ee9648	CU	CUB	192	Cuba 	Kuba	\N
00040000-5540-ce49-330d-40dffdf13149	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5540-ce49-479c-aae420896ecc	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5540-ce49-e6de-6a731e3696dd	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5540-ce49-9e30-054767993d40	DK	DNK	208	Denmark 	Danska	\N
00040000-5540-ce49-500b-40bcc2251dda	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5540-ce49-e25b-425204554e31	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5540-ce49-288f-5ab71c4859a6	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5540-ce49-7571-4a8d0de99c90	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5540-ce49-142b-bd6c85152049	EG	EGY	818	Egypt 	Egipt	\N
00040000-5540-ce49-8482-65fa61c13073	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5540-ce49-e334-f63669b65d75	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5540-ce49-ad0a-76505ac175a9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5540-ce49-9f42-2445e3b78049	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5540-ce49-07aa-821f75e33848	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5540-ce49-c9fe-01fca5efa948	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5540-ce49-7472-853e00f78063	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5540-ce49-acfe-680f14048e33	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5540-ce49-f186-3bc86a4f33fa	FI	FIN	246	Finland 	Finska	\N
00040000-5540-ce49-1eec-7be584691474	FR	FRA	250	France 	Francija	\N
00040000-5540-ce49-d66e-4e8868dfaf15	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5540-ce49-9ffb-c84db9b2b5a5	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5540-ce49-926c-2610254f8745	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5540-ce49-0fcd-2d3cc9e998d2	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5540-ce49-2e7c-548be0f2857b	GA	GAB	266	Gabon 	Gabon	\N
00040000-5540-ce49-73b0-72cbab168788	GM	GMB	270	Gambia 	Gambija	\N
00040000-5540-ce49-75d0-7cbe5bab96e3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5540-ce49-e25c-255b1b257482	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5540-ce49-78f7-14b2ce6bac5b	GH	GHA	288	Ghana 	Gana	\N
00040000-5540-ce49-97d6-fa4e9d277a33	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5540-ce49-6d4c-72e7b888a801	GR	GRC	300	Greece 	Grčija	\N
00040000-5540-ce49-3729-57f40b224851	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5540-ce49-5928-6a8a0e623d96	GD	GRD	308	Grenada 	Grenada	\N
00040000-5540-ce49-911a-1197ee318780	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5540-ce49-c6f9-0c348b2a181c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5540-ce49-5e82-e3af931e93a6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5540-ce49-8fa8-38b6c7cc6d50	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5540-ce49-8900-f6821baeb05d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5540-ce49-f2d7-a4c40f27585d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5540-ce49-16ab-1ed31f555712	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5540-ce49-b018-2becd93a4c5b	HT	HTI	332	Haiti 	Haiti	\N
00040000-5540-ce49-c19a-0df183706110	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5540-ce49-87cf-91da73eb4594	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5540-ce49-dfe0-787504a7002f	HN	HND	340	Honduras 	Honduras	\N
00040000-5540-ce49-4f74-2c8be2bc3bed	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5540-ce49-033b-d5aee4b7ec16	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5540-ce49-dc66-664e86268fc7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5540-ce49-ea05-795b6bb7dc46	IN	IND	356	India 	Indija	\N
00040000-5540-ce49-b46f-25f02f0f5159	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5540-ce49-acc1-5ebeb9e62d59	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5540-ce49-ae73-15a8fc717096	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5540-ce49-77ff-d9c7d079d814	IE	IRL	372	Ireland 	Irska	\N
00040000-5540-ce49-9781-19962606e00c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5540-ce49-089b-997975d74233	IL	ISR	376	Israel 	Izrael	\N
00040000-5540-ce49-ed57-7b50abc4ff99	IT	ITA	380	Italy 	Italija	\N
00040000-5540-ce49-6602-56649e70e46d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5540-ce49-6339-7b3172b9a375	JP	JPN	392	Japan 	Japonska	\N
00040000-5540-ce49-302d-a68fa4ec7b33	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5540-ce49-c05a-ad65123a2145	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5540-ce49-820a-2ee092c91447	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5540-ce49-4d13-318ede596de2	KE	KEN	404	Kenya 	Kenija	\N
00040000-5540-ce49-8ee5-34da3d049f06	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5540-ce49-3655-aecf68ceed0f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5540-ce49-667e-819fb81fd0e7	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5540-ce49-f58a-2c8e1f8962e6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5540-ce49-97f9-8e110b88a59a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5540-ce49-a827-fa548bb474e2	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5540-ce49-7edc-cddc66bfc2da	LV	LVA	428	Latvia 	Latvija	\N
00040000-5540-ce49-7505-ceb322617278	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5540-ce49-bad1-52b937c75d50	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5540-ce49-2c48-d6bedb3cc688	LR	LBR	430	Liberia 	Liberija	\N
00040000-5540-ce49-d57a-b6ebe8f5eaff	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5540-ce49-b5d1-d20a5376eca8	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5540-ce49-ea35-fca0dec0c003	LT	LTU	440	Lithuania 	Litva	\N
00040000-5540-ce49-9cbc-8b4733c6d03b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5540-ce49-8cab-efdb46497f52	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5540-ce49-a1b4-9b684e353952	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5540-ce49-393e-63e2a0d758a7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5540-ce49-50bd-d58082450df8	MW	MWI	454	Malawi 	Malavi	\N
00040000-5540-ce49-e26a-6b55211185fe	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5540-ce49-9078-ae2d68c640db	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5540-ce49-84cb-63aa7bef9a3a	ML	MLI	466	Mali 	Mali	\N
00040000-5540-ce49-853d-0ac51ec5f929	MT	MLT	470	Malta 	Malta	\N
00040000-5540-ce49-add3-7f357f5a0311	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5540-ce49-8e0d-9505c03451c5	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5540-ce49-fdba-c26e974094e3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5540-ce49-1dda-3f8754d9aeda	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5540-ce49-c9a7-853dd48ae0b7	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5540-ce49-6ce2-0fa9eda1d2a2	MX	MEX	484	Mexico 	Mehika	\N
00040000-5540-ce49-dd6d-a4d05b46725f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5540-ce49-8d99-743585cae301	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5540-ce49-0ff8-1765b98444d3	MC	MCO	492	Monaco 	Monako	\N
00040000-5540-ce49-a26c-492a22dc4660	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5540-ce49-2dde-403848acaf44	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5540-ce49-7e9e-3b5d79b8d09b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5540-ce49-6d74-fda7fcc1091d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5540-ce49-078d-2a8670fdb8fc	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5540-ce49-c022-204ce3aa961c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5540-ce49-239a-7ac300f15053	NA	NAM	516	Namibia 	Namibija	\N
00040000-5540-ce49-12a7-9d446b7d18e6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5540-ce49-4e05-5ddb85026ec5	NP	NPL	524	Nepal 	Nepal	\N
00040000-5540-ce49-4134-6cae4afa9a84	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5540-ce49-9e4d-aacef77b4bbd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5540-ce49-f1a9-08bf2ae6eae3	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5540-ce49-ba4a-7ed27be94ba0	NE	NER	562	Niger 	Niger 	\N
00040000-5540-ce49-f0eb-294aed57ac7f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5540-ce49-433d-8a0975d7656d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5540-ce49-6a62-5692940bd51a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5540-ce49-c305-a5d8eab6d055	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5540-ce49-7f62-05ee07776ae6	NO	NOR	578	Norway 	Norveška	\N
00040000-5540-ce49-63c2-9b83f612a74d	OM	OMN	512	Oman 	Oman	\N
00040000-5540-ce49-8837-145d0cffd612	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5540-ce49-a6c7-a6fd787aacee	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5540-ce49-8e19-00d87ce6fe59	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5540-ce49-b21d-520b3d7b4f1b	PA	PAN	591	Panama 	Panama	\N
00040000-5540-ce49-83f8-88ad74de60bd	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5540-ce49-3106-ed0f79af7510	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5540-ce49-c5df-c2152a34583b	PE	PER	604	Peru 	Peru	\N
00040000-5540-ce49-ac60-329d8e7ed2f4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5540-ce49-d0e5-9292eb20f6ac	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5540-ce49-f775-7ab5ea12efb2	PL	POL	616	Poland 	Poljska	\N
00040000-5540-ce49-e601-8de305563649	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5540-ce49-50dc-b36e1a4a1e3a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5540-ce49-7b28-c14af286dd06	QA	QAT	634	Qatar 	Katar	\N
00040000-5540-ce49-e0f3-3efd725d3aa0	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5540-ce49-f854-73cbfd6b543c	RO	ROU	642	Romania 	Romunija	\N
00040000-5540-ce49-dd73-050dc0431bcb	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5540-ce49-b5fc-1a6278e65809	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5540-ce49-8f82-54b3d7cbc5ea	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5540-ce49-4922-4f5ca7951951	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5540-ce49-8eb5-59146ca061a6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5540-ce49-9f4b-7d2a006c861c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5540-ce49-d3ac-8cb51200c69b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5540-ce49-344a-66d6f398c644	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5540-ce49-9cf3-93ce96fa3fd4	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5540-ce49-6d04-df58c35294f0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5540-ce49-a6d7-4c2b3d842c05	SM	SMR	674	San Marino 	San Marino	\N
00040000-5540-ce49-91e2-272b1842bc8d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5540-ce49-8a8d-f5913684f4c8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5540-ce49-a841-5a3c4f9d13bd	SN	SEN	686	Senegal 	Senegal	\N
00040000-5540-ce49-856a-aca4b69cc79f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5540-ce49-0471-4ff511b139f9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5540-ce49-e4d1-53ef01c29c2c	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5540-ce49-04ad-8ec3dae36b19	SG	SGP	702	Singapore 	Singapur	\N
00040000-5540-ce49-e379-398891ddbd2e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5540-ce49-4ce5-b6a7519eda22	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5540-ce49-65ab-42552c3dc996	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5540-ce49-dd4d-382ccf3baa43	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5540-ce49-61c1-1b425068563f	SO	SOM	706	Somalia 	Somalija	\N
00040000-5540-ce49-99ae-1721695e636f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5540-ce49-820f-0b9dcadabc84	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5540-ce49-7776-cc8c3e89de4e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5540-ce49-3484-1989c65407f9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5540-ce49-77e0-10fec1b95ad8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5540-ce49-a83f-640d2def60d1	SD	SDN	729	Sudan 	Sudan	\N
00040000-5540-ce49-2266-2bc4277fc15b	SR	SUR	740	Suriname 	Surinam	\N
00040000-5540-ce49-9792-1c149af74764	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5540-ce49-40a1-170dc275a2e3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5540-ce49-dd2f-a5d2d7ec5e63	SE	SWE	752	Sweden 	Švedska	\N
00040000-5540-ce49-3cdc-3798ffb342c0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5540-ce49-32b1-dc8452cf2dc8	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5540-ce49-2d71-c69f5a463a1a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5540-ce49-24f4-4ad81d098074	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5540-ce49-ff75-dcffcdfaa2be	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5540-ce49-6e70-bfb225aaf7fb	TH	THA	764	Thailand 	Tajska	\N
00040000-5540-ce49-363e-40c30a4536d3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5540-ce49-36b1-1ef9c0cd5d6b	TG	TGO	768	Togo 	Togo	\N
00040000-5540-ce49-6b2b-8b089453d8db	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5540-ce49-2db7-ee56f6328192	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5540-ce49-a478-6706ac010cb8	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5540-ce49-8f63-1e2771bcf45b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5540-ce49-a66f-66cef5943e3c	TR	TUR	792	Turkey 	Turčija	\N
00040000-5540-ce49-9aca-f338615b49c3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5540-ce49-6636-8e10d9490b86	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5540-ce49-22d8-54f1d18212fa	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5540-ce49-fb7e-f086d2cf0c31	UG	UGA	800	Uganda 	Uganda	\N
00040000-5540-ce49-3975-60139b5efd20	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5540-ce49-4df2-83169f93691f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5540-ce49-23ba-db490a310038	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5540-ce49-de41-c054b08b9ca3	US	USA	840	United States 	Združene države Amerike	\N
00040000-5540-ce49-b011-9adf6aff44bc	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5540-ce49-d93d-0ef8a93ea18c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5540-ce49-fffc-9052df3a2431	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5540-ce49-b850-9d6a754278b0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5540-ce49-a535-1b0c68ffb188	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5540-ce49-046f-9166e52dfa71	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5540-ce49-a413-410dddd80549	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5540-ce49-bbf0-2035a02fcbff	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5540-ce49-9ce2-fe535e6e4e5b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5540-ce49-a4a7-f0c7d6fd400f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5540-ce49-7ef5-307acb862048	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5540-ce49-9793-09f7753fd16f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5540-ce49-82a3-2811a2fd6b9f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2670 (class 0 OID 1721010)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1720831)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1720879)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2628 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 1720928)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 1720953)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1720780)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5540-ce49-33da-9c19072796a6	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5540-ce49-336b-9cca07c988fb	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5540-ce49-b7c7-81ba2dd458b5	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5540-ce49-26f7-c80573ce49bf	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5540-ce49-dfae-d15daa99faa7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5540-ce49-a60d-beeb2e4f8957	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5540-ce49-3ad4-c4ef67bf7a52	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5540-ce49-18df-cdc6e458c96b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5540-ce49-4258-e26d07bbcaa0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5540-ce49-71a1-8135d9863e04	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2638 (class 0 OID 1720687)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5540-ce49-01d2-5c50710d98b7	00000000-5540-ce49-dfae-d15daa99faa7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5540-ce49-b4c2-176ab3e4fa17	00000000-5540-ce49-dfae-d15daa99faa7	00010000-5540-ce49-147a-79a50df4c3af	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5540-ce49-df43-e78bd4b4b6dc	00000000-5540-ce49-a60d-beeb2e4f8957	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2639 (class 0 OID 1720698)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 1720750)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1720652)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5540-ce49-e118-44f443978091	Ass-read	Aaa (User,Role,Permission) - branje	f
00030000-5540-ce49-76c5-78c8d7cfcf14	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5540-ce49-7dc9-e1c02e326e70	Abonma-read	Abonma - branje	f
00030000-5540-ce49-d816-2a8a436ad653	Abonma-write	Abonma - spreminjanje	f
00030000-5540-ce49-79a6-d6aced26710e	Alternacija-read	Alternacija - branje	f
00030000-5540-ce49-4b0e-a3bac4b4c795	Alternacija-write	Alternacija - spreminjanje	f
00030000-5540-ce49-5110-c385eee63a06	Arhivalija-read	Arhivalija - branje	f
00030000-5540-ce49-e8ee-7914c4462610	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5540-ce49-dd1c-2d16de8b0fb1	Besedilo-read	Besedilo - branje	f
00030000-5540-ce49-bcb7-a35d7c365985	Besedilo-write	Besedilo - spreminjanje	f
00030000-5540-ce49-9039-19929c8290ac	DogodekIzven-read	DogodekIzven - branje	f
00030000-5540-ce49-6c82-16e84cdfa3fc	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5540-ce49-3e62-a909858fbc2e	Dogodek-read	Dogodek - branje	f
00030000-5540-ce49-216e-271c8d91136b	Dogodek-write	Dogodek - spreminjanje	f
00030000-5540-ce49-2989-058a31e9a754	Drzava-read	Drzava - branje	f
00030000-5540-ce49-2d34-b51727baaabe	Drzava-write	Drzava - spreminjanje	f
00030000-5540-ce49-03a5-073a40c0fd02	Funkcija-read	Funkcija - branje	f
00030000-5540-ce49-ecc3-361a27a04ce9	Funkcija-write	Funkcija - spreminjanje	f
00030000-5540-ce49-bcd3-769e9ec22d12	Gostovanje-read	Gostovanje - branje	f
00030000-5540-ce49-a2c0-243751e3110c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5540-ce49-9fc6-475b26fbd165	Gostujoca-read	Gostujoca - branje	f
00030000-5540-ce49-b1e3-cb8f7dcfa84e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5540-ce49-550b-59ca8681d286	Kupec-read	Kupec - branje	f
00030000-5540-ce49-8fcd-e3d579ff23f2	Kupec-write	Kupec - spreminjanje	f
00030000-5540-ce49-21b1-807f0f4b851a	NacinPlacina-read	NacinPlacina - branje	f
00030000-5540-ce49-beae-aae8e7e778c2	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5540-ce49-2f67-d392c6daded8	Option-read	Option - branje	f
00030000-5540-ce49-0697-6ed8d0347ee9	Option-write	Option - spreminjanje	f
00030000-5540-ce49-b8e4-2c4138da5f08	OptionValue-read	OptionValue - branje	f
00030000-5540-ce49-2085-73f4c78d8aed	OptionValue-write	OptionValue - spreminjanje	f
00030000-5540-ce49-53b4-23479599cd4f	Oseba-read	Oseba - branje	f
00030000-5540-ce49-1538-82247b90fadf	Oseba-write	Oseba - spreminjanje	f
00030000-5540-ce49-634b-862c509c36ca	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5540-ce49-5fd8-94a8c6fd426f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5540-ce49-05ba-661547b0aaaf	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5540-ce49-e0d5-cff82209b4ac	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5540-ce49-b1e2-36aeb7aa440f	Pogodba-read	Pogodba - branje	f
00030000-5540-ce49-1e4d-8807175a8b77	Pogodba-write	Pogodba - spreminjanje	f
00030000-5540-ce49-288c-b62f8ba19c91	Popa-read	Popa - branje	f
00030000-5540-ce49-ebbc-22f3d0fab200	Popa-write	Popa - spreminjanje	f
00030000-5540-ce49-f79f-fe1b5cf83867	Posta-read	Posta - branje	f
00030000-5540-ce49-4343-65e1a52ae173	Posta-write	Posta - spreminjanje	f
00030000-5540-ce49-948c-3caa55fa7c9a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5540-ce49-0516-33ef7ae486ae	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5540-ce49-27b8-402d1a8c91e4	PostniNaslov-read	PostniNaslov - branje	f
00030000-5540-ce49-0af8-65cba5ca7cdb	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5540-ce49-104c-0143c268c144	Predstava-read	Predstava - branje	f
00030000-5540-ce49-6d8a-299f022435c2	Predstava-write	Predstava - spreminjanje	f
00030000-5540-ce49-3dbb-14977c4593a5	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5540-ce49-97dd-436142a5ca82	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5540-ce49-23ab-096726aaf0a9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5540-ce49-9827-969693bc8c0a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5540-ce49-00b1-1a047a336f05	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5540-ce49-bd04-ad1b08d4c0b5	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5540-ce49-5aa0-87bf24b84787	Prostor-read	Prostor - branje	f
00030000-5540-ce49-b8bb-4f1c2e16d5d6	Prostor-write	Prostor - spreminjanje	f
00030000-5540-ce49-a7fe-f4223183afa6	Racun-read	Racun - branje	f
00030000-5540-ce49-dfa4-d25cc4c879fa	Racun-write	Racun - spreminjanje	f
00030000-5540-ce49-12cd-e880de85fc3f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5540-ce49-bd68-6a6482c59002	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5540-ce49-0570-54638aee403e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5540-ce49-dc8c-2bcca01e76ef	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5540-ce49-3ca9-1dd7c2b2fb96	Rekvizit-read	Rekvizit - branje	f
00030000-5540-ce49-6e0a-d980dd7a7ff0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5540-ce49-6d93-e6b1b35bac31	Rezervacija-read	Rezervacija - branje	f
00030000-5540-ce49-01c9-291abaefa776	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5540-ce49-c551-ef08adc98fca	SedezniRed-read	SedezniRed - branje	f
00030000-5540-ce49-d159-ef5bbd604feb	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5540-ce49-ae3b-265e782067bd	Sedez-read	Sedez - branje	f
00030000-5540-ce49-2aa6-ebc7104d4fbe	Sedez-write	Sedez - spreminjanje	f
00030000-5540-ce49-be01-8def23ae8028	Sezona-read	Sezona - branje	f
00030000-5540-ce49-4d95-e3184b0f5d3a	Sezona-write	Sezona - spreminjanje	f
00030000-5540-ce49-7780-d3866612d28d	Telefonska-read	Telefonska - branje	f
00030000-5540-ce49-f0ca-fc0f0856fbca	Telefonska-write	Telefonska - spreminjanje	f
00030000-5540-ce49-cf25-3c504d81085b	TerminStoritve-read	TerminStoritve - branje	f
00030000-5540-ce49-15df-6fc7fcd974e7	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5540-ce49-6e15-5f93011f39e2	TipFunkcije-read	TipFunkcije - branje	f
00030000-5540-ce49-069d-b9ed585204cc	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5540-ce49-4afc-2e215c79ce6f	Trr-read	Trr - branje	f
00030000-5540-ce49-08a1-200c2a64b38f	Trr-write	Trr - spreminjanje	f
00030000-5540-ce49-f173-b572f9598882	Uprizoritev-read	Uprizoritev - branje	f
00030000-5540-ce49-1aae-31b724de7403	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5540-ce49-bed5-3e0fcd6247cb	Vaja-read	Vaja - branje	f
00030000-5540-ce49-1fb7-9c803c46c4be	Vaja-write	Vaja - spreminjanje	f
00030000-5540-ce49-cc12-390cefed5789	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5540-ce49-cc01-8515886d4007	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5540-ce49-9b0f-5c1f4d7722a3	Zaposlitev-read	Zaposlitev - branje	f
00030000-5540-ce49-04a1-528c79d2ed46	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5540-ce49-46cb-97b67e90c8ac	Zasedenost-read	Zasedenost - branje	f
00030000-5540-ce49-9e97-9e748ea43b06	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5540-ce49-b9b5-9be4e2a0ee7d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5540-ce49-5712-91ca05790561	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5540-ce49-3f93-a0d547cc85d5	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5540-ce49-06c2-b075a170c241	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2636 (class 0 OID 1720671)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5540-ce49-0eba-8e9227e8ae38	00030000-5540-ce49-2989-058a31e9a754
00020000-5540-ce49-fb66-8a56438a05cf	00030000-5540-ce49-2d34-b51727baaabe
00020000-5540-ce49-fb66-8a56438a05cf	00030000-5540-ce49-2989-058a31e9a754
\.


--
-- TOC entry 2664 (class 0 OID 1720960)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 1720990)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1721102)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1720730)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1720772)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5540-ce49-9baa-d170920ed73d	8341	Adlešiči
00050000-5540-ce49-1411-65d10521e039	5270	Ajdovščina
00050000-5540-ce49-d3ca-60912a3e4c7c	6280	Ankaran/Ancarano
00050000-5540-ce49-6e0b-840b3efece5f	9253	Apače
00050000-5540-ce49-f0e8-54f5d8bdb553	8253	Artiče
00050000-5540-ce49-8765-e57f4dbef939	4275	Begunje na Gorenjskem
00050000-5540-ce49-ea12-719fa11a011b	1382	Begunje pri Cerknici
00050000-5540-ce49-0b5f-21f31c169042	9231	Beltinci
00050000-5540-ce49-83c5-89ab4da8a0b3	2234	Benedikt
00050000-5540-ce49-3029-11b4237aa21e	2345	Bistrica ob Dravi
00050000-5540-ce49-e5be-c5067b827952	3256	Bistrica ob Sotli
00050000-5540-ce49-a400-bd0bb22cdcda	8259	Bizeljsko
00050000-5540-ce49-f3de-b65c3a3e6a97	1223	Blagovica
00050000-5540-ce49-49f4-19e50d601f8d	8283	Blanca
00050000-5540-ce49-c2e1-0f74141019cb	4260	Bled
00050000-5540-ce49-4eff-64094c882f1d	4273	Blejska Dobrava
00050000-5540-ce49-07cf-b4b10aa961c7	9265	Bodonci
00050000-5540-ce49-2ff9-50c75c17c810	9222	Bogojina
00050000-5540-ce49-aa91-1b6a4373319c	4263	Bohinjska Bela
00050000-5540-ce49-2bc4-8c1bcae8cd0b	4264	Bohinjska Bistrica
00050000-5540-ce49-6954-c64fa55436b0	4265	Bohinjsko jezero
00050000-5540-ce49-f414-2ae9620aa85f	1353	Borovnica
00050000-5540-ce49-f959-19e9f68f2685	8294	Boštanj
00050000-5540-ce49-faa0-c4e9f11d2091	5230	Bovec
00050000-5540-ce49-8636-fbc47f6886cd	5295	Branik
00050000-5540-ce49-b6a7-1e5003c9fdf8	3314	Braslovče
00050000-5540-ce49-4c77-e9b68fc005e9	5223	Breginj
00050000-5540-ce49-2ac9-ccfec605fbfe	8280	Brestanica
00050000-5540-ce49-7835-3a726ec09e0c	2354	Bresternica
00050000-5540-ce49-1e97-b5cd0d5b8dbc	4243	Brezje
00050000-5540-ce49-55d5-f7f2872db0b2	1351	Brezovica pri Ljubljani
00050000-5540-ce49-b515-b6e75892acb3	8250	Brežice
00050000-5540-ce49-2c3d-2086454acbfd	4210	Brnik - Aerodrom
00050000-5540-ce49-0a7f-e370d53a5b2f	8321	Brusnice
00050000-5540-ce49-9024-55d3db385615	3255	Buče
00050000-5540-ce49-082d-2912890de712	8276	Bučka 
00050000-5540-ce49-9d59-4ad7ddc03647	9261	Cankova
00050000-5540-ce49-c0ab-4f63ab777bdf	3000	Celje 
00050000-5540-ce49-6a23-42aba99ad0e6	3001	Celje - poštni predali
00050000-5540-ce49-2e11-88ef1e42110e	4207	Cerklje na Gorenjskem
00050000-5540-ce49-ec1f-5d5fe35fa971	8263	Cerklje ob Krki
00050000-5540-ce49-9728-d19a277d8051	1380	Cerknica
00050000-5540-ce49-fd8d-8b3e176b8e4b	5282	Cerkno
00050000-5540-ce49-7b81-88e14d9fd3f3	2236	Cerkvenjak
00050000-5540-ce49-835d-9db4ea993d80	2215	Ceršak
00050000-5540-ce49-fb61-582205c63715	2326	Cirkovce
00050000-5540-ce49-1ed1-15a01afd6fee	2282	Cirkulane
00050000-5540-ce49-1f1e-af01428045a6	5273	Col
00050000-5540-ce49-2eb7-c251dc5972fd	8251	Čatež ob Savi
00050000-5540-ce49-4493-f1e333ad5d9e	1413	Čemšenik
00050000-5540-ce49-327c-f5b7c28451c1	5253	Čepovan
00050000-5540-ce49-94a7-0ec59991704e	9232	Črenšovci
00050000-5540-ce49-f045-f7b2f39b1313	2393	Črna na Koroškem
00050000-5540-ce49-9929-7535687b6da6	6275	Črni Kal
00050000-5540-ce49-4222-ef72f2000824	5274	Črni Vrh nad Idrijo
00050000-5540-ce49-73ee-ad634fe9e1db	5262	Črniče
00050000-5540-ce49-d6a1-263b9e7017f6	8340	Črnomelj
00050000-5540-ce49-96e4-fbcfa3176e4c	6271	Dekani
00050000-5540-ce49-42d8-66db383ebe6c	5210	Deskle
00050000-5540-ce49-f623-ae6e511a90fb	2253	Destrnik
00050000-5540-ce49-3fee-f6aa5938b9e4	6215	Divača
00050000-5540-ce49-4d24-2cb51b694a1d	1233	Dob
00050000-5540-ce49-e7fe-5c742a9a7ab9	3224	Dobje pri Planini
00050000-5540-ce49-34db-cbc8a4fb1a53	8257	Dobova
00050000-5540-ce49-7ec2-5fb2dd2d34c1	1423	Dobovec
00050000-5540-ce49-fe2a-6d2c70ba4c64	5263	Dobravlje
00050000-5540-ce49-01b0-2b2267534b3c	3204	Dobrna
00050000-5540-ce49-882d-16d320376c1b	8211	Dobrnič
00050000-5540-ce49-e099-e4eef0355747	1356	Dobrova
00050000-5540-ce49-2088-e161bc50f09c	9223	Dobrovnik/Dobronak 
00050000-5540-ce49-2d0b-ab3b88be3507	5212	Dobrovo v Brdih
00050000-5540-ce49-6083-5be6f22f7317	1431	Dol pri Hrastniku
00050000-5540-ce49-3415-2cac5629480b	1262	Dol pri Ljubljani
00050000-5540-ce49-25b0-85280857fa9b	1273	Dole pri Litiji
00050000-5540-ce49-5630-95d23e0007d8	1331	Dolenja vas
00050000-5540-ce49-1743-75add40bfe81	8350	Dolenjske Toplice
00050000-5540-ce49-a6ea-2ccd391563c3	1230	Domžale
00050000-5540-ce49-9b76-7d985d8bee96	2252	Dornava
00050000-5540-ce49-4d14-8c4d92c5357d	5294	Dornberk
00050000-5540-ce49-b153-574ecfd56a86	1319	Draga
00050000-5540-ce49-9634-89c5f998fdf8	8343	Dragatuš
00050000-5540-ce49-7066-e4cc8d8a0bae	3222	Dramlje
00050000-5540-ce49-dd5c-37d574203b6a	2370	Dravograd
00050000-5540-ce49-9df2-47f390a143de	4203	Duplje
00050000-5540-ce49-b7cd-3cad83768013	6221	Dutovlje
00050000-5540-ce49-6b60-6caa335bd009	8361	Dvor
00050000-5540-ce49-d696-2cf03e782b49	2343	Fala
00050000-5540-ce49-4636-5d386e1cdeaa	9208	Fokovci
00050000-5540-ce49-2829-42ba5ee85631	2313	Fram
00050000-5540-ce49-2901-d4a0213dadd8	3213	Frankolovo
00050000-5540-ce49-6883-a1923e790b22	1274	Gabrovka
00050000-5540-ce49-15e5-868a4be63c90	8254	Globoko
00050000-5540-ce49-5859-ce06c128d3c0	5275	Godovič
00050000-5540-ce49-005c-943f7b4a3470	4204	Golnik
00050000-5540-ce49-1569-bb8753385b16	3303	Gomilsko
00050000-5540-ce49-52b5-5a4a44a5bc24	4224	Gorenja vas
00050000-5540-ce49-8710-b9836a7c6b32	3263	Gorica pri Slivnici
00050000-5540-ce49-e45b-1707924e8596	2272	Gorišnica
00050000-5540-ce49-90c5-94161cac4b3f	9250	Gornja Radgona
00050000-5540-ce49-ac19-bee17bb05741	3342	Gornji Grad
00050000-5540-ce49-79e0-d8111589b6e4	4282	Gozd Martuljek
00050000-5540-ce49-8e6a-5fb2441ff48e	6272	Gračišče
00050000-5540-ce49-9b77-2934f852c217	9264	Grad
00050000-5540-ce49-82a8-f4171aa9630f	8332	Gradac
00050000-5540-ce49-639d-1192cb52b307	1384	Grahovo
00050000-5540-ce49-b270-0b24b8f7ae1b	5242	Grahovo ob Bači
00050000-5540-ce49-3407-1ccb9b4a9d45	5251	Grgar
00050000-5540-ce49-d453-92f4159998bd	3302	Griže
00050000-5540-ce49-134a-14cd06c23a54	3231	Grobelno
00050000-5540-ce49-1db4-41c1855173ea	1290	Grosuplje
00050000-5540-ce49-a8ec-d4f38fc168cc	2288	Hajdina
00050000-5540-ce49-241a-d1d03443b522	8362	Hinje
00050000-5540-ce49-fe25-a4d9f7fce925	2311	Hoče
00050000-5540-ce49-3327-3d2907c0eb00	9205	Hodoš/Hodos
00050000-5540-ce49-f01f-986386c2b3b1	1354	Horjul
00050000-5540-ce49-9b92-da5dafbc5c5c	1372	Hotedršica
00050000-5540-ce49-7040-29bf70659883	1430	Hrastnik
00050000-5540-ce49-b424-659f6d143e78	6225	Hruševje
00050000-5540-ce49-3b3a-067a43805bd2	4276	Hrušica
00050000-5540-ce49-3756-ab561448783a	5280	Idrija
00050000-5540-ce49-73cd-72a61eb69c42	1292	Ig
00050000-5540-ce49-3b70-5dd63171bc0a	6250	Ilirska Bistrica
00050000-5540-ce49-211e-aa285bc37ed7	6251	Ilirska Bistrica-Trnovo
00050000-5540-ce49-7c97-5f05b4cdd8cd	1295	Ivančna Gorica
00050000-5540-ce49-be0a-f61b861eb84e	2259	Ivanjkovci
00050000-5540-ce49-aec8-9fb3c8c9111b	1411	Izlake
00050000-5540-ce49-f442-e71e7e91ef5a	6310	Izola/Isola
00050000-5540-ce49-d1e0-e5556b87096d	2222	Jakobski Dol
00050000-5540-ce49-ad34-2c521c9aa995	2221	Jarenina
00050000-5540-ce49-1ee4-a0ee915deb4d	6254	Jelšane
00050000-5540-ce49-c8d7-df3c3e31e7a8	4270	Jesenice
00050000-5540-ce49-8610-c179cbe0cb73	8261	Jesenice na Dolenjskem
00050000-5540-ce49-003a-653196c13438	3273	Jurklošter
00050000-5540-ce49-3891-86e2be6970b5	2223	Jurovski Dol
00050000-5540-ce49-cb7a-d9c324bf8552	2256	Juršinci
00050000-5540-ce49-2741-fae8c20ac051	5214	Kal nad Kanalom
00050000-5540-ce49-c345-df0190e3f026	3233	Kalobje
00050000-5540-ce49-61ca-5df979e2df25	4246	Kamna Gorica
00050000-5540-ce49-aa4f-454995f033fd	2351	Kamnica
00050000-5540-ce49-8590-270dfa0a4fcf	1241	Kamnik
00050000-5540-ce49-ea24-bb13f4dfed78	5213	Kanal
00050000-5540-ce49-894f-c4e188aac895	8258	Kapele
00050000-5540-ce49-72e0-18cbc762dc6b	2362	Kapla
00050000-5540-ce49-f911-cb53f7a66cd6	2325	Kidričevo
00050000-5540-ce49-c65d-ce916be1db1c	1412	Kisovec
00050000-5540-ce49-fa02-666cd3db3277	6253	Knežak
00050000-5540-ce49-e300-0e5c9bbb5161	5222	Kobarid
00050000-5540-ce49-b4a1-60191325638d	9227	Kobilje
00050000-5540-ce49-b9c1-fe99b5d22061	1330	Kočevje
00050000-5540-ce49-0b17-061664fece50	1338	Kočevska Reka
00050000-5540-ce49-2289-36de21323771	2276	Kog
00050000-5540-ce49-ad99-46ea22f1adfd	5211	Kojsko
00050000-5540-ce49-4ff4-9158c75b2572	6223	Komen
00050000-5540-ce49-a0bb-d765007e367d	1218	Komenda
00050000-5540-ce49-3d13-ff5ae41675f6	6000	Koper/Capodistria 
00050000-5540-ce49-f02d-b3e2ce280e93	6001	Koper/Capodistria - poštni predali
00050000-5540-ce49-765e-1ad2ac7b2d14	8282	Koprivnica
00050000-5540-ce49-1393-d018175f71e6	5296	Kostanjevica na Krasu
00050000-5540-ce49-4151-70d762392e34	8311	Kostanjevica na Krki
00050000-5540-ce49-4621-64e7400217fa	1336	Kostel
00050000-5540-ce49-dfcd-34937e161f71	6256	Košana
00050000-5540-ce49-1344-dec4113df590	2394	Kotlje
00050000-5540-ce49-7b9a-8f4020f752f1	6240	Kozina
00050000-5540-ce49-8aa4-3faaba21fc42	3260	Kozje
00050000-5540-ce49-b771-5d37e637a5d9	4000	Kranj 
00050000-5540-ce49-6237-4852e057eb46	4001	Kranj - poštni predali
00050000-5540-ce49-3ccf-7f65c00590b2	4280	Kranjska Gora
00050000-5540-ce49-26f5-be49f76fa8a2	1281	Kresnice
00050000-5540-ce49-4fa5-56ab4d058975	4294	Križe
00050000-5540-ce49-86e7-c072b6009f33	9206	Križevci
00050000-5540-ce49-fa9b-cab7c693d3a1	9242	Križevci pri Ljutomeru
00050000-5540-ce49-bb49-9ea837e8012e	1301	Krka
00050000-5540-ce49-6125-9521e35f8a06	8296	Krmelj
00050000-5540-ce49-d811-9b340f464aeb	4245	Kropa
00050000-5540-ce49-ecaf-45fea2b1cc16	8262	Krška vas
00050000-5540-ce49-3d1f-f3086d2f29fe	8270	Krško
00050000-5540-ce49-e4c9-a222ae141d98	9263	Kuzma
00050000-5540-ce49-5afd-9f78086241fd	2318	Laporje
00050000-5540-ce49-b611-c751ef1a7f07	3270	Laško
00050000-5540-ce49-5188-2df788a281e0	1219	Laze v Tuhinju
00050000-5540-ce49-17fb-3eeb6d6e1144	2230	Lenart v Slovenskih goricah
00050000-5540-ce49-3cc9-ed0cbf83c68c	9220	Lendava/Lendva
00050000-5540-ce49-690b-f2d6818e1990	4248	Lesce
00050000-5540-ce49-25b1-5f8eb34a2bc5	3261	Lesično
00050000-5540-ce49-6dda-b500a048a1a8	8273	Leskovec pri Krškem
00050000-5540-ce49-2c9f-471fbd4dc537	2372	Libeliče
00050000-5540-ce49-1709-650ed2d43af9	2341	Limbuš
00050000-5540-ce49-bf68-da2a70f89ba3	1270	Litija
00050000-5540-ce49-80cf-07bb95180162	3202	Ljubečna
00050000-5540-ce49-2f07-eeb432dc7ecf	1000	Ljubljana 
00050000-5540-ce49-77e3-7d2b013d8be2	1001	Ljubljana - poštni predali
00050000-5540-ce49-e1fa-5aafadc447e7	1231	Ljubljana - Črnuče
00050000-5540-ce49-f5f6-1c05511c4dd6	1261	Ljubljana - Dobrunje
00050000-5540-ce49-2398-5e13f0eb8cb7	1260	Ljubljana - Polje
00050000-5540-ce49-246e-83bb150daec6	1210	Ljubljana - Šentvid
00050000-5540-ce49-03fe-8e8ae4c7720e	1211	Ljubljana - Šmartno
00050000-5540-ce49-7c11-f868e8ea7f37	3333	Ljubno ob Savinji
00050000-5540-ce49-2e8d-bc333129e45f	9240	Ljutomer
00050000-5540-ce49-5826-82e8d5f61cf7	3215	Loče
00050000-5540-ce49-bb5a-64e139f759c5	5231	Log pod Mangartom
00050000-5540-ce49-e826-3adecba340d8	1358	Log pri Brezovici
00050000-5540-ce49-589e-2a8036296459	1370	Logatec
00050000-5540-ce49-e981-8c602392da68	1371	Logatec
00050000-5540-ce49-a5be-5e7c7daebcf9	1434	Loka pri Zidanem Mostu
00050000-5540-ce49-8765-c575da301df7	3223	Loka pri Žusmu
00050000-5540-ce49-0284-06f13de45437	6219	Lokev
00050000-5540-ce49-eefd-6cca27a6e8b5	1318	Loški Potok
00050000-5540-ce49-69ad-a06070a48b6e	2324	Lovrenc na Dravskem polju
00050000-5540-ce49-18c1-d3558fae5c98	2344	Lovrenc na Pohorju
00050000-5540-ce49-b330-6349547bc2ad	3334	Luče
00050000-5540-ce49-8102-7d1bf62cde26	1225	Lukovica
00050000-5540-ce49-efa6-08b63fc782ee	9202	Mačkovci
00050000-5540-ce49-1374-1134642db136	2322	Majšperk
00050000-5540-ce49-b847-cdc0972409a0	2321	Makole
00050000-5540-ce49-eea1-7fd3e44c4700	9243	Mala Nedelja
00050000-5540-ce49-137e-e5a38f86de01	2229	Malečnik
00050000-5540-ce49-3c25-2fcff8d5e556	6273	Marezige
00050000-5540-ce49-66bd-91a4570ff773	2000	Maribor 
00050000-5540-ce49-21ba-27931bbf4f01	2001	Maribor - poštni predali
00050000-5540-ce49-dcf4-aab4851b74b5	2206	Marjeta na Dravskem polju
00050000-5540-ce49-1ede-744bfe51e7d1	2281	Markovci
00050000-5540-ce49-008b-da280ca5d318	9221	Martjanci
00050000-5540-ce49-34ff-45d527578442	6242	Materija
00050000-5540-ce49-bdfe-11f36dc48521	4211	Mavčiče
00050000-5540-ce49-93ad-1697228aa1f4	1215	Medvode
00050000-5540-ce49-9898-db6d75c2ab78	1234	Mengeš
00050000-5540-ce49-5e0b-7ac13830cc0d	8330	Metlika
00050000-5540-ce49-cfb3-dbac5d96b674	2392	Mežica
00050000-5540-ce49-d712-41b1b513f803	2204	Miklavž na Dravskem polju
00050000-5540-ce49-64d3-a28c4d3fd43d	2275	Miklavž pri Ormožu
00050000-5540-ce49-24b1-8625a4f1f607	5291	Miren
00050000-5540-ce49-4ec2-0f4959217cdf	8233	Mirna
00050000-5540-ce49-1315-2750dd0f7db5	8216	Mirna Peč
00050000-5540-ce49-ba56-db3a3227903b	2382	Mislinja
00050000-5540-ce49-0ee6-16b5b6771172	4281	Mojstrana
00050000-5540-ce49-8b5c-9eb540f8848e	8230	Mokronog
00050000-5540-ce49-2f6e-e52896b9adbd	1251	Moravče
00050000-5540-ce49-b55a-425bf1e5e1d3	9226	Moravske Toplice
00050000-5540-ce49-815d-70ee03b06b07	5216	Most na Soči
00050000-5540-ce49-9553-a44b5c1f844e	1221	Motnik
00050000-5540-ce49-d9c8-a2d2ebb1486c	3330	Mozirje
00050000-5540-ce49-a2e7-dbfbced5eda1	9000	Murska Sobota 
00050000-5540-ce49-e5db-189959c78ace	9001	Murska Sobota - poštni predali
00050000-5540-ce49-a0bb-98dcd5a0c891	2366	Muta
00050000-5540-ce49-aea7-acbe0d1f664c	4202	Naklo
00050000-5540-ce49-ee54-b66c0ee17cc4	3331	Nazarje
00050000-5540-ce49-f0d3-94791b223038	1357	Notranje Gorice
00050000-5540-ce49-ffe1-5141d7155722	3203	Nova Cerkev
00050000-5540-ce49-39f2-374e8b4c501f	5000	Nova Gorica 
00050000-5540-ce49-9f5d-c2bf3c24741f	5001	Nova Gorica - poštni predali
00050000-5540-ce49-81ac-cd5c9136e2c2	1385	Nova vas
00050000-5540-ce49-6b9b-1102daf98d57	8000	Novo mesto
00050000-5540-ce49-0962-eb40e2a73316	8001	Novo mesto - poštni predali
00050000-5540-ce49-595a-84904bb8be84	6243	Obrov
00050000-5540-ce49-69ad-5c88b6d38c12	9233	Odranci
00050000-5540-ce49-016b-52263e20e2b6	2317	Oplotnica
00050000-5540-ce49-7481-425bd508ae98	2312	Orehova vas
00050000-5540-ce49-ad8c-e8b2862c9c78	2270	Ormož
00050000-5540-ce49-f01f-63588c8539f6	1316	Ortnek
00050000-5540-ce49-2250-a628ff739622	1337	Osilnica
00050000-5540-ce49-c0d8-57f20465a1cc	8222	Otočec
00050000-5540-ce49-a237-f4e0ebddc54e	2361	Ožbalt
00050000-5540-ce49-a19b-c24260bd134b	2231	Pernica
00050000-5540-ce49-3339-885196da87ab	2211	Pesnica pri Mariboru
00050000-5540-ce49-2a01-d1d299abbc39	9203	Petrovci
00050000-5540-ce49-e1c6-7b321c1f673d	3301	Petrovče
00050000-5540-ce49-a348-fdb84848666b	6330	Piran/Pirano
00050000-5540-ce49-645d-373004343871	8255	Pišece
00050000-5540-ce49-9c89-99e4e5a4ad3a	6257	Pivka
00050000-5540-ce49-15b3-99bf3a804a78	6232	Planina
00050000-5540-ce49-f6a8-4f03e535f862	3225	Planina pri Sevnici
00050000-5540-ce49-5cda-7613048820e4	6276	Pobegi
00050000-5540-ce49-e8e5-45ae796aa207	8312	Podbočje
00050000-5540-ce49-4852-8e8b888b08db	5243	Podbrdo
00050000-5540-ce49-20e3-f0d77ceb334b	3254	Podčetrtek
00050000-5540-ce49-a27a-77bb51928a2e	2273	Podgorci
00050000-5540-ce49-7756-30d99ea22fac	6216	Podgorje
00050000-5540-ce49-046a-0d0a6cbe7c79	2381	Podgorje pri Slovenj Gradcu
00050000-5540-ce49-5011-697c90479122	6244	Podgrad
00050000-5540-ce49-4a2b-87914c6013f6	1414	Podkum
00050000-5540-ce49-fe95-a002c6e03bd0	2286	Podlehnik
00050000-5540-ce49-c101-75172939bda2	5272	Podnanos
00050000-5540-ce49-a541-30ac2d99b87e	4244	Podnart
00050000-5540-ce49-ae79-292cb507a34b	3241	Podplat
00050000-5540-ce49-3ba0-1761c6aea85e	3257	Podsreda
00050000-5540-ce49-a910-ce8804170afe	2363	Podvelka
00050000-5540-ce49-90be-e73969eb845f	2208	Pohorje
00050000-5540-ce49-27fe-b48439f33cde	2257	Polenšak
00050000-5540-ce49-1bf1-e7b3e78a66aa	1355	Polhov Gradec
00050000-5540-ce49-0edf-fed70f081407	4223	Poljane nad Škofjo Loko
00050000-5540-ce49-6f45-31b8afebb24b	2319	Poljčane
00050000-5540-ce49-58e8-0a51a64a8bb2	1272	Polšnik
00050000-5540-ce49-ec2f-5e8db462b8b2	3313	Polzela
00050000-5540-ce49-289d-98b3f303632e	3232	Ponikva
00050000-5540-ce49-8c56-798fc3db1d87	6320	Portorož/Portorose
00050000-5540-ce49-f749-6c1b2a65460b	6230	Postojna
00050000-5540-ce49-15ad-79cf5f74e1e2	2331	Pragersko
00050000-5540-ce49-bb8d-39bb94a4676b	3312	Prebold
00050000-5540-ce49-abb7-7c8b2734ed60	4205	Preddvor
00050000-5540-ce49-6c05-7b465f9b5579	6255	Prem
00050000-5540-ce49-e7b2-15712289a197	1352	Preserje
00050000-5540-ce49-efbc-7fddac923ed0	6258	Prestranek
00050000-5540-ce49-e91c-21ce5700ddd3	2391	Prevalje
00050000-5540-ce49-3d99-a3d48293afe6	3262	Prevorje
00050000-5540-ce49-1b8e-713687c35d04	1276	Primskovo 
00050000-5540-ce49-1d00-d93d755ed6c8	3253	Pristava pri Mestinju
00050000-5540-ce49-c735-2fed6fe0ed3f	9207	Prosenjakovci/Partosfalva
00050000-5540-ce49-9b7f-52dc48469e2c	5297	Prvačina
00050000-5540-ce49-6721-a4d68d331410	2250	Ptuj
00050000-5540-ce49-6b6a-3999ae6eab93	2323	Ptujska Gora
00050000-5540-ce49-8bca-548b11d6fbc6	9201	Puconci
00050000-5540-ce49-ae71-fb0cc967ad58	2327	Rače
00050000-5540-ce49-64d7-56864165790f	1433	Radeče
00050000-5540-ce49-3edf-5c3a1cc92035	9252	Radenci
00050000-5540-ce49-f405-a1314ae50b4c	2360	Radlje ob Dravi
00050000-5540-ce49-035a-b1190894bf6c	1235	Radomlje
00050000-5540-ce49-ac83-ef58c772c5b5	4240	Radovljica
00050000-5540-ce49-7e6b-a79da1582d33	8274	Raka
00050000-5540-ce49-ba89-010bb4cdb567	1381	Rakek
00050000-5540-ce49-4655-0316e2c100fd	4283	Rateče - Planica
00050000-5540-ce49-e060-0498806276a6	2390	Ravne na Koroškem
00050000-5540-ce49-1179-ee37b0a34599	9246	Razkrižje
00050000-5540-ce49-10c9-3d8a35097889	3332	Rečica ob Savinji
00050000-5540-ce49-41c6-1c77fcc500d5	5292	Renče
00050000-5540-ce49-db07-6975f9c76f51	1310	Ribnica
00050000-5540-ce49-8f21-ed7b90f642fb	2364	Ribnica na Pohorju
00050000-5540-ce49-8a7e-bc81abc01b76	3272	Rimske Toplice
00050000-5540-ce49-89b6-170503fdc6f5	1314	Rob
00050000-5540-ce49-9626-b5987405522d	5215	Ročinj
00050000-5540-ce49-90f1-896825cbfc0b	3250	Rogaška Slatina
00050000-5540-ce49-ea3d-20e937e942ef	9262	Rogašovci
00050000-5540-ce49-e6a8-5c4a5dd4dec7	3252	Rogatec
00050000-5540-ce49-805a-05a0c0375949	1373	Rovte
00050000-5540-ce49-312f-9f179ee4b660	2342	Ruše
00050000-5540-ce49-d655-9e5d62d462b4	1282	Sava
00050000-5540-ce49-6eda-c876c6900a1c	6333	Sečovlje/Sicciole
00050000-5540-ce49-522c-2029e1db06f8	4227	Selca
00050000-5540-ce49-4238-b8a07505b877	2352	Selnica ob Dravi
00050000-5540-ce49-d681-8ce69bad5ead	8333	Semič
00050000-5540-ce49-99b4-363569f28f18	8281	Senovo
00050000-5540-ce49-9473-53f7852302aa	6224	Senožeče
00050000-5540-ce49-cab5-1c858037b388	8290	Sevnica
00050000-5540-ce49-9595-b045848546be	6210	Sežana
00050000-5540-ce49-fdd6-9db9ee54159b	2214	Sladki Vrh
00050000-5540-ce49-1ec4-e52ec5f09e3c	5283	Slap ob Idrijci
00050000-5540-ce49-a4b0-381252930254	2380	Slovenj Gradec
00050000-5540-ce49-96f7-408933e0f316	2310	Slovenska Bistrica
00050000-5540-ce49-57e7-5ef1d338c901	3210	Slovenske Konjice
00050000-5540-ce49-d679-118de02d599f	1216	Smlednik
00050000-5540-ce49-6a1d-b0b64e1c656c	5232	Soča
00050000-5540-ce49-2528-5b3128301e0a	1317	Sodražica
00050000-5540-ce49-caf0-ee0b7eff2fbc	3335	Solčava
00050000-5540-ce49-8067-740a7bc71c94	5250	Solkan
00050000-5540-ce49-2378-38b9a189f4d1	4229	Sorica
00050000-5540-ce49-8f54-c888a57df509	4225	Sovodenj
00050000-5540-ce49-7ad9-1e6449058282	5281	Spodnja Idrija
00050000-5540-ce49-76e8-7c5ad52f95a0	2241	Spodnji Duplek
00050000-5540-ce49-368c-b212e5f99684	9245	Spodnji Ivanjci
00050000-5540-ce49-5854-235c8aba7fab	2277	Središče ob Dravi
00050000-5540-ce49-73b4-2ee07b52f3d3	4267	Srednja vas v Bohinju
00050000-5540-ce49-c5b5-fef17bedfc41	8256	Sromlje 
00050000-5540-ce49-78b9-4abc18e39a46	5224	Srpenica
00050000-5540-ce49-6e45-c15a2b50bb60	1242	Stahovica
00050000-5540-ce49-fee7-1e73d84b805a	1332	Stara Cerkev
00050000-5540-ce49-5d74-b6ca97e28ce4	8342	Stari trg ob Kolpi
00050000-5540-ce49-69cf-bae0f27fcbf1	1386	Stari trg pri Ložu
00050000-5540-ce49-f1f4-e94adf632aff	2205	Starše
00050000-5540-ce49-c36c-0b359c61d99c	2289	Stoperce
00050000-5540-ce49-50dc-d04940cf76b7	8322	Stopiče
00050000-5540-ce49-3c3d-4a3c1746b81a	3206	Stranice
00050000-5540-ce49-6920-20976e5f7a42	8351	Straža
00050000-5540-ce49-77cd-6f5dbcf30144	1313	Struge
00050000-5540-ce49-2299-0c6b7757b6b0	8293	Studenec
00050000-5540-ce49-a6ae-3ab7c1e0f7fb	8331	Suhor
00050000-5540-ce49-a4f2-bf80d4c55222	2233	Sv. Ana v Slovenskih goricah
00050000-5540-ce49-c397-4bf7c6ef2ab0	2235	Sv. Trojica v Slovenskih goricah
00050000-5540-ce49-9ce3-0a833506b7be	2353	Sveti Duh na Ostrem Vrhu
00050000-5540-ce49-b2a4-87ab0b8ad2e2	9244	Sveti Jurij ob Ščavnici
00050000-5540-ce49-4ad0-eb9abd14d0ef	3264	Sveti Štefan
00050000-5540-ce49-1f22-7e1f3f41629c	2258	Sveti Tomaž
00050000-5540-ce49-9067-4db1cb9ca528	9204	Šalovci
00050000-5540-ce49-fd38-b4174d10da54	5261	Šempas
00050000-5540-ce49-b0cc-16b866a68e77	5290	Šempeter pri Gorici
00050000-5540-ce49-4ed9-d5f7f2d8512d	3311	Šempeter v Savinjski dolini
00050000-5540-ce49-8fc3-5490403b9674	4208	Šenčur
00050000-5540-ce49-226e-bf849ec275ad	2212	Šentilj v Slovenskih goricah
00050000-5540-ce49-fa34-88d3f3ad4f7f	8297	Šentjanž
00050000-5540-ce49-d430-66b97aca03a1	2373	Šentjanž pri Dravogradu
00050000-5540-ce49-efdb-7dc009296afc	8310	Šentjernej
00050000-5540-ce49-06dd-f64e91316178	3230	Šentjur
00050000-5540-ce49-3f68-0f7e08ea96ba	3271	Šentrupert
00050000-5540-ce49-422b-3f0b0c88276e	8232	Šentrupert
00050000-5540-ce49-fba5-45ba23ac79de	1296	Šentvid pri Stični
00050000-5540-ce49-857e-d0fe6c7c8738	8275	Škocjan
00050000-5540-ce49-a496-fb8f37eaf90d	6281	Škofije
00050000-5540-ce49-fe5e-613ca07fb734	4220	Škofja Loka
00050000-5540-ce49-8740-5f57d92900e6	3211	Škofja vas
00050000-5540-ce49-b493-87a06f20a9e7	1291	Škofljica
00050000-5540-ce49-6d8e-f33395ed3f23	6274	Šmarje
00050000-5540-ce49-ceb5-8284edfbbfcf	1293	Šmarje - Sap
00050000-5540-ce49-bce3-0253016454ee	3240	Šmarje pri Jelšah
00050000-5540-ce49-25b2-3ce7f986f682	8220	Šmarješke Toplice
00050000-5540-ce49-5841-f50bdd5928f1	2315	Šmartno na Pohorju
00050000-5540-ce49-52d2-b277c8e9ab65	3341	Šmartno ob Dreti
00050000-5540-ce49-5219-eada519f64e5	3327	Šmartno ob Paki
00050000-5540-ce49-f7f2-cc848f89ff1d	1275	Šmartno pri Litiji
00050000-5540-ce49-2e72-9680a1283128	2383	Šmartno pri Slovenj Gradcu
00050000-5540-ce49-7bf1-535339d07f59	3201	Šmartno v Rožni dolini
00050000-5540-ce49-43ac-772492960955	3325	Šoštanj
00050000-5540-ce49-1fc5-f084476643d8	6222	Štanjel
00050000-5540-ce49-bdbe-11a03c304ee2	3220	Štore
00050000-5540-ce49-5472-f54d807e8e0c	3304	Tabor
00050000-5540-ce49-32d5-1d1e65138c89	3221	Teharje
00050000-5540-ce49-056b-1c7520d904e7	9251	Tišina
00050000-5540-ce49-f27d-52beb3417cec	5220	Tolmin
00050000-5540-ce49-df97-a7f8dbca16a9	3326	Topolšica
00050000-5540-ce49-ba5b-ae003beb61b7	2371	Trbonje
00050000-5540-ce49-3026-6df58830ad81	1420	Trbovlje
00050000-5540-ce49-d1a8-d05987371742	8231	Trebelno 
00050000-5540-ce49-e677-f8b553d20d2a	8210	Trebnje
00050000-5540-ce49-a960-cc61a8bae8cd	5252	Trnovo pri Gorici
00050000-5540-ce49-2493-1023dd45013e	2254	Trnovska vas
00050000-5540-ce49-120d-8cd0e992e6c5	1222	Trojane
00050000-5540-ce49-2c53-c253ed9705d6	1236	Trzin
00050000-5540-ce49-c36e-a9b46ba20cb6	4290	Tržič
00050000-5540-ce49-4c25-123a78b71810	8295	Tržišče
00050000-5540-ce49-2b1c-522ec669f5c0	1311	Turjak
00050000-5540-ce49-8ff6-549dc698a3e3	9224	Turnišče
00050000-5540-ce49-4afb-c92e204d5689	8323	Uršna sela
00050000-5540-ce49-82da-8a9b60603423	1252	Vače
00050000-5540-ce49-039c-4172e977f583	3320	Velenje 
00050000-5540-ce49-32f5-225e276eef84	3322	Velenje - poštni predali
00050000-5540-ce49-8dd7-b105a2249638	8212	Velika Loka
00050000-5540-ce49-f25c-55223b899bdf	2274	Velika Nedelja
00050000-5540-ce49-2c74-a05c5f3106e0	9225	Velika Polana
00050000-5540-ce49-6b83-82317c6e8424	1315	Velike Lašče
00050000-5540-ce49-7607-f5cd9a81bc3a	8213	Veliki Gaber
00050000-5540-ce49-1cac-c86f9e1944bf	9241	Veržej
00050000-5540-ce49-3762-a7718e02f0b2	1312	Videm - Dobrepolje
00050000-5540-ce49-9706-65b7859bd625	2284	Videm pri Ptuju
00050000-5540-ce49-54bf-2f820b3a94de	8344	Vinica
00050000-5540-ce49-0e69-d481edfa6158	5271	Vipava
00050000-5540-ce49-1494-ff47dcc4065d	4212	Visoko
00050000-5540-ce49-8854-5f4f281a9d28	1294	Višnja Gora
00050000-5540-ce49-9a59-8fad17dc5c0c	3205	Vitanje
00050000-5540-ce49-adca-71800d4d7624	2255	Vitomarci
00050000-5540-ce49-bb7a-803e013403df	1217	Vodice
00050000-5540-ce49-9674-364c0113f32b	3212	Vojnik\t
00050000-5540-ce49-2f8f-ed335e0875c5	5293	Volčja Draga
00050000-5540-ce49-22c9-bcd5c01a77a3	2232	Voličina
00050000-5540-ce49-0e2c-658aa9c65994	3305	Vransko
00050000-5540-ce49-64d0-f89222b86f34	6217	Vremski Britof
00050000-5540-ce49-97a1-6ad584eb18c9	1360	Vrhnika
00050000-5540-ce49-d249-b1a265e219ce	2365	Vuhred
00050000-5540-ce49-1361-f9f21635db62	2367	Vuzenica
00050000-5540-ce49-fb90-27524baa4449	8292	Zabukovje 
00050000-5540-ce49-66b8-67fcd1fed199	1410	Zagorje ob Savi
00050000-5540-ce49-0701-da38e93271ae	1303	Zagradec
00050000-5540-ce49-4f49-d540cb9c03b2	2283	Zavrč
00050000-5540-ce49-d5d5-195427e12be6	8272	Zdole 
00050000-5540-ce49-d6ff-45ece0ac62ca	4201	Zgornja Besnica
00050000-5540-ce49-8ffa-dccfa2a82924	2242	Zgornja Korena
00050000-5540-ce49-4430-c7bf26bfe47a	2201	Zgornja Kungota
00050000-5540-ce49-f698-2c08ed168892	2316	Zgornja Ložnica
00050000-5540-ce49-9789-7ed7b37fd55e	2314	Zgornja Polskava
00050000-5540-ce49-24e9-6d0e7176a072	2213	Zgornja Velka
00050000-5540-ce49-10a3-89628025b634	4247	Zgornje Gorje
00050000-5540-ce49-d069-5c0e6b0d1a44	4206	Zgornje Jezersko
00050000-5540-ce49-d664-6eab658ca2fe	2285	Zgornji Leskovec
00050000-5540-ce49-45fc-143b84696929	1432	Zidani Most
00050000-5540-ce49-2bc1-cde8e16f510e	3214	Zreče
00050000-5540-ce49-6ae7-62490934ee17	4209	Žabnica
00050000-5540-ce49-675c-0a485639990f	3310	Žalec
00050000-5540-ce49-da16-9706a3e04766	4228	Železniki
00050000-5540-ce49-d2cc-2e0cb78d6d0b	2287	Žetale
00050000-5540-ce49-62ac-c54dae1efee3	4226	Žiri
00050000-5540-ce49-ee4f-01ed43a9ca97	4274	Žirovnica
00050000-5540-ce49-197b-02ae9c0801fa	8360	Žužemberk
\.


--
-- TOC entry 2660 (class 0 OID 1720934)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1720757)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1720823)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1720946)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1721051)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1721095)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 1720975)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 1720919)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1720909)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1721085)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1721041)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1720622)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5540-ce49-147a-79a50df4c3af	00010000-5540-ce49-53b3-e8f733d54009	2015-04-29 14:27:54	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO3sUyctLduZQoGgChtrsc8P9IPZicvmG";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2667 (class 0 OID 1720984)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 1720662)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5540-ce49-d10b-5d50bb9804e1	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5540-ce49-c728-bce82ff8e61c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5540-ce49-0eba-8e9227e8ae38	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5540-ce49-80de-84f40baf4b70	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5540-ce49-33d1-c8cfdd856c1e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5540-ce49-fb66-8a56438a05cf	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2633 (class 0 OID 1720645)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5540-ce49-147a-79a50df4c3af	00020000-5540-ce49-80de-84f40baf4b70
00010000-5540-ce49-53b3-e8f733d54009	00020000-5540-ce49-80de-84f40baf4b70
\.


--
-- TOC entry 2669 (class 0 OID 1720998)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1720940)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1720890)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1720722)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1720896)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1721076)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1720792)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 1720631)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5540-ce49-53b3-e8f733d54009	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROA2bqUy/CVTq3PgTh072ngqYr99Ygk66	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5540-ce49-147a-79a50df4c3af	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2681 (class 0 OID 1721126)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1720838)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1720967)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1721033)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1720866)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 1721116)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1721023)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2276 (class 2606 OID 1720686)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 1721165)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 1721158)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 1721075)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 1720856)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 1720889)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 1720818)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 1721019)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 1720836)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 1720883)
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
-- TOC entry 2366 (class 2606 OID 1720932)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 1720959)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 1720790)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2280 (class 2606 OID 1720695)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 1720754)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2282 (class 2606 OID 1720720)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 1720675)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 1720660)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 1720965)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 1720997)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 1721112)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 1720747)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 1720778)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 1720938)
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
-- TOC entry 2300 (class 2606 OID 1720768)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 1720827)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 1720950)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 1721057)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 1721100)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 1720982)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 1720923)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 1720914)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 1721094)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 1721048)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 1720630)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 1720988)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 1720649)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2269 (class 2606 OID 1720669)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 1721006)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 1720945)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 1720895)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 1720727)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 1720905)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 1721084)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 1720803)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 1720643)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 1721140)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 1720842)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 1720973)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 1721039)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 1720878)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 1721125)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 1721032)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 1259 OID 1720863)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2288 (class 1259 OID 1720749)
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
-- TOC entry 2379 (class 1259 OID 1720966)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2373 (class 1259 OID 1720952)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2374 (class 1259 OID 1720951)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2325 (class 1259 OID 1720843)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 1721022)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2401 (class 1259 OID 1721020)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 1721021)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2425 (class 1259 OID 1721113)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 1721114)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2427 (class 1259 OID 1721115)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2432 (class 1259 OID 1721143)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2433 (class 1259 OID 1721142)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2434 (class 1259 OID 1721141)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2307 (class 1259 OID 1720805)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2308 (class 1259 OID 1720804)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 1720756)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2293 (class 1259 OID 1720755)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 1720989)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2343 (class 1259 OID 1720884)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2271 (class 1259 OID 1720676)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2272 (class 1259 OID 1720677)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2393 (class 1259 OID 1721009)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2394 (class 1259 OID 1721008)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2395 (class 1259 OID 1721007)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2317 (class 1259 OID 1720828)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2318 (class 1259 OID 1720830)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2319 (class 1259 OID 1720829)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2353 (class 1259 OID 1720918)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2354 (class 1259 OID 1720916)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2355 (class 1259 OID 1720915)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2356 (class 1259 OID 1720917)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 1720650)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 1720651)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2382 (class 1259 OID 1720974)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2368 (class 1259 OID 1720939)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2408 (class 1259 OID 1721049)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2409 (class 1259 OID 1721050)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2296 (class 1259 OID 1720770)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2297 (class 1259 OID 1720769)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2298 (class 1259 OID 1720771)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2412 (class 1259 OID 1721058)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2413 (class 1259 OID 1721059)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2443 (class 1259 OID 1721168)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2444 (class 1259 OID 1721167)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2445 (class 1259 OID 1721170)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2446 (class 1259 OID 1721166)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2447 (class 1259 OID 1721169)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2405 (class 1259 OID 1721040)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2359 (class 1259 OID 1720927)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2360 (class 1259 OID 1720926)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2361 (class 1259 OID 1720924)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2362 (class 1259 OID 1720925)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2439 (class 1259 OID 1721160)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 1721159)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2324 (class 1259 OID 1720837)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2277 (class 1259 OID 1720697)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2278 (class 1259 OID 1720696)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2284 (class 1259 OID 1720728)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2285 (class 1259 OID 1720729)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 1720908)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2349 (class 1259 OID 1720907)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2350 (class 1259 OID 1720906)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2331 (class 1259 OID 1720865)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2332 (class 1259 OID 1720861)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2333 (class 1259 OID 1720858)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2334 (class 1259 OID 1720859)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2335 (class 1259 OID 1720857)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2336 (class 1259 OID 1720862)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2337 (class 1259 OID 1720860)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2291 (class 1259 OID 1720748)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1720819)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2314 (class 1259 OID 1720821)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2315 (class 1259 OID 1720820)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2316 (class 1259 OID 1720822)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2367 (class 1259 OID 1720933)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2283 (class 1259 OID 1720721)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2306 (class 1259 OID 1720791)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2258 (class 1259 OID 1720644)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2387 (class 1259 OID 1720983)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2267 (class 1259 OID 1720661)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2303 (class 1259 OID 1720779)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2424 (class 1259 OID 1721101)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2270 (class 1259 OID 1720670)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2338 (class 1259 OID 1720864)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2472 (class 2606 OID 1721301)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2475 (class 2606 OID 1721286)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2474 (class 2606 OID 1721291)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2470 (class 2606 OID 1721311)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2476 (class 2606 OID 1721281)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2471 (class 2606 OID 1721306)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2473 (class 2606 OID 1721296)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2457 (class 2606 OID 1721216)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2493 (class 2606 OID 1721396)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 1721391)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2492 (class 2606 OID 1721386)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2469 (class 2606 OID 1721276)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1721436)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2501 (class 2606 OID 1721426)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 1721431)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2489 (class 2606 OID 1721376)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 1721471)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2509 (class 2606 OID 1721476)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 1721481)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2511 (class 2606 OID 1721496)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2512 (class 2606 OID 1721491)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2513 (class 2606 OID 1721486)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2463 (class 2606 OID 1721251)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2464 (class 2606 OID 1721246)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 1721226)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 1721221)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 1721201)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2495 (class 2606 OID 1721406)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2477 (class 2606 OID 1721316)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2451 (class 2606 OID 1721181)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 1721186)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2496 (class 2606 OID 1721421)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2497 (class 2606 OID 1721416)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2498 (class 2606 OID 1721411)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2467 (class 2606 OID 1721256)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 1721266)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2466 (class 2606 OID 1721261)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2481 (class 2606 OID 1721351)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2483 (class 2606 OID 1721341)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2484 (class 2606 OID 1721336)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2482 (class 2606 OID 1721346)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2449 (class 2606 OID 1721171)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 1721176)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2494 (class 2606 OID 1721401)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2490 (class 2606 OID 1721381)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2504 (class 2606 OID 1721446)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2503 (class 2606 OID 1721451)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2461 (class 2606 OID 1721236)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 1721231)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2460 (class 2606 OID 1721241)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1721456)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 1721461)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2518 (class 2606 OID 1721521)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 1721516)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2516 (class 2606 OID 1721531)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2520 (class 2606 OID 1721511)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2517 (class 2606 OID 1721526)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2502 (class 2606 OID 1721441)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2485 (class 2606 OID 1721371)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2486 (class 2606 OID 1721366)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2488 (class 2606 OID 1721356)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2487 (class 2606 OID 1721361)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2514 (class 2606 OID 1721506)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 1721501)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2468 (class 2606 OID 1721271)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2507 (class 2606 OID 1721466)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 1721196)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2453 (class 2606 OID 1721191)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2456 (class 2606 OID 1721206)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 1721211)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2478 (class 2606 OID 1721331)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2479 (class 2606 OID 1721326)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2480 (class 2606 OID 1721321)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-29 14:27:54 CEST

--
-- PostgreSQL database dump complete
--

