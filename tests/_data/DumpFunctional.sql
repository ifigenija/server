--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-11 16:38:01 CEST

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
-- TOC entry 179 (class 1259 OID 3092070)
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
-- TOC entry 225 (class 1259 OID 3092553)
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
-- TOC entry 224 (class 1259 OID 3092536)
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
-- TOC entry 217 (class 1259 OID 3092451)
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
-- TOC entry 193 (class 1259 OID 3092235)
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
-- TOC entry 196 (class 1259 OID 3092276)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3092197)
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
-- TOC entry 212 (class 1259 OID 3092401)
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
-- TOC entry 191 (class 1259 OID 3092222)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3092270)
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
-- TOC entry 201 (class 1259 OID 3092319)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3092344)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3092171)
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
-- TOC entry 180 (class 1259 OID 3092079)
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
-- TOC entry 181 (class 1259 OID 3092090)
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
-- TOC entry 184 (class 1259 OID 3092141)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3092044)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3092063)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3092351)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3092381)
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
-- TOC entry 221 (class 1259 OID 3092493)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    opis text
);


--
-- TOC entry 183 (class 1259 OID 3092121)
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
-- TOC entry 186 (class 1259 OID 3092163)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3092325)
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
-- TOC entry 185 (class 1259 OID 3092148)
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
-- TOC entry 190 (class 1259 OID 3092214)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3092337)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3092442)
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
-- TOC entry 220 (class 1259 OID 3092486)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3092366)
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
-- TOC entry 200 (class 1259 OID 3092310)
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
-- TOC entry 199 (class 1259 OID 3092300)
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
-- TOC entry 219 (class 1259 OID 3092476)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3092432)
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
-- TOC entry 173 (class 1259 OID 3092015)
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
-- TOC entry 172 (class 1259 OID 3092013)
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
-- TOC entry 209 (class 1259 OID 3092375)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3092053)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3092037)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3092389)
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
-- TOC entry 203 (class 1259 OID 3092331)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3092281)
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
-- TOC entry 182 (class 1259 OID 3092113)
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
-- TOC entry 198 (class 1259 OID 3092287)
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
-- TOC entry 218 (class 1259 OID 3092467)
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
-- TOC entry 188 (class 1259 OID 3092183)
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
-- TOC entry 174 (class 1259 OID 3092024)
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
-- TOC entry 223 (class 1259 OID 3092517)
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
-- TOC entry 192 (class 1259 OID 3092229)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3092358)
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
-- TOC entry 214 (class 1259 OID 3092424)
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
-- TOC entry 194 (class 1259 OID 3092257)
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
-- TOC entry 222 (class 1259 OID 3092507)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3092414)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3092018)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 3092070)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3092553)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3092536)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3092451)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3092235)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3092276)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3092197)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5550-bec8-d816-444aac81c786	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5550-bec8-d5d1-618490aed212	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5550-bec8-4f20-1eb1385ef3c2	AL	ALB	008	Albania 	Albanija	\N
00040000-5550-bec8-3657-8fabd5a50f00	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5550-bec8-6cb8-d23d568f7d30	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5550-bec8-3d0d-12b831428e99	AD	AND	020	Andorra 	Andora	\N
00040000-5550-bec8-0373-6c0dcbbfccf5	AO	AGO	024	Angola 	Angola	\N
00040000-5550-bec8-ad92-32de3eb377c6	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5550-bec8-34db-27680b9f5dd9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5550-bec8-9cf4-6e92088b7bad	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5550-bec8-4151-445094dbf40f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5550-bec8-3441-0da3e088d826	AM	ARM	051	Armenia 	Armenija	\N
00040000-5550-bec8-f30c-28373c93fd13	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5550-bec8-3b4c-be7f04868135	AU	AUS	036	Australia 	Avstralija	\N
00040000-5550-bec8-e0d4-1e438a976c62	AT	AUT	040	Austria 	Avstrija	\N
00040000-5550-bec8-f468-7aad6644475e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5550-bec8-fa97-0a1cd90fdbf8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5550-bec8-ad9e-5c9fcbd02e1e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5550-bec8-210f-5e57f105bacb	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5550-bec8-e7d0-3c53ee98b3e7	BB	BRB	052	Barbados 	Barbados	\N
00040000-5550-bec8-d3c2-2ec639cfdd73	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5550-bec8-46cf-8c31144b30c7	BE	BEL	056	Belgium 	Belgija	\N
00040000-5550-bec8-afca-7e9b9bcce488	BZ	BLZ	084	Belize 	Belize	\N
00040000-5550-bec8-569a-36a89c8cc2ce	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5550-bec8-3415-8b9852bf4063	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5550-bec8-a0f7-f3cc2e4bca77	BT	BTN	064	Bhutan 	Butan	\N
00040000-5550-bec8-b927-2bd115b9d40a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5550-bec8-29c0-48958e708f86	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5550-bec8-d8aa-b23c4cde01ae	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5550-bec8-939e-41b76b979ce8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5550-bec8-6438-7815bc3d8960	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5550-bec8-ec40-1015a2379576	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5550-bec8-ead4-ad89f557948b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5550-bec8-7e7c-a2b9f478e34a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5550-bec8-626b-ec94ed872bdc	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5550-bec8-49b0-26cc82cd6bc4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5550-bec8-a806-737f36ac9461	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5550-bec8-8945-8021b944b4c8	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5550-bec8-6998-c323b205e4b8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5550-bec8-4218-2209ae4c4492	CA	CAN	124	Canada 	Kanada	\N
00040000-5550-bec8-a325-a564d764746b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5550-bec8-eaa6-e39ec547e320	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5550-bec8-c522-b6815dd682f8	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5550-bec8-7b22-3f986f00d827	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5550-bec8-fa18-627b825cb827	CL	CHL	152	Chile 	Čile	\N
00040000-5550-bec8-c2d4-f3276fa3add1	CN	CHN	156	China 	Kitajska	\N
00040000-5550-bec8-5075-04236f7a8ecc	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5550-bec8-2684-efa9da73890f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5550-bec8-a997-ee57f3aeb5cc	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5550-bec8-e201-9ecf69071b46	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5550-bec8-7b6c-bc1c8256a90e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5550-bec8-4329-2dbd3c37f168	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5550-bec8-2676-c5d8e55cecfd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5550-bec8-d423-10176f344f11	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5550-bec8-6f9f-b0a645fcb0c6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5550-bec8-b75f-caba6dc6c070	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5550-bec8-82d5-9fb7a2807821	CU	CUB	192	Cuba 	Kuba	\N
00040000-5550-bec8-8756-6cc9adab0c4e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5550-bec8-a6f7-c7a5bb4faefc	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5550-bec8-acfd-bef24e036cd0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5550-bec8-015e-80734be2c685	DK	DNK	208	Denmark 	Danska	\N
00040000-5550-bec8-f345-883e1a0d46ae	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5550-bec8-1a98-3382dee3dfb4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5550-bec8-43f4-b5c8d38012e0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5550-bec8-1229-24d9c1795ca7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5550-bec8-0b85-327c115be92b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5550-bec8-3aad-a383bb9a9b8b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5550-bec8-117e-58f1e1be19c8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5550-bec8-d305-fb35a5c2c01f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5550-bec8-c9e6-05136317d8fa	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5550-bec8-ab6a-00deda0093d9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5550-bec8-617e-ddcdd0ddace4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5550-bec8-79ca-4f7657574023	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5550-bec8-414d-076fced25a95	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5550-bec8-4991-7360a459cb6a	FI	FIN	246	Finland 	Finska	\N
00040000-5550-bec8-72d7-8ddba129ce52	FR	FRA	250	France 	Francija	\N
00040000-5550-bec8-d358-d591c50ad8b8	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5550-bec8-60ec-7450e657b990	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5550-bec8-f701-3232e606f36e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5550-bec8-83b8-c05bcd15375b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5550-bec8-bd4b-48caa09112b6	GA	GAB	266	Gabon 	Gabon	\N
00040000-5550-bec8-d39b-7d00b60ba3a3	GM	GMB	270	Gambia 	Gambija	\N
00040000-5550-bec8-72ec-cf05081a0fc1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5550-bec8-c0de-3204c5e2ce6f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5550-bec8-09c7-5bd971c68420	GH	GHA	288	Ghana 	Gana	\N
00040000-5550-bec8-30b5-8478c4e2470e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5550-bec8-d158-2ee0fa11b45d	GR	GRC	300	Greece 	Grčija	\N
00040000-5550-bec8-a5b4-17e168c4b675	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5550-bec8-e91a-39310aed2199	GD	GRD	308	Grenada 	Grenada	\N
00040000-5550-bec8-fb60-493af1f8f61d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5550-bec8-ed73-25039aa7620b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5550-bec8-debf-ba883f6fce4e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5550-bec8-62cf-26c8a30deb5d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5550-bec8-ce34-a7c496ca7d3a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5550-bec8-42d1-efcdf9c22ed5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5550-bec8-2af2-68b11a94a00a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5550-bec8-7bb5-32ab3e96b9d1	HT	HTI	332	Haiti 	Haiti	\N
00040000-5550-bec8-2aff-17c4e06e6e8b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5550-bec8-4c15-c4a1a1369b88	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5550-bec8-af3b-8fed01505a69	HN	HND	340	Honduras 	Honduras	\N
00040000-5550-bec8-e96d-21604c7ea27e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5550-bec8-0b7a-3b985dcbcfbf	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5550-bec8-0376-5e30f0b8e644	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5550-bec8-2a20-3a6a29e5041f	IN	IND	356	India 	Indija	\N
00040000-5550-bec8-02fe-d084528c918b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5550-bec8-de8e-a045b7ff9a9a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5550-bec8-3741-59b1468572f2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5550-bec8-097d-39902127a471	IE	IRL	372	Ireland 	Irska	\N
00040000-5550-bec8-6706-e0defb60ea6e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5550-bec8-dfdb-df850b432693	IL	ISR	376	Israel 	Izrael	\N
00040000-5550-bec8-ed77-781be2f56ea6	IT	ITA	380	Italy 	Italija	\N
00040000-5550-bec8-23be-3fa10a886b53	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5550-bec8-5f0f-e27e0bd5f056	JP	JPN	392	Japan 	Japonska	\N
00040000-5550-bec8-c3fa-1af496772721	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5550-bec8-f1a6-6d9bcf3c2c4e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5550-bec8-a378-c88cf1c6aa20	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5550-bec8-b2f3-1397b6e7edcd	KE	KEN	404	Kenya 	Kenija	\N
00040000-5550-bec8-6a38-dff1c09e8c67	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5550-bec8-bc4a-fed8ecc60ca4	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5550-bec8-b6ff-c85669daa8c5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5550-bec8-dace-ab3ab732fbf3	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5550-bec8-b095-cc142764104e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5550-bec8-2029-0d7e398c0fdf	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5550-bec8-3e64-297836ec51c4	LV	LVA	428	Latvia 	Latvija	\N
00040000-5550-bec8-ed5c-c780e16fd82a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5550-bec8-8a58-14ca7e2d7b20	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5550-bec8-1dba-2fa15379cf16	LR	LBR	430	Liberia 	Liberija	\N
00040000-5550-bec8-a0d6-90a02b12c178	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5550-bec8-34c4-95d8fc279d4b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5550-bec8-fe09-164881fa8c84	LT	LTU	440	Lithuania 	Litva	\N
00040000-5550-bec8-832a-7a297b18e2db	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5550-bec8-572c-60377ff4b762	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5550-bec8-b939-21d6a2ccac5d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5550-bec8-e4d5-f1ab5b9823c2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5550-bec8-a438-c9c02d3bd743	MW	MWI	454	Malawi 	Malavi	\N
00040000-5550-bec8-5ce4-4580a1e3f549	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5550-bec8-3df2-bff1989a0830	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5550-bec8-70d2-3327ea0248df	ML	MLI	466	Mali 	Mali	\N
00040000-5550-bec8-9d16-4ce14fb7a7c3	MT	MLT	470	Malta 	Malta	\N
00040000-5550-bec8-2401-5f81e774ba21	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5550-bec8-74b6-05a967aec530	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5550-bec8-7fba-5eb8d328bb8b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5550-bec8-38ab-e4f1843ca253	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5550-bec8-95f8-ee30155172ce	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5550-bec8-b863-076632386467	MX	MEX	484	Mexico 	Mehika	\N
00040000-5550-bec8-e60a-a3b424896d7e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5550-bec8-1e24-8d24dd0bdd4e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5550-bec8-ef2a-8a21f89ec226	MC	MCO	492	Monaco 	Monako	\N
00040000-5550-bec8-00f9-2ab801f63e84	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5550-bec8-af7f-ec4047fe1c43	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5550-bec8-c591-6e62ccd90e43	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5550-bec8-b871-d2dad972ea56	MA	MAR	504	Morocco 	Maroko	\N
00040000-5550-bec8-e5c4-8c5db45d4df5	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5550-bec8-fc3f-5d6489f80bf3	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5550-bec8-e583-380cb020e005	NA	NAM	516	Namibia 	Namibija	\N
00040000-5550-bec8-70b1-6216b8af912b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5550-bec8-3dc0-763efcdf5d99	NP	NPL	524	Nepal 	Nepal	\N
00040000-5550-bec8-4a89-7a3893d0eaff	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5550-bec8-c6a3-9132b79e72a7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5550-bec8-fef6-3cb77901031d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5550-bec8-a225-a0572d124f75	NE	NER	562	Niger 	Niger 	\N
00040000-5550-bec8-05e1-a64afde44474	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5550-bec8-6684-8786d381ce26	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5550-bec8-ac43-84736e651da7	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5550-bec8-3f9d-83e3926ea9cf	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5550-bec8-302c-65702c3b4793	NO	NOR	578	Norway 	Norveška	\N
00040000-5550-bec8-bcb8-1ab7d84038e1	OM	OMN	512	Oman 	Oman	\N
00040000-5550-bec8-9196-6f51cd8d8060	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5550-bec8-9330-0e9bab118f5a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5550-bec8-62ec-e277204ad2d2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5550-bec8-5a12-4e967d9dd6a3	PA	PAN	591	Panama 	Panama	\N
00040000-5550-bec8-bc7f-a0b82fc3e78c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5550-bec8-a3f6-22c2217577ab	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5550-bec8-bae3-ab0b882bc514	PE	PER	604	Peru 	Peru	\N
00040000-5550-bec8-d87a-b293d66b1010	PH	PHL	608	Philippines 	Filipini	\N
00040000-5550-bec8-b2d6-0581d2168406	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5550-bec8-e086-74ed2bd159ee	PL	POL	616	Poland 	Poljska	\N
00040000-5550-bec8-4313-c9753e859be6	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5550-bec8-335d-c701b0889655	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5550-bec8-668d-42c21ee080d8	QA	QAT	634	Qatar 	Katar	\N
00040000-5550-bec8-ab3d-2a97467923e1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5550-bec8-6b27-ccf70d35589b	RO	ROU	642	Romania 	Romunija	\N
00040000-5550-bec8-63b5-26af67990ddf	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5550-bec8-d830-8757c1f31ac3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5550-bec8-204e-23a96c7b06fe	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5550-bec8-6f3e-d3eeb566ff46	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5550-bec8-796e-3a2ff95eb62a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5550-bec8-f64c-78fe2112ae80	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5550-bec8-713f-c0366c8d562e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5550-bec8-b279-e6c75871f7e4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5550-bec8-17cf-cbc79fe5cdbd	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5550-bec8-4dfb-a989c11c4495	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5550-bec8-b7e9-091a07f79efc	SM	SMR	674	San Marino 	San Marino	\N
00040000-5550-bec8-828c-2d6a58cf0a08	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5550-bec8-5a6c-6f8edd5ee1da	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5550-bec8-8d10-e36991b0a11d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5550-bec8-6794-c492d2b78ab3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5550-bec8-8aea-2f131857638f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5550-bec8-ff5e-9e68a4f41e83	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5550-bec8-5834-440da97ffca8	SG	SGP	702	Singapore 	Singapur	\N
00040000-5550-bec8-54cd-e5a0eb79ab7e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5550-bec8-bc3a-eef3c5dbb4a0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5550-bec8-9a16-b70e93c8d82e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5550-bec8-6895-5483a11550b4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5550-bec8-b047-fb290053b151	SO	SOM	706	Somalia 	Somalija	\N
00040000-5550-bec8-b078-5f415e8c1bac	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5550-bec8-1e55-4aa870f62588	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5550-bec8-fcbe-701419d856a4	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5550-bec8-2bb9-8948412025b4	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5550-bec8-23a7-d2b2fae2561c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5550-bec8-0269-13164a5962a8	SD	SDN	729	Sudan 	Sudan	\N
00040000-5550-bec8-12a2-f383375cfe47	SR	SUR	740	Suriname 	Surinam	\N
00040000-5550-bec8-682a-ab77ec95def9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5550-bec8-4580-ea203145ac81	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5550-bec8-a7e1-70ad3413bba7	SE	SWE	752	Sweden 	Švedska	\N
00040000-5550-bec8-7048-6bb2481f2c4e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5550-bec8-d6b7-72a9ee39e7e4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5550-bec8-8004-15de8889bafc	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5550-bec8-e039-e3f56e2251b7	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5550-bec8-ae3c-e0f27fcbdabd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5550-bec8-b98e-6b5338a7c6cb	TH	THA	764	Thailand 	Tajska	\N
00040000-5550-bec8-58c5-ebe4842e31ae	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5550-bec8-317a-8a9ca606bafd	TG	TGO	768	Togo 	Togo	\N
00040000-5550-bec8-7d80-f514015e1ad5	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5550-bec8-56c0-36f23147e617	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5550-bec8-37e3-0ecd72581088	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5550-bec8-b4ae-7875a76496ea	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5550-bec8-f0b7-338cd86a0e27	TR	TUR	792	Turkey 	Turčija	\N
00040000-5550-bec8-9a9f-691671fb36dc	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5550-bec8-4c2b-68e905c610fe	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5550-bec8-8754-d2d847611766	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5550-bec8-cd4a-0c03f7883ee3	UG	UGA	800	Uganda 	Uganda	\N
00040000-5550-bec8-36a7-1cbdb01386cd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5550-bec8-14d2-9c48eb30c6df	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5550-bec8-d4ad-72c67bf50a2b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5550-bec8-7953-d64f60936fa1	US	USA	840	United States 	Združene države Amerike	\N
00040000-5550-bec8-24f7-17ec5f853d5f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5550-bec8-9f36-bd4bdb128ef0	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5550-bec8-2275-fa31fbcd697a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5550-bec8-4ca7-34ca6b3e26bb	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5550-bec8-4e76-ff31a4308f8e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5550-bec8-c9e3-ce2a7fe329e3	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5550-bec8-9d45-0ea2eebdb612	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5550-bec8-bc80-ef2b79df9106	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5550-bec8-f0d3-1e31bee0c552	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5550-bec8-9004-cc988101203d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5550-bec8-88ca-8d22eab4ce6c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5550-bec8-dcf6-3287b08d7678	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5550-bec8-e40a-91aa7bdffcdb	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 3092401)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3092222)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3092270)
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
-- TOC entry 2658 (class 0 OID 3092319)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3092344)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3092171)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5550-bec8-371c-1aacae5a7313	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5550-bec8-168c-f9f63c1c0770	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5550-bec8-b2ff-a3f7ebd52dfd	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5550-bec8-850c-a33478b5b1e4	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5550-bec8-5d3a-b3a3fb0828f3	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5550-bec8-3afe-61b5cdde69f7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5550-bec8-dd87-f9e688ab42d3	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5550-bec8-7f1e-fee0921b6d92	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5550-bec8-a950-e27ac48016fd	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5550-bec8-ecb3-11ee3baea342	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 3092079)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5550-bec8-68ad-7134957bc705	00000000-5550-bec8-5d3a-b3a3fb0828f3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5550-bec8-83e1-1861ba0fd7d5	00000000-5550-bec8-5d3a-b3a3fb0828f3	00010000-5550-bec8-a95b-38a152c80421	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5550-bec8-7499-9d731fe27a16	00000000-5550-bec8-3afe-61b5cdde69f7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 3092090)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3092141)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 3092044)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5550-bec8-f908-58ef17d13e3d	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5550-bec8-df29-61149f25b889	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5550-bec8-26f9-518450ba4ddd	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5550-bec8-8307-9c59538ade76	Abonma-read	Abonma - branje	f
00030000-5550-bec8-ba29-77e5632a138a	Abonma-write	Abonma - spreminjanje	f
00030000-5550-bec8-ad34-c72d59ac9b71	Alternacija-read	Alternacija - branje	f
00030000-5550-bec8-5bee-1348e7c700e3	Alternacija-write	Alternacija - spreminjanje	f
00030000-5550-bec8-086e-656c2733e1f7	Arhivalija-read	Arhivalija - branje	f
00030000-5550-bec8-9847-f5a2efb13106	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5550-bec8-e8ab-9fd8886241a2	Besedilo-read	Besedilo - branje	f
00030000-5550-bec8-f144-b23b655a9aef	Besedilo-write	Besedilo - spreminjanje	f
00030000-5550-bec8-344b-67b55f7b4e20	DogodekIzven-read	DogodekIzven - branje	f
00030000-5550-bec8-fc26-ccd99b61fabf	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5550-bec8-89b1-68851a78457b	Dogodek-read	Dogodek - branje	f
00030000-5550-bec8-ed33-06fa5abf3a1c	Dogodek-write	Dogodek - spreminjanje	f
00030000-5550-bec8-5c70-aefc99b63d9d	Drzava-read	Drzava - branje	f
00030000-5550-bec8-28aa-52941dfb32b6	Drzava-write	Drzava - spreminjanje	f
00030000-5550-bec8-bd00-680754badf09	Funkcija-read	Funkcija - branje	f
00030000-5550-bec8-dd91-b98ef290a150	Funkcija-write	Funkcija - spreminjanje	f
00030000-5550-bec8-06b0-048216a3a87c	Gostovanje-read	Gostovanje - branje	f
00030000-5550-bec8-9cec-f15c28c0d49d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5550-bec8-43e9-e05996e1d180	Gostujoca-read	Gostujoca - branje	f
00030000-5550-bec8-d7f4-453aa30beaad	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5550-bec8-14e5-1f6fa4897e58	Kupec-read	Kupec - branje	f
00030000-5550-bec8-6ccb-acc7468b5e58	Kupec-write	Kupec - spreminjanje	f
00030000-5550-bec8-6d49-a58d29075769	NacinPlacina-read	NacinPlacina - branje	f
00030000-5550-bec8-03f2-f400ef56c8f7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5550-bec8-86e9-9efc1af2ec17	Option-read	Option - branje	f
00030000-5550-bec8-e77e-15d7b97ad6f9	Option-write	Option - spreminjanje	f
00030000-5550-bec8-534b-1552d13d078e	OptionValue-read	OptionValue - branje	f
00030000-5550-bec8-6a96-31485986637d	OptionValue-write	OptionValue - spreminjanje	f
00030000-5550-bec8-3842-ac7e568aec8d	Oseba-read	Oseba - branje	f
00030000-5550-bec8-31ec-a8d79f1144b4	Oseba-write	Oseba - spreminjanje	f
00030000-5550-bec8-91d6-a6790f36768d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5550-bec8-b9fb-2dd8df7e5990	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5550-bec8-a895-58fd830d34fd	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5550-bec8-70f8-fc00e62ae153	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5550-bec8-84fc-fa73e42430d4	Pogodba-read	Pogodba - branje	f
00030000-5550-bec8-5dbc-758c2fb5b14b	Pogodba-write	Pogodba - spreminjanje	f
00030000-5550-bec8-eb31-9ac12defbb8e	Popa-read	Popa - branje	f
00030000-5550-bec8-4045-435e05588d6c	Popa-write	Popa - spreminjanje	f
00030000-5550-bec8-ec53-2444d00c556d	Posta-read	Posta - branje	f
00030000-5550-bec8-03f3-201298a64db5	Posta-write	Posta - spreminjanje	f
00030000-5550-bec8-f13d-81ec9fc54d48	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5550-bec8-a581-49199befd3ab	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5550-bec8-ff3e-93ccbf9e8226	PostniNaslov-read	PostniNaslov - branje	f
00030000-5550-bec8-ce34-644531942e19	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5550-bec8-94c5-438b8b12e38d	Predstava-read	Predstava - branje	f
00030000-5550-bec8-87f0-58caba8022ed	Predstava-write	Predstava - spreminjanje	f
00030000-5550-bec8-f014-65bb4e6b5235	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5550-bec8-c151-9ec44ba4649a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5550-bec8-f12c-b93c40fe8e2d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5550-bec8-ba74-004ba6ffbe41	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5550-bec8-d285-44a52aa0f682	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5550-bec8-0cad-91085e7828f6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5550-bec8-5eb2-9c92cbd4bb48	Prostor-read	Prostor - branje	f
00030000-5550-bec8-e6c1-e1133afdc0ff	Prostor-write	Prostor - spreminjanje	f
00030000-5550-bec8-3177-0f29735988ab	Racun-read	Racun - branje	f
00030000-5550-bec8-a01b-56e0627707fa	Racun-write	Racun - spreminjanje	f
00030000-5550-bec8-c469-c8269accf206	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5550-bec8-7b7b-18ab4c45c98b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5550-bec8-62a5-9419652d80f8	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5550-bec8-c480-15d4864223df	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5550-bec8-7cd1-9d076bf4da2e	Rekvizit-read	Rekvizit - branje	f
00030000-5550-bec8-2028-f9cfbddc66e9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5550-bec8-50d3-fda8b6d56dbd	Rezervacija-read	Rezervacija - branje	f
00030000-5550-bec8-1ca9-1448e4d35afb	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5550-bec8-c992-7fb3ec214e1a	SedezniRed-read	SedezniRed - branje	f
00030000-5550-bec8-948d-db0f2d5eea5b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5550-bec8-37fc-a299754942a2	Sedez-read	Sedez - branje	f
00030000-5550-bec8-3cb0-67e164357022	Sedez-write	Sedez - spreminjanje	f
00030000-5550-bec8-87d9-3744fe3989f0	Sezona-read	Sezona - branje	f
00030000-5550-bec8-e22f-21d728df9438	Sezona-write	Sezona - spreminjanje	f
00030000-5550-bec8-178f-128f73d2241e	Telefonska-read	Telefonska - branje	f
00030000-5550-bec8-9f16-e71d10dd4206	Telefonska-write	Telefonska - spreminjanje	f
00030000-5550-bec8-44d4-8c2653745b89	TerminStoritve-read	TerminStoritve - branje	f
00030000-5550-bec8-c257-f8613785a624	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5550-bec8-1202-8982775df9f4	TipFunkcije-read	TipFunkcije - branje	f
00030000-5550-bec8-0fec-72b2e41b2b53	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5550-bec8-c213-beeafae9e12b	Trr-read	Trr - branje	f
00030000-5550-bec8-af36-2958cc79ad9f	Trr-write	Trr - spreminjanje	f
00030000-5550-bec8-0f2e-792f3c2290ce	Uprizoritev-read	Uprizoritev - branje	f
00030000-5550-bec8-9ef9-fa4646f4efda	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5550-bec8-feb7-66f2526fd883	Vaja-read	Vaja - branje	f
00030000-5550-bec8-fd0d-90d01c189d0c	Vaja-write	Vaja - spreminjanje	f
00030000-5550-bec8-82bc-ed2d06b7a896	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5550-bec8-d7a4-fbbe1977dc12	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5550-bec8-01a8-10a585e25321	Zaposlitev-read	Zaposlitev - branje	f
00030000-5550-bec8-c148-7bbf48653fb2	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5550-bec8-a8b7-13d5c9630c67	Zasedenost-read	Zasedenost - branje	f
00030000-5550-bec8-80b8-f72e58de0e44	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5550-bec8-d269-3b37f4b4864a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5550-bec8-f919-4eaa331a62d2	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5550-bec8-9084-c947ee3c821f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5550-bec8-87f9-bd29250464c6	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 3092063)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5550-bec8-1e52-76302ecda8b3	00030000-5550-bec8-5c70-aefc99b63d9d
00020000-5550-bec8-50ce-ab9f56266469	00030000-5550-bec8-28aa-52941dfb32b6
00020000-5550-bec8-50ce-ab9f56266469	00030000-5550-bec8-5c70-aefc99b63d9d
\.


--
-- TOC entry 2663 (class 0 OID 3092351)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3092381)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3092493)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3092121)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3092163)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5550-bec8-40e1-de70b4a292d7	8341	Adlešiči
00050000-5550-bec8-554f-474954be5499	5270	Ajdovščina
00050000-5550-bec8-fd50-d66177a44512	6280	Ankaran/Ancarano
00050000-5550-bec8-c474-577b4094f4b9	9253	Apače
00050000-5550-bec8-7252-ba2cd5f91706	8253	Artiče
00050000-5550-bec8-93fd-e5a47c891a49	4275	Begunje na Gorenjskem
00050000-5550-bec8-a0bd-05de33ee1744	1382	Begunje pri Cerknici
00050000-5550-bec8-1f93-5efb1e13552a	9231	Beltinci
00050000-5550-bec8-896a-379d48bee12e	2234	Benedikt
00050000-5550-bec8-8ac2-2377da599327	2345	Bistrica ob Dravi
00050000-5550-bec8-e4f6-9b9fe1df4b16	3256	Bistrica ob Sotli
00050000-5550-bec8-aa6e-e3fc840ce4c0	8259	Bizeljsko
00050000-5550-bec8-5a62-4e828258540e	1223	Blagovica
00050000-5550-bec8-2bbf-a2c87712ccb1	8283	Blanca
00050000-5550-bec8-daaa-0b0829dece9c	4260	Bled
00050000-5550-bec8-46b6-8488144b901e	4273	Blejska Dobrava
00050000-5550-bec8-ea7a-88446c050114	9265	Bodonci
00050000-5550-bec8-ff10-a78fb06d3649	9222	Bogojina
00050000-5550-bec8-f77c-a6a3e38c46fb	4263	Bohinjska Bela
00050000-5550-bec8-3e38-2c31e2cb3229	4264	Bohinjska Bistrica
00050000-5550-bec8-0ae4-0eb2df2465ee	4265	Bohinjsko jezero
00050000-5550-bec8-a8c0-a40f21b416c7	1353	Borovnica
00050000-5550-bec8-ee03-9cd27962eff0	8294	Boštanj
00050000-5550-bec8-82c4-23de32f8cccb	5230	Bovec
00050000-5550-bec8-8975-ca8733fe00a7	5295	Branik
00050000-5550-bec8-f9d5-e84b70a7a091	3314	Braslovče
00050000-5550-bec8-a0d0-98bf88f5db80	5223	Breginj
00050000-5550-bec8-68a6-af5e34edf325	8280	Brestanica
00050000-5550-bec8-9510-28e34e91fdd4	2354	Bresternica
00050000-5550-bec8-33c7-c722e6e9cf27	4243	Brezje
00050000-5550-bec8-0c90-35e6eebb3626	1351	Brezovica pri Ljubljani
00050000-5550-bec8-73ee-cd0d46469d98	8250	Brežice
00050000-5550-bec8-5472-570b244ab37a	4210	Brnik - Aerodrom
00050000-5550-bec8-d118-853b92b52904	8321	Brusnice
00050000-5550-bec8-2e61-d823105292b5	3255	Buče
00050000-5550-bec8-071e-db4fe26a0f82	8276	Bučka 
00050000-5550-bec8-45dd-7f64bf9f2578	9261	Cankova
00050000-5550-bec8-4593-012ac4e257ac	3000	Celje 
00050000-5550-bec8-817e-71738ff39b5f	3001	Celje - poštni predali
00050000-5550-bec8-2ca7-403069ec3c08	4207	Cerklje na Gorenjskem
00050000-5550-bec8-8304-6c4a0fba0496	8263	Cerklje ob Krki
00050000-5550-bec8-bfd1-77da4b2ae24a	1380	Cerknica
00050000-5550-bec8-ac3b-3daa875802cf	5282	Cerkno
00050000-5550-bec8-a292-29b33a32d628	2236	Cerkvenjak
00050000-5550-bec8-9112-002a28c3046a	2215	Ceršak
00050000-5550-bec8-7f44-5342c66917d0	2326	Cirkovce
00050000-5550-bec8-3383-906190878802	2282	Cirkulane
00050000-5550-bec8-135b-a2e717b6e539	5273	Col
00050000-5550-bec8-119c-55f8fade6ce7	8251	Čatež ob Savi
00050000-5550-bec8-a468-83663c6259d5	1413	Čemšenik
00050000-5550-bec8-6beb-9f391958106e	5253	Čepovan
00050000-5550-bec8-f123-2174e9a26479	9232	Črenšovci
00050000-5550-bec8-8c32-dd2a5e485047	2393	Črna na Koroškem
00050000-5550-bec8-3e34-cdac6702fa47	6275	Črni Kal
00050000-5550-bec8-c604-39c762951568	5274	Črni Vrh nad Idrijo
00050000-5550-bec8-80f4-9b2aad580aad	5262	Črniče
00050000-5550-bec8-4b53-ee2c68bdca90	8340	Črnomelj
00050000-5550-bec8-d2fd-01992f42ce6b	6271	Dekani
00050000-5550-bec8-25a3-02224f665292	5210	Deskle
00050000-5550-bec8-e8d0-b2e0337d7e47	2253	Destrnik
00050000-5550-bec8-00c0-f59f5b24cb9e	6215	Divača
00050000-5550-bec8-cae4-104e4909c58e	1233	Dob
00050000-5550-bec8-3a41-83d4c9bd941d	3224	Dobje pri Planini
00050000-5550-bec8-fd22-dafc80b95cdf	8257	Dobova
00050000-5550-bec8-c66a-d11a62030866	1423	Dobovec
00050000-5550-bec8-b0ed-d00fc5c1fb2d	5263	Dobravlje
00050000-5550-bec8-7251-07b9ef4040d7	3204	Dobrna
00050000-5550-bec8-385f-561bee1feb3c	8211	Dobrnič
00050000-5550-bec8-529a-e7f115929f62	1356	Dobrova
00050000-5550-bec8-bfc4-f5eb51f7b932	9223	Dobrovnik/Dobronak 
00050000-5550-bec8-c3d4-39ec0e5a3c01	5212	Dobrovo v Brdih
00050000-5550-bec8-d66c-aa1b37c38077	1431	Dol pri Hrastniku
00050000-5550-bec8-0f5a-3c7861c2d962	1262	Dol pri Ljubljani
00050000-5550-bec8-e3ae-02d8488dceaa	1273	Dole pri Litiji
00050000-5550-bec8-5e8a-3262c5e0259a	1331	Dolenja vas
00050000-5550-bec8-f7a2-13c4f8b3e7b8	8350	Dolenjske Toplice
00050000-5550-bec8-bf8b-7a2353c7777b	1230	Domžale
00050000-5550-bec8-2f9e-01808169bd2f	2252	Dornava
00050000-5550-bec8-c855-215b224e764f	5294	Dornberk
00050000-5550-bec8-b3f2-1b0582d3d6f9	1319	Draga
00050000-5550-bec8-dd4a-444ab8678c7f	8343	Dragatuš
00050000-5550-bec8-c659-4f8729e6ae17	3222	Dramlje
00050000-5550-bec8-98d5-ebe3da4cfda0	2370	Dravograd
00050000-5550-bec8-70fb-2ee630efb347	4203	Duplje
00050000-5550-bec8-eef1-a91a81c3fd4d	6221	Dutovlje
00050000-5550-bec8-e829-5943629e3c18	8361	Dvor
00050000-5550-bec8-bf34-f8ae739fa9c0	2343	Fala
00050000-5550-bec8-ae7c-352b582eec2f	9208	Fokovci
00050000-5550-bec8-dc79-2d7594799f1a	2313	Fram
00050000-5550-bec8-6784-0ba949075f13	3213	Frankolovo
00050000-5550-bec8-05af-0fe6e4f4a0f5	1274	Gabrovka
00050000-5550-bec8-b370-f6287b532adc	8254	Globoko
00050000-5550-bec8-7081-4ac78e1370bc	5275	Godovič
00050000-5550-bec8-3026-9c964a06a6d8	4204	Golnik
00050000-5550-bec8-c8b8-c2e3650121af	3303	Gomilsko
00050000-5550-bec8-bd69-ce4bba1262f3	4224	Gorenja vas
00050000-5550-bec8-9266-c5e4070769be	3263	Gorica pri Slivnici
00050000-5550-bec8-fe62-6f095fd6abb8	2272	Gorišnica
00050000-5550-bec8-2245-d3275289d014	9250	Gornja Radgona
00050000-5550-bec8-4e39-d6a4da3f8ed2	3342	Gornji Grad
00050000-5550-bec8-9f2d-f79d477a7f24	4282	Gozd Martuljek
00050000-5550-bec8-f522-06f02171d861	6272	Gračišče
00050000-5550-bec8-e0a1-ff9108ecac07	9264	Grad
00050000-5550-bec8-73b0-77b0851ad02b	8332	Gradac
00050000-5550-bec8-1940-f9d55bb23aa2	1384	Grahovo
00050000-5550-bec8-5ec9-6d3c1ee37e9f	5242	Grahovo ob Bači
00050000-5550-bec8-78e4-3c345664bb9c	5251	Grgar
00050000-5550-bec8-0dcb-bfbdbbb6aa0c	3302	Griže
00050000-5550-bec8-3fc9-4981c8dc4c1c	3231	Grobelno
00050000-5550-bec8-5048-31f278fdfb24	1290	Grosuplje
00050000-5550-bec8-8c98-481068ab55bd	2288	Hajdina
00050000-5550-bec8-450b-ff0dfa1c5bff	8362	Hinje
00050000-5550-bec8-28eb-4fe4ff3aa85e	2311	Hoče
00050000-5550-bec8-80b9-de2fe3f2c656	9205	Hodoš/Hodos
00050000-5550-bec8-b4e9-c88d719099f9	1354	Horjul
00050000-5550-bec8-4263-284441b7b68a	1372	Hotedršica
00050000-5550-bec8-99ca-c7b914f78267	1430	Hrastnik
00050000-5550-bec8-099f-ca9d779aadb8	6225	Hruševje
00050000-5550-bec8-3821-315212953a6d	4276	Hrušica
00050000-5550-bec8-cd4f-16325ef20ae8	5280	Idrija
00050000-5550-bec8-765c-69f5c202ed6b	1292	Ig
00050000-5550-bec8-a822-f2d78f9cbe94	6250	Ilirska Bistrica
00050000-5550-bec8-a96b-b1437797c818	6251	Ilirska Bistrica-Trnovo
00050000-5550-bec8-8d69-a9a2da87203d	1295	Ivančna Gorica
00050000-5550-bec8-9a9f-c618574979fb	2259	Ivanjkovci
00050000-5550-bec8-8f8f-7efe54e4546e	1411	Izlake
00050000-5550-bec8-f395-abb918cb56bd	6310	Izola/Isola
00050000-5550-bec8-c2de-b87632be1353	2222	Jakobski Dol
00050000-5550-bec8-f2a3-f825996ab9ff	2221	Jarenina
00050000-5550-bec8-49c1-4afc51f97c85	6254	Jelšane
00050000-5550-bec8-dd6b-817a788a62c4	4270	Jesenice
00050000-5550-bec8-8ee3-f1ff40528a13	8261	Jesenice na Dolenjskem
00050000-5550-bec8-f85c-b3e045e230ce	3273	Jurklošter
00050000-5550-bec8-7f94-e17676d64132	2223	Jurovski Dol
00050000-5550-bec8-63ec-68a08fe54316	2256	Juršinci
00050000-5550-bec8-7665-45e189c6d32b	5214	Kal nad Kanalom
00050000-5550-bec8-af67-1bb9650204b6	3233	Kalobje
00050000-5550-bec8-4b71-a94efaf1eb3e	4246	Kamna Gorica
00050000-5550-bec8-d68d-746d3a66afe4	2351	Kamnica
00050000-5550-bec8-8a73-bd4d6283fe70	1241	Kamnik
00050000-5550-bec8-65ad-8dc947921966	5213	Kanal
00050000-5550-bec8-d250-a89be5609e55	8258	Kapele
00050000-5550-bec8-f014-1b88ba8cee4a	2362	Kapla
00050000-5550-bec8-a250-af4de421ec46	2325	Kidričevo
00050000-5550-bec8-2c66-cc40dce2b3e5	1412	Kisovec
00050000-5550-bec8-35a4-57224a609756	6253	Knežak
00050000-5550-bec8-e828-f15421e7a332	5222	Kobarid
00050000-5550-bec8-7790-01eef9d82547	9227	Kobilje
00050000-5550-bec8-b081-8cb363ecf513	1330	Kočevje
00050000-5550-bec8-a6a2-ed7c1627e593	1338	Kočevska Reka
00050000-5550-bec8-3db0-04f070df3aa1	2276	Kog
00050000-5550-bec8-775c-ff034ac441c2	5211	Kojsko
00050000-5550-bec8-dd99-37862eaaca33	6223	Komen
00050000-5550-bec8-fe2a-9565e7624544	1218	Komenda
00050000-5550-bec8-7aee-8c8a44c66b0c	6000	Koper/Capodistria 
00050000-5550-bec8-ec29-40c98a449939	6001	Koper/Capodistria - poštni predali
00050000-5550-bec8-3080-5de23fedc37b	8282	Koprivnica
00050000-5550-bec8-4e90-6e3f1e7a73e0	5296	Kostanjevica na Krasu
00050000-5550-bec8-f4cf-e5c9e62081f4	8311	Kostanjevica na Krki
00050000-5550-bec8-cadb-eb7a5331865d	1336	Kostel
00050000-5550-bec8-df3f-8d2ff0688600	6256	Košana
00050000-5550-bec8-9813-6a4e81149e99	2394	Kotlje
00050000-5550-bec8-0985-b40435a69fec	6240	Kozina
00050000-5550-bec8-c199-1280a385ec8f	3260	Kozje
00050000-5550-bec8-4b66-8a7aa9b3b4d3	4000	Kranj 
00050000-5550-bec8-3473-169aa16b4db6	4001	Kranj - poštni predali
00050000-5550-bec8-2e8d-82abec22461f	4280	Kranjska Gora
00050000-5550-bec8-7b84-b393b5f5e63a	1281	Kresnice
00050000-5550-bec8-ef99-0d6d4a796118	4294	Križe
00050000-5550-bec8-bb9f-36a4d0104ca9	9206	Križevci
00050000-5550-bec8-b335-02d130510bee	9242	Križevci pri Ljutomeru
00050000-5550-bec8-85ff-2a40d55f6128	1301	Krka
00050000-5550-bec8-0b57-1b0fa4b55ed0	8296	Krmelj
00050000-5550-bec8-f504-df35b23b4528	4245	Kropa
00050000-5550-bec8-aa06-9b9af3e1f597	8262	Krška vas
00050000-5550-bec8-ed29-be68252dd0f8	8270	Krško
00050000-5550-bec8-e68f-890ae9ac4dac	9263	Kuzma
00050000-5550-bec8-c323-e1488b3cbd75	2318	Laporje
00050000-5550-bec8-e408-fb5fb31bc89f	3270	Laško
00050000-5550-bec8-1307-967fc4331b9f	1219	Laze v Tuhinju
00050000-5550-bec8-5f28-c89536b1aa2c	2230	Lenart v Slovenskih goricah
00050000-5550-bec8-126b-12d63a977d43	9220	Lendava/Lendva
00050000-5550-bec8-6389-c5767acc53dc	4248	Lesce
00050000-5550-bec8-fbcc-e6c5f6148b6d	3261	Lesično
00050000-5550-bec8-5872-bb7bbdafaa09	8273	Leskovec pri Krškem
00050000-5550-bec8-3975-29e260acf8d0	2372	Libeliče
00050000-5550-bec8-ad86-caf4dbaf9d68	2341	Limbuš
00050000-5550-bec8-19e4-a357409dc147	1270	Litija
00050000-5550-bec8-0fbf-5b90783ad474	3202	Ljubečna
00050000-5550-bec8-ea3e-351cfea14787	1000	Ljubljana 
00050000-5550-bec8-a981-179b2ed5f696	1001	Ljubljana - poštni predali
00050000-5550-bec8-f878-9cda72d36293	1231	Ljubljana - Črnuče
00050000-5550-bec8-15f8-a2365c839fcd	1261	Ljubljana - Dobrunje
00050000-5550-bec8-5394-7a950bc28e54	1260	Ljubljana - Polje
00050000-5550-bec8-f8a0-2e286d127938	1210	Ljubljana - Šentvid
00050000-5550-bec8-22a6-5e83a97d82d7	1211	Ljubljana - Šmartno
00050000-5550-bec8-3f2f-20e11346aa83	3333	Ljubno ob Savinji
00050000-5550-bec8-bac1-1655e313ef30	9240	Ljutomer
00050000-5550-bec8-2e41-db6105465511	3215	Loče
00050000-5550-bec8-4818-303f440e93cf	5231	Log pod Mangartom
00050000-5550-bec8-6bf3-57c652d79fd2	1358	Log pri Brezovici
00050000-5550-bec8-fdca-7d79366521ae	1370	Logatec
00050000-5550-bec8-68a7-95d93e3f2dc1	1371	Logatec
00050000-5550-bec8-17a2-9e3a8a81bf90	1434	Loka pri Zidanem Mostu
00050000-5550-bec8-29e3-8f3ecd6efaf4	3223	Loka pri Žusmu
00050000-5550-bec8-9b6e-1bdedc994544	6219	Lokev
00050000-5550-bec8-2cbe-8a9f256436b9	1318	Loški Potok
00050000-5550-bec8-5ac8-7b436e074d60	2324	Lovrenc na Dravskem polju
00050000-5550-bec8-7ae3-bc7e988f92af	2344	Lovrenc na Pohorju
00050000-5550-bec8-5483-3189bfe72b1c	3334	Luče
00050000-5550-bec8-10d5-d76cd96ad85c	1225	Lukovica
00050000-5550-bec8-488a-3ffb53078592	9202	Mačkovci
00050000-5550-bec8-8aa9-ad14e1326ff9	2322	Majšperk
00050000-5550-bec8-5cd0-63421909071b	2321	Makole
00050000-5550-bec8-1365-3f11bae85dcb	9243	Mala Nedelja
00050000-5550-bec8-54c0-bd72f46bda38	2229	Malečnik
00050000-5550-bec8-7993-fc69a2b5fc21	6273	Marezige
00050000-5550-bec8-ec93-5c5d9e40a907	2000	Maribor 
00050000-5550-bec8-1c75-7f6d8b59de9e	2001	Maribor - poštni predali
00050000-5550-bec8-5833-fd79679d31ad	2206	Marjeta na Dravskem polju
00050000-5550-bec8-1024-0bc63752212a	2281	Markovci
00050000-5550-bec8-9576-2fc0e6f768b0	9221	Martjanci
00050000-5550-bec8-0ae1-6feb7d696349	6242	Materija
00050000-5550-bec8-1167-058cca4c02d1	4211	Mavčiče
00050000-5550-bec8-2d24-0f63bf3f768d	1215	Medvode
00050000-5550-bec8-d6a4-730bb2838b5d	1234	Mengeš
00050000-5550-bec8-8700-d9ed97a5fbf1	8330	Metlika
00050000-5550-bec8-7774-705c8e6d3d4e	2392	Mežica
00050000-5550-bec8-9297-e8b71f96b040	2204	Miklavž na Dravskem polju
00050000-5550-bec8-10f6-e8a6abcd9ba7	2275	Miklavž pri Ormožu
00050000-5550-bec8-ecc5-177c94c6d7fe	5291	Miren
00050000-5550-bec8-15fe-cbe01dbde014	8233	Mirna
00050000-5550-bec8-b1ff-a979e1d45d6b	8216	Mirna Peč
00050000-5550-bec8-43a0-31e641a234fa	2382	Mislinja
00050000-5550-bec8-da5e-09ed248ef0d8	4281	Mojstrana
00050000-5550-bec8-4822-247842ab4573	8230	Mokronog
00050000-5550-bec8-31b4-825d4244b7cc	1251	Moravče
00050000-5550-bec8-f24f-42f3f24aaa05	9226	Moravske Toplice
00050000-5550-bec8-57f1-7b1107b9d0f1	5216	Most na Soči
00050000-5550-bec8-4a70-5eb91e3b363b	1221	Motnik
00050000-5550-bec8-d7e9-e29a30c9cf19	3330	Mozirje
00050000-5550-bec8-be58-bb3e50f564b9	9000	Murska Sobota 
00050000-5550-bec8-4949-755099e09387	9001	Murska Sobota - poštni predali
00050000-5550-bec8-2c14-e5bf0cc940aa	2366	Muta
00050000-5550-bec8-15dc-c97fd97da84a	4202	Naklo
00050000-5550-bec8-2a12-b25316f57474	3331	Nazarje
00050000-5550-bec8-11de-a66547ad9eb8	1357	Notranje Gorice
00050000-5550-bec8-e642-34afa0b4ee05	3203	Nova Cerkev
00050000-5550-bec8-62bb-914c80bf07e2	5000	Nova Gorica 
00050000-5550-bec8-3e77-1a5ec49d7377	5001	Nova Gorica - poštni predali
00050000-5550-bec8-598c-489df2af4856	1385	Nova vas
00050000-5550-bec8-9740-88527bab052a	8000	Novo mesto
00050000-5550-bec8-81e0-a067308d3b23	8001	Novo mesto - poštni predali
00050000-5550-bec8-473a-e3deaaf1045c	6243	Obrov
00050000-5550-bec8-d80b-df31808a50d0	9233	Odranci
00050000-5550-bec8-c590-27513dcf2f8d	2317	Oplotnica
00050000-5550-bec8-1047-84ae74cd6341	2312	Orehova vas
00050000-5550-bec8-facd-697eddf9fd07	2270	Ormož
00050000-5550-bec8-117f-5e740fa57978	1316	Ortnek
00050000-5550-bec8-fefa-a11ead0c93be	1337	Osilnica
00050000-5550-bec8-b487-8d16b589d150	8222	Otočec
00050000-5550-bec8-2195-ad04c7ff26fa	2361	Ožbalt
00050000-5550-bec8-a8b7-38d95a5c5973	2231	Pernica
00050000-5550-bec8-0a53-87e243058136	2211	Pesnica pri Mariboru
00050000-5550-bec8-2241-7c5a62b8fd26	9203	Petrovci
00050000-5550-bec8-5332-b7ce69e7ef73	3301	Petrovče
00050000-5550-bec8-d176-d88f9517cf04	6330	Piran/Pirano
00050000-5550-bec8-b545-b7f5bd38a403	8255	Pišece
00050000-5550-bec8-1590-c4bb86c4ebd0	6257	Pivka
00050000-5550-bec8-1e07-e6a402e44109	6232	Planina
00050000-5550-bec8-c762-6f7eb7aa1ddc	3225	Planina pri Sevnici
00050000-5550-bec8-1fe3-dc0f6f4f3031	6276	Pobegi
00050000-5550-bec8-914a-91b47c73b4b1	8312	Podbočje
00050000-5550-bec8-039e-a243d4dc595a	5243	Podbrdo
00050000-5550-bec8-065c-e9ebbf9fc270	3254	Podčetrtek
00050000-5550-bec8-5f41-afc63af71a6c	2273	Podgorci
00050000-5550-bec8-2fd2-a36d3bf409f5	6216	Podgorje
00050000-5550-bec8-4a32-21ea90b3635d	2381	Podgorje pri Slovenj Gradcu
00050000-5550-bec8-8397-a0651d961892	6244	Podgrad
00050000-5550-bec8-7c3f-01eeb08d8415	1414	Podkum
00050000-5550-bec8-cf78-7bd7c499e6b5	2286	Podlehnik
00050000-5550-bec8-acd6-252126e859de	5272	Podnanos
00050000-5550-bec8-3711-bce35747c167	4244	Podnart
00050000-5550-bec8-daa4-5fac7262630a	3241	Podplat
00050000-5550-bec8-2434-d507e903c96a	3257	Podsreda
00050000-5550-bec8-e2f8-d6d8a060c405	2363	Podvelka
00050000-5550-bec8-87b5-ec7f37b65889	2208	Pohorje
00050000-5550-bec8-83d0-bd5198144c7b	2257	Polenšak
00050000-5550-bec8-0373-d67b339d8a8e	1355	Polhov Gradec
00050000-5550-bec8-5865-1bb97195e4a4	4223	Poljane nad Škofjo Loko
00050000-5550-bec8-3e34-0e1c73cbd60d	2319	Poljčane
00050000-5550-bec8-368b-88288eb28f38	1272	Polšnik
00050000-5550-bec8-ea7b-0b0665875388	3313	Polzela
00050000-5550-bec8-b863-fdfcddaa4395	3232	Ponikva
00050000-5550-bec8-1420-5755e35a646b	6320	Portorož/Portorose
00050000-5550-bec8-284a-4a7cc21e8416	6230	Postojna
00050000-5550-bec8-878e-e36877fde921	2331	Pragersko
00050000-5550-bec8-13aa-4c24068672eb	3312	Prebold
00050000-5550-bec8-c00f-0fd968f1a92f	4205	Preddvor
00050000-5550-bec8-a44f-4740b31a7d0e	6255	Prem
00050000-5550-bec8-493f-bc3f9ff54e47	1352	Preserje
00050000-5550-bec8-c57a-ce3082ae0653	6258	Prestranek
00050000-5550-bec8-2812-558e5f9d0fd1	2391	Prevalje
00050000-5550-bec8-11fe-93cc237465ec	3262	Prevorje
00050000-5550-bec8-3a96-1e253e39aa22	1276	Primskovo 
00050000-5550-bec8-1e68-a0eb097bd81e	3253	Pristava pri Mestinju
00050000-5550-bec8-380b-e49a22b945c8	9207	Prosenjakovci/Partosfalva
00050000-5550-bec8-64ce-e54aee021a32	5297	Prvačina
00050000-5550-bec8-5b62-0d83e77c5928	2250	Ptuj
00050000-5550-bec8-c2ae-feb532aded8b	2323	Ptujska Gora
00050000-5550-bec8-0689-814f076c4fc2	9201	Puconci
00050000-5550-bec8-7057-eaf746f25f6c	2327	Rače
00050000-5550-bec8-2338-927009d67198	1433	Radeče
00050000-5550-bec8-4ffc-2e5784940b3f	9252	Radenci
00050000-5550-bec8-a10f-74c2f596a990	2360	Radlje ob Dravi
00050000-5550-bec8-a143-e2bf79f05b31	1235	Radomlje
00050000-5550-bec8-2918-5aed56eaee4d	4240	Radovljica
00050000-5550-bec8-e780-0b1cb4640fba	8274	Raka
00050000-5550-bec8-f9fc-df7d5a828897	1381	Rakek
00050000-5550-bec8-ecba-47e9ba5702bb	4283	Rateče - Planica
00050000-5550-bec8-df5e-4283fe60fb91	2390	Ravne na Koroškem
00050000-5550-bec8-929c-a86cb26b7c7c	9246	Razkrižje
00050000-5550-bec8-c8da-554edccf1b67	3332	Rečica ob Savinji
00050000-5550-bec8-9372-1e2ac21a7bf0	5292	Renče
00050000-5550-bec8-7c0f-a7ec6b145ca1	1310	Ribnica
00050000-5550-bec8-4d64-1f8773320cfe	2364	Ribnica na Pohorju
00050000-5550-bec8-06a8-f48fcc3e5dfe	3272	Rimske Toplice
00050000-5550-bec8-81bc-f31818a9356a	1314	Rob
00050000-5550-bec8-b5ed-a0d315b9cec9	5215	Ročinj
00050000-5550-bec8-0d4d-073786385701	3250	Rogaška Slatina
00050000-5550-bec8-1fd1-7e413984fdaf	9262	Rogašovci
00050000-5550-bec8-5a11-a4a9d708ada9	3252	Rogatec
00050000-5550-bec8-6622-4f676aa1c676	1373	Rovte
00050000-5550-bec8-a340-5bd6e8ec833a	2342	Ruše
00050000-5550-bec8-f9df-dbab4a641b1c	1282	Sava
00050000-5550-bec8-716e-464f7f078feb	6333	Sečovlje/Sicciole
00050000-5550-bec8-2401-30c451f36a4d	4227	Selca
00050000-5550-bec8-ef3d-a956f0a08337	2352	Selnica ob Dravi
00050000-5550-bec8-472f-8062d65e8887	8333	Semič
00050000-5550-bec8-e1b8-db60cc13a047	8281	Senovo
00050000-5550-bec8-0f5e-1f89efb429aa	6224	Senožeče
00050000-5550-bec8-54e0-fccf8dc3cdea	8290	Sevnica
00050000-5550-bec8-ea6f-5575eff011f3	6210	Sežana
00050000-5550-bec8-a9ae-31353e649b09	2214	Sladki Vrh
00050000-5550-bec8-6654-de5682bbbc82	5283	Slap ob Idrijci
00050000-5550-bec8-bc9e-110c74abfeb5	2380	Slovenj Gradec
00050000-5550-bec8-44b7-a09b8dfaa6a6	2310	Slovenska Bistrica
00050000-5550-bec8-49c1-5ce69db472c3	3210	Slovenske Konjice
00050000-5550-bec8-c867-0e19f7f5f6ff	1216	Smlednik
00050000-5550-bec8-c875-70bafda6eb92	5232	Soča
00050000-5550-bec8-01c1-47a3b4b23418	1317	Sodražica
00050000-5550-bec8-aaed-cc50a6bc2f27	3335	Solčava
00050000-5550-bec8-7b48-347048aaeac6	5250	Solkan
00050000-5550-bec8-d402-d4e24decd2ec	4229	Sorica
00050000-5550-bec8-6872-28d5c316cfe8	4225	Sovodenj
00050000-5550-bec8-12a5-8b23ae699dc0	5281	Spodnja Idrija
00050000-5550-bec8-3814-e3eb5843a77d	2241	Spodnji Duplek
00050000-5550-bec8-34ba-f5c7d78e2cb5	9245	Spodnji Ivanjci
00050000-5550-bec8-8725-80398dbbad77	2277	Središče ob Dravi
00050000-5550-bec8-d868-3cd4f0388d56	4267	Srednja vas v Bohinju
00050000-5550-bec8-1b06-9770bd85fd34	8256	Sromlje 
00050000-5550-bec8-9994-0e4c54e42bbd	5224	Srpenica
00050000-5550-bec8-09ef-6b3a6aec1415	1242	Stahovica
00050000-5550-bec8-c9dc-5e73eb2e166f	1332	Stara Cerkev
00050000-5550-bec8-7eb4-fd9e11d3bd7d	8342	Stari trg ob Kolpi
00050000-5550-bec8-8000-d8090dd27c20	1386	Stari trg pri Ložu
00050000-5550-bec8-6710-647ba5bda49b	2205	Starše
00050000-5550-bec8-cf41-1fadf6b9b904	2289	Stoperce
00050000-5550-bec8-8d01-1435227a6e82	8322	Stopiče
00050000-5550-bec8-9341-711d2551820c	3206	Stranice
00050000-5550-bec8-6fdf-5dd06df7c331	8351	Straža
00050000-5550-bec8-3c05-7f7dfd8e26de	1313	Struge
00050000-5550-bec8-7176-b8145f5ba5bf	8293	Studenec
00050000-5550-bec8-df29-3d67e980f384	8331	Suhor
00050000-5550-bec8-148e-1bee96a0a37a	2233	Sv. Ana v Slovenskih goricah
00050000-5550-bec8-c3b1-26b559b5fab2	2235	Sv. Trojica v Slovenskih goricah
00050000-5550-bec8-b433-b833c4fa1764	2353	Sveti Duh na Ostrem Vrhu
00050000-5550-bec8-942f-4b74e61af6c8	9244	Sveti Jurij ob Ščavnici
00050000-5550-bec8-2dd1-dc6147872c5e	3264	Sveti Štefan
00050000-5550-bec8-ba56-8ecbdb8fca3a	2258	Sveti Tomaž
00050000-5550-bec8-07d2-6d82a3b60345	9204	Šalovci
00050000-5550-bec8-576d-a69a29ee1cf1	5261	Šempas
00050000-5550-bec8-f706-87f6d5beee6c	5290	Šempeter pri Gorici
00050000-5550-bec8-7ee7-9f748b50e29d	3311	Šempeter v Savinjski dolini
00050000-5550-bec8-4352-14888fd5b3f8	4208	Šenčur
00050000-5550-bec8-f8a7-bd499fb7191a	2212	Šentilj v Slovenskih goricah
00050000-5550-bec8-6eda-0d5cb4eaf72d	8297	Šentjanž
00050000-5550-bec8-2e1a-b3bcd74506a1	2373	Šentjanž pri Dravogradu
00050000-5550-bec8-cc7d-2b19528031bf	8310	Šentjernej
00050000-5550-bec8-c999-930dd7204532	3230	Šentjur
00050000-5550-bec8-8824-e9a322d970e2	3271	Šentrupert
00050000-5550-bec8-a6fc-1c6c08e316a7	8232	Šentrupert
00050000-5550-bec8-ccae-de72f70d90a1	1296	Šentvid pri Stični
00050000-5550-bec8-18ca-90a7e443f678	8275	Škocjan
00050000-5550-bec8-d6bc-9d51c1df7710	6281	Škofije
00050000-5550-bec8-4c0a-0e602b72481a	4220	Škofja Loka
00050000-5550-bec8-5686-f41d5b7cd33e	3211	Škofja vas
00050000-5550-bec8-f3b2-da2b9265cc6c	1291	Škofljica
00050000-5550-bec8-77e6-f935000a3406	6274	Šmarje
00050000-5550-bec8-5b77-805186ba29e7	1293	Šmarje - Sap
00050000-5550-bec8-6b0f-b0529df3862d	3240	Šmarje pri Jelšah
00050000-5550-bec8-1485-fbfcb5349f26	8220	Šmarješke Toplice
00050000-5550-bec8-8309-e40abade8b6e	2315	Šmartno na Pohorju
00050000-5550-bec8-b14e-8f8089c1c85e	3341	Šmartno ob Dreti
00050000-5550-bec8-c387-c8238e00ebc0	3327	Šmartno ob Paki
00050000-5550-bec8-addd-a98855015946	1275	Šmartno pri Litiji
00050000-5550-bec8-bb08-3caa4fb16b5b	2383	Šmartno pri Slovenj Gradcu
00050000-5550-bec8-b503-c562858adcce	3201	Šmartno v Rožni dolini
00050000-5550-bec8-9e20-af0216640ec7	3325	Šoštanj
00050000-5550-bec8-0deb-87657057dc38	6222	Štanjel
00050000-5550-bec8-de6c-e3337549d960	3220	Štore
00050000-5550-bec8-3e70-8a749787998b	3304	Tabor
00050000-5550-bec8-2a97-666e71bcfc16	3221	Teharje
00050000-5550-bec8-fd91-0fc480528676	9251	Tišina
00050000-5550-bec8-a4a5-7f1100e95b8a	5220	Tolmin
00050000-5550-bec8-0c37-461f7dd42a03	3326	Topolšica
00050000-5550-bec8-8682-c73051b77dcb	2371	Trbonje
00050000-5550-bec8-3cce-073423b14d57	1420	Trbovlje
00050000-5550-bec8-2b36-27c16b45f9a8	8231	Trebelno 
00050000-5550-bec8-6a22-c4307347faee	8210	Trebnje
00050000-5550-bec8-d470-45488ab33699	5252	Trnovo pri Gorici
00050000-5550-bec8-9bdd-34f99fee3c4a	2254	Trnovska vas
00050000-5550-bec8-28fa-4fa95626c49d	1222	Trojane
00050000-5550-bec8-0277-215bcde11874	1236	Trzin
00050000-5550-bec8-101a-33cca135908a	4290	Tržič
00050000-5550-bec8-91a5-bf242bfac17c	8295	Tržišče
00050000-5550-bec8-de61-1a2bc5202ce6	1311	Turjak
00050000-5550-bec8-a313-a4b1460a2a94	9224	Turnišče
00050000-5550-bec8-2962-f54e228906f8	8323	Uršna sela
00050000-5550-bec8-fcad-4633c7d4d4e7	1252	Vače
00050000-5550-bec8-520e-a97f1a1b1932	3320	Velenje 
00050000-5550-bec8-ce10-58f78a0ded44	3322	Velenje - poštni predali
00050000-5550-bec8-d2b7-c29b2677b2de	8212	Velika Loka
00050000-5550-bec8-60a1-c36848cc2717	2274	Velika Nedelja
00050000-5550-bec8-1307-591b92b6850d	9225	Velika Polana
00050000-5550-bec8-6b31-3841e340ecf1	1315	Velike Lašče
00050000-5550-bec8-3272-dc9ab3703bde	8213	Veliki Gaber
00050000-5550-bec8-3411-9e9f8264b0bf	9241	Veržej
00050000-5550-bec8-181b-0e0227b2a345	1312	Videm - Dobrepolje
00050000-5550-bec8-c042-82c3db0cd018	2284	Videm pri Ptuju
00050000-5550-bec8-db71-b9e27e0f9fc7	8344	Vinica
00050000-5550-bec8-3ec1-00d3d3626d63	5271	Vipava
00050000-5550-bec8-06ae-9ebc0377fd52	4212	Visoko
00050000-5550-bec8-2d61-b9b05b2542e4	1294	Višnja Gora
00050000-5550-bec8-1dcc-26c7d53799ef	3205	Vitanje
00050000-5550-bec8-63fb-e27c1ac1bd75	2255	Vitomarci
00050000-5550-bec8-ea66-6e47529ba10d	1217	Vodice
00050000-5550-bec8-2b25-fec96aa79e21	3212	Vojnik\t
00050000-5550-bec8-bc59-b38de404b4b5	5293	Volčja Draga
00050000-5550-bec8-091f-25af4e913015	2232	Voličina
00050000-5550-bec8-da96-dc7e45a84f66	3305	Vransko
00050000-5550-bec8-97df-095c445971ef	6217	Vremski Britof
00050000-5550-bec8-7174-bbcb83b692c8	1360	Vrhnika
00050000-5550-bec8-a296-8eb321b7fe81	2365	Vuhred
00050000-5550-bec8-811a-2f9841de5d7f	2367	Vuzenica
00050000-5550-bec8-44c6-31276975e8e9	8292	Zabukovje 
00050000-5550-bec8-67c5-a66b4e186d0a	1410	Zagorje ob Savi
00050000-5550-bec8-a319-95791b9746f2	1303	Zagradec
00050000-5550-bec8-483f-46297095a40e	2283	Zavrč
00050000-5550-bec8-f1b6-367b39bd2dca	8272	Zdole 
00050000-5550-bec8-a0dd-da636a390b99	4201	Zgornja Besnica
00050000-5550-bec8-65a2-ddee87e10c59	2242	Zgornja Korena
00050000-5550-bec8-57a3-476daf0f4b11	2201	Zgornja Kungota
00050000-5550-bec8-0a65-b6ec5324ccc8	2316	Zgornja Ložnica
00050000-5550-bec8-26ae-8b2d264d5fdf	2314	Zgornja Polskava
00050000-5550-bec8-bfd1-edc7fab081b1	2213	Zgornja Velka
00050000-5550-bec8-8493-83a64ac600ed	4247	Zgornje Gorje
00050000-5550-bec8-f01c-6f17efcaf540	4206	Zgornje Jezersko
00050000-5550-bec8-c6ad-805766c60db5	2285	Zgornji Leskovec
00050000-5550-bec8-d6f8-d46ae6941fc8	1432	Zidani Most
00050000-5550-bec8-0f92-abc67c6b81dd	3214	Zreče
00050000-5550-bec8-4df7-da9ffd95c3db	4209	Žabnica
00050000-5550-bec8-4c65-75ed06593a47	3310	Žalec
00050000-5550-bec8-3f0e-42638232a0ec	4228	Železniki
00050000-5550-bec8-c876-ddf1985a0ea1	2287	Žetale
00050000-5550-bec8-fbe7-5eaab51c832f	4226	Žiri
00050000-5550-bec8-0527-90aee4fcfdf6	4274	Žirovnica
00050000-5550-bec8-b5c6-fc7d0f07b7a6	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 3092325)
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
-- TOC entry 2642 (class 0 OID 3092148)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3092214)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3092337)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3092442)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3092486)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3092366)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3092310)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3092300)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3092476)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3092432)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 3092015)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5550-bec8-a95b-38a152c80421	00010000-5550-bec8-0eca-f1017e5d1a0c	2015-05-11 16:38:01	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROUxQt7TvvZmcDRTrCqpbgx/6x8hxrsQC";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 3092375)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3092053)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5550-bec8-dc84-1dff09962587	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5550-bec8-d4db-39731ca27c69	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5550-bec8-1e52-76302ecda8b3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5550-bec8-ceb5-ff78f7d14714	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5550-bec8-adc9-f8c8168c0088	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5550-bec8-50ce-ab9f56266469	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 3092037)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5550-bec8-a95b-38a152c80421	00020000-5550-bec8-ceb5-ff78f7d14714
00010000-5550-bec8-0eca-f1017e5d1a0c	00020000-5550-bec8-ceb5-ff78f7d14714
\.


--
-- TOC entry 2668 (class 0 OID 3092389)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3092331)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3092281)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3092113)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3092287)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3092467)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3092183)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3092024)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5550-bec8-0eca-f1017e5d1a0c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROeseNX/u57z.cViTPjG3//QUTj9ytSYS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5550-bec8-a95b-38a152c80421	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 3092517)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3092229)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3092358)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3092424)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3092257)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3092507)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3092414)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 3092078)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3092557)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 3092550)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 3092466)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 3092247)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3092280)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 3092209)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 3092410)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 3092227)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 3092274)
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
-- TOC entry 2365 (class 2606 OID 3092323)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 3092350)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3092181)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 3092087)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 3092145)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 3092111)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 3092067)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 3092052)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3092356)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 3092388)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 3092503)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 3092138)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 3092169)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 3092329)
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
-- TOC entry 2299 (class 2606 OID 3092159)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 3092218)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 3092341)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 3092448)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 3092491)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 3092373)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 3092314)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 3092305)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 3092485)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 3092439)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 3092023)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 3092379)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 3092041)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 3092061)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 3092397)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 3092336)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 3092286)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 3092118)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 3092296)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 3092475)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 3092194)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 3092036)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 3092532)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 3092233)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3092364)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 3092430)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 3092269)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 3092516)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 3092423)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 3092254)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 3092140)
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
-- TOC entry 2378 (class 1259 OID 3092357)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 3092343)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 3092342)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 3092234)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 3092413)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 3092411)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 3092412)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 3092504)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 3092505)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 3092506)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 3092535)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 3092534)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 3092533)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 3092196)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 3092195)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 3092147)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 3092146)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 3092380)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 3092275)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 3092068)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 3092069)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 3092400)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 3092399)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 3092398)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 3092219)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 3092221)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 3092220)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 3092309)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 3092307)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 3092306)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 3092308)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 3092042)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 3092043)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 3092365)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 3092330)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 3092440)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 3092441)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 3092161)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 3092160)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 3092162)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 3092449)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 3092450)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 3092560)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 3092559)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 3092562)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 3092558)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 3092561)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 3092431)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 3092318)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 3092317)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 3092315)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 3092316)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 3092552)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 3092551)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 3092228)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 3092089)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 3092088)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 3092119)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 3092120)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 3092299)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 3092298)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 3092297)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 3092256)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 3092252)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 3092249)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 3092250)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 3092248)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 3092253)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 3092251)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 3092139)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3092210)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 3092212)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 3092211)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 3092213)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 3092324)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 3092112)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 3092182)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2386 (class 1259 OID 3092374)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 3092170)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 3092492)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 3092062)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 3092255)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 3092693)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 3092678)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 3092683)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 3092703)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 3092673)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 3092698)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 3092688)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 3092608)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 3092788)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 3092783)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 3092778)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 3092668)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 3092828)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 3092818)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3092823)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 3092768)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 3092863)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 3092868)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 3092873)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 3092888)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 3092883)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 3092878)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 3092643)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 3092638)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3092618)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3092613)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 3092593)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 3092798)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 3092708)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 3092573)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 3092578)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 3092813)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 3092808)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 3092803)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 3092648)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3092658)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 3092653)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 3092743)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 3092733)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 3092728)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 3092738)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 3092563)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 3092568)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 3092793)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 3092773)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 3092838)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 3092843)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 3092628)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 3092623)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 3092633)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 3092848)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 3092853)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 3092913)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 3092908)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 3092923)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 3092903)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 3092918)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 3092833)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 3092763)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 3092758)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 3092748)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 3092753)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 3092898)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 3092893)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 3092663)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3092858)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 3092588)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 3092583)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 3092598)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 3092603)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 3092723)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 3092718)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 3092713)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-11 16:38:01 CEST

--
-- PostgreSQL database dump complete
--

