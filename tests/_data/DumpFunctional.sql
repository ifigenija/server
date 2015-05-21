--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-21 08:35:19 CEST

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
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 4224892)
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
-- TOC entry 225 (class 1259 OID 4225373)
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
-- TOC entry 224 (class 1259 OID 4225356)
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
-- TOC entry 217 (class 1259 OID 4225269)
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
-- TOC entry 193 (class 1259 OID 4225060)
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
-- TOC entry 196 (class 1259 OID 4225094)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4225019)
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
-- TOC entry 212 (class 1259 OID 4225219)
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
-- TOC entry 191 (class 1259 OID 4225044)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4225088)
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
-- TOC entry 201 (class 1259 OID 4225137)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4225162)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4224993)
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
-- TOC entry 180 (class 1259 OID 4224901)
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
-- TOC entry 181 (class 1259 OID 4224912)
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
-- TOC entry 184 (class 1259 OID 4224963)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4224866)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4224885)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4225169)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4225199)
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
-- TOC entry 221 (class 1259 OID 4225312)
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
-- TOC entry 183 (class 1259 OID 4224943)
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
-- TOC entry 186 (class 1259 OID 4224985)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4225143)
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
-- TOC entry 185 (class 1259 OID 4224970)
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
    jeeu boolean NOT NULL,
    privzeti boolean
);


--
-- TOC entry 190 (class 1259 OID 4225036)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4225155)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4225260)
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
-- TOC entry 220 (class 1259 OID 4225305)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4225184)
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
-- TOC entry 200 (class 1259 OID 4225128)
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
-- TOC entry 199 (class 1259 OID 4225118)
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
-- TOC entry 219 (class 1259 OID 4225295)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4225250)
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
-- TOC entry 173 (class 1259 OID 4224837)
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
-- TOC entry 172 (class 1259 OID 4224835)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2688 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 4225193)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4224875)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4224859)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4225207)
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
-- TOC entry 203 (class 1259 OID 4225149)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4225099)
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
-- TOC entry 182 (class 1259 OID 4224935)
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
-- TOC entry 198 (class 1259 OID 4225105)
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
-- TOC entry 218 (class 1259 OID 4225283)
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
-- TOC entry 188 (class 1259 OID 4225005)
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
-- TOC entry 174 (class 1259 OID 4224846)
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
-- TOC entry 223 (class 1259 OID 4225337)
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
-- TOC entry 192 (class 1259 OID 4225051)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4225176)
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
-- TOC entry 214 (class 1259 OID 4225242)
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
-- TOC entry 194 (class 1259 OID 4225083)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4225327)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4225232)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4224840)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2634 (class 0 OID 4224892)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 4225373)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 4225356)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4225269)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4225060)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4225094)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4225019)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555d-7ca6-de34-59b0c59c9157	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555d-7ca6-17e1-0ff6ef72940e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555d-7ca6-a051-8339881ad72a	AL	ALB	008	Albania 	Albanija	\N
00040000-555d-7ca6-e6af-00c11cb8b6d4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555d-7ca6-4ce7-1854161ac0ef	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555d-7ca6-4b38-0ad1e27ded3c	AD	AND	020	Andorra 	Andora	\N
00040000-555d-7ca6-22d4-6700b7abd356	AO	AGO	024	Angola 	Angola	\N
00040000-555d-7ca6-003c-5e6700ab6db5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555d-7ca6-112f-f9825cc5fe35	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555d-7ca6-8273-4c0a4fc0600c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-7ca6-68b6-5f01a6e0527e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555d-7ca6-dca0-286ce8ff02f5	AM	ARM	051	Armenia 	Armenija	\N
00040000-555d-7ca6-94b4-0c1cf9d94dfa	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555d-7ca6-7cf3-799b3093955c	AU	AUS	036	Australia 	Avstralija	\N
00040000-555d-7ca6-1d05-3c71709fc41d	AT	AUT	040	Austria 	Avstrija	\N
00040000-555d-7ca6-888f-65c113b05869	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555d-7ca6-f992-155016d90505	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555d-7ca6-ecfc-76f1441c18a0	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555d-7ca6-7834-6c8e48e9b9ff	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555d-7ca6-9962-ff9b2d24f6ad	BB	BRB	052	Barbados 	Barbados	\N
00040000-555d-7ca6-bdbb-5ec5b90774b9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555d-7ca6-dd3c-bfa16e1518cf	BE	BEL	056	Belgium 	Belgija	\N
00040000-555d-7ca6-3d0c-bed8c290d398	BZ	BLZ	084	Belize 	Belize	\N
00040000-555d-7ca6-f8eb-d7496627dfef	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555d-7ca6-858f-4dd726b0a005	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555d-7ca6-596e-0dd6fc802ec6	BT	BTN	064	Bhutan 	Butan	\N
00040000-555d-7ca6-73dc-5f05d2154acb	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555d-7ca6-42fc-05c657cc07bb	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555d-7ca6-627e-e54167dd696a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555d-7ca6-536a-5ce79cc13c53	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555d-7ca6-55d4-81261abd875e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555d-7ca6-810c-53be1ecf89bd	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555d-7ca6-074d-787f2599313a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555d-7ca6-5137-bea4ad89c17d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555d-7ca6-a328-f79923d04f03	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555d-7ca6-5e0d-2256b924cb9f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555d-7ca6-7a1a-e4a59339bf9e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555d-7ca6-ee67-d60d48c7ddc3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555d-7ca6-3ca0-aeb933b4efcb	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555d-7ca6-dca2-b95da7c61a15	CA	CAN	124	Canada 	Kanada	\N
00040000-555d-7ca6-5a60-93475e0be9cc	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555d-7ca6-8ffd-cb01408d64f1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555d-7ca6-ddda-7aba1d184e5e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555d-7ca6-c4b1-86039ce63ce1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555d-7ca6-9366-8024f7d6ea6e	CL	CHL	152	Chile 	Čile	\N
00040000-555d-7ca6-5095-551f3d31c403	CN	CHN	156	China 	Kitajska	\N
00040000-555d-7ca6-5294-e7b9827e93a8	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555d-7ca6-18fd-609ed37d2297	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555d-7ca6-7fa8-b6e2e0f21943	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555d-7ca6-a2e8-08ff4a49a5bc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555d-7ca6-168a-d45cf4b331ad	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555d-7ca6-91c8-30e1b33237cc	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555d-7ca6-e490-ca93e04d647b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555d-7ca6-d462-35f1a6d60310	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555d-7ca6-b9fc-b08e5fa705ac	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555d-7ca6-0fec-72b108ecb74e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555d-7ca6-52ba-9f63fb1d3f65	CU	CUB	192	Cuba 	Kuba	\N
00040000-555d-7ca6-cfa0-26e036c81277	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555d-7ca6-6296-c146473a3aef	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555d-7ca6-ec06-fa2ed31d83f4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555d-7ca6-bd48-262a9f27ee9d	DK	DNK	208	Denmark 	Danska	\N
00040000-555d-7ca6-0a0e-eb6a9f819e4d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555d-7ca6-db4f-49f13c8559a7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-7ca6-3583-65839d5f7cf2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555d-7ca6-028e-f3d2e7b27673	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555d-7ca6-6898-3403037d58ec	EG	EGY	818	Egypt 	Egipt	\N
00040000-555d-7ca6-e1bd-e4d108d59733	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555d-7ca6-319c-484efa1e661c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555d-7ca6-c84c-6c0655c66e5c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555d-7ca6-5967-491b9fec4a1f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555d-7ca6-4fd2-994fcac4592e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555d-7ca6-bc35-d11e2a707f29	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555d-7ca6-b2f1-f9ae554c3473	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555d-7ca6-d922-58c65898b65c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555d-7ca6-9a51-fb3f5e320271	FI	FIN	246	Finland 	Finska	\N
00040000-555d-7ca6-0d25-fd78908cf56c	FR	FRA	250	France 	Francija	\N
00040000-555d-7ca6-084b-bb6c94bb3e22	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555d-7ca6-d3e7-c789c1dcc56f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555d-7ca6-4f38-e2e7b37451e9	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555d-7ca6-cfce-dd39f0b6cd96	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555d-7ca6-7b0b-4203e68fdfb8	GA	GAB	266	Gabon 	Gabon	\N
00040000-555d-7ca6-6b2d-cc59af503fd2	GM	GMB	270	Gambia 	Gambija	\N
00040000-555d-7ca6-ec6b-314bb2e32e6d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555d-7ca6-4696-00c1a243c09b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555d-7ca6-5426-60a67179f94e	GH	GHA	288	Ghana 	Gana	\N
00040000-555d-7ca6-a865-e3d9ca7f9747	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555d-7ca6-cf92-678fc9939b92	GR	GRC	300	Greece 	Grčija	\N
00040000-555d-7ca6-2870-e3a4531e5765	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555d-7ca6-289e-8e5ecea2346b	GD	GRD	308	Grenada 	Grenada	\N
00040000-555d-7ca6-6447-82a89437e468	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555d-7ca6-d637-08671110bc07	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555d-7ca6-5ac2-f2243cc02847	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555d-7ca6-7646-a9727a93511b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555d-7ca6-8616-0b0020749274	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555d-7ca6-eb60-cb475397bac6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555d-7ca6-4ed9-a6b4f0917424	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555d-7ca6-7c94-5f77af7db05e	HT	HTI	332	Haiti 	Haiti	\N
00040000-555d-7ca6-b448-9d3995f4eb59	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555d-7ca6-f334-3aaee6de11f3	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555d-7ca6-739d-8a833792cfdf	HN	HND	340	Honduras 	Honduras	\N
00040000-555d-7ca6-de24-2f4e58142a49	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555d-7ca6-07c3-ede91fae49b9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555d-7ca6-7167-dcfa9747cb8d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555d-7ca6-f577-fbc9ca4a46fe	IN	IND	356	India 	Indija	\N
00040000-555d-7ca6-10d5-83f9de06bb29	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555d-7ca6-c05e-e32e3f4fa559	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555d-7ca6-31aa-97c7c1d835fa	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555d-7ca6-e471-3d88dbaa665f	IE	IRL	372	Ireland 	Irska	\N
00040000-555d-7ca6-cced-adc7297af89f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555d-7ca6-93e5-ca2cb33a1d64	IL	ISR	376	Israel 	Izrael	\N
00040000-555d-7ca6-e923-06bd9ca5e38c	IT	ITA	380	Italy 	Italija	\N
00040000-555d-7ca6-218b-037956a8e651	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555d-7ca6-8cc8-1b5262765d48	JP	JPN	392	Japan 	Japonska	\N
00040000-555d-7ca6-e97f-bf5c68550707	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555d-7ca6-c2f0-ba864afe6ebd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555d-7ca6-5793-a8ee27c824b2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555d-7ca6-bbea-8816366d6c1f	KE	KEN	404	Kenya 	Kenija	\N
00040000-555d-7ca6-eaf5-e59469881ec6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555d-7ca6-f810-c21377b71c38	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555d-7ca6-be97-1e1ea2880ba8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555d-7ca6-22ff-88a884223873	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555d-7ca6-0b82-012f852f47eb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555d-7ca6-e113-ddddde5427a1	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555d-7ca6-c3d6-e85192948a69	LV	LVA	428	Latvia 	Latvija	\N
00040000-555d-7ca6-4fcd-ba3bdb094bb7	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555d-7ca6-d67c-4ae452b30709	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555d-7ca6-5952-fd846d27d9ea	LR	LBR	430	Liberia 	Liberija	\N
00040000-555d-7ca6-aa7b-e7890c78dfa3	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555d-7ca6-43f7-21e2c152f04d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555d-7ca6-c697-81d656272eeb	LT	LTU	440	Lithuania 	Litva	\N
00040000-555d-7ca6-be00-170eaa4f7219	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555d-7ca6-4ea3-61220212cd70	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555d-7ca6-ffbc-7e1950136704	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555d-7ca6-48f1-5b8cdb577735	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555d-7ca6-d6bc-154935743b7d	MW	MWI	454	Malawi 	Malavi	\N
00040000-555d-7ca6-7f52-6e0366097cfd	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555d-7ca6-0b57-33f62174a77d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555d-7ca6-71c3-0454a22679c7	ML	MLI	466	Mali 	Mali	\N
00040000-555d-7ca6-d14c-fa16fe8568a6	MT	MLT	470	Malta 	Malta	\N
00040000-555d-7ca6-81a7-55bf6f56e07b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555d-7ca6-5b49-e1a8e643bf32	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555d-7ca6-cd1e-1c34d0cc6077	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555d-7ca6-6156-294e46562e02	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555d-7ca6-bc56-64f3be964b6d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555d-7ca6-33d9-64f980325a36	MX	MEX	484	Mexico 	Mehika	\N
00040000-555d-7ca6-a15d-6ac4fb5ad263	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555d-7ca6-c5f5-8d904c29d140	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555d-7ca6-a3e5-1de4d9a99af4	MC	MCO	492	Monaco 	Monako	\N
00040000-555d-7ca6-c62c-af082646c8a8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555d-7ca6-372a-f61040fce36c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555d-7ca6-2419-7cd8c5f37c51	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555d-7ca6-ff1b-abfeded6e155	MA	MAR	504	Morocco 	Maroko	\N
00040000-555d-7ca6-cb52-2148850610e5	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555d-7ca6-52ea-31ed6a8741bf	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555d-7ca6-5399-add1b86e99af	NA	NAM	516	Namibia 	Namibija	\N
00040000-555d-7ca6-5195-cc2a55a07a90	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555d-7ca6-c13c-bdc8bd9ec04e	NP	NPL	524	Nepal 	Nepal	\N
00040000-555d-7ca6-fc98-9f51bf3fafee	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555d-7ca6-639b-1a3763789585	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555d-7ca6-742b-efc51109ce1c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555d-7ca6-a1b9-0b6042d908cf	NE	NER	562	Niger 	Niger 	\N
00040000-555d-7ca6-251d-dfd0abfc3716	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555d-7ca6-974a-9d2f291c0701	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555d-7ca6-27aa-af08510c2a5c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555d-7ca6-4e5c-9ec20f849bc3	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555d-7ca6-433e-d3a1d6ef2d1c	NO	NOR	578	Norway 	Norveška	\N
00040000-555d-7ca6-60cc-244d0c3d4f9c	OM	OMN	512	Oman 	Oman	\N
00040000-555d-7ca6-4650-8ae13c202d22	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555d-7ca6-5923-8433d7daf485	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555d-7ca6-367a-92e47d5d23f3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555d-7ca6-c401-12ab0390ecc4	PA	PAN	591	Panama 	Panama	\N
00040000-555d-7ca6-b5c6-b194b08026ad	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555d-7ca6-0807-41d7f0533c5f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555d-7ca6-a3a0-85d632c62fd8	PE	PER	604	Peru 	Peru	\N
00040000-555d-7ca6-858d-3ec455e18881	PH	PHL	608	Philippines 	Filipini	\N
00040000-555d-7ca6-0cd5-87db1d39f94e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555d-7ca6-e2b0-6a3918d88275	PL	POL	616	Poland 	Poljska	\N
00040000-555d-7ca6-a2b4-33560a4edc83	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555d-7ca6-0e2e-e7c680ee30e5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555d-7ca6-866b-b3f3d49bab78	QA	QAT	634	Qatar 	Katar	\N
00040000-555d-7ca6-9e05-d0b7104658e3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555d-7ca6-8ea5-b20de053767e	RO	ROU	642	Romania 	Romunija	\N
00040000-555d-7ca6-0620-48a6738ea618	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555d-7ca6-4846-85ac12c28c9a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555d-7ca6-aa2b-091c7675f503	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555d-7ca6-b78a-8ad03d56db04	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555d-7ca6-4a87-c0e870e617d6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555d-7ca6-555e-a6ff95645824	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555d-7ca6-01a8-8a89633b4c93	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555d-7ca6-d10e-6cbda68980be	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555d-7ca6-1f11-c81570391fbb	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555d-7ca6-669a-93426db1c5b6	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555d-7ca6-22e6-81ed94b58ba6	SM	SMR	674	San Marino 	San Marino	\N
00040000-555d-7ca6-9ef9-9dba2eecc98a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555d-7ca6-7a84-9408bf71bbeb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555d-7ca6-ebbd-073e060a3a7b	SN	SEN	686	Senegal 	Senegal	\N
00040000-555d-7ca6-b4b5-3b797cae3220	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555d-7ca6-57a3-07bbb00ddcb4	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555d-7ca6-8faa-a1414f614a7a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555d-7ca6-8ace-d7d4b4a790ee	SG	SGP	702	Singapore 	Singapur	\N
00040000-555d-7ca6-cc3b-9e0520c8b397	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555d-7ca6-2afd-2b53a2de2152	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555d-7ca6-3a63-e6f790a83b52	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555d-7ca6-8000-c1c7677c7ec6	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555d-7ca6-0fef-d6409510ba3a	SO	SOM	706	Somalia 	Somalija	\N
00040000-555d-7ca6-9129-81fef12d06ca	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555d-7ca6-6f8b-b33be026a5cb	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555d-7ca6-d177-49c2c85379a4	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555d-7ca6-d35d-7b0f72edb183	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555d-7ca6-7498-6d85e1d134d3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555d-7ca6-dbec-eae07a3ec802	SD	SDN	729	Sudan 	Sudan	\N
00040000-555d-7ca6-57dd-1a1247c63f50	SR	SUR	740	Suriname 	Surinam	\N
00040000-555d-7ca6-955b-bbdeab699904	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555d-7ca6-bd24-8f48f8b7c452	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555d-7ca6-7da9-6b1584ded851	SE	SWE	752	Sweden 	Švedska	\N
00040000-555d-7ca6-cb05-3402bb44c6df	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555d-7ca6-8fd4-efb94e607965	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555d-7ca6-b729-78ad227239e9	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555d-7ca6-293f-7291db5a0405	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555d-7ca6-ae9f-cf2e30c5bf0d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555d-7ca6-bbb4-8eb8da7c397c	TH	THA	764	Thailand 	Tajska	\N
00040000-555d-7ca6-e891-1069ad2c1c90	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555d-7ca6-5a75-9c35429ca2b2	TG	TGO	768	Togo 	Togo	\N
00040000-555d-7ca6-b7d8-e1b50a4ac51a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555d-7ca6-3c75-913e139202b2	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555d-7ca6-cb69-d3af67397ea6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555d-7ca6-4114-b6926ddb45fc	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555d-7ca6-b592-001955dd2fcf	TR	TUR	792	Turkey 	Turčija	\N
00040000-555d-7ca6-4402-7be4e4184c5e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555d-7ca6-be0f-5fd5bde08222	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-7ca6-9a56-20c79bd29893	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555d-7ca6-133c-49a91ba85c13	UG	UGA	800	Uganda 	Uganda	\N
00040000-555d-7ca6-bf41-aa82cbce47dd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555d-7ca6-5855-815225c59f83	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555d-7ca6-f60c-b9ebdd897084	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555d-7ca6-f192-44051d7762b6	US	USA	840	United States 	Združene države Amerike	\N
00040000-555d-7ca6-e465-c23f5dbbaabc	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555d-7ca6-3c5d-b11d71eb156a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555d-7ca6-92af-eb738b6ce071	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555d-7ca6-e127-cd7aa278e7ef	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555d-7ca6-506c-7b954ab50b0e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555d-7ca6-d701-cc3eba51be23	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555d-7ca6-755f-e6700fc1d328	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-7ca6-8f3e-dc289e0b8de2	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555d-7ca6-d6c1-d83b34c292da	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555d-7ca6-a8bf-2fed32abf03d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555d-7ca6-4b62-255b6b80c1a2	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555d-7ca6-1156-e9fb451b507b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555d-7ca6-a87f-4a83843a1cb5	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2667 (class 0 OID 4225219)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4225044)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4225088)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2625 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4225137)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4225162)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4224993)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555d-7ca6-57f8-22aaa2cd4a74	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555d-7ca6-1c88-50552a991fa6	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555d-7ca6-5506-bb459d15daf9	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555d-7ca6-4d57-bb9070791c4e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555d-7ca6-8548-f9a7f70a0ca5	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555d-7ca6-4af4-f8120f1ee180	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555d-7ca6-3e03-5cd57621b0f2	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555d-7ca6-0b32-a2bf045d87d7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555d-7ca6-a029-d46ea7a19e07	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555d-7ca6-1c5b-6f7195cb05ee	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555d-7ca6-6c37-7e84aee59b6a	uprizoritev.faza	array	a:5:{s:7:"osnutek";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:4:"plan";a:1:{s:5:"label";s:14:"Predprodukcija";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
\.


--
-- TOC entry 2635 (class 0 OID 4224901)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555d-7ca6-c720-eb0ba93580bc	00000000-555d-7ca6-8548-f9a7f70a0ca5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555d-7ca6-e4ee-37321ef1bbf7	00000000-555d-7ca6-8548-f9a7f70a0ca5	00010000-555d-7ca6-882b-271eb0ebd8d6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555d-7ca6-4839-ddd9d0e6b405	00000000-555d-7ca6-4af4-f8120f1ee180	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2636 (class 0 OID 4224912)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4224963)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 4224866)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555d-7ca6-5537-63a8f3fbe929	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555d-7ca6-b39b-3359992587db	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555d-7ca6-a40f-c5fb5989b578	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555d-7ca6-9120-4db65e1b7d40	Abonma-read	Abonma - branje	f
00030000-555d-7ca6-a5e6-a6f20aaa628d	Abonma-write	Abonma - spreminjanje	f
00030000-555d-7ca6-6350-4b83044c630b	Alternacija-read	Alternacija - branje	f
00030000-555d-7ca6-0d15-1ea6c909e393	Alternacija-write	Alternacija - spreminjanje	f
00030000-555d-7ca6-cfc1-8e8bbbdec91a	Arhivalija-read	Arhivalija - branje	f
00030000-555d-7ca6-5c26-900ec1222c21	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555d-7ca6-250c-5ee3bffcd784	Besedilo-read	Besedilo - branje	f
00030000-555d-7ca6-a9de-eda90e392f8c	Besedilo-write	Besedilo - spreminjanje	f
00030000-555d-7ca6-e5fa-8268bba4c63a	DogodekIzven-read	DogodekIzven - branje	f
00030000-555d-7ca6-3462-eaa9356bf80a	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555d-7ca6-4ebe-733febb08eb5	Dogodek-read	Dogodek - branje	f
00030000-555d-7ca6-78f0-7f06d172e1b7	Dogodek-write	Dogodek - spreminjanje	f
00030000-555d-7ca6-f455-f94b70747d32	Drzava-read	Drzava - branje	f
00030000-555d-7ca6-85f0-2b25a4376701	Drzava-write	Drzava - spreminjanje	f
00030000-555d-7ca6-b34d-af3fa7424d1c	Funkcija-read	Funkcija - branje	f
00030000-555d-7ca6-c877-a52bb3e3522b	Funkcija-write	Funkcija - spreminjanje	f
00030000-555d-7ca6-1f0d-42dcd30c8a58	Gostovanje-read	Gostovanje - branje	f
00030000-555d-7ca6-2c26-d59dd6669f0d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555d-7ca6-92dd-bc3e0af834d9	Gostujoca-read	Gostujoca - branje	f
00030000-555d-7ca6-949a-764d2dfb43a1	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555d-7ca6-50b9-afffb20da1a5	Kupec-read	Kupec - branje	f
00030000-555d-7ca6-3a9a-24c5a4503203	Kupec-write	Kupec - spreminjanje	f
00030000-555d-7ca6-2400-fe5134255a1d	NacinPlacina-read	NacinPlacina - branje	f
00030000-555d-7ca6-3d62-90511c46d20a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555d-7ca6-c5f0-f1c9b9c2ec0b	Option-read	Option - branje	f
00030000-555d-7ca6-0b07-3cef02aee946	Option-write	Option - spreminjanje	f
00030000-555d-7ca6-c7ed-59f6ca74c543	OptionValue-read	OptionValue - branje	f
00030000-555d-7ca6-6683-5f76048f7cbb	OptionValue-write	OptionValue - spreminjanje	f
00030000-555d-7ca6-b46a-dd9d12f67a50	Oseba-read	Oseba - branje	f
00030000-555d-7ca6-fadd-d1c55390c5df	Oseba-write	Oseba - spreminjanje	f
00030000-555d-7ca6-ea40-37e583d73355	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555d-7ca6-11ec-343ce87ab450	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555d-7ca6-ab36-ddae782f4d6c	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555d-7ca6-3428-0810134b6231	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555d-7ca6-a292-376b9d8b5ddf	Pogodba-read	Pogodba - branje	f
00030000-555d-7ca6-07c8-0cadf743b40a	Pogodba-write	Pogodba - spreminjanje	f
00030000-555d-7ca6-b047-4153de807090	Popa-read	Popa - branje	f
00030000-555d-7ca6-1be9-dbf975c73b37	Popa-write	Popa - spreminjanje	f
00030000-555d-7ca6-d129-110b23cdf730	Posta-read	Posta - branje	f
00030000-555d-7ca6-8cff-7de97e207d7a	Posta-write	Posta - spreminjanje	f
00030000-555d-7ca6-3a6e-2db579eb5e96	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555d-7ca6-fc98-016cb74c4c8a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555d-7ca6-1350-47bdf24291ac	PostniNaslov-read	PostniNaslov - branje	f
00030000-555d-7ca6-f09e-b2984c2ae1c6	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555d-7ca6-084e-d82164006934	Predstava-read	Predstava - branje	f
00030000-555d-7ca6-08de-3b7f055dd768	Predstava-write	Predstava - spreminjanje	f
00030000-555d-7ca6-b040-f1ae6ac23baf	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555d-7ca6-9427-a5da48a57b16	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555d-7ca6-f58d-021a356da5a2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555d-7ca6-19b0-70c6ae781068	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555d-7ca6-e563-411549b766eb	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555d-7ca6-2122-c8b53aef86fb	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555d-7ca6-64bb-2aa2bb2a2cba	Prostor-read	Prostor - branje	f
00030000-555d-7ca6-e8ed-c3c7e05b5cf4	Prostor-write	Prostor - spreminjanje	f
00030000-555d-7ca6-5d47-3f70bb6b8724	Racun-read	Racun - branje	f
00030000-555d-7ca6-d38f-e4c20c3d077c	Racun-write	Racun - spreminjanje	f
00030000-555d-7ca6-64a8-be352bb55e70	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555d-7ca6-b147-cc886c626931	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555d-7ca6-ee4e-80f0fe0e04c4	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555d-7ca6-ab73-ec5d249cf169	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555d-7ca6-b8e4-0df8901cc8e9	Rekvizit-read	Rekvizit - branje	f
00030000-555d-7ca6-5c09-41420a485715	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555d-7ca6-87c3-c01288e99f55	Rezervacija-read	Rezervacija - branje	f
00030000-555d-7ca6-9798-f9bc0907eec1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555d-7ca6-d52c-2c503fbedf97	SedezniRed-read	SedezniRed - branje	f
00030000-555d-7ca6-4f17-bd7528ddda6b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555d-7ca6-0e1d-3b55081958e1	Sedez-read	Sedez - branje	f
00030000-555d-7ca6-7a1e-a1553c0b1505	Sedez-write	Sedez - spreminjanje	f
00030000-555d-7ca6-c129-04bf6acf596f	Sezona-read	Sezona - branje	f
00030000-555d-7ca6-cffc-424152885033	Sezona-write	Sezona - spreminjanje	f
00030000-555d-7ca6-7d68-e8d274f754cf	Telefonska-read	Telefonska - branje	f
00030000-555d-7ca6-8cbc-92947ce69c2b	Telefonska-write	Telefonska - spreminjanje	f
00030000-555d-7ca6-5cae-ee44c06dc8e4	TerminStoritve-read	TerminStoritve - branje	f
00030000-555d-7ca6-bda4-05a536512f0b	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555d-7ca6-3910-4078ef464ab2	TipFunkcije-read	TipFunkcije - branje	f
00030000-555d-7ca6-1bd1-55515e3be685	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555d-7ca6-9c60-56a9510320b4	Trr-read	Trr - branje	f
00030000-555d-7ca6-94d2-3e40d1fd4e27	Trr-write	Trr - spreminjanje	f
00030000-555d-7ca6-b119-b0edba5cd68a	Uprizoritev-read	Uprizoritev - branje	f
00030000-555d-7ca6-b140-d30a573cad88	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555d-7ca6-39cc-4acee12b8406	Vaja-read	Vaja - branje	f
00030000-555d-7ca6-2333-275be3d04acd	Vaja-write	Vaja - spreminjanje	f
00030000-555d-7ca6-ced6-33431d448606	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555d-7ca6-354f-10e3e74eae7c	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555d-7ca6-d8b5-f0cb217bb21c	Zaposlitev-read	Zaposlitev - branje	f
00030000-555d-7ca6-38fd-0207729e6bc2	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555d-7ca6-17f4-64b80a2f23af	Zasedenost-read	Zasedenost - branje	f
00030000-555d-7ca6-7074-b82817efa70f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555d-7ca6-fa2d-228e1559ca0c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555d-7ca6-7f02-55a508777774	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555d-7ca6-f8ea-b145ba8329b0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555d-7ca6-d697-1e7ba81db7bb	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2633 (class 0 OID 4224885)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555d-7ca6-e147-3d0550a0b70f	00030000-555d-7ca6-f455-f94b70747d32
00020000-555d-7ca6-5afc-a597305de83e	00030000-555d-7ca6-85f0-2b25a4376701
00020000-555d-7ca6-5afc-a597305de83e	00030000-555d-7ca6-f455-f94b70747d32
\.


--
-- TOC entry 2661 (class 0 OID 4225169)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 4225199)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 4225312)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 4224943)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4224985)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555d-7ca6-93e9-b5b37c5d37ff	8341	Adlešiči
00050000-555d-7ca6-fac3-eecc326e45fa	5270	Ajdovščina
00050000-555d-7ca6-b108-df339cee6e5e	6280	Ankaran/Ancarano
00050000-555d-7ca6-8973-bc5b36781103	9253	Apače
00050000-555d-7ca6-88b9-cd827526f013	8253	Artiče
00050000-555d-7ca6-4d96-e7bb965e9eca	4275	Begunje na Gorenjskem
00050000-555d-7ca6-39e4-f232a2ea5019	1382	Begunje pri Cerknici
00050000-555d-7ca6-d0ee-e300d2d442bc	9231	Beltinci
00050000-555d-7ca6-3f8e-2c37b4abce8f	2234	Benedikt
00050000-555d-7ca6-d263-4d40528b3e14	2345	Bistrica ob Dravi
00050000-555d-7ca6-de81-a837529265db	3256	Bistrica ob Sotli
00050000-555d-7ca6-0ec0-59119e036b7c	8259	Bizeljsko
00050000-555d-7ca6-76f5-6e4ea1c8dd15	1223	Blagovica
00050000-555d-7ca6-9f2d-1c413389e4c0	8283	Blanca
00050000-555d-7ca6-141a-62f1899b882e	4260	Bled
00050000-555d-7ca6-6d0b-ff8b185980a0	4273	Blejska Dobrava
00050000-555d-7ca6-c73c-000578f78bd6	9265	Bodonci
00050000-555d-7ca6-6b0f-693f98438f1c	9222	Bogojina
00050000-555d-7ca6-bcf3-b91fa4406cf6	4263	Bohinjska Bela
00050000-555d-7ca6-e18d-72b3a6155203	4264	Bohinjska Bistrica
00050000-555d-7ca6-bfbf-b9c5a1e6688f	4265	Bohinjsko jezero
00050000-555d-7ca6-7ee7-b630870482a1	1353	Borovnica
00050000-555d-7ca6-4453-c76ad7887cc2	8294	Boštanj
00050000-555d-7ca6-d1e0-4a53ee69d078	5230	Bovec
00050000-555d-7ca6-1387-982672040f13	5295	Branik
00050000-555d-7ca6-de53-e1a878de13df	3314	Braslovče
00050000-555d-7ca6-a9fa-63c5795f879e	5223	Breginj
00050000-555d-7ca6-6fda-aed42979aee5	8280	Brestanica
00050000-555d-7ca6-3506-300713856873	2354	Bresternica
00050000-555d-7ca6-403b-2c6cba961475	4243	Brezje
00050000-555d-7ca6-5dcf-57d297f8fb0e	1351	Brezovica pri Ljubljani
00050000-555d-7ca6-87c7-2253faca0785	8250	Brežice
00050000-555d-7ca6-a5ce-459a242797b8	4210	Brnik - Aerodrom
00050000-555d-7ca6-d1e0-af658f94734c	8321	Brusnice
00050000-555d-7ca6-5a5e-6ba5bc8e8e95	3255	Buče
00050000-555d-7ca6-5bd6-7adeb6385bda	8276	Bučka 
00050000-555d-7ca6-54b4-bf9ff6a9c198	9261	Cankova
00050000-555d-7ca6-a7e9-00ab02ce3219	3000	Celje 
00050000-555d-7ca6-d69f-d760e5b99c77	3001	Celje - poštni predali
00050000-555d-7ca6-cfbe-f087d6ce84b8	4207	Cerklje na Gorenjskem
00050000-555d-7ca6-942a-9296f0aef03b	8263	Cerklje ob Krki
00050000-555d-7ca6-7cee-0531cd2ced48	1380	Cerknica
00050000-555d-7ca6-f1c7-d35af1fca882	5282	Cerkno
00050000-555d-7ca6-3062-b97075bd1fef	2236	Cerkvenjak
00050000-555d-7ca6-5e0b-7bc520622c1e	2215	Ceršak
00050000-555d-7ca6-86e0-d8ba26ec1f0a	2326	Cirkovce
00050000-555d-7ca6-e16a-049fd6249b6c	2282	Cirkulane
00050000-555d-7ca6-7c16-90706fe5230d	5273	Col
00050000-555d-7ca6-30b8-49b8fa2eb8b3	8251	Čatež ob Savi
00050000-555d-7ca6-65e2-16ada38889af	1413	Čemšenik
00050000-555d-7ca6-a8e0-2935cf6bb26a	5253	Čepovan
00050000-555d-7ca6-a166-01d0072330c9	9232	Črenšovci
00050000-555d-7ca6-a516-248b279fa9c1	2393	Črna na Koroškem
00050000-555d-7ca6-6cef-86c269cdcd36	6275	Črni Kal
00050000-555d-7ca6-b68d-645d461e8480	5274	Črni Vrh nad Idrijo
00050000-555d-7ca6-510a-66e8a4af93b6	5262	Črniče
00050000-555d-7ca6-69ad-e414a8991b1d	8340	Črnomelj
00050000-555d-7ca6-9be8-b0de150b5680	6271	Dekani
00050000-555d-7ca6-111a-3303e0ff2f56	5210	Deskle
00050000-555d-7ca6-63d8-133763c98840	2253	Destrnik
00050000-555d-7ca6-26e4-7908bc466d5a	6215	Divača
00050000-555d-7ca6-3dfd-16d91d193b91	1233	Dob
00050000-555d-7ca6-4245-2e813d6952c4	3224	Dobje pri Planini
00050000-555d-7ca6-4f45-072e5fbee352	8257	Dobova
00050000-555d-7ca6-8d0f-4197fb332fd5	1423	Dobovec
00050000-555d-7ca6-3658-fb6d0dd65d7c	5263	Dobravlje
00050000-555d-7ca6-9b2d-ced5ee31bf70	3204	Dobrna
00050000-555d-7ca6-dd44-e91b6fa611ae	8211	Dobrnič
00050000-555d-7ca6-443a-aa2be6f885e3	1356	Dobrova
00050000-555d-7ca6-3028-3db214642248	9223	Dobrovnik/Dobronak 
00050000-555d-7ca6-d1c1-55a6a4aea1a9	5212	Dobrovo v Brdih
00050000-555d-7ca6-9d1e-d8ca00bcf91a	1431	Dol pri Hrastniku
00050000-555d-7ca6-b7d3-e0cbe0cd2608	1262	Dol pri Ljubljani
00050000-555d-7ca6-5071-941233f0008b	1273	Dole pri Litiji
00050000-555d-7ca6-2d74-4d18e3b6df1c	1331	Dolenja vas
00050000-555d-7ca6-8417-83d37b909a82	8350	Dolenjske Toplice
00050000-555d-7ca6-b4f0-8e7df0d7f9cc	1230	Domžale
00050000-555d-7ca6-86a3-461b7b81e63d	2252	Dornava
00050000-555d-7ca6-d26d-9de1b7bb48bf	5294	Dornberk
00050000-555d-7ca6-a808-2a6684d9889a	1319	Draga
00050000-555d-7ca6-a0d1-5327df7cdee9	8343	Dragatuš
00050000-555d-7ca6-b598-b8cca89b5fa5	3222	Dramlje
00050000-555d-7ca6-bb36-9d20615e2537	2370	Dravograd
00050000-555d-7ca6-86d2-7f05381a2adf	4203	Duplje
00050000-555d-7ca6-99bf-6e3593f5f3da	6221	Dutovlje
00050000-555d-7ca6-16e8-5fdaa0c76e17	8361	Dvor
00050000-555d-7ca6-4d31-b382ddf53a72	2343	Fala
00050000-555d-7ca6-7270-756b6053fcc3	9208	Fokovci
00050000-555d-7ca6-1875-fcfb88a934d9	2313	Fram
00050000-555d-7ca6-05d4-53913f356fce	3213	Frankolovo
00050000-555d-7ca6-f9f7-11fcc0cfa988	1274	Gabrovka
00050000-555d-7ca6-e7bd-f9ffbfea0e9f	8254	Globoko
00050000-555d-7ca6-4fc4-7a6037225e31	5275	Godovič
00050000-555d-7ca6-4532-a505509420f4	4204	Golnik
00050000-555d-7ca6-6073-3d60ff8891dd	3303	Gomilsko
00050000-555d-7ca6-e2f0-124a1faa0e54	4224	Gorenja vas
00050000-555d-7ca6-6f2a-0aa2ce1af85a	3263	Gorica pri Slivnici
00050000-555d-7ca6-ef24-d518d8cfe5f6	2272	Gorišnica
00050000-555d-7ca6-7485-2dd84d3f10f2	9250	Gornja Radgona
00050000-555d-7ca6-e4db-3df0136d466c	3342	Gornji Grad
00050000-555d-7ca6-fa00-47804733a79c	4282	Gozd Martuljek
00050000-555d-7ca6-385a-3057a3b102b1	6272	Gračišče
00050000-555d-7ca6-77c2-95a76c1fdda8	9264	Grad
00050000-555d-7ca6-ddbf-91168581d0de	8332	Gradac
00050000-555d-7ca6-c96c-11f24bf10327	1384	Grahovo
00050000-555d-7ca6-6851-bdfd0357654a	5242	Grahovo ob Bači
00050000-555d-7ca6-fb8e-fc59ba1ea987	5251	Grgar
00050000-555d-7ca6-a966-44350bdb66c3	3302	Griže
00050000-555d-7ca6-1350-c54dfb581b60	3231	Grobelno
00050000-555d-7ca6-df66-9ee356dc99ed	1290	Grosuplje
00050000-555d-7ca6-53db-747dc3425b9a	2288	Hajdina
00050000-555d-7ca6-5c4b-b095297704d6	8362	Hinje
00050000-555d-7ca6-aafe-6100d33a4bbf	2311	Hoče
00050000-555d-7ca6-3d75-70276decb491	9205	Hodoš/Hodos
00050000-555d-7ca6-5972-9ebd1d258bb9	1354	Horjul
00050000-555d-7ca6-72c0-9e16fcb526a3	1372	Hotedršica
00050000-555d-7ca6-f3f6-8f10ff2e668b	1430	Hrastnik
00050000-555d-7ca6-738b-76ddf17b0519	6225	Hruševje
00050000-555d-7ca6-d40a-3988ef5e98a7	4276	Hrušica
00050000-555d-7ca6-a719-84de97e00307	5280	Idrija
00050000-555d-7ca6-a40a-8574eaa72807	1292	Ig
00050000-555d-7ca6-1c22-223a8b854b39	6250	Ilirska Bistrica
00050000-555d-7ca6-0947-36d881797393	6251	Ilirska Bistrica-Trnovo
00050000-555d-7ca6-3cf1-b3e3a05bc184	1295	Ivančna Gorica
00050000-555d-7ca6-c798-cd74ea5880a3	2259	Ivanjkovci
00050000-555d-7ca6-42f2-e5c140bf052e	1411	Izlake
00050000-555d-7ca6-bc42-15097c4c7f98	6310	Izola/Isola
00050000-555d-7ca6-59c8-1fa803185ba3	2222	Jakobski Dol
00050000-555d-7ca6-a317-20cf4c709c6c	2221	Jarenina
00050000-555d-7ca6-e118-948d5c80f436	6254	Jelšane
00050000-555d-7ca6-1860-b987bc6d5244	4270	Jesenice
00050000-555d-7ca6-c736-4348cb90e23a	8261	Jesenice na Dolenjskem
00050000-555d-7ca6-45a7-40ec9e710042	3273	Jurklošter
00050000-555d-7ca6-17dd-d3e0752cc396	2223	Jurovski Dol
00050000-555d-7ca6-3d3b-acb4536e73e3	2256	Juršinci
00050000-555d-7ca6-13f9-cb1aa2af78a6	5214	Kal nad Kanalom
00050000-555d-7ca6-51ab-42d494ab89fb	3233	Kalobje
00050000-555d-7ca6-9668-956029987aca	4246	Kamna Gorica
00050000-555d-7ca6-ba3c-7c640002282a	2351	Kamnica
00050000-555d-7ca6-90ef-8e0f09150f2a	1241	Kamnik
00050000-555d-7ca6-8a60-3d3804cd05ed	5213	Kanal
00050000-555d-7ca6-7ddc-c949c8d27863	8258	Kapele
00050000-555d-7ca6-50a1-fa3277a1775c	2362	Kapla
00050000-555d-7ca6-85dd-4ee0d408714a	2325	Kidričevo
00050000-555d-7ca6-6373-af809f66f44a	1412	Kisovec
00050000-555d-7ca6-1c9b-afe038c48038	6253	Knežak
00050000-555d-7ca6-2a16-b83cf6e744ad	5222	Kobarid
00050000-555d-7ca6-d7a5-38cc2d1dd550	9227	Kobilje
00050000-555d-7ca6-70f1-c4606496e041	1330	Kočevje
00050000-555d-7ca6-dfcc-39ad6e4941d1	1338	Kočevska Reka
00050000-555d-7ca6-e52c-1e344b2f2c7b	2276	Kog
00050000-555d-7ca6-1ff1-468601762b9b	5211	Kojsko
00050000-555d-7ca6-ad74-40acb2e8e028	6223	Komen
00050000-555d-7ca6-c5da-ddf8151409e4	1218	Komenda
00050000-555d-7ca6-35fb-deb74af78321	6000	Koper/Capodistria 
00050000-555d-7ca6-d6b9-5dc5751ad824	6001	Koper/Capodistria - poštni predali
00050000-555d-7ca6-5b46-40818d73b737	8282	Koprivnica
00050000-555d-7ca6-2727-163d2fb61e9b	5296	Kostanjevica na Krasu
00050000-555d-7ca6-0561-3e4ff058e9aa	8311	Kostanjevica na Krki
00050000-555d-7ca6-1198-47ba975ede47	1336	Kostel
00050000-555d-7ca6-3e73-25c2ea644a6c	6256	Košana
00050000-555d-7ca6-2ab7-a64ead9bdb98	2394	Kotlje
00050000-555d-7ca6-d233-398c802cd70b	6240	Kozina
00050000-555d-7ca6-ce29-44a7d5ce62bb	3260	Kozje
00050000-555d-7ca6-fc04-a7ec21e2fc3d	4000	Kranj 
00050000-555d-7ca6-e98a-24b382e22191	4001	Kranj - poštni predali
00050000-555d-7ca6-88f5-619c210cf936	4280	Kranjska Gora
00050000-555d-7ca6-fa70-68da8f1bdc5c	1281	Kresnice
00050000-555d-7ca6-4b09-4552126b6349	4294	Križe
00050000-555d-7ca6-0e29-815827af3bb5	9206	Križevci
00050000-555d-7ca6-b788-bc2b05c7a5e4	9242	Križevci pri Ljutomeru
00050000-555d-7ca6-b6b7-de52b33cb786	1301	Krka
00050000-555d-7ca6-ba08-802785ef91e7	8296	Krmelj
00050000-555d-7ca6-09f2-a978054423ba	4245	Kropa
00050000-555d-7ca6-b463-8642860aeb71	8262	Krška vas
00050000-555d-7ca6-1a5f-95ab5c97122e	8270	Krško
00050000-555d-7ca6-0008-39ccd436f50d	9263	Kuzma
00050000-555d-7ca6-836a-b84fb54747dc	2318	Laporje
00050000-555d-7ca6-9eb5-fff608d567a4	3270	Laško
00050000-555d-7ca6-565c-573e4c76ba03	1219	Laze v Tuhinju
00050000-555d-7ca6-502e-673e74005777	2230	Lenart v Slovenskih goricah
00050000-555d-7ca6-1a3b-1727871903cc	9220	Lendava/Lendva
00050000-555d-7ca6-17cd-28abb5005414	4248	Lesce
00050000-555d-7ca6-337b-24c91f738e9b	3261	Lesično
00050000-555d-7ca6-dcad-c89912412dc3	8273	Leskovec pri Krškem
00050000-555d-7ca6-cc6c-a2e183d8d2ad	2372	Libeliče
00050000-555d-7ca6-bb33-85e004e0c879	2341	Limbuš
00050000-555d-7ca6-bb7d-83b532bf7c75	1270	Litija
00050000-555d-7ca6-5b58-a0810886d40f	3202	Ljubečna
00050000-555d-7ca6-1fbe-942d3a4ddaae	1000	Ljubljana 
00050000-555d-7ca6-6f99-a603ef66cb63	1001	Ljubljana - poštni predali
00050000-555d-7ca6-97a5-11896f09f5c6	1231	Ljubljana - Črnuče
00050000-555d-7ca6-bb08-9a9f6b3fc946	1261	Ljubljana - Dobrunje
00050000-555d-7ca6-df3b-dd845a73f2fa	1260	Ljubljana - Polje
00050000-555d-7ca6-fb8a-81309ac89f1f	1210	Ljubljana - Šentvid
00050000-555d-7ca6-24d5-1152de866c73	1211	Ljubljana - Šmartno
00050000-555d-7ca6-dfc7-c9839a6c45f8	3333	Ljubno ob Savinji
00050000-555d-7ca6-3388-515173c2119f	9240	Ljutomer
00050000-555d-7ca6-d557-1d5a8af9c54c	3215	Loče
00050000-555d-7ca6-7aea-fe3ce31a83cc	5231	Log pod Mangartom
00050000-555d-7ca6-0e4b-aad53398d8e9	1358	Log pri Brezovici
00050000-555d-7ca6-cf9f-6b938eb80bb9	1370	Logatec
00050000-555d-7ca6-ce6f-3ec5d8fb6e75	1371	Logatec
00050000-555d-7ca6-f688-5d2c4c63df40	1434	Loka pri Zidanem Mostu
00050000-555d-7ca6-6b45-e4820f412fc9	3223	Loka pri Žusmu
00050000-555d-7ca6-df8b-e77b9949fd7c	6219	Lokev
00050000-555d-7ca6-cc20-6d8af63f1edc	1318	Loški Potok
00050000-555d-7ca6-5f48-d8b82ad384ca	2324	Lovrenc na Dravskem polju
00050000-555d-7ca6-dbc1-e33dda033107	2344	Lovrenc na Pohorju
00050000-555d-7ca6-6a2f-3ea7795a4c75	3334	Luče
00050000-555d-7ca6-d4ee-56948ac308f9	1225	Lukovica
00050000-555d-7ca6-cf30-80fc45b8aa7e	9202	Mačkovci
00050000-555d-7ca6-29c8-933c6d14bec5	2322	Majšperk
00050000-555d-7ca6-b171-b6ab75316d12	2321	Makole
00050000-555d-7ca6-296d-9ef416da82bc	9243	Mala Nedelja
00050000-555d-7ca6-3c58-9401ace46a80	2229	Malečnik
00050000-555d-7ca6-019c-4f6921fb0528	6273	Marezige
00050000-555d-7ca6-7f2d-4dd0e5e6b6d9	2000	Maribor 
00050000-555d-7ca6-41be-474479e5d60d	2001	Maribor - poštni predali
00050000-555d-7ca6-08df-552a6c2a93ea	2206	Marjeta na Dravskem polju
00050000-555d-7ca6-35b7-f6f612d1c7e2	2281	Markovci
00050000-555d-7ca6-4b3f-4f933abb934c	9221	Martjanci
00050000-555d-7ca6-0d90-0eb48178bd8e	6242	Materija
00050000-555d-7ca6-848e-2a86338c5a79	4211	Mavčiče
00050000-555d-7ca6-131e-f08433d6bac3	1215	Medvode
00050000-555d-7ca6-9369-07fcdd1dad01	1234	Mengeš
00050000-555d-7ca6-4198-60338198e852	8330	Metlika
00050000-555d-7ca6-2d85-8961dec980ae	2392	Mežica
00050000-555d-7ca6-24d9-9cce9b8c17eb	2204	Miklavž na Dravskem polju
00050000-555d-7ca6-06d8-5a615ab147f3	2275	Miklavž pri Ormožu
00050000-555d-7ca6-2a91-48e8cb640e38	5291	Miren
00050000-555d-7ca6-e64b-02a761b1d72c	8233	Mirna
00050000-555d-7ca6-04c1-ab7e3d94537e	8216	Mirna Peč
00050000-555d-7ca6-0290-82200e2d4cd5	2382	Mislinja
00050000-555d-7ca6-1abd-55ca8aa79905	4281	Mojstrana
00050000-555d-7ca6-81f7-978e6862362a	8230	Mokronog
00050000-555d-7ca6-9a82-6377bad421da	1251	Moravče
00050000-555d-7ca6-f825-b956fb17d445	9226	Moravske Toplice
00050000-555d-7ca6-cf81-4a18adb6e4dd	5216	Most na Soči
00050000-555d-7ca6-29bf-ecd71c84ba28	1221	Motnik
00050000-555d-7ca6-e9b6-b26cc5c8a663	3330	Mozirje
00050000-555d-7ca6-3be7-bb17435656d3	9000	Murska Sobota 
00050000-555d-7ca6-d8cb-67cef4e566ac	9001	Murska Sobota - poštni predali
00050000-555d-7ca6-9251-057c4ba619fd	2366	Muta
00050000-555d-7ca6-aa9f-28c686d47124	4202	Naklo
00050000-555d-7ca6-fe23-3283a3bfeda9	3331	Nazarje
00050000-555d-7ca6-cf7f-758081227c98	1357	Notranje Gorice
00050000-555d-7ca6-a158-334815f396d7	3203	Nova Cerkev
00050000-555d-7ca6-a9cb-6abd9fb40cd3	5000	Nova Gorica 
00050000-555d-7ca6-5db6-ab5ef6706e27	5001	Nova Gorica - poštni predali
00050000-555d-7ca6-3e41-a3f30eed7291	1385	Nova vas
00050000-555d-7ca6-336b-f399bece97c9	8000	Novo mesto
00050000-555d-7ca6-07db-e35577a0db51	8001	Novo mesto - poštni predali
00050000-555d-7ca6-e3d5-fc2dc0718ebf	6243	Obrov
00050000-555d-7ca6-90cd-1eba822c81ae	9233	Odranci
00050000-555d-7ca6-b256-f5638fde69db	2317	Oplotnica
00050000-555d-7ca6-eaa7-99952f695d61	2312	Orehova vas
00050000-555d-7ca6-df5d-7ed517b357ed	2270	Ormož
00050000-555d-7ca6-2b16-9ee44404a8ef	1316	Ortnek
00050000-555d-7ca6-6d02-5e784f66d17f	1337	Osilnica
00050000-555d-7ca6-5c09-c8f7ef36b987	8222	Otočec
00050000-555d-7ca6-074f-6d5915a1a155	2361	Ožbalt
00050000-555d-7ca6-dcd6-3f639b47745c	2231	Pernica
00050000-555d-7ca6-5763-6f325bf016e7	2211	Pesnica pri Mariboru
00050000-555d-7ca6-6bff-9a809cb45595	9203	Petrovci
00050000-555d-7ca6-ced8-8759ed1d9ec3	3301	Petrovče
00050000-555d-7ca6-c6d2-af6e844dfd94	6330	Piran/Pirano
00050000-555d-7ca6-cddb-5dd2ced4c99a	8255	Pišece
00050000-555d-7ca6-793d-2caa0e7c71e6	6257	Pivka
00050000-555d-7ca6-bc17-6a3b8a064204	6232	Planina
00050000-555d-7ca6-310c-b907c21761b1	3225	Planina pri Sevnici
00050000-555d-7ca6-33c4-90f77d49563f	6276	Pobegi
00050000-555d-7ca6-e6ea-644f3f622a94	8312	Podbočje
00050000-555d-7ca6-188c-046425c192b1	5243	Podbrdo
00050000-555d-7ca6-7e25-c9927a9780b0	3254	Podčetrtek
00050000-555d-7ca6-2ecc-e305042cb928	2273	Podgorci
00050000-555d-7ca6-b9df-5d0094d9065f	6216	Podgorje
00050000-555d-7ca6-d7d0-3cdd13300437	2381	Podgorje pri Slovenj Gradcu
00050000-555d-7ca6-e528-dc01435ef370	6244	Podgrad
00050000-555d-7ca6-4423-23747dea509a	1414	Podkum
00050000-555d-7ca6-8f07-5b37de1b9135	2286	Podlehnik
00050000-555d-7ca6-14d4-68eca00d4ebf	5272	Podnanos
00050000-555d-7ca6-a9ce-22c595db2b46	4244	Podnart
00050000-555d-7ca6-7dd9-318b9d0fcf02	3241	Podplat
00050000-555d-7ca6-d931-1563709e4c43	3257	Podsreda
00050000-555d-7ca6-1ebb-f0cf1835780e	2363	Podvelka
00050000-555d-7ca6-7904-0d54b921fbbe	2208	Pohorje
00050000-555d-7ca6-3a53-a9eeee2584f0	2257	Polenšak
00050000-555d-7ca6-1327-b406154ac90b	1355	Polhov Gradec
00050000-555d-7ca6-5f1c-c7c9d9d1c486	4223	Poljane nad Škofjo Loko
00050000-555d-7ca6-fbc7-a0493b8dcb68	2319	Poljčane
00050000-555d-7ca6-1cfc-6399d1f20d97	1272	Polšnik
00050000-555d-7ca6-88b8-6401daa19648	3313	Polzela
00050000-555d-7ca6-d90c-f7da9e8a7139	3232	Ponikva
00050000-555d-7ca6-dee3-86c25b038bd1	6320	Portorož/Portorose
00050000-555d-7ca6-6889-242c0b452f90	6230	Postojna
00050000-555d-7ca6-6eda-11170d685464	2331	Pragersko
00050000-555d-7ca6-ee21-792da9daed67	3312	Prebold
00050000-555d-7ca6-fa59-e285bf9e7749	4205	Preddvor
00050000-555d-7ca6-228b-ba0644160e4a	6255	Prem
00050000-555d-7ca6-a5ee-b0f7a4e994f1	1352	Preserje
00050000-555d-7ca6-cf64-a3df9e14012b	6258	Prestranek
00050000-555d-7ca6-c5df-b790f03c80ca	2391	Prevalje
00050000-555d-7ca6-2117-edc4d54aac10	3262	Prevorje
00050000-555d-7ca6-63cb-6cb437fae47c	1276	Primskovo 
00050000-555d-7ca6-73dc-ad3d8845a037	3253	Pristava pri Mestinju
00050000-555d-7ca6-fe34-f09ea93461a5	9207	Prosenjakovci/Partosfalva
00050000-555d-7ca6-6a09-383067a0d08a	5297	Prvačina
00050000-555d-7ca6-1387-757c6e7ad2e7	2250	Ptuj
00050000-555d-7ca6-46aa-9bf6cf397e2a	2323	Ptujska Gora
00050000-555d-7ca6-0dba-cbccba605205	9201	Puconci
00050000-555d-7ca6-510b-e36185fe4924	2327	Rače
00050000-555d-7ca6-7f61-9ccbff1c51d6	1433	Radeče
00050000-555d-7ca6-870b-238d6f79502c	9252	Radenci
00050000-555d-7ca6-94b3-4e3fa5628274	2360	Radlje ob Dravi
00050000-555d-7ca6-094d-ee52dd6e886c	1235	Radomlje
00050000-555d-7ca6-a175-44d7a1ce5423	4240	Radovljica
00050000-555d-7ca6-2f05-32d2bddab90b	8274	Raka
00050000-555d-7ca6-bc19-cb6b3fe33dbe	1381	Rakek
00050000-555d-7ca6-0733-a08e6102ccd9	4283	Rateče - Planica
00050000-555d-7ca6-5bd8-6eb6882c10a5	2390	Ravne na Koroškem
00050000-555d-7ca6-0932-635e3b8e9e9e	9246	Razkrižje
00050000-555d-7ca6-10bc-871cd477cd2f	3332	Rečica ob Savinji
00050000-555d-7ca6-4855-47db7092b387	5292	Renče
00050000-555d-7ca6-0041-a4e1981ee73d	1310	Ribnica
00050000-555d-7ca6-86e9-fb44c94fb6c4	2364	Ribnica na Pohorju
00050000-555d-7ca6-b38b-60f598197c64	3272	Rimske Toplice
00050000-555d-7ca6-7fc5-46cc5e0a7368	1314	Rob
00050000-555d-7ca6-2642-237e677f435d	5215	Ročinj
00050000-555d-7ca6-99cc-192fbe504101	3250	Rogaška Slatina
00050000-555d-7ca6-1002-b2f32cb0fa82	9262	Rogašovci
00050000-555d-7ca6-6535-a846820b1a07	3252	Rogatec
00050000-555d-7ca6-f8bb-537c9ea8e538	1373	Rovte
00050000-555d-7ca6-07f8-79f5c53149eb	2342	Ruše
00050000-555d-7ca6-b67f-296bdd1262a6	1282	Sava
00050000-555d-7ca6-0be1-230587c91957	6333	Sečovlje/Sicciole
00050000-555d-7ca6-608a-1d4dced6e688	4227	Selca
00050000-555d-7ca6-9be4-352281e80f45	2352	Selnica ob Dravi
00050000-555d-7ca6-efba-cb87441ddcfa	8333	Semič
00050000-555d-7ca6-8d25-bc78b602df56	8281	Senovo
00050000-555d-7ca6-a902-0eccb79f778a	6224	Senožeče
00050000-555d-7ca6-7686-9a167dc29c20	8290	Sevnica
00050000-555d-7ca6-abec-fd2313d33a55	6210	Sežana
00050000-555d-7ca6-5117-aa442417e2be	2214	Sladki Vrh
00050000-555d-7ca6-3ab8-87ee42827f4d	5283	Slap ob Idrijci
00050000-555d-7ca6-db4a-c7b2a1ac996e	2380	Slovenj Gradec
00050000-555d-7ca6-dc6f-f0d3247847d7	2310	Slovenska Bistrica
00050000-555d-7ca6-636a-9d1d2c59bfae	3210	Slovenske Konjice
00050000-555d-7ca6-92a8-90114cf82954	1216	Smlednik
00050000-555d-7ca6-2017-af021e8e0439	5232	Soča
00050000-555d-7ca6-c61d-e2d25017b7b5	1317	Sodražica
00050000-555d-7ca6-2503-f1c382b3222b	3335	Solčava
00050000-555d-7ca6-6bad-c2c1b1bda52c	5250	Solkan
00050000-555d-7ca6-277f-032e3fad4e1e	4229	Sorica
00050000-555d-7ca6-4211-7272422e935b	4225	Sovodenj
00050000-555d-7ca6-c26e-1b8bd01813f4	5281	Spodnja Idrija
00050000-555d-7ca6-6f08-523865db731e	2241	Spodnji Duplek
00050000-555d-7ca6-b873-4b15cfe8cba1	9245	Spodnji Ivanjci
00050000-555d-7ca6-b92a-ec3a71438f13	2277	Središče ob Dravi
00050000-555d-7ca6-10af-bfdb8d02c003	4267	Srednja vas v Bohinju
00050000-555d-7ca6-cb4a-acc3320a8586	8256	Sromlje 
00050000-555d-7ca6-7bda-ebadc143cf28	5224	Srpenica
00050000-555d-7ca6-6dbd-40f1e5582221	1242	Stahovica
00050000-555d-7ca6-6255-d5afffdbcab1	1332	Stara Cerkev
00050000-555d-7ca6-66c7-e460371390d7	8342	Stari trg ob Kolpi
00050000-555d-7ca6-36e8-9839a40b304e	1386	Stari trg pri Ložu
00050000-555d-7ca6-1383-5db7b4132d72	2205	Starše
00050000-555d-7ca6-1223-2c997cce58ec	2289	Stoperce
00050000-555d-7ca6-a69e-6af857d1b471	8322	Stopiče
00050000-555d-7ca6-330a-214220b52157	3206	Stranice
00050000-555d-7ca6-d6e2-b2e919cba56e	8351	Straža
00050000-555d-7ca6-6ab7-4a771a8e4e94	1313	Struge
00050000-555d-7ca6-3058-f52717a5cdb0	8293	Studenec
00050000-555d-7ca6-32bf-fd19519881d1	8331	Suhor
00050000-555d-7ca6-c8a6-1677c70a3bf8	2233	Sv. Ana v Slovenskih goricah
00050000-555d-7ca6-de78-9544746341be	2235	Sv. Trojica v Slovenskih goricah
00050000-555d-7ca6-37ad-3b3dcacdae00	2353	Sveti Duh na Ostrem Vrhu
00050000-555d-7ca6-e877-930b5934f7d6	9244	Sveti Jurij ob Ščavnici
00050000-555d-7ca6-eaac-bcbac7495a34	3264	Sveti Štefan
00050000-555d-7ca6-4654-11b3ba028f7f	2258	Sveti Tomaž
00050000-555d-7ca6-db24-ce73c2785476	9204	Šalovci
00050000-555d-7ca6-a68a-8da561ef2f6e	5261	Šempas
00050000-555d-7ca6-155e-5b4aaad8f6a1	5290	Šempeter pri Gorici
00050000-555d-7ca6-9caf-94187a299246	3311	Šempeter v Savinjski dolini
00050000-555d-7ca6-9582-a10a61acd8ac	4208	Šenčur
00050000-555d-7ca6-c223-d23d3968c8f6	2212	Šentilj v Slovenskih goricah
00050000-555d-7ca6-20ab-df5b3dcaba59	8297	Šentjanž
00050000-555d-7ca6-ae43-a0920d5a45ac	2373	Šentjanž pri Dravogradu
00050000-555d-7ca6-a454-3fd3645220a8	8310	Šentjernej
00050000-555d-7ca6-53d6-910b5990e863	3230	Šentjur
00050000-555d-7ca6-6bf3-cda81c5a4828	3271	Šentrupert
00050000-555d-7ca6-017d-7693180b3b4b	8232	Šentrupert
00050000-555d-7ca6-fbcf-ec86a7fce407	1296	Šentvid pri Stični
00050000-555d-7ca6-b36d-0fc86ed0ab7e	8275	Škocjan
00050000-555d-7ca6-09ae-c06e9b41c8b4	6281	Škofije
00050000-555d-7ca6-56d3-d7befcc7041c	4220	Škofja Loka
00050000-555d-7ca6-66f2-a8582ed2a260	3211	Škofja vas
00050000-555d-7ca6-842b-35e8d72eada4	1291	Škofljica
00050000-555d-7ca6-f841-1875fb495c4b	6274	Šmarje
00050000-555d-7ca6-913f-1e7b9f88f946	1293	Šmarje - Sap
00050000-555d-7ca6-64f4-a9cb0689a986	3240	Šmarje pri Jelšah
00050000-555d-7ca6-862d-4a1d3ea10f78	8220	Šmarješke Toplice
00050000-555d-7ca6-a1a5-ebfcada58079	2315	Šmartno na Pohorju
00050000-555d-7ca6-30bd-d483f490205f	3341	Šmartno ob Dreti
00050000-555d-7ca6-6dd5-2ac921670cb2	3327	Šmartno ob Paki
00050000-555d-7ca6-6bae-929879833823	1275	Šmartno pri Litiji
00050000-555d-7ca6-b2c0-1e7a434c70bf	2383	Šmartno pri Slovenj Gradcu
00050000-555d-7ca6-fa8b-6e49fbb40e3a	3201	Šmartno v Rožni dolini
00050000-555d-7ca6-e9c6-daa6b8f1d97e	3325	Šoštanj
00050000-555d-7ca6-980a-18066e8594e0	6222	Štanjel
00050000-555d-7ca6-9597-ae1fe6c01f76	3220	Štore
00050000-555d-7ca6-c488-7dcba630b302	3304	Tabor
00050000-555d-7ca6-d932-8ac1e90a020c	3221	Teharje
00050000-555d-7ca6-4d18-40588c290e6b	9251	Tišina
00050000-555d-7ca6-65f2-8b645b2d30d5	5220	Tolmin
00050000-555d-7ca6-750f-6e5bdbcc2eaa	3326	Topolšica
00050000-555d-7ca6-23d2-8103ff179af2	2371	Trbonje
00050000-555d-7ca6-a18a-a054bfae97db	1420	Trbovlje
00050000-555d-7ca6-34c3-5ed244a424c7	8231	Trebelno 
00050000-555d-7ca6-7a4a-fa170fbb6b29	8210	Trebnje
00050000-555d-7ca6-3cac-5cf22c6c104d	5252	Trnovo pri Gorici
00050000-555d-7ca6-f1a2-add4eddfde1a	2254	Trnovska vas
00050000-555d-7ca6-399a-0d352e1f04bd	1222	Trojane
00050000-555d-7ca6-e515-6ac8029ecdda	1236	Trzin
00050000-555d-7ca6-6faf-57ccd9e0fb03	4290	Tržič
00050000-555d-7ca6-7c7d-d2cb3865af05	8295	Tržišče
00050000-555d-7ca6-c768-d961088010a5	1311	Turjak
00050000-555d-7ca6-fb09-0cc4899f4d1d	9224	Turnišče
00050000-555d-7ca6-d7dc-d24efe1c6f20	8323	Uršna sela
00050000-555d-7ca6-2dd9-d0f5f2752240	1252	Vače
00050000-555d-7ca6-b099-312de87ed059	3320	Velenje 
00050000-555d-7ca6-a0a3-97bf2fe9b151	3322	Velenje - poštni predali
00050000-555d-7ca6-29fe-0bc0a21122b7	8212	Velika Loka
00050000-555d-7ca6-3268-d38fe12be2f5	2274	Velika Nedelja
00050000-555d-7ca6-b179-36507e8876cc	9225	Velika Polana
00050000-555d-7ca6-f585-2d5435716808	1315	Velike Lašče
00050000-555d-7ca6-d324-3daa18100280	8213	Veliki Gaber
00050000-555d-7ca6-9fa0-7a56ee4eeeb7	9241	Veržej
00050000-555d-7ca6-2801-d545981f03b9	1312	Videm - Dobrepolje
00050000-555d-7ca6-0aef-ebd3441dcf7b	2284	Videm pri Ptuju
00050000-555d-7ca6-87ae-f8c57c11238c	8344	Vinica
00050000-555d-7ca6-a57b-03d67b7e00c1	5271	Vipava
00050000-555d-7ca6-b487-27d32fea823f	4212	Visoko
00050000-555d-7ca6-e420-49ca6f147777	1294	Višnja Gora
00050000-555d-7ca6-ca54-071d69e8acae	3205	Vitanje
00050000-555d-7ca6-6d89-919953dcc1a1	2255	Vitomarci
00050000-555d-7ca6-46ff-8b755174d581	1217	Vodice
00050000-555d-7ca6-c918-fa3ff1902e6d	3212	Vojnik\t
00050000-555d-7ca6-534a-4f1719e00ab0	5293	Volčja Draga
00050000-555d-7ca6-cfa5-a07b901a9912	2232	Voličina
00050000-555d-7ca6-1dbc-ba013c62ddf8	3305	Vransko
00050000-555d-7ca6-fb1a-11bc06ee128e	6217	Vremski Britof
00050000-555d-7ca6-bec0-4e9ddd5ad66d	1360	Vrhnika
00050000-555d-7ca6-fdf9-bd89092d73ed	2365	Vuhred
00050000-555d-7ca6-dc1e-bc0d526c8a5f	2367	Vuzenica
00050000-555d-7ca6-a537-59fb7ffe3467	8292	Zabukovje 
00050000-555d-7ca6-647f-93d30caa2f97	1410	Zagorje ob Savi
00050000-555d-7ca6-34c1-8792361f5b4d	1303	Zagradec
00050000-555d-7ca6-1a6c-9c28a5799147	2283	Zavrč
00050000-555d-7ca6-2ee1-b63966c2013c	8272	Zdole 
00050000-555d-7ca6-2202-90ade6eb9c02	4201	Zgornja Besnica
00050000-555d-7ca6-7ca6-d4524a27479c	2242	Zgornja Korena
00050000-555d-7ca6-7626-353478c38a04	2201	Zgornja Kungota
00050000-555d-7ca6-2336-95a10bb0da6a	2316	Zgornja Ložnica
00050000-555d-7ca6-0bbf-d062fedc426b	2314	Zgornja Polskava
00050000-555d-7ca6-e2d3-f44e962c8404	2213	Zgornja Velka
00050000-555d-7ca6-5057-96225bc49c93	4247	Zgornje Gorje
00050000-555d-7ca6-22a9-2ab5dc477ac0	4206	Zgornje Jezersko
00050000-555d-7ca6-9a97-b360ebea3033	2285	Zgornji Leskovec
00050000-555d-7ca6-cafd-1d4f882bf323	1432	Zidani Most
00050000-555d-7ca6-79f4-6dbd472f6184	3214	Zreče
00050000-555d-7ca6-4696-c6d063a664b3	4209	Žabnica
00050000-555d-7ca6-27bc-0043d03ff3f7	3310	Žalec
00050000-555d-7ca6-30c4-8288f2ffa1ac	4228	Železniki
00050000-555d-7ca6-bd1a-644e99787ea6	2287	Žetale
00050000-555d-7ca6-c9ff-e38ed802e6a5	4226	Žiri
00050000-555d-7ca6-9282-847b093e62b6	4274	Žirovnica
00050000-555d-7ca6-f3c1-6a858f530ae7	8360	Žužemberk
\.


--
-- TOC entry 2657 (class 0 OID 4225143)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4224970)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4225036)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 4225155)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4225260)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4225305)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4225184)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 4225128)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 4225118)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4225295)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4225250)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2628 (class 0 OID 4224837)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555d-7ca6-882b-271eb0ebd8d6	00010000-555d-7ca6-34b0-0fbace30b6c7	2015-05-21 08:35:19	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROA6Sglxa0X2aXF5pokBSiQMmdbSgqYoa";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2664 (class 0 OID 4225193)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 4224875)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555d-7ca6-df81-621fff677e11	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555d-7ca6-7dd1-4edea68b9e7d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555d-7ca6-e147-3d0550a0b70f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555d-7ca6-cbe9-6b6be9e866c7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555d-7ca6-9294-2ac6d3e6dd59	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555d-7ca6-5afc-a597305de83e	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2630 (class 0 OID 4224859)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555d-7ca6-882b-271eb0ebd8d6	00020000-555d-7ca6-cbe9-6b6be9e866c7
00010000-555d-7ca6-34b0-0fbace30b6c7	00020000-555d-7ca6-cbe9-6b6be9e866c7
\.


--
-- TOC entry 2666 (class 0 OID 4225207)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4225149)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4225099)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4224935)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4225105)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4225283)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4225005)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4224846)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555d-7ca6-34b0-0fbace30b6c7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO/n7ky1xu3YgqHWo0mSakfzsxj/gMYEq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555d-7ca6-882b-271eb0ebd8d6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2678 (class 0 OID 4225337)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4225051)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 4225176)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4225242)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4225083)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4225327)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4225232)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2272 (class 2606 OID 4224900)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 4225377)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 4225370)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4225282)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 4225073)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4225098)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 4225031)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 4225228)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 4225049)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 4225092)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2247 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 4225141)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 4225168)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 4225003)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 4224909)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2291 (class 2606 OID 4224967)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2278 (class 2606 OID 4224933)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 4224889)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2263 (class 2606 OID 4224874)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 4225174)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4225206)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 4225322)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 4224960)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 4224991)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4225147)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4224981)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4225040)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4225159)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4225266)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 4225310)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 4225191)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 4225132)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 4225123)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4225304)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 4225257)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4224845)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4225197)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 4224863)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2265 (class 2606 OID 4224883)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4225215)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 4225154)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 4225104)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 4224940)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2348 (class 2606 OID 4225114)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4225294)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4225016)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 4224858)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4225352)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4225058)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4225182)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 4225248)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4225087)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 4225336)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 4225241)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 1259 OID 4225080)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2284 (class 1259 OID 4224962)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2249 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2250 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2251 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2375 (class 1259 OID 4225175)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2369 (class 1259 OID 4225161)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2370 (class 1259 OID 4225160)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2321 (class 1259 OID 4225059)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4225231)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2397 (class 1259 OID 4225229)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 4225230)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2421 (class 1259 OID 4225324)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 4225325)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2423 (class 1259 OID 4225326)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2429 (class 1259 OID 4225355)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2430 (class 1259 OID 4225354)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2431 (class 1259 OID 4225353)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2303 (class 1259 OID 4225018)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2304 (class 1259 OID 4225017)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2288 (class 1259 OID 4224969)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2289 (class 1259 OID 4224968)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2384 (class 1259 OID 4225198)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2339 (class 1259 OID 4225093)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2267 (class 1259 OID 4224890)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2268 (class 1259 OID 4224891)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2389 (class 1259 OID 4225218)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2390 (class 1259 OID 4225217)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2391 (class 1259 OID 4225216)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2313 (class 1259 OID 4225041)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2314 (class 1259 OID 4225043)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2315 (class 1259 OID 4225042)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2349 (class 1259 OID 4225127)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2350 (class 1259 OID 4225125)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2351 (class 1259 OID 4225124)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2352 (class 1259 OID 4225126)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2258 (class 1259 OID 4224864)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2259 (class 1259 OID 4224865)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2378 (class 1259 OID 4225183)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2364 (class 1259 OID 4225148)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2404 (class 1259 OID 4225258)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2405 (class 1259 OID 4225259)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2292 (class 1259 OID 4224983)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2293 (class 1259 OID 4224982)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2294 (class 1259 OID 4224984)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2408 (class 1259 OID 4225267)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2409 (class 1259 OID 4225268)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2440 (class 1259 OID 4225380)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2441 (class 1259 OID 4225379)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2442 (class 1259 OID 4225382)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2443 (class 1259 OID 4225378)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2444 (class 1259 OID 4225381)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2401 (class 1259 OID 4225249)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2355 (class 1259 OID 4225136)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2356 (class 1259 OID 4225135)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2357 (class 1259 OID 4225133)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2358 (class 1259 OID 4225134)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2245 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2436 (class 1259 OID 4225372)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2437 (class 1259 OID 4225371)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2320 (class 1259 OID 4225050)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2273 (class 1259 OID 4224911)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2274 (class 1259 OID 4224910)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2280 (class 1259 OID 4224941)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2281 (class 1259 OID 4224942)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2344 (class 1259 OID 4225117)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 4225116)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2346 (class 1259 OID 4225115)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2327 (class 1259 OID 4225082)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2328 (class 1259 OID 4225078)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2329 (class 1259 OID 4225075)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2330 (class 1259 OID 4225076)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2331 (class 1259 OID 4225074)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2332 (class 1259 OID 4225079)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2333 (class 1259 OID 4225077)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2287 (class 1259 OID 4224961)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2309 (class 1259 OID 4225032)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2310 (class 1259 OID 4225034)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2311 (class 1259 OID 4225033)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2312 (class 1259 OID 4225035)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2363 (class 1259 OID 4225142)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 4225323)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2279 (class 1259 OID 4224934)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 4225004)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2383 (class 1259 OID 4225192)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2248 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2299 (class 1259 OID 4224992)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2420 (class 1259 OID 4225311)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2266 (class 1259 OID 4224884)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2334 (class 1259 OID 4225081)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2469 (class 2606 OID 4225513)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2472 (class 2606 OID 4225498)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2471 (class 2606 OID 4225503)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2467 (class 2606 OID 4225523)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2473 (class 2606 OID 4225493)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2468 (class 2606 OID 4225518)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2470 (class 2606 OID 4225508)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2454 (class 2606 OID 4225428)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2490 (class 2606 OID 4225608)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2488 (class 2606 OID 4225603)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2489 (class 2606 OID 4225598)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2466 (class 2606 OID 4225488)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2496 (class 2606 OID 4225648)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2498 (class 2606 OID 4225638)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2497 (class 2606 OID 4225643)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2486 (class 2606 OID 4225588)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 4225683)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2506 (class 2606 OID 4225688)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2505 (class 2606 OID 4225693)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2508 (class 2606 OID 4225708)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2509 (class 2606 OID 4225703)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2510 (class 2606 OID 4225698)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2460 (class 2606 OID 4225463)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 4225458)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 4225438)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2456 (class 2606 OID 4225433)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 4225413)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2492 (class 2606 OID 4225618)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2474 (class 2606 OID 4225528)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2448 (class 2606 OID 4225393)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2447 (class 2606 OID 4225398)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2493 (class 2606 OID 4225633)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2494 (class 2606 OID 4225628)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2495 (class 2606 OID 4225623)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2464 (class 2606 OID 4225468)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2462 (class 2606 OID 4225478)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2463 (class 2606 OID 4225473)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2478 (class 2606 OID 4225563)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2480 (class 2606 OID 4225553)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2481 (class 2606 OID 4225548)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2479 (class 2606 OID 4225558)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2446 (class 2606 OID 4225383)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2445 (class 2606 OID 4225388)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2491 (class 2606 OID 4225613)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2487 (class 2606 OID 4225593)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2501 (class 2606 OID 4225658)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2500 (class 2606 OID 4225663)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2458 (class 2606 OID 4225448)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 4225443)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 4225453)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2503 (class 2606 OID 4225668)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2502 (class 2606 OID 4225673)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2515 (class 2606 OID 4225733)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 4225728)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2513 (class 2606 OID 4225743)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2517 (class 2606 OID 4225723)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2514 (class 2606 OID 4225738)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2499 (class 2606 OID 4225653)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2482 (class 2606 OID 4225583)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2483 (class 2606 OID 4225578)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2485 (class 2606 OID 4225568)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2484 (class 2606 OID 4225573)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2511 (class 2606 OID 4225718)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2512 (class 2606 OID 4225713)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2465 (class 2606 OID 4225483)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2504 (class 2606 OID 4225678)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2449 (class 2606 OID 4225408)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2450 (class 2606 OID 4225403)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2453 (class 2606 OID 4225418)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2452 (class 2606 OID 4225423)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2475 (class 2606 OID 4225543)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2476 (class 2606 OID 4225538)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2477 (class 2606 OID 4225533)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-21 08:35:19 CEST

--
-- PostgreSQL database dump complete
--

