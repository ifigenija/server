--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-20 11:12:59 CEST

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
-- TOC entry 179 (class 1259 OID 4045078)
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
-- TOC entry 225 (class 1259 OID 4045561)
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
-- TOC entry 224 (class 1259 OID 4045544)
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
-- TOC entry 217 (class 1259 OID 4045455)
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
-- TOC entry 193 (class 1259 OID 4045246)
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
-- TOC entry 196 (class 1259 OID 4045280)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4045205)
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
-- TOC entry 212 (class 1259 OID 4045405)
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
-- TOC entry 191 (class 1259 OID 4045230)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4045274)
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
-- TOC entry 201 (class 1259 OID 4045323)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4045348)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4045179)
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
-- TOC entry 180 (class 1259 OID 4045087)
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
-- TOC entry 181 (class 1259 OID 4045098)
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
-- TOC entry 184 (class 1259 OID 4045149)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4045052)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4045071)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4045355)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4045385)
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
-- TOC entry 221 (class 1259 OID 4045500)
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
-- TOC entry 183 (class 1259 OID 4045129)
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
-- TOC entry 186 (class 1259 OID 4045171)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4045329)
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
-- TOC entry 185 (class 1259 OID 4045156)
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
-- TOC entry 190 (class 1259 OID 4045222)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4045341)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4045446)
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
-- TOC entry 220 (class 1259 OID 4045493)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4045370)
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
-- TOC entry 200 (class 1259 OID 4045314)
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
-- TOC entry 199 (class 1259 OID 4045304)
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
-- TOC entry 219 (class 1259 OID 4045483)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4045436)
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
-- TOC entry 173 (class 1259 OID 4045023)
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
-- TOC entry 172 (class 1259 OID 4045021)
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
-- TOC entry 209 (class 1259 OID 4045379)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4045061)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4045045)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4045393)
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
-- TOC entry 203 (class 1259 OID 4045335)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4045285)
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
-- TOC entry 182 (class 1259 OID 4045121)
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
-- TOC entry 198 (class 1259 OID 4045291)
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
-- TOC entry 218 (class 1259 OID 4045471)
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
-- TOC entry 188 (class 1259 OID 4045191)
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
-- TOC entry 174 (class 1259 OID 4045032)
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
-- TOC entry 223 (class 1259 OID 4045525)
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
-- TOC entry 192 (class 1259 OID 4045237)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4045362)
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
-- TOC entry 214 (class 1259 OID 4045428)
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
-- TOC entry 194 (class 1259 OID 4045269)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4045515)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4045418)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4045026)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 4045078)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 4045561)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 4045544)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4045455)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4045246)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4045280)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4045205)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555c-501a-8d15-3403bd24946a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555c-501a-a88b-744facae63ed	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555c-501a-cf86-b91399733082	AL	ALB	008	Albania 	Albanija	\N
00040000-555c-501a-352d-41a4d341815f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555c-501a-e011-2ff81296ee45	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555c-501a-e7b0-c7ab88dd1a91	AD	AND	020	Andorra 	Andora	\N
00040000-555c-501a-96ac-4a9cb78f40f4	AO	AGO	024	Angola 	Angola	\N
00040000-555c-501a-5750-01ce517f5f88	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555c-501a-aafe-c2cfab0fc5c1	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555c-501a-f880-0e260530116d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555c-501a-65f7-0c431cf230f3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555c-501a-785a-4b8fb9e20cfe	AM	ARM	051	Armenia 	Armenija	\N
00040000-555c-501a-c3d4-702ce8b2ab51	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555c-501a-b0fb-55a3c8ed4179	AU	AUS	036	Australia 	Avstralija	\N
00040000-555c-501a-b747-e2d5ed672bf0	AT	AUT	040	Austria 	Avstrija	\N
00040000-555c-501a-ffe8-90e4f05ff2db	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555c-501a-6ba5-46d686ef9cc7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555c-501a-559f-50e0c8de0156	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555c-501a-1d44-c072e8fc3df2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555c-501a-292f-5be0467920e0	BB	BRB	052	Barbados 	Barbados	\N
00040000-555c-501a-4484-06b2f6a43bb9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555c-501a-aa52-e2ee008cb837	BE	BEL	056	Belgium 	Belgija	\N
00040000-555c-501a-860a-86b3c4e87f94	BZ	BLZ	084	Belize 	Belize	\N
00040000-555c-501a-c2c7-a66db353356b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555c-501a-0559-77c244e3b316	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555c-501a-26a3-3d0b0c10c9d3	BT	BTN	064	Bhutan 	Butan	\N
00040000-555c-501a-e48a-761808614e83	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555c-501a-6530-a8d682c0f594	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555c-501a-6a3e-e44aca42bf41	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555c-501a-cff5-8881101057b3	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555c-501a-6c81-b0f556f28562	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555c-501a-ea3f-67a73be39cd9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555c-501a-1bd9-139f7b354437	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555c-501a-5b2a-6ddaa387801d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555c-501a-6db9-2d67a168f9c6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555c-501a-88c0-390e04553e1b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555c-501a-e85e-302aa0cf7ad3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555c-501a-6665-ae4484ff8836	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555c-501a-0ef8-662fd4ab14a9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555c-501a-91f0-23ee8fe19e85	CA	CAN	124	Canada 	Kanada	\N
00040000-555c-501a-f7a6-0a74ef8e3aac	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555c-501a-48de-5664816e3b15	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555c-501a-27b5-e003503bd10e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555c-501a-a613-7b69c1b91d50	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555c-501a-40ec-e7f056f9bd34	CL	CHL	152	Chile 	Čile	\N
00040000-555c-501a-3716-a4812cd9615b	CN	CHN	156	China 	Kitajska	\N
00040000-555c-501a-f51c-86f502fc5b84	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555c-501a-fded-3af8b56107b8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555c-501a-b831-e8fcbe602421	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555c-501a-ba86-45b0cb4dbc51	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555c-501a-3852-2af462d6d168	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555c-501a-0030-1d139059d9a7	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555c-501a-f136-642161c3c496	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555c-501a-067e-00f04cca0a4b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555c-501a-470e-232f2e095dfb	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555c-501b-5f5b-a855d63be748	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555c-501b-cf0b-fd513f4a80d4	CU	CUB	192	Cuba 	Kuba	\N
00040000-555c-501b-6c30-43225d1a6079	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555c-501b-df5a-95ee7deee967	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555c-501b-5686-e0dad5cb5a15	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555c-501b-9bae-128df3b79331	DK	DNK	208	Denmark 	Danska	\N
00040000-555c-501b-bcf4-ace70a6da9f4	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555c-501b-ba76-15874e26f9e4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555c-501b-44ca-dc249790b8cd	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555c-501b-1950-0729ff1f1359	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555c-501b-47d1-27e0cf4dedac	EG	EGY	818	Egypt 	Egipt	\N
00040000-555c-501b-e577-93ba3e42a5ee	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555c-501b-6b85-8de98d8d0fef	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555c-501b-9ce0-f10a6e0955dd	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555c-501b-717f-796c6f26999a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555c-501b-1e63-1aaac55a4500	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555c-501b-c8fe-b9949d32daaa	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555c-501b-86a9-295dd7c305c1	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555c-501b-682e-db977efdd57e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555c-501b-a7d6-7d93ba9c46e3	FI	FIN	246	Finland 	Finska	\N
00040000-555c-501b-6c84-80f8f09d1870	FR	FRA	250	France 	Francija	\N
00040000-555c-501b-8b74-ee631676b4b3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555c-501b-1394-176ee436ff53	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555c-501b-6066-3563979b9e12	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555c-501b-7787-aae7d5d97c90	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555c-501b-aed6-2c6975ab1230	GA	GAB	266	Gabon 	Gabon	\N
00040000-555c-501b-2c26-27ec02031963	GM	GMB	270	Gambia 	Gambija	\N
00040000-555c-501b-8e14-015a12afd1d0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555c-501b-1231-94b0f08d7d07	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555c-501b-6296-b7a25b7d298e	GH	GHA	288	Ghana 	Gana	\N
00040000-555c-501b-180e-1e42ca020e9d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555c-501b-6ce4-5f24c97cd0a5	GR	GRC	300	Greece 	Grčija	\N
00040000-555c-501b-dc1a-e7a4e9c0a57c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555c-501b-31c3-30c46c8397af	GD	GRD	308	Grenada 	Grenada	\N
00040000-555c-501b-964c-20f54af6d75f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555c-501b-037b-5eb8d26c23c8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555c-501b-7266-f3abad122ddf	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555c-501b-c37b-21f3038459a2	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555c-501b-5e62-9c963bf92e9f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555c-501b-578c-bcf620281216	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555c-501b-4b18-e39e71eae3e9	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555c-501b-7f68-cf676bd3d083	HT	HTI	332	Haiti 	Haiti	\N
00040000-555c-501b-7ff3-4493c9023700	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555c-501b-3b6b-ace10d3f1976	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555c-501b-a9e2-666248046dbf	HN	HND	340	Honduras 	Honduras	\N
00040000-555c-501b-ddb5-673beafcfafe	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555c-501b-520c-4c3906bd52c6	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555c-501b-3ca1-0bf1c983ba7d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555c-501b-f0a7-223cf76e8987	IN	IND	356	India 	Indija	\N
00040000-555c-501b-8e32-a29587add62a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555c-501b-6836-ccd210b97388	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555c-501b-c869-5e7707d6dd44	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555c-501b-c081-9b147b2173d6	IE	IRL	372	Ireland 	Irska	\N
00040000-555c-501b-237f-a513025515f1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555c-501b-eef7-228aae8f39eb	IL	ISR	376	Israel 	Izrael	\N
00040000-555c-501b-8d8a-ea78b3e6de61	IT	ITA	380	Italy 	Italija	\N
00040000-555c-501b-cf35-8d8ba21b18d2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555c-501b-7809-fb9fd63e06c6	JP	JPN	392	Japan 	Japonska	\N
00040000-555c-501b-0f93-8f95da6da6b1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555c-501b-cead-646b0a938d16	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555c-501b-5ef0-4229e792f9ac	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555c-501b-f086-e2400486661e	KE	KEN	404	Kenya 	Kenija	\N
00040000-555c-501b-efe4-9226c634cbc4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555c-501b-79ec-87a5be75b24c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555c-501b-4da6-425d8c4a65b2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555c-501b-21b3-43dfb9d8f154	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555c-501b-e27d-81d400464ca1	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555c-501b-2321-ca548b0f2951	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555c-501b-288b-59f818db5a49	LV	LVA	428	Latvia 	Latvija	\N
00040000-555c-501b-14ab-e77a07ab236d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555c-501b-e9b4-23ea0b0d84e2	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555c-501b-4294-3776874f862d	LR	LBR	430	Liberia 	Liberija	\N
00040000-555c-501b-ce2f-7a7178316a2a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555c-501b-48ea-ef021d1aa656	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555c-501b-c8a8-979b862f1ff8	LT	LTU	440	Lithuania 	Litva	\N
00040000-555c-501b-9447-a9e04b7a7e1b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555c-501b-1fff-be028e6106ea	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555c-501b-4101-a4ab1a0b9666	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555c-501b-1f85-aaa1d463941e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555c-501b-0407-ea3ac630ed09	MW	MWI	454	Malawi 	Malavi	\N
00040000-555c-501b-6397-ea3e57256c79	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555c-501b-695d-50b35b3feaac	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555c-501b-43bf-0508a200115b	ML	MLI	466	Mali 	Mali	\N
00040000-555c-501b-f7ed-4fe01f1ae775	MT	MLT	470	Malta 	Malta	\N
00040000-555c-501b-7e10-2a57efb5579e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555c-501b-5547-5c71163f30e6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555c-501b-82ff-375b502c90df	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555c-501b-4ed7-1174faa3d4d6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555c-501b-4619-2cc4f5c60861	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555c-501b-abaa-cee84a0efb28	MX	MEX	484	Mexico 	Mehika	\N
00040000-555c-501b-64d4-e070512d7a77	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555c-501b-7a5f-ccb90a2dc17c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555c-501b-f5a2-c82aedee53d7	MC	MCO	492	Monaco 	Monako	\N
00040000-555c-501b-1e31-f9e41fa9e1e1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555c-501b-0abe-9268d727454a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555c-501b-1bdc-5d05cd213521	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555c-501b-1a1c-d650c8c1c821	MA	MAR	504	Morocco 	Maroko	\N
00040000-555c-501b-d2cc-4a793829086e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555c-501b-aee8-df097e2434b8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555c-501b-8172-472a6fa9e55b	NA	NAM	516	Namibia 	Namibija	\N
00040000-555c-501b-66f1-4b86fe639595	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555c-501b-4eb0-3335ec6f990b	NP	NPL	524	Nepal 	Nepal	\N
00040000-555c-501b-1f7f-cb22e8cbff15	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555c-501b-82f3-403d276bad00	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555c-501b-b766-7ac533948420	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555c-501b-25cb-61daa680c2d0	NE	NER	562	Niger 	Niger 	\N
00040000-555c-501b-3ffb-503990cd6590	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555c-501b-7237-db588c06226c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555c-501b-eefb-5b572b24a64f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555c-501b-67ec-574bcc9145b7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555c-501b-768e-2bd11ebd8242	NO	NOR	578	Norway 	Norveška	\N
00040000-555c-501b-06b5-e74778780a46	OM	OMN	512	Oman 	Oman	\N
00040000-555c-501b-7d81-9f76b6d9a2b2	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555c-501b-0abc-5c465d16e535	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555c-501b-e6ff-2dfb0f018c2f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555c-501b-b95b-46a1c7be6ba8	PA	PAN	591	Panama 	Panama	\N
00040000-555c-501b-ff4a-e3196ad44b8c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555c-501b-1c17-133a5f3331b7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555c-501b-0734-dd5d23d7850a	PE	PER	604	Peru 	Peru	\N
00040000-555c-501b-8565-3aa61190fbfb	PH	PHL	608	Philippines 	Filipini	\N
00040000-555c-501b-8902-a4e727537d66	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555c-501b-1ffc-0946c3ca0193	PL	POL	616	Poland 	Poljska	\N
00040000-555c-501b-bee0-c30aa475a9d7	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555c-501b-84d7-18c6afdf216d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555c-501b-126c-a317cdfcd4dc	QA	QAT	634	Qatar 	Katar	\N
00040000-555c-501b-4f5e-1ae7e7131ebe	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555c-501b-0218-441a81f2e8d2	RO	ROU	642	Romania 	Romunija	\N
00040000-555c-501b-0278-34bd666fe3a8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555c-501b-219d-794753c291cd	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555c-501b-8792-ab625e2b3d6e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555c-501b-b585-b87360e868a6	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555c-501b-ad1f-6d6dab68c307	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555c-501b-c84d-48e29b9a2103	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555c-501b-7eab-e3b527c39749	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555c-501b-9348-0612d2a23770	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555c-501b-773b-3fb40cdf2443	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555c-501b-b6ff-9e074ec45e8e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555c-501b-699e-2c7b16931560	SM	SMR	674	San Marino 	San Marino	\N
00040000-555c-501b-b1e5-3750b9ce8942	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555c-501b-07bd-0a3042697430	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555c-501b-7171-eb99c451ac88	SN	SEN	686	Senegal 	Senegal	\N
00040000-555c-501b-4885-c37aa0e5a012	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555c-501b-92bb-27197182fede	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555c-501b-da50-7e22d40e3b07	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555c-501b-6df3-c8d9a9521389	SG	SGP	702	Singapore 	Singapur	\N
00040000-555c-501b-c912-90536ffd37ca	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555c-501b-a93f-a3329f272226	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555c-501b-56b6-1340adb8b4fe	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555c-501b-6a3b-77f2b041b6db	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555c-501b-6ea1-74335cefd875	SO	SOM	706	Somalia 	Somalija	\N
00040000-555c-501b-c396-73e105efde3b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555c-501b-a319-bd825a5b54ef	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555c-501b-ad5d-892db38e316f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555c-501b-65d8-e85fd61cf10c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555c-501b-9a90-f96550b378fb	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555c-501b-1ccd-52bfaaa3d0be	SD	SDN	729	Sudan 	Sudan	\N
00040000-555c-501b-c725-efbf407d4c73	SR	SUR	740	Suriname 	Surinam	\N
00040000-555c-501b-e84a-7616f221556d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555c-501b-ee8c-30b354b2e785	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555c-501b-418f-53b99d13a08f	SE	SWE	752	Sweden 	Švedska	\N
00040000-555c-501b-3e17-f2016b4754a2	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555c-501b-d6bc-5e9f47611f72	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555c-501b-9ad8-c9e110a9adb7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555c-501b-b6e9-75ad78230ea1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555c-501b-a052-9101e9e9dc36	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555c-501b-6116-b5248a43cb8f	TH	THA	764	Thailand 	Tajska	\N
00040000-555c-501b-b959-bcac82b985f7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555c-501b-a19c-ce09b78ee8b4	TG	TGO	768	Togo 	Togo	\N
00040000-555c-501b-5735-1df625163682	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555c-501b-14fa-0ba09d697534	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555c-501b-856f-d0de1c7a989d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555c-501b-32c1-c55eceba1df1	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555c-501b-8afe-7e7637ad1264	TR	TUR	792	Turkey 	Turčija	\N
00040000-555c-501b-d68f-acd83f0f7892	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555c-501b-5904-ae95cbd07ddc	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555c-501b-0be9-c9d22654e8b4	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555c-501b-2274-100b1d8af1c4	UG	UGA	800	Uganda 	Uganda	\N
00040000-555c-501b-0f33-90bc1714f64e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555c-501b-daa6-4031ef92139a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555c-501b-28be-12ad0b7bc565	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555c-501b-522d-3090f2a6e102	US	USA	840	United States 	Združene države Amerike	\N
00040000-555c-501b-bb07-6f9d7312f9bb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555c-501b-ba98-27a2796b1ad3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555c-501b-1e9b-7158b8e0ff48	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555c-501b-41c5-5b892bb948fd	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555c-501b-0885-313933a37cfc	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555c-501b-0343-c654f557ca9c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555c-501b-5484-a9db54b865f9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555c-501b-1ab7-56283e76ce73	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555c-501b-7c46-25c069777616	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555c-501b-1bca-e90f6b32ad52	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555c-501b-d835-b390f7c24008	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555c-501b-5272-4b4bdae4b31e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555c-501b-a3c4-4b5a74a278aa	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 4045405)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4045230)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4045274)
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
-- TOC entry 2658 (class 0 OID 4045323)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 4045348)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4045179)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555c-501b-3b7e-b8b50db33095	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555c-501b-8f1e-e7fbed34fcb7	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555c-501b-6a70-b30a4d4caed6	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555c-501b-c757-2525d974ba83	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555c-501b-03d5-ef70d67054f8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555c-501b-575f-148164b80b53	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555c-501b-4805-436d069d4255	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555c-501b-50d0-69e4142aa46d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555c-501b-24fb-c9e50c3ff6b1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555c-501b-5366-4fd5460262af	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 4045087)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555c-501b-9111-d196f0e65186	00000000-555c-501b-03d5-ef70d67054f8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555c-501b-7108-d17734207c58	00000000-555c-501b-03d5-ef70d67054f8	00010000-555c-501b-8330-2408ce702943	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555c-501b-f8eb-669cf606e904	00000000-555c-501b-575f-148164b80b53	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 4045098)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4045149)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 4045052)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555c-501b-16e9-10e09a4b4ae7	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555c-501b-3239-0dd61e8e1ad7	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555c-501b-0992-9c57751d3e0e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555c-501b-32bf-86e8ea794dcc	Abonma-read	Abonma - branje	f
00030000-555c-501b-7a77-aae8f2d18038	Abonma-write	Abonma - spreminjanje	f
00030000-555c-501b-2c4c-56502ed08fa5	Alternacija-read	Alternacija - branje	f
00030000-555c-501b-6faf-76ec970d0451	Alternacija-write	Alternacija - spreminjanje	f
00030000-555c-501b-8b91-c82c7f658902	Arhivalija-read	Arhivalija - branje	f
00030000-555c-501b-9e75-658e765df827	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555c-501b-891f-471eb559e81d	Besedilo-read	Besedilo - branje	f
00030000-555c-501b-faa8-982530f9a678	Besedilo-write	Besedilo - spreminjanje	f
00030000-555c-501b-1db5-f9a839918ca1	DogodekIzven-read	DogodekIzven - branje	f
00030000-555c-501b-3550-bef1f2acef07	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555c-501b-38e0-0676a308fb4b	Dogodek-read	Dogodek - branje	f
00030000-555c-501b-7851-90fbf8b472e4	Dogodek-write	Dogodek - spreminjanje	f
00030000-555c-501b-9cc1-12e4c0c5932b	Drzava-read	Drzava - branje	f
00030000-555c-501b-cc33-0f1bd73e54c5	Drzava-write	Drzava - spreminjanje	f
00030000-555c-501b-0c52-f22761ed0434	Funkcija-read	Funkcija - branje	f
00030000-555c-501b-a1bd-1b7207b2fdcf	Funkcija-write	Funkcija - spreminjanje	f
00030000-555c-501b-9d49-50c53c88dc1f	Gostovanje-read	Gostovanje - branje	f
00030000-555c-501b-4f83-3b7e2309b382	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555c-501b-9b4e-47da43680bd0	Gostujoca-read	Gostujoca - branje	f
00030000-555c-501b-da76-ac785183e42e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555c-501b-d14f-043b8f6e3956	Kupec-read	Kupec - branje	f
00030000-555c-501b-2ae6-8b05d8c1f101	Kupec-write	Kupec - spreminjanje	f
00030000-555c-501b-b25f-82a6c47aabb9	NacinPlacina-read	NacinPlacina - branje	f
00030000-555c-501b-ab7b-f38bbd11298e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555c-501b-d88f-d6fe394f5e6a	Option-read	Option - branje	f
00030000-555c-501b-a5b6-7ad5a2c46365	Option-write	Option - spreminjanje	f
00030000-555c-501b-e524-a50639fd8ed9	OptionValue-read	OptionValue - branje	f
00030000-555c-501b-85a0-478b1c1e1fe6	OptionValue-write	OptionValue - spreminjanje	f
00030000-555c-501b-b090-9b34e7474d54	Oseba-read	Oseba - branje	f
00030000-555c-501b-e02f-80136809f461	Oseba-write	Oseba - spreminjanje	f
00030000-555c-501b-09d2-687febc7de46	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555c-501b-9806-f22210367b49	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555c-501b-5c9e-281a0c31d3aa	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555c-501b-cbc7-baf0c1917d0d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555c-501b-7d9e-80093626572b	Pogodba-read	Pogodba - branje	f
00030000-555c-501b-34ad-ec48423ce2ad	Pogodba-write	Pogodba - spreminjanje	f
00030000-555c-501b-ce25-90f42ce23e54	Popa-read	Popa - branje	f
00030000-555c-501b-23ad-1d3f2a1d7edf	Popa-write	Popa - spreminjanje	f
00030000-555c-501b-3727-aa1e9bf008c3	Posta-read	Posta - branje	f
00030000-555c-501b-1a74-58ca6dc63e8a	Posta-write	Posta - spreminjanje	f
00030000-555c-501b-5f44-d9468c4b36b0	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555c-501b-8ebd-3a55fb552c35	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555c-501b-3102-9e24d06fe19a	PostniNaslov-read	PostniNaslov - branje	f
00030000-555c-501b-9c85-c264a87d961a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555c-501b-cd19-201b980b1343	Predstava-read	Predstava - branje	f
00030000-555c-501b-7429-6ac0112c2213	Predstava-write	Predstava - spreminjanje	f
00030000-555c-501b-edef-1ffe507bf97b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555c-501b-b481-a23fe569d725	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555c-501b-adca-37890f9a9b99	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555c-501b-041c-989fe97a5312	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555c-501b-7241-a85de890fbb9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555c-501b-52e6-096f09f5241d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555c-501b-57fa-52517c5f28c4	Prostor-read	Prostor - branje	f
00030000-555c-501b-4a77-e83e45505b2c	Prostor-write	Prostor - spreminjanje	f
00030000-555c-501b-8124-3fdd9a31ba42	Racun-read	Racun - branje	f
00030000-555c-501b-81b4-36bd9ffc0b1e	Racun-write	Racun - spreminjanje	f
00030000-555c-501b-7090-c69b34354bde	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555c-501b-a29f-0fc0dcde7c0c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555c-501b-4723-c3076f555db0	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555c-501b-6b29-ff3152a62af4	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555c-501b-91f6-3b0ff1104f42	Rekvizit-read	Rekvizit - branje	f
00030000-555c-501b-e8a6-f79303cfc02a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555c-501b-ee95-1c61ca8b077e	Rezervacija-read	Rezervacija - branje	f
00030000-555c-501b-0b2f-b3237834063d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555c-501b-3666-6b54d65d3f6a	SedezniRed-read	SedezniRed - branje	f
00030000-555c-501b-a954-8f212a6a6f89	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555c-501b-13ae-126401978bf1	Sedez-read	Sedez - branje	f
00030000-555c-501b-a588-78fc6427bd6d	Sedez-write	Sedez - spreminjanje	f
00030000-555c-501b-503b-078a39650737	Sezona-read	Sezona - branje	f
00030000-555c-501b-79dc-b7aab22c6605	Sezona-write	Sezona - spreminjanje	f
00030000-555c-501b-9372-f1f42feca2bc	Telefonska-read	Telefonska - branje	f
00030000-555c-501b-172a-eeb5fcc51ff6	Telefonska-write	Telefonska - spreminjanje	f
00030000-555c-501b-16a8-e6c7dd8f3c73	TerminStoritve-read	TerminStoritve - branje	f
00030000-555c-501b-6a63-2f92e9ba84aa	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555c-501b-1378-7d06aef4bce2	TipFunkcije-read	TipFunkcije - branje	f
00030000-555c-501b-a766-06b15d4f3bc2	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555c-501b-f897-9cfed62cc208	Trr-read	Trr - branje	f
00030000-555c-501b-c416-b89daacde4a1	Trr-write	Trr - spreminjanje	f
00030000-555c-501b-543b-dfa65a4d2aee	Uprizoritev-read	Uprizoritev - branje	f
00030000-555c-501b-87cb-29c0aab27a5b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555c-501b-e206-fe52d7e781ba	Vaja-read	Vaja - branje	f
00030000-555c-501b-0552-3bad0e005efd	Vaja-write	Vaja - spreminjanje	f
00030000-555c-501b-4a8f-0f5638794782	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555c-501b-0ff5-b043d8a070e5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555c-501b-b724-8b6d4e1c1d2f	Zaposlitev-read	Zaposlitev - branje	f
00030000-555c-501b-dbc8-64e4cfdcd0aa	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555c-501b-3377-d82d037cfd79	Zasedenost-read	Zasedenost - branje	f
00030000-555c-501b-dbdd-877a7aac1954	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555c-501b-3e3f-3feb76a80347	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555c-501b-de18-b5acb9cc3319	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555c-501b-11ff-8f16d8194618	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555c-501b-1d4e-e7c0861d600e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 4045071)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555c-501b-4d7e-d13e3d08a5ab	00030000-555c-501b-9cc1-12e4c0c5932b
00020000-555c-501b-3024-f0665ecb72db	00030000-555c-501b-cc33-0f1bd73e54c5
00020000-555c-501b-3024-f0665ecb72db	00030000-555c-501b-9cc1-12e4c0c5932b
\.


--
-- TOC entry 2663 (class 0 OID 4045355)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4045385)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4045500)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4045129)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4045171)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555c-501a-e936-ab20678c415f	8341	Adlešiči
00050000-555c-501a-28bd-ba3c4a867e64	5270	Ajdovščina
00050000-555c-501a-2ce8-00b4df019792	6280	Ankaran/Ancarano
00050000-555c-501a-a4ad-1489d9f8d418	9253	Apače
00050000-555c-501a-4cea-ff2c63302ead	8253	Artiče
00050000-555c-501a-d552-7af94dd8e93c	4275	Begunje na Gorenjskem
00050000-555c-501a-ddab-4a7e015cb9c8	1382	Begunje pri Cerknici
00050000-555c-501a-9f70-0474e6962134	9231	Beltinci
00050000-555c-501a-f589-514d1586d0a4	2234	Benedikt
00050000-555c-501a-3318-ac0985506578	2345	Bistrica ob Dravi
00050000-555c-501a-0079-008127a1d093	3256	Bistrica ob Sotli
00050000-555c-501a-db4e-302937ff85e8	8259	Bizeljsko
00050000-555c-501a-b7dd-ac6212afb927	1223	Blagovica
00050000-555c-501a-d3aa-a4d5519168bf	8283	Blanca
00050000-555c-501a-1ba1-51fec5db130b	4260	Bled
00050000-555c-501a-0e72-ccb22dbd4f46	4273	Blejska Dobrava
00050000-555c-501a-d50f-4b805449dd23	9265	Bodonci
00050000-555c-501a-9855-55ceba90deef	9222	Bogojina
00050000-555c-501a-eae8-32e5b89e5192	4263	Bohinjska Bela
00050000-555c-501a-0275-2c04c5068549	4264	Bohinjska Bistrica
00050000-555c-501a-c33f-75bd2e590758	4265	Bohinjsko jezero
00050000-555c-501a-6e34-7cbeb81c2e12	1353	Borovnica
00050000-555c-501a-4ffb-b1b29399cb5a	8294	Boštanj
00050000-555c-501a-16ea-8d7f13a3b049	5230	Bovec
00050000-555c-501a-c1d0-08c75173c610	5295	Branik
00050000-555c-501a-3685-bfe006eca013	3314	Braslovče
00050000-555c-501a-0efe-54ef07ca874d	5223	Breginj
00050000-555c-501a-dcd7-934851560be5	8280	Brestanica
00050000-555c-501a-7dfd-2b0f4966e496	2354	Bresternica
00050000-555c-501a-88b1-0ac5718fe0a6	4243	Brezje
00050000-555c-501a-8b96-694a70583b04	1351	Brezovica pri Ljubljani
00050000-555c-501a-5885-5b659b714b4c	8250	Brežice
00050000-555c-501a-f42d-4c7cd9022c81	4210	Brnik - Aerodrom
00050000-555c-501a-b14e-8e45d84dce0f	8321	Brusnice
00050000-555c-501a-1abe-ebce23d395a4	3255	Buče
00050000-555c-501a-df80-1bc9a5a48583	8276	Bučka 
00050000-555c-501a-7172-a5b0ead5bc3c	9261	Cankova
00050000-555c-501a-9813-45927669b517	3000	Celje 
00050000-555c-501a-b38a-7f7d37b90213	3001	Celje - poštni predali
00050000-555c-501a-4779-b6eb64b1741a	4207	Cerklje na Gorenjskem
00050000-555c-501a-48b8-57d5db96d561	8263	Cerklje ob Krki
00050000-555c-501a-fb5e-08ef7c3cf3ca	1380	Cerknica
00050000-555c-501a-8a51-d02570c62c3a	5282	Cerkno
00050000-555c-501a-5b3b-1e6159513b02	2236	Cerkvenjak
00050000-555c-501a-1d99-0f6cfd668ac2	2215	Ceršak
00050000-555c-501a-54a2-90002f479f56	2326	Cirkovce
00050000-555c-501a-247c-fb50b3565408	2282	Cirkulane
00050000-555c-501a-e1a2-5d5fbb3d5097	5273	Col
00050000-555c-501a-a78f-253993d98ee0	8251	Čatež ob Savi
00050000-555c-501a-7d32-838e39153292	1413	Čemšenik
00050000-555c-501a-6136-d8fe68302e38	5253	Čepovan
00050000-555c-501a-88b5-d1d7a3f2e404	9232	Črenšovci
00050000-555c-501a-dae7-9fb7e6431309	2393	Črna na Koroškem
00050000-555c-501a-ec16-2fbd4c96349f	6275	Črni Kal
00050000-555c-501a-da9d-aaaa40390c77	5274	Črni Vrh nad Idrijo
00050000-555c-501a-0339-c3f870bf4af8	5262	Črniče
00050000-555c-501a-6bd3-6a77c9c43078	8340	Črnomelj
00050000-555c-501a-b32b-8b50fdfafb61	6271	Dekani
00050000-555c-501a-06a5-c44c6c1c5b5b	5210	Deskle
00050000-555c-501a-7af6-26e1fb624a2a	2253	Destrnik
00050000-555c-501a-6697-e498127b6454	6215	Divača
00050000-555c-501a-dc96-aa4184c52f47	1233	Dob
00050000-555c-501a-d184-640f473b0ace	3224	Dobje pri Planini
00050000-555c-501a-8df2-6e6e02dc0a57	8257	Dobova
00050000-555c-501a-9b14-8e144f66c3bc	1423	Dobovec
00050000-555c-501a-c296-df510d4ccbf8	5263	Dobravlje
00050000-555c-501a-280c-d454722fac11	3204	Dobrna
00050000-555c-501a-67a4-c1b89d70b4fd	8211	Dobrnič
00050000-555c-501a-589c-ea5ed7ac1fe0	1356	Dobrova
00050000-555c-501a-1e62-6b20f09ca59a	9223	Dobrovnik/Dobronak 
00050000-555c-501a-ac1b-9b072d7b7881	5212	Dobrovo v Brdih
00050000-555c-501a-0360-f1d79fbdcaf9	1431	Dol pri Hrastniku
00050000-555c-501a-62d5-0bc9cab443ca	1262	Dol pri Ljubljani
00050000-555c-501a-8da2-732a14600b7d	1273	Dole pri Litiji
00050000-555c-501a-d5f6-b38503064e0b	1331	Dolenja vas
00050000-555c-501a-ba0c-519792175740	8350	Dolenjske Toplice
00050000-555c-501a-066d-40941bcefb0c	1230	Domžale
00050000-555c-501a-ea7b-b44fcca88b47	2252	Dornava
00050000-555c-501a-a893-ca03b6c64302	5294	Dornberk
00050000-555c-501a-a98f-43b40b8a0cca	1319	Draga
00050000-555c-501a-6ddd-be062895231c	8343	Dragatuš
00050000-555c-501a-bc5f-f1d6dbc4fed8	3222	Dramlje
00050000-555c-501a-afe3-57be2656b5f8	2370	Dravograd
00050000-555c-501a-c2ea-1f3ce537adc4	4203	Duplje
00050000-555c-501a-0b07-e413296d8f5e	6221	Dutovlje
00050000-555c-501a-2739-ca1f30da17a1	8361	Dvor
00050000-555c-501a-c02e-26f2b764394e	2343	Fala
00050000-555c-501a-e943-c84f47ca49e2	9208	Fokovci
00050000-555c-501a-443a-7968287a1ae8	2313	Fram
00050000-555c-501a-68fa-c15708de6535	3213	Frankolovo
00050000-555c-501a-3885-0edc666bfe9a	1274	Gabrovka
00050000-555c-501a-5942-39c9b49d6fba	8254	Globoko
00050000-555c-501a-5ce8-fcdc22e0eeba	5275	Godovič
00050000-555c-501a-be45-481dd81bdcf3	4204	Golnik
00050000-555c-501a-8abf-590af3188755	3303	Gomilsko
00050000-555c-501a-476b-0ad111a75517	4224	Gorenja vas
00050000-555c-501a-5cb1-8841e8c3fe48	3263	Gorica pri Slivnici
00050000-555c-501a-d5ff-43d3d790913d	2272	Gorišnica
00050000-555c-501a-d704-fb9141ab94c0	9250	Gornja Radgona
00050000-555c-501a-6861-df2a2e4b40cf	3342	Gornji Grad
00050000-555c-501a-a45b-84508c3f2220	4282	Gozd Martuljek
00050000-555c-501a-cd6c-a2d224388dfe	6272	Gračišče
00050000-555c-501a-692d-f9cba8d689f5	9264	Grad
00050000-555c-501a-4751-7ff20c71f78b	8332	Gradac
00050000-555c-501a-5dd7-4c9c941fce2b	1384	Grahovo
00050000-555c-501a-1808-8349a504f2fe	5242	Grahovo ob Bači
00050000-555c-501a-a979-0a9246590e7d	5251	Grgar
00050000-555c-501a-9701-5aa10d3b0e76	3302	Griže
00050000-555c-501a-2ff1-c8cb72e8597f	3231	Grobelno
00050000-555c-501a-05b0-5a9ba7c7707d	1290	Grosuplje
00050000-555c-501a-a791-e5b30f72ba6b	2288	Hajdina
00050000-555c-501a-ddec-5872ae39b956	8362	Hinje
00050000-555c-501a-d70e-25df446886bc	2311	Hoče
00050000-555c-501a-3d93-2e4bef5e1db6	9205	Hodoš/Hodos
00050000-555c-501a-d09e-351de650c05d	1354	Horjul
00050000-555c-501a-b40d-2c760ec8de56	1372	Hotedršica
00050000-555c-501a-6d9b-565cc0b58bfc	1430	Hrastnik
00050000-555c-501a-d6fb-7b008ce16293	6225	Hruševje
00050000-555c-501a-e859-64ac14c07633	4276	Hrušica
00050000-555c-501a-d45c-967e74a51507	5280	Idrija
00050000-555c-501a-2034-4fa852fd07a8	1292	Ig
00050000-555c-501a-9fa1-443b7e692078	6250	Ilirska Bistrica
00050000-555c-501a-a2c6-b212358208c3	6251	Ilirska Bistrica-Trnovo
00050000-555c-501a-132e-6ce7e1e1c7a2	1295	Ivančna Gorica
00050000-555c-501a-ec82-3f178a151a94	2259	Ivanjkovci
00050000-555c-501a-f402-dcab0d3742f2	1411	Izlake
00050000-555c-501a-7859-769c0f39e6a8	6310	Izola/Isola
00050000-555c-501a-5af8-06c28e17fc45	2222	Jakobski Dol
00050000-555c-501a-e452-c4a859ff58ee	2221	Jarenina
00050000-555c-501a-2d33-42840f5c24a5	6254	Jelšane
00050000-555c-501a-741d-bbd8e390f53b	4270	Jesenice
00050000-555c-501a-aaab-d30e9c91e200	8261	Jesenice na Dolenjskem
00050000-555c-501a-1436-e6667553e148	3273	Jurklošter
00050000-555c-501a-d8ff-41bdc0c38e37	2223	Jurovski Dol
00050000-555c-501a-cfe0-6a3a02554cda	2256	Juršinci
00050000-555c-501a-6d33-c943edd5575c	5214	Kal nad Kanalom
00050000-555c-501a-4de7-cb71f19d17d8	3233	Kalobje
00050000-555c-501a-46f0-227a74e5a8f8	4246	Kamna Gorica
00050000-555c-501a-3dac-19503f545340	2351	Kamnica
00050000-555c-501a-e22c-685673211bee	1241	Kamnik
00050000-555c-501a-b76e-03b82beaae20	5213	Kanal
00050000-555c-501a-471e-91fde727bd0c	8258	Kapele
00050000-555c-501a-87af-d3da140a623f	2362	Kapla
00050000-555c-501a-82b5-55829c175106	2325	Kidričevo
00050000-555c-501a-19e6-b5491f0003c5	1412	Kisovec
00050000-555c-501a-c024-9d67f5a02fa4	6253	Knežak
00050000-555c-501a-2fbc-b98b3e2e5e35	5222	Kobarid
00050000-555c-501a-b92d-bb53c32919d8	9227	Kobilje
00050000-555c-501a-1468-f36f835f78c9	1330	Kočevje
00050000-555c-501a-4baf-6dd55f408872	1338	Kočevska Reka
00050000-555c-501a-3b85-35fcbe655950	2276	Kog
00050000-555c-501a-346a-cd4e78e3db0f	5211	Kojsko
00050000-555c-501a-999a-4443552423ae	6223	Komen
00050000-555c-501a-6fa9-bf2177c56c3e	1218	Komenda
00050000-555c-501a-7fc1-ab145431a937	6000	Koper/Capodistria 
00050000-555c-501a-fefa-3ff45c781818	6001	Koper/Capodistria - poštni predali
00050000-555c-501a-5e96-11298c86fabe	8282	Koprivnica
00050000-555c-501a-08c0-0dab044d607a	5296	Kostanjevica na Krasu
00050000-555c-501a-30fd-d3ba419614b9	8311	Kostanjevica na Krki
00050000-555c-501a-f69e-98bc0ce79fb7	1336	Kostel
00050000-555c-501a-3532-00df9fa5afcb	6256	Košana
00050000-555c-501a-736e-8717eb707d88	2394	Kotlje
00050000-555c-501a-0318-bc0705b8cdfc	6240	Kozina
00050000-555c-501a-559b-f91ae1a6230e	3260	Kozje
00050000-555c-501a-1bc3-c3a4e1eb0722	4000	Kranj 
00050000-555c-501a-0398-c585ea16c424	4001	Kranj - poštni predali
00050000-555c-501a-df49-5407fbaed7c7	4280	Kranjska Gora
00050000-555c-501a-5b2a-a4484d8f3a7d	1281	Kresnice
00050000-555c-501a-d25f-5cf66778b44c	4294	Križe
00050000-555c-501a-7769-9b3aa72e1c54	9206	Križevci
00050000-555c-501a-8c6a-c3fe00723535	9242	Križevci pri Ljutomeru
00050000-555c-501a-f2e9-18f54106e386	1301	Krka
00050000-555c-501a-2632-88871ed5c12c	8296	Krmelj
00050000-555c-501a-875e-77a2a45a051d	4245	Kropa
00050000-555c-501a-c5f4-3caaa65e6402	8262	Krška vas
00050000-555c-501a-c97a-5106dc77d173	8270	Krško
00050000-555c-501a-03a8-62d710a20c52	9263	Kuzma
00050000-555c-501a-12e7-0864915e1a69	2318	Laporje
00050000-555c-501a-23b8-3eb9bdd0117b	3270	Laško
00050000-555c-501a-a4e3-25b41d24afd5	1219	Laze v Tuhinju
00050000-555c-501a-9707-d3d52b5bccf5	2230	Lenart v Slovenskih goricah
00050000-555c-501a-8984-c2bc8b785eb1	9220	Lendava/Lendva
00050000-555c-501a-1c57-8ec8614a9304	4248	Lesce
00050000-555c-501a-e717-6fde476af7a8	3261	Lesično
00050000-555c-501a-a47d-07c6388c482a	8273	Leskovec pri Krškem
00050000-555c-501a-6a90-4d67b198e454	2372	Libeliče
00050000-555c-501a-c817-60432a2c3d6b	2341	Limbuš
00050000-555c-501a-a5d0-8790c7e5e1b1	1270	Litija
00050000-555c-501a-7aaf-c9b7d5c69235	3202	Ljubečna
00050000-555c-501a-91fb-d67ddc951903	1000	Ljubljana 
00050000-555c-501a-5484-541c626f87d4	1001	Ljubljana - poštni predali
00050000-555c-501a-740d-3c6de564e528	1231	Ljubljana - Črnuče
00050000-555c-501a-4fc2-bc655ef7683e	1261	Ljubljana - Dobrunje
00050000-555c-501a-62bc-fffedc4b187c	1260	Ljubljana - Polje
00050000-555c-501a-6e7d-395688377036	1210	Ljubljana - Šentvid
00050000-555c-501a-5587-69c424132f27	1211	Ljubljana - Šmartno
00050000-555c-501a-b90a-f43122e6d997	3333	Ljubno ob Savinji
00050000-555c-501a-f4ea-4bc74c61d49c	9240	Ljutomer
00050000-555c-501a-e023-43d48f175f41	3215	Loče
00050000-555c-501a-4c53-e41c7ecd6462	5231	Log pod Mangartom
00050000-555c-501a-4b34-b9d3d6c04be0	1358	Log pri Brezovici
00050000-555c-501a-a338-91515665ca87	1370	Logatec
00050000-555c-501a-da38-1da9c651b9bc	1371	Logatec
00050000-555c-501a-b4b3-e205505c66ef	1434	Loka pri Zidanem Mostu
00050000-555c-501a-a0c8-5d75abae9f0f	3223	Loka pri Žusmu
00050000-555c-501a-b32f-4ccb8b809196	6219	Lokev
00050000-555c-501a-0c79-6a3ee5e43579	1318	Loški Potok
00050000-555c-501a-f4d2-0930c1f173d8	2324	Lovrenc na Dravskem polju
00050000-555c-501a-199a-585169a3a7b1	2344	Lovrenc na Pohorju
00050000-555c-501a-f848-3223503cf2f1	3334	Luče
00050000-555c-501a-f4a2-b473f8897209	1225	Lukovica
00050000-555c-501a-6e23-cafb6309ac66	9202	Mačkovci
00050000-555c-501a-49c6-b2c29d51a1ce	2322	Majšperk
00050000-555c-501a-d839-60a6f3f7885f	2321	Makole
00050000-555c-501a-c754-d9654780426c	9243	Mala Nedelja
00050000-555c-501a-8cfb-6bc888456f1b	2229	Malečnik
00050000-555c-501a-6ef0-3918403c251d	6273	Marezige
00050000-555c-501a-98a0-1708ddc6dfc7	2000	Maribor 
00050000-555c-501a-2a86-4ad514125c97	2001	Maribor - poštni predali
00050000-555c-501a-3c26-7400d1aa0a9c	2206	Marjeta na Dravskem polju
00050000-555c-501a-538d-2a95114b1ac3	2281	Markovci
00050000-555c-501a-edac-a9310a61bb3c	9221	Martjanci
00050000-555c-501a-d2b3-fb6ccad629f5	6242	Materija
00050000-555c-501a-8eb6-fe49722d28d8	4211	Mavčiče
00050000-555c-501a-1079-b472895922d8	1215	Medvode
00050000-555c-501a-614a-14a5329c4aaf	1234	Mengeš
00050000-555c-501a-4eca-6df5ad918255	8330	Metlika
00050000-555c-501a-bff4-3cfcb6f3a716	2392	Mežica
00050000-555c-501a-fe0d-4175906459ae	2204	Miklavž na Dravskem polju
00050000-555c-501a-da0f-b02631455916	2275	Miklavž pri Ormožu
00050000-555c-501a-2b7e-473bddf0cd5d	5291	Miren
00050000-555c-501a-8f40-d8e89d69547d	8233	Mirna
00050000-555c-501a-1ed9-ae3d0f125caf	8216	Mirna Peč
00050000-555c-501a-46f9-1597bdfbf8f2	2382	Mislinja
00050000-555c-501a-f87d-93a3f8955c4f	4281	Mojstrana
00050000-555c-501a-63e8-42994933f61c	8230	Mokronog
00050000-555c-501a-1da6-28bd17190d5f	1251	Moravče
00050000-555c-501a-d071-841d680dc83a	9226	Moravske Toplice
00050000-555c-501a-e7f4-c83bbefea61e	5216	Most na Soči
00050000-555c-501a-2c11-c2427411d2a3	1221	Motnik
00050000-555c-501a-62b9-6c7bb5ad0b50	3330	Mozirje
00050000-555c-501a-2779-bdd4c263779f	9000	Murska Sobota 
00050000-555c-501a-b657-03c764532959	9001	Murska Sobota - poštni predali
00050000-555c-501a-47bb-2a40a6ef777e	2366	Muta
00050000-555c-501a-1d3f-11f5ab29a64c	4202	Naklo
00050000-555c-501a-544f-4e8ddb703aeb	3331	Nazarje
00050000-555c-501a-911b-246c520b2645	1357	Notranje Gorice
00050000-555c-501a-3771-db7481e3d03a	3203	Nova Cerkev
00050000-555c-501a-15ae-ddfbbe4255a1	5000	Nova Gorica 
00050000-555c-501a-651a-0fa8a7b4e4f7	5001	Nova Gorica - poštni predali
00050000-555c-501a-45bd-31b647427447	1385	Nova vas
00050000-555c-501a-6c34-527440dca42b	8000	Novo mesto
00050000-555c-501a-5095-9c35bd6a91cc	8001	Novo mesto - poštni predali
00050000-555c-501a-e029-d2d2bbb5ecdd	6243	Obrov
00050000-555c-501a-5dd5-6daa638a4b3b	9233	Odranci
00050000-555c-501a-6342-f6747e6bc858	2317	Oplotnica
00050000-555c-501a-d967-215e49bb90c3	2312	Orehova vas
00050000-555c-501a-3a21-9fa81e4b1cdf	2270	Ormož
00050000-555c-501a-705d-ac0e2923c51d	1316	Ortnek
00050000-555c-501a-19e9-1d1bfb249d62	1337	Osilnica
00050000-555c-501a-ef8d-ca594015ed89	8222	Otočec
00050000-555c-501a-5494-b067d897e090	2361	Ožbalt
00050000-555c-501a-e6a0-cdca31608c4f	2231	Pernica
00050000-555c-501a-00e4-31a1627897d9	2211	Pesnica pri Mariboru
00050000-555c-501a-e6a5-665423695b3d	9203	Petrovci
00050000-555c-501a-8f31-30d1c3b620fa	3301	Petrovče
00050000-555c-501a-3493-2ee3235a0755	6330	Piran/Pirano
00050000-555c-501a-6ebe-3dbe4bb18884	8255	Pišece
00050000-555c-501a-0e52-f2f82b33a91a	6257	Pivka
00050000-555c-501a-e89d-228e663c55ed	6232	Planina
00050000-555c-501a-7fcf-3c32c4f89798	3225	Planina pri Sevnici
00050000-555c-501a-d153-26749679146e	6276	Pobegi
00050000-555c-501a-164c-168e5c452d54	8312	Podbočje
00050000-555c-501a-db21-b49a940bf760	5243	Podbrdo
00050000-555c-501a-c64b-f0afda24bd0a	3254	Podčetrtek
00050000-555c-501a-94b5-3d62a271f708	2273	Podgorci
00050000-555c-501a-9508-f0a8a1da4e8a	6216	Podgorje
00050000-555c-501a-a1d1-f0cee38aa951	2381	Podgorje pri Slovenj Gradcu
00050000-555c-501a-e20e-a860def78821	6244	Podgrad
00050000-555c-501a-e395-87e9d8aa4793	1414	Podkum
00050000-555c-501a-8af8-132c6e0ac7f5	2286	Podlehnik
00050000-555c-501a-4d5b-61f7e55ecf2e	5272	Podnanos
00050000-555c-501a-6b3a-a29cbae798f6	4244	Podnart
00050000-555c-501a-e96a-347da4f26349	3241	Podplat
00050000-555c-501a-6a39-9361df8a1ac7	3257	Podsreda
00050000-555c-501a-88a5-a75b3c232378	2363	Podvelka
00050000-555c-501a-8d06-ad9baa124747	2208	Pohorje
00050000-555c-501a-f559-26d970f56164	2257	Polenšak
00050000-555c-501a-657c-958f93f81657	1355	Polhov Gradec
00050000-555c-501a-30df-9b6ee6e0a2bd	4223	Poljane nad Škofjo Loko
00050000-555c-501a-62f5-ac2803a9eee2	2319	Poljčane
00050000-555c-501a-ed17-20f042a52fcf	1272	Polšnik
00050000-555c-501a-e2c4-4907a03cdebc	3313	Polzela
00050000-555c-501a-b0a6-e8e21edf065f	3232	Ponikva
00050000-555c-501a-413d-cbd758287a94	6320	Portorož/Portorose
00050000-555c-501a-e193-0975b6441d5d	6230	Postojna
00050000-555c-501a-7365-a9bc59bb081b	2331	Pragersko
00050000-555c-501a-de52-446091e369ff	3312	Prebold
00050000-555c-501a-cccb-7bb3e8d575a8	4205	Preddvor
00050000-555c-501a-7626-d7d4bdb95c66	6255	Prem
00050000-555c-501a-bcf5-cbecf3d78fe1	1352	Preserje
00050000-555c-501a-d2c1-999087983cc7	6258	Prestranek
00050000-555c-501a-9fa3-52c8b1a251fc	2391	Prevalje
00050000-555c-501a-5a61-a1cbf5eab843	3262	Prevorje
00050000-555c-501a-f04b-aca9cb47ed50	1276	Primskovo 
00050000-555c-501a-c6e2-8a1703a440f4	3253	Pristava pri Mestinju
00050000-555c-501a-2513-271cd4889455	9207	Prosenjakovci/Partosfalva
00050000-555c-501a-3d68-b2d3cd13cf4a	5297	Prvačina
00050000-555c-501a-f919-2b58c971dc4d	2250	Ptuj
00050000-555c-501a-9ebf-1137927dcad8	2323	Ptujska Gora
00050000-555c-501a-caef-c56d83cd20dd	9201	Puconci
00050000-555c-501a-df69-0f627037068f	2327	Rače
00050000-555c-501a-65f5-9aca101cdb9b	1433	Radeče
00050000-555c-501a-0941-2e2f582f04aa	9252	Radenci
00050000-555c-501a-e5a4-f4939a927e0b	2360	Radlje ob Dravi
00050000-555c-501a-6f9c-f63b79b62fd0	1235	Radomlje
00050000-555c-501a-65a8-02135864b199	4240	Radovljica
00050000-555c-501a-b490-8d6834891282	8274	Raka
00050000-555c-501a-bca6-7955a70c6985	1381	Rakek
00050000-555c-501a-4cf1-7526177d3766	4283	Rateče - Planica
00050000-555c-501a-f959-fe08536b4751	2390	Ravne na Koroškem
00050000-555c-501a-edc2-33cf09bdfade	9246	Razkrižje
00050000-555c-501a-46c0-75d2941e4778	3332	Rečica ob Savinji
00050000-555c-501a-0a58-21bffc8520ad	5292	Renče
00050000-555c-501a-22f9-75f3d359f47e	1310	Ribnica
00050000-555c-501a-7bf4-23e40aee9f7f	2364	Ribnica na Pohorju
00050000-555c-501a-dd95-2bb4654fc02b	3272	Rimske Toplice
00050000-555c-501a-7048-f369d1d7d8a8	1314	Rob
00050000-555c-501a-5a58-6f7405221f87	5215	Ročinj
00050000-555c-501a-4503-3a90b27c543e	3250	Rogaška Slatina
00050000-555c-501a-fdf5-9a04e0d6c7bd	9262	Rogašovci
00050000-555c-501a-a9ac-3e8efa01f1ba	3252	Rogatec
00050000-555c-501a-34a7-cd9628bd7fcd	1373	Rovte
00050000-555c-501a-70f5-9492d3666a00	2342	Ruše
00050000-555c-501a-6206-79a1beef6918	1282	Sava
00050000-555c-501a-0923-31db441b8b48	6333	Sečovlje/Sicciole
00050000-555c-501a-0b3f-feb7b25929d0	4227	Selca
00050000-555c-501a-7cd4-ade6fca4d7df	2352	Selnica ob Dravi
00050000-555c-501a-dc78-e214ef1d11a9	8333	Semič
00050000-555c-501a-c51d-10dfee14537f	8281	Senovo
00050000-555c-501a-5db6-1d1f714f8edf	6224	Senožeče
00050000-555c-501a-bf96-30a1473182c6	8290	Sevnica
00050000-555c-501a-2e2b-b3a923bdd8ff	6210	Sežana
00050000-555c-501a-c915-cd5a59e06d66	2214	Sladki Vrh
00050000-555c-501a-ec1a-d779644dd8ae	5283	Slap ob Idrijci
00050000-555c-501a-e352-9b8b78f2c1b9	2380	Slovenj Gradec
00050000-555c-501a-2211-91f8f2347d8a	2310	Slovenska Bistrica
00050000-555c-501a-c8aa-fe1f945e8e0c	3210	Slovenske Konjice
00050000-555c-501a-5c24-928e0db2082b	1216	Smlednik
00050000-555c-501a-b771-a93c55ccb13f	5232	Soča
00050000-555c-501a-e38c-3c190cacfdd6	1317	Sodražica
00050000-555c-501a-3db7-24f194362c5b	3335	Solčava
00050000-555c-501a-d224-3fe4cf882d74	5250	Solkan
00050000-555c-501a-1bd4-03946a8ed3c8	4229	Sorica
00050000-555c-501a-a945-053aa53ee8b6	4225	Sovodenj
00050000-555c-501a-a78a-ffd06d68f28d	5281	Spodnja Idrija
00050000-555c-501a-081e-18f41da1be0a	2241	Spodnji Duplek
00050000-555c-501a-51da-143ad579b4ca	9245	Spodnji Ivanjci
00050000-555c-501a-b500-8d1d6a8ada4a	2277	Središče ob Dravi
00050000-555c-501a-aacc-34901bd5d0da	4267	Srednja vas v Bohinju
00050000-555c-501a-544d-b647addfa896	8256	Sromlje 
00050000-555c-501a-5697-12eded0ff546	5224	Srpenica
00050000-555c-501a-c9d8-d88e6e8e8a42	1242	Stahovica
00050000-555c-501a-ec3e-2994a39b89e8	1332	Stara Cerkev
00050000-555c-501a-f47e-aa976f6676c6	8342	Stari trg ob Kolpi
00050000-555c-501a-e8a0-888183b6475b	1386	Stari trg pri Ložu
00050000-555c-501a-c5f3-dfb967c5c658	2205	Starše
00050000-555c-501a-d807-8ad12a24eb9b	2289	Stoperce
00050000-555c-501a-6bf7-e275bc0f2036	8322	Stopiče
00050000-555c-501a-a60d-7452d9a5bca3	3206	Stranice
00050000-555c-501a-4f87-21a4b242b8f3	8351	Straža
00050000-555c-501a-c307-6871e838f9b9	1313	Struge
00050000-555c-501a-eb6f-5cfa77b17c61	8293	Studenec
00050000-555c-501a-9777-876b03b916ba	8331	Suhor
00050000-555c-501a-cd29-3295ee2fc496	2233	Sv. Ana v Slovenskih goricah
00050000-555c-501a-9f1e-77bbcfbb6d22	2235	Sv. Trojica v Slovenskih goricah
00050000-555c-501a-a644-bce600eaaa5a	2353	Sveti Duh na Ostrem Vrhu
00050000-555c-501a-98a2-cac41c889079	9244	Sveti Jurij ob Ščavnici
00050000-555c-501a-8a60-169411d7b558	3264	Sveti Štefan
00050000-555c-501a-13bd-e8532b2ab7af	2258	Sveti Tomaž
00050000-555c-501a-aeec-df0bf85d74f5	9204	Šalovci
00050000-555c-501a-6fc0-046aa9ce4c0d	5261	Šempas
00050000-555c-501a-7515-6841f50f7452	5290	Šempeter pri Gorici
00050000-555c-501a-dfc7-b345dcb631ca	3311	Šempeter v Savinjski dolini
00050000-555c-501a-c6b2-0eef3b83c702	4208	Šenčur
00050000-555c-501a-8798-b97a4108abcb	2212	Šentilj v Slovenskih goricah
00050000-555c-501a-20f3-00841461f6d0	8297	Šentjanž
00050000-555c-501a-4b94-dcf0e72917ed	2373	Šentjanž pri Dravogradu
00050000-555c-501a-21fb-30af4e71866a	8310	Šentjernej
00050000-555c-501a-e335-c30e72f4b047	3230	Šentjur
00050000-555c-501a-b5a7-e7dc4d7c6e5b	3271	Šentrupert
00050000-555c-501a-c400-e9f173b2e541	8232	Šentrupert
00050000-555c-501a-da0f-08dbbd331ea0	1296	Šentvid pri Stični
00050000-555c-501a-6d42-c93ed4bb49de	8275	Škocjan
00050000-555c-501a-914f-86e5f83d6dc2	6281	Škofije
00050000-555c-501a-7ab7-95aa24e728d6	4220	Škofja Loka
00050000-555c-501a-b161-05efd064b094	3211	Škofja vas
00050000-555c-501a-49d5-84ca20ce44f0	1291	Škofljica
00050000-555c-501a-89b9-eedcf5479ce8	6274	Šmarje
00050000-555c-501a-9d60-a0b23821d731	1293	Šmarje - Sap
00050000-555c-501a-719a-5af2060a2019	3240	Šmarje pri Jelšah
00050000-555c-501a-d59b-dbe2b7c32cbb	8220	Šmarješke Toplice
00050000-555c-501a-ff97-02c26847add0	2315	Šmartno na Pohorju
00050000-555c-501a-f09b-6f34890bd44a	3341	Šmartno ob Dreti
00050000-555c-501a-be6d-0ef3eaee3232	3327	Šmartno ob Paki
00050000-555c-501a-cc72-007ddd99fe8d	1275	Šmartno pri Litiji
00050000-555c-501a-f6ac-dcd922e08a65	2383	Šmartno pri Slovenj Gradcu
00050000-555c-501a-2cd2-2da819ab591e	3201	Šmartno v Rožni dolini
00050000-555c-501a-4bb9-ab6a10df058f	3325	Šoštanj
00050000-555c-501a-6eb1-528a57cf9bc5	6222	Štanjel
00050000-555c-501a-d0ab-b285d8e9852d	3220	Štore
00050000-555c-501a-8bac-ee70d224a24f	3304	Tabor
00050000-555c-501a-f62f-394545070365	3221	Teharje
00050000-555c-501a-9b22-0848505587aa	9251	Tišina
00050000-555c-501a-c587-209152c75cc3	5220	Tolmin
00050000-555c-501a-c432-4e3448aaaa56	3326	Topolšica
00050000-555c-501a-9adb-f5dee337b2e8	2371	Trbonje
00050000-555c-501a-faec-e54a1474686b	1420	Trbovlje
00050000-555c-501a-6b49-60ca22087895	8231	Trebelno 
00050000-555c-501a-1a96-efaa2422e354	8210	Trebnje
00050000-555c-501a-0073-9154794f59e7	5252	Trnovo pri Gorici
00050000-555c-501a-5ece-8db6105d72b6	2254	Trnovska vas
00050000-555c-501a-3346-01aec9924849	1222	Trojane
00050000-555c-501a-5303-ca2821f43de5	1236	Trzin
00050000-555c-501a-45a8-c9aa430eac9e	4290	Tržič
00050000-555c-501a-f93a-4bfbd5ff12e9	8295	Tržišče
00050000-555c-501a-f066-1fd5ec7a1c3f	1311	Turjak
00050000-555c-501a-1fa4-90c40a08d59f	9224	Turnišče
00050000-555c-501a-1871-68cfb02ca839	8323	Uršna sela
00050000-555c-501a-c582-8e4e6a812244	1252	Vače
00050000-555c-501a-4b24-b440c1b7f77c	3320	Velenje 
00050000-555c-501a-8b8d-0643a122ebbe	3322	Velenje - poštni predali
00050000-555c-501a-868b-7ccca8713ab6	8212	Velika Loka
00050000-555c-501a-e209-2883082c314b	2274	Velika Nedelja
00050000-555c-501a-c273-c7b35c087e2a	9225	Velika Polana
00050000-555c-501a-2a06-e6ecde81aa5f	1315	Velike Lašče
00050000-555c-501a-24d2-9d4ddee16371	8213	Veliki Gaber
00050000-555c-501a-d6d5-352c68584c11	9241	Veržej
00050000-555c-501a-61b8-7ade5bff1584	1312	Videm - Dobrepolje
00050000-555c-501a-2658-2319817c346a	2284	Videm pri Ptuju
00050000-555c-501a-ea98-260b3b00ed77	8344	Vinica
00050000-555c-501a-7cee-644a0fa03c22	5271	Vipava
00050000-555c-501a-247c-fefdd0f83ddc	4212	Visoko
00050000-555c-501a-e399-b22813c4de92	1294	Višnja Gora
00050000-555c-501a-ce15-cb1243932574	3205	Vitanje
00050000-555c-501a-89a3-8be99c56ca06	2255	Vitomarci
00050000-555c-501a-22c0-b5362ef7fbed	1217	Vodice
00050000-555c-501a-f759-98e9b8bcde0a	3212	Vojnik\t
00050000-555c-501a-7892-a36446373484	5293	Volčja Draga
00050000-555c-501a-514f-b8791259e4ec	2232	Voličina
00050000-555c-501a-6f35-2120ffe7b973	3305	Vransko
00050000-555c-501a-a08a-3aa1bf05380d	6217	Vremski Britof
00050000-555c-501a-edac-04be53d9b7f8	1360	Vrhnika
00050000-555c-501a-faa3-93607c7e65a0	2365	Vuhred
00050000-555c-501a-a36b-775352466b98	2367	Vuzenica
00050000-555c-501a-d37c-06a7298de806	8292	Zabukovje 
00050000-555c-501a-1e09-e0e6d8babfbf	1410	Zagorje ob Savi
00050000-555c-501a-7e5b-63ac7845e528	1303	Zagradec
00050000-555c-501a-8454-47f5bdfe7e9c	2283	Zavrč
00050000-555c-501a-b38b-198e121879d6	8272	Zdole 
00050000-555c-501a-5964-2f7972726fa7	4201	Zgornja Besnica
00050000-555c-501a-74d3-45d89f5c0a85	2242	Zgornja Korena
00050000-555c-501a-fc0f-df21d3e6a2cb	2201	Zgornja Kungota
00050000-555c-501a-c319-3bcf4fdfecfd	2316	Zgornja Ložnica
00050000-555c-501a-7c6d-96191bc8758b	2314	Zgornja Polskava
00050000-555c-501a-7420-ce2d53b60877	2213	Zgornja Velka
00050000-555c-501a-d63e-33309f6fc896	4247	Zgornje Gorje
00050000-555c-501a-e695-bf772b241e06	4206	Zgornje Jezersko
00050000-555c-501a-acef-c4ba122282e5	2285	Zgornji Leskovec
00050000-555c-501a-127f-a8ad95724687	1432	Zidani Most
00050000-555c-501a-33d6-2d4a7e5e2b8b	3214	Zreče
00050000-555c-501a-f47a-0d783e20a06e	4209	Žabnica
00050000-555c-501a-7632-e7833eb30d07	3310	Žalec
00050000-555c-501a-9674-44879a931929	4228	Železniki
00050000-555c-501a-2f90-c7cc3136d3d8	2287	Žetale
00050000-555c-501a-8e50-1293052c80db	4226	Žiri
00050000-555c-501a-e3e6-8b885c757b76	4274	Žirovnica
00050000-555c-501a-a62e-b8c5a9c31565	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 4045329)
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
-- TOC entry 2642 (class 0 OID 4045156)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4045222)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4045341)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4045446)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4045493)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 4045370)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4045314)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4045304)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 4045483)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4045436)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4045023)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555c-501b-8330-2408ce702943	00010000-555c-501b-6f21-248e9eac4ecb	2015-05-20 11:12:59	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROzOLFSbN9WLavgWLz9Ic6.4tDMnABmqq";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 4045379)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 4045061)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555c-501b-51af-f0c8a808c636	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555c-501b-8d95-f7e78237870f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555c-501b-4d7e-d13e3d08a5ab	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555c-501b-fe3a-a448c9e9f255	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555c-501b-d7d1-74bd2c6e5069	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555c-501b-3024-f0665ecb72db	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 4045045)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555c-501b-8330-2408ce702943	00020000-555c-501b-fe3a-a448c9e9f255
00010000-555c-501b-6f21-248e9eac4ecb	00020000-555c-501b-fe3a-a448c9e9f255
\.


--
-- TOC entry 2668 (class 0 OID 4045393)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4045335)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 4045285)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4045121)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 4045291)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4045471)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4045191)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 4045032)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555c-501b-6f21-248e9eac4ecb	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROwpGivl5EKVgQf9ZiIwJL./hbGvWwEam	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555c-501b-8330-2408ce702943	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 4045525)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4045237)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 4045362)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4045428)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4045269)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 4045515)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4045418)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 4045086)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 4045565)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4045558)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4045470)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 4045259)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 4045284)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 4045217)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 4045414)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4045235)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 4045278)
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
-- TOC entry 2364 (class 2606 OID 4045327)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 4045354)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 4045189)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 4045095)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 4045153)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 4045119)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 4045075)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 4045060)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 4045360)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 4045392)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 4045510)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 4045146)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 4045177)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 4045333)
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
-- TOC entry 2298 (class 2606 OID 4045167)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 4045226)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 4045345)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4045452)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 4045498)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4045377)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 4045318)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 4045309)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 4045492)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4045443)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 4045031)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4045383)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 4045049)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 4045069)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 4045401)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4045340)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 4045290)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 4045126)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 4045300)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4045482)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 4045202)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4045044)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 4045540)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 4045244)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 4045368)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4045434)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 4045273)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 4045524)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 4045427)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 4045266)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 4045148)
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
-- TOC entry 2377 (class 1259 OID 4045361)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 4045347)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 4045346)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 4045245)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 4045417)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 4045415)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 4045416)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 4045512)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 4045513)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 4045514)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 4045543)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 4045542)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 4045541)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 4045204)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 4045203)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 4045155)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4045154)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 4045384)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 4045279)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 4045076)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 4045077)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 4045404)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 4045403)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 4045402)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 4045227)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 4045229)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 4045228)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 4045313)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 4045311)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 4045310)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 4045312)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 4045050)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 4045051)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 4045369)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 4045334)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 4045444)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 4045445)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 4045169)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 4045168)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 4045170)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 4045453)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 4045454)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 4045568)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 4045567)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 4045570)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 4045566)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 4045569)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 4045435)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 4045322)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 4045321)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 4045319)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 4045320)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 4045560)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 4045559)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 4045236)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 4045097)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 4045096)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 4045127)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 4045128)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 4045303)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 4045302)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 4045301)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 4045268)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 4045264)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 4045261)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 4045262)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 4045260)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 4045265)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 4045263)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 4045147)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 4045218)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 4045220)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 4045219)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 4045221)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 4045328)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 4045511)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 4045120)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 4045190)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 4045378)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 4045178)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 4045499)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 4045070)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 4045267)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 4045701)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 4045686)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 4045691)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 4045711)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 4045681)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 4045706)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 4045696)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 4045616)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 4045796)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 4045791)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 4045786)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 4045676)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 4045836)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 4045826)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 4045831)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 4045776)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 4045871)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 4045876)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 4045881)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 4045896)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 4045891)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 4045886)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 4045651)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 4045646)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 4045626)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 4045621)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4045601)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 4045806)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 4045716)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 4045581)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 4045586)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 4045821)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 4045816)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 4045811)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 4045656)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 4045666)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 4045661)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 4045751)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 4045741)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 4045736)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 4045746)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 4045571)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 4045576)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 4045801)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 4045781)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 4045846)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 4045851)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4045636)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 4045631)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 4045641)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 4045856)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 4045861)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 4045921)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 4045916)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 4045931)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 4045911)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 4045926)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 4045841)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 4045771)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 4045766)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 4045756)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 4045761)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 4045906)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 4045901)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 4045671)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 4045866)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 4045596)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 4045591)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 4045606)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4045611)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 4045731)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 4045726)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 4045721)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-20 11:13:00 CEST

--
-- PostgreSQL database dump complete
--

