--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-12 15:16:39 CEST

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
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 3196359)
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
-- TOC entry 225 (class 1259 OID 3196846)
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
-- TOC entry 224 (class 1259 OID 3196829)
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
-- TOC entry 217 (class 1259 OID 3196740)
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
-- TOC entry 193 (class 1259 OID 3196524)
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
-- TOC entry 196 (class 1259 OID 3196565)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3196486)
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
-- TOC entry 212 (class 1259 OID 3196690)
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
-- TOC entry 191 (class 1259 OID 3196511)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3196559)
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
-- TOC entry 201 (class 1259 OID 3196608)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3196633)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3196460)
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
-- TOC entry 180 (class 1259 OID 3196368)
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
-- TOC entry 181 (class 1259 OID 3196379)
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
-- TOC entry 184 (class 1259 OID 3196430)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3196333)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3196352)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3196640)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3196670)
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
-- TOC entry 221 (class 1259 OID 3196785)
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
-- TOC entry 183 (class 1259 OID 3196410)
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
-- TOC entry 186 (class 1259 OID 3196452)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3196614)
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
-- TOC entry 185 (class 1259 OID 3196437)
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
-- TOC entry 190 (class 1259 OID 3196503)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3196626)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3196731)
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
-- TOC entry 220 (class 1259 OID 3196778)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3196655)
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
-- TOC entry 200 (class 1259 OID 3196599)
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
-- TOC entry 199 (class 1259 OID 3196589)
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
-- TOC entry 219 (class 1259 OID 3196768)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3196721)
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
-- TOC entry 173 (class 1259 OID 3196304)
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
-- TOC entry 172 (class 1259 OID 3196302)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2694 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 3196664)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3196342)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3196326)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3196678)
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
-- TOC entry 203 (class 1259 OID 3196620)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3196570)
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
-- TOC entry 182 (class 1259 OID 3196402)
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
-- TOC entry 198 (class 1259 OID 3196576)
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
-- TOC entry 218 (class 1259 OID 3196756)
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
-- TOC entry 188 (class 1259 OID 3196472)
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
-- TOC entry 174 (class 1259 OID 3196313)
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
-- TOC entry 223 (class 1259 OID 3196810)
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
-- TOC entry 192 (class 1259 OID 3196518)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3196647)
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
-- TOC entry 214 (class 1259 OID 3196713)
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
-- TOC entry 194 (class 1259 OID 3196546)
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
-- TOC entry 222 (class 1259 OID 3196800)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3196703)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3196307)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2640 (class 0 OID 3196359)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2686 (class 0 OID 3196846)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 3196829)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3196740)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3196524)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3196565)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3196486)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5551-fd36-609c-d151e71ccb4e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5551-fd36-306e-e5e4735a2a31	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5551-fd36-9a83-5192cf255b0f	AL	ALB	008	Albania 	Albanija	\N
00040000-5551-fd36-99dd-6f627830342f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5551-fd36-0988-d05cd174f7ab	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5551-fd36-e74e-643777872e65	AD	AND	020	Andorra 	Andora	\N
00040000-5551-fd36-4254-075b1627501c	AO	AGO	024	Angola 	Angola	\N
00040000-5551-fd36-0f31-6b5806a4517e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5551-fd36-0c9d-d38b192625b8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5551-fd36-96c4-b0a0fc0dfe28	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-fd36-3cda-03acae31fa74	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5551-fd36-dd56-3d2acbc78726	AM	ARM	051	Armenia 	Armenija	\N
00040000-5551-fd36-43c3-bdd163180741	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5551-fd36-6d05-119040adb99b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5551-fd36-1a1e-835af12ff5a9	AT	AUT	040	Austria 	Avstrija	\N
00040000-5551-fd36-9529-5ae034cf3150	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5551-fd36-3038-08eec35d704d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5551-fd36-4ce0-f57860f48617	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5551-fd36-73c3-1295863604f1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5551-fd36-5325-10bed2c8e802	BB	BRB	052	Barbados 	Barbados	\N
00040000-5551-fd36-7f80-4bbfc03a6c75	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5551-fd36-f7a1-c5907e5eb11a	BE	BEL	056	Belgium 	Belgija	\N
00040000-5551-fd36-baaa-d801a3e392ca	BZ	BLZ	084	Belize 	Belize	\N
00040000-5551-fd36-eab5-1e180595c30c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5551-fd36-2b77-ff894f000b5f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5551-fd36-bac6-8a3af50a4081	BT	BTN	064	Bhutan 	Butan	\N
00040000-5551-fd36-d313-ac4c23e8285a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5551-fd36-d0c9-16104b4f3f84	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5551-fd36-c599-5466c73f91ce	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5551-fd36-a6cc-ec6837733e3e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5551-fd36-a6d9-c978d09dc80a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5551-fd36-741e-f8d4061cfb2c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5551-fd36-4b00-589cb7bbd0bc	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5551-fd36-a8d3-a17229a93509	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5551-fd36-539a-e9fee81cfe52	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5551-fd36-2b17-3444943a466c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5551-fd36-850f-a5d4c6405738	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5551-fd36-3e85-590f9489209b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5551-fd36-eaf6-1df1d885669c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5551-fd36-9d56-b46b90bb76c4	CA	CAN	124	Canada 	Kanada	\N
00040000-5551-fd36-d74b-e122b94bdced	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5551-fd36-6c7a-3f2b0f9b4fef	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5551-fd36-f58f-e13cd7333c96	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5551-fd36-98d3-13ede54ef7ae	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5551-fd36-1540-9edf88ccffb7	CL	CHL	152	Chile 	Čile	\N
00040000-5551-fd36-84a6-6bf58c0a3bf4	CN	CHN	156	China 	Kitajska	\N
00040000-5551-fd36-d0f3-8240d821a75c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5551-fd36-c6e4-9e15dc97c198	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5551-fd36-75a3-8e22abd75b9d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5551-fd36-d393-c8e5ab3af6da	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5551-fd36-402e-a32db7debc4f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5551-fd36-139d-c82ff41e99b1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5551-fd36-b60f-8aaddc0478c6	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5551-fd36-20e5-95a9021b3679	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5551-fd36-4454-1281895b4e92	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5551-fd36-348a-cce1785a1a86	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5551-fd36-81ac-d0837fd3db3a	CU	CUB	192	Cuba 	Kuba	\N
00040000-5551-fd36-f245-9d9a95a97b69	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5551-fd36-1276-f49d491890fd	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5551-fd36-77c5-9823462fa840	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5551-fd36-e8bd-c400039136b7	DK	DNK	208	Denmark 	Danska	\N
00040000-5551-fd36-acfe-fdd5e8d46c13	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5551-fd36-1bf4-507358b086b5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-fd36-3230-76bb4573a30c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5551-fd36-c25a-1ca4641718ea	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5551-fd36-7a63-c6b274423a29	EG	EGY	818	Egypt 	Egipt	\N
00040000-5551-fd36-5160-883c8611617d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5551-fd36-fc2e-6edbb7088e78	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5551-fd36-1a5e-999b792af4aa	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5551-fd36-0ded-5bcbb502e17a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5551-fd36-1527-ed57ab7858c0	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5551-fd36-d355-77c8164de50c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5551-fd36-bef6-b4ef34c3d099	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5551-fd36-88f4-3dd0f20b7356	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5551-fd36-1f7b-892af2311272	FI	FIN	246	Finland 	Finska	\N
00040000-5551-fd36-82c8-3f69ef136d8a	FR	FRA	250	France 	Francija	\N
00040000-5551-fd36-36bc-5394c2103cfc	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5551-fd36-1b99-6d2ad230cde0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5551-fd36-5e79-448ddf1ab628	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5551-fd36-fe3d-f77f7ca9b5c5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5551-fd36-cc37-2d2b06a91fa8	GA	GAB	266	Gabon 	Gabon	\N
00040000-5551-fd36-207f-52f9d6e366d3	GM	GMB	270	Gambia 	Gambija	\N
00040000-5551-fd36-4054-b07a328034d3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5551-fd36-5395-6d9106472b31	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5551-fd36-d414-ff9ff2fd0369	GH	GHA	288	Ghana 	Gana	\N
00040000-5551-fd36-6095-c756cdf95f38	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5551-fd36-fdc9-31a8e7290a48	GR	GRC	300	Greece 	Grčija	\N
00040000-5551-fd36-86d3-69bed04ff5b9	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5551-fd36-1edb-9e84ae7f777d	GD	GRD	308	Grenada 	Grenada	\N
00040000-5551-fd36-8020-e629ff342c1f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5551-fd36-d925-88b5f06147ec	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5551-fd36-45c4-2b486c79af97	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5551-fd36-a8c2-5be06a27512e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5551-fd36-3977-c872a7f9baad	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5551-fd36-3fc2-9aa868fe50b5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5551-fd36-44b0-703360591c53	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5551-fd36-f47e-c40242f484ba	HT	HTI	332	Haiti 	Haiti	\N
00040000-5551-fd36-4e7e-5afd4ddf6c2e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5551-fd36-5f2e-b70e22ba9031	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5551-fd36-4711-4bf0c88c2cef	HN	HND	340	Honduras 	Honduras	\N
00040000-5551-fd36-f740-52a1b71eca3e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5551-fd36-ac21-4a88ad7a50f9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5551-fd36-212a-f78f6e6b0a3a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5551-fd36-a593-d883d2c94ce1	IN	IND	356	India 	Indija	\N
00040000-5551-fd36-d989-ec95472611a7	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5551-fd36-092c-65b559fc2622	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5551-fd36-ad58-116c6929369a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5551-fd36-9f40-6fe053b50465	IE	IRL	372	Ireland 	Irska	\N
00040000-5551-fd36-e380-97da654901e4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5551-fd36-3da6-81281f9e5022	IL	ISR	376	Israel 	Izrael	\N
00040000-5551-fd36-b2a7-62eae2f9326b	IT	ITA	380	Italy 	Italija	\N
00040000-5551-fd36-286b-c84a59d9aad2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5551-fd36-6886-20cd8923796f	JP	JPN	392	Japan 	Japonska	\N
00040000-5551-fd36-abef-76bbd84a5f34	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5551-fd36-0c1f-fae5c1cacdb1	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5551-fd36-fe60-55de6c0966ec	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5551-fd36-5d48-b9267aa3a3bd	KE	KEN	404	Kenya 	Kenija	\N
00040000-5551-fd36-803c-9a0fd7c3b59c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5551-fd36-f2a9-7a4f66be70db	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5551-fd36-6b59-d76d73123492	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5551-fd36-98ce-6172c2a63bf4	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5551-fd36-395b-609d5a1226c5	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5551-fd36-64ec-37e7a748d01e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5551-fd36-b1d9-e2d861a7c81c	LV	LVA	428	Latvia 	Latvija	\N
00040000-5551-fd36-9e5b-00f516006352	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5551-fd36-178f-d5d7e18a385c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5551-fd36-11db-e83f7736f944	LR	LBR	430	Liberia 	Liberija	\N
00040000-5551-fd36-7f94-0627ae678b62	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5551-fd36-ac0c-992fd450c96c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5551-fd36-6fc9-70601f58c23b	LT	LTU	440	Lithuania 	Litva	\N
00040000-5551-fd36-f4a7-65d894f05d2e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5551-fd36-babc-887fab607c80	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5551-fd36-8de8-c1652e945d8b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5551-fd36-6a52-ba858c95d4ca	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5551-fd36-67c8-622811a731f2	MW	MWI	454	Malawi 	Malavi	\N
00040000-5551-fd36-736e-09b4f0c80af7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5551-fd36-b67e-fd1c49a5fac7	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5551-fd36-d535-7913e9a470e8	ML	MLI	466	Mali 	Mali	\N
00040000-5551-fd36-bb9e-22940e0aa9ef	MT	MLT	470	Malta 	Malta	\N
00040000-5551-fd36-cd6e-a9516a911910	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5551-fd36-023b-eb5f69779354	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5551-fd36-94fa-16ba1d7904be	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5551-fd36-7611-6a1ff3c55002	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5551-fd36-5550-783cf775acab	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5551-fd36-aa93-6cec1468d162	MX	MEX	484	Mexico 	Mehika	\N
00040000-5551-fd36-ccfa-61601b3769be	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5551-fd36-5432-5bd765b113b8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5551-fd36-110b-fb98966c430e	MC	MCO	492	Monaco 	Monako	\N
00040000-5551-fd36-863b-acabbe7b1444	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5551-fd36-95f8-b3158e76c42a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5551-fd36-0de4-08bfe889dd74	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5551-fd36-8804-27f55853f069	MA	MAR	504	Morocco 	Maroko	\N
00040000-5551-fd36-439a-5c98ce273565	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5551-fd36-e6d8-7b87b28dc2a5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5551-fd36-3468-72cb2944d591	NA	NAM	516	Namibia 	Namibija	\N
00040000-5551-fd36-50ec-a8f00b9e8350	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5551-fd36-9c51-fb40c0585263	NP	NPL	524	Nepal 	Nepal	\N
00040000-5551-fd36-6d4e-d25abf198f14	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5551-fd36-8d83-ec4a98d30fc4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5551-fd36-41c6-bd296dc2aac9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5551-fd36-48bf-d2fa1016f790	NE	NER	562	Niger 	Niger 	\N
00040000-5551-fd36-df1c-6cc0e9e690b8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5551-fd36-39d1-6b0949f14801	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5551-fd36-23e3-afeb20877b5c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5551-fd36-7fe8-2ac8b22699a6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5551-fd36-4191-427959481766	NO	NOR	578	Norway 	Norveška	\N
00040000-5551-fd36-835f-3be562c94746	OM	OMN	512	Oman 	Oman	\N
00040000-5551-fd36-bdb8-ae047511629e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5551-fd36-ad4a-bf33145c2067	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5551-fd36-bedd-ae3922e3a7c0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5551-fd36-2dd7-df4c516b78d9	PA	PAN	591	Panama 	Panama	\N
00040000-5551-fd36-e7ea-997b4d07503c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5551-fd36-c5c2-d5ff5507af24	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5551-fd36-b56b-e2bba5f597d0	PE	PER	604	Peru 	Peru	\N
00040000-5551-fd36-3ca1-ecbcce16afcc	PH	PHL	608	Philippines 	Filipini	\N
00040000-5551-fd36-c4ae-fcd8cf7603d3	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5551-fd36-fe7d-2d82fecf4e20	PL	POL	616	Poland 	Poljska	\N
00040000-5551-fd36-16c7-02cbd61fd9f4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5551-fd36-3ea1-6b48f322cadc	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5551-fd36-fb77-89924da9977c	QA	QAT	634	Qatar 	Katar	\N
00040000-5551-fd36-51cc-7b4c3993580e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5551-fd36-9b78-b67439139b61	RO	ROU	642	Romania 	Romunija	\N
00040000-5551-fd36-d1d4-5b86483d21c0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5551-fd36-d91e-5708c2c23fe9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5551-fd36-85cf-a5c062761870	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5551-fd36-648c-4a036e68acce	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5551-fd36-365e-ae26764ac4bb	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5551-fd36-7dfe-1352adebf76e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5551-fd36-ed8e-63c81a1cc65f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5551-fd36-9227-d682e5ac27bc	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5551-fd36-975d-9b1775ed2fe9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5551-fd36-7f3a-f9f17ca4172f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5551-fd36-71d5-0257dc695acd	SM	SMR	674	San Marino 	San Marino	\N
00040000-5551-fd36-dc04-9be917b1d2ab	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5551-fd36-c29f-3b04d7601068	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5551-fd36-a792-53ce773d1be8	SN	SEN	686	Senegal 	Senegal	\N
00040000-5551-fd36-bd68-25a7163c3f67	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5551-fd36-142a-5b31b2279294	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5551-fd36-c764-6d114c76a877	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5551-fd36-758b-26bf38816313	SG	SGP	702	Singapore 	Singapur	\N
00040000-5551-fd36-e28d-183cc2fb8939	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5551-fd36-d07b-c35023cfb072	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5551-fd36-010f-39a575bffb63	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5551-fd36-7106-ec2ebd615cef	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5551-fd36-96dd-6b3386763999	SO	SOM	706	Somalia 	Somalija	\N
00040000-5551-fd36-8337-a041a75235ef	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5551-fd36-65d0-1fa3ae9a5372	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5551-fd36-8004-78827516146b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5551-fd36-64f9-85d964f46473	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5551-fd36-4488-5d7c1995b110	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5551-fd36-7d4f-2758d70d211b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5551-fd36-65c6-a3e6d9af0eb8	SR	SUR	740	Suriname 	Surinam	\N
00040000-5551-fd36-79c7-2f570e1fab7e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5551-fd36-9570-e40cc87264bb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5551-fd36-ea7d-4df2a105c0df	SE	SWE	752	Sweden 	Švedska	\N
00040000-5551-fd36-5984-35eefc105a2a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5551-fd36-2a13-071bf99c28d0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5551-fd36-7afa-0cbc2861b382	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5551-fd36-77a9-5f091445ed03	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5551-fd36-65da-f1712a4c4f35	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5551-fd36-522c-6303f36de8aa	TH	THA	764	Thailand 	Tajska	\N
00040000-5551-fd36-8195-71451a44c0a1	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5551-fd36-951b-2c98e85d9644	TG	TGO	768	Togo 	Togo	\N
00040000-5551-fd36-9fae-928c6bf0ee19	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5551-fd36-cb6a-3952207e8dc3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5551-fd36-c4e5-d6bf81de806d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5551-fd36-f0f6-ee703d97639e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5551-fd36-f353-208cc7378908	TR	TUR	792	Turkey 	Turčija	\N
00040000-5551-fd36-5a7a-349381b580a0	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5551-fd36-abbc-9b6d15a41c00	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-fd36-7925-659d277a6c74	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5551-fd36-0a2d-29c3644d70ae	UG	UGA	800	Uganda 	Uganda	\N
00040000-5551-fd36-bece-0f2f5b4aa1e2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5551-fd36-8332-d9c7afb2e658	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5551-fd36-54d7-004dd4a71133	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5551-fd36-5873-53857d352055	US	USA	840	United States 	Združene države Amerike	\N
00040000-5551-fd36-245e-0267588c7fa5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5551-fd36-99e1-91260620512c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5551-fd36-987b-471cb4597c01	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5551-fd36-0768-519a2fcc24d4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5551-fd36-49c2-28eea4ca7503	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5551-fd36-1a04-82df2fc81312	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5551-fd36-7df1-8bad60765914	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-fd36-87c0-6b78018dd446	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5551-fd36-ab4d-28ecf01e8499	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5551-fd36-0392-5c32b1d9bf5e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5551-fd36-1902-f302623fd1b1	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5551-fd36-a6dc-ec73e3b72d12	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5551-fd36-1b6e-3535b6aee8d8	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2673 (class 0 OID 3196690)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3196511)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3196559)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3196608)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3196633)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3196460)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5551-fd36-f5ab-582598263165	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5551-fd36-e391-b05ff0c90bfe	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5551-fd36-9009-f7bb61ff86df	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5551-fd36-ed3d-bd52fc363d6e	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5551-fd36-68c9-10bdc8340b65	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5551-fd36-a6d3-6362aff06721	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5551-fd36-170c-e13044383520	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5551-fd36-0e65-394a1d2d3019	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5551-fd36-159c-7b92e3fb7f07	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5551-fd36-e793-71d0b754271b	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2641 (class 0 OID 3196368)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5551-fd36-8646-aae7d948a671	00000000-5551-fd36-68c9-10bdc8340b65	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5551-fd36-131e-f72dd6b32a15	00000000-5551-fd36-68c9-10bdc8340b65	00010000-5551-fd36-1b85-e6c2033d61de	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5551-fd36-7874-a2d010d11c7c	00000000-5551-fd36-a6d3-6362aff06721	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2642 (class 0 OID 3196379)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3196430)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 3196333)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5551-fd36-49ed-f5794fdeae9a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5551-fd36-5f13-56f961b3918e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5551-fd36-8d18-4ca866c7d9cf	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5551-fd36-e12c-199fbb8f73eb	Abonma-read	Abonma - branje	f
00030000-5551-fd36-ecee-edda52bbf96d	Abonma-write	Abonma - spreminjanje	f
00030000-5551-fd36-71f6-7ff41ee54aec	Alternacija-read	Alternacija - branje	f
00030000-5551-fd36-c690-ae9cb57b4d11	Alternacija-write	Alternacija - spreminjanje	f
00030000-5551-fd36-a1dd-4f1d29affdd5	Arhivalija-read	Arhivalija - branje	f
00030000-5551-fd36-5742-0b194f0d1d48	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5551-fd36-5893-8e29784de543	Besedilo-read	Besedilo - branje	f
00030000-5551-fd36-9fe7-53247aee31dc	Besedilo-write	Besedilo - spreminjanje	f
00030000-5551-fd36-3222-6143a6e3fff9	DogodekIzven-read	DogodekIzven - branje	f
00030000-5551-fd36-93e5-f5e252f48fab	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5551-fd36-28b8-f0442aaefeb2	Dogodek-read	Dogodek - branje	f
00030000-5551-fd36-2bd4-21c4bfe4246f	Dogodek-write	Dogodek - spreminjanje	f
00030000-5551-fd36-0256-35a4637c58a8	Drzava-read	Drzava - branje	f
00030000-5551-fd36-1573-8946cc1ad909	Drzava-write	Drzava - spreminjanje	f
00030000-5551-fd36-8eed-9a67963a2d5e	Funkcija-read	Funkcija - branje	f
00030000-5551-fd36-741e-688123940bd9	Funkcija-write	Funkcija - spreminjanje	f
00030000-5551-fd36-48e1-7b7ec5dfa716	Gostovanje-read	Gostovanje - branje	f
00030000-5551-fd36-2b7d-1f7721b19296	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5551-fd36-dd44-191ec535db8f	Gostujoca-read	Gostujoca - branje	f
00030000-5551-fd36-6210-652dec8a8a15	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5551-fd36-91cc-62411fd2a927	Kupec-read	Kupec - branje	f
00030000-5551-fd36-2b5c-775aa37aef47	Kupec-write	Kupec - spreminjanje	f
00030000-5551-fd36-e1e9-c179f93e92a6	NacinPlacina-read	NacinPlacina - branje	f
00030000-5551-fd36-bb43-3ae58e102894	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5551-fd36-0088-6df6b8a9b22e	Option-read	Option - branje	f
00030000-5551-fd36-d660-6a80b292c54d	Option-write	Option - spreminjanje	f
00030000-5551-fd36-5239-5f602327e69a	OptionValue-read	OptionValue - branje	f
00030000-5551-fd36-1b9a-d4908cb3652d	OptionValue-write	OptionValue - spreminjanje	f
00030000-5551-fd36-99ae-11c868bbf3dd	Oseba-read	Oseba - branje	f
00030000-5551-fd36-3c7e-05f526274e77	Oseba-write	Oseba - spreminjanje	f
00030000-5551-fd36-99dd-66174c158119	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5551-fd36-786c-f6379c0f411f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5551-fd36-8980-58fb8c29c1e6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5551-fd36-6ae2-d0e69dfd8391	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5551-fd36-fcce-803047df15b6	Pogodba-read	Pogodba - branje	f
00030000-5551-fd36-9a80-148cc0265add	Pogodba-write	Pogodba - spreminjanje	f
00030000-5551-fd36-544b-16d4932d238b	Popa-read	Popa - branje	f
00030000-5551-fd36-a6b4-fbdfed8a3ae0	Popa-write	Popa - spreminjanje	f
00030000-5551-fd36-2b7d-c66d22108362	Posta-read	Posta - branje	f
00030000-5551-fd36-8efe-048dec56a1e3	Posta-write	Posta - spreminjanje	f
00030000-5551-fd36-bf98-e1c037770326	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5551-fd36-0cd0-bc0d093ce8be	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5551-fd36-8e58-401a8a1bc96b	PostniNaslov-read	PostniNaslov - branje	f
00030000-5551-fd36-a18a-3cc526a29fe8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5551-fd36-b5ab-6ab2319e0890	Predstava-read	Predstava - branje	f
00030000-5551-fd36-de3c-3c803b242ba2	Predstava-write	Predstava - spreminjanje	f
00030000-5551-fd36-a85e-009c2e62d5e9	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5551-fd36-aaf2-31fa12415f81	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5551-fd36-d266-45145b71fec8	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5551-fd36-402f-9273e0531ce5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5551-fd36-499d-e8a21a449e82	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5551-fd36-6840-0d465bd3ee54	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5551-fd36-a3d6-2931dcd797f9	Prostor-read	Prostor - branje	f
00030000-5551-fd36-4d77-3f9f7ca47798	Prostor-write	Prostor - spreminjanje	f
00030000-5551-fd36-e2b9-5fb30d44d4ab	Racun-read	Racun - branje	f
00030000-5551-fd36-531e-85742f463cb2	Racun-write	Racun - spreminjanje	f
00030000-5551-fd36-0081-0d90ac750ae3	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5551-fd36-755d-1eb393e6371f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5551-fd36-9777-e9c438fd6246	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5551-fd36-6557-6c12f80dcfd5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5551-fd36-619d-6e9aac6692c6	Rekvizit-read	Rekvizit - branje	f
00030000-5551-fd36-3347-250f67a481c1	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5551-fd36-01f3-70a0a25755e6	Rezervacija-read	Rezervacija - branje	f
00030000-5551-fd36-3b41-8834f6c53caa	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5551-fd36-f256-e14bac4e3ddd	SedezniRed-read	SedezniRed - branje	f
00030000-5551-fd36-bdb3-c642784002ae	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5551-fd36-a5d1-bad2529ec37e	Sedez-read	Sedez - branje	f
00030000-5551-fd36-1946-82225e4808ed	Sedez-write	Sedez - spreminjanje	f
00030000-5551-fd36-6004-c7a4bd133cff	Sezona-read	Sezona - branje	f
00030000-5551-fd36-e24c-7259d6a9b7d2	Sezona-write	Sezona - spreminjanje	f
00030000-5551-fd36-d44e-f0cfa6860191	Telefonska-read	Telefonska - branje	f
00030000-5551-fd36-708d-c692d3b7ff5b	Telefonska-write	Telefonska - spreminjanje	f
00030000-5551-fd36-605f-6a87b21b6e94	TerminStoritve-read	TerminStoritve - branje	f
00030000-5551-fd36-e86d-4a880b2ea405	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5551-fd36-6847-111b1fcb4f37	TipFunkcije-read	TipFunkcije - branje	f
00030000-5551-fd36-d844-2813b273c3ee	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5551-fd36-6161-5ff3c0b20a22	Trr-read	Trr - branje	f
00030000-5551-fd36-baa1-ffcf129f6e0a	Trr-write	Trr - spreminjanje	f
00030000-5551-fd36-689b-3eb53d78c3c3	Uprizoritev-read	Uprizoritev - branje	f
00030000-5551-fd36-9176-9a8ae3bbf73b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5551-fd36-fc58-4c5010c37c0f	Vaja-read	Vaja - branje	f
00030000-5551-fd36-58b4-ba4795bd428d	Vaja-write	Vaja - spreminjanje	f
00030000-5551-fd36-91b3-543dead0b402	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5551-fd36-047f-8e9e483734bc	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5551-fd36-2e92-79f99d5480c0	Zaposlitev-read	Zaposlitev - branje	f
00030000-5551-fd36-fe80-a5e7b73b2738	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5551-fd36-9fb8-36a408df257b	Zasedenost-read	Zasedenost - branje	f
00030000-5551-fd36-e3fa-2f8b75d499dd	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5551-fd36-d9fb-60562382892c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5551-fd36-7001-c5e2b6b68ce8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5551-fd36-e9a1-0cb9fae24106	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5551-fd36-4f1f-f32916fa9c68	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2639 (class 0 OID 3196352)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5551-fd36-ca7d-1d0c400d57e9	00030000-5551-fd36-0256-35a4637c58a8
00020000-5551-fd36-46c2-0120ef3c4d57	00030000-5551-fd36-1573-8946cc1ad909
00020000-5551-fd36-46c2-0120ef3c4d57	00030000-5551-fd36-0256-35a4637c58a8
\.


--
-- TOC entry 2667 (class 0 OID 3196640)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3196670)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3196785)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3196410)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3196452)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5551-fd36-5479-65f1a107836e	8341	Adlešiči
00050000-5551-fd36-00bc-9397ddbbd997	5270	Ajdovščina
00050000-5551-fd36-d450-cf8e0c870d61	6280	Ankaran/Ancarano
00050000-5551-fd36-73cb-ba43f5b2881b	9253	Apače
00050000-5551-fd36-b3f6-8bf3d437008f	8253	Artiče
00050000-5551-fd36-4f24-70bcd5ab8173	4275	Begunje na Gorenjskem
00050000-5551-fd36-7c10-4a439204d606	1382	Begunje pri Cerknici
00050000-5551-fd36-b041-d5668e2e56a2	9231	Beltinci
00050000-5551-fd36-e0c7-ad73ab216358	2234	Benedikt
00050000-5551-fd36-8e9c-ba9486ebb43a	2345	Bistrica ob Dravi
00050000-5551-fd36-94aa-e8249577e930	3256	Bistrica ob Sotli
00050000-5551-fd36-8596-e927cb68a618	8259	Bizeljsko
00050000-5551-fd36-8c0f-d536537bee2b	1223	Blagovica
00050000-5551-fd36-41f1-d9c04dca6cef	8283	Blanca
00050000-5551-fd36-7618-83bb6e1d854b	4260	Bled
00050000-5551-fd36-4e63-9cb58394f2bc	4273	Blejska Dobrava
00050000-5551-fd36-7b80-648efc9005f1	9265	Bodonci
00050000-5551-fd36-f181-761208d088ed	9222	Bogojina
00050000-5551-fd36-1ad3-2d89dabcd093	4263	Bohinjska Bela
00050000-5551-fd36-e8e9-7e7c4c395645	4264	Bohinjska Bistrica
00050000-5551-fd36-1928-e0bbcc1bff7f	4265	Bohinjsko jezero
00050000-5551-fd36-bcd2-1991fe918c65	1353	Borovnica
00050000-5551-fd36-176e-c5902ee3234e	8294	Boštanj
00050000-5551-fd36-701d-a1320c6d0512	5230	Bovec
00050000-5551-fd36-4378-968be5fb9289	5295	Branik
00050000-5551-fd36-ab6a-e381b5cf0085	3314	Braslovče
00050000-5551-fd36-d177-5b53495016d5	5223	Breginj
00050000-5551-fd36-6077-dc4001dba608	8280	Brestanica
00050000-5551-fd36-d40d-73d0c354900b	2354	Bresternica
00050000-5551-fd36-d8d0-07e3931149ee	4243	Brezje
00050000-5551-fd36-b804-2e11f65ab9e5	1351	Brezovica pri Ljubljani
00050000-5551-fd36-a7ca-d8938d3184a8	8250	Brežice
00050000-5551-fd36-fdcd-58de0d202fab	4210	Brnik - Aerodrom
00050000-5551-fd36-8ec5-ef5142605918	8321	Brusnice
00050000-5551-fd36-0099-d3c4780a32bd	3255	Buče
00050000-5551-fd36-aa1d-4c5f725e1433	8276	Bučka 
00050000-5551-fd36-3b18-1a313f934430	9261	Cankova
00050000-5551-fd36-c346-f2005e9247d1	3000	Celje 
00050000-5551-fd36-01f0-3bb0105c5de2	3001	Celje - poštni predali
00050000-5551-fd36-3f2c-88f30237dbf7	4207	Cerklje na Gorenjskem
00050000-5551-fd36-90af-13a9da4c0a1d	8263	Cerklje ob Krki
00050000-5551-fd36-16a8-e650e62a9be0	1380	Cerknica
00050000-5551-fd36-b952-04be107d6428	5282	Cerkno
00050000-5551-fd36-01cb-994a021d3657	2236	Cerkvenjak
00050000-5551-fd36-2980-2f23f0385e9e	2215	Ceršak
00050000-5551-fd36-2c86-bfa54f8cdf15	2326	Cirkovce
00050000-5551-fd36-b285-d45a8e8c3a84	2282	Cirkulane
00050000-5551-fd36-97f3-749840b45105	5273	Col
00050000-5551-fd36-6d92-cce08c479929	8251	Čatež ob Savi
00050000-5551-fd36-bb4a-e92d0270ffc1	1413	Čemšenik
00050000-5551-fd36-3afd-b83d46db9ccf	5253	Čepovan
00050000-5551-fd36-62ac-458ec2338759	9232	Črenšovci
00050000-5551-fd36-6683-53edafa7b05b	2393	Črna na Koroškem
00050000-5551-fd36-2f98-9ced0afb1baa	6275	Črni Kal
00050000-5551-fd36-9b09-94a36fbd6d89	5274	Črni Vrh nad Idrijo
00050000-5551-fd36-9295-73d37e0d5cfc	5262	Črniče
00050000-5551-fd36-9748-558d4f417d92	8340	Črnomelj
00050000-5551-fd36-d44d-86de70628146	6271	Dekani
00050000-5551-fd36-d42d-2b721507d70c	5210	Deskle
00050000-5551-fd36-485b-57d559725b6d	2253	Destrnik
00050000-5551-fd36-841f-01a730dca4c7	6215	Divača
00050000-5551-fd36-dc48-5423903b543e	1233	Dob
00050000-5551-fd36-f2fb-565732d15d40	3224	Dobje pri Planini
00050000-5551-fd36-1195-37aa59795694	8257	Dobova
00050000-5551-fd36-c51c-30a340563648	1423	Dobovec
00050000-5551-fd36-1312-9a645abd5adc	5263	Dobravlje
00050000-5551-fd36-e897-c4abc956fa79	3204	Dobrna
00050000-5551-fd36-c25a-971488c04a82	8211	Dobrnič
00050000-5551-fd36-1661-b37c07d5f2d6	1356	Dobrova
00050000-5551-fd36-096d-a3816f3147f3	9223	Dobrovnik/Dobronak 
00050000-5551-fd36-d2e6-a2465fe3f42d	5212	Dobrovo v Brdih
00050000-5551-fd36-8be3-1562faa256ef	1431	Dol pri Hrastniku
00050000-5551-fd36-213b-cd0943a89b57	1262	Dol pri Ljubljani
00050000-5551-fd36-6ac9-642fe1b4f157	1273	Dole pri Litiji
00050000-5551-fd36-fbd6-255c157881d3	1331	Dolenja vas
00050000-5551-fd36-fffa-aa1140b83829	8350	Dolenjske Toplice
00050000-5551-fd36-a745-00587417bad0	1230	Domžale
00050000-5551-fd36-f8fa-d7709acb718c	2252	Dornava
00050000-5551-fd36-7e71-eb283274ff60	5294	Dornberk
00050000-5551-fd36-0d2c-b093357ef9b5	1319	Draga
00050000-5551-fd36-0c35-450542d433b1	8343	Dragatuš
00050000-5551-fd36-76c0-88beb80a334b	3222	Dramlje
00050000-5551-fd36-6029-dffb83765f74	2370	Dravograd
00050000-5551-fd36-d91a-36cf9493089c	4203	Duplje
00050000-5551-fd36-e287-6ab618ec3723	6221	Dutovlje
00050000-5551-fd36-5919-a992fe22d309	8361	Dvor
00050000-5551-fd36-781c-ba105bf0838c	2343	Fala
00050000-5551-fd36-8313-dafb14bca7c2	9208	Fokovci
00050000-5551-fd36-896f-7545d87065df	2313	Fram
00050000-5551-fd36-9ae9-01853cc78266	3213	Frankolovo
00050000-5551-fd36-98b8-54a701d0d8b3	1274	Gabrovka
00050000-5551-fd36-6b1a-13b6bba09b40	8254	Globoko
00050000-5551-fd36-75f8-dd9086a8c7ae	5275	Godovič
00050000-5551-fd36-281e-ff2db5e8be0d	4204	Golnik
00050000-5551-fd36-0f6b-2af22363f8cd	3303	Gomilsko
00050000-5551-fd36-0f33-2f397356027a	4224	Gorenja vas
00050000-5551-fd36-7d7c-8ca6c86f2206	3263	Gorica pri Slivnici
00050000-5551-fd36-3d88-bb1f9cf9d180	2272	Gorišnica
00050000-5551-fd36-028a-b01784c60ae2	9250	Gornja Radgona
00050000-5551-fd36-1525-ad6013be8780	3342	Gornji Grad
00050000-5551-fd36-cfa6-c8b929385b17	4282	Gozd Martuljek
00050000-5551-fd36-e575-ab3a7694a777	6272	Gračišče
00050000-5551-fd36-a9ae-753c7ca55185	9264	Grad
00050000-5551-fd36-13b4-d5c6e6b30ee8	8332	Gradac
00050000-5551-fd36-2db9-731e0d0b348b	1384	Grahovo
00050000-5551-fd36-bcb4-c28d7172204c	5242	Grahovo ob Bači
00050000-5551-fd36-09d7-5a05ffbf2020	5251	Grgar
00050000-5551-fd36-ce60-a11df2b79f2c	3302	Griže
00050000-5551-fd36-093a-4af4c0ccba40	3231	Grobelno
00050000-5551-fd36-96f9-54f4b47d840c	1290	Grosuplje
00050000-5551-fd36-3e15-db5d4046eb60	2288	Hajdina
00050000-5551-fd36-f297-ccc8334dc57b	8362	Hinje
00050000-5551-fd36-5fc7-5b69912b4e83	2311	Hoče
00050000-5551-fd36-2156-976eee38afac	9205	Hodoš/Hodos
00050000-5551-fd36-5f6b-1d09e1d2c539	1354	Horjul
00050000-5551-fd36-1455-c7897867e888	1372	Hotedršica
00050000-5551-fd36-7242-7401dbe7093e	1430	Hrastnik
00050000-5551-fd36-1abb-b0f69c801069	6225	Hruševje
00050000-5551-fd36-05c8-ff57d44d33cd	4276	Hrušica
00050000-5551-fd36-3fad-e4fb9708b4f4	5280	Idrija
00050000-5551-fd36-59b3-746793ed29c5	1292	Ig
00050000-5551-fd36-ac5c-7f122082c13d	6250	Ilirska Bistrica
00050000-5551-fd36-7ea0-46f0e7683869	6251	Ilirska Bistrica-Trnovo
00050000-5551-fd36-aed8-8a2097ae2c8d	1295	Ivančna Gorica
00050000-5551-fd36-e60e-74344928f3e0	2259	Ivanjkovci
00050000-5551-fd36-ca08-bd97f79a4b08	1411	Izlake
00050000-5551-fd36-a37e-e3255ed3b8f9	6310	Izola/Isola
00050000-5551-fd36-b0de-fdf387de74bb	2222	Jakobski Dol
00050000-5551-fd36-1f4e-e6fead378f5b	2221	Jarenina
00050000-5551-fd36-28e7-d87802298052	6254	Jelšane
00050000-5551-fd36-8361-76197b3a74f1	4270	Jesenice
00050000-5551-fd36-c868-482ec314a323	8261	Jesenice na Dolenjskem
00050000-5551-fd36-4ba1-a23ac6eccd82	3273	Jurklošter
00050000-5551-fd36-d491-e66e51ea497a	2223	Jurovski Dol
00050000-5551-fd36-91b3-7792dee1ce72	2256	Juršinci
00050000-5551-fd36-b763-02fe507032c4	5214	Kal nad Kanalom
00050000-5551-fd36-53b1-abefaf79a73b	3233	Kalobje
00050000-5551-fd36-297c-cafaac3ae963	4246	Kamna Gorica
00050000-5551-fd36-d640-ae827695a195	2351	Kamnica
00050000-5551-fd36-dbf0-d78e84360a3f	1241	Kamnik
00050000-5551-fd36-003b-eadb4c889607	5213	Kanal
00050000-5551-fd36-9e6d-68d4fa5410b3	8258	Kapele
00050000-5551-fd36-8888-6ce00a44112e	2362	Kapla
00050000-5551-fd36-0298-3e184c2d02c2	2325	Kidričevo
00050000-5551-fd36-a304-500c206926f2	1412	Kisovec
00050000-5551-fd36-6b0f-029170bc41be	6253	Knežak
00050000-5551-fd36-0a7b-0f35c2d955e8	5222	Kobarid
00050000-5551-fd36-f44f-3e44e677f986	9227	Kobilje
00050000-5551-fd36-54dd-515729f7609c	1330	Kočevje
00050000-5551-fd36-6374-623403ab4db8	1338	Kočevska Reka
00050000-5551-fd36-ad5f-8a7a3ed6715b	2276	Kog
00050000-5551-fd36-1dde-e78ea5bac1e1	5211	Kojsko
00050000-5551-fd36-7c1d-93bea89240a0	6223	Komen
00050000-5551-fd36-f76a-f013580b7408	1218	Komenda
00050000-5551-fd36-af7f-7d364760be39	6000	Koper/Capodistria 
00050000-5551-fd36-ddf0-4ae0214061e9	6001	Koper/Capodistria - poštni predali
00050000-5551-fd36-09d5-0aea9261c5af	8282	Koprivnica
00050000-5551-fd36-3935-4145e0f0fb65	5296	Kostanjevica na Krasu
00050000-5551-fd36-bef3-791f4b15d932	8311	Kostanjevica na Krki
00050000-5551-fd36-cd12-138a901920de	1336	Kostel
00050000-5551-fd36-f94b-a8fbd98aaa43	6256	Košana
00050000-5551-fd36-7d16-24a0284a2a15	2394	Kotlje
00050000-5551-fd36-7d4c-521afe171a08	6240	Kozina
00050000-5551-fd36-821a-3387995faaee	3260	Kozje
00050000-5551-fd36-29bb-c9068be5123c	4000	Kranj 
00050000-5551-fd36-fe6f-04ff46f8b2d8	4001	Kranj - poštni predali
00050000-5551-fd36-b879-602dc29dbe94	4280	Kranjska Gora
00050000-5551-fd36-9daf-20259d802820	1281	Kresnice
00050000-5551-fd36-7f0a-7b2872a5b79a	4294	Križe
00050000-5551-fd36-2ee0-b7dedff32db7	9206	Križevci
00050000-5551-fd36-d6f0-92318f6674f3	9242	Križevci pri Ljutomeru
00050000-5551-fd36-ae9c-b79fa700030c	1301	Krka
00050000-5551-fd36-f5c7-2ba12fa39a4f	8296	Krmelj
00050000-5551-fd36-f0ce-6281d607aaef	4245	Kropa
00050000-5551-fd36-230e-2e512f82fca3	8262	Krška vas
00050000-5551-fd36-76c1-8fb0fe8c0d65	8270	Krško
00050000-5551-fd36-a9e6-595d9ee41c35	9263	Kuzma
00050000-5551-fd36-9b18-176e6a015aaf	2318	Laporje
00050000-5551-fd36-c034-cddef7cc56e5	3270	Laško
00050000-5551-fd36-5843-d3037ffc3f23	1219	Laze v Tuhinju
00050000-5551-fd36-e398-d65bd9b72be4	2230	Lenart v Slovenskih goricah
00050000-5551-fd36-90e8-84dd1cc23a4d	9220	Lendava/Lendva
00050000-5551-fd36-1fa7-4769d876c336	4248	Lesce
00050000-5551-fd36-819b-497f388e924b	3261	Lesično
00050000-5551-fd36-ea0e-b4122ef372ee	8273	Leskovec pri Krškem
00050000-5551-fd36-ac5f-165b30e7ad96	2372	Libeliče
00050000-5551-fd36-2be5-c64b226e1fb7	2341	Limbuš
00050000-5551-fd36-2976-c026b8f7ee38	1270	Litija
00050000-5551-fd36-c4ce-55af8a6ead2a	3202	Ljubečna
00050000-5551-fd36-d660-942c41ee3d93	1000	Ljubljana 
00050000-5551-fd36-6c30-4ea78833da70	1001	Ljubljana - poštni predali
00050000-5551-fd36-78ec-ac69d59b51cc	1231	Ljubljana - Črnuče
00050000-5551-fd36-1c4e-951435663896	1261	Ljubljana - Dobrunje
00050000-5551-fd36-c90f-1f4548925b62	1260	Ljubljana - Polje
00050000-5551-fd36-eab3-9c52cfd8f6dc	1210	Ljubljana - Šentvid
00050000-5551-fd36-b0a9-ef6230965be8	1211	Ljubljana - Šmartno
00050000-5551-fd36-39f8-5f7c84296e7c	3333	Ljubno ob Savinji
00050000-5551-fd36-5f4b-e95927ce5b1b	9240	Ljutomer
00050000-5551-fd36-5509-b33368deb263	3215	Loče
00050000-5551-fd36-b92e-1cb873827097	5231	Log pod Mangartom
00050000-5551-fd36-6690-63aae96b2588	1358	Log pri Brezovici
00050000-5551-fd36-af22-79cd5875e3d2	1370	Logatec
00050000-5551-fd36-05f2-7daef2ffe819	1371	Logatec
00050000-5551-fd36-12a8-565fc2e3923f	1434	Loka pri Zidanem Mostu
00050000-5551-fd36-991a-9b71464e3d3a	3223	Loka pri Žusmu
00050000-5551-fd36-c407-bb810212709e	6219	Lokev
00050000-5551-fd36-13cd-6cbdd201138d	1318	Loški Potok
00050000-5551-fd36-7c4c-2ac5f4e73c65	2324	Lovrenc na Dravskem polju
00050000-5551-fd36-7d66-a95c04233a3b	2344	Lovrenc na Pohorju
00050000-5551-fd36-8d36-9b1c8db2f183	3334	Luče
00050000-5551-fd36-1a97-91a7874c2183	1225	Lukovica
00050000-5551-fd36-a1cd-a9c8277679e2	9202	Mačkovci
00050000-5551-fd36-4be4-c8832ee95cf1	2322	Majšperk
00050000-5551-fd36-5ccb-36b710516f33	2321	Makole
00050000-5551-fd36-9cf8-eb5e34b21058	9243	Mala Nedelja
00050000-5551-fd36-b579-3190b9919d0d	2229	Malečnik
00050000-5551-fd36-73a2-dc28dce3668a	6273	Marezige
00050000-5551-fd36-1c8b-b75eadc7b7b6	2000	Maribor 
00050000-5551-fd36-7174-479e6ed22a6b	2001	Maribor - poštni predali
00050000-5551-fd36-07ee-8a6201eb1c39	2206	Marjeta na Dravskem polju
00050000-5551-fd36-8ea3-8c7b883dfb96	2281	Markovci
00050000-5551-fd36-4d0f-6634b7be0cf3	9221	Martjanci
00050000-5551-fd36-c759-d16615ebef5a	6242	Materija
00050000-5551-fd36-9d4b-aa450e1d342b	4211	Mavčiče
00050000-5551-fd36-1b15-43bffd58fb74	1215	Medvode
00050000-5551-fd36-5984-0c7a74b0b34f	1234	Mengeš
00050000-5551-fd36-09ed-843b0686e49d	8330	Metlika
00050000-5551-fd36-1358-9754309c4a6f	2392	Mežica
00050000-5551-fd36-4227-8542569fdfec	2204	Miklavž na Dravskem polju
00050000-5551-fd36-4168-89952cc30ef7	2275	Miklavž pri Ormožu
00050000-5551-fd36-70a0-ddb80bbbbd26	5291	Miren
00050000-5551-fd36-69f9-1dd91adc9f14	8233	Mirna
00050000-5551-fd36-93ca-541a6ad65f75	8216	Mirna Peč
00050000-5551-fd36-4be3-940b3986f24d	2382	Mislinja
00050000-5551-fd36-6b2f-5b4d57a755f4	4281	Mojstrana
00050000-5551-fd36-e96d-b3f176660c15	8230	Mokronog
00050000-5551-fd36-0253-980ded16cec9	1251	Moravče
00050000-5551-fd36-fdf4-f1fb8e634b04	9226	Moravske Toplice
00050000-5551-fd36-4527-4abf111d9e7d	5216	Most na Soči
00050000-5551-fd36-f093-b267207d04a5	1221	Motnik
00050000-5551-fd36-59b0-f3d7d6cadfa1	3330	Mozirje
00050000-5551-fd36-3c6f-6dc51481cc1a	9000	Murska Sobota 
00050000-5551-fd36-1f25-9fdcaab11748	9001	Murska Sobota - poštni predali
00050000-5551-fd36-87b7-69e384bfcbca	2366	Muta
00050000-5551-fd36-7524-33c2062441b7	4202	Naklo
00050000-5551-fd36-21db-3691b37ddbdd	3331	Nazarje
00050000-5551-fd36-968b-e7dacd986124	1357	Notranje Gorice
00050000-5551-fd36-7476-332df1a15dda	3203	Nova Cerkev
00050000-5551-fd36-7326-8b55a07459fe	5000	Nova Gorica 
00050000-5551-fd36-34ae-aa3105091b53	5001	Nova Gorica - poštni predali
00050000-5551-fd36-9062-ae76714769ac	1385	Nova vas
00050000-5551-fd36-9d90-612fc8a4f81d	8000	Novo mesto
00050000-5551-fd36-2e72-c39909215e13	8001	Novo mesto - poštni predali
00050000-5551-fd36-c2e4-dfe20ec91abf	6243	Obrov
00050000-5551-fd36-5747-7918aefe4477	9233	Odranci
00050000-5551-fd36-4f48-8df9ade256ff	2317	Oplotnica
00050000-5551-fd36-3c6d-ab3ffa6d73a0	2312	Orehova vas
00050000-5551-fd36-af3d-a0ff967bac53	2270	Ormož
00050000-5551-fd36-75c0-223e9e930dc0	1316	Ortnek
00050000-5551-fd36-363f-7c08bff53de7	1337	Osilnica
00050000-5551-fd36-56c0-c76d9b65567e	8222	Otočec
00050000-5551-fd36-d26b-46391ad6204e	2361	Ožbalt
00050000-5551-fd36-0519-4a346c2aefc9	2231	Pernica
00050000-5551-fd36-5691-01812215beb4	2211	Pesnica pri Mariboru
00050000-5551-fd36-6c69-89b730757158	9203	Petrovci
00050000-5551-fd36-a48b-7b5cb9de397c	3301	Petrovče
00050000-5551-fd36-ef1f-a635b205ac5c	6330	Piran/Pirano
00050000-5551-fd36-4fe5-d81e42ef6b7e	8255	Pišece
00050000-5551-fd36-dc54-db3d6af833d8	6257	Pivka
00050000-5551-fd36-c848-6ab5fb2b0679	6232	Planina
00050000-5551-fd36-3361-6f780d0c0f2b	3225	Planina pri Sevnici
00050000-5551-fd36-2437-871c9ea47905	6276	Pobegi
00050000-5551-fd36-7385-a4914c15988b	8312	Podbočje
00050000-5551-fd36-d4c4-e88ba3698d48	5243	Podbrdo
00050000-5551-fd36-f757-e19a20b3f21f	3254	Podčetrtek
00050000-5551-fd36-de6f-5debe6090f98	2273	Podgorci
00050000-5551-fd36-1972-384d359ce419	6216	Podgorje
00050000-5551-fd36-b460-08c0a77400b4	2381	Podgorje pri Slovenj Gradcu
00050000-5551-fd36-5efe-27319d7ef543	6244	Podgrad
00050000-5551-fd36-1d75-7e05841c887d	1414	Podkum
00050000-5551-fd36-2f12-e843152f12a9	2286	Podlehnik
00050000-5551-fd36-f030-4a905f2bb34c	5272	Podnanos
00050000-5551-fd36-1843-5e05953f5213	4244	Podnart
00050000-5551-fd36-4347-cb360ca9b96a	3241	Podplat
00050000-5551-fd36-0762-cf06bfbec7b1	3257	Podsreda
00050000-5551-fd36-acdf-9cc3ffc7cff9	2363	Podvelka
00050000-5551-fd36-f30a-34a15135c761	2208	Pohorje
00050000-5551-fd36-0378-80c99860aa02	2257	Polenšak
00050000-5551-fd36-46bb-e1311dfe87f7	1355	Polhov Gradec
00050000-5551-fd36-41f7-8cebe2269a59	4223	Poljane nad Škofjo Loko
00050000-5551-fd36-9a86-aac312d9b699	2319	Poljčane
00050000-5551-fd36-dd40-e1fe83fa9175	1272	Polšnik
00050000-5551-fd36-31b8-b570e4a7c49e	3313	Polzela
00050000-5551-fd36-dd5b-898fe509e85f	3232	Ponikva
00050000-5551-fd36-e5db-582f24899c2b	6320	Portorož/Portorose
00050000-5551-fd36-dd8f-1e130ddf051b	6230	Postojna
00050000-5551-fd36-5597-8939651f0704	2331	Pragersko
00050000-5551-fd36-5724-0274486efbdb	3312	Prebold
00050000-5551-fd36-5979-1d68af8ec5a9	4205	Preddvor
00050000-5551-fd36-c0c1-332b804867a0	6255	Prem
00050000-5551-fd36-2e28-f641a527c3d0	1352	Preserje
00050000-5551-fd36-5cf8-2964f9d63cb4	6258	Prestranek
00050000-5551-fd36-8a42-d6f67426d712	2391	Prevalje
00050000-5551-fd36-a429-01cb244de1ad	3262	Prevorje
00050000-5551-fd36-752f-c500cd54d04c	1276	Primskovo 
00050000-5551-fd36-6a29-c76f3dc80053	3253	Pristava pri Mestinju
00050000-5551-fd36-78ad-82bbf1006324	9207	Prosenjakovci/Partosfalva
00050000-5551-fd36-8064-56b596b1aa64	5297	Prvačina
00050000-5551-fd36-e254-c13418345939	2250	Ptuj
00050000-5551-fd36-782f-444b245278c1	2323	Ptujska Gora
00050000-5551-fd36-605b-518cbaf3239f	9201	Puconci
00050000-5551-fd36-e6db-cf875226f7a2	2327	Rače
00050000-5551-fd36-d92f-effeeccbe9da	1433	Radeče
00050000-5551-fd36-5a90-6f025b2fe3ae	9252	Radenci
00050000-5551-fd36-3ca1-8e57a9f964c2	2360	Radlje ob Dravi
00050000-5551-fd36-5e40-85f45d3bd615	1235	Radomlje
00050000-5551-fd36-a1fa-3917e1ccc955	4240	Radovljica
00050000-5551-fd36-22e9-629df2f0f708	8274	Raka
00050000-5551-fd36-66e8-9249dd69dda4	1381	Rakek
00050000-5551-fd36-469b-967e3cc282d5	4283	Rateče - Planica
00050000-5551-fd36-7883-60bced6c3082	2390	Ravne na Koroškem
00050000-5551-fd36-86a2-10c08539821d	9246	Razkrižje
00050000-5551-fd36-21c6-f6117201b758	3332	Rečica ob Savinji
00050000-5551-fd36-fcb5-ed2cb16f7068	5292	Renče
00050000-5551-fd36-cbde-c03852c43775	1310	Ribnica
00050000-5551-fd36-c057-a344a309f451	2364	Ribnica na Pohorju
00050000-5551-fd36-4c11-bab175f8465f	3272	Rimske Toplice
00050000-5551-fd36-2b6b-b2d390fcc864	1314	Rob
00050000-5551-fd36-64ae-41db0c7465ec	5215	Ročinj
00050000-5551-fd36-3484-04559811c876	3250	Rogaška Slatina
00050000-5551-fd36-4b0e-d0c5c7c650e2	9262	Rogašovci
00050000-5551-fd36-7290-c8ef809d6bf5	3252	Rogatec
00050000-5551-fd36-ff9f-b0899fcdcb44	1373	Rovte
00050000-5551-fd36-0801-568d3a07ce13	2342	Ruše
00050000-5551-fd36-8c09-e6bc35e008bf	1282	Sava
00050000-5551-fd36-efeb-24e416fa65c4	6333	Sečovlje/Sicciole
00050000-5551-fd36-d651-9a725485218f	4227	Selca
00050000-5551-fd36-4f8b-9e934c3967dc	2352	Selnica ob Dravi
00050000-5551-fd36-c34f-03e7d7a91c70	8333	Semič
00050000-5551-fd36-c4f9-8e848a0f5126	8281	Senovo
00050000-5551-fd36-b144-373dcbe0a654	6224	Senožeče
00050000-5551-fd36-5f43-ac895cea0f04	8290	Sevnica
00050000-5551-fd36-8025-d208ca05426c	6210	Sežana
00050000-5551-fd36-cc03-c745f6f54627	2214	Sladki Vrh
00050000-5551-fd36-5833-ea9c060992b0	5283	Slap ob Idrijci
00050000-5551-fd36-72ee-3dfe8a702b4f	2380	Slovenj Gradec
00050000-5551-fd36-6828-60b5f403cd17	2310	Slovenska Bistrica
00050000-5551-fd36-bc1e-7b37450ba5f4	3210	Slovenske Konjice
00050000-5551-fd36-41fe-345b16f4b3e3	1216	Smlednik
00050000-5551-fd36-2a5c-bb9d8d8ce28a	5232	Soča
00050000-5551-fd36-8a3e-b1749a8763b3	1317	Sodražica
00050000-5551-fd36-db84-1f2c86adaa5d	3335	Solčava
00050000-5551-fd36-7637-7c592d4e5f67	5250	Solkan
00050000-5551-fd36-5a3c-7a39c4f5901c	4229	Sorica
00050000-5551-fd36-20a7-b6eb1f4bfd0a	4225	Sovodenj
00050000-5551-fd36-d2af-5880dcb6a23d	5281	Spodnja Idrija
00050000-5551-fd36-fa64-9bb405879d1d	2241	Spodnji Duplek
00050000-5551-fd36-4775-e5fc5ee709be	9245	Spodnji Ivanjci
00050000-5551-fd36-e81e-e9f648a1e147	2277	Središče ob Dravi
00050000-5551-fd36-aa6f-cbd76be70374	4267	Srednja vas v Bohinju
00050000-5551-fd36-d78e-74606cd0127e	8256	Sromlje 
00050000-5551-fd36-ba32-a98cb4ba2a81	5224	Srpenica
00050000-5551-fd36-d37d-b9b4b51443c9	1242	Stahovica
00050000-5551-fd36-9142-b22e75344d9a	1332	Stara Cerkev
00050000-5551-fd36-ad0e-5816dee345ad	8342	Stari trg ob Kolpi
00050000-5551-fd36-ac86-09f2d951dfa1	1386	Stari trg pri Ložu
00050000-5551-fd36-84cf-bf4095ee23c9	2205	Starše
00050000-5551-fd36-6cf5-aff8efb118f6	2289	Stoperce
00050000-5551-fd36-c343-61a28458250e	8322	Stopiče
00050000-5551-fd36-d466-73bbc5f97aa6	3206	Stranice
00050000-5551-fd36-fc86-140ba85c509e	8351	Straža
00050000-5551-fd36-9378-b3e21a37d65e	1313	Struge
00050000-5551-fd36-3370-59b75e400d2b	8293	Studenec
00050000-5551-fd36-69f3-9e4ac5fbd9ff	8331	Suhor
00050000-5551-fd36-80c6-6cc41d7d3bde	2233	Sv. Ana v Slovenskih goricah
00050000-5551-fd36-d064-af133ba4e117	2235	Sv. Trojica v Slovenskih goricah
00050000-5551-fd36-9792-ff35f98a47c8	2353	Sveti Duh na Ostrem Vrhu
00050000-5551-fd36-6bc8-b10aa163348a	9244	Sveti Jurij ob Ščavnici
00050000-5551-fd36-8117-06a9856fb527	3264	Sveti Štefan
00050000-5551-fd36-d3c3-9b154f948745	2258	Sveti Tomaž
00050000-5551-fd36-389d-905609003d65	9204	Šalovci
00050000-5551-fd36-dcc5-7002c78f83df	5261	Šempas
00050000-5551-fd36-ad1d-1b390377872e	5290	Šempeter pri Gorici
00050000-5551-fd36-fdb3-4d0814f41183	3311	Šempeter v Savinjski dolini
00050000-5551-fd36-c275-3b0603e8a1e3	4208	Šenčur
00050000-5551-fd36-53cc-ae7ecbaa8817	2212	Šentilj v Slovenskih goricah
00050000-5551-fd36-db14-65f9ba0a9abb	8297	Šentjanž
00050000-5551-fd36-da18-c786afd5d61e	2373	Šentjanž pri Dravogradu
00050000-5551-fd36-d890-58db77898985	8310	Šentjernej
00050000-5551-fd36-00ce-8c2ad98c8dd6	3230	Šentjur
00050000-5551-fd36-b4ab-25616eb7ca34	3271	Šentrupert
00050000-5551-fd36-9ef9-6c3cfe50d474	8232	Šentrupert
00050000-5551-fd36-5d16-76510c8b0a4a	1296	Šentvid pri Stični
00050000-5551-fd36-4cba-c2f77f808034	8275	Škocjan
00050000-5551-fd36-dcbb-cdf7e7db2ea8	6281	Škofije
00050000-5551-fd36-8c4e-f48463e15fd0	4220	Škofja Loka
00050000-5551-fd36-2053-9729b9f9c491	3211	Škofja vas
00050000-5551-fd36-a684-2dc441bdd602	1291	Škofljica
00050000-5551-fd36-db95-89099bd3dc63	6274	Šmarje
00050000-5551-fd36-dea8-ec86e141235c	1293	Šmarje - Sap
00050000-5551-fd36-0255-96b4e0b45f3f	3240	Šmarje pri Jelšah
00050000-5551-fd36-c009-7bc810dc3f46	8220	Šmarješke Toplice
00050000-5551-fd36-3abd-cda1350b5ee5	2315	Šmartno na Pohorju
00050000-5551-fd36-e7f2-ca74736faacb	3341	Šmartno ob Dreti
00050000-5551-fd36-15fa-ea6ec24e6b94	3327	Šmartno ob Paki
00050000-5551-fd36-9441-be3eb05a481f	1275	Šmartno pri Litiji
00050000-5551-fd36-39e5-e6c005635b76	2383	Šmartno pri Slovenj Gradcu
00050000-5551-fd36-269b-f9fec22e9906	3201	Šmartno v Rožni dolini
00050000-5551-fd36-d878-2c749b9e07f6	3325	Šoštanj
00050000-5551-fd36-358b-72b4afa0a2ba	6222	Štanjel
00050000-5551-fd36-d734-d0c891c95b54	3220	Štore
00050000-5551-fd36-9ce9-2a7f32c4efaa	3304	Tabor
00050000-5551-fd36-af9a-27e875940baf	3221	Teharje
00050000-5551-fd36-2840-22323d9b2d6a	9251	Tišina
00050000-5551-fd36-f074-49c7708facec	5220	Tolmin
00050000-5551-fd36-31b0-4d9a0b7696cd	3326	Topolšica
00050000-5551-fd36-3f5c-1f1cf49cacff	2371	Trbonje
00050000-5551-fd36-a576-a798e9134722	1420	Trbovlje
00050000-5551-fd36-e230-bfc2c6b9dd2c	8231	Trebelno 
00050000-5551-fd36-9dfd-0aa979e2f3bd	8210	Trebnje
00050000-5551-fd36-ce3e-0fa6bfff30fb	5252	Trnovo pri Gorici
00050000-5551-fd36-99f4-b53723cb4213	2254	Trnovska vas
00050000-5551-fd36-916b-d257c87bf6cb	1222	Trojane
00050000-5551-fd36-2525-23300befd9ff	1236	Trzin
00050000-5551-fd36-35ec-20be5720a71d	4290	Tržič
00050000-5551-fd36-8315-ddeadfe77202	8295	Tržišče
00050000-5551-fd36-68ff-78f08f7f9928	1311	Turjak
00050000-5551-fd36-ac1c-79a9518d5c8c	9224	Turnišče
00050000-5551-fd36-1f11-038c1fabced0	8323	Uršna sela
00050000-5551-fd36-4a39-c9eef3564c04	1252	Vače
00050000-5551-fd36-008e-a5d620f896e9	3320	Velenje 
00050000-5551-fd36-44d6-7e294300ed46	3322	Velenje - poštni predali
00050000-5551-fd36-6b8e-02057e3e7162	8212	Velika Loka
00050000-5551-fd36-2f31-0d0987cc0b0a	2274	Velika Nedelja
00050000-5551-fd36-e4cb-0ce928a8a89a	9225	Velika Polana
00050000-5551-fd36-2470-17a3f27606e1	1315	Velike Lašče
00050000-5551-fd36-68de-883a5c9b7104	8213	Veliki Gaber
00050000-5551-fd36-cb82-8873a4bc12af	9241	Veržej
00050000-5551-fd36-181e-f0c814e3e92e	1312	Videm - Dobrepolje
00050000-5551-fd36-5769-41c5b2e8c3b8	2284	Videm pri Ptuju
00050000-5551-fd36-e62f-1847b2ed8c8c	8344	Vinica
00050000-5551-fd36-1258-fc029e1e4cb8	5271	Vipava
00050000-5551-fd36-1312-f6d49342e377	4212	Visoko
00050000-5551-fd36-e0e1-77b1d3b3a15d	1294	Višnja Gora
00050000-5551-fd36-c223-232ff4fed786	3205	Vitanje
00050000-5551-fd36-6ca3-9af837403a85	2255	Vitomarci
00050000-5551-fd36-b539-21dc246ad4ef	1217	Vodice
00050000-5551-fd36-8c41-57b03a41c5af	3212	Vojnik\t
00050000-5551-fd36-3099-14fefff9626a	5293	Volčja Draga
00050000-5551-fd36-500f-733a6b2e7948	2232	Voličina
00050000-5551-fd36-e82b-8cab34d15a5b	3305	Vransko
00050000-5551-fd36-20a2-cc690e51f8e2	6217	Vremski Britof
00050000-5551-fd36-540e-c7e57bc544ea	1360	Vrhnika
00050000-5551-fd36-2124-46614161e50e	2365	Vuhred
00050000-5551-fd36-6d29-8035c3fa0141	2367	Vuzenica
00050000-5551-fd36-8867-cfab731e6362	8292	Zabukovje 
00050000-5551-fd36-7401-d829b0e26ff8	1410	Zagorje ob Savi
00050000-5551-fd36-e54a-110f7ad95b1f	1303	Zagradec
00050000-5551-fd36-b7cf-a6915caeceab	2283	Zavrč
00050000-5551-fd36-f735-c7412e4e58ec	8272	Zdole 
00050000-5551-fd36-043a-7d09425d10b7	4201	Zgornja Besnica
00050000-5551-fd36-8021-180bd8f1545c	2242	Zgornja Korena
00050000-5551-fd36-a7c4-4c450f1dd1fb	2201	Zgornja Kungota
00050000-5551-fd36-a3c4-57084f829252	2316	Zgornja Ložnica
00050000-5551-fd36-2226-2fcf3b9cf288	2314	Zgornja Polskava
00050000-5551-fd36-25ad-b21565ad9dc5	2213	Zgornja Velka
00050000-5551-fd36-3deb-58f347421c72	4247	Zgornje Gorje
00050000-5551-fd36-9ada-993baad8b856	4206	Zgornje Jezersko
00050000-5551-fd36-8270-e8465511c332	2285	Zgornji Leskovec
00050000-5551-fd36-f57c-3b17612c4de3	1432	Zidani Most
00050000-5551-fd36-7e50-c169fc89ed2d	3214	Zreče
00050000-5551-fd36-5213-38c9257958eb	4209	Žabnica
00050000-5551-fd36-19e1-153892c7ab41	3310	Žalec
00050000-5551-fd36-c2cd-36e0d1947f3d	4228	Železniki
00050000-5551-fd36-de84-2a8954630e9f	2287	Žetale
00050000-5551-fd36-2673-7dfe49be37e5	4226	Žiri
00050000-5551-fd36-731f-32c597958f75	4274	Žirovnica
00050000-5551-fd36-08c5-56d3b995ff02	8360	Žužemberk
\.


--
-- TOC entry 2663 (class 0 OID 3196614)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3196437)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3196503)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3196626)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3196731)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3196778)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 3196655)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3196599)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3196589)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3196768)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3196721)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3196304)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5551-fd36-1b85-e6c2033d61de	00010000-5551-fd36-92cb-97d62eff042d	2015-05-12 15:16:39	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO6u/rCUvGAziSduh8iOMZByc9a6udsjq";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2670 (class 0 OID 3196664)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 3196342)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5551-fd36-a22f-f0a94dd7d326	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5551-fd36-884d-2de460979501	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5551-fd36-ca7d-1d0c400d57e9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5551-fd36-b560-8c0a7ec725f8	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5551-fd36-f582-eae29961032f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5551-fd36-46c2-0120ef3c4d57	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2636 (class 0 OID 3196326)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5551-fd36-1b85-e6c2033d61de	00020000-5551-fd36-b560-8c0a7ec725f8
00010000-5551-fd36-92cb-97d62eff042d	00020000-5551-fd36-b560-8c0a7ec725f8
\.


--
-- TOC entry 2672 (class 0 OID 3196678)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3196620)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3196570)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3196402)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3196576)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3196756)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3196472)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 3196313)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5551-fd36-92cb-97d62eff042d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROeJQSxI3uWFs1B1Wf5wo336C5rCinmIW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5551-fd36-1b85-e6c2033d61de	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2684 (class 0 OID 3196810)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3196518)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3196647)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3196713)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3196546)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3196800)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3196703)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2278 (class 2606 OID 3196367)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 3196850)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3196843)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3196755)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 3196536)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 3196569)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 3196498)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 3196699)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3196516)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3196563)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3196612)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3196639)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 3196470)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2282 (class 2606 OID 3196376)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 3196434)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2284 (class 2606 OID 3196400)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 3196356)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2269 (class 2606 OID 3196341)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3196645)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 3196677)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 3196795)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 3196427)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3196458)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 3196618)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 3196448)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 3196507)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 3196630)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3196737)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 3196783)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3196662)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 3196603)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 3196594)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 3196777)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3196728)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 3196312)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 3196668)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 3196330)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2271 (class 2606 OID 3196350)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 3196686)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3196625)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 3196575)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 3196407)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 3196585)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3196767)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 3196483)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3196325)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 3196825)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 3196522)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 3196653)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3196719)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 3196558)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 3196809)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 3196712)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 1259 OID 3196543)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2290 (class 1259 OID 3196429)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2255 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2256 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2257 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2381 (class 1259 OID 3196646)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2375 (class 1259 OID 3196632)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2376 (class 1259 OID 3196631)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2327 (class 1259 OID 3196523)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 3196702)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2403 (class 1259 OID 3196700)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2404 (class 1259 OID 3196701)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2427 (class 1259 OID 3196797)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2428 (class 1259 OID 3196798)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 3196799)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2435 (class 1259 OID 3196828)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2436 (class 1259 OID 3196827)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2437 (class 1259 OID 3196826)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2309 (class 1259 OID 3196485)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2310 (class 1259 OID 3196484)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2294 (class 1259 OID 3196436)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3196435)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2390 (class 1259 OID 3196669)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2345 (class 1259 OID 3196564)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2273 (class 1259 OID 3196357)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2274 (class 1259 OID 3196358)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2395 (class 1259 OID 3196689)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2396 (class 1259 OID 3196688)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2397 (class 1259 OID 3196687)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2319 (class 1259 OID 3196508)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2320 (class 1259 OID 3196510)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2321 (class 1259 OID 3196509)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2355 (class 1259 OID 3196598)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2356 (class 1259 OID 3196596)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2357 (class 1259 OID 3196595)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2358 (class 1259 OID 3196597)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2264 (class 1259 OID 3196331)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2265 (class 1259 OID 3196332)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2384 (class 1259 OID 3196654)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2370 (class 1259 OID 3196619)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2410 (class 1259 OID 3196729)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2411 (class 1259 OID 3196730)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2298 (class 1259 OID 3196450)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2299 (class 1259 OID 3196449)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2300 (class 1259 OID 3196451)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 3196738)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2415 (class 1259 OID 3196739)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2446 (class 1259 OID 3196853)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 3196852)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2448 (class 1259 OID 3196855)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2449 (class 1259 OID 3196851)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2450 (class 1259 OID 3196854)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2407 (class 1259 OID 3196720)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2361 (class 1259 OID 3196607)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2362 (class 1259 OID 3196606)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2363 (class 1259 OID 3196604)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2364 (class 1259 OID 3196605)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2251 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2442 (class 1259 OID 3196845)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 3196844)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2326 (class 1259 OID 3196517)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2279 (class 1259 OID 3196378)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2280 (class 1259 OID 3196377)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2286 (class 1259 OID 3196408)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 3196409)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2350 (class 1259 OID 3196588)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2351 (class 1259 OID 3196587)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 3196586)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2333 (class 1259 OID 3196545)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2334 (class 1259 OID 3196541)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2335 (class 1259 OID 3196538)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2336 (class 1259 OID 3196539)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2337 (class 1259 OID 3196537)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2338 (class 1259 OID 3196542)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2339 (class 1259 OID 3196540)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2293 (class 1259 OID 3196428)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2315 (class 1259 OID 3196499)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2316 (class 1259 OID 3196501)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2317 (class 1259 OID 3196500)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2318 (class 1259 OID 3196502)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2369 (class 1259 OID 3196613)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2432 (class 1259 OID 3196796)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2285 (class 1259 OID 3196401)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2308 (class 1259 OID 3196471)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2389 (class 1259 OID 3196663)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2254 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 3196459)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2426 (class 1259 OID 3196784)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2272 (class 1259 OID 3196351)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2340 (class 1259 OID 3196544)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2475 (class 2606 OID 3196986)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2478 (class 2606 OID 3196971)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2477 (class 2606 OID 3196976)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2473 (class 2606 OID 3196996)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2479 (class 2606 OID 3196966)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2474 (class 2606 OID 3196991)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2476 (class 2606 OID 3196981)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2460 (class 2606 OID 3196901)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2496 (class 2606 OID 3197081)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2494 (class 2606 OID 3197076)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2495 (class 2606 OID 3197071)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2472 (class 2606 OID 3196961)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2502 (class 2606 OID 3197121)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2504 (class 2606 OID 3197111)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2503 (class 2606 OID 3197116)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2492 (class 2606 OID 3197061)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 3197156)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 3197161)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 3197166)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2514 (class 2606 OID 3197181)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2515 (class 2606 OID 3197176)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2516 (class 2606 OID 3197171)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2466 (class 2606 OID 3196936)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2467 (class 2606 OID 3196931)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 3196911)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 3196906)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3196886)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2498 (class 2606 OID 3197091)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2480 (class 2606 OID 3197001)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2454 (class 2606 OID 3196866)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2453 (class 2606 OID 3196871)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2499 (class 2606 OID 3197106)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2500 (class 2606 OID 3197101)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2501 (class 2606 OID 3197096)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2470 (class 2606 OID 3196941)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2468 (class 2606 OID 3196951)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2469 (class 2606 OID 3196946)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2484 (class 2606 OID 3197036)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2486 (class 2606 OID 3197026)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2487 (class 2606 OID 3197021)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2485 (class 2606 OID 3197031)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2452 (class 2606 OID 3196856)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2451 (class 2606 OID 3196861)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2497 (class 2606 OID 3197086)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2493 (class 2606 OID 3197066)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2507 (class 2606 OID 3197131)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2506 (class 2606 OID 3197136)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3196921)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2465 (class 2606 OID 3196916)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2463 (class 2606 OID 3196926)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2509 (class 2606 OID 3197141)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 3197146)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2521 (class 2606 OID 3197206)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 3197201)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2519 (class 2606 OID 3197216)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2523 (class 2606 OID 3197196)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2520 (class 2606 OID 3197211)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2505 (class 2606 OID 3197126)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2488 (class 2606 OID 3197056)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2489 (class 2606 OID 3197051)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 3197041)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2490 (class 2606 OID 3197046)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2517 (class 2606 OID 3197191)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2518 (class 2606 OID 3197186)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2471 (class 2606 OID 3196956)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2510 (class 2606 OID 3197151)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 3196881)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2456 (class 2606 OID 3196876)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2459 (class 2606 OID 3196891)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3196896)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2481 (class 2606 OID 3197016)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2482 (class 2606 OID 3197011)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2483 (class 2606 OID 3197006)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-12 15:16:39 CEST

--
-- PostgreSQL database dump complete
--

