--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-13 09:04:11 CEST

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
-- TOC entry 179 (class 1259 OID 3283654)
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
-- TOC entry 225 (class 1259 OID 3284141)
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
-- TOC entry 224 (class 1259 OID 3284124)
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
-- TOC entry 217 (class 1259 OID 3284035)
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
-- TOC entry 193 (class 1259 OID 3283819)
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
-- TOC entry 196 (class 1259 OID 3283860)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3283781)
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
-- TOC entry 212 (class 1259 OID 3283985)
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
-- TOC entry 191 (class 1259 OID 3283806)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3283854)
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
-- TOC entry 201 (class 1259 OID 3283903)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3283928)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3283755)
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
-- TOC entry 180 (class 1259 OID 3283663)
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
-- TOC entry 181 (class 1259 OID 3283674)
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
-- TOC entry 184 (class 1259 OID 3283725)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3283628)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3283647)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3283935)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3283965)
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
-- TOC entry 221 (class 1259 OID 3284080)
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
-- TOC entry 183 (class 1259 OID 3283705)
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
-- TOC entry 186 (class 1259 OID 3283747)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3283909)
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
-- TOC entry 185 (class 1259 OID 3283732)
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
-- TOC entry 190 (class 1259 OID 3283798)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3283921)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3284026)
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
-- TOC entry 220 (class 1259 OID 3284073)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3283950)
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
-- TOC entry 200 (class 1259 OID 3283894)
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
-- TOC entry 199 (class 1259 OID 3283884)
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
-- TOC entry 219 (class 1259 OID 3284063)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3284016)
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
-- TOC entry 173 (class 1259 OID 3283599)
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
-- TOC entry 172 (class 1259 OID 3283597)
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
-- TOC entry 209 (class 1259 OID 3283959)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3283637)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3283621)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3283973)
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
-- TOC entry 203 (class 1259 OID 3283915)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3283865)
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
-- TOC entry 182 (class 1259 OID 3283697)
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
-- TOC entry 198 (class 1259 OID 3283871)
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
-- TOC entry 218 (class 1259 OID 3284051)
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
-- TOC entry 188 (class 1259 OID 3283767)
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
-- TOC entry 174 (class 1259 OID 3283608)
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
-- TOC entry 223 (class 1259 OID 3284105)
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
-- TOC entry 192 (class 1259 OID 3283813)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3283942)
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
-- TOC entry 214 (class 1259 OID 3284008)
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
-- TOC entry 194 (class 1259 OID 3283841)
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
-- TOC entry 222 (class 1259 OID 3284095)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3283998)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3283602)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2640 (class 0 OID 3283654)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2686 (class 0 OID 3284141)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 3284124)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3284035)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3283819)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3283860)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3283781)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5552-f76a-5e75-603f3219e761	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5552-f76a-ac6b-0549c59930ec	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5552-f76a-f676-3abcbc2ee2bb	AL	ALB	008	Albania 	Albanija	\N
00040000-5552-f76a-d2fd-a3802c0e4ce1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5552-f76a-411d-eea992441b84	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5552-f76a-cfc6-a32598b93307	AD	AND	020	Andorra 	Andora	\N
00040000-5552-f76a-cae0-11e253a0fa8e	AO	AGO	024	Angola 	Angola	\N
00040000-5552-f76a-8e20-cc34cf4aba7c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5552-f76a-7586-3e449e37dabc	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5552-f76a-9470-58f327b57124	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5552-f76a-027b-a8914884183e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5552-f76a-18e1-04336dbd4888	AM	ARM	051	Armenia 	Armenija	\N
00040000-5552-f76a-87c4-1e473c98de9f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5552-f76a-32a3-0ecdca652b8d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5552-f76a-4c6c-101f997d0f6e	AT	AUT	040	Austria 	Avstrija	\N
00040000-5552-f76a-7136-30fa4061dad2	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5552-f76a-ecb7-6b460214aca1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5552-f76a-b500-52f7e7200d13	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5552-f76a-f176-ff0782fd463c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5552-f76a-8b94-8c1f9303cc32	BB	BRB	052	Barbados 	Barbados	\N
00040000-5552-f76a-1961-95fa1148c5b9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5552-f76a-fc56-d103f9d3429b	BE	BEL	056	Belgium 	Belgija	\N
00040000-5552-f76a-7a1f-cba70f5abaa4	BZ	BLZ	084	Belize 	Belize	\N
00040000-5552-f76a-52cf-c391b1a99680	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5552-f76a-bbbb-5d7d95ccd475	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5552-f76a-cb47-7c433a6be703	BT	BTN	064	Bhutan 	Butan	\N
00040000-5552-f76a-a130-908509171b11	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5552-f76a-d0fb-a54b60078d18	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5552-f76a-b470-63cb93f3ae55	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5552-f76a-db96-a16105d5cb23	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5552-f76a-bce7-0b1c6da51059	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5552-f76a-7490-d42cea50f740	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5552-f76a-b195-01f2430e83b8	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5552-f76a-68be-020d64d66865	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5552-f76a-a0c0-7980ff09dee3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5552-f76a-0e57-b84f7dad7792	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5552-f76a-e3fb-952c3557a271	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5552-f76a-f5df-5573d7786969	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5552-f76a-c461-acac14895f06	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5552-f76a-edc1-dfb6f72f0336	CA	CAN	124	Canada 	Kanada	\N
00040000-5552-f76a-5b1a-760aeb324b92	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5552-f76a-f2f3-e706d4820531	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5552-f76a-4cd1-69afada9e386	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5552-f76a-4413-ecd76c1d0603	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5552-f76a-2587-a4b384367d7c	CL	CHL	152	Chile 	Čile	\N
00040000-5552-f76a-c8fc-97799e4d82db	CN	CHN	156	China 	Kitajska	\N
00040000-5552-f76a-b2bc-9a2c300c2462	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5552-f76a-07b0-75ed2fd67a33	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5552-f76a-a38b-85e78eafb8a4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5552-f76a-f818-2330ed5d13bf	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5552-f76a-d8f2-2d90b33e7e82	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5552-f76a-eede-cdfe5aa1a423	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5552-f76a-7653-1a4338e206bd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5552-f76a-f6b7-8e0ea6391655	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5552-f76a-0b97-37dd89de7365	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5552-f76a-0eee-2e7c1316e78c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5552-f76a-8e2d-e0487594804f	CU	CUB	192	Cuba 	Kuba	\N
00040000-5552-f76a-8b2b-f532ae03ce8a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5552-f76a-b9ae-03c24120c87a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5552-f76a-d418-ff1c1d5fd7d7	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5552-f76a-7f47-b62fb930a9b0	DK	DNK	208	Denmark 	Danska	\N
00040000-5552-f76a-a541-eb2b98526070	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5552-f76a-940d-4e932a1d4c29	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5552-f76a-0cd0-ae59082b9527	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5552-f76a-673d-f39ba6871fd5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5552-f76a-bb09-1db19364c5b3	EG	EGY	818	Egypt 	Egipt	\N
00040000-5552-f76a-e75c-9ab2fb174f04	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5552-f76a-d650-728ccc60a336	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5552-f76a-1616-e80b02ce0335	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5552-f76a-922a-1f0d33ad100e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5552-f76a-9220-f288c8bc887a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5552-f76a-68ae-acb8fbfbbb71	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5552-f76a-483d-3b3f06e04ad7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5552-f76a-3660-dc3403a1ac75	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5552-f76a-6306-b85b271c5bd8	FI	FIN	246	Finland 	Finska	\N
00040000-5552-f76a-022f-c275fd73d764	FR	FRA	250	France 	Francija	\N
00040000-5552-f76a-dd51-5960c7465dd7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5552-f76a-6492-9a6a2b30f863	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5552-f76a-330f-4a80b7b44814	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5552-f76a-01c7-14055d9c24f8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5552-f76a-f372-67aa67166f8a	GA	GAB	266	Gabon 	Gabon	\N
00040000-5552-f76a-0372-562220e81264	GM	GMB	270	Gambia 	Gambija	\N
00040000-5552-f76a-caed-fcf8fb2f460c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5552-f76a-ceda-2a74a88f41c5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5552-f76a-4f7c-dcafd2d304d1	GH	GHA	288	Ghana 	Gana	\N
00040000-5552-f76a-b133-e15981aed3aa	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5552-f76a-a819-145339787d93	GR	GRC	300	Greece 	Grčija	\N
00040000-5552-f76a-2530-b4a4841329e4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5552-f76a-0ee9-3441ecdfd3c3	GD	GRD	308	Grenada 	Grenada	\N
00040000-5552-f76a-a885-4570cfe7b62f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5552-f76a-36f0-6a638d670b08	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5552-f76a-179c-b07d81ce9e53	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5552-f76a-fd7f-f98f50bb3ce2	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5552-f76a-2dd9-bd7b0182b368	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5552-f76a-7209-1f56783dc49d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5552-f76a-cb48-96f7d4187ca7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5552-f76a-4dcb-f43b60282ca1	HT	HTI	332	Haiti 	Haiti	\N
00040000-5552-f76a-0deb-eb621d26e2af	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5552-f76a-eaea-40cbb8e4f2b3	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5552-f76a-1bcb-2918340eea46	HN	HND	340	Honduras 	Honduras	\N
00040000-5552-f76a-ffe2-095cb00c135a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5552-f76a-17b6-83fb23827da8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5552-f76a-618e-052d94b8160e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5552-f76a-1411-7cf12c4b2d11	IN	IND	356	India 	Indija	\N
00040000-5552-f76a-a5d1-d2723b95185e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5552-f76a-9c67-c405277e4a46	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5552-f76a-e741-4cb0e5fb0ac2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5552-f76a-78e7-6aa5419df8a8	IE	IRL	372	Ireland 	Irska	\N
00040000-5552-f76a-869b-77a6f7f49d28	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5552-f76a-6c53-48368d851221	IL	ISR	376	Israel 	Izrael	\N
00040000-5552-f76a-c53f-ccc6868ec2c5	IT	ITA	380	Italy 	Italija	\N
00040000-5552-f76a-46c6-31f5421d1cbe	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5552-f76a-ddb2-892ac2dcc7cf	JP	JPN	392	Japan 	Japonska	\N
00040000-5552-f76a-a8be-33ed2584e7e6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5552-f76a-1027-8d8ebab4d0ac	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5552-f76a-a4db-d7800adf33cf	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5552-f76a-6beb-c6c4e6ac526a	KE	KEN	404	Kenya 	Kenija	\N
00040000-5552-f76a-eb69-064b30fa6ecf	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5552-f76a-66a9-99a0f39e7336	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5552-f76a-2d57-160db09fe9b6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5552-f76a-489a-c94cf32bb2d9	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5552-f76a-c701-da9ab5cf21bb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5552-f76a-a5ab-3419cb309fa7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5552-f76a-ff7d-00963eec48a1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5552-f76a-411f-357a07fb1c78	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5552-f76a-f4bf-498185bcfdfe	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5552-f76a-97b3-16175c6f098d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5552-f76a-49e1-890d7c64c578	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5552-f76a-997a-2b62e6ee6fb7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5552-f76a-a943-5d21536e204f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5552-f76a-1b7f-439bea8d98c5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5552-f76a-444d-2b93c7cc27f1	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5552-f76a-26fc-a9f92db9e8f6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5552-f76a-d8b6-2a57551a17ce	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5552-f76a-70b0-697262b837e3	MW	MWI	454	Malawi 	Malavi	\N
00040000-5552-f76a-8633-f8ad7b1d4b37	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5552-f76a-cba5-aef85d5743ea	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5552-f76a-6b5c-af7da12abea2	ML	MLI	466	Mali 	Mali	\N
00040000-5552-f76a-c1c6-56a9e36589e6	MT	MLT	470	Malta 	Malta	\N
00040000-5552-f76a-e1b6-4c64a1205369	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5552-f76a-6503-5758ec85192b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5552-f76a-99a6-dcf7573c5085	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5552-f76a-ace0-1212ead10a02	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5552-f76a-27e4-8c61fcda1a9f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5552-f76a-ded7-636f71751921	MX	MEX	484	Mexico 	Mehika	\N
00040000-5552-f76a-5de1-4e26037f3528	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5552-f76a-d489-40b95f49cbef	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5552-f76a-7dc6-f9ca53da9831	MC	MCO	492	Monaco 	Monako	\N
00040000-5552-f76a-439d-4a7b4378212b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5552-f76a-4f84-9f662db8418a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5552-f76a-9ffc-9b276b9913c4	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5552-f76a-5771-08fda7a5747a	MA	MAR	504	Morocco 	Maroko	\N
00040000-5552-f76a-1850-813ea2274d15	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5552-f76a-38b4-0c67963fbfbc	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5552-f76a-1e27-9d99da81ac3d	NA	NAM	516	Namibia 	Namibija	\N
00040000-5552-f76a-b4d6-eda6d39c56c3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5552-f76a-83a2-18930ffcd9af	NP	NPL	524	Nepal 	Nepal	\N
00040000-5552-f76a-c504-1c023f8f681a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5552-f76a-bbed-11165cfbb442	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5552-f76a-b168-e851c98d423f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5552-f76a-185a-5a65494752d1	NE	NER	562	Niger 	Niger 	\N
00040000-5552-f76a-391c-2300fb550525	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5552-f76a-1c19-51393cfc2592	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5552-f76a-5db7-af04807923df	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5552-f76a-57ca-5a2c24b57ada	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5552-f76a-1639-cb42694a7f77	NO	NOR	578	Norway 	Norveška	\N
00040000-5552-f76a-a134-a9528bcc0580	OM	OMN	512	Oman 	Oman	\N
00040000-5552-f76a-d9ab-774a65057a6b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5552-f76a-90cf-9cfbb15b26b7	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5552-f76a-f823-28fcbcf3574a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5552-f76a-ce45-5e1461e866c5	PA	PAN	591	Panama 	Panama	\N
00040000-5552-f76a-09f9-779c745d4979	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5552-f76a-d291-d3916f144870	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5552-f76a-caa7-fdbdbb45ce74	PE	PER	604	Peru 	Peru	\N
00040000-5552-f76a-31b2-c7cd3f6ed0c3	PH	PHL	608	Philippines 	Filipini	\N
00040000-5552-f76a-3b02-f3d00757f775	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5552-f76a-4bcc-0aa1dd2f0f8e	PL	POL	616	Poland 	Poljska	\N
00040000-5552-f76a-2d4b-2c4d0f2d6a53	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5552-f76a-9878-45d7cf386ea2	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5552-f76a-fcf6-4424fb1bee70	QA	QAT	634	Qatar 	Katar	\N
00040000-5552-f76a-a5a7-1f4056846bfc	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5552-f76a-3f76-c9f62465bafa	RO	ROU	642	Romania 	Romunija	\N
00040000-5552-f76a-602e-58a6aee5e2cf	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5552-f76a-4c22-5fbef37b68dd	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5552-f76a-24df-ed13f2750e9a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5552-f76a-09ae-1f6c13599995	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5552-f76a-3580-02d1ad03d7be	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5552-f76a-c7ea-8c9ab99953f9	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5552-f76a-41a2-3bf535dcc06c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5552-f76a-673b-813885efdaf3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5552-f76a-5315-3d7339814705	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5552-f76a-ca07-6224b531f3cf	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5552-f76a-b42e-0c28c4844bb9	SM	SMR	674	San Marino 	San Marino	\N
00040000-5552-f76a-32f2-0f9fc4464db1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5552-f76a-8896-aaec69500320	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5552-f76a-ac38-5c267c5f4c0d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5552-f76a-ebcf-90bff1ddaa7e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5552-f76a-bece-89f9cac864a5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5552-f76a-3a9c-a89522c9334f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5552-f76a-0b2a-ce98ad03a8b4	SG	SGP	702	Singapore 	Singapur	\N
00040000-5552-f76a-008d-b674867f6d18	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5552-f76a-b146-fdad6f2c6bb1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5552-f76a-e34b-fb217b3952aa	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5552-f76a-75e4-2079e0c92268	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5552-f76a-9b10-253cc0a814e5	SO	SOM	706	Somalia 	Somalija	\N
00040000-5552-f76a-6bb3-328dc93fb561	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5552-f76a-5f07-6172a6aa88c0	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5552-f76a-cd31-1f26efecb968	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5552-f76a-9649-ace7bdb089cb	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5552-f76a-bddc-458953cc2a1e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5552-f76a-5509-e064cf0ecc8b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5552-f76a-0886-8cc46d1ce148	SR	SUR	740	Suriname 	Surinam	\N
00040000-5552-f76a-b2b4-b0d2bfb9e3d8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5552-f76a-4e22-6cfa1ea49717	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5552-f76a-7c15-419992164f83	SE	SWE	752	Sweden 	Švedska	\N
00040000-5552-f76a-3236-b2aea84e6e43	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5552-f76a-19d3-e316284e1431	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5552-f76a-42af-37c09fbb18ea	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5552-f76a-383a-65c9a6edc24d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5552-f76a-d8d2-b0b64d5ea4ad	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5552-f76a-f742-6bd2a9538799	TH	THA	764	Thailand 	Tajska	\N
00040000-5552-f76a-c0cd-10373f584303	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5552-f76a-e20f-babf30724e7f	TG	TGO	768	Togo 	Togo	\N
00040000-5552-f76a-7e48-05fca270400c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5552-f76a-1a64-9a99a2cd63ff	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5552-f76a-5bf2-1ee4416dc7bc	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5552-f76a-862a-4595a38a6c15	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5552-f76a-37dc-1211960858ba	TR	TUR	792	Turkey 	Turčija	\N
00040000-5552-f76a-3bf0-fa6d30c2fb63	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5552-f76a-ca42-2eec8de0d6d2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5552-f76a-e5eb-dfaf74145a98	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5552-f76a-081b-ef01971ede14	UG	UGA	800	Uganda 	Uganda	\N
00040000-5552-f76a-f1b1-f66e2814df4e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5552-f76a-9927-3cfd6e1b882e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5552-f76a-aab6-dae6d9b3a0a6	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5552-f76a-1970-5aa17c23189b	US	USA	840	United States 	Združene države Amerike	\N
00040000-5552-f76a-2f89-f9e67287f76a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5552-f76a-d7b3-12f434195c0a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5552-f76a-7e56-840969927b2f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5552-f76a-dd93-bd005510568b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5552-f76a-b27a-1663720841bd	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5552-f76a-80ca-967dc1176b08	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5552-f76a-0375-5662e72a1695	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5552-f76a-5d2b-59d7016137d8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5552-f76a-5f97-b0f94ce46ec2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5552-f76a-621a-e9833407798d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5552-f76a-b3f4-1cdb2b47f374	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5552-f76a-750c-fed33d5c2e61	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5552-f76a-3b4d-1f6161543d82	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2673 (class 0 OID 3283985)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3283806)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3283854)
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
-- TOC entry 2662 (class 0 OID 3283903)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3283928)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3283755)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5552-f76a-655b-c2db0f054815	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5552-f76a-2550-c22522142caa	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5552-f76a-43de-f915f583e309	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5552-f76a-99bb-851bdad1c94b	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5552-f76a-14e6-77e59ec9e991	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5552-f76a-4399-532f19d2674f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5552-f76a-165f-3865c4b81e12	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5552-f76a-3441-53a96b1d6fc6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5552-f76a-fa62-34f40d90d386	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5552-f76a-6874-2f44f55cb7e2	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2641 (class 0 OID 3283663)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5552-f76a-fbfd-49c28011bbc6	00000000-5552-f76a-14e6-77e59ec9e991	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5552-f76a-ff5b-6a7c7cc372e3	00000000-5552-f76a-14e6-77e59ec9e991	00010000-5552-f76a-e8d6-5b373d7b741c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5552-f76a-9c6f-8bb73674437d	00000000-5552-f76a-4399-532f19d2674f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2642 (class 0 OID 3283674)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3283725)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 3283628)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5552-f76a-3946-a88bcca65cd1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5552-f76a-d4b4-966e48c5543e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5552-f76a-9998-f70be5f4713c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5552-f76a-0a25-6512b2359848	Abonma-read	Abonma - branje	f
00030000-5552-f76a-8bae-071afbc5506b	Abonma-write	Abonma - spreminjanje	f
00030000-5552-f76a-c9a0-3e0b6c69fb11	Alternacija-read	Alternacija - branje	f
00030000-5552-f76a-20e9-c4713cf42671	Alternacija-write	Alternacija - spreminjanje	f
00030000-5552-f76a-79a0-3a121ee8138a	Arhivalija-read	Arhivalija - branje	f
00030000-5552-f76a-ee75-ac2de61c54cc	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5552-f76a-cb62-b07741046d47	Besedilo-read	Besedilo - branje	f
00030000-5552-f76a-f440-b24398fa2dd4	Besedilo-write	Besedilo - spreminjanje	f
00030000-5552-f76a-011e-21e1aee14607	DogodekIzven-read	DogodekIzven - branje	f
00030000-5552-f76a-24ed-dd8729a153f9	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5552-f76a-1593-0241f3702003	Dogodek-read	Dogodek - branje	f
00030000-5552-f76a-643c-51b6c8e36ddc	Dogodek-write	Dogodek - spreminjanje	f
00030000-5552-f76a-710f-6de8c350f294	Drzava-read	Drzava - branje	f
00030000-5552-f76a-2300-efcdabb0ae32	Drzava-write	Drzava - spreminjanje	f
00030000-5552-f76a-b5d9-3378351dc71a	Funkcija-read	Funkcija - branje	f
00030000-5552-f76a-0f29-e461a107a5bc	Funkcija-write	Funkcija - spreminjanje	f
00030000-5552-f76a-e9d5-70577181f9f8	Gostovanje-read	Gostovanje - branje	f
00030000-5552-f76a-f4fa-bfa7a9d98d1b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5552-f76a-2146-f7836d53db70	Gostujoca-read	Gostujoca - branje	f
00030000-5552-f76a-afec-824534e4ebb2	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5552-f76a-edad-62d6029861b0	Kupec-read	Kupec - branje	f
00030000-5552-f76a-5ca8-d101429ec1db	Kupec-write	Kupec - spreminjanje	f
00030000-5552-f76a-3e07-00cd64cc88f5	NacinPlacina-read	NacinPlacina - branje	f
00030000-5552-f76a-ef47-f4bd771c0a8b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5552-f76a-3c64-04580f913686	Option-read	Option - branje	f
00030000-5552-f76a-c94d-d03362568050	Option-write	Option - spreminjanje	f
00030000-5552-f76a-613c-5001ea862a9b	OptionValue-read	OptionValue - branje	f
00030000-5552-f76a-2406-8f6c6e2ba64b	OptionValue-write	OptionValue - spreminjanje	f
00030000-5552-f76a-3837-0f67be3d9e4e	Oseba-read	Oseba - branje	f
00030000-5552-f76a-d9a3-72959211c82e	Oseba-write	Oseba - spreminjanje	f
00030000-5552-f76a-cd5a-60bceeef1a97	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5552-f76a-2487-54e999c022f1	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5552-f76a-79bd-3ba78c451e8b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5552-f76a-6a22-c4603a2f2b6f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5552-f76a-cccf-5e65cc02715e	Pogodba-read	Pogodba - branje	f
00030000-5552-f76a-8f0b-a1036cc14e22	Pogodba-write	Pogodba - spreminjanje	f
00030000-5552-f76a-3c7b-fc02c0597a4b	Popa-read	Popa - branje	f
00030000-5552-f76a-5eb3-6fb1809ef6eb	Popa-write	Popa - spreminjanje	f
00030000-5552-f76a-41b1-2fa7712d0f90	Posta-read	Posta - branje	f
00030000-5552-f76a-2422-af81ca21bf2a	Posta-write	Posta - spreminjanje	f
00030000-5552-f76a-f31a-cb4c5913b273	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5552-f76a-b38b-b8c8c0eeaea9	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5552-f76a-0626-972635232d7f	PostniNaslov-read	PostniNaslov - branje	f
00030000-5552-f76a-ad8a-5fde366514eb	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5552-f76a-ebe4-69f055a0530f	Predstava-read	Predstava - branje	f
00030000-5552-f76a-eff3-acc4eec6b946	Predstava-write	Predstava - spreminjanje	f
00030000-5552-f76a-6265-fcbaf0dcf7b0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5552-f76a-eeb3-39150aeb6261	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5552-f76a-875e-7c5bbc9555df	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5552-f76a-3caf-f1835e9fb42b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5552-f76a-4026-509216ee34b7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5552-f76a-606d-74ef0a0eb4cd	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5552-f76a-6677-9b03063a4b89	Prostor-read	Prostor - branje	f
00030000-5552-f76a-ab37-b8cb0e808132	Prostor-write	Prostor - spreminjanje	f
00030000-5552-f76a-8f6d-3e723001064a	Racun-read	Racun - branje	f
00030000-5552-f76a-6d21-01ab4666b1ef	Racun-write	Racun - spreminjanje	f
00030000-5552-f76a-8505-b56ba2064a41	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5552-f76a-f39c-e3cd74c95fa0	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5552-f76a-0d67-3f0bf16bdeb7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5552-f76a-6fb5-af81e87a36b8	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5552-f76a-945e-2ea514eb79bb	Rekvizit-read	Rekvizit - branje	f
00030000-5552-f76a-33d6-584a2e236df9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5552-f76a-a7ef-1f67ca9f638e	Rezervacija-read	Rezervacija - branje	f
00030000-5552-f76a-f5ab-63218520b38f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5552-f76a-291b-ec17a72ca8fc	SedezniRed-read	SedezniRed - branje	f
00030000-5552-f76a-e6ca-6678eabc8b82	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5552-f76a-8449-e0d0e165f913	Sedez-read	Sedez - branje	f
00030000-5552-f76a-2f3f-001197e829d2	Sedez-write	Sedez - spreminjanje	f
00030000-5552-f76a-3324-82ba98f382d1	Sezona-read	Sezona - branje	f
00030000-5552-f76a-b3ee-d9724d5f224c	Sezona-write	Sezona - spreminjanje	f
00030000-5552-f76a-ca1e-de88cadfa581	Telefonska-read	Telefonska - branje	f
00030000-5552-f76a-eaca-57e568958e92	Telefonska-write	Telefonska - spreminjanje	f
00030000-5552-f76a-446d-b31dba5bb15e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5552-f76a-8788-93db1d45a922	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5552-f76a-a6e1-aaa565c8ed02	TipFunkcije-read	TipFunkcije - branje	f
00030000-5552-f76a-2ec5-6192cd8d92a8	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5552-f76a-1375-f1ac4782af18	Trr-read	Trr - branje	f
00030000-5552-f76a-32e6-3b29cc4518f9	Trr-write	Trr - spreminjanje	f
00030000-5552-f76a-b134-8e0a9dfcee92	Uprizoritev-read	Uprizoritev - branje	f
00030000-5552-f76a-f816-3b25bdb25fb4	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5552-f76a-6f94-97830c200e87	Vaja-read	Vaja - branje	f
00030000-5552-f76a-1d22-9cb176d0ff5c	Vaja-write	Vaja - spreminjanje	f
00030000-5552-f76a-b644-94690a364ce4	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5552-f76a-a8ad-9c953cae63a1	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5552-f76a-d4d0-0ef102d1318f	Zaposlitev-read	Zaposlitev - branje	f
00030000-5552-f76a-19d8-0790a8d4aef3	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5552-f76a-6afc-6da367671bdb	Zasedenost-read	Zasedenost - branje	f
00030000-5552-f76a-655a-271ddecb3bbd	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5552-f76a-768e-d7b93b633fb5	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5552-f76a-4f5c-514b947cc15c	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5552-f76a-6e81-7fe8b38912be	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5552-f76a-38d6-c7a67a437d2f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2639 (class 0 OID 3283647)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5552-f76a-588f-74f6611c5773	00030000-5552-f76a-710f-6de8c350f294
00020000-5552-f76a-9da1-6866a1d00e1a	00030000-5552-f76a-2300-efcdabb0ae32
00020000-5552-f76a-9da1-6866a1d00e1a	00030000-5552-f76a-710f-6de8c350f294
\.


--
-- TOC entry 2667 (class 0 OID 3283935)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3283965)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3284080)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3283705)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3283747)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5552-f76a-1b2f-093027d89cfb	8341	Adlešiči
00050000-5552-f76a-fbf1-223879899b78	5270	Ajdovščina
00050000-5552-f76a-4925-6d63e9d1fadc	6280	Ankaran/Ancarano
00050000-5552-f76a-5932-7bb01359d214	9253	Apače
00050000-5552-f76a-9490-6a9614ec5835	8253	Artiče
00050000-5552-f76a-0a26-8fb7b1225892	4275	Begunje na Gorenjskem
00050000-5552-f76a-4cce-4e30e3ec5b25	1382	Begunje pri Cerknici
00050000-5552-f76a-0d6b-b409cd9219ae	9231	Beltinci
00050000-5552-f76a-5ebc-b374e7fb15c0	2234	Benedikt
00050000-5552-f76a-9e83-87566d039c20	2345	Bistrica ob Dravi
00050000-5552-f76a-6869-8f1b3cc86998	3256	Bistrica ob Sotli
00050000-5552-f76a-fc85-0e45466e371f	8259	Bizeljsko
00050000-5552-f76a-b807-704f22d525d8	1223	Blagovica
00050000-5552-f76a-e4f0-3e681c9cdeb6	8283	Blanca
00050000-5552-f76a-e5f0-3b59fe8310ee	4260	Bled
00050000-5552-f76a-a631-ab09d5ddcd7b	4273	Blejska Dobrava
00050000-5552-f76a-9ab9-db01272d3979	9265	Bodonci
00050000-5552-f76a-37ef-848be1b1fc22	9222	Bogojina
00050000-5552-f76a-06bd-83a6e50c0d34	4263	Bohinjska Bela
00050000-5552-f76a-b691-a2a378405a49	4264	Bohinjska Bistrica
00050000-5552-f76a-1980-13d475f1cd2b	4265	Bohinjsko jezero
00050000-5552-f76a-bc05-329484a95afc	1353	Borovnica
00050000-5552-f76a-08af-8d95e67b46d6	8294	Boštanj
00050000-5552-f76a-fa7e-01071dd11f06	5230	Bovec
00050000-5552-f76a-84d5-af0058ee4ed7	5295	Branik
00050000-5552-f76a-3420-a7f4627d42b7	3314	Braslovče
00050000-5552-f76a-c916-302a6e6260ad	5223	Breginj
00050000-5552-f76a-98c9-57067fcc8d5b	8280	Brestanica
00050000-5552-f76a-98ee-0a531df979a4	2354	Bresternica
00050000-5552-f76a-1cc6-87c3208f81d8	4243	Brezje
00050000-5552-f76a-4cd0-ac1d83cbefe0	1351	Brezovica pri Ljubljani
00050000-5552-f76a-4ab9-fcf586b2f604	8250	Brežice
00050000-5552-f76a-fe65-84c522fe6e82	4210	Brnik - Aerodrom
00050000-5552-f76a-b5e2-f6430b02e9f3	8321	Brusnice
00050000-5552-f76a-149e-01a80a2b4526	3255	Buče
00050000-5552-f76a-9a18-53f945ac51d3	8276	Bučka 
00050000-5552-f76a-4b33-98c14ddaf71f	9261	Cankova
00050000-5552-f76a-b87f-a9e3bb9511f6	3000	Celje 
00050000-5552-f76a-9c21-7a58f55d4748	3001	Celje - poštni predali
00050000-5552-f76a-7def-d720aec4e4ea	4207	Cerklje na Gorenjskem
00050000-5552-f76a-12b5-c17ada087f1d	8263	Cerklje ob Krki
00050000-5552-f76a-d6af-f71371997a83	1380	Cerknica
00050000-5552-f76a-49d4-81850928444a	5282	Cerkno
00050000-5552-f76a-f52f-bfa4ea72c1bc	2236	Cerkvenjak
00050000-5552-f76a-2357-9ce16d56f86b	2215	Ceršak
00050000-5552-f76a-52ca-70dfb152b937	2326	Cirkovce
00050000-5552-f76a-2be9-0c0d540ead80	2282	Cirkulane
00050000-5552-f76a-5472-082b17ae2c53	5273	Col
00050000-5552-f76a-ac1d-9d3ab6faae89	8251	Čatež ob Savi
00050000-5552-f76a-6ebd-58df28ac139b	1413	Čemšenik
00050000-5552-f76a-a0f5-c8c47ac8f2ba	5253	Čepovan
00050000-5552-f76a-dbde-c219a073b1f2	9232	Črenšovci
00050000-5552-f76a-54d7-9a46da458c0f	2393	Črna na Koroškem
00050000-5552-f76a-6945-c1c192e6f836	6275	Črni Kal
00050000-5552-f76a-32c3-d3f0d91aa7b1	5274	Črni Vrh nad Idrijo
00050000-5552-f76a-8f28-12a697713fa0	5262	Črniče
00050000-5552-f76a-1d13-d63483d26171	8340	Črnomelj
00050000-5552-f76a-5e22-736c6f607b0e	6271	Dekani
00050000-5552-f76a-7b0b-5de0a1f74263	5210	Deskle
00050000-5552-f76a-610b-57fcaf294a64	2253	Destrnik
00050000-5552-f76a-d377-24b2478d2ae2	6215	Divača
00050000-5552-f76a-94aa-b645311094a3	1233	Dob
00050000-5552-f76a-8288-c926583cbf1d	3224	Dobje pri Planini
00050000-5552-f76a-e19e-ad0fa9a6b1ea	8257	Dobova
00050000-5552-f76a-e662-a98547f375b3	1423	Dobovec
00050000-5552-f76a-1708-6515962de37a	5263	Dobravlje
00050000-5552-f76a-16ab-bc8b84854d04	3204	Dobrna
00050000-5552-f76a-677e-f8e33b15b661	8211	Dobrnič
00050000-5552-f76a-4ba9-d4dbfda61bff	1356	Dobrova
00050000-5552-f76a-3f74-3a1df20c730c	9223	Dobrovnik/Dobronak 
00050000-5552-f76a-c444-2acc898a2892	5212	Dobrovo v Brdih
00050000-5552-f76a-d25c-917babf087a1	1431	Dol pri Hrastniku
00050000-5552-f76a-ff21-c34fcb62693d	1262	Dol pri Ljubljani
00050000-5552-f76a-f039-c2d09206e0a8	1273	Dole pri Litiji
00050000-5552-f76a-9576-eec78e755875	1331	Dolenja vas
00050000-5552-f76a-f77e-69872a12f8d0	8350	Dolenjske Toplice
00050000-5552-f76a-9b21-90059de282e4	1230	Domžale
00050000-5552-f76a-737d-c944124b84f2	2252	Dornava
00050000-5552-f76a-f9f6-f3468b1fd21b	5294	Dornberk
00050000-5552-f76a-7bde-e74ba4a15114	1319	Draga
00050000-5552-f76a-48ff-c1cd74dddbb9	8343	Dragatuš
00050000-5552-f76a-192b-16c8b61bc003	3222	Dramlje
00050000-5552-f76a-d2bf-508fa4dd62c1	2370	Dravograd
00050000-5552-f76a-f873-afcc53ab8593	4203	Duplje
00050000-5552-f76a-c2d9-02f7a24ec143	6221	Dutovlje
00050000-5552-f76a-0c7f-ede166cb7b51	8361	Dvor
00050000-5552-f76a-762c-7d5452a75669	2343	Fala
00050000-5552-f76a-16aa-34417980f6c7	9208	Fokovci
00050000-5552-f76a-e80c-bbbc87ccb2ae	2313	Fram
00050000-5552-f76a-bfa3-5a899c014b90	3213	Frankolovo
00050000-5552-f76a-3647-2524ab9950f9	1274	Gabrovka
00050000-5552-f76a-494b-bc8a8383ee9e	8254	Globoko
00050000-5552-f76a-1cc1-52ba44d80bec	5275	Godovič
00050000-5552-f76a-6525-ef19ef77a338	4204	Golnik
00050000-5552-f76a-9861-dda21c068314	3303	Gomilsko
00050000-5552-f76a-1b4e-3c8cc9d7717c	4224	Gorenja vas
00050000-5552-f76a-4101-ce9b8b1b1f09	3263	Gorica pri Slivnici
00050000-5552-f76a-d5b6-a641348ffa16	2272	Gorišnica
00050000-5552-f76a-cf2a-0688ca142597	9250	Gornja Radgona
00050000-5552-f76a-af78-29b49a976213	3342	Gornji Grad
00050000-5552-f76a-2410-e9ca91537bc3	4282	Gozd Martuljek
00050000-5552-f76a-c376-205b879feba1	6272	Gračišče
00050000-5552-f76a-9bf9-0be65381fa28	9264	Grad
00050000-5552-f76a-6c6e-a6e260a9c301	8332	Gradac
00050000-5552-f76a-43db-f7f86fd20305	1384	Grahovo
00050000-5552-f76a-8b2f-2195956d93d4	5242	Grahovo ob Bači
00050000-5552-f76a-61ab-fc032269109d	5251	Grgar
00050000-5552-f76a-b10d-2c31ce2f33a5	3302	Griže
00050000-5552-f76a-5195-980a2e675a11	3231	Grobelno
00050000-5552-f76a-5fcd-95e0871e0f3e	1290	Grosuplje
00050000-5552-f76a-3071-b2aa146b4d40	2288	Hajdina
00050000-5552-f76a-87ad-5174eaf511f7	8362	Hinje
00050000-5552-f76a-7a1a-acadde853cc2	2311	Hoče
00050000-5552-f76a-36a6-d3b7bdf09a7d	9205	Hodoš/Hodos
00050000-5552-f76a-6b35-ab7704873176	1354	Horjul
00050000-5552-f76a-3127-f70eeb383e8d	1372	Hotedršica
00050000-5552-f76a-e138-814766d9732c	1430	Hrastnik
00050000-5552-f76a-a1a3-1b67ec2511a3	6225	Hruševje
00050000-5552-f76a-62fb-06745ed84d1e	4276	Hrušica
00050000-5552-f76a-e8d7-b0ab1b6af73e	5280	Idrija
00050000-5552-f76a-933a-5e9a78e3d565	1292	Ig
00050000-5552-f76a-b901-dbd13a7b732b	6250	Ilirska Bistrica
00050000-5552-f76a-d5dc-70ccb8d0c143	6251	Ilirska Bistrica-Trnovo
00050000-5552-f76a-f33f-638340909301	1295	Ivančna Gorica
00050000-5552-f76a-5e74-800ef095830b	2259	Ivanjkovci
00050000-5552-f76a-6105-921aa80d7154	1411	Izlake
00050000-5552-f76a-513a-746da999588f	6310	Izola/Isola
00050000-5552-f76a-aa43-23e897adfb26	2222	Jakobski Dol
00050000-5552-f76a-7980-3b42473aa84a	2221	Jarenina
00050000-5552-f76a-3f5f-75e8962229e4	6254	Jelšane
00050000-5552-f76a-9d02-b26ad15db1fb	4270	Jesenice
00050000-5552-f76a-ecac-aaf33d60b760	8261	Jesenice na Dolenjskem
00050000-5552-f76a-6175-5d84a5679c85	3273	Jurklošter
00050000-5552-f76a-4c49-40ab887d725f	2223	Jurovski Dol
00050000-5552-f76a-f6b9-1d196443ac6b	2256	Juršinci
00050000-5552-f76a-883e-48848e9d832e	5214	Kal nad Kanalom
00050000-5552-f76a-6b7a-6fdd78a22ee6	3233	Kalobje
00050000-5552-f76a-2969-a1ca847a1556	4246	Kamna Gorica
00050000-5552-f76a-a710-e412b7af9749	2351	Kamnica
00050000-5552-f76a-9951-e86bdbb46c71	1241	Kamnik
00050000-5552-f76a-e365-a52740f1f22e	5213	Kanal
00050000-5552-f76a-b67a-27da459edf8a	8258	Kapele
00050000-5552-f76a-b14e-5f53b5d73012	2362	Kapla
00050000-5552-f76a-9c37-d4b7e6504191	2325	Kidričevo
00050000-5552-f76a-4229-2c2f9b3256fd	1412	Kisovec
00050000-5552-f76a-6e98-e43050555584	6253	Knežak
00050000-5552-f76a-77a7-a8d1f7e46551	5222	Kobarid
00050000-5552-f76a-bde2-473c43ef16bc	9227	Kobilje
00050000-5552-f76a-c055-289d9c630760	1330	Kočevje
00050000-5552-f76a-8a57-e10008e69846	1338	Kočevska Reka
00050000-5552-f76a-79a2-38a4c111ad60	2276	Kog
00050000-5552-f76a-ac92-0ccd0f197084	5211	Kojsko
00050000-5552-f76a-29af-51151efcbaf8	6223	Komen
00050000-5552-f76a-4fa5-687413f3afc1	1218	Komenda
00050000-5552-f76a-86ac-fa2c77dfdac2	6000	Koper/Capodistria 
00050000-5552-f76a-cb0c-91ae91210d42	6001	Koper/Capodistria - poštni predali
00050000-5552-f76a-fef8-0c4047f6afa0	8282	Koprivnica
00050000-5552-f76a-594b-c2befdb72445	5296	Kostanjevica na Krasu
00050000-5552-f76a-1039-0fe3eeaca52e	8311	Kostanjevica na Krki
00050000-5552-f76a-9b6b-8f0b310faa51	1336	Kostel
00050000-5552-f76a-2226-fc470dab046b	6256	Košana
00050000-5552-f76a-d91a-3be198270609	2394	Kotlje
00050000-5552-f76a-30de-054a21987c8b	6240	Kozina
00050000-5552-f76a-1032-5b2cc0519199	3260	Kozje
00050000-5552-f76a-f789-9319f3ca1742	4000	Kranj 
00050000-5552-f76a-5161-497bb955bbd7	4001	Kranj - poštni predali
00050000-5552-f76a-aad9-62a510acd737	4280	Kranjska Gora
00050000-5552-f76a-aba0-75720a7328d2	1281	Kresnice
00050000-5552-f76a-3efa-60ca23d125ac	4294	Križe
00050000-5552-f76a-fe74-7a92a94ba45d	9206	Križevci
00050000-5552-f76a-9532-c9e65cd44313	9242	Križevci pri Ljutomeru
00050000-5552-f76a-b757-34645698556c	1301	Krka
00050000-5552-f76a-f901-1f0621c13bcd	8296	Krmelj
00050000-5552-f76a-04bb-e89fbd4cfa54	4245	Kropa
00050000-5552-f76a-fda2-f4ab9c0d47e7	8262	Krška vas
00050000-5552-f76a-6c1b-7d77a02d2730	8270	Krško
00050000-5552-f76a-d91f-4c5603743e30	9263	Kuzma
00050000-5552-f76a-4ce5-d634512b9ffd	2318	Laporje
00050000-5552-f76a-b3ba-8e8788eaf58e	3270	Laško
00050000-5552-f76a-b8b5-25d6a615adfa	1219	Laze v Tuhinju
00050000-5552-f76a-4eb5-7040274895a7	2230	Lenart v Slovenskih goricah
00050000-5552-f76a-3e30-90f91698351c	9220	Lendava/Lendva
00050000-5552-f76a-0e39-8cff62b5187a	4248	Lesce
00050000-5552-f76a-3694-ffc354072ada	3261	Lesično
00050000-5552-f76a-c7d5-276a4e28f969	8273	Leskovec pri Krškem
00050000-5552-f76a-0476-ace19a81cbd4	2372	Libeliče
00050000-5552-f76a-8ae5-1b60a0ecf5b7	2341	Limbuš
00050000-5552-f76a-f5bf-fd00b1fb6998	1270	Litija
00050000-5552-f76a-7a7c-7a930fe4b78a	3202	Ljubečna
00050000-5552-f76a-bca4-cf5de580d440	1000	Ljubljana 
00050000-5552-f76a-77af-6cad41c5cc9e	1001	Ljubljana - poštni predali
00050000-5552-f76a-84ce-35e054b0aaf4	1231	Ljubljana - Črnuče
00050000-5552-f76a-daab-6cc27216dc44	1261	Ljubljana - Dobrunje
00050000-5552-f76a-a91a-07db13e99dfd	1260	Ljubljana - Polje
00050000-5552-f76a-7719-8f6573008673	1210	Ljubljana - Šentvid
00050000-5552-f76a-99d0-6d327a3b1330	1211	Ljubljana - Šmartno
00050000-5552-f76a-8c96-618e7de054b0	3333	Ljubno ob Savinji
00050000-5552-f76a-8b35-0d508916dd48	9240	Ljutomer
00050000-5552-f76a-27da-cbfd6bd883c7	3215	Loče
00050000-5552-f76a-a65a-f0c2104545d3	5231	Log pod Mangartom
00050000-5552-f76a-5487-74dfe8e68c34	1358	Log pri Brezovici
00050000-5552-f76a-aee3-82d5c6641a69	1370	Logatec
00050000-5552-f76a-d47c-ecfb4c83721e	1371	Logatec
00050000-5552-f76a-c5a2-13541773242f	1434	Loka pri Zidanem Mostu
00050000-5552-f76a-fcd9-9c9ec6f6bc2d	3223	Loka pri Žusmu
00050000-5552-f76a-d03d-281c84a14927	6219	Lokev
00050000-5552-f76a-e515-413c74cd5c75	1318	Loški Potok
00050000-5552-f76a-ea84-3634e00338e7	2324	Lovrenc na Dravskem polju
00050000-5552-f76a-9180-b6f4bf022b82	2344	Lovrenc na Pohorju
00050000-5552-f76a-8429-0dd1664902b8	3334	Luče
00050000-5552-f76a-546b-70d82b377403	1225	Lukovica
00050000-5552-f76a-2a57-2a2837051463	9202	Mačkovci
00050000-5552-f76a-71c6-6af85b117da4	2322	Majšperk
00050000-5552-f76a-ff3e-2e345fe1a316	2321	Makole
00050000-5552-f76a-a45f-7476ebda25ba	9243	Mala Nedelja
00050000-5552-f76a-595a-2181b884faaf	2229	Malečnik
00050000-5552-f76a-6f68-b60926d900e3	6273	Marezige
00050000-5552-f76a-1081-e446044dfefb	2000	Maribor 
00050000-5552-f76a-e08a-3989d0c33353	2001	Maribor - poštni predali
00050000-5552-f76a-dbaa-aede99e6b909	2206	Marjeta na Dravskem polju
00050000-5552-f76a-d770-679fb0980c71	2281	Markovci
00050000-5552-f76a-881c-f36d77787171	9221	Martjanci
00050000-5552-f76a-5a60-722168480399	6242	Materija
00050000-5552-f76a-71db-5ebb42a50cbd	4211	Mavčiče
00050000-5552-f76a-2246-3ffa60be4d89	1215	Medvode
00050000-5552-f76a-f5dc-c66494d377dd	1234	Mengeš
00050000-5552-f76a-fa2a-8bfdeb6f5049	8330	Metlika
00050000-5552-f76a-539c-05b01f6e4e5b	2392	Mežica
00050000-5552-f76a-9f04-64584eac15b9	2204	Miklavž na Dravskem polju
00050000-5552-f76a-fe62-4af7fe04ef89	2275	Miklavž pri Ormožu
00050000-5552-f76a-e797-7c2b85e10351	5291	Miren
00050000-5552-f76a-5a4b-fba1a89ab327	8233	Mirna
00050000-5552-f76a-4308-d5ee5860f2e0	8216	Mirna Peč
00050000-5552-f76a-5873-c7f734942c42	2382	Mislinja
00050000-5552-f76a-6b60-c9024f72d171	4281	Mojstrana
00050000-5552-f76a-01de-90797e1f5622	8230	Mokronog
00050000-5552-f76a-d5fd-63c8526c9e39	1251	Moravče
00050000-5552-f76a-a8c8-2275314c4dde	9226	Moravske Toplice
00050000-5552-f76a-0385-03376d38cc8d	5216	Most na Soči
00050000-5552-f76a-ce4e-fcab6a3717bb	1221	Motnik
00050000-5552-f76a-14c8-59ceae6ba678	3330	Mozirje
00050000-5552-f76a-8993-0d03050f2544	9000	Murska Sobota 
00050000-5552-f76a-7b79-43f794b17585	9001	Murska Sobota - poštni predali
00050000-5552-f76a-7c47-d8f1616c0ea3	2366	Muta
00050000-5552-f76a-c864-38e137ef7c66	4202	Naklo
00050000-5552-f76a-1def-de22020019f5	3331	Nazarje
00050000-5552-f76a-7d21-cd554b304e28	1357	Notranje Gorice
00050000-5552-f76a-033b-c8a3e6eb6022	3203	Nova Cerkev
00050000-5552-f76a-d172-4748b1bae916	5000	Nova Gorica 
00050000-5552-f76a-54fe-eca2bcb4945e	5001	Nova Gorica - poštni predali
00050000-5552-f76a-6149-54bdae2a368e	1385	Nova vas
00050000-5552-f76a-a1ff-ec47d52e67a9	8000	Novo mesto
00050000-5552-f76a-77e6-a0be4387fab8	8001	Novo mesto - poštni predali
00050000-5552-f76a-a4a7-e351c0e9ae63	6243	Obrov
00050000-5552-f76a-3704-6f8598cd3f1d	9233	Odranci
00050000-5552-f76a-db03-0e357abb4ca8	2317	Oplotnica
00050000-5552-f76a-67cd-f5e17c1ae5e0	2312	Orehova vas
00050000-5552-f76a-5949-537f74b34364	2270	Ormož
00050000-5552-f76a-8486-8e31c5e4fab7	1316	Ortnek
00050000-5552-f76a-950f-2520544c329d	1337	Osilnica
00050000-5552-f76a-e0c3-1bc2d8690079	8222	Otočec
00050000-5552-f76a-37e1-7e1902c35e0e	2361	Ožbalt
00050000-5552-f76a-8bb9-04cc15d8edd1	2231	Pernica
00050000-5552-f76a-546c-25d612122fd2	2211	Pesnica pri Mariboru
00050000-5552-f76a-ecea-d6fc313544ac	9203	Petrovci
00050000-5552-f76a-353e-64a0ae57cf97	3301	Petrovče
00050000-5552-f76a-c377-e97a48887e58	6330	Piran/Pirano
00050000-5552-f76a-84e1-368e04b62e6a	8255	Pišece
00050000-5552-f76a-3523-957b05a2178c	6257	Pivka
00050000-5552-f76a-7493-f81b6858d78e	6232	Planina
00050000-5552-f76a-65d8-3bb749180ac6	3225	Planina pri Sevnici
00050000-5552-f76a-7843-bf765ce8645c	6276	Pobegi
00050000-5552-f76a-ae46-ad510b4072ee	8312	Podbočje
00050000-5552-f76a-5e63-e4b493e8206b	5243	Podbrdo
00050000-5552-f76a-4394-db00443cd53a	3254	Podčetrtek
00050000-5552-f76a-2bac-d8b1f18c2f1c	2273	Podgorci
00050000-5552-f76a-3871-0534ea82ecc6	6216	Podgorje
00050000-5552-f76a-f2fd-10f9bdff4c58	2381	Podgorje pri Slovenj Gradcu
00050000-5552-f76a-f731-bb92b3441a9c	6244	Podgrad
00050000-5552-f76a-2509-d465c10b9d20	1414	Podkum
00050000-5552-f76a-9ea0-39b79522865c	2286	Podlehnik
00050000-5552-f76a-bfed-429450f88845	5272	Podnanos
00050000-5552-f76a-b19e-928d8877aff7	4244	Podnart
00050000-5552-f76a-4a93-6b9afcd5c39b	3241	Podplat
00050000-5552-f76a-9213-ca8916582548	3257	Podsreda
00050000-5552-f76a-9dcd-1d35d925aad1	2363	Podvelka
00050000-5552-f76a-7aa5-fffcc0b4ac27	2208	Pohorje
00050000-5552-f76a-74e2-b82df7786194	2257	Polenšak
00050000-5552-f76a-5ab4-0845de8b76d7	1355	Polhov Gradec
00050000-5552-f76a-44c4-2e44c4ade5f3	4223	Poljane nad Škofjo Loko
00050000-5552-f76a-490e-55a283f3a717	2319	Poljčane
00050000-5552-f76a-d449-66d4ed5e5228	1272	Polšnik
00050000-5552-f76a-ea72-57f1a10f63a4	3313	Polzela
00050000-5552-f76a-fcc0-da2be880c557	3232	Ponikva
00050000-5552-f76a-f8b8-734938371eaa	6320	Portorož/Portorose
00050000-5552-f76a-71fa-fd41c8417930	6230	Postojna
00050000-5552-f76a-f15d-4dc1a361ac05	2331	Pragersko
00050000-5552-f76a-86cc-1a01fd69d97e	3312	Prebold
00050000-5552-f76a-beb2-3ed93bc978be	4205	Preddvor
00050000-5552-f76a-b7bb-d3ac203b525a	6255	Prem
00050000-5552-f76a-d032-a8d9ebe39590	1352	Preserje
00050000-5552-f76a-1d50-553c3fffe082	6258	Prestranek
00050000-5552-f76a-d787-ae9112df3a69	2391	Prevalje
00050000-5552-f76a-4611-057e113052cb	3262	Prevorje
00050000-5552-f76a-d2ae-7f8d618fd04e	1276	Primskovo 
00050000-5552-f76a-eb1e-3c1f65a8ab7f	3253	Pristava pri Mestinju
00050000-5552-f76a-1ebf-7e8b7b741f65	9207	Prosenjakovci/Partosfalva
00050000-5552-f76a-85e7-9afdf362f2c4	5297	Prvačina
00050000-5552-f76a-6e9e-fd13bd33aefa	2250	Ptuj
00050000-5552-f76a-4b55-57c161ab3b79	2323	Ptujska Gora
00050000-5552-f76a-5101-264a51345e17	9201	Puconci
00050000-5552-f76a-835a-134d98056227	2327	Rače
00050000-5552-f76a-12f6-522c36a49baa	1433	Radeče
00050000-5552-f76a-fc6d-5d8d842661aa	9252	Radenci
00050000-5552-f76a-7183-ee6b53785d53	2360	Radlje ob Dravi
00050000-5552-f76a-5d91-690be80f9379	1235	Radomlje
00050000-5552-f76a-bbab-4c0a9724ec2b	4240	Radovljica
00050000-5552-f76a-aff7-942d2fd3c36f	8274	Raka
00050000-5552-f76a-c4e9-ff4f445d1ec9	1381	Rakek
00050000-5552-f76a-c402-09c9b0373ffe	4283	Rateče - Planica
00050000-5552-f76a-3d24-ca5122de7926	2390	Ravne na Koroškem
00050000-5552-f76a-5ae2-4cc94cafea64	9246	Razkrižje
00050000-5552-f76a-93c7-52c9163c36e7	3332	Rečica ob Savinji
00050000-5552-f76a-e405-fa13973928f7	5292	Renče
00050000-5552-f76a-e0f0-7fc25057b46c	1310	Ribnica
00050000-5552-f76a-d448-272a3a4a3ecf	2364	Ribnica na Pohorju
00050000-5552-f76a-dd87-c0d68b26e7d3	3272	Rimske Toplice
00050000-5552-f76a-d17b-367a1daa1be0	1314	Rob
00050000-5552-f76a-c88f-87cb26d9c40e	5215	Ročinj
00050000-5552-f76a-d1e8-158ec0399b1b	3250	Rogaška Slatina
00050000-5552-f76a-6f37-f22fa6334f2b	9262	Rogašovci
00050000-5552-f76a-3f07-c1879fb9f4de	3252	Rogatec
00050000-5552-f76a-4a2b-7da15cb96139	1373	Rovte
00050000-5552-f76a-1698-b31f1fc93e28	2342	Ruše
00050000-5552-f76a-993c-9506431785c6	1282	Sava
00050000-5552-f76a-0dad-23195aa6084a	6333	Sečovlje/Sicciole
00050000-5552-f76a-f5fb-945ccc9b4aec	4227	Selca
00050000-5552-f76a-2884-62c13cf590b0	2352	Selnica ob Dravi
00050000-5552-f76a-0f3d-0c7778c6f9d3	8333	Semič
00050000-5552-f76a-7a1b-83b62fc9e2ad	8281	Senovo
00050000-5552-f76a-56d9-4f252e650940	6224	Senožeče
00050000-5552-f76a-f209-734ab0701b16	8290	Sevnica
00050000-5552-f76a-67f8-fcf17e228094	6210	Sežana
00050000-5552-f76a-2ac1-a2a6d91d7e6f	2214	Sladki Vrh
00050000-5552-f76a-8a83-316686e2ba1e	5283	Slap ob Idrijci
00050000-5552-f76a-b0e2-e2bedbfc63af	2380	Slovenj Gradec
00050000-5552-f76a-ede2-d3acd898d358	2310	Slovenska Bistrica
00050000-5552-f76a-b218-dec76d0576d8	3210	Slovenske Konjice
00050000-5552-f76a-32c6-e787df57c169	1216	Smlednik
00050000-5552-f76a-b437-abb46be298a1	5232	Soča
00050000-5552-f76a-afe3-5ff5aadf933f	1317	Sodražica
00050000-5552-f76a-4738-5b6fb9d2713a	3335	Solčava
00050000-5552-f76a-36a7-5a9c8b827b5a	5250	Solkan
00050000-5552-f76a-2596-7fbf8a355f00	4229	Sorica
00050000-5552-f76a-09ec-e6f725b29284	4225	Sovodenj
00050000-5552-f76a-b8ee-37e1288420f1	5281	Spodnja Idrija
00050000-5552-f76a-0e97-77f5641d5c48	2241	Spodnji Duplek
00050000-5552-f76a-ae6c-b686cb518be7	9245	Spodnji Ivanjci
00050000-5552-f76a-3269-92408a08117a	2277	Središče ob Dravi
00050000-5552-f76a-fe56-4478824c2266	4267	Srednja vas v Bohinju
00050000-5552-f76a-ab46-52248324e1b7	8256	Sromlje 
00050000-5552-f76a-a037-c52223e13408	5224	Srpenica
00050000-5552-f76a-86ab-62f718cf3bad	1242	Stahovica
00050000-5552-f76a-7b6e-78f8c9b97f60	1332	Stara Cerkev
00050000-5552-f76a-99c7-69b78c7b5b2c	8342	Stari trg ob Kolpi
00050000-5552-f76a-58dd-fbc978a4cd8d	1386	Stari trg pri Ložu
00050000-5552-f76a-840b-8ae0b99d13b9	2205	Starše
00050000-5552-f76a-144c-02ea4725749e	2289	Stoperce
00050000-5552-f76a-565a-fb09773528e5	8322	Stopiče
00050000-5552-f76a-7b6a-afb9ff6dc04a	3206	Stranice
00050000-5552-f76a-f411-a2254afa717e	8351	Straža
00050000-5552-f76a-458d-e7c221e03de6	1313	Struge
00050000-5552-f76a-c60a-18827443ef25	8293	Studenec
00050000-5552-f76a-5be5-fc81dd18cf66	8331	Suhor
00050000-5552-f76a-96f6-0a1723f44ae7	2233	Sv. Ana v Slovenskih goricah
00050000-5552-f76a-2733-58109471a902	2235	Sv. Trojica v Slovenskih goricah
00050000-5552-f76a-e799-6252b60b4342	2353	Sveti Duh na Ostrem Vrhu
00050000-5552-f76a-97f0-e413d8c4c0a0	9244	Sveti Jurij ob Ščavnici
00050000-5552-f76a-71b8-868933e45b8a	3264	Sveti Štefan
00050000-5552-f76a-37fd-36b4ab67a6c2	2258	Sveti Tomaž
00050000-5552-f76a-4b3e-c08e59cc5ea2	9204	Šalovci
00050000-5552-f76a-3af4-f4e414c94e57	5261	Šempas
00050000-5552-f76a-476d-3531396c6bf1	5290	Šempeter pri Gorici
00050000-5552-f76a-d1b5-df9855a8c64d	3311	Šempeter v Savinjski dolini
00050000-5552-f76a-6b52-7b1139f968da	4208	Šenčur
00050000-5552-f76a-51df-8f1bed235c67	2212	Šentilj v Slovenskih goricah
00050000-5552-f76a-79a5-e183f8f36878	8297	Šentjanž
00050000-5552-f76a-e656-231bbee8c2de	2373	Šentjanž pri Dravogradu
00050000-5552-f76a-0f26-573b23054107	8310	Šentjernej
00050000-5552-f76a-5061-31242f4fbe7b	3230	Šentjur
00050000-5552-f76a-3fa7-b213134f1c75	3271	Šentrupert
00050000-5552-f76a-5430-146437ff7e13	8232	Šentrupert
00050000-5552-f76a-84be-62ca13606ed8	1296	Šentvid pri Stični
00050000-5552-f76a-0867-21dcee296f92	8275	Škocjan
00050000-5552-f76a-2a6c-d36582e7f626	6281	Škofije
00050000-5552-f76a-e417-28e2a55da265	4220	Škofja Loka
00050000-5552-f76a-81bf-2971add35211	3211	Škofja vas
00050000-5552-f76a-e633-fcf4660599fb	1291	Škofljica
00050000-5552-f76a-79e6-4a1b5fc31578	6274	Šmarje
00050000-5552-f76a-0604-c9ad22a17731	1293	Šmarje - Sap
00050000-5552-f76a-da4c-764651b40eaf	3240	Šmarje pri Jelšah
00050000-5552-f76a-83d9-637f93730eb3	8220	Šmarješke Toplice
00050000-5552-f76a-a831-37fbdc7703ca	2315	Šmartno na Pohorju
00050000-5552-f76a-e5ed-30838f25b207	3341	Šmartno ob Dreti
00050000-5552-f76a-0963-4570267f1935	3327	Šmartno ob Paki
00050000-5552-f76a-b90e-0159f9ff869b	1275	Šmartno pri Litiji
00050000-5552-f76a-cb93-689e8ec56225	2383	Šmartno pri Slovenj Gradcu
00050000-5552-f76a-9b28-1ff950873a74	3201	Šmartno v Rožni dolini
00050000-5552-f76a-9686-111163165a30	3325	Šoštanj
00050000-5552-f76a-c282-19441e0faa47	6222	Štanjel
00050000-5552-f76a-0524-e40c975b4d7e	3220	Štore
00050000-5552-f76a-8c89-a05ce51fb8c2	3304	Tabor
00050000-5552-f76a-ca8a-6633d638d1bd	3221	Teharje
00050000-5552-f76a-d29a-2348f69dde76	9251	Tišina
00050000-5552-f76a-b2d3-d5e4e5173321	5220	Tolmin
00050000-5552-f76a-caa7-3c78e589fda9	3326	Topolšica
00050000-5552-f76a-295e-47b173d668d7	2371	Trbonje
00050000-5552-f76a-28a2-e10c1b00a978	1420	Trbovlje
00050000-5552-f76a-4375-9e9b2376a9a4	8231	Trebelno 
00050000-5552-f76a-abf7-12fd8740de86	8210	Trebnje
00050000-5552-f76a-4f2a-55f75608b10f	5252	Trnovo pri Gorici
00050000-5552-f76a-17a4-7b53db2b11b0	2254	Trnovska vas
00050000-5552-f76a-d95b-499331660343	1222	Trojane
00050000-5552-f76a-f94e-dadbe179841f	1236	Trzin
00050000-5552-f76a-dfa1-a1f086c229fe	4290	Tržič
00050000-5552-f76a-dfda-58156283fbc3	8295	Tržišče
00050000-5552-f76a-3c98-e44852e558b6	1311	Turjak
00050000-5552-f76a-dec8-cb88a558bdc6	9224	Turnišče
00050000-5552-f76a-9a10-5553ecc9515d	8323	Uršna sela
00050000-5552-f76a-2a53-a5f1feb135b4	1252	Vače
00050000-5552-f76a-1ef8-d73dd37a4862	3320	Velenje 
00050000-5552-f76a-e406-5a40548e7a86	3322	Velenje - poštni predali
00050000-5552-f76a-def1-63d009c67f2b	8212	Velika Loka
00050000-5552-f76a-9567-f39f1ce80e49	2274	Velika Nedelja
00050000-5552-f76a-60e8-8eafb6297ab4	9225	Velika Polana
00050000-5552-f76a-87df-8800a08ac300	1315	Velike Lašče
00050000-5552-f76a-7837-2441567bf4cf	8213	Veliki Gaber
00050000-5552-f76a-0224-7e43df609ff2	9241	Veržej
00050000-5552-f76a-e20b-a5e4fd2ba757	1312	Videm - Dobrepolje
00050000-5552-f76a-3b49-6b101089eedd	2284	Videm pri Ptuju
00050000-5552-f76a-ee82-c40e08323d56	8344	Vinica
00050000-5552-f76a-c476-0088ed8ba8e8	5271	Vipava
00050000-5552-f76a-ed04-86b129e34b4c	4212	Visoko
00050000-5552-f76a-1c51-7e21d010de1e	1294	Višnja Gora
00050000-5552-f76a-2ab4-9595c2face30	3205	Vitanje
00050000-5552-f76a-193c-e42f6e3bb31a	2255	Vitomarci
00050000-5552-f76a-0218-d3ecb4d22152	1217	Vodice
00050000-5552-f76a-22fa-780eb1530d8e	3212	Vojnik\t
00050000-5552-f76a-bc36-731f26ae0061	5293	Volčja Draga
00050000-5552-f76a-4fea-d9e40d5604ab	2232	Voličina
00050000-5552-f76a-d715-6ce913333a20	3305	Vransko
00050000-5552-f76a-b26a-54a34e4a8692	6217	Vremski Britof
00050000-5552-f76a-dd43-5ac57fe739d6	1360	Vrhnika
00050000-5552-f76a-813f-a83d404fc29c	2365	Vuhred
00050000-5552-f76a-c819-f89932646545	2367	Vuzenica
00050000-5552-f76a-5c1b-846333932a0b	8292	Zabukovje 
00050000-5552-f76a-87bb-38850b520174	1410	Zagorje ob Savi
00050000-5552-f76a-b975-efe6348eaa21	1303	Zagradec
00050000-5552-f76a-7152-cbcd319017d0	2283	Zavrč
00050000-5552-f76a-518c-ed17d376ebe2	8272	Zdole 
00050000-5552-f76a-46a2-85598fa9499d	4201	Zgornja Besnica
00050000-5552-f76a-d2f4-03dbb6fb9652	2242	Zgornja Korena
00050000-5552-f76a-c647-e49e1eb9c5ab	2201	Zgornja Kungota
00050000-5552-f76a-3a65-1935fe73e360	2316	Zgornja Ložnica
00050000-5552-f76a-1913-6402ff4c9dba	2314	Zgornja Polskava
00050000-5552-f76a-5203-062ff386059f	2213	Zgornja Velka
00050000-5552-f76a-6506-e8354418772e	4247	Zgornje Gorje
00050000-5552-f76a-0855-b672f2c12d20	4206	Zgornje Jezersko
00050000-5552-f76a-0b00-48c02256bd7d	2285	Zgornji Leskovec
00050000-5552-f76a-6c9a-48fb01428985	1432	Zidani Most
00050000-5552-f76a-d48a-910ad8c5ec7b	3214	Zreče
00050000-5552-f76a-cfcc-3d5a217cfb0b	4209	Žabnica
00050000-5552-f76a-ff41-8b267f335348	3310	Žalec
00050000-5552-f76a-f56d-d66f3f594241	4228	Železniki
00050000-5552-f76a-51f9-2b5246b7c544	2287	Žetale
00050000-5552-f76a-8726-c8da36ffe906	4226	Žiri
00050000-5552-f76a-3fdd-877b42b722a7	4274	Žirovnica
00050000-5552-f76a-7868-5d7638d130f9	8360	Žužemberk
\.


--
-- TOC entry 2663 (class 0 OID 3283909)
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
-- TOC entry 2646 (class 0 OID 3283732)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3283798)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3283921)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3284026)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3284073)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 3283950)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3283894)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3283884)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3284063)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3284016)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3283599)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5552-f76a-e8d6-5b373d7b741c	00010000-5552-f76a-eff0-5b640c91235d	2015-05-13 09:04:11	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO2M793B3Ykl8AxXRq7poXvGVjDzmLNx2";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2670 (class 0 OID 3283959)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 3283637)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5552-f76a-e867-49f5f59b7ba1	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5552-f76a-8c99-fc46bd77c35e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5552-f76a-588f-74f6611c5773	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5552-f76a-b0b1-ded3d3f8b9a9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5552-f76a-a390-d90f14f02e20	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5552-f76a-9da1-6866a1d00e1a	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2636 (class 0 OID 3283621)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5552-f76a-e8d6-5b373d7b741c	00020000-5552-f76a-b0b1-ded3d3f8b9a9
00010000-5552-f76a-eff0-5b640c91235d	00020000-5552-f76a-b0b1-ded3d3f8b9a9
\.


--
-- TOC entry 2672 (class 0 OID 3283973)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3283915)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3283865)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3283697)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3283871)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3284051)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3283767)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 3283608)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5552-f76a-eff0-5b640c91235d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROoQmC0PvXVtI3ST7npBC2tAC/Yyifg/m	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5552-f76a-e8d6-5b373d7b741c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2684 (class 0 OID 3284105)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3283813)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3283942)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3284008)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3283841)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3284095)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3283998)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2278 (class 2606 OID 3283662)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 3284145)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3284138)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3284050)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 3283831)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 3283864)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 3283793)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 3283994)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3283811)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3283858)
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
-- TOC entry 2368 (class 2606 OID 3283907)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3283934)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 3283765)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2282 (class 2606 OID 3283671)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 3283729)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2284 (class 2606 OID 3283695)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 3283651)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2269 (class 2606 OID 3283636)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3283940)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 3283972)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 3284090)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 3283722)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3283753)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 3283913)
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
-- TOC entry 2302 (class 2606 OID 3283743)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 3283802)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 3283925)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3284032)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 3284078)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3283957)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 3283898)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 3283889)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 3284072)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3284023)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 3283607)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 3283963)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 3283625)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2271 (class 2606 OID 3283645)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 3283981)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3283920)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 3283870)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 3283702)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 3283880)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3284062)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 3283778)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3283620)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 3284120)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 3283817)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 3283948)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3284014)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 3283853)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 3284104)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 3284007)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 1259 OID 3283838)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2290 (class 1259 OID 3283724)
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
-- TOC entry 2381 (class 1259 OID 3283941)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2375 (class 1259 OID 3283927)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2376 (class 1259 OID 3283926)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2327 (class 1259 OID 3283818)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 3283997)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2403 (class 1259 OID 3283995)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2404 (class 1259 OID 3283996)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2427 (class 1259 OID 3284092)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2428 (class 1259 OID 3284093)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 3284094)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2435 (class 1259 OID 3284123)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2436 (class 1259 OID 3284122)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2437 (class 1259 OID 3284121)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2309 (class 1259 OID 3283780)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2310 (class 1259 OID 3283779)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2294 (class 1259 OID 3283731)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3283730)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2390 (class 1259 OID 3283964)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2345 (class 1259 OID 3283859)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2273 (class 1259 OID 3283652)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2274 (class 1259 OID 3283653)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2395 (class 1259 OID 3283984)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2396 (class 1259 OID 3283983)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2397 (class 1259 OID 3283982)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2319 (class 1259 OID 3283803)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2320 (class 1259 OID 3283805)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2321 (class 1259 OID 3283804)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2355 (class 1259 OID 3283893)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2356 (class 1259 OID 3283891)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2357 (class 1259 OID 3283890)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2358 (class 1259 OID 3283892)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2264 (class 1259 OID 3283626)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2265 (class 1259 OID 3283627)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2384 (class 1259 OID 3283949)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2370 (class 1259 OID 3283914)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2410 (class 1259 OID 3284024)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2411 (class 1259 OID 3284025)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2298 (class 1259 OID 3283745)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2299 (class 1259 OID 3283744)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2300 (class 1259 OID 3283746)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 3284033)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2415 (class 1259 OID 3284034)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2446 (class 1259 OID 3284148)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 3284147)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2448 (class 1259 OID 3284150)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2449 (class 1259 OID 3284146)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2450 (class 1259 OID 3284149)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2407 (class 1259 OID 3284015)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2361 (class 1259 OID 3283902)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2362 (class 1259 OID 3283901)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2363 (class 1259 OID 3283899)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2364 (class 1259 OID 3283900)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2251 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2442 (class 1259 OID 3284140)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 3284139)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2326 (class 1259 OID 3283812)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2279 (class 1259 OID 3283673)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2280 (class 1259 OID 3283672)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2286 (class 1259 OID 3283703)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 3283704)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2350 (class 1259 OID 3283883)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2351 (class 1259 OID 3283882)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 3283881)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2333 (class 1259 OID 3283840)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2334 (class 1259 OID 3283836)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2335 (class 1259 OID 3283833)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2336 (class 1259 OID 3283834)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2337 (class 1259 OID 3283832)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2338 (class 1259 OID 3283837)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2339 (class 1259 OID 3283835)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2293 (class 1259 OID 3283723)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2315 (class 1259 OID 3283794)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2316 (class 1259 OID 3283796)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2317 (class 1259 OID 3283795)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2318 (class 1259 OID 3283797)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2369 (class 1259 OID 3283908)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2432 (class 1259 OID 3284091)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2285 (class 1259 OID 3283696)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2308 (class 1259 OID 3283766)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2389 (class 1259 OID 3283958)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2254 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 3283754)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2426 (class 1259 OID 3284079)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2272 (class 1259 OID 3283646)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2340 (class 1259 OID 3283839)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2475 (class 2606 OID 3284281)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2478 (class 2606 OID 3284266)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2477 (class 2606 OID 3284271)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2473 (class 2606 OID 3284291)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2479 (class 2606 OID 3284261)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2474 (class 2606 OID 3284286)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2476 (class 2606 OID 3284276)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2460 (class 2606 OID 3284196)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2496 (class 2606 OID 3284376)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2494 (class 2606 OID 3284371)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2495 (class 2606 OID 3284366)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2472 (class 2606 OID 3284256)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2502 (class 2606 OID 3284416)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2504 (class 2606 OID 3284406)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2503 (class 2606 OID 3284411)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2492 (class 2606 OID 3284356)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 3284451)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 3284456)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 3284461)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2514 (class 2606 OID 3284476)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2515 (class 2606 OID 3284471)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2516 (class 2606 OID 3284466)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2466 (class 2606 OID 3284231)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2467 (class 2606 OID 3284226)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 3284206)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 3284201)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3284181)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2498 (class 2606 OID 3284386)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2480 (class 2606 OID 3284296)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2454 (class 2606 OID 3284161)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2453 (class 2606 OID 3284166)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2499 (class 2606 OID 3284401)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2500 (class 2606 OID 3284396)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2501 (class 2606 OID 3284391)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2470 (class 2606 OID 3284236)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2468 (class 2606 OID 3284246)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2469 (class 2606 OID 3284241)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2484 (class 2606 OID 3284331)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2486 (class 2606 OID 3284321)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2487 (class 2606 OID 3284316)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2485 (class 2606 OID 3284326)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2452 (class 2606 OID 3284151)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2451 (class 2606 OID 3284156)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2497 (class 2606 OID 3284381)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2493 (class 2606 OID 3284361)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2507 (class 2606 OID 3284426)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2506 (class 2606 OID 3284431)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3284216)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2465 (class 2606 OID 3284211)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2463 (class 2606 OID 3284221)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2509 (class 2606 OID 3284436)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 3284441)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2521 (class 2606 OID 3284501)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 3284496)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2519 (class 2606 OID 3284511)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2523 (class 2606 OID 3284491)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2520 (class 2606 OID 3284506)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2505 (class 2606 OID 3284421)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2488 (class 2606 OID 3284351)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2489 (class 2606 OID 3284346)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 3284336)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2490 (class 2606 OID 3284341)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2517 (class 2606 OID 3284486)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2518 (class 2606 OID 3284481)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2471 (class 2606 OID 3284251)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2510 (class 2606 OID 3284446)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 3284176)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2456 (class 2606 OID 3284171)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2459 (class 2606 OID 3284186)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3284191)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2481 (class 2606 OID 3284311)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2482 (class 2606 OID 3284306)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2483 (class 2606 OID 3284301)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-13 09:04:11 CEST

--
-- PostgreSQL database dump complete
--

