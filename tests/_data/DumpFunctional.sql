--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-25 00:03:49 CEST

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
-- TOC entry 179 (class 1259 OID 1421524)
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
-- TOC entry 225 (class 1259 OID 1422007)
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
-- TOC entry 224 (class 1259 OID 1421990)
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
-- TOC entry 217 (class 1259 OID 1421906)
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
-- TOC entry 193 (class 1259 OID 1421690)
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
-- TOC entry 196 (class 1259 OID 1421731)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1421652)
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
-- TOC entry 212 (class 1259 OID 1421856)
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
-- TOC entry 191 (class 1259 OID 1421677)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1421725)
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
-- TOC entry 201 (class 1259 OID 1421774)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1421799)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1421626)
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
-- TOC entry 180 (class 1259 OID 1421533)
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
-- TOC entry 181 (class 1259 OID 1421544)
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
-- TOC entry 184 (class 1259 OID 1421596)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1421499)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1421517)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1421806)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1421836)
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
-- TOC entry 221 (class 1259 OID 1421948)
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
-- TOC entry 183 (class 1259 OID 1421576)
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
-- TOC entry 186 (class 1259 OID 1421618)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1421780)
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
-- TOC entry 185 (class 1259 OID 1421603)
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
-- TOC entry 190 (class 1259 OID 1421669)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1421792)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1421897)
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
-- TOC entry 220 (class 1259 OID 1421941)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1421821)
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
-- TOC entry 200 (class 1259 OID 1421765)
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
-- TOC entry 199 (class 1259 OID 1421755)
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
-- TOC entry 219 (class 1259 OID 1421931)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1421887)
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
-- TOC entry 173 (class 1259 OID 1421469)
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
-- TOC entry 172 (class 1259 OID 1421467)
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
-- TOC entry 209 (class 1259 OID 1421830)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1421508)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1421492)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1421844)
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
-- TOC entry 203 (class 1259 OID 1421786)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1421736)
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
-- TOC entry 182 (class 1259 OID 1421568)
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
-- TOC entry 198 (class 1259 OID 1421742)
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
-- TOC entry 218 (class 1259 OID 1421922)
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
-- TOC entry 188 (class 1259 OID 1421638)
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
-- TOC entry 174 (class 1259 OID 1421478)
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
-- TOC entry 223 (class 1259 OID 1421972)
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
-- TOC entry 192 (class 1259 OID 1421684)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1421813)
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
-- TOC entry 214 (class 1259 OID 1421879)
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
-- TOC entry 194 (class 1259 OID 1421712)
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
-- TOC entry 222 (class 1259 OID 1421962)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1421869)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1421472)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 1421524)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1422007)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 1421990)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1421906)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1421690)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1421731)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1421652)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-553a-bdc3-4e50-d5a40eec8eb1	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-553a-bdc3-3c36-00f6ba3c185c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-553a-bdc3-12ff-c3317dfed1bb	AL	ALB	008	Albania 	Albanija	\N
00040000-553a-bdc3-cda9-1fcca8dc7e58	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-553a-bdc3-6f1f-1d1248a2307c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-553a-bdc3-4e10-78e05555ffab	AD	AND	020	Andorra 	Andora	\N
00040000-553a-bdc3-bc9c-d3d57866f1eb	AO	AGO	024	Angola 	Angola	\N
00040000-553a-bdc3-a1f6-82c700b9d00c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-553a-bdc3-43fb-45efacea7d13	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-553a-bdc3-7286-591cba46b44a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-bdc3-a794-eb74abfafd13	AR	ARG	032	Argentina 	Argenitna	\N
00040000-553a-bdc3-22f1-5b2b1511ce85	AM	ARM	051	Armenia 	Armenija	\N
00040000-553a-bdc3-fdcf-316a732d3b87	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-553a-bdc3-9326-401d0c47fa83	AU	AUS	036	Australia 	Avstralija	\N
00040000-553a-bdc3-3bcc-2444fa8d8ce8	AT	AUT	040	Austria 	Avstrija	\N
00040000-553a-bdc3-43df-2eca5edf210a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-553a-bdc3-220f-cb0a45906414	BS	BHS	044	Bahamas 	Bahami	\N
00040000-553a-bdc3-e5b9-0ef7dffa6a00	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-553a-bdc3-c836-a9a398063719	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-553a-bdc3-6d1d-babe26af3704	BB	BRB	052	Barbados 	Barbados	\N
00040000-553a-bdc3-4933-b2558f77fb82	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-553a-bdc3-dae9-bdd614c46746	BE	BEL	056	Belgium 	Belgija	\N
00040000-553a-bdc3-6917-2c7c11eee3e4	BZ	BLZ	084	Belize 	Belize	\N
00040000-553a-bdc3-fc6c-5f3275998e3b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-553a-bdc3-03c4-c7d79dcb943b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-553a-bdc3-ffd3-5ed663a0803a	BT	BTN	064	Bhutan 	Butan	\N
00040000-553a-bdc3-ac84-ff9a1b1efbba	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-553a-bdc3-971b-952e81f7a7cf	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-553a-bdc3-f81c-067bbf06726f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-553a-bdc3-c068-00f42be1748b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-553a-bdc3-a362-f71e49eab3a4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-553a-bdc3-8a66-eda84348d038	BR	BRA	076	Brazil 	Brazilija	\N
00040000-553a-bdc3-7a82-25efebacb3c1	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-553a-bdc3-6bea-f040b2c71514	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-553a-bdc3-a4a6-5bdadbcacc64	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-553a-bdc3-51ae-3ed4e536e278	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-553a-bdc3-441d-a970611b903d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-553a-bdc3-d574-484b60949505	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-553a-bdc3-df9e-3954ba057d0e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-553a-bdc3-f67f-b101465e036c	CA	CAN	124	Canada 	Kanada	\N
00040000-553a-bdc3-dc14-4d3d88c07ad7	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-553a-bdc3-5668-57002e828747	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-553a-bdc3-4ab0-e20d00c8e23a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-553a-bdc3-37ab-2bbd4833fb0e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-553a-bdc3-a8de-bbde09bae93b	CL	CHL	152	Chile 	Čile	\N
00040000-553a-bdc3-660b-0318898ef3c6	CN	CHN	156	China 	Kitajska	\N
00040000-553a-bdc3-6249-0bbde8caf8da	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-553a-bdc3-55ae-4b47b0280211	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-553a-bdc3-258c-068b30eb39ae	CO	COL	170	Colombia 	Kolumbija	\N
00040000-553a-bdc3-a627-4dc0232863cb	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-553a-bdc3-82aa-86214cda2e23	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-553a-bdc3-3094-043c45c3562b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-553a-bdc3-0553-44b06d7814a2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-553a-bdc3-fc59-e983b47ac0b5	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-553a-bdc3-382b-17e09149775c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-553a-bdc3-8150-3ae70a1c2d17	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-553a-bdc3-3dde-40f12ec71fd4	CU	CUB	192	Cuba 	Kuba	\N
00040000-553a-bdc3-6756-321477e3d9d8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-553a-bdc3-d424-6b44aa37b07e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-553a-bdc3-7134-2685172f9cef	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-553a-bdc3-a458-f8a3f56ad247	DK	DNK	208	Denmark 	Danska	\N
00040000-553a-bdc3-e2b8-fd3373336aa1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-553a-bdc3-86b3-7768379d2ecf	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-bdc3-cd55-69656cb6ccdd	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-553a-bdc3-8776-bbdde40fbca7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-553a-bdc3-7f7d-b3bb5be07585	EG	EGY	818	Egypt 	Egipt	\N
00040000-553a-bdc3-27f4-8f189ee37830	SV	SLV	222	El Salvador 	Salvador	\N
00040000-553a-bdc3-db1c-2b267abbce92	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-553a-bdc3-5860-ddd9214523be	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-553a-bdc3-e196-b05f8207e4a2	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-553a-bdc3-3b28-8adc46a40c61	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-553a-bdc3-14b3-086bc05f456d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-553a-bdc3-1c38-5c7514b138a3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-553a-bdc3-08cd-b1314c468964	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-553a-bdc3-7956-d642f05198f0	FI	FIN	246	Finland 	Finska	\N
00040000-553a-bdc3-d1e5-ec10e42850c0	FR	FRA	250	France 	Francija	\N
00040000-553a-bdc3-9212-709662697156	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-553a-bdc3-a920-1b03c88ba01e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-553a-bdc3-a787-567719e2f22b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-553a-bdc3-f61e-38d8d4da2df8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-553a-bdc3-f3b4-eac4c5090aa5	GA	GAB	266	Gabon 	Gabon	\N
00040000-553a-bdc3-7f4f-fcd5698d7db3	GM	GMB	270	Gambia 	Gambija	\N
00040000-553a-bdc3-6c70-ad981f62ba37	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-553a-bdc3-55b1-cea0c6298df8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-553a-bdc3-3d33-a045152dc2cf	GH	GHA	288	Ghana 	Gana	\N
00040000-553a-bdc3-f331-1b664215e528	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-553a-bdc3-a168-7685793feaba	GR	GRC	300	Greece 	Grčija	\N
00040000-553a-bdc3-be99-c290acf67db0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-553a-bdc3-d380-519b7c1935cc	GD	GRD	308	Grenada 	Grenada	\N
00040000-553a-bdc3-e6ab-8a67ec9fac65	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-553a-bdc3-5b47-326d66979a1e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-553a-bdc3-2510-161060a61570	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-553a-bdc3-741b-4860fa4566c1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-553a-bdc3-dd6c-21e2b8c1d2b3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-553a-bdc3-73e9-5b4c864722d5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-553a-bdc3-037e-c375ba8d57cc	GY	GUY	328	Guyana 	Gvajana	\N
00040000-553a-bdc3-c6bf-85e5a849ca7c	HT	HTI	332	Haiti 	Haiti	\N
00040000-553a-bdc3-a3c9-5386bd88b292	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-553a-bdc3-9ebf-d12e304b88c7	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-553a-bdc3-353a-ddfde1b1f60a	HN	HND	340	Honduras 	Honduras	\N
00040000-553a-bdc3-8e65-69bb39059bf3	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-553a-bdc3-9c1c-7f73801ef8fa	HU	HUN	348	Hungary 	Madžarska	\N
00040000-553a-bdc3-c14c-8ec8e98133e6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-553a-bdc3-c87a-395ba9f3782f	IN	IND	356	India 	Indija	\N
00040000-553a-bdc3-b18f-66c0df8421b3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-553a-bdc3-cac9-b6d5fd737517	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-553a-bdc3-b7da-8d52c60a5944	IQ	IRQ	368	Iraq 	Irak	\N
00040000-553a-bdc3-4383-2b12cf0895d3	IE	IRL	372	Ireland 	Irska	\N
00040000-553a-bdc3-c846-b71f9e67dc3c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-553a-bdc3-97de-da0aec6f4544	IL	ISR	376	Israel 	Izrael	\N
00040000-553a-bdc3-25e0-849f6c71a9fd	IT	ITA	380	Italy 	Italija	\N
00040000-553a-bdc3-55bf-3ce57edeb611	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-553a-bdc3-ddf0-93cb94d5cb98	JP	JPN	392	Japan 	Japonska	\N
00040000-553a-bdc3-b401-70cc1cdf4131	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-553a-bdc3-4339-d79dd71bb83c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-553a-bdc3-86dd-956615cef90f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-553a-bdc3-9056-3e7d489d2d9f	KE	KEN	404	Kenya 	Kenija	\N
00040000-553a-bdc3-b911-1e8207d6be36	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-553a-bdc3-0230-0f4027a67cc1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-553a-bdc3-fa3b-af455a4ffba3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-553a-bdc3-6afb-ee0d3b4d293c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-553a-bdc3-1058-1892dc467feb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-553a-bdc3-c409-57caa79d162d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-553a-bdc3-62e1-1d0f50b61a49	LV	LVA	428	Latvia 	Latvija	\N
00040000-553a-bdc3-09ca-6278dadb9196	LB	LBN	422	Lebanon 	Libanon	\N
00040000-553a-bdc3-f7f9-0c1713659f68	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-553a-bdc3-7f42-19ead6636738	LR	LBR	430	Liberia 	Liberija	\N
00040000-553a-bdc3-d7cf-e2bb7dd91d1f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-553a-bdc3-e2dc-5f59fe0d7e18	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-553a-bdc3-d49e-eaa2acf51df9	LT	LTU	440	Lithuania 	Litva	\N
00040000-553a-bdc3-2ada-0ea6d47a651d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-553a-bdc3-d89c-cfc97d873ad9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-553a-bdc3-bcb7-3ba5b1279374	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-553a-bdc3-de1a-514cc1d1a470	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-553a-bdc3-04cf-773c53084a46	MW	MWI	454	Malawi 	Malavi	\N
00040000-553a-bdc3-d75e-1a1dfc8aed7b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-553a-bdc3-b226-de80d1a9c16e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-553a-bdc3-fa80-4ac31faba62a	ML	MLI	466	Mali 	Mali	\N
00040000-553a-bdc3-e802-ab7530bc77b0	MT	MLT	470	Malta 	Malta	\N
00040000-553a-bdc3-bf1f-90b5113b2579	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-553a-bdc3-8105-4b35f95b57e8	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-553a-bdc3-d403-560ca346314a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-553a-bdc3-75ae-8fb2dc72bdf2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-553a-bdc3-255e-01d81ca7b4be	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-553a-bdc3-18be-31b18159d985	MX	MEX	484	Mexico 	Mehika	\N
00040000-553a-bdc3-31ac-f6ebc85d6344	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-553a-bdc3-bcba-6fb15a8862a6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-553a-bdc3-fac7-d4d9c0efbcc2	MC	MCO	492	Monaco 	Monako	\N
00040000-553a-bdc3-7db1-b6a8eed19328	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-553a-bdc3-ea76-94b7ef635c92	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-553a-bdc3-b3a6-6821ca313e95	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-553a-bdc3-25f9-390ecad18625	MA	MAR	504	Morocco 	Maroko	\N
00040000-553a-bdc3-01e4-f930064db8c1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-553a-bdc3-35c7-e30bfbef8feb	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-553a-bdc3-5b6e-7f43bfc204aa	NA	NAM	516	Namibia 	Namibija	\N
00040000-553a-bdc3-0046-d9db06f99f99	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-553a-bdc3-b417-82e940b82901	NP	NPL	524	Nepal 	Nepal	\N
00040000-553a-bdc3-2832-eaca3d3619b6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-553a-bdc3-9a8f-1fa66af913e9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-553a-bdc3-aa37-ed9544ba58be	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-553a-bdc3-6b09-09ef1ff6b7f7	NE	NER	562	Niger 	Niger 	\N
00040000-553a-bdc3-a3f2-3d56d217d64b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-553a-bdc3-720d-b1a5012ca0da	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-553a-bdc3-9b0d-d52649eb5c00	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-553a-bdc3-575a-deb5231c03cd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-553a-bdc3-a522-05b3152eafa8	NO	NOR	578	Norway 	Norveška	\N
00040000-553a-bdc3-d577-c45f8c5d4b9f	OM	OMN	512	Oman 	Oman	\N
00040000-553a-bdc3-acdf-1196244b4b62	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-553a-bdc3-c625-21b63e5c6def	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-553a-bdc3-0319-fecd8ab63210	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-553a-bdc3-e002-2cec771970c4	PA	PAN	591	Panama 	Panama	\N
00040000-553a-bdc3-13d5-296c8558113c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-553a-bdc3-878c-204252dc4578	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-553a-bdc3-6705-dc9beaeb3932	PE	PER	604	Peru 	Peru	\N
00040000-553a-bdc3-4148-4ee5de460b27	PH	PHL	608	Philippines 	Filipini	\N
00040000-553a-bdc3-0668-c68a655b9bd8	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-553a-bdc3-aa20-07eef4c27698	PL	POL	616	Poland 	Poljska	\N
00040000-553a-bdc3-226a-6017d3b96490	PT	PRT	620	Portugal 	Portugalska	\N
00040000-553a-bdc3-fa51-ba2c52cc6514	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-553a-bdc3-060d-902828f1c8d5	QA	QAT	634	Qatar 	Katar	\N
00040000-553a-bdc3-bb6f-987129736e5f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-553a-bdc3-11ff-12632a47ecf3	RO	ROU	642	Romania 	Romunija	\N
00040000-553a-bdc3-020c-93d7cbed1961	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-553a-bdc3-15d8-62c9a9a60a5c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-553a-bdc3-ee00-b562dc07f1bc	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-553a-bdc3-8903-d5fc9826a7ed	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-553a-bdc3-aaf2-9474ee88b640	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-553a-bdc3-4581-af1d5518d13d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-553a-bdc3-11d1-e25dcfaae0e9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-553a-bdc3-52ee-7157baba71ce	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-553a-bdc3-cfc8-1aed19c3661d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-553a-bdc3-e700-bb11795ce346	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-553a-bdc3-b790-552bb153cfba	SM	SMR	674	San Marino 	San Marino	\N
00040000-553a-bdc3-b441-309f8c6169ff	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-553a-bdc3-1889-561cfe7e799e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-553a-bdc3-7df1-e72bb6afaab6	SN	SEN	686	Senegal 	Senegal	\N
00040000-553a-bdc3-decf-b7bca07739a1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-553a-bdc3-d727-d76ecadd19a8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-553a-bdc3-b50d-affcc5b26a55	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-553a-bdc3-a382-fc17f52fe3dc	SG	SGP	702	Singapore 	Singapur	\N
00040000-553a-bdc3-54cc-6379e4c1dce0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-553a-bdc3-39a2-4e7ca7244766	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-553a-bdc3-776b-a6a4386aecb3	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-553a-bdc3-da3a-d2cd84ad58da	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-553a-bdc3-a44a-c66d65a65e00	SO	SOM	706	Somalia 	Somalija	\N
00040000-553a-bdc3-7eaa-6b8a3ead0882	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-553a-bdc3-bb93-ca579e4f7229	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-553a-bdc3-3360-9df2ef8a39a0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-553a-bdc3-b26c-d1eba8b83733	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-553a-bdc3-39d6-e49bfeb6190a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-553a-bdc3-8165-e4bc4fd45569	SD	SDN	729	Sudan 	Sudan	\N
00040000-553a-bdc3-54ef-ba4a81a6aa3f	SR	SUR	740	Suriname 	Surinam	\N
00040000-553a-bdc3-63e2-fb32f2470b2f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-553a-bdc3-997b-18927371266f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-553a-bdc3-8ec2-fa9203a95e26	SE	SWE	752	Sweden 	Švedska	\N
00040000-553a-bdc3-3809-c9afd56fcc14	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-553a-bdc3-51df-e3c163957162	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-553a-bdc3-c2eb-3ecd86455191	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-553a-bdc3-4bac-98af6bd41c15	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-553a-bdc3-b359-7c39b371f56b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-553a-bdc3-e8a6-d86fe4cf4f72	TH	THA	764	Thailand 	Tajska	\N
00040000-553a-bdc3-8b48-d294e7465a07	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-553a-bdc3-8534-e5585159527d	TG	TGO	768	Togo 	Togo	\N
00040000-553a-bdc3-9944-b500cc2eb11c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-553a-bdc3-6f52-dfe48d3fea2d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-553a-bdc3-696b-3c3a85352ccf	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-553a-bdc3-af2e-5ddc5df6c127	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-553a-bdc3-3ef1-8328380d30f1	TR	TUR	792	Turkey 	Turčija	\N
00040000-553a-bdc3-58da-fc541c094bc2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-553a-bdc3-4bf3-df587fba8aa5	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-bdc3-4a78-7aa462a7faff	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-553a-bdc3-58d1-d0361786a233	UG	UGA	800	Uganda 	Uganda	\N
00040000-553a-bdc3-51b6-9951d3bd244c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-553a-bdc3-281b-7b10ccbe2c1b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-553a-bdc3-aa04-cbd405b1a3ca	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-553a-bdc3-2945-dbbab679ff30	US	USA	840	United States 	Združene države Amerike	\N
00040000-553a-bdc3-9b03-d0aba3dc8003	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-553a-bdc3-4470-fef902d19f2e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-553a-bdc3-e3b7-77494f3f6a88	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-553a-bdc3-1ff4-bdeb474d57d4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-553a-bdc3-9b91-ffc8d044a05b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-553a-bdc3-f73f-c2232d3b3720	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-553a-bdc3-b1f8-ad0523c10793	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-bdc3-d483-e18ce70136f7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-553a-bdc3-6569-494e76bc35a5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-553a-bdc3-1039-74ffcc1f3273	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-553a-bdc3-6d1d-dd7412454a1f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-553a-bdc3-509e-ce4d3da615d0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-553a-bdc3-97b8-daa631720e4e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 1421856)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1421677)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1421725)
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
-- TOC entry 2658 (class 0 OID 1421774)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1421799)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1421626)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-553a-bdc5-cc71-bbda20d0b987	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-553a-bdc5-21d8-aba77a1d11a8	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-553a-bdc5-f8ea-16c7dd3535e6	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-553a-bdc5-d8c5-66bc4507de9f	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-553a-bdc5-3d08-8e132d384445	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-553a-bdc5-1688-02531bed0aa8	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-553a-bdc5-d3c8-585c47ea8ea3	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-553a-bdc5-c0cd-718a31d737ec	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-553a-bdc5-65f8-c390bb03445b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-553a-bdc5-45cc-0f20cb8db0bd	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 1421533)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-553a-bdc5-1dc7-2b1c7cf5f02e	00000000-553a-bdc5-3d08-8e132d384445	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-553a-bdc5-a233-986f79c09c05	00000000-553a-bdc5-3d08-8e132d384445	00010000-553a-bdc4-d3ce-d6c592f50353	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-553a-bdc5-2f15-6ea2a25e9217	00000000-553a-bdc5-1688-02531bed0aa8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 1421544)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1421596)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 1421499)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-553a-bdc3-0ed6-9f5d63c18c2e	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-683a-34ac4f61933b	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-4366-30c1279d7c25	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-bd8b-e1402a7b3c42	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-2c5e-512ea8797f8a	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-0647-cafd9837a4b1	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-11b0-6702e7370d36	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-5cd4-1174eda1fea0	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-439e-d521a696a6fe	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-b7fb-f49aefdd02ef	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-b1be-977642b174d1	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-0631-1c3d6df7fc6d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-d99b-11d82c67cb2d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-4f24-cb7be8e90375	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-efc2-646b65af67d5	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-6e7f-90857a57afc1	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-8ed3-66140426226b	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-dd95-bc18da2c2d51	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-b8bf-18a65fc71e31	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-4e9e-1786eb00be9f	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-7be6-380b7023821d	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-a754-16584b1232f1	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-1f2e-0369e6ee8d83	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-ac69-413c085477ff	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-9745-02a18c237911	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-ff6a-1cfefc33361b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-35f3-b82ad7e841e3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-68e0-18170c40b629	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-bbc2-9b8f4dd17ab7	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-c857-763d2c93f2e8	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-60fe-87ec77b4388b	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-c2a3-34a142553084	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-c353-c8239c130a98	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-46e5-07bc4ab6e481	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-d3b4-dee544100271	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-913e-58299f51621e	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-0949-59013aca92a9	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-eb59-9012c95ce741	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-8bb1-25795804444d	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-b8dc-c73d64e53556	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-2bc7-f86a2031406d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-cee3-d20dd31208b6	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-8049-83826f0484f2	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-9383-fcaf24828347	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-a2a9-bc381bccae62	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-a435-dd1618de5f27	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-ccf0-11ff9b16203d	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-551f-7681e336c1a0	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-79ae-59157b410092	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-7180-066fc7066dcb	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-1b54-b5a425a99ae9	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-866b-c1cd20fcadaa	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-f3f7-a3b9ce59ad6a	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-8017-4054f98c909b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-5f0c-119a5b6ea983	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-1459-789ead6e2910	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-3a2a-7f6342fc1ac2	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-34aa-f195aa17012a	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-ea26-eb918d82eb44	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-7ee4-6ac13d71bfcd	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-db4a-4c44f1927277	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-81c9-ab3263eaee0b	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-04be-e893730eda76	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-c63f-efd948ae5ef5	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-190d-ab442f596e62	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-a3f2-545a579b830e	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-d79c-b2345bc1a9b5	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-0aa9-3056e6283980	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-feba-f099609cd562	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-1072-d368b021e4f9	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-603b-21b277edc9de	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-4662-47dce3b42ebb	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-72a1-ebb06514cf88	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-8861-aad18d4691d5	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-3ff5-56b7af804e7f	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-cae1-cc076b3d20b4	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-a4ac-d7d6d2f48dc9	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-580c-f65d24efa8e0	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-43f2-3c48e160ab9c	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-db90-e7e4289555dd	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-fa74-51f7d35eff00	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-6776-d6fbeb0db608	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-9f06-1647e90667ce	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-78dd-4758bec83170	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-323f-923b1c97d40d	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-756f-5b6740a07177	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-9a23-009d86928de1	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-051b-692bb9378e1d	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-03e4-bf68d0ba9eb9	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-9361-b08e8a876288	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-17fe-266ec227c70b	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-b96d-b1dddbf479f2	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-1ab8-cf1939c60590	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-4842-b26c44ccc905	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-2241-4d6ba45447c8	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-9b6f-fda5137f3818	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-623b-05f3d2ef612d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-f924-f42b0d3eed45	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-4905-f0792497b9ab	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-b8ff-c30d821fca97	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-5749-1ab516989d44	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-1dda-7b69762131ba	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-865e-47786c60270a	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-5a5f-a54137ebda43	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-8843-73d9662465ad	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-185e-15c895a87bcd	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-ab98-5091a261eb1e	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-d008-bb7ac5303084	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-7c3f-e425f1dae61c	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-a20e-2f2c0d65c8ee	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-ef0e-1731ff8c476a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-e8ea-c8c4f28be470	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-fa30-0bd417374114	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-d8e9-49d962f350c9	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-baf4-b7d3fe78a621	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-0c9f-de44927bfd69	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-4c19-e7f437a45b13	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-ca15-31ac4dd5e828	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-5f12-a1a574b4b4a4	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-1313-62578f3d1f82	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-3e18-d930f8b4c1a3	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-1007-206bddba43d7	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-53d2-ebe5838c8894	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-3d4b-340b60eee528	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-b089-c2cc85d554f8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-8131-8b1b266dce9e	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-c899-435553563c0c	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-07ed-130c7f9846fe	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-3f5b-0e577e61b50e	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-c0e9-1782c7a85004	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-60fb-87a7497a7950	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-0b3f-2de9ec48ced2	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-e275-0d0468e4def3	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-cc87-9087bb8750ff	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-5f5e-ba0b7c6a3a66	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-11a5-b3aaab2551f2	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-444d-e1fa4a3aecc5	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-5b84-549622422691	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-900b-2d5003115b64	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-e711-752be72542d6	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-7582-bd4166889de9	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-8190-baaf85c213ca	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-aa10-e165c176034c	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-49c5-05fef0674bcb	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-c672-450a0d9b860a	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-45d0-f3cead9f1248	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-39da-c2a67b2013df	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-d935-f8e8b4a4fe9c	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-a2cd-a02ff1cf998b	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-ac88-9a5df777292b	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-add0-5a0bbe4cf334	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-6674-74918a5ba972	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-bed1-bcf098691a2d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-c9ce-24fca607b294	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-fdb5-a793e2305c83	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-e7af-2107929acd34	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-cf84-260f493ecd21	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-5ee6-3c3d6602f3e5	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-2937-179198f17544	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-abe7-1852358db491	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-5059-6aa4f4a33cb4	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-a143-b25985928d43	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-b380-a0da9a360bcd	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-7cff-f5884b1f74e9	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-fb64-f9b596c1cdc5	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-45aa-024aeb13deb5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-ba3f-3d1fc3d1864e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-5e5c-02202cbf11da	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-12f0-649fdbc343f1	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-4630-20215f29a8f4	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-ee6b-4be23f94675f	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-fd6f-6f90440ee105	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-fd97-73e62fc724e2	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-ca63-39f981b6e5d9	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-ca87-2827fbeb6b0b	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-abf3-511b223b656b	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-704f-984a87b84bb1	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-06b6-105453fcb044	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-88f7-16091d38b0db	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-803c-9a00a9af8057	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-9998-a4f5bb97ce74	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-31ef-97cd62fe8dbc	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-006d-ef6a6156df10	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-fcb2-deffcf6d980f	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-6f87-752e6b276961	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-b773-50a1e2e81d85	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-457b-479b27632917	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-025c-cb68d98c2295	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-b984-7338286f8043	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-cd8e-02375eefed0d	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-dcbc-b22c98a92744	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-865a-c29a91624a83	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-6955-4576681a91e6	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-19ca-7006d7927246	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-0a3c-1b2038c2b5bc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-cf2e-f616eb28d319	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-5f87-7e395d95709a	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-3400-374a3e94e8ee	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-9524-80ecb885179c	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-7df7-ad770102b6c8	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-6424-c9727f5d28a7	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-d182-8a6f75273945	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-176a-9d58e6847f1b	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-1df9-dde6a3eac004	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-13cd-fce97ad982d6	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-f54c-d0f249da713a	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-457a-25d8d322b338	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-40eb-0f3c26b73462	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-ea84-de621fb9c539	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-ae8e-1275ca70adde	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-e019-222b2e72f0ad	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-886f-fde3e14b0748	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-c657-0429113fc137	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-6b20-0bdaa50690d0	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-9e8a-e18c9ea31b7e	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-2a4a-e4f35a22dc99	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-16e5-2bb1020cef7f	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-7b3c-0886fe5c461e	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-7819-84110b0130cf	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-0b18-0edb47d3895e	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-3674-c7aec4272e75	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-9936-eeb62feda2f6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-159a-ac87019253bb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-91f5-a97d870e1b98	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-1885-8db6fb3d3895	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-96a5-60693629be1d	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-2699-5a0751334a17	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-b951-1b56a0343f20	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-2366-7b87cf944ba6	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-1fa2-1770580ef45e	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-f9c9-efbed1a2d499	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-17d7-797c6cd4e3b9	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-4d29-38c6ead04995	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-e27a-29bec1c6da69	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-c6c4-c224da53782b	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-902d-a61e27287f61	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-567b-0a2adbc5a24c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-5950-e2439c97de58	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-0ab5-b45f06665ab5	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-b5f4-08ee45157976	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-9a63-14226c05aaa9	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-c995-92e48546a6ef	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-53c9-9d9a5c62f669	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-9888-b59eb4b564e7	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-6aa3-09c3ca320130	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-9651-67ec3fedecb9	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-f2a9-964dbcfe03f4	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-f7fb-ecf1e00bee88	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-10f0-1c35375f8a72	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-88b7-332c681c5566	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-ed91-9cc48f0ec8be	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-e4e9-b5219816f4b6	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-658f-6ade5b4f4327	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-75e1-8c901b45fb35	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-1d05-a9f426c61d85	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-e3d2-b8511828c356	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-07ba-d3748daccbe1	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-fd20-924f06498f41	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-a493-01d237dca3b5	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-c650-711b438180e9	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-294b-8f8bfb019248	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-2785-86949d692acf	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-4e44-d6c1082ab0b5	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-7811-2aef2253921c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-b74f-c65fecf80a75	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-30bb-6f26afb085e2	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-c110-925738559acd	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-bb4f-afaf5558a7ce	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-ee13-39cfc4566bb2	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-33fc-22d28f381bba	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-b86a-136334a062e1	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-d238-23709a065999	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-1a2f-be5499494491	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-395f-0e67a4925184	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-2382-beccb5be0282	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-e7cc-3273b1abf2b0	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-77f9-5f91be5491ff	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-be5c-fdfe4bb7e24b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-eb33-3ae51641c77d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-394d-aa8ce3e1105e	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-c94c-15438dbae995	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-9b0a-dd8b0c9376c4	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-b810-e6c52762a6c2	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-a5e0-bc3d703ade81	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-e418-a5d22f667f83	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-e877-56085c11263f	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-9da7-4672c4c4ee3f	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-719e-69b1910f6e1d	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-f4fe-e3878842d71c	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-bfaf-6c95eb06b96b	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-0f14-7fa3e21b0a11	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-7bc6-c4cf8a93900a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-f436-e790c3d9acd3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-6b92-f7ed14e01454	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-2935-b8ad89bc3289	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-b259-2173ada217a1	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-319f-bd26151642e5	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-6c00-d6a1fc994781	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-3cfc-e46366dc5109	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-9807-2e0ff6564b5b	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-ae91-a24a1bbefd96	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-e074-1cb74c2b6e78	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-0aea-638d1d8aa00a	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-b9a7-a1c1eca65abf	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-8cbd-1356bd789f94	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-1bc3-0c272e1ca9b9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-de08-088c90487a1d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-84cc-f75522e55e1b	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-ef2c-95639ad1ee25	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-2174-ea0a04186d3a	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-3517-fa26fb760444	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-a45c-5e074efd8648	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-fe52-394954d8d316	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-c72b-46019dbb48e4	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-833c-d7c8dfe73168	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-0a28-491a5059d602	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-aaed-f17fc7a17c48	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-9e9f-c2f6aef26723	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-9734-4be82bb1a59c	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-a4f8-a24164ddab88	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-83fe-b6e3cc0ffac4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-aa73-502fa78623f7	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-f3a3-51cfa114851d	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-a43d-223a8dc4885c	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-ec43-350ca172c13e	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-cdcb-4062ec7c3414	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-c1a4-f931eb72a2c9	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-459e-fa707fa036d9	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-ecc7-41565bcca991	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-1ac2-9ca940d96dfb	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-6547-c60a15c53ee8	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-955c-fd5c20f5a726	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-f8d0-4762fcae05ca	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-5518-480aa2589564	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-947f-1a771fe363ae	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-be69-fa73ebcafa65	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-48e2-0cb20c7a152d	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-a09c-1297ae9663b0	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-9cbd-b2c08477c522	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-d5ef-4c4e18fe6daf	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-5758-becbc745d4f4	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-2910-1b3b79e68535	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-d29d-c5ccde068cbd	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-0295-d14bf1376cff	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-6a99-2e4401d5ad14	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-f6ac-7b9badc2ff2d	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-8db6-ae304d861851	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-3e10-f4ee04aa75ae	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-a595-7b0d95316ea8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-a9f4-d748b21ba8d2	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-61d4-1c1fa90489b7	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-90d0-e43a20d4fcd6	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-0dcb-416968cc0d22	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-d374-78b4de6a86a2	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-9e7e-7e6ae6eb7452	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-d801-7b1441b4eb27	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-2c68-14de88568676	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-480e-58d8445fd7b2	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-f78a-31a2dacbc790	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-6eb0-b30fa3bf0168	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-83f2-5e0a53426c96	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-c085-10aafa23c01d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-e04c-ab9a048e70cd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-1112-a758ece53449	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-9f45-021322667c14	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-8a41-2c6c87c19a70	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-0d2a-5ce6134eeaa4	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-3bda-dd4b4ffcf49f	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-2b9f-3b6d7722c371	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-6503-c17da810346c	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-97d8-e22b72418e8d	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-290d-7838245a81b4	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-6082-1e5d7a26eb59	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-fba0-e07fe693a127	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-84ab-1c7d6a578c5b	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-9da2-d8e77356b794	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-b68a-ccbde03a7c29	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-b353-6de884ae9cd8	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-a306-31fc421e1d9e	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-b6bc-919d5e117020	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-513f-5254a82ce27d	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-73c9-c158c862252b	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-5fb6-010943fa52f8	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-3dc1-3960670ebaae	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-29a6-9cd414763245	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-b236-f466ac94f566	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-da11-b2f052e86b41	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-368a-647d01b7390f	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-c2f4-008fd8dca2cd	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-0802-5d5652f2e31b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-76b1-f16919b2fda6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-9298-e6e932f9a6de	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-6cd6-94017503a55a	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-7135-9a1d1de6f0ec	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-9f81-b9cc5225f8e5	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-9a00-51d36aa05cf8	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-19b5-4a78c23c9002	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-645e-93a681377cc6	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-2867-c5903cb5e394	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-a92e-1c836fa70448	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-c08e-2d5af25cb865	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-3b51-b8a9dfe89cab	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-c258-519c3adef298	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-db6a-62efa288077b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-c526-14c60884c11a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-0d19-2a7f23812a05	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-f343-3c30a4649eef	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-0d5a-2bfb941039a6	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-ed98-f4d3b2aa4f79	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-d439-ed844a094543	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-5401-f730c3cb42c2	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-beb0-c2231a5a8d19	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-a175-5ff94f08236c	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-edf3-bb0308587f94	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-fde5-831d50993d43	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-7d3a-fa56984ec194	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-aa52-41967bed6eb6	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-c5b5-f4918b0c5a66	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-6b8d-60d37b8789b2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-e208-9f4bfd57a3e5	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-3f29-de2411b5ad7c	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-f06b-5bf2026fd3ca	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-255f-1885d3468b0c	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-ba7b-ed674b53584b	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-550c-eb3ec41b669c	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-efa0-302da4593023	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-a30a-7a19c14f520f	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-506c-662e7dc35b2a	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-cf39-41a16337e1f4	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-c77d-2677c7b5b489	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-f631-b1c8c6866508	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-c42e-434af5041fa8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-6b21-19c70e28375c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc3-0863-f9c176d70bcc	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc3-c9ea-5b09b9cabc04	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc3-9bac-572072ffc0a2	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc3-6315-7f8de072b8c7	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc3-f440-7df6611b8d9f	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc3-621a-a0e273d2c448	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc3-751b-93746beeb93c	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc3-47f2-f717d370e91e	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc3-f4f5-153c9891475d	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc3-8faa-155186bd046b	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc3-4203-876e8deddfd6	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc3-b119-8d27a1ba4d96	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc3-1bfe-226bc6e3aa62	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc3-03e3-db6e40187d57	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-cd3b-2f1b6732cfae	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-12de-163eb6952b53	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-8d7d-eedabc4e9a6d	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-46a2-244c9efa7f57	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-663f-ae4c8c855156	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-fe1b-a5ca6080a561	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-9a34-90d41cdc96a0	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-be57-77f3476ea602	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-e485-611ba9e118f9	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-9797-a8548c09c572	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-26ad-8f30939d59ea	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-1526-222ce4a16ca5	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-a5a5-d70ddb85f8aa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-3b9a-6d1051b968dd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-91d9-05f5db54d333	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-818c-81c977519476	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-6bcf-b07412e7247f	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-9d6e-eb781b82220a	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-081f-d7bc6c75e5dd	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-181f-30522d55b6d3	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-fd27-3b5add105c19	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-436a-94987a0ec86d	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-c3c7-dfdd1b3b6152	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-2c96-5a98c8904e54	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-d5af-9f95728116bd	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-1e5f-6629dc0681bf	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-873a-ceb76e1f9328	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-b70d-bc54a8048218	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-5b8c-6c336865f312	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-c990-35e36f834f64	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-4549-110ec7e25dbf	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-19fc-6328eb225650	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-809b-09dba9e7f743	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-ee98-75db9f95bad0	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-ccb6-e72a979c9417	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-48a1-d78873968bf7	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-cab7-50f81ed3e338	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-f71e-0067f23fd0d0	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-36b6-a95c6528bcc7	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-b974-26d377e89d0e	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-dfb1-2a0c192bcbbb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-6add-b5a17ce5103f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-db23-cc79a8bf5462	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-a0f9-478ca79dd863	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-b9cd-999f2ef0a9df	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-54ab-572239332e28	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-18ca-328798ae6fb1	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-ac39-07fc62f743de	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-a793-8db7879ecc80	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-91e4-ffbefd1ce1d1	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-cf6f-4cabfbc143e6	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-7242-40daf3b19adb	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-bc12-efe462320380	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-e1ba-c55de64ba49f	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-bf67-5878467b8deb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-3c56-a869c7d3460e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-d17e-83777af6c0a9	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-05b7-c71cb47b2bc6	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-a9e7-6ef10fdfd20f	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-9868-2780f170fec0	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-1935-7c7d3d2de1ee	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-952c-b207f8f8cbbd	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-63a7-6238b859c816	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-5cf3-7249422e1ce3	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-f374-272bc1e2282e	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-24d0-944a9093fe85	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-93e2-984ee1e3c261	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-53a3-fe580990223a	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-4165-5fc2986275c3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-36d8-f5743ffd0a3b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-f56f-e7ecf4c1f8ca	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-8772-472b8d5bf5a2	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-1c28-0d96caa025a1	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-2f14-d5d03170fddd	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-bfc9-74688f23d548	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-6a2d-95f0c5d131ed	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-fa33-5583afd61539	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-381f-6624a23a17ce	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-0c4f-ce1634b71ce7	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-eca4-31c5b4bcf54f	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-c702-05244178097a	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-3619-1028e1d2a9b0	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-efdc-7f6937f0a57d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-307a-88a5e1ba4a8a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-afc3-73b5950d2059	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-7433-6497472e72cd	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-a27d-8d6f43338f5b	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-8dcc-72e58ddb3c63	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-78d6-33250e07be8b	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-6698-0b3802e2efbf	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-bbc0-f5e9a5bdca37	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-87b6-47ba8cd1aef2	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-b04c-b8ae4d63496e	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-25a2-edbd8b9891cb	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-a6d8-da5b737545fd	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-2986-65364da8c5a8	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-d603-4c092e014f47	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-fe27-b3c8ba40f43e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-f5e0-96b936d07519	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-7474-c5cc3338660e	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-802f-29dfc23dd7d5	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-7bcc-2006e5fa1654	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-e0b9-4c58c597262c	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-3573-5391d190fc75	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-ebc8-4752b3f87326	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-4d57-5f2b0d655495	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-5675-257af3961055	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-277c-e73e2dab7d7c	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-d053-d8da10c956d1	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-9bcd-ec7e02a40ee9	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-b899-0ec719da6960	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-22aa-53a6c231ede3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-2711-340af721fae4	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-d9f4-0bf9b6488371	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-e1ae-78827b7f6de8	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-4010-2fdbe924b274	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-4b03-12a1057277df	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-a6ec-720c53c7fd68	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-1a60-03c6c4a66659	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-4593-5068c17c6879	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-256a-60ebf62e6f4e	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-86cc-1996c0f6f5d2	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-182d-dc9a822d1d52	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-a668-a5e2d3464c6d	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-4c07-0373a57ab329	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-7c04-965827d9f974	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-1317-f388446ec548	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-9c20-72f36cf1def5	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-b4b6-a6b5b800d914	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-95a3-3f60822f6325	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-60be-b770e35f6b9e	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-722d-de9dd07b0c90	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-7a7c-ecd6a5f74ad2	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-1ed7-97af88952037	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-b00d-d74c54f6b11f	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-9f76-10210dba12fc	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-04e3-911cdcd799e7	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-d106-199109c2183a	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-877d-5fc1eee99f0f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-222f-8fee470852dc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-243d-d840a5f19a9b	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-4164-227b1a93fb67	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-5844-1789043801d5	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-6961-6b8040b08096	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-2418-6a5519b4a661	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-c477-f83e5372d687	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-7e67-df47a9ade0cf	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-cc68-97bd3e4c7ba4	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-3930-b21107c2ac41	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-ba16-4b23d434ea2c	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-fd57-86a2dea2cc7c	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-26dd-1623fbf78f43	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-37cf-bb7c1c41adb8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-8b7f-f2390f6e256a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-e2a9-196bc7ad3795	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-3269-4479e0643cf6	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-80c4-c870aad30fa5	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-9904-11a4a8529eef	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-1704-add7fc65ab60	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-92e5-781cccd95e22	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-a3a8-085830f15283	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-31be-a940f7073b13	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-a3ab-007f386db0da	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-5e28-203aee8f39f3	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-e368-f1662a25a041	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-fe86-1bc1e929ad26	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-d598-b9822cee8d59	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-970a-f526cad74845	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-138b-61368e75bfe1	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-4b1e-73ebf5d8a905	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-623c-f472959ddecd	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-27d2-79d59aa114f5	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-d551-c2093bff1f91	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-25da-326ac9ed1cef	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-0e0e-1ea0d579ac43	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-9c63-670bab85ece4	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-300b-da9897392de9	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-6220-0fe9639e693b	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-5e7e-515df3dd65ca	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-37fb-9667468259a1	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-9f7c-39d28dcc07fb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-5108-f814489da25e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-dbfa-3e4234d9992d	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-7981-be6172bd8431	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-4f65-4ad2ca899ee2	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-c4ce-3ca48ff76bd7	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-730a-20d02842013e	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-a4c7-61001e174ee0	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-fb8c-42287b3494e9	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-4bba-638fb5ef2500	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-0198-168ad520fb4c	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-8c32-b3118b64ed01	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-c422-51624cbb4728	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-d8cf-4e6861ece24d	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-9a8e-da826f718441	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-7f2b-8750466bc364	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-97c2-f64dc1ac6a25	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-72ec-d59cd2107b0c	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-465a-5150d8cf7aa5	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-fc18-5d67be15b6cf	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-5781-84558f2bc784	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-6424-ecec1237a6c1	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-1e7a-70a7accfc0d6	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-2422-10e54c8d1186	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-a5fe-a1536f2b032c	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-a187-b763d4fbf9ef	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-0769-a94d7af0164e	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-0466-ae7b3c04f5e9	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-cf5b-5b33fa7ccd9d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-4967-211f059f43c5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-2957-9244f498ad02	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-f732-44f6bfa89c3f	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-5d23-6d9951acad2c	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-25f3-237ce0ffe7c4	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-8a9a-02c95d9eba19	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-942e-917888aa3292	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-de58-1926b3ff64f4	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-962f-ec90ee0f489f	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-05d5-a40a6f506cdd	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-dab3-b8b49fc108d3	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-a0bf-52a611ab17d6	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-d1da-24658b4f38f4	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-0706-c5f780249a48	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-006c-1d2b0aaa2dd2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-8077-675b7bd42460	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-4ca0-45afd94ea4ef	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-4053-fa6ba0b5e75b	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-bbb3-94c83cdd8200	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-01b6-2c51baecd560	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-dc77-860ffb40fa61	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-aa8d-37373f74eb70	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-69f5-324dd1a20dde	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-5d5d-d3286ffd36d3	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-4b3f-40440fa6b8f8	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-309d-01662eb20075	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-b958-5c4a7107bf25	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-8735-16ac3f20e2e6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-8392-d6cd09b28729	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-adb8-aeaf09ed559a	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-adf1-8b773f8aa26c	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-cc4a-53f1f36f845e	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-5759-d5dbef343dfc	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-8908-ea7567f3460f	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-1af9-40cce1662fac	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-f90b-c0f11fd4f24c	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-2684-0b65da416369	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-d2f4-ade4e3cf2560	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-964c-22bb6d2734bf	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-d002-c9b349c8d52a	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-7911-b467c117d9d4	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-2252-d97f23ef133d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-9fc4-7f0f6a7675ea	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-484b-6783eb34d8a4	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-7af3-c7a136f32572	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-f45c-e6b658665646	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-e815-f40e70354d6f	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-bd38-2e710c584258	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-e875-610b5b963302	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-aab7-0c88b29a884a	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-d8af-4e4a9fe57017	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-84c7-effab5706c02	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-203c-5679f3d65c83	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-c836-da902ea38b89	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-08ff-13854593edf0	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-db39-8e7f673fe211	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-69c0-28fea15fbf4f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-19a1-464231800b48	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-f38a-927d3e9ff8dc	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-24f5-5614f1a6f591	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-8321-6ff1f93c41ff	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-7ac6-83421089f4dd	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-cc60-221500ef547f	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-3d0e-dd366a0d45fb	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-6fa5-1491f08e1868	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-b058-b386573fba50	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-ba12-8f12da292038	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-1412-79ca8e56b138	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-8f6e-fc82e2130ec7	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-f371-85362b7df394	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-a4d6-958648f0f2cf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-e5b3-378f98a7024c	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-cba2-3dd1abfd02e2	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-32e6-8c87fd865ee7	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-21a8-51b9a64d6feb	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-75e1-b68d283dcbb2	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-5ecb-299c240c75ea	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-36c1-a4c80a703fbb	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-aa0f-bfe63a5dd6cf	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-06d6-794566fa77f1	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-5de2-2b7b31de47fa	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-62ad-2147794b8e7d	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-437f-076175eb5442	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-1c17-608c1aeec009	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-8a01-97e5b7438333	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-9e4c-8726f8659478	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-3c33-23471e7af985	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-f996-633413604acd	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-cb0a-c443d8cf02d9	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-62e9-8a666320bccb	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-7eed-861c52ec5672	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-60cf-d8437f449dc6	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-7ec7-ae9abf5e0e07	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-7737-e42131d911d9	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-7d0f-9b513f7afef6	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-d65e-1ab864a6ded2	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-1f85-5aff4e0a87a0	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-70ae-81a9bf8f20b6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-a045-7ad4ed62401d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-d686-8f518ab3113d	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-ed03-1a76db78c533	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-3e7a-744397e3a843	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-1fc8-1d144e85a1aa	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-9990-e3389722f11b	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-2f43-3fc0b910787c	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-0064-c0c7adfca1a9	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-d0f2-fee1ac8f245b	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-af4d-97bf345dc5bc	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-5605-38a10a4e1352	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-d983-44a5d7dda43b	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-1391-1c5257985f95	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-5b6b-c381a7853359	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-82b5-e221b9281b55	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-781b-15a8549d4749	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-d18c-3312f37011c5	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-2510-7f35d24676a9	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-32df-309c68848b32	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-554a-6a6eb8e91821	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-3f36-fabbb0b216fd	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-dc79-4eedf872cef8	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-7270-2f34e78357d4	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-552b-3af35d776f4b	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-ba9a-ea098d7daf2c	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-e7a5-26efed98e4ca	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-670e-1fdab9a074cd	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-5486-a468530e5187	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-23db-09513382e399	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-1d22-b09b974341e6	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-349c-d7243c25a0f2	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-8b86-50ec22c750f3	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-bebc-ac9be35be4cf	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-564b-02a9744377fb	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-02bf-4b36b0d7e189	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-1cc7-ec51bf3918a2	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-726c-81b24a628c01	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-3b6d-eb85921a8f03	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-5cf2-ee837fb70e81	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-2859-f21aa34fb782	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-da1e-6adc0bc0cc31	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-6522-dedf8371c43f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-d15f-a756606c36b6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-ffd0-e59eca54b172	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-0f8b-5669ba34c8b2	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-21f7-b2f76e45b71f	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-7dd0-8703ca25b79b	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-d0b7-bdc31c3297f4	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-a437-addcbf5bb741	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-dd1a-1c027f7ceb76	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-7dab-0813cf8d3f50	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-b917-f714e056d677	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-da57-fa171624d6d3	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-2cfb-bd34a5880d79	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-7939-74e8368fab10	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-b9d6-d6e92b4da0ea	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-330e-1e73f6cae43f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-be69-523c742601ba	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-bb49-bc86412a7523	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-ed3f-2ee667ba9ceb	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-bb40-7c04c0191e49	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-d32d-0dd829789897	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-d1cd-c32979c020d2	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-f8f8-0114b8171c8d	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-ce89-8eacddb58b3b	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-51a5-1261157be3a4	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-cc32-4c4e9ecc05b6	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-630c-04f35418d0e0	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-52b3-93ff0806e539	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-3a87-80a04670b02c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-0513-9be8a545d0af	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-7ef6-1635ed2b1372	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-6655-9a9235df3df4	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-3a3d-72c845d3cc3a	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-02d7-da9082ce6877	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-14d6-589b2fbcc1ef	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-5893-1200fce86c5b	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-f024-71ec03ed325b	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-088d-1c7dd30e08c9	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-b5d9-49e66189e21d	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-f0c5-634e6d901342	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-bf39-ca73533c7b69	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-b269-c33270b137dc	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-f572-7ee170a26720	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-e147-97cc039b4c64	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-cd9c-d6b7d2cde0a0	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-c8e4-1ee0e5afaece	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-e9fc-6eca222a3787	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-8718-900d54739a11	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-46db-a4e8d6f03441	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-8225-4ffa9ee15bd4	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-0cdb-3ad90d4d4b4c	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-6b7c-e47ad41ce6ff	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-d8dd-382860808110	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-ee15-8eabeadcb14f	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-e879-28a566bc962a	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-84b6-3c9d14578611	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-efca-57ef640f1179	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-b1a2-f6435a650bbb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-985b-da764831c592	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-2488-a2964596d973	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-3d71-3d800e2a9139	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-2fae-f22bddcbed8f	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-0779-d62243af4f76	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-197d-2af84c32444d	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-b3ae-bcc9fbfe0229	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-ea0b-cde51473c234	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-15f1-b101c1af24ce	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-9c70-774e4bb493ca	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-63c6-5009b9c13047	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-b834-7ffea4fc7901	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-eca2-3ff66349c0b4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-132e-4e0d1d18ca1e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-e8e2-dc8589bb7210	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-375f-4c28753b9df6	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-3082-e4ad8f520d94	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-540e-b504fc0600b4	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-5b05-52aa533cb46b	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-0bf0-d14569e02fbe	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-090e-f6afa49d0147	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-a317-1941ba7d716e	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-65a1-2a0336044b3f	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-0752-ec3352194948	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-ff0d-d32d3a1a9b04	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-8d83-2df28bb17aa2	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-c582-230712fa5cba	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-b7fb-613f3b0bfe11	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-96e6-42d952035fa2	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-9d49-03c30564abf4	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-19bd-fd478ce7bbe3	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-1afb-fee5c1701a86	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-4eb1-e8988a49e879	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-9e98-3b1c24f2cd98	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-2afb-f132736283d1	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-eb8e-5308f29c0a91	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-5ba5-47d56e7c1382	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-e40b-d5b440359592	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-555f-2ae4f6a776d1	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-b663-764d47dc22e2	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-4467-7179ae7ea7a8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-af29-fc5b01a40a75	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-fe71-9fbb563012c2	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-1e14-a9cf098ab92b	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-a47f-122eeb93544c	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-a27f-2b65ae374028	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-7415-4456bf1e95f5	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-047b-0458e2603853	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-64e7-1e2aba150be4	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-9538-e3658483923b	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-46a1-cd94400adbbe	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-2532-8922bc9ea2f1	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-0165-80aa0f1fb01c	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-d015-86c0d8a953c9	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-d5c5-9ce8b49a7917	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-1f2e-4b8b1c0757ac	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-19ea-6e608cd86e41	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-505c-82b0edc602a9	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-ea90-8f7d67ffd173	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-6c52-0fe9606011f7	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-1630-86adcbae46af	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-a89b-d665a5d7a654	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-d37e-89e482be61ac	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-dfe4-25ecd404faba	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-b4b5-d0bdaa22a9a3	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-b77b-8b98dfcd5de6	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-7eda-0844ed66cba1	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-1530-cd1f1095160f	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-6ac3-65dc34ed3730	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-0cc6-0d8f2ca9e19b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-a76d-271ffeaf54aa	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-2a01-47ae415d4b9a	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-53f4-15ff2719be75	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-cb16-f30335885979	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-a012-b58dc5b4818c	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-e4c4-99f53e4ba493	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-b32c-050e875950f3	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-9377-e618587b3d27	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-df4b-9638c7461818	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-6a11-b78ddbdb07c5	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-70fd-87595f563994	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-eb3e-3f53b5bfc69c	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-e558-fa2b1c381a29	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-bed3-1c78c45006c1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-1f5d-5e251064613e	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-fff2-71cdcbf3ef58	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-b537-ba029ccf8ae9	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-f0b9-3a8aa14c3828	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-2dbd-c0a021cc5155	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-a2b5-66ed70523891	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-6b3f-224b6006b715	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-1dc0-4f4a8be53bad	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-e4b8-21dcb9706113	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-b0a9-85b1f323c012	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-77fe-9f462ad7adc4	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-bf01-0f8156843a5e	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-8bcd-f7ebb0a06dbd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-ad24-714b07d9b4f0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-552a-199250ed4b1c	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-de7e-1811034d91d7	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-984b-ca50191bb270	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-e487-2d0ba6611ed6	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-448d-d39f6cd9d741	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-d801-05740c88cd1f	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-1ee3-f030dd6d00c2	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-4c56-a758ac3d5e7b	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-5432-9b27e29cf04f	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-d75b-7b36c70459d3	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-3494-af6f1ba3398a	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-edf8-5a76d53a1468	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-8979-ccf6eb3eed04	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-3173-140506d5eeee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-5ccb-2c02bdb98111	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-d8d3-f2dab6075dfd	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-b037-e396b5cc4741	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-ec25-b8d7e51d6966	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-eb9f-2204c229ed7f	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-3858-b3935678ce0f	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-19ba-bda4e372f8c7	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-bbcb-3b4500cb47dc	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-840f-ffc860d2c33a	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-1962-5fbf3d0cfaf2	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-f751-677daa9cbb8e	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-5d4e-38f3824c29c8	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-a763-b072704d3e48	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-973e-3aef33804289	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-3811-6c8453823123	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-0301-8da3d133223e	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-844c-2e2072b0dd27	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-294e-792bfe9747b7	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-f901-fb8d5b354bd9	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-8eef-cfd4b51be516	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-3e5b-879d0ae0b68f	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-070a-b3c62aadecc9	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-3c3a-94ad76b2617d	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-d372-c0f8945c0427	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-0a20-04be1083ac88	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-8637-ef6ad5756ad0	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-31fc-402ae5d706cc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-ec75-91c58c8495e3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-870b-11c9278cd8ce	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-8545-8471766103b7	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-2a27-d89477106c9f	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-8bdf-97e62fcb75e1	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-4e69-7f2127d80712	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-793b-db9269fbdad6	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-a34a-6780d8745877	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-d7e5-f1d68df3ba76	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-0983-96f2ec460950	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-6420-7fed3c300637	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-a52f-bacad842b5df	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-a671-d3252aa21f97	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-2946-92eaf0094c66	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-9e13-b117d701a41c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-58ff-666a43883a0c	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-214a-8eb6e3fd9583	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-e7cb-5c59cb57c685	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-6f94-52c731f6617d	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-6e69-acd46ffa76da	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-b236-ecca9d78c7cc	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-ce78-65ffbcb5af55	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-50db-5307fe83210c	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-6c96-0d08b56b8253	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-ae32-7502e948b935	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-0a01-63cfcacb22b3	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-df5b-28b8f1a65035	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-e39d-9d931e10bed1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-736a-2d1e71ec0ae6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-f741-620ba49dfa87	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-9bc0-76d3bc074235	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-31f2-fdf48cd28ff0	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-930a-f4bf5d3665cc	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-2875-3a411b6940ff	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-f77e-1b1544844bf2	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-3721-580549dcb315	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-c345-d2d2818cbc6f	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-5aed-dccd0dae1b23	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-402c-fa190d1606bb	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-ce92-a6b08892124c	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-84ee-098185d326c5	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-517a-70893b9b6642	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-23b8-7b4b09a4f3c2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-691c-d6800d6cf2eb	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-5d51-15513399a7db	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-de71-996e76043b53	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-c176-27340ed1a4e7	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-5396-4b110adc843b	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-c1ff-5fdb52e5e041	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-49df-2300bac35e5a	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-ca71-4992c21231f4	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-24ee-12f240b7ffff	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-cd24-76232742f81f	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-3501-d7bfc5df7f89	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-f792-07c5c2b6b566	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-4250-79859e778095	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-acb9-25b2c8bc3507	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-f96b-c61eab928309	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-206b-885aecde944e	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-05c7-a13040c44ad1	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-0824-ab930cc302b2	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-3629-cfadbfb5f3aa	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-ee9c-8c525fedcee8	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-00c8-b59e6a40758c	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-15f7-dbd215332727	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-ae24-ddf6302bb9ab	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-c6d6-2352e26b0b22	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-2e86-bb02d153ed9e	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-cdcb-321c3f37db56	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-9eab-daafc288b3d0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-2578-4793963becf8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-447e-6adfe3359836	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-884d-621c4f0ab425	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-3fce-f7f526f40c82	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-dc60-a578453b26ae	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-b9dc-b82e85f6d794	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-01ca-c97db0f54264	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-6a1e-3112337fbac3	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-ed2c-3a8b1e691664	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-2ba5-75da653ccddd	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-cce6-b88a72f8d7bb	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-41ed-963501fa6a04	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-1cc5-b11c856d30b4	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-4d1f-886d73885238	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-639f-e81bbff7ee9a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-3b5a-32a7d9a2db32	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-1faf-1aec4ee94ccb	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-e396-ae1c046d67e4	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-3410-fc728c5ff67b	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-26cb-246f0ca7dae4	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-730d-c69c7d811cc0	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-04c6-8f46471fcb96	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-002f-58cfbb381879	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-29d7-15914ddb3042	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-8132-fc469003abe6	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-730c-371f5fbfbe6d	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-ea30-1cb906da5c7b	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-8f53-d2cc80290195	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-52e6-876931d9e4e1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-06b9-706bff1fa593	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-97f5-18a93bbc66a7	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-77c6-26a6c2757b28	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-d6eb-0d120f785281	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-eae0-779b4c78cd45	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-10df-56ca8b83488d	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-2136-2740f34a4a89	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-95e0-9b7a9a373e48	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-d7a4-f3535d1e270a	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-1e17-6a372bf53792	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-0e57-9139316b2f2b	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-fb86-adf7bd30b8f7	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-b3cc-8210855aff1b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-712f-30a771882539	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-2952-a33dbbf61313	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-25b0-ac95fea70d12	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-e468-c4593977def2	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-3194-e5c95723db66	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-9b2f-d86cbadd8509	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-d7c9-8e11c04ce700	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-62e8-7b9b7b44672d	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-b1c7-b550ea759a8e	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-1161-58b30f257628	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-bc4d-857169a6d492	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-6f31-74d8e962e613	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-c562-a56b87b96c94	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-06a1-7473bf88c310	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-41f7-1d942811c9ec	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-25be-0b67673f97ee	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-8479-62eda2bc32ca	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-2988-824fd255f1e4	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-25ce-f2107138a408	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-8e62-f0069410ed47	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-e015-6997912144d9	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-00bf-1b445d154a93	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-a304-76a9dc9c94da	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-d13c-1cde9fc7793a	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-c0aa-30df631131ba	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-a8e8-184303e0b0e2	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-8f48-d99dfc236100	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-1c8c-ead48ffd5a92	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-5249-de87c857593d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-7748-1cf421876877	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-61e4-2e3704937588	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-96fe-c16a0130641b	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-ecdf-d7d4b3abe042	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-41f0-118c325d60f6	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-8d61-6826e1197bda	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-6949-f5d6b797e9b0	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-4db2-ce065e91d016	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-4096-da8b9f309552	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-7a67-edd6a7ebbd1a	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-e17b-cdd5f68a3cb5	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-ad71-ae24c5732510	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-52bf-dc46f19ad766	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-ef37-92e99008c7c1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-0b94-57fef72bfa2f	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-5648-a67c984699ec	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-edb5-e0f7a3d8e1b8	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-7b07-8731edd180d9	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-b662-075fd3fe5774	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-2674-d0779e56c9ee	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-7e82-3b75b8c51a9f	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-72c7-35c9d7053a66	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-c5d2-de059ef3366e	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-b981-e01f6f58fbb4	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-d39d-ccd11a7f2f0b	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-7423-4678f99e3d1e	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-6103-11d0a8583a39	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-e91c-0f8a087ea4e1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-6de0-715dabd8a914	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-3c54-9f1713a15bc1	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-bbed-d240bfabcbee	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-b601-2ff13128efad	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-c54f-0b13bf1ef80f	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-f094-ad6395dd68dd	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-4a73-a7e1e1199f2d	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-155f-1cdc39f3a537	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-6650-40c71735121e	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-4c86-8f5ff9fb52f6	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-949f-6aa229946f47	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-bc5e-2ec9907bf89d	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-5cc2-5fa55d0fc1c8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-cf18-c1ac199d57d7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-2a07-bff7ddda0662	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-8288-f2b8aa973880	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-0547-5af8fea17829	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-edc5-36ab16cf7050	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-ad69-33ea0f7118e8	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-db38-b8955139da12	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-c53e-9b054d52e2b4	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-5a5f-06a794644e0c	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-2bc6-8eb27a20982a	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-8080-de6e73f0314c	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-a42d-793b6f14235d	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-b302-8bd9fec75dd4	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-0ff0-e9e0ea63b6e2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-538b-f2b3ada0fdc5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-13ff-38aef804a3f4	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-9833-913c5dbe7c0b	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-1237-0064e3e4d2cb	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-6953-a547fc86d7ac	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-cfb2-e2a0ef000508	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-2c90-e30501c5e25e	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-8807-f26ba8b37f9a	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-b4fa-c9e282c5e81b	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-38e8-49cf2460d81f	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-2010-e3c0b57c336a	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-8c46-abb66d3a59ea	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-a1d4-48ae88936612	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-0bc6-ea84045cc0c2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-3b4a-eabbf9f61653	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-7ba1-ef536b214d00	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-fc40-bcc7dfab401c	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-9111-499f6d170e15	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-4060-6abe401fb3e9	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-6195-175fbe554e4f	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-10c5-2cc1478da578	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-2b2e-d07531042962	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-d008-72f3c8d98afb	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-d651-12f068dfc48a	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-cd8f-81679e22615f	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-6ee8-beb332e3bf63	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-f76d-7e4253437c2b	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-b2c6-6fed908d59d7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-20b5-047686ccf635	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-0eca-cbc9983b9f3d	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-dc19-db8098da1371	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-4a62-d784efae060a	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-7434-defee24dd3c3	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-ad55-f211425723a0	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-1593-15fe77275ae2	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-36bd-fd3fe312e3e9	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-8f0c-c0864d572404	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-10b1-f1650ea49a0d	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-463e-4ebfad5cf0e0	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-0e4d-2f6d4ded6c16	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-f2d3-abf434df561d	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-f281-c5a684f6d2af	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-20b1-fefc1bc93f07	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-289a-f496235cd267	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-1064-d0df53061832	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-05ed-6fa0a3b6c384	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-424b-880a6db52de5	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-e62e-736672757bcf	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-3654-c81bce446dd5	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-5a97-3a92fa8046d8	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-a615-aa22578021c6	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-88df-8eb36fe31a78	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-fee7-ec16b9fbb563	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-4ce1-32afedb37937	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-3ea4-50c03699c116	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-caf1-3067942f25d6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-ff01-af50cef1b029	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-095a-ffc49ee10c9d	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-9c2b-81e7177357d4	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-826e-e607c53ffff8	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-b0f2-5dd6c92dc501	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-f2f6-18d03bee3363	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-cc76-1cc42d57c214	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-207b-88810686cc9f	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-234b-76dbf78ce8a5	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-4999-a3a612b43899	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-12db-054289bb4e3d	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-97f8-b81e06112ef0	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-618c-aac692cee51b	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-2caa-bdefc67c0b8c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-0d12-ef663d3749e6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-e00b-1ba2baaf0fb5	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-dfbb-b5bf604c7384	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-0d6e-6e1b6d214602	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-bb4f-8d7d33a54c23	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-2d86-0ea266f65a08	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-b3cb-4a8503cf6a43	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-91d4-02067563b30d	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-c05e-5b65a1b3262c	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-9fd8-7cfa85216449	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-3db8-42f66a031665	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-7834-a2ef173d10a6	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-4f47-e87d673ba4e3	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-033a-fe34db3d48b8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-ecd8-5607375476ca	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-0509-7a6b839c3b25	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-9508-5429c337b130	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-a1bb-b9a2c03d150d	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-d42a-b564c4399e42	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-88b2-ff223c39343b	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-f117-196199c5d969	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-080f-7e6571c8b5ae	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-abf2-e7fa15dc5963	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-167d-412b412a5f03	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-8edc-9acb1e042455	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-789b-7ef464837592	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-44a6-33148909a878	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-e9ed-72796f77d777	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-dbfc-3fc800efbbd8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-4a5b-4a42fa3f80bb	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-0df1-0d741540c732	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-44b1-2b210b937b74	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-8319-b3f0888983f9	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-a2b2-6c1d2ae85522	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-f6ce-ea9049e7b8c5	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-a534-d63e7ba99ee8	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-fefd-da18d6a20f14	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-c24d-103ce3ef5efa	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-2050-e2a89d33ee3f	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-fc61-ce74c7296db6	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-5d95-f3b8a2995cf8	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-551a-3585ef32f54f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-a4b1-bdd4fd76b0de	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-5dee-c4342f7ad0a0	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-f2f0-340091cbf659	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-4403-5942b2173593	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-ded5-34b5b21e8c94	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-cbcd-ba14eb3d22a1	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-ca97-21a69d00cc9c	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-21a2-46f1dc7d7322	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-fccd-3366f8464115	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-ef6c-c8f98fd3367c	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-3776-9d93108bde11	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-f24f-7e74394e6d03	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-ce4c-8fe650f99e37	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-77be-9ac067c81462	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-d771-d2fc512c1cb9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-025c-59c6b5a9eddb	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-9fc1-dee382666f32	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-4b7c-84f748e6e0eb	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-029c-ee9bd2d1053e	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-7dbe-5573b01e7d39	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-02e8-c00ed1ac707b	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-ce1c-9dcb013058cc	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-2674-4f3856013f54	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-c4b9-7db9317b0744	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-4424-61ad30fcb686	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-1be5-0337e17e346e	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-8584-16c3b308adf4	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-e19d-5ee51bebe42e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-b6fb-4464630c98f3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-52a1-cba7b2b67939	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-dd25-1d6ab32742f1	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-bab1-73b654d28c1d	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-e25c-f5b8e34d7aa6	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-9a1f-dcea529ce9ee	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-68cb-11a9dcaea912	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-13fb-04aa44599c7d	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-8db7-2b1dedf8d9e8	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-43f3-d48c8f1688b7	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-185b-f7014162e628	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-58e4-124529ec9523	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-ca76-fa48cac7ddc2	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-cd8e-77ec76355499	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-d9c9-dfc2d81f13db	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-d097-5d7e813cb347	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-1b25-9a37ecd7852b	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-7668-ebac3c8670cc	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-bb15-ba0447572c00	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-2eab-0139c2404596	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-5b0d-406cff5e8729	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-3b13-57a9b03d82f8	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-415d-bcab49bdf2a6	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-9faa-a03463310d4f	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-e448-36b28bdcc35c	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-fcf0-9161ac24222a	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-9d71-d8295917702b	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-7049-73d7d1be7f29	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-0463-fdb7b94e30a3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-b727-5a198f9fe522	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-c426-d9482c55c500	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-c533-d2a06d3e1534	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-e3f5-a30a96bb91c6	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-e992-98f601698932	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-4c3f-606e98a29135	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-d0da-da7deb121083	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-cdbc-58654f50a09b	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-c191-217f3d41c633	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-7afb-1f20870e8576	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-47ca-6a02e3931d11	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-7b5f-4ce98d725608	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-45e3-8a6e6b3f4fb2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-ec2d-d1f927888084	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-e8e2-ad3984cea30d	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-d77f-6271f6ca5803	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-96f0-87ff3c87d5fe	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-80c1-e82558293071	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-00a6-f3e7eb8485f1	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-bab0-4ffacbddbe54	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-110e-751fbf9518d1	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-29b6-7461791b5415	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-b42b-6382ab8905d6	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-e2cf-6e9bac0e3d61	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-07dd-aca4d6b70b3e	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-4438-39d653d8a637	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-84c5-f4822aa2ed8f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-72ab-648df43e9d17	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-2585-c275ec1fe0f1	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-55d2-08a4aa3cd866	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-fab9-b8e17255efcd	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-793e-88b3f065fed6	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-5f28-9877f4215813	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-dee9-75fd647040e3	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-b4ef-2c3b3f9e1bd5	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-c376-58fb756e8c7b	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-983a-fd916face558	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-f89b-c96b292b08f9	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-cc3d-1ca96ed96c8a	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-eed6-3985d4b3e87c	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-f723-144266efe161	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-049e-bf8119b31483	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-818c-bb93b27b6f85	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-f007-79bce181113e	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-3209-41da036542e0	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-08e6-83ed73f45227	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-71bd-3d8ba3b4015d	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-7d5f-d3cdedd639e5	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-1d45-faee340a7665	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-5e84-bb831e1a8542	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-0091-119ec9fd768f	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-88f9-05a011d541aa	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-eee3-66ab31773a7a	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-952a-4333e055da8a	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-d74a-fb070387ff32	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-734b-949bef6ec95b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-3be3-38073a7425bc	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-3c02-f7ac232e1ca5	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-1e91-8b45e81772bb	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-951d-870485ddb041	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-fc59-6c880de94d9c	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-7d98-616ee72bca16	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-e495-22e23b8bd677	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-247e-026d81e3aea3	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-cfab-5f9db6f0068d	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-c397-ac322dd0a9e9	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-7157-462c1f108a67	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-98ec-7bd17e34162c	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-6dce-458a934f6faa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-5f36-3bbb416da067	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-8cc1-be47d1328f51	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-a562-c15c1a8d9388	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-b632-75c8f8c9cfcf	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-f051-ccff177ce678	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-4208-f503e9e56aa0	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-dbf4-3cd0d1f6855d	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-fdc1-bfc1979f8dab	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-8555-07800300c12e	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-1e27-77ad5027861b	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-3e75-3283d0f191a5	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-313c-624d7eedebe3	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-3536-4cf5cae57e2a	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-b2b7-0dca65ef0733	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-1ba8-dfe922660e0d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-809b-c82271914187	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-dbaf-821b96cb7cd0	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-d823-972b22dbe73d	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-3d9f-a4743d4f5597	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-57e1-68c2aa727a70	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-c5ca-8dbd5c3d3332	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-5ace-8a3aad5734e4	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-1cb6-551d5f6ad8ba	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-07e4-d9e5ab10427f	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-e807-542914477632	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-f350-d6333c5f90c4	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-6a93-72cd507f60a1	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-5f4f-86c3190b9f35	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-924a-7086e97b000c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-1933-90a9c994c148	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-2dbe-4c95fc6e5ffe	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-b1a8-2e772a7a0424	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-4323-3fd70eb2c2f8	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-9c93-6d278c57d0a2	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-6fe9-68eaba746959	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-e9cf-aff57484d443	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-1637-10c3f80f6cfb	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-3656-39cc56897905	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-a813-470c3b950500	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-e245-896c79824877	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-ebd9-0df8fdb8d91a	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-8ecf-a0d4bfcf0d19	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-f829-b4119dd42ce7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-9b85-bb12a3d65a3b	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-1680-1a6da73fded2	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-c865-fde7af401beb	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-946c-16d5ee116b85	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-acab-d3c5ad986103	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-147a-25e4a6bc7ab9	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-1c0a-45807e4e15bc	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-c9d4-644ecc0ab0c2	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-225f-2966af21293c	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-e766-c812073d8728	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-1a90-b3918d9456bf	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-467f-8b51a5f29276	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-57d7-c0e93cd0b276	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-b11e-dbb90f135e75	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-7e6a-92d5418de623	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-4af9-741e6b0d314d	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-88fa-f3405da2cc80	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-ec97-0963d4022287	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-6e2b-ce4fe243b622	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-49d1-826762647a91	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-b87a-a5e786f985bd	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-35e8-4905f0ba04e9	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-7d31-99f3a85a2c4f	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-218e-e1b1187c0586	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-94f1-8c1e5f581d97	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-11fe-89878c9d5ec7	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-a241-40e3e0bc8dd2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-77c0-b402e17687fe	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-fc3c-2bbd59c48ffc	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-2a79-0cd38d37d957	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-0458-826f9795895a	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-2be8-aa395ffea0e0	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-57cd-f68c6ef4b061	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-a7c4-dc2983781836	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-9a6e-67608999d428	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-0cd3-03088cdc5aed	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-bfe5-310867e20e63	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-d3a7-70178ad34212	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-2085-e6e8cea71a0f	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-60ff-04fd9aae515c	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-3dc4-394dc4184c16	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-6cf4-cd48778f8e6e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-0f88-d32c108a6da0	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-68f1-ebe17361fd45	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-6f81-c1f0027f729f	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-dfe0-b1faa8c788f8	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-8bed-824f540e239e	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-3c4a-8b33611c4335	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-bad1-fb21022b663f	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-b81f-ded4772e7d28	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-ecea-d951ece2a7c1	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-9e78-c7b128d74675	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-27f6-95fb1e3ba73e	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-deab-248f99ca14c0	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-d835-44ca70ecb71a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-9a2b-6b3d8ec60f5b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-c4d3-dcec5e2522c6	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-b359-1de52c96f95c	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-589b-fc08a8789cf4	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-bb9f-d5e24a36b672	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-3361-3b07ff0b964b	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-a415-a68c1b12ca2b	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-b00c-693d45d1c781	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-051b-e9df6a58d2f1	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-23f9-7b1db8e8897f	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-445d-c9cf95c29ba4	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-58f1-baa85e0387af	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-c818-e8d40eaa80d4	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-4c37-6d222090642f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-1e6a-dd817b87dced	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-a3a9-091dcb0d80fc	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-d0d2-bcffbd524172	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-eae4-19d30f4cce92	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-cbe8-3d20bdd1a036	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-8c18-b471875f5bd9	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-7f4d-f6558ede1ced	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-77af-873309716998	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-a2e1-199d45cfbc16	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-78f7-a546214d2303	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-a0a6-78249118447d	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-00f9-992e79a567f4	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-58e9-aeeacca45ef4	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-edde-2c20b937b3b8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-c16a-25432ba4d083	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-b35d-1680497217d2	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-21f1-dc60ea24cd99	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-6697-7255b4c687a0	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-814e-c6f4873a635a	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-843d-882e8b95a41f	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-9cc0-5e427c53ab9d	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-4b98-b7b0e2d11d5f	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-c027-0e4180e956cf	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-b2ba-18e21898cbe6	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-eb1a-dc95b901f1da	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-bc71-30b43e1cbb6e	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-82f1-648fe49e489d	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-3580-aba15d1049d8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-ac44-ebfb7fe0b112	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-6e06-4d2b17504d28	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-ff19-711527990d6e	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-b36a-697c82ac5314	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-91e4-f4a406ff124b	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-f1dd-b403e9719c43	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-85bf-546a234f2bfd	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-abe6-685c77a3f9a0	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-83d0-f62ce2e3ec1e	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-d3b8-d85e32290e18	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-4aac-a0fdbd4ca651	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-7015-f4ab7ebd63ec	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-7198-a3fa262c989d	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-24f4-eb68f8e19a53	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-39af-65ce6282162e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-4da8-4c754f04df1f	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-029a-52a0184ce03b	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-dbca-b0a43eec8ba3	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-0af2-94f7fb40e4ac	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-f43f-27a9e97ae7f5	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-52e7-9fd81d17c8c3	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-4c32-44e035f3eec0	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-c539-52e889cdb619	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-4744-31606056a68f	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-e337-1741ebc8514c	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-83e7-635525be131d	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-5943-eabe3898739b	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-eeb5-a2fdb3f046c6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-8673-8b97b24c0fae	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-3175-1f394d0fa75d	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-a81f-f3b720aa4afb	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-3f65-e0cd070d2e70	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-6732-9e00d5c770a9	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-0ddf-986526cb153d	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-8b9c-c973abef72ab	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-4fdf-91d0ee1009c7	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-0e53-0851c8ad6986	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-b562-4be439227469	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-98ae-61b3d5736a9a	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-3bcb-c613fce78b07	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-008c-1b36533897e8	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-f292-cabb67af16a3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-ca70-0bbc861abbf8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-da6f-8de521846754	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-6a39-af60f6cff655	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-0e39-5eef7ae14e69	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-1371-763c5ee03ade	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-644f-68f91600477c	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-d890-8cec21cf85e7	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-1807-0731991557a1	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-fbfc-4b78fe0d27db	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-7807-e4f85361831d	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-9bf2-84fe626beff3	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-1ad6-36444eaa59b2	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-acad-2ac5e0b058b5	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-853e-0abb6a9761b6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-625e-7849d0c89769	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-df11-6ea94c92f330	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-1b12-4aebf6c22402	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-91d8-7dc05b1b990b	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-6a74-798410bb8dc9	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-1e7f-f99810bb021f	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-02f7-6795e6ba92a1	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-5601-066baf6acd27	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-1e49-9f4f14df1f49	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-b35a-f6400ddf1441	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-c3ad-af7789c0693c	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-3fce-9cd5f21f5f26	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-8163-79382a8e97ac	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-4d05-4b082b2b77bd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-9ebe-1a87f2eead90	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-26f7-18bddd49730e	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-7480-f255b7e35f0b	User-delete	Aaa - Uporabnik - Briši	f
00030000-553a-bdc4-ef65-b052b1e0ad6e	User-read	Aaa - Uporabnik - Beri	f
00030000-553a-bdc4-d45b-d6ea23ed4f61	User-update	Aaa - Uporabnik - Posodobi	f
00030000-553a-bdc4-a3bc-ebac606bb2ed	User-create	Aaa - Uporabnik - Ustvari	f
00030000-553a-bdc4-b0fc-731246f3bef2	User-lookup	Aaa - Uporabnik - Iskanje	f
00030000-553a-bdc4-0ac6-3ab54d17b472	Role-delete	Aaa - Vloga - Briši	f
00030000-553a-bdc4-0270-8bb19e5aed38	Role-read	Aaa - Vloga - Beri	f
00030000-553a-bdc4-86b4-7d4bb585f8d8	Role-update	Aaa - Vloga - Posodobi	f
00030000-553a-bdc4-da5b-f4c3efa395ce	Role-create	Aaa - Vloga - Ustvari	f
00030000-553a-bdc4-98aa-c8fc7535187d	Permission-delete	Aaa - Dovoljenje - Briši	f
00030000-553a-bdc4-1e26-e92f5af6ca04	Permission-read	Aaa - Dovoljenje - Beri	f
00030000-553a-bdc4-c016-c06a774f7f67	Permission-update	Aaa - Dovoljenje - Posodobi	f
00030000-553a-bdc4-8ae1-91c8aed92438	Permission-create	Aaa - Dovoljenje - Ustvari	f
00030000-553a-bdc4-0cf0-b0ca692a7899	Permission-list	Aaa - Dovoljenje - Seznam	f
00030000-553a-bdc4-fee4-784e906b64b5	Drzava-read	Seznam držav	f
00030000-553a-bdc4-a852-c0937ee81b56	Drzava-write	Urejanje držav	f
00030000-553a-bdc4-5af1-f0bd8ccea7ec	Popa-delete	Poslovni partner - Briši	f
00030000-553a-bdc4-8110-e98331555776	Popa-list	Poslovni partner - Beri	f
00030000-553a-bdc4-8c63-3e2ecbe973cb	Popa-update	Poslovni partner - Posodobi	f
00030000-553a-bdc4-3ab9-603d438be543	Popa-create	Poslovni partner - Ustvari	f
00030000-553a-bdc4-e16b-59dd7c253a8f	Posta-delete	Pošta - Briši	f
00030000-553a-bdc4-58b3-54aec83af8f6	Posta-list	Pošta - Beri	f
00030000-553a-bdc4-82d5-a85ce848150b	Posta-update	Pošta - Posodobi	f
00030000-553a-bdc4-f454-da1a9c34cab9	Posta-create	Pošta - Ustvari	f
00030000-553a-bdc4-57bd-4bfb7fe4ba13	PostniNaslov-delete	Poštni naslov - Briši	f
00030000-553a-bdc4-4e12-98e3bb35e664	PostniNaslov-list	Poštni naslov - Beri	f
00030000-553a-bdc4-1be2-3b91333d2096	PostniNaslov-update	Poštni naslov - Posodobi	f
00030000-553a-bdc4-9493-ded17241e122	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2635 (class 0 OID 1421517)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-553a-bdc4-9c12-19e6d32582ff	00030000-553a-bdc4-fee4-784e906b64b5
00020000-553a-bdc4-9c12-19e6d32582ff	00030000-553a-bdc3-4f24-cb7be8e90375
00020000-553a-bdc4-7eaa-d2db634b5ada	00030000-553a-bdc4-a852-c0937ee81b56
00020000-553a-bdc4-7eaa-d2db634b5ada	00030000-553a-bdc4-fee4-784e906b64b5
\.


--
-- TOC entry 2663 (class 0 OID 1421806)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 1421836)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1421948)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1421576)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1421618)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-553a-bdc2-cde0-11315797d41c	8341	Adlešiči
00050000-553a-bdc2-fdf3-f468ba8e39f1	5270	Ajdovščina
00050000-553a-bdc2-65af-11fbba1fbdf9	6280	Ankaran/Ancarano
00050000-553a-bdc2-3284-08df54907057	9253	Apače
00050000-553a-bdc2-fba9-5a56175831be	8253	Artiče
00050000-553a-bdc2-9642-13fc3feccd57	4275	Begunje na Gorenjskem
00050000-553a-bdc2-fc88-ff4d351cb69d	1382	Begunje pri Cerknici
00050000-553a-bdc2-7625-4ccfdc81e390	9231	Beltinci
00050000-553a-bdc2-ba48-8ed08b3a7c4e	2234	Benedikt
00050000-553a-bdc2-59df-edd4416a7427	2345	Bistrica ob Dravi
00050000-553a-bdc2-d01d-5a91c4a6cace	3256	Bistrica ob Sotli
00050000-553a-bdc2-a5b3-bda0f9b85ca1	8259	Bizeljsko
00050000-553a-bdc2-a9e7-edb1c794a267	1223	Blagovica
00050000-553a-bdc2-1e71-e94799030394	8283	Blanca
00050000-553a-bdc2-e605-e75fb35c4e82	4260	Bled
00050000-553a-bdc2-a69c-884fbcf2455d	4273	Blejska Dobrava
00050000-553a-bdc2-c797-26259995d9fc	9265	Bodonci
00050000-553a-bdc2-30b5-c36dab70da36	9222	Bogojina
00050000-553a-bdc2-4e89-967a826f99da	4263	Bohinjska Bela
00050000-553a-bdc2-662c-efccfd154bd4	4264	Bohinjska Bistrica
00050000-553a-bdc2-f561-1741fde7aa5c	4265	Bohinjsko jezero
00050000-553a-bdc2-47eb-18a1be54e113	1353	Borovnica
00050000-553a-bdc2-0d98-690b8abeb668	8294	Boštanj
00050000-553a-bdc2-2a4e-c5a8a971bbfc	5230	Bovec
00050000-553a-bdc2-f585-bcf0c31987c7	5295	Branik
00050000-553a-bdc2-8530-a977ce3a3cc3	3314	Braslovče
00050000-553a-bdc2-608c-2295ed696bbd	5223	Breginj
00050000-553a-bdc2-54ca-c93547723a24	8280	Brestanica
00050000-553a-bdc2-1e19-f4e324a57b0c	2354	Bresternica
00050000-553a-bdc2-f2bf-cb51a300d70e	4243	Brezje
00050000-553a-bdc2-3f57-40dbb1a9ee0e	1351	Brezovica pri Ljubljani
00050000-553a-bdc2-34fb-4b65764dd0d6	8250	Brežice
00050000-553a-bdc2-93d6-4368d3ceb35a	4210	Brnik - Aerodrom
00050000-553a-bdc2-2434-517cc1cd3cb5	8321	Brusnice
00050000-553a-bdc2-5251-32d4843b2fa9	3255	Buče
00050000-553a-bdc2-9a5d-d74c4584151b	8276	Bučka 
00050000-553a-bdc2-4a1a-676e11d36132	9261	Cankova
00050000-553a-bdc2-5368-67ba93ba75ce	3000	Celje 
00050000-553a-bdc2-7ce1-8be6fdff4cc1	3001	Celje - poštni predali
00050000-553a-bdc2-4710-26d2deba4942	4207	Cerklje na Gorenjskem
00050000-553a-bdc2-cd31-4ddad083f53c	8263	Cerklje ob Krki
00050000-553a-bdc2-c1a6-6c9c4d20b964	1380	Cerknica
00050000-553a-bdc2-bc32-d30cc6d061f1	5282	Cerkno
00050000-553a-bdc2-f48b-5d91f1947e81	2236	Cerkvenjak
00050000-553a-bdc2-72ad-1a4c61e530a3	2215	Ceršak
00050000-553a-bdc2-64ad-80869f2417e2	2326	Cirkovce
00050000-553a-bdc2-05ec-bd207b725a0b	2282	Cirkulane
00050000-553a-bdc2-1b35-cf7aa021ff59	5273	Col
00050000-553a-bdc2-f345-cd647f3fe411	8251	Čatež ob Savi
00050000-553a-bdc2-0b64-37d84c8f0622	1413	Čemšenik
00050000-553a-bdc2-b8db-3cb0bfc89867	5253	Čepovan
00050000-553a-bdc2-9eaa-b4491d08cb99	9232	Črenšovci
00050000-553a-bdc2-3784-2b2373bb350f	2393	Črna na Koroškem
00050000-553a-bdc2-3021-253a0d221210	6275	Črni Kal
00050000-553a-bdc2-3823-c3c3fdceacf7	5274	Črni Vrh nad Idrijo
00050000-553a-bdc2-2625-72160b97e9c6	5262	Črniče
00050000-553a-bdc2-997c-930e1dbd6627	8340	Črnomelj
00050000-553a-bdc2-caa1-222c4a76914d	6271	Dekani
00050000-553a-bdc2-4cb4-55f4babe8026	5210	Deskle
00050000-553a-bdc2-0033-1d785a141c4f	2253	Destrnik
00050000-553a-bdc2-ac9e-dcb01f089c45	6215	Divača
00050000-553a-bdc2-f431-387be875c92d	1233	Dob
00050000-553a-bdc2-78fa-9a2319cc37a3	3224	Dobje pri Planini
00050000-553a-bdc2-6430-76c8509931e1	8257	Dobova
00050000-553a-bdc2-49a4-927ca356c76d	1423	Dobovec
00050000-553a-bdc2-9d65-1940fc081daa	5263	Dobravlje
00050000-553a-bdc2-1bff-e44cad5e9b45	3204	Dobrna
00050000-553a-bdc2-39bf-cfc9b41854a3	8211	Dobrnič
00050000-553a-bdc2-a66d-374676752f68	1356	Dobrova
00050000-553a-bdc2-62c5-7b45dd8457de	9223	Dobrovnik/Dobronak 
00050000-553a-bdc2-2d25-ac0d2cddc9b9	5212	Dobrovo v Brdih
00050000-553a-bdc2-d60b-d45cb8dcc27b	1431	Dol pri Hrastniku
00050000-553a-bdc2-10ea-80ab56b1957c	1262	Dol pri Ljubljani
00050000-553a-bdc2-79d4-639d5cbe01ec	1273	Dole pri Litiji
00050000-553a-bdc2-180a-37e7c364f5d7	1331	Dolenja vas
00050000-553a-bdc2-5b9b-f657201e323c	8350	Dolenjske Toplice
00050000-553a-bdc2-9bbd-c42d78b82923	1230	Domžale
00050000-553a-bdc2-c556-2a3d3908e6fe	2252	Dornava
00050000-553a-bdc2-3c3c-b479c757917b	5294	Dornberk
00050000-553a-bdc2-8497-dedcac365e2f	1319	Draga
00050000-553a-bdc2-a7db-53c5fa0e9db7	8343	Dragatuš
00050000-553a-bdc2-9323-dc6b1510811d	3222	Dramlje
00050000-553a-bdc2-c5c9-2692cc9367d1	2370	Dravograd
00050000-553a-bdc2-3a97-fcfacace4b14	4203	Duplje
00050000-553a-bdc2-5097-902d3e71d228	6221	Dutovlje
00050000-553a-bdc2-d788-54ec3ffe7e0c	8361	Dvor
00050000-553a-bdc2-bf77-b0b6a7ddfef7	2343	Fala
00050000-553a-bdc2-88ce-fbadf3d97f10	9208	Fokovci
00050000-553a-bdc2-bf91-377d0d4acb21	2313	Fram
00050000-553a-bdc2-6b8e-ed0aec954fc5	3213	Frankolovo
00050000-553a-bdc2-5485-5e14d4d3b656	1274	Gabrovka
00050000-553a-bdc2-64a9-473897e6e4fc	8254	Globoko
00050000-553a-bdc2-2342-0b66271c004d	5275	Godovič
00050000-553a-bdc2-e20d-9f2c5fb6e8e1	4204	Golnik
00050000-553a-bdc2-9cfb-e7c827939cd7	3303	Gomilsko
00050000-553a-bdc2-f065-a5260bb20259	4224	Gorenja vas
00050000-553a-bdc2-2cab-b4ef6e001710	3263	Gorica pri Slivnici
00050000-553a-bdc2-6848-6a240f1f0163	2272	Gorišnica
00050000-553a-bdc2-cd3d-f1c7af3fbff7	9250	Gornja Radgona
00050000-553a-bdc2-1d9f-17a459cfe2b0	3342	Gornji Grad
00050000-553a-bdc2-3b74-fe146bb61be8	4282	Gozd Martuljek
00050000-553a-bdc2-f7a5-449fb5322a66	6272	Gračišče
00050000-553a-bdc2-d417-a42608e49d5f	9264	Grad
00050000-553a-bdc2-69e8-c6b1647c6900	8332	Gradac
00050000-553a-bdc2-2363-591358f56781	1384	Grahovo
00050000-553a-bdc2-b2d5-45d75701a77a	5242	Grahovo ob Bači
00050000-553a-bdc2-1299-9aeaf03b8050	5251	Grgar
00050000-553a-bdc2-d619-3e70acca898a	3302	Griže
00050000-553a-bdc2-9519-350aff5900c4	3231	Grobelno
00050000-553a-bdc2-c228-aa018b0ac94f	1290	Grosuplje
00050000-553a-bdc2-9299-1bf1981df3ce	2288	Hajdina
00050000-553a-bdc2-afbd-fba95765daf9	8362	Hinje
00050000-553a-bdc2-2592-4f7819f0f61d	2311	Hoče
00050000-553a-bdc2-f769-f18b090b5382	9205	Hodoš/Hodos
00050000-553a-bdc2-8d23-c6dde9130bb2	1354	Horjul
00050000-553a-bdc2-2450-1e9008968215	1372	Hotedršica
00050000-553a-bdc2-664a-281cc505b97b	1430	Hrastnik
00050000-553a-bdc2-2301-b14f1939e444	6225	Hruševje
00050000-553a-bdc2-01d2-e0ea3a2758a5	4276	Hrušica
00050000-553a-bdc2-d057-afbf94bdc091	5280	Idrija
00050000-553a-bdc2-e12c-67c4c4fa283b	1292	Ig
00050000-553a-bdc2-75b8-d92f4bb93972	6250	Ilirska Bistrica
00050000-553a-bdc2-622d-75757068e5ec	6251	Ilirska Bistrica-Trnovo
00050000-553a-bdc2-656f-9bd746f800a8	1295	Ivančna Gorica
00050000-553a-bdc2-19af-bf5aac0aba96	2259	Ivanjkovci
00050000-553a-bdc2-9391-1629435497c4	1411	Izlake
00050000-553a-bdc2-bee1-9abfb03f6a29	6310	Izola/Isola
00050000-553a-bdc2-16e6-552c1ffebc4e	2222	Jakobski Dol
00050000-553a-bdc2-7871-a177a7800a95	2221	Jarenina
00050000-553a-bdc2-3c73-acf421bb6aca	6254	Jelšane
00050000-553a-bdc2-873b-9263a7237426	4270	Jesenice
00050000-553a-bdc2-5cd0-717fe31d4965	8261	Jesenice na Dolenjskem
00050000-553a-bdc2-1817-cf4c8c51f35a	3273	Jurklošter
00050000-553a-bdc2-b52b-4552c944b6f0	2223	Jurovski Dol
00050000-553a-bdc2-0fef-60203685c1bd	2256	Juršinci
00050000-553a-bdc2-42ca-cc7486fcbf5c	5214	Kal nad Kanalom
00050000-553a-bdc2-e02c-cb55c2d91956	3233	Kalobje
00050000-553a-bdc2-85fe-57e38bddcf03	4246	Kamna Gorica
00050000-553a-bdc2-ed08-a54ebf91e900	2351	Kamnica
00050000-553a-bdc2-05a9-19edb78a0780	1241	Kamnik
00050000-553a-bdc2-cbb2-fb6aed2089a6	5213	Kanal
00050000-553a-bdc2-a636-356725a4fa30	8258	Kapele
00050000-553a-bdc2-fc32-0dba3f4b0d4e	2362	Kapla
00050000-553a-bdc2-01c7-4837f139a016	2325	Kidričevo
00050000-553a-bdc2-eda9-d40820f991cc	1412	Kisovec
00050000-553a-bdc2-ede1-224dcbf7a1ae	6253	Knežak
00050000-553a-bdc2-f380-0c6a39f01427	5222	Kobarid
00050000-553a-bdc2-cac8-1d8443c3f11c	9227	Kobilje
00050000-553a-bdc2-0cac-f7ef5b35e2cb	1330	Kočevje
00050000-553a-bdc2-609d-3d50225824df	1338	Kočevska Reka
00050000-553a-bdc2-2241-2915eb40095a	2276	Kog
00050000-553a-bdc2-4595-c6bd003fc44b	5211	Kojsko
00050000-553a-bdc2-55a2-acb8dea66ead	6223	Komen
00050000-553a-bdc2-e06f-d12fb1bce783	1218	Komenda
00050000-553a-bdc2-1cf5-8fc64c8605d0	6000	Koper/Capodistria 
00050000-553a-bdc2-4d8a-c12f82eb1066	6001	Koper/Capodistria - poštni predali
00050000-553a-bdc2-6030-fac0c240ace9	8282	Koprivnica
00050000-553a-bdc2-98ca-31ea5638a90b	5296	Kostanjevica na Krasu
00050000-553a-bdc2-a9df-061b31421807	8311	Kostanjevica na Krki
00050000-553a-bdc2-870d-a654084fea8f	1336	Kostel
00050000-553a-bdc2-2d1c-ec07eb81ca1d	6256	Košana
00050000-553a-bdc2-cfa9-380544e56e69	2394	Kotlje
00050000-553a-bdc2-5c98-71c5d953e22a	6240	Kozina
00050000-553a-bdc2-3acd-da1a6748cd8d	3260	Kozje
00050000-553a-bdc2-96b1-70645a4c14ed	4000	Kranj 
00050000-553a-bdc2-08c2-703903dd6e4f	4001	Kranj - poštni predali
00050000-553a-bdc2-781f-8205227367e9	4280	Kranjska Gora
00050000-553a-bdc2-517c-7f6c6313203e	1281	Kresnice
00050000-553a-bdc2-3a9f-1336826575b5	4294	Križe
00050000-553a-bdc2-9bed-6f9554b7c64a	9206	Križevci
00050000-553a-bdc2-c421-5628518bdaa9	9242	Križevci pri Ljutomeru
00050000-553a-bdc2-4128-776a66e7705f	1301	Krka
00050000-553a-bdc2-6e72-9c93bac6cc72	8296	Krmelj
00050000-553a-bdc2-3d28-86a73f0b3738	4245	Kropa
00050000-553a-bdc2-8078-97734fc4244f	8262	Krška vas
00050000-553a-bdc2-d740-484b9ff1cda0	8270	Krško
00050000-553a-bdc2-be93-9a8a359c578d	9263	Kuzma
00050000-553a-bdc2-a801-63d965f1ce0c	2318	Laporje
00050000-553a-bdc2-6f27-6d9d2a49f535	3270	Laško
00050000-553a-bdc2-48ce-05337713d3e5	1219	Laze v Tuhinju
00050000-553a-bdc2-b491-4ab081cdd2b7	2230	Lenart v Slovenskih goricah
00050000-553a-bdc2-deca-d365b15c99fc	9220	Lendava/Lendva
00050000-553a-bdc2-2115-63453034fcd9	4248	Lesce
00050000-553a-bdc2-ab27-1a1fca94e593	3261	Lesično
00050000-553a-bdc2-4d41-c5296f186292	8273	Leskovec pri Krškem
00050000-553a-bdc2-ed1f-e69cfaa9232a	2372	Libeliče
00050000-553a-bdc2-e9b3-8b215bcf6cf4	2341	Limbuš
00050000-553a-bdc2-bdfe-a190326f6908	1270	Litija
00050000-553a-bdc2-2a70-589dba2dc645	3202	Ljubečna
00050000-553a-bdc2-c9de-bfab57387b66	1000	Ljubljana 
00050000-553a-bdc2-935f-985ccde6f42e	1001	Ljubljana - poštni predali
00050000-553a-bdc2-70e9-72b4020799bd	1231	Ljubljana - Črnuče
00050000-553a-bdc2-1dd2-c9a60714d01a	1261	Ljubljana - Dobrunje
00050000-553a-bdc2-a9e6-f41997ce68e7	1260	Ljubljana - Polje
00050000-553a-bdc2-468e-6f3f7e662907	1210	Ljubljana - Šentvid
00050000-553a-bdc2-0f1d-376f5c30f350	1211	Ljubljana - Šmartno
00050000-553a-bdc2-5a9f-5f9eb033f92f	3333	Ljubno ob Savinji
00050000-553a-bdc2-3d7d-62b9874901de	9240	Ljutomer
00050000-553a-bdc2-15ae-909b73022510	3215	Loče
00050000-553a-bdc2-2e11-57bbb022d3e4	5231	Log pod Mangartom
00050000-553a-bdc2-5566-70b400a8b8e1	1358	Log pri Brezovici
00050000-553a-bdc2-b54d-56040eb2bd06	1370	Logatec
00050000-553a-bdc2-e4f0-3bc208552d93	1371	Logatec
00050000-553a-bdc2-ec04-db3aaa2b9da1	1434	Loka pri Zidanem Mostu
00050000-553a-bdc2-11ad-bb5bf8c11391	3223	Loka pri Žusmu
00050000-553a-bdc2-e1f6-d7d1c617054d	6219	Lokev
00050000-553a-bdc2-9cf5-3879d139a900	1318	Loški Potok
00050000-553a-bdc2-9be5-b80be299660d	2324	Lovrenc na Dravskem polju
00050000-553a-bdc2-3569-6e0333d0ce93	2344	Lovrenc na Pohorju
00050000-553a-bdc2-a584-97619e4ca3a1	3334	Luče
00050000-553a-bdc2-42c7-d65a2c8fbb3c	1225	Lukovica
00050000-553a-bdc2-37a0-2c746c2bb69b	9202	Mačkovci
00050000-553a-bdc2-ab27-cc9ea2bb6613	2322	Majšperk
00050000-553a-bdc2-2aa4-f97570216016	2321	Makole
00050000-553a-bdc2-87a6-6d8d1515c1de	9243	Mala Nedelja
00050000-553a-bdc2-dba4-97cbcf9de253	2229	Malečnik
00050000-553a-bdc2-05c4-31c8bd54966d	6273	Marezige
00050000-553a-bdc2-cd5a-9781a2c42139	2000	Maribor 
00050000-553a-bdc2-74d2-f4bf5b484c0f	2001	Maribor - poštni predali
00050000-553a-bdc2-4586-d44eb3991efd	2206	Marjeta na Dravskem polju
00050000-553a-bdc2-e418-0b89f4150caa	2281	Markovci
00050000-553a-bdc2-ce24-86eefbd8362c	9221	Martjanci
00050000-553a-bdc2-e8eb-450805630107	6242	Materija
00050000-553a-bdc2-708d-f38413ba661f	4211	Mavčiče
00050000-553a-bdc2-f5aa-8c687dd33a92	1215	Medvode
00050000-553a-bdc2-1eb6-60fdfa1bcfaf	1234	Mengeš
00050000-553a-bdc2-01c0-64c12de73c45	8330	Metlika
00050000-553a-bdc2-8cb0-759eec18e920	2392	Mežica
00050000-553a-bdc2-ea23-33de6de62f51	2204	Miklavž na Dravskem polju
00050000-553a-bdc2-d44c-46389be8099a	2275	Miklavž pri Ormožu
00050000-553a-bdc2-e2fc-2d6c58b52cf3	5291	Miren
00050000-553a-bdc2-4136-a64e9b1a29fa	8233	Mirna
00050000-553a-bdc2-ab49-4f586d400b26	8216	Mirna Peč
00050000-553a-bdc2-5cd7-7a89e2921d41	2382	Mislinja
00050000-553a-bdc2-482c-4acae004ea6a	4281	Mojstrana
00050000-553a-bdc2-230c-cc16b5538003	8230	Mokronog
00050000-553a-bdc2-47cf-bb2672d0f6c2	1251	Moravče
00050000-553a-bdc2-9888-91929ca79e91	9226	Moravske Toplice
00050000-553a-bdc2-3c01-8202dbc384ca	5216	Most na Soči
00050000-553a-bdc2-5d83-7c3e3871c9bc	1221	Motnik
00050000-553a-bdc2-975f-a2c6accdbcb7	3330	Mozirje
00050000-553a-bdc2-2e7a-c905f1499882	9000	Murska Sobota 
00050000-553a-bdc2-aeb3-48c13e532fd4	9001	Murska Sobota - poštni predali
00050000-553a-bdc2-e0b7-060da585de0b	2366	Muta
00050000-553a-bdc2-4ac3-373d84751fde	4202	Naklo
00050000-553a-bdc2-5502-01422b4d7d6e	3331	Nazarje
00050000-553a-bdc2-7a93-6e1334127a9f	1357	Notranje Gorice
00050000-553a-bdc2-f036-c11319fde799	3203	Nova Cerkev
00050000-553a-bdc2-c1c6-5625bfef87a0	5000	Nova Gorica 
00050000-553a-bdc2-a07e-fc095e76dffc	5001	Nova Gorica - poštni predali
00050000-553a-bdc2-d693-172245cf0641	1385	Nova vas
00050000-553a-bdc2-6d55-f1467e0d26fc	8000	Novo mesto
00050000-553a-bdc2-6976-5306bcb025fc	8001	Novo mesto - poštni predali
00050000-553a-bdc2-4fb8-81b3aa31fb0b	6243	Obrov
00050000-553a-bdc2-ad04-ef4aeb554ac9	9233	Odranci
00050000-553a-bdc2-6bd8-bb265c2950cb	2317	Oplotnica
00050000-553a-bdc2-6556-7c7610fe97d1	2312	Orehova vas
00050000-553a-bdc2-26d0-35958e3156e1	2270	Ormož
00050000-553a-bdc2-fd81-b5585c01702a	1316	Ortnek
00050000-553a-bdc2-c0a8-af733f1a5c37	1337	Osilnica
00050000-553a-bdc2-fd68-e46bb0a09b87	8222	Otočec
00050000-553a-bdc2-849b-05b4113d37cc	2361	Ožbalt
00050000-553a-bdc2-7c9d-47dc87b747e6	2231	Pernica
00050000-553a-bdc2-2f34-1aeff011fd05	2211	Pesnica pri Mariboru
00050000-553a-bdc2-2fcb-16c397b634ba	9203	Petrovci
00050000-553a-bdc2-0d11-6ddb3d1e6baa	3301	Petrovče
00050000-553a-bdc2-59ec-a38c96649f7f	6330	Piran/Pirano
00050000-553a-bdc2-a080-ae27b7c6c3d7	8255	Pišece
00050000-553a-bdc2-406e-f4cc8f603924	6257	Pivka
00050000-553a-bdc2-0ca2-79b89ca94b9c	6232	Planina
00050000-553a-bdc2-1336-7fc188eedc33	3225	Planina pri Sevnici
00050000-553a-bdc2-2031-7eac34f3ac30	6276	Pobegi
00050000-553a-bdc2-7567-3f1385ded807	8312	Podbočje
00050000-553a-bdc2-413b-5773194a5d18	5243	Podbrdo
00050000-553a-bdc2-d88b-c7b33c1e182e	3254	Podčetrtek
00050000-553a-bdc2-9142-6b2d98c33233	2273	Podgorci
00050000-553a-bdc2-7e84-36341285db64	6216	Podgorje
00050000-553a-bdc2-5ec2-856d426e6611	2381	Podgorje pri Slovenj Gradcu
00050000-553a-bdc2-d56c-df48d044adc2	6244	Podgrad
00050000-553a-bdc2-929c-ba133e40023b	1414	Podkum
00050000-553a-bdc2-b369-8bc303568476	2286	Podlehnik
00050000-553a-bdc2-c5e0-cbadf26e0374	5272	Podnanos
00050000-553a-bdc2-3ac0-f2d24ac51be4	4244	Podnart
00050000-553a-bdc2-5fb0-ebc3e3bf34f9	3241	Podplat
00050000-553a-bdc2-0797-bd02e98a1c2a	3257	Podsreda
00050000-553a-bdc2-b004-d812351fda50	2363	Podvelka
00050000-553a-bdc2-6dc6-a6801f3211c0	2208	Pohorje
00050000-553a-bdc2-5589-6b7eabea5982	2257	Polenšak
00050000-553a-bdc2-4088-9c06bc83297a	1355	Polhov Gradec
00050000-553a-bdc2-a067-a7c7dbb53688	4223	Poljane nad Škofjo Loko
00050000-553a-bdc2-f953-a46f2af89c04	2319	Poljčane
00050000-553a-bdc2-a238-5f89057ddb35	1272	Polšnik
00050000-553a-bdc2-a79e-7cb114d19f01	3313	Polzela
00050000-553a-bdc2-55ea-a45600d5603d	3232	Ponikva
00050000-553a-bdc2-190b-46419e88947e	6320	Portorož/Portorose
00050000-553a-bdc2-2666-27ca92d3e949	6230	Postojna
00050000-553a-bdc2-a333-d09a780fc2d3	2331	Pragersko
00050000-553a-bdc2-13b2-c883c3adcef7	3312	Prebold
00050000-553a-bdc2-9d56-5a25a3b63d96	4205	Preddvor
00050000-553a-bdc2-a82e-a348dc2ba16a	6255	Prem
00050000-553a-bdc2-56c7-cbeb2a973c6f	1352	Preserje
00050000-553a-bdc2-55e1-9124007cf0a8	6258	Prestranek
00050000-553a-bdc2-5450-ceb9bae077a1	2391	Prevalje
00050000-553a-bdc2-054d-15969dd15597	3262	Prevorje
00050000-553a-bdc2-6a00-5e4b6e2b8414	1276	Primskovo 
00050000-553a-bdc2-6608-b25b9eee2c0e	3253	Pristava pri Mestinju
00050000-553a-bdc2-fcf4-9137c4ee1e96	9207	Prosenjakovci/Partosfalva
00050000-553a-bdc2-b81b-dafba54c88e7	5297	Prvačina
00050000-553a-bdc2-9860-e7240cc4eeea	2250	Ptuj
00050000-553a-bdc2-7bd8-c0756b91a725	2323	Ptujska Gora
00050000-553a-bdc2-6114-581df814505d	9201	Puconci
00050000-553a-bdc2-aba0-34528e39e1d7	2327	Rače
00050000-553a-bdc2-d381-cd849ea1222e	1433	Radeče
00050000-553a-bdc2-661c-eda612182f41	9252	Radenci
00050000-553a-bdc2-c57f-d93537f38b76	2360	Radlje ob Dravi
00050000-553a-bdc2-f58f-db9e24408218	1235	Radomlje
00050000-553a-bdc2-f6c7-9ea046b81cdd	4240	Radovljica
00050000-553a-bdc2-f2e3-7bc732be5ac3	8274	Raka
00050000-553a-bdc3-87ad-b763e68b2a89	1381	Rakek
00050000-553a-bdc3-494f-bbae98e9b527	4283	Rateče - Planica
00050000-553a-bdc3-6f6a-18be75920b73	2390	Ravne na Koroškem
00050000-553a-bdc3-6b66-5d46c9165fa4	9246	Razkrižje
00050000-553a-bdc3-b519-72ab7a670fca	3332	Rečica ob Savinji
00050000-553a-bdc3-b165-3dd650d5d4ab	5292	Renče
00050000-553a-bdc3-5192-8c8e25cc7375	1310	Ribnica
00050000-553a-bdc3-5731-a058fe51907e	2364	Ribnica na Pohorju
00050000-553a-bdc3-6f33-9fcc860a6f9e	3272	Rimske Toplice
00050000-553a-bdc3-4bcf-992f6b9e3680	1314	Rob
00050000-553a-bdc3-f69f-9ee907093306	5215	Ročinj
00050000-553a-bdc3-8fcb-9ceae12cdeb3	3250	Rogaška Slatina
00050000-553a-bdc3-b661-7bb77889e9e9	9262	Rogašovci
00050000-553a-bdc3-02b5-e4f2d0c16848	3252	Rogatec
00050000-553a-bdc3-71e8-88ffb99a738c	1373	Rovte
00050000-553a-bdc3-dc72-e63ab1d10cff	2342	Ruše
00050000-553a-bdc3-b298-726d55a3d44e	1282	Sava
00050000-553a-bdc3-7153-029bbbb87511	6333	Sečovlje/Sicciole
00050000-553a-bdc3-d4a4-1999b9d6a750	4227	Selca
00050000-553a-bdc3-dc68-a502637f2bde	2352	Selnica ob Dravi
00050000-553a-bdc3-757b-01d312a3ee8f	8333	Semič
00050000-553a-bdc3-c146-28d79c1c6639	8281	Senovo
00050000-553a-bdc3-0526-e22a0353375d	6224	Senožeče
00050000-553a-bdc3-09c5-6ae8a787b339	8290	Sevnica
00050000-553a-bdc3-4687-c0965b2d7315	6210	Sežana
00050000-553a-bdc3-4f38-d146caa2394b	2214	Sladki Vrh
00050000-553a-bdc3-57cd-b19a14294723	5283	Slap ob Idrijci
00050000-553a-bdc3-164d-1454ae89082b	2380	Slovenj Gradec
00050000-553a-bdc3-67fa-92c0dd180031	2310	Slovenska Bistrica
00050000-553a-bdc3-c902-7b2d70571fbd	3210	Slovenske Konjice
00050000-553a-bdc3-d4c8-d422d5431c21	1216	Smlednik
00050000-553a-bdc3-4211-8ecd369f1e0d	5232	Soča
00050000-553a-bdc3-da1f-dc19a8ade8dd	1317	Sodražica
00050000-553a-bdc3-c534-0440c13978d0	3335	Solčava
00050000-553a-bdc3-6ac2-c84cb0b8c1f2	5250	Solkan
00050000-553a-bdc3-5fdc-74b564656bd3	4229	Sorica
00050000-553a-bdc3-3828-becf08c3601c	4225	Sovodenj
00050000-553a-bdc3-7339-d89785df2b05	5281	Spodnja Idrija
00050000-553a-bdc3-3d69-327c640c0d5a	2241	Spodnji Duplek
00050000-553a-bdc3-7933-9ce033798bb6	9245	Spodnji Ivanjci
00050000-553a-bdc3-2bff-9a39db3b9a16	2277	Središče ob Dravi
00050000-553a-bdc3-c545-f685888b0bb7	4267	Srednja vas v Bohinju
00050000-553a-bdc3-c060-9ec64ba5732f	8256	Sromlje 
00050000-553a-bdc3-c2c3-d3b2ec631eef	5224	Srpenica
00050000-553a-bdc3-ff54-e0a524147a93	1242	Stahovica
00050000-553a-bdc3-706a-b875db53de6a	1332	Stara Cerkev
00050000-553a-bdc3-3b88-ce45af25941e	8342	Stari trg ob Kolpi
00050000-553a-bdc3-ac07-4e0706551972	1386	Stari trg pri Ložu
00050000-553a-bdc3-0d4f-4d7c84fefe3f	2205	Starše
00050000-553a-bdc3-56cd-493772359a25	2289	Stoperce
00050000-553a-bdc3-9a58-6abc8933bb3f	8322	Stopiče
00050000-553a-bdc3-8de6-15a3afea4c90	3206	Stranice
00050000-553a-bdc3-283c-f4fb0495fa05	8351	Straža
00050000-553a-bdc3-6e77-4e5b4087fcec	1313	Struge
00050000-553a-bdc3-d33b-fddd2dcaa538	8293	Studenec
00050000-553a-bdc3-21bd-370b0ed1f911	8331	Suhor
00050000-553a-bdc3-0365-8221fe7057c8	2233	Sv. Ana v Slovenskih goricah
00050000-553a-bdc3-fbc8-67d1faf4b07b	2235	Sv. Trojica v Slovenskih goricah
00050000-553a-bdc3-cd93-3304260adc84	2353	Sveti Duh na Ostrem Vrhu
00050000-553a-bdc3-402d-d2901735ce68	9244	Sveti Jurij ob Ščavnici
00050000-553a-bdc3-7428-df6122770d1d	3264	Sveti Štefan
00050000-553a-bdc3-725c-3cee6db8035c	2258	Sveti Tomaž
00050000-553a-bdc3-3900-1e669b6218f7	9204	Šalovci
00050000-553a-bdc3-5221-4c821b8df790	5261	Šempas
00050000-553a-bdc3-4855-4daba5906d16	5290	Šempeter pri Gorici
00050000-553a-bdc3-ea72-94e378ac9882	3311	Šempeter v Savinjski dolini
00050000-553a-bdc3-6d8b-0ab83eb61a92	4208	Šenčur
00050000-553a-bdc3-e7da-c3c8b440343b	2212	Šentilj v Slovenskih goricah
00050000-553a-bdc3-a2f7-de9f1230512b	8297	Šentjanž
00050000-553a-bdc3-a4e4-e1715574779a	2373	Šentjanž pri Dravogradu
00050000-553a-bdc3-f943-9cfc1fdcff5a	8310	Šentjernej
00050000-553a-bdc3-3cd6-0950ba378f7b	3230	Šentjur
00050000-553a-bdc3-4b3a-d03a841447a6	3271	Šentrupert
00050000-553a-bdc3-8c0c-6314467244b0	8232	Šentrupert
00050000-553a-bdc3-ba24-2571aca4b81e	1296	Šentvid pri Stični
00050000-553a-bdc3-ea4c-2fc7714107cd	8275	Škocjan
00050000-553a-bdc3-95d9-a2ce48883c92	6281	Škofije
00050000-553a-bdc3-d1ea-b59a1e858dec	4220	Škofja Loka
00050000-553a-bdc3-91c9-5d4f2c55ed29	3211	Škofja vas
00050000-553a-bdc3-f421-768c0b10d874	1291	Škofljica
00050000-553a-bdc3-5975-85c9d87cf4d3	6274	Šmarje
00050000-553a-bdc3-366b-abe3b3e90e0e	1293	Šmarje - Sap
00050000-553a-bdc3-fd7d-c6691fe0aec3	3240	Šmarje pri Jelšah
00050000-553a-bdc3-f124-ca455b108f2b	8220	Šmarješke Toplice
00050000-553a-bdc3-e3d1-3d60d8e57501	2315	Šmartno na Pohorju
00050000-553a-bdc3-4f93-ea6d259d3e11	3341	Šmartno ob Dreti
00050000-553a-bdc3-c6b9-371dfd3cabe4	3327	Šmartno ob Paki
00050000-553a-bdc3-3f42-0a8c1733cacb	1275	Šmartno pri Litiji
00050000-553a-bdc3-1683-0438cc2fa305	2383	Šmartno pri Slovenj Gradcu
00050000-553a-bdc3-62b8-219c85634c8f	3201	Šmartno v Rožni dolini
00050000-553a-bdc3-7cb4-27bab7b63c67	3325	Šoštanj
00050000-553a-bdc3-8e00-8c2a26fe2fb7	6222	Štanjel
00050000-553a-bdc3-820b-9b7be82c259e	3220	Štore
00050000-553a-bdc3-25c5-b41ba1b9d8f6	3304	Tabor
00050000-553a-bdc3-46e3-787efa1ca87d	3221	Teharje
00050000-553a-bdc3-081f-e5d6b6e54991	9251	Tišina
00050000-553a-bdc3-089d-6fe794baba38	5220	Tolmin
00050000-553a-bdc3-e9f6-c4191cd904c8	3326	Topolšica
00050000-553a-bdc3-aaca-d4b1ad4140d5	2371	Trbonje
00050000-553a-bdc3-d3ed-e044f3182a43	1420	Trbovlje
00050000-553a-bdc3-e56e-8293d8502404	8231	Trebelno 
00050000-553a-bdc3-05cb-7bafc2a40df7	8210	Trebnje
00050000-553a-bdc3-ce87-a2ca57ed98e1	5252	Trnovo pri Gorici
00050000-553a-bdc3-dadb-b4d262fb0a3b	2254	Trnovska vas
00050000-553a-bdc3-8944-6a572f0e0939	1222	Trojane
00050000-553a-bdc3-fed8-d00e478ee0c7	1236	Trzin
00050000-553a-bdc3-3b37-b62eb324a6a9	4290	Tržič
00050000-553a-bdc3-d50e-9fa2ced52b45	8295	Tržišče
00050000-553a-bdc3-54e0-18fdfcd0e79e	1311	Turjak
00050000-553a-bdc3-82d7-688540ef2795	9224	Turnišče
00050000-553a-bdc3-3d8e-c3f88330d88c	8323	Uršna sela
00050000-553a-bdc3-2cd7-c0e26027493d	1252	Vače
00050000-553a-bdc3-fdfd-c52fd1c78a7c	3320	Velenje 
00050000-553a-bdc3-85dc-f9e6c9a99a86	3322	Velenje - poštni predali
00050000-553a-bdc3-c3c7-4123e028a0bf	8212	Velika Loka
00050000-553a-bdc3-0530-32f3b998f174	2274	Velika Nedelja
00050000-553a-bdc3-2208-db063166c095	9225	Velika Polana
00050000-553a-bdc3-9bb2-45780fe60136	1315	Velike Lašče
00050000-553a-bdc3-32ab-8f134e9d4bfa	8213	Veliki Gaber
00050000-553a-bdc3-598c-ca573c1e04d8	9241	Veržej
00050000-553a-bdc3-36b8-92ee631d765b	1312	Videm - Dobrepolje
00050000-553a-bdc3-ddb7-f4ece9c81b55	2284	Videm pri Ptuju
00050000-553a-bdc3-0b69-6181e28e2e98	8344	Vinica
00050000-553a-bdc3-7bed-3a8991fee170	5271	Vipava
00050000-553a-bdc3-16d7-d0bde5fdb850	4212	Visoko
00050000-553a-bdc3-c216-142ddb5d8ef1	1294	Višnja Gora
00050000-553a-bdc3-fc28-ccdafe1dbee3	3205	Vitanje
00050000-553a-bdc3-49f4-e521a8daea42	2255	Vitomarci
00050000-553a-bdc3-5b41-581b17e1553a	1217	Vodice
00050000-553a-bdc3-a210-a5d6a7c85e9b	3212	Vojnik\t
00050000-553a-bdc3-9c11-bc97d433145c	5293	Volčja Draga
00050000-553a-bdc3-eb73-3ba46135598e	2232	Voličina
00050000-553a-bdc3-2f88-dd719b4c6363	3305	Vransko
00050000-553a-bdc3-a9f3-4efa019b51e2	6217	Vremski Britof
00050000-553a-bdc3-23be-0c8771539808	1360	Vrhnika
00050000-553a-bdc3-1cc7-062f27fbb680	2365	Vuhred
00050000-553a-bdc3-ac97-6e2b74528b00	2367	Vuzenica
00050000-553a-bdc3-5c8f-fed5992ce825	8292	Zabukovje 
00050000-553a-bdc3-df1c-d7516d60bbc3	1410	Zagorje ob Savi
00050000-553a-bdc3-7a02-a4256d222790	1303	Zagradec
00050000-553a-bdc3-b37b-018dcbda4097	2283	Zavrč
00050000-553a-bdc3-9dc3-80e607bb9ec4	8272	Zdole 
00050000-553a-bdc3-c856-ef9638b5db12	4201	Zgornja Besnica
00050000-553a-bdc3-f85d-2a24ee627791	2242	Zgornja Korena
00050000-553a-bdc3-17f4-9feddaa1e29e	2201	Zgornja Kungota
00050000-553a-bdc3-9035-07f541ee5b89	2316	Zgornja Ložnica
00050000-553a-bdc3-85f5-b2dc6dbbe62a	2314	Zgornja Polskava
00050000-553a-bdc3-6b39-4e62e43e0841	2213	Zgornja Velka
00050000-553a-bdc3-8806-194dbbf4c968	4247	Zgornje Gorje
00050000-553a-bdc3-7836-bfd30d5193ac	4206	Zgornje Jezersko
00050000-553a-bdc3-6ba9-9288061c2965	2285	Zgornji Leskovec
00050000-553a-bdc3-3751-4cb57266f0f7	1432	Zidani Most
00050000-553a-bdc3-175c-8f5e9a3938b5	3214	Zreče
00050000-553a-bdc3-f791-8c06efa724ba	4209	Žabnica
00050000-553a-bdc3-9fe8-ead03444eca6	3310	Žalec
00050000-553a-bdc3-d679-3bca16e7caf1	4228	Železniki
00050000-553a-bdc3-9e4f-4dc5fe4fae45	2287	Žetale
00050000-553a-bdc3-8065-e3507481357d	4226	Žiri
00050000-553a-bdc3-545f-85c33e72b80e	4274	Žirovnica
00050000-553a-bdc3-5e9f-71cc7fdaa472	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 1421780)
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
-- TOC entry 2642 (class 0 OID 1421603)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1421669)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1421792)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1421897)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1421941)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1421821)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1421765)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1421755)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1421931)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1421887)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 1421469)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-553a-bdc4-d3ce-d6c592f50353	00010000-553a-bdc5-a8e2-e528362d8f7e	2015-04-25 00:03:49	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROLhXatwUvqpn.5/I9yCQO2mxjoWsgag.";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 1421830)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1421508)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-553a-bdc4-7334-dd2b934d01d2	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-553a-bdc4-97cc-e28e36b8693a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-553a-bdc4-9c12-19e6d32582ff	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-553a-bdc4-85a5-dc85393ee8ed	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-553a-bdc4-fc1d-c2d05331c09b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-553a-bdc4-7eaa-d2db634b5ada	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 1421492)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-553a-bdc4-d3ce-d6c592f50353	00020000-553a-bdc4-85a5-dc85393ee8ed
00010000-553a-bdc5-a8e2-e528362d8f7e	00020000-553a-bdc4-85a5-dc85393ee8ed
\.


--
-- TOC entry 2668 (class 0 OID 1421844)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 1421786)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1421736)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 1421568)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1421742)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1421922)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1421638)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1421478)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-553a-bdc5-a8e2-e528362d8f7e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROOpDZL/IpTiSdAI9MG4FRDrmJQH1XHvu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-553a-bdc4-d3ce-d6c592f50353	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 1421972)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1421684)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 1421813)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1421879)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1421712)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1421962)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 1421869)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 1421532)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 1422011)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 1422004)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 1421921)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 1421702)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 1421735)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 1421664)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 1421865)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 1421682)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 1421729)
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
-- TOC entry 2365 (class 2606 OID 1421778)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 1421805)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 1421636)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 1421541)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 1421600)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 1421566)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 1421521)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 1421507)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 1421811)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 1421843)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 1421958)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 1421593)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 1421624)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 1421784)
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
-- TOC entry 2299 (class 2606 OID 1421614)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 1421673)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 1421796)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 1421903)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 1421946)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 1421828)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 1421769)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 1421760)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 1421940)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 1421894)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 1421477)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 1421834)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 1421496)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 1421515)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 1421852)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 1421791)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 1421741)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 1421573)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 1421751)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 1421930)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 1421649)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 1421490)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 1421986)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 1421688)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 1421819)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 1421885)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 1421724)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 1421971)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 1421878)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 1421709)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 1421595)
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
-- TOC entry 2378 (class 1259 OID 1421812)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 1421798)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 1421797)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 1421689)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 1421868)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 1421866)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 1421867)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 1421959)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 1421960)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 1421961)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 1421989)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 1421988)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 1421987)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 1421651)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 1421650)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 1421602)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 1421601)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 1421835)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 1421730)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 1421522)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 1421523)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 1421855)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 1421854)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 1421853)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 1421674)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 1421676)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 1421675)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 1421764)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 1421762)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 1421761)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 1421763)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 1421497)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 1421498)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 1421820)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 1421785)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 1421895)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 1421896)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 1421616)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 1421615)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 1421617)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 1421904)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 1421905)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 1422014)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 1422013)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 1422016)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 1422012)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 1422015)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 1421886)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 1421773)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 1421772)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 1421770)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 1421771)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 1422006)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 1422005)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 1421683)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 1421543)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 1421542)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 1421574)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 1421575)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 1421754)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 1421753)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 1421752)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 1421711)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 1421707)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 1421704)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 1421705)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 1421703)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 1421708)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 1421706)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 1421594)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 1421665)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1421667)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 1421666)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 1421668)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 1421779)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 1421567)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 1421637)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2258 (class 1259 OID 1421491)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2386 (class 1259 OID 1421829)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 1421625)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 1421947)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 1421516)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 1421710)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2473 (class 2606 OID 1422147)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 1422132)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2471 (class 2606 OID 1422137)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2475 (class 2606 OID 1422157)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2469 (class 2606 OID 1422127)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2474 (class 2606 OID 1422152)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 1422142)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 1422062)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 1422242)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 1422237)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2490 (class 2606 OID 1422232)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 1422122)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 1422282)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2498 (class 2606 OID 1422272)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1422277)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 1422222)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 1422317)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 1422322)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 1422327)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2512 (class 2606 OID 1422342)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 1422337)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2510 (class 2606 OID 1422332)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2463 (class 2606 OID 1422097)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 1422092)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 1422072)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 1422067)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 1422047)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 1422252)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 1422162)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2449 (class 2606 OID 1422027)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 1422032)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2497 (class 2606 OID 1422267)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 1422262)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2495 (class 2606 OID 1422257)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2464 (class 2606 OID 1422102)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2466 (class 2606 OID 1422112)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 1422107)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2483 (class 2606 OID 1422197)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2481 (class 2606 OID 1422187)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2480 (class 2606 OID 1422182)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2482 (class 2606 OID 1422192)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2447 (class 2606 OID 1422017)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 1422022)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 1422247)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 1422227)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2502 (class 2606 OID 1422292)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2503 (class 2606 OID 1422297)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 1422082)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 1422077)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 1422087)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2504 (class 2606 OID 1422302)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 1422307)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 1422367)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 1422362)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2519 (class 2606 OID 1422377)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 1422357)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2518 (class 2606 OID 1422372)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 1422287)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2487 (class 2606 OID 1422217)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2486 (class 2606 OID 1422212)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2484 (class 2606 OID 1422202)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2485 (class 2606 OID 1422207)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2514 (class 2606 OID 1422352)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2513 (class 2606 OID 1422347)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 1422117)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1422312)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 1422042)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2451 (class 2606 OID 1422037)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2454 (class 2606 OID 1422052)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 1422057)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2479 (class 2606 OID 1422177)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 1422172)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2477 (class 2606 OID 1422167)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-25 00:03:49 CEST

--
-- PostgreSQL database dump complete
--

