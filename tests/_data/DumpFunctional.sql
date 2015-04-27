--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-27 21:45:21 CEST

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
-- TOC entry 179 (class 1259 OID 1471944)
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
-- TOC entry 225 (class 1259 OID 1472427)
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
-- TOC entry 224 (class 1259 OID 1472410)
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
-- TOC entry 217 (class 1259 OID 1472326)
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
-- TOC entry 193 (class 1259 OID 1472110)
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
-- TOC entry 196 (class 1259 OID 1472151)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1472072)
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
-- TOC entry 212 (class 1259 OID 1472276)
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
-- TOC entry 191 (class 1259 OID 1472097)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1472145)
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
-- TOC entry 201 (class 1259 OID 1472194)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1472219)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1472046)
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
-- TOC entry 180 (class 1259 OID 1471953)
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
-- TOC entry 181 (class 1259 OID 1471964)
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
-- TOC entry 184 (class 1259 OID 1472016)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1471918)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1471937)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1472226)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1472256)
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
-- TOC entry 221 (class 1259 OID 1472368)
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
-- TOC entry 183 (class 1259 OID 1471996)
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
-- TOC entry 186 (class 1259 OID 1472038)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1472200)
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
-- TOC entry 185 (class 1259 OID 1472023)
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
-- TOC entry 190 (class 1259 OID 1472089)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1472212)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1472317)
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
-- TOC entry 220 (class 1259 OID 1472361)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1472241)
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
-- TOC entry 200 (class 1259 OID 1472185)
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
-- TOC entry 199 (class 1259 OID 1472175)
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
-- TOC entry 219 (class 1259 OID 1472351)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1472307)
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
-- TOC entry 173 (class 1259 OID 1471888)
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
-- TOC entry 172 (class 1259 OID 1471886)
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
-- TOC entry 209 (class 1259 OID 1472250)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1471928)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1471911)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1472264)
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
-- TOC entry 203 (class 1259 OID 1472206)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1472156)
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
-- TOC entry 182 (class 1259 OID 1471988)
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
-- TOC entry 198 (class 1259 OID 1472162)
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
-- TOC entry 218 (class 1259 OID 1472342)
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
-- TOC entry 188 (class 1259 OID 1472058)
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
-- TOC entry 174 (class 1259 OID 1471897)
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
-- TOC entry 223 (class 1259 OID 1472392)
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
-- TOC entry 192 (class 1259 OID 1472104)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1472233)
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
-- TOC entry 214 (class 1259 OID 1472299)
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
-- TOC entry 194 (class 1259 OID 1472132)
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
-- TOC entry 222 (class 1259 OID 1472382)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1472289)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1471891)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2637 (class 0 OID 1471944)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 1472427)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1472410)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1472326)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1472110)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1472151)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1472072)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-553e-91d0-af6f-fa85ab4911c5	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-553e-91d0-1c14-06ef39bdcd65	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-553e-91d0-ddde-38be57146b04	AL	ALB	008	Albania 	Albanija	\N
00040000-553e-91d0-0031-6b499e458970	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-553e-91d0-0831-3f0a0e701472	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-553e-91d0-1185-9e7aebd28593	AD	AND	020	Andorra 	Andora	\N
00040000-553e-91d0-233b-b3f36160f73b	AO	AGO	024	Angola 	Angola	\N
00040000-553e-91d0-cb9c-71686c1a12a0	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-553e-91d0-baa9-9a4e80a21c5e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-553e-91d0-9b43-14e2ec495c65	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-553e-91d0-e1d8-79209373a7fa	AR	ARG	032	Argentina 	Argenitna	\N
00040000-553e-91d0-c8c4-319a5738681e	AM	ARM	051	Armenia 	Armenija	\N
00040000-553e-91d0-3c05-0c4f388cbb4a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-553e-91d0-0037-1e5405e0fedd	AU	AUS	036	Australia 	Avstralija	\N
00040000-553e-91d0-49be-ae7310426ac1	AT	AUT	040	Austria 	Avstrija	\N
00040000-553e-91d0-f56f-db4dc66bed8e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-553e-91d0-c1c7-ad5382649dc3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-553e-91d0-89e6-13b3704ae504	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-553e-91d0-30bc-316f1a99b8f0	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-553e-91d0-7a86-382409a17754	BB	BRB	052	Barbados 	Barbados	\N
00040000-553e-91d0-c6e7-8a5e4b4f259c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-553e-91d0-6c89-a441201543a1	BE	BEL	056	Belgium 	Belgija	\N
00040000-553e-91d0-2819-cff8be7c5ea4	BZ	BLZ	084	Belize 	Belize	\N
00040000-553e-91d0-d95e-ac2b86d9656f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-553e-91d0-6683-84598a84ea43	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-553e-91d0-1340-f47b8907b207	BT	BTN	064	Bhutan 	Butan	\N
00040000-553e-91d0-7f3e-fd397b55a606	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-553e-91d0-eb2c-1d867ebe68e6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-553e-91d0-c8cd-4bf24e38b2af	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-553e-91d0-e290-080b76d2fbe5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-553e-91d0-e502-70202d9264b4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-553e-91d0-8130-bf3357ef1ef3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-553e-91d0-8cd9-5a9246cb26f4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-553e-91d0-c80e-c7e96d2312fd	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-553e-91d0-374f-1a0fb1bf9f2d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-553e-91d0-c1f2-c0c14253de01	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-553e-91d0-008f-da77a864c9e9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-553e-91d0-d625-192d986f7dd1	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-553e-91d0-4b52-ba60fd4ad5ce	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-553e-91d0-0a90-287f024536db	CA	CAN	124	Canada 	Kanada	\N
00040000-553e-91d0-43c8-20e7027a06fd	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-553e-91d0-f258-45164ccec95b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-553e-91d0-8b8f-5fa1b7a32af6	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-553e-91d0-7b95-0b155b9606b5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-553e-91d0-1f3c-95848368f0e3	CL	CHL	152	Chile 	Čile	\N
00040000-553e-91d0-c552-e7ef7d86820b	CN	CHN	156	China 	Kitajska	\N
00040000-553e-91d0-f387-60bcb4c47b04	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-553e-91d0-a12f-237521dd5660	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-553e-91d0-bebf-474e76262f60	CO	COL	170	Colombia 	Kolumbija	\N
00040000-553e-91d0-fe59-05d7e394635a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-553e-91d0-0584-2640cbf777e9	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-553e-91d0-d9d1-1a9027351220	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-553e-91d0-48d9-d753658a29fb	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-553e-91d0-9bb0-92b7fc3bacd6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-553e-91d0-d563-6c92dd257235	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-553e-91d0-e25a-d7372b304690	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-553e-91d0-b960-288839408112	CU	CUB	192	Cuba 	Kuba	\N
00040000-553e-91d0-ef1e-1a8be978bde8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-553e-91d0-f382-aadb20c8f2cb	CY	CYP	196	Cyprus 	Ciper	\N
00040000-553e-91d0-5a2a-372264f9f4a7	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-553e-91d0-6e24-7bbc1fc28389	DK	DNK	208	Denmark 	Danska	\N
00040000-553e-91d0-665a-dd0f62d42e14	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-553e-91d0-d6c2-0190ce0578e2	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-553e-91d0-bd9f-1e049d18bfd3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-553e-91d0-07a3-23996f25ea20	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-553e-91d0-4e12-740fe649a64d	EG	EGY	818	Egypt 	Egipt	\N
00040000-553e-91d0-063c-bba31017a10a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-553e-91d0-a371-5d4517527bcc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-553e-91d0-6a18-cddf720f3a3c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-553e-91d0-1e57-47f657602486	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-553e-91d0-f25a-2408491a519c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-553e-91d0-80ab-a8a404101280	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-553e-91d0-df1d-a0694a0ee258	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-553e-91d0-d0be-203442db8575	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-553e-91d0-5775-c82fd15e9682	FI	FIN	246	Finland 	Finska	\N
00040000-553e-91d0-2e0e-0046697a0f30	FR	FRA	250	France 	Francija	\N
00040000-553e-91d0-41de-9b125eccd67e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-553e-91d0-9587-56256f890c81	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-553e-91d0-eb4b-024d6629d3e6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-553e-91d0-4a74-fdd9d448375c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-553e-91d0-b4a7-fb9971e9c3dc	GA	GAB	266	Gabon 	Gabon	\N
00040000-553e-91d0-3afe-0e5aca237ccf	GM	GMB	270	Gambia 	Gambija	\N
00040000-553e-91d0-d571-dd690c38efcb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-553e-91d0-f71e-3d6194cf1756	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-553e-91d0-30f0-0209a4ac7b29	GH	GHA	288	Ghana 	Gana	\N
00040000-553e-91d0-692b-7cda3d2b9844	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-553e-91d0-d4f3-2fb3c1e5e3e5	GR	GRC	300	Greece 	Grčija	\N
00040000-553e-91d0-3917-155e7d0eb6d3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-553e-91d0-eaa3-48cc301a16cd	GD	GRD	308	Grenada 	Grenada	\N
00040000-553e-91d0-0db0-d07d96407912	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-553e-91d0-51d6-accc6a120a54	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-553e-91d0-34ae-e8acab3e9774	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-553e-91d0-ff49-8ca659283f42	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-553e-91d0-17f6-95c8e40a585e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-553e-91d0-63ad-a3c0ce0028fb	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-553e-91d0-a1cc-2506c2cd0196	GY	GUY	328	Guyana 	Gvajana	\N
00040000-553e-91d0-2f0d-adc67e78fb1c	HT	HTI	332	Haiti 	Haiti	\N
00040000-553e-91d0-3d86-f984219bf0f5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-553e-91d0-3007-4e2e96a94546	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-553e-91d0-69df-e3adc30ec5e1	HN	HND	340	Honduras 	Honduras	\N
00040000-553e-91d0-5c5a-d2563043b031	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-553e-91d0-1455-4fe46b286d69	HU	HUN	348	Hungary 	Madžarska	\N
00040000-553e-91d0-b3b4-faedf8f319b6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-553e-91d0-e546-a8655e39051f	IN	IND	356	India 	Indija	\N
00040000-553e-91d0-dd80-0d3586a5a4b4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-553e-91d0-4b69-039e24d7a7a3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-553e-91d0-db10-96c102cf89d2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-553e-91d0-460d-082e3930c852	IE	IRL	372	Ireland 	Irska	\N
00040000-553e-91d0-a1c9-dc2a34a26843	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-553e-91d0-8a41-14d3f3209f7f	IL	ISR	376	Israel 	Izrael	\N
00040000-553e-91d0-e0c3-7ac1d33d8c0d	IT	ITA	380	Italy 	Italija	\N
00040000-553e-91d0-08e1-d397a5bf7a6f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-553e-91d0-55d9-1a294a5688f1	JP	JPN	392	Japan 	Japonska	\N
00040000-553e-91d0-3eb5-155eaf1b865f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-553e-91d0-64ce-6cb20b87de22	JO	JOR	400	Jordan 	Jordanija	\N
00040000-553e-91d0-4dc9-882c2fdcbe8e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-553e-91d0-f925-c06e523d5330	KE	KEN	404	Kenya 	Kenija	\N
00040000-553e-91d0-9c7f-1e1f891ada18	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-553e-91d0-69c9-54e31e3f48fb	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-553e-91d0-2808-01bc337e509d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-553e-91d0-0db3-0168c37a8176	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-553e-91d0-412a-7d3a4dcad87e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-553e-91d0-b293-9ef2a1d7ba41	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-553e-91d0-9212-027d1a0fb2ba	LV	LVA	428	Latvia 	Latvija	\N
00040000-553e-91d0-882e-6a65ef8bd656	LB	LBN	422	Lebanon 	Libanon	\N
00040000-553e-91d0-e213-b593f614dfee	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-553e-91d0-54e4-f3bc07c1c87e	LR	LBR	430	Liberia 	Liberija	\N
00040000-553e-91d0-ec21-900cc20135f1	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-553e-91d0-1c6f-be7ae72733cc	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-553e-91d0-4d38-e93fc448c41e	LT	LTU	440	Lithuania 	Litva	\N
00040000-553e-91d0-b50d-185861408c29	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-553e-91d0-4da5-7d3a905290b7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-553e-91d0-c0e4-97c83c2101ac	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-553e-91d0-5447-3e6eca4823ed	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-553e-91d0-157c-f0528e23b26a	MW	MWI	454	Malawi 	Malavi	\N
00040000-553e-91d0-bdc7-a229584871c4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-553e-91d0-d736-3c753a703a9d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-553e-91d0-02c5-7db444299e78	ML	MLI	466	Mali 	Mali	\N
00040000-553e-91d0-a41c-5ad847a0b5ed	MT	MLT	470	Malta 	Malta	\N
00040000-553e-91d0-ce08-6e8637fe0036	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-553e-91d0-4409-e11e5c2d7f5c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-553e-91d0-5030-906b750b3c2c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-553e-91d0-0e3c-3bd355a95878	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-553e-91d0-30ff-14aee1846ef6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-553e-91d0-4b15-dd02e3ae1553	MX	MEX	484	Mexico 	Mehika	\N
00040000-553e-91d0-4d46-8c78f0d974ec	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-553e-91d0-be7c-1ec613fecedc	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-553e-91d0-19cb-a19783abbfb2	MC	MCO	492	Monaco 	Monako	\N
00040000-553e-91d0-3660-b13facab9f91	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-553e-91d0-86f2-9f27d36e6889	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-553e-91d0-7ab9-b2f92a45054f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-553e-91d0-9b4e-4e5028200a47	MA	MAR	504	Morocco 	Maroko	\N
00040000-553e-91d0-bf11-55704a80cb3d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-553e-91d0-3571-61b38b69500a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-553e-91d0-debd-15e93fd48ec7	NA	NAM	516	Namibia 	Namibija	\N
00040000-553e-91d0-5c5f-e83bc23fd214	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-553e-91d0-acc6-58a56975880f	NP	NPL	524	Nepal 	Nepal	\N
00040000-553e-91d0-17bc-f909001a7576	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-553e-91d0-d528-0d7ed21d1509	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-553e-91d0-c2fb-c91c9e6938c5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-553e-91d0-1f80-ddce94518c3e	NE	NER	562	Niger 	Niger 	\N
00040000-553e-91d0-7266-60851cb79ad8	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-553e-91d0-99e7-e5fed075b1ff	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-553e-91d0-ba3a-5695316602fa	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-553e-91d0-7f00-4006cc5df8a4	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-553e-91d0-a137-bc529b74f6d3	NO	NOR	578	Norway 	Norveška	\N
00040000-553e-91d0-935e-a0d66259eea1	OM	OMN	512	Oman 	Oman	\N
00040000-553e-91d0-f1e2-c7b301e1e1d6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-553e-91d0-dc6d-1ec9006b183e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-553e-91d0-5fce-b0c62416c82f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-553e-91d0-10d2-fd536d8f9ea7	PA	PAN	591	Panama 	Panama	\N
00040000-553e-91d0-a43b-dcfb2eae632a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-553e-91d0-2a4d-ead2d6d1a8ef	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-553e-91d0-6918-6f96a3b56b3f	PE	PER	604	Peru 	Peru	\N
00040000-553e-91d0-9149-378e73857152	PH	PHL	608	Philippines 	Filipini	\N
00040000-553e-91d0-9538-b98b4bfd2d4e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-553e-91d0-0a18-9f6aa532d6d3	PL	POL	616	Poland 	Poljska	\N
00040000-553e-91d0-1b38-67b0a4440b8f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-553e-91d0-7e92-84179dd96fea	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-553e-91d0-aa7d-fa9c7904010d	QA	QAT	634	Qatar 	Katar	\N
00040000-553e-91d0-11ce-204a621c2159	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-553e-91d0-1947-d2838e38a84e	RO	ROU	642	Romania 	Romunija	\N
00040000-553e-91d0-26f2-b4e52ecb524f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-553e-91d0-5dfe-5eb6cf57f953	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-553e-91d0-a0d9-c778df0f6797	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-553e-91d0-966d-ceb02b210679	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-553e-91d0-a52b-73d0a33965c2	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-553e-91d0-7a20-0baab5366d6f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-553e-91d0-14e2-41cbeb709400	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-553e-91d0-f6c2-ea510ad1dd80	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-553e-91d0-157b-8f69af3d934e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-553e-91d0-1136-d06658186beb	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-553e-91d0-2afe-7e1c45dbf3a0	SM	SMR	674	San Marino 	San Marino	\N
00040000-553e-91d0-49f4-2cff032c2602	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-553e-91d0-9311-5239c6c422f5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-553e-91d0-d4ba-5f50810d60ea	SN	SEN	686	Senegal 	Senegal	\N
00040000-553e-91d0-85db-73388ddef064	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-553e-91d0-7547-4748473efc2a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-553e-91d0-23c1-335b335e1b6f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-553e-91d0-f3fd-002debdf4f60	SG	SGP	702	Singapore 	Singapur	\N
00040000-553e-91d0-305a-8d680f60d614	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-553e-91d0-297f-b59199281023	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-553e-91d0-96e5-4869a3c9d9dc	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-553e-91d0-8e95-f25499a0c52f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-553e-91d0-4c99-15ca61b6aca4	SO	SOM	706	Somalia 	Somalija	\N
00040000-553e-91d0-e622-e6438bf95ddb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-553e-91d0-ec62-15b17a4a8607	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-553e-91d0-cbd1-67cfe2c17fd4	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-553e-91d0-a890-401e8e2f42d8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-553e-91d0-c364-acde1590f745	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-553e-91d0-1ff6-fbed41fc9c30	SD	SDN	729	Sudan 	Sudan	\N
00040000-553e-91d0-6ff4-6c89be4a6325	SR	SUR	740	Suriname 	Surinam	\N
00040000-553e-91d0-5dce-2161f660bdbd	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-553e-91d0-a156-4bd93b55bce3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-553e-91d0-4c59-d82e1a465201	SE	SWE	752	Sweden 	Švedska	\N
00040000-553e-91d0-a2e5-58987f2ba072	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-553e-91d0-e83a-4e0188746a3f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-553e-91d0-1a0c-6feda7c6e461	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-553e-91d0-1217-4e377d0c0959	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-553e-91d0-77c3-76beb8812542	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-553e-91d0-1b08-e09cd79ab454	TH	THA	764	Thailand 	Tajska	\N
00040000-553e-91d0-3d96-209b960791ff	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-553e-91d0-90c2-5afd48126c5a	TG	TGO	768	Togo 	Togo	\N
00040000-553e-91d0-4dc7-34467eda9030	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-553e-91d0-ceda-5fbd5639ebfc	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-553e-91d0-6ce4-8631879ac097	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-553e-91d0-26b7-eb139c7057a7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-553e-91d0-6b1e-190a93eea108	TR	TUR	792	Turkey 	Turčija	\N
00040000-553e-91d0-fe5c-2db21a0fda90	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-553e-91d0-1cd5-df5c9c241292	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553e-91d0-3f84-369609906506	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-553e-91d0-5286-680108391f79	UG	UGA	800	Uganda 	Uganda	\N
00040000-553e-91d0-0483-0c3a115c32a2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-553e-91d0-e1c2-d7030c25daa4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-553e-91d0-7a02-7d1b5718f7f8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-553e-91d0-6613-0225189b8fbc	US	USA	840	United States 	Združene države Amerike	\N
00040000-553e-91d0-c12d-a011245474d2	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-553e-91d0-47ab-5c89ecda13b6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-553e-91d0-6192-5f4440000394	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-553e-91d0-00bc-cc95f55da042	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-553e-91d0-93b6-8a40b084ab4f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-553e-91d0-5b83-2b30cd842b94	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-553e-91d0-caaf-f6127812d8aa	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553e-91d0-ad7d-2425032466e7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-553e-91d0-7d39-dddd2fa1b7da	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-553e-91d0-ec89-b534ef59e5e8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-553e-91d0-83e9-bf455e330e68	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-553e-91d0-9823-a5770997a324	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-553e-91d0-a4ba-c0d75b8615c9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2670 (class 0 OID 1472276)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1472097)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1472145)
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
-- TOC entry 2659 (class 0 OID 1472194)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 1472219)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1472046)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-553e-91d0-3ce7-acf04e29f492	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-553e-91d0-3d52-62c03ebee5e8	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-553e-91d0-5174-b2e66290309d	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-553e-91d0-c3f0-14c8418a47d0	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-553e-91d0-bca5-1679a1fe410b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-553e-91d0-026a-d73e34d893f0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-553e-91d0-8fcd-17f30adeec1e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-553e-91d0-489e-24d067f01bb9	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-553e-91d0-dd8f-ad6654e713bb	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-553e-91d0-0112-f2bd2ba52421	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2638 (class 0 OID 1471953)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-553e-91d0-8655-76dbe2e50788	00000000-553e-91d0-bca5-1679a1fe410b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-553e-91d0-4d3e-ac9d80f16363	00000000-553e-91d0-bca5-1679a1fe410b	00010000-553e-91d0-97ba-b4466922615f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-553e-91d0-9ee9-fe27d89e109a	00000000-553e-91d0-026a-d73e34d893f0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2639 (class 0 OID 1471964)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 1472016)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1471918)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-553e-91d0-b8de-3f716b0e0d35	Abonma-read	Abonma - branje	f
00030000-553e-91d0-9888-ea1f6fa7326b	Abonma-write	Abonma - spreminjanje	f
00030000-553e-91d0-e056-501b5780bd93	Alternacija-read	Alternacija - branje	f
00030000-553e-91d0-abf7-a4472cca8db1	Alternacija-write	Alternacija - spreminjanje	f
00030000-553e-91d0-582e-208cfbee58e4	Arhivalija-read	Arhivalija - branje	f
00030000-553e-91d0-6368-ccccb85dd05f	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-553e-91d0-4030-125b0ad45ffb	Besedilo-read	Besedilo - branje	f
00030000-553e-91d0-3c14-7b073c8b8ae2	Besedilo-write	Besedilo - spreminjanje	f
00030000-553e-91d0-762a-bb4d1e100b01	DogodekIzven-read	DogodekIzven - branje	f
00030000-553e-91d0-7030-2b9bcf53e89a	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-553e-91d0-0603-4864c36d91b5	Dogodek-read	Dogodek - branje	f
00030000-553e-91d0-5643-d88405261ebc	Dogodek-write	Dogodek - spreminjanje	f
00030000-553e-91d0-af1c-344bca63b012	Drzava-read	Drzava - branje	f
00030000-553e-91d0-640c-2a73c20e93c1	Drzava-write	Drzava - spreminjanje	f
00030000-553e-91d0-c76e-34f57f5da589	Funkcija-read	Funkcija - branje	f
00030000-553e-91d0-8533-dcc8af43bbd7	Funkcija-write	Funkcija - spreminjanje	f
00030000-553e-91d0-e2ae-fac49bf72f0f	Gostovanje-read	Gostovanje - branje	f
00030000-553e-91d0-07a9-1f60e19b3da3	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-553e-91d0-8ddd-3d2ff2c0121c	Gostujoca-read	Gostujoca - branje	f
00030000-553e-91d0-a2bd-ce30c43cd4f9	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-553e-91d0-08fd-d131112e897e	Kupec-read	Kupec - branje	f
00030000-553e-91d0-c0a8-eba544486270	Kupec-write	Kupec - spreminjanje	f
00030000-553e-91d0-85e4-570e279b3bda	NacinPlacina-read	NacinPlacina - branje	f
00030000-553e-91d0-a37e-5f10dd4a85eb	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-553e-91d0-b254-8611a68b8c43	Option-read	Option - branje	f
00030000-553e-91d0-dfbc-ae29ef28f822	Option-write	Option - spreminjanje	f
00030000-553e-91d0-5065-f50c8fd93d2e	OptionValue-read	OptionValue - branje	f
00030000-553e-91d0-d24b-a57a4fe4d4ba	OptionValue-write	OptionValue - spreminjanje	f
00030000-553e-91d0-272e-fb04bb15b84d	Oseba-read	Oseba - branje	f
00030000-553e-91d0-f79d-75b988836686	Oseba-write	Oseba - spreminjanje	f
00030000-553e-91d0-f937-5e8b2180300a	Permission-read	Permission - branje	f
00030000-553e-91d0-12b1-fe4217efee80	Permission-write	Permission - spreminjanje	f
00030000-553e-91d0-623f-3cda64bed05e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-553e-91d0-75cd-a3ca04b602d4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-553e-91d0-aa51-bbc3bc3ff1ca	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-553e-91d0-c036-3b82b2e323db	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-553e-91d0-a951-025c99c9cc28	Pogodba-read	Pogodba - branje	f
00030000-553e-91d0-ca48-9e4ba00a1891	Pogodba-write	Pogodba - spreminjanje	f
00030000-553e-91d0-d0a9-adfeb39be792	Popa-read	Popa - branje	f
00030000-553e-91d0-e1a7-0401bf1b8f26	Popa-write	Popa - spreminjanje	f
00030000-553e-91d0-874e-56b52aa4a20f	Posta-read	Posta - branje	f
00030000-553e-91d0-3110-f92aa12e7bbb	Posta-write	Posta - spreminjanje	f
00030000-553e-91d0-7e06-bd4df6a5db82	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-553e-91d0-c9ea-5d3e9bfa4980	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-553e-91d0-0901-5224e020e456	PostniNaslov-read	PostniNaslov - branje	f
00030000-553e-91d0-fe24-5cfe4ba97533	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-553e-91d0-0730-fcc597803864	Predstava-read	Predstava - branje	f
00030000-553e-91d0-e47c-92f165c90184	Predstava-write	Predstava - spreminjanje	f
00030000-553e-91d0-daa5-f4731aa12f8e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-553e-91d0-706d-28d34ef1437b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-553e-91d0-543d-744a5f7290a4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-553e-91d0-1272-8e0861bae85e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-553e-91d0-1ce3-b58e4cd3e99f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-553e-91d0-8453-94e1ec688116	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-553e-91d0-0627-9c8a283b582e	Prostor-read	Prostor - branje	f
00030000-553e-91d0-9b08-6d1ccda7686c	Prostor-write	Prostor - spreminjanje	f
00030000-553e-91d0-fb9d-a34e3ab3734b	Racun-read	Racun - branje	f
00030000-553e-91d0-f0c1-b4b984d19693	Racun-write	Racun - spreminjanje	f
00030000-553e-91d0-401c-f2f501d1a3c8	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-553e-91d0-ccef-8a55943b494c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-553e-91d0-2cc5-04c04a213b17	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-553e-91d0-cae1-b2300900815d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-553e-91d0-12cc-1b2530f6bb3b	Rekvizit-read	Rekvizit - branje	f
00030000-553e-91d0-3703-c3b0057922ac	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-553e-91d0-72d8-1ac554971dbf	Revizija-read	Revizija - branje	f
00030000-553e-91d0-79e2-142262a3d1e1	Revizija-write	Revizija - spreminjanje	f
00030000-553e-91d0-6fc8-cffa5db7f9fe	Rezervacija-read	Rezervacija - branje	f
00030000-553e-91d0-6c1a-e1256b97cc61	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-553e-91d0-5bf6-7bdecf60380f	Role-read	Role - branje	f
00030000-553e-91d0-3d38-e52451cf4a0c	Role-write	Role - spreminjanje	f
00030000-553e-91d0-ba20-2ed40b1c0696	SedezniRed-read	SedezniRed - branje	f
00030000-553e-91d0-b75e-a3a4ba580f58	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-553e-91d0-fcc4-240abfc3e70f	Sedez-read	Sedez - branje	f
00030000-553e-91d0-1ea3-d70a3bd56ecc	Sedez-write	Sedez - spreminjanje	f
00030000-553e-91d0-16dc-75d9dd20125b	Sezona-read	Sezona - branje	f
00030000-553e-91d0-7301-857bfd32fd89	Sezona-write	Sezona - spreminjanje	f
00030000-553e-91d0-2aef-0f64e6741ee0	Telefonska-read	Telefonska - branje	f
00030000-553e-91d0-5ddd-f27ac40357ee	Telefonska-write	Telefonska - spreminjanje	f
00030000-553e-91d0-ecb3-102e1dfb6f39	TerminStoritve-read	TerminStoritve - branje	f
00030000-553e-91d0-ad2d-230c70a41d3d	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-553e-91d0-39be-6cf56a85c1e6	TipFunkcije-read	TipFunkcije - branje	f
00030000-553e-91d0-0d9d-f5bb0c1d2cf8	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-553e-91d0-6647-29039a401127	Trr-read	Trr - branje	f
00030000-553e-91d0-8651-6c89ed2b3726	Trr-write	Trr - spreminjanje	f
00030000-553e-91d0-d480-e709e385c0f2	Uprizoritev-read	Uprizoritev - branje	f
00030000-553e-91d0-bb3d-2176cc5e340b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-553e-91d0-3cf9-fcbb09a950a1	User-read	User - branje	f
00030000-553e-91d0-887a-26f2fb0f5774	User-write	User - spreminjanje	f
00030000-553e-91d0-63c8-5918ee04dc6c	Vaja-read	Vaja - branje	f
00030000-553e-91d0-97c6-e7914e3aabc8	Vaja-write	Vaja - spreminjanje	f
00030000-553e-91d0-0e5d-21aa3436fd1e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-553e-91d0-91a3-d8c900fc5a00	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-553e-91d0-2270-d6170a8545fb	Zaposlitev-read	Zaposlitev - branje	f
00030000-553e-91d0-4dfd-2d21536874bb	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-553e-91d0-28c9-0b64ebe2629d	Zasedenost-read	Zasedenost - branje	f
00030000-553e-91d0-799a-671ea2e873f5	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-553e-91d0-b194-6f520de1c564	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-553e-91d0-a89a-a70eb16234cf	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-553e-91d0-afa5-180f3ceddf53	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-553e-91d0-7004-59a2b866dbff	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2636 (class 0 OID 1471937)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-553e-91d0-7fd1-31ed2aa8f4ab	00030000-553e-91d0-af1c-344bca63b012
00020000-553e-91d0-7d60-e648c9da0db4	00030000-553e-91d0-640c-2a73c20e93c1
00020000-553e-91d0-7d60-e648c9da0db4	00030000-553e-91d0-af1c-344bca63b012
\.


--
-- TOC entry 2664 (class 0 OID 1472226)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 1472256)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1472368)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1471996)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1472038)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-553e-91cf-308a-dcc7898f758d	8341	Adlešiči
00050000-553e-91cf-9263-940f36dc391f	5270	Ajdovščina
00050000-553e-91cf-f7ca-d5c6a7f2783d	6280	Ankaran/Ancarano
00050000-553e-91cf-654d-07bdc9cd9dfa	9253	Apače
00050000-553e-91cf-6a76-5fc9adfcc3a0	8253	Artiče
00050000-553e-91cf-d24d-f378525e41cf	4275	Begunje na Gorenjskem
00050000-553e-91cf-f11b-adedf331c83e	1382	Begunje pri Cerknici
00050000-553e-91cf-a971-9c7f1d0bc67c	9231	Beltinci
00050000-553e-91cf-d021-acd39a2a5a49	2234	Benedikt
00050000-553e-91cf-6055-1d60e34779bb	2345	Bistrica ob Dravi
00050000-553e-91cf-49c9-0aa45a9e3e01	3256	Bistrica ob Sotli
00050000-553e-91cf-0083-b82d9e9a5dba	8259	Bizeljsko
00050000-553e-91cf-c25e-30d0d45a50ba	1223	Blagovica
00050000-553e-91cf-463f-f8abdf59b30b	8283	Blanca
00050000-553e-91cf-30ea-ebc477abcc7d	4260	Bled
00050000-553e-91cf-773e-828d7465a701	4273	Blejska Dobrava
00050000-553e-91cf-43e9-65f72158a057	9265	Bodonci
00050000-553e-91cf-4441-3fc29664a1a6	9222	Bogojina
00050000-553e-91cf-23cf-33bd1c21cdc4	4263	Bohinjska Bela
00050000-553e-91cf-4534-381dc61bfeed	4264	Bohinjska Bistrica
00050000-553e-91cf-162e-6cf7d55c0304	4265	Bohinjsko jezero
00050000-553e-91cf-10fc-e5c3feb36dd9	1353	Borovnica
00050000-553e-91cf-0a42-89ce4a6f8ac6	8294	Boštanj
00050000-553e-91cf-2a03-8024b7923b16	5230	Bovec
00050000-553e-91cf-af54-cb5d493c6c36	5295	Branik
00050000-553e-91cf-5965-070319d3620f	3314	Braslovče
00050000-553e-91cf-0838-4506706657cb	5223	Breginj
00050000-553e-91cf-25fa-394b60563f10	8280	Brestanica
00050000-553e-91cf-335c-2c743775c0ff	2354	Bresternica
00050000-553e-91cf-d832-b8d503114ec1	4243	Brezje
00050000-553e-91cf-8515-00c9d8362e93	1351	Brezovica pri Ljubljani
00050000-553e-91cf-751d-ab3bbe1b1c8c	8250	Brežice
00050000-553e-91cf-e241-cc2ad9c0d717	4210	Brnik - Aerodrom
00050000-553e-91cf-b50f-a313a306662f	8321	Brusnice
00050000-553e-91cf-9562-21fa5ed56f66	3255	Buče
00050000-553e-91cf-0183-c2b3404f0c2c	8276	Bučka 
00050000-553e-91cf-b118-a5e767158b23	9261	Cankova
00050000-553e-91cf-a247-4520908658d2	3000	Celje 
00050000-553e-91cf-696e-993733f0d9f2	3001	Celje - poštni predali
00050000-553e-91cf-1843-a2aa5efedb36	4207	Cerklje na Gorenjskem
00050000-553e-91cf-f6e7-dc5eb561df70	8263	Cerklje ob Krki
00050000-553e-91cf-a8d8-8c5784fcbdcd	1380	Cerknica
00050000-553e-91cf-5080-d90b9094bb10	5282	Cerkno
00050000-553e-91cf-a56b-3016f46bfd05	2236	Cerkvenjak
00050000-553e-91cf-d8bd-83b69d60f558	2215	Ceršak
00050000-553e-91cf-2171-3ce32c301375	2326	Cirkovce
00050000-553e-91cf-064f-750de6645b85	2282	Cirkulane
00050000-553e-91cf-2296-af86f84ad0d5	5273	Col
00050000-553e-91cf-d119-7067eaaefae0	8251	Čatež ob Savi
00050000-553e-91cf-b020-421f8bb4f84b	1413	Čemšenik
00050000-553e-91cf-a4a9-4a17540e0168	5253	Čepovan
00050000-553e-91cf-d3ca-61201d004208	9232	Črenšovci
00050000-553e-91cf-041f-e297ea4ce285	2393	Črna na Koroškem
00050000-553e-91cf-dac7-aadc26f9ea29	6275	Črni Kal
00050000-553e-91cf-1de1-037eaa91f983	5274	Črni Vrh nad Idrijo
00050000-553e-91cf-f2f6-f35343ea7661	5262	Črniče
00050000-553e-91cf-ac7c-90b870208b4c	8340	Črnomelj
00050000-553e-91cf-4a87-3c782d269adb	6271	Dekani
00050000-553e-91cf-f316-04602b55741a	5210	Deskle
00050000-553e-91cf-cd75-b81930735786	2253	Destrnik
00050000-553e-91cf-3b27-cae4b732a13b	6215	Divača
00050000-553e-91cf-f563-97063875ed2d	1233	Dob
00050000-553e-91cf-7a87-8b2dffaff8cb	3224	Dobje pri Planini
00050000-553e-91cf-8a69-dd2c88cfa602	8257	Dobova
00050000-553e-91cf-97ba-5f4fcdda0d33	1423	Dobovec
00050000-553e-91cf-38a8-4678acb8fb3e	5263	Dobravlje
00050000-553e-91cf-6b50-8a5d6e652ea2	3204	Dobrna
00050000-553e-91cf-3a9f-b898f986ad22	8211	Dobrnič
00050000-553e-91cf-b7ef-288c831c4d46	1356	Dobrova
00050000-553e-91cf-f967-de0a886b4882	9223	Dobrovnik/Dobronak 
00050000-553e-91cf-8e5d-c955dd0703e6	5212	Dobrovo v Brdih
00050000-553e-91cf-9ee8-0b6f485af0e4	1431	Dol pri Hrastniku
00050000-553e-91cf-42e1-d18732fc76c5	1262	Dol pri Ljubljani
00050000-553e-91cf-951e-feecd19c91a8	1273	Dole pri Litiji
00050000-553e-91cf-91b4-eb440754a365	1331	Dolenja vas
00050000-553e-91cf-67aa-d8e1acb1daa9	8350	Dolenjske Toplice
00050000-553e-91cf-e459-613867166288	1230	Domžale
00050000-553e-91cf-e810-695d5a3cc10e	2252	Dornava
00050000-553e-91cf-9c2d-84bb465671b5	5294	Dornberk
00050000-553e-91cf-dab5-4d3e70557daa	1319	Draga
00050000-553e-91cf-d328-159176e4dfb9	8343	Dragatuš
00050000-553e-91cf-5ab0-be449e3e1217	3222	Dramlje
00050000-553e-91cf-b618-5fc60dbf1366	2370	Dravograd
00050000-553e-91cf-3932-cc49e6dcbf26	4203	Duplje
00050000-553e-91cf-8fe3-b52f30f356ad	6221	Dutovlje
00050000-553e-91cf-b9ba-e41002cbda2a	8361	Dvor
00050000-553e-91cf-ca4f-24b158d95fce	2343	Fala
00050000-553e-91cf-da98-407e11384fea	9208	Fokovci
00050000-553e-91cf-dc4e-b27ec2b87d54	2313	Fram
00050000-553e-91cf-1c38-c3e079fcaa20	3213	Frankolovo
00050000-553e-91cf-ccc1-457f3274b2e1	1274	Gabrovka
00050000-553e-91cf-6d38-ddc5bb8ffffc	8254	Globoko
00050000-553e-91cf-4710-b002c570aa44	5275	Godovič
00050000-553e-91cf-f687-4677a3c1ebc5	4204	Golnik
00050000-553e-91cf-ef73-42807dc960e7	3303	Gomilsko
00050000-553e-91cf-68ce-9e5e5d364b7d	4224	Gorenja vas
00050000-553e-91cf-d8b2-569d1c48c7bf	3263	Gorica pri Slivnici
00050000-553e-91cf-31c6-1ab265edc46b	2272	Gorišnica
00050000-553e-91cf-01f4-0c16928ff423	9250	Gornja Radgona
00050000-553e-91cf-6311-b16b0b931f18	3342	Gornji Grad
00050000-553e-91cf-50a3-5c2a7c627ccd	4282	Gozd Martuljek
00050000-553e-91cf-5e2f-a453146b7dd7	6272	Gračišče
00050000-553e-91cf-1d43-0dae4c5e8c1f	9264	Grad
00050000-553e-91cf-118b-ed5c04cb01b7	8332	Gradac
00050000-553e-91cf-efdc-a02518cd3215	1384	Grahovo
00050000-553e-91cf-10e4-d68ad3afe675	5242	Grahovo ob Bači
00050000-553e-91cf-5c1f-163dd88b8090	5251	Grgar
00050000-553e-91cf-06dc-aa9373841549	3302	Griže
00050000-553e-91cf-a3ea-5f0def3d830a	3231	Grobelno
00050000-553e-91cf-1fe5-eabc1d1c34b7	1290	Grosuplje
00050000-553e-91cf-cc38-f75aa3d89b1c	2288	Hajdina
00050000-553e-91cf-13f3-82c7ac5ff449	8362	Hinje
00050000-553e-91cf-ff8b-a8a635a6b2a9	2311	Hoče
00050000-553e-91cf-4fe9-a2eff02096c6	9205	Hodoš/Hodos
00050000-553e-91cf-f0cc-06698b2b0255	1354	Horjul
00050000-553e-91cf-9ce3-49e8e031a724	1372	Hotedršica
00050000-553e-91cf-bece-e3447f6e4715	1430	Hrastnik
00050000-553e-91cf-509d-09f99187a04b	6225	Hruševje
00050000-553e-91cf-82b0-a55e5fd4b7b7	4276	Hrušica
00050000-553e-91cf-96c2-90bd4b92eabc	5280	Idrija
00050000-553e-91cf-3e77-ecd7c44c7245	1292	Ig
00050000-553e-91cf-0696-895d63ad9087	6250	Ilirska Bistrica
00050000-553e-91cf-8cdc-c5f7c9fb8f4d	6251	Ilirska Bistrica-Trnovo
00050000-553e-91cf-60d8-0d213f356863	1295	Ivančna Gorica
00050000-553e-91cf-92ae-ccdc1859f7ea	2259	Ivanjkovci
00050000-553e-91cf-975b-c0867c191bb7	1411	Izlake
00050000-553e-91cf-950a-4909bb0652a9	6310	Izola/Isola
00050000-553e-91cf-2897-e5a8b771fc7a	2222	Jakobski Dol
00050000-553e-91cf-c33d-f9883a116f46	2221	Jarenina
00050000-553e-91cf-37ef-2c15b2ba8412	6254	Jelšane
00050000-553e-91cf-ba76-e52484d609be	4270	Jesenice
00050000-553e-91cf-822a-30a540591a2f	8261	Jesenice na Dolenjskem
00050000-553e-91cf-6da6-56ce44a1caec	3273	Jurklošter
00050000-553e-91cf-c121-26648cbd1385	2223	Jurovski Dol
00050000-553e-91cf-de68-c681f3ac33c9	2256	Juršinci
00050000-553e-91cf-ddd1-1c0d13fe7051	5214	Kal nad Kanalom
00050000-553e-91cf-b9c1-0910f0cf4f93	3233	Kalobje
00050000-553e-91cf-7650-6f1b2f6bc151	4246	Kamna Gorica
00050000-553e-91cf-2621-cfe8c0e342a2	2351	Kamnica
00050000-553e-91cf-d756-a587ca400686	1241	Kamnik
00050000-553e-91cf-fe1b-356464db566b	5213	Kanal
00050000-553e-91cf-9e91-d2152dca1d74	8258	Kapele
00050000-553e-91cf-6e7a-dda835ae9e89	2362	Kapla
00050000-553e-91cf-bd9b-aca2470f57a7	2325	Kidričevo
00050000-553e-91cf-d6a2-cee413b4494b	1412	Kisovec
00050000-553e-91cf-7fbe-911461b9a91f	6253	Knežak
00050000-553e-91cf-68b9-0e3121c7928a	5222	Kobarid
00050000-553e-91cf-0b5b-4f23ce23736b	9227	Kobilje
00050000-553e-91cf-64ea-6f50eca79ecf	1330	Kočevje
00050000-553e-91cf-2902-26bd4133e13a	1338	Kočevska Reka
00050000-553e-91cf-dc89-2a8a6cb76bc8	2276	Kog
00050000-553e-91cf-c482-cbca6967e2a1	5211	Kojsko
00050000-553e-91cf-6117-1c0c2a056294	6223	Komen
00050000-553e-91cf-c475-623001e75e2f	1218	Komenda
00050000-553e-91cf-4210-bd89aa11ec88	6000	Koper/Capodistria 
00050000-553e-91cf-f15d-4b4926b4abb1	6001	Koper/Capodistria - poštni predali
00050000-553e-91cf-1290-8e10bf9ad38c	8282	Koprivnica
00050000-553e-91cf-efd3-6f781e96f1a3	5296	Kostanjevica na Krasu
00050000-553e-91cf-01bf-e0d622b807f6	8311	Kostanjevica na Krki
00050000-553e-91cf-16fe-d0e5202891cb	1336	Kostel
00050000-553e-91cf-2063-ef49106c199d	6256	Košana
00050000-553e-91cf-5d04-0f3fd69571ca	2394	Kotlje
00050000-553e-91cf-45a3-5b5fe9ca8004	6240	Kozina
00050000-553e-91cf-7308-5cdeca7d503b	3260	Kozje
00050000-553e-91cf-c835-27d1b35cdf72	4000	Kranj 
00050000-553e-91cf-f8a6-f3c2e0bdb209	4001	Kranj - poštni predali
00050000-553e-91cf-5e34-de177220a449	4280	Kranjska Gora
00050000-553e-91cf-9c21-f6ebcd4a8957	1281	Kresnice
00050000-553e-91d0-13b4-c5965bf2f992	4294	Križe
00050000-553e-91d0-f9d3-2ba067bcdc1d	9206	Križevci
00050000-553e-91d0-5afc-0810c11ea7d0	9242	Križevci pri Ljutomeru
00050000-553e-91d0-b905-8f9236e1c6ff	1301	Krka
00050000-553e-91d0-2e75-538dabff7427	8296	Krmelj
00050000-553e-91d0-f2dc-ad6b4977cb72	4245	Kropa
00050000-553e-91d0-c213-c35b99ce6aff	8262	Krška vas
00050000-553e-91d0-1a52-fc58eb6ff391	8270	Krško
00050000-553e-91d0-69fc-c50a2d83213a	9263	Kuzma
00050000-553e-91d0-66e2-2c9fba44a240	2318	Laporje
00050000-553e-91d0-b7f7-8504880665de	3270	Laško
00050000-553e-91d0-3ccc-e626a5a31ed4	1219	Laze v Tuhinju
00050000-553e-91d0-7e4c-2c92116c5b72	2230	Lenart v Slovenskih goricah
00050000-553e-91d0-f812-e9c9c7f776aa	9220	Lendava/Lendva
00050000-553e-91d0-cb99-2d713633243e	4248	Lesce
00050000-553e-91d0-84be-9e84f7b1d6ef	3261	Lesično
00050000-553e-91d0-c9bb-76e9a4051357	8273	Leskovec pri Krškem
00050000-553e-91d0-1537-d9dccc63b13c	2372	Libeliče
00050000-553e-91d0-382e-aeef71727eb4	2341	Limbuš
00050000-553e-91d0-b81b-abc202595e5a	1270	Litija
00050000-553e-91d0-0f37-a012336541da	3202	Ljubečna
00050000-553e-91d0-bd51-b6050cfa7689	1000	Ljubljana 
00050000-553e-91d0-7bc2-38c1cba3eb5d	1001	Ljubljana - poštni predali
00050000-553e-91d0-ac5a-a5a6b35f685f	1231	Ljubljana - Črnuče
00050000-553e-91d0-e223-81d51c9b2cae	1261	Ljubljana - Dobrunje
00050000-553e-91d0-dd89-eb47295d1ff2	1260	Ljubljana - Polje
00050000-553e-91d0-8348-6716eeea8a3b	1210	Ljubljana - Šentvid
00050000-553e-91d0-86b2-ae607451c2a7	1211	Ljubljana - Šmartno
00050000-553e-91d0-4f57-75ee80a30335	3333	Ljubno ob Savinji
00050000-553e-91d0-b7a6-81f17779b38d	9240	Ljutomer
00050000-553e-91d0-3db5-0e769d0b4028	3215	Loče
00050000-553e-91d0-bcd6-23eeee602b26	5231	Log pod Mangartom
00050000-553e-91d0-f89d-36603e8ee2c1	1358	Log pri Brezovici
00050000-553e-91d0-8175-cb2baaa644d7	1370	Logatec
00050000-553e-91d0-ec54-baf4bf347028	1371	Logatec
00050000-553e-91d0-adfa-37ecbe9a9ca7	1434	Loka pri Zidanem Mostu
00050000-553e-91d0-11f6-b1fa43a78981	3223	Loka pri Žusmu
00050000-553e-91d0-6a9b-af95a0c7bffd	6219	Lokev
00050000-553e-91d0-2512-21b8a208ed8b	1318	Loški Potok
00050000-553e-91d0-9527-445f21807f06	2324	Lovrenc na Dravskem polju
00050000-553e-91d0-69bc-51211a4b89e7	2344	Lovrenc na Pohorju
00050000-553e-91d0-6fb3-b55fb44ab751	3334	Luče
00050000-553e-91d0-de74-ceb061435a97	1225	Lukovica
00050000-553e-91d0-a45f-c7e4bb77a021	9202	Mačkovci
00050000-553e-91d0-d304-6430089edf21	2322	Majšperk
00050000-553e-91d0-ab10-95ad88687753	2321	Makole
00050000-553e-91d0-72c6-ce8be5e2afea	9243	Mala Nedelja
00050000-553e-91d0-8359-1f3806c58b65	2229	Malečnik
00050000-553e-91d0-f0de-e76b393e2ca6	6273	Marezige
00050000-553e-91d0-bd69-32f3a8b2d86b	2000	Maribor 
00050000-553e-91d0-3d38-bc9555af9507	2001	Maribor - poštni predali
00050000-553e-91d0-0a66-0c0686ed145a	2206	Marjeta na Dravskem polju
00050000-553e-91d0-c758-47db6e85fd42	2281	Markovci
00050000-553e-91d0-e8c3-cbb6f7412154	9221	Martjanci
00050000-553e-91d0-1772-089ccfc249f5	6242	Materija
00050000-553e-91d0-b9af-ae54d2701582	4211	Mavčiče
00050000-553e-91d0-576e-bd759ceb038b	1215	Medvode
00050000-553e-91d0-549b-0023be05e827	1234	Mengeš
00050000-553e-91d0-8ff9-6a698ad9829a	8330	Metlika
00050000-553e-91d0-ef68-1a42a29886c8	2392	Mežica
00050000-553e-91d0-f409-c73d030fafec	2204	Miklavž na Dravskem polju
00050000-553e-91d0-b6da-56dafd5bfe18	2275	Miklavž pri Ormožu
00050000-553e-91d0-328c-e5adf7c78b4f	5291	Miren
00050000-553e-91d0-5358-d1e63094a811	8233	Mirna
00050000-553e-91d0-c9db-c24f21055ce3	8216	Mirna Peč
00050000-553e-91d0-6d3b-e736e485bb16	2382	Mislinja
00050000-553e-91d0-4cbd-8fc2dbd4d26d	4281	Mojstrana
00050000-553e-91d0-4b49-ccb289ca822e	8230	Mokronog
00050000-553e-91d0-e2c1-63dd66b0843d	1251	Moravče
00050000-553e-91d0-2277-0f5833f72404	9226	Moravske Toplice
00050000-553e-91d0-e359-f5899f962073	5216	Most na Soči
00050000-553e-91d0-02e0-5ab76ff5b236	1221	Motnik
00050000-553e-91d0-2127-87789a9efaf4	3330	Mozirje
00050000-553e-91d0-fcb8-6d2b9a161e21	9000	Murska Sobota 
00050000-553e-91d0-8da2-704144fb2b99	9001	Murska Sobota - poštni predali
00050000-553e-91d0-8cfb-bcf2fb506a47	2366	Muta
00050000-553e-91d0-3cba-e42307fb60b7	4202	Naklo
00050000-553e-91d0-1643-4a14f98f60aa	3331	Nazarje
00050000-553e-91d0-a267-312f8bc0e262	1357	Notranje Gorice
00050000-553e-91d0-b8bc-0f59ba58f9fa	3203	Nova Cerkev
00050000-553e-91d0-dfa0-5124c24ff14b	5000	Nova Gorica 
00050000-553e-91d0-279d-a730e8cab4f2	5001	Nova Gorica - poštni predali
00050000-553e-91d0-e71b-fb24edf62162	1385	Nova vas
00050000-553e-91d0-def3-ffa73f7c78bd	8000	Novo mesto
00050000-553e-91d0-6af1-cb9ff67de0ab	8001	Novo mesto - poštni predali
00050000-553e-91d0-6821-360b99560b0e	6243	Obrov
00050000-553e-91d0-08cb-75d002c0ec15	9233	Odranci
00050000-553e-91d0-1d18-159b7ef7d841	2317	Oplotnica
00050000-553e-91d0-8e7d-80e84a9b17e5	2312	Orehova vas
00050000-553e-91d0-4222-405debbf65cf	2270	Ormož
00050000-553e-91d0-b7d0-e448e9e4c9c0	1316	Ortnek
00050000-553e-91d0-4fdc-772f3888bc51	1337	Osilnica
00050000-553e-91d0-9e60-b6bccfce24cc	8222	Otočec
00050000-553e-91d0-d027-e2ae430249ee	2361	Ožbalt
00050000-553e-91d0-af9b-f083da735d32	2231	Pernica
00050000-553e-91d0-c8da-9af060325c44	2211	Pesnica pri Mariboru
00050000-553e-91d0-3de4-b2e1eb5e1a38	9203	Petrovci
00050000-553e-91d0-d3dd-11fda85597f0	3301	Petrovče
00050000-553e-91d0-d4d0-e843cc11895d	6330	Piran/Pirano
00050000-553e-91d0-2c19-e7b24dd774de	8255	Pišece
00050000-553e-91d0-13af-bde471492239	6257	Pivka
00050000-553e-91d0-72e5-7dfc39d4f4fd	6232	Planina
00050000-553e-91d0-cae0-bf3c71f60611	3225	Planina pri Sevnici
00050000-553e-91d0-9113-2933eb1404e6	6276	Pobegi
00050000-553e-91d0-8512-71fbb69c4ff3	8312	Podbočje
00050000-553e-91d0-28d5-a46f2301e668	5243	Podbrdo
00050000-553e-91d0-bdc6-8def321674c2	3254	Podčetrtek
00050000-553e-91d0-1c8c-9f479ff717c0	2273	Podgorci
00050000-553e-91d0-7a48-ef99c4e3cb4c	6216	Podgorje
00050000-553e-91d0-726c-73b0775ec4ab	2381	Podgorje pri Slovenj Gradcu
00050000-553e-91d0-8d36-91174b08748e	6244	Podgrad
00050000-553e-91d0-d08a-9a68bddd79cf	1414	Podkum
00050000-553e-91d0-c90c-1ae19aaeb9f4	2286	Podlehnik
00050000-553e-91d0-9a8c-e8b4a24df912	5272	Podnanos
00050000-553e-91d0-3c97-7f947c502e54	4244	Podnart
00050000-553e-91d0-eb25-f7f8cf690d12	3241	Podplat
00050000-553e-91d0-8b7d-2dd5a10e9609	3257	Podsreda
00050000-553e-91d0-eecd-f8bbc5b4a355	2363	Podvelka
00050000-553e-91d0-d526-97fa9e917a49	2208	Pohorje
00050000-553e-91d0-675c-c43b7c835650	2257	Polenšak
00050000-553e-91d0-db67-9459f74578f2	1355	Polhov Gradec
00050000-553e-91d0-0713-e65b8237cbd8	4223	Poljane nad Škofjo Loko
00050000-553e-91d0-da63-cdf153d45b67	2319	Poljčane
00050000-553e-91d0-57ef-0779eb91702e	1272	Polšnik
00050000-553e-91d0-f4fb-f837de6171d1	3313	Polzela
00050000-553e-91d0-e1e4-225d24995f22	3232	Ponikva
00050000-553e-91d0-423d-c53fc2a4f881	6320	Portorož/Portorose
00050000-553e-91d0-4853-5486dfd8a2cd	6230	Postojna
00050000-553e-91d0-d0cf-7116f09ef22d	2331	Pragersko
00050000-553e-91d0-8bc1-5836009b851c	3312	Prebold
00050000-553e-91d0-8629-c6a55908747e	4205	Preddvor
00050000-553e-91d0-91d9-bef3889cc2e7	6255	Prem
00050000-553e-91d0-304f-59cc50a4b5c9	1352	Preserje
00050000-553e-91d0-8cc2-cd5c9b424491	6258	Prestranek
00050000-553e-91d0-1427-559c0f9efd98	2391	Prevalje
00050000-553e-91d0-5d9f-e0768bf54c4c	3262	Prevorje
00050000-553e-91d0-cc9b-767ac2c05a7f	1276	Primskovo 
00050000-553e-91d0-63f9-1b93f0307ec3	3253	Pristava pri Mestinju
00050000-553e-91d0-35bb-0168e5d7521e	9207	Prosenjakovci/Partosfalva
00050000-553e-91d0-7e4d-142542e56ea2	5297	Prvačina
00050000-553e-91d0-a9da-164d213b44a3	2250	Ptuj
00050000-553e-91d0-2e7e-64c1ebaec31e	2323	Ptujska Gora
00050000-553e-91d0-d157-f8daa40d37c6	9201	Puconci
00050000-553e-91d0-4fe3-175e88856123	2327	Rače
00050000-553e-91d0-3c8c-8ce6a72e1b37	1433	Radeče
00050000-553e-91d0-f044-4ab0bfef081d	9252	Radenci
00050000-553e-91d0-ee1f-3805dc7151f2	2360	Radlje ob Dravi
00050000-553e-91d0-eb89-77de2eeb0ddf	1235	Radomlje
00050000-553e-91d0-b5f2-5ab3d89df475	4240	Radovljica
00050000-553e-91d0-edb0-4f65638b35e5	8274	Raka
00050000-553e-91d0-a1f2-e5fa4ca5a243	1381	Rakek
00050000-553e-91d0-797e-9e165e42f914	4283	Rateče - Planica
00050000-553e-91d0-5040-e7f03b06e37a	2390	Ravne na Koroškem
00050000-553e-91d0-9697-15839b717b3d	9246	Razkrižje
00050000-553e-91d0-e197-8b1b914d1a1c	3332	Rečica ob Savinji
00050000-553e-91d0-3ebe-3802aed04652	5292	Renče
00050000-553e-91d0-f507-2dfc14908797	1310	Ribnica
00050000-553e-91d0-902c-909d01385817	2364	Ribnica na Pohorju
00050000-553e-91d0-6cc9-113ef8e09d1b	3272	Rimske Toplice
00050000-553e-91d0-6523-3b1ca83b0a9c	1314	Rob
00050000-553e-91d0-519e-1b9da09f48c7	5215	Ročinj
00050000-553e-91d0-fc17-c50c2cdd4eae	3250	Rogaška Slatina
00050000-553e-91d0-0f17-aa097be60cfb	9262	Rogašovci
00050000-553e-91d0-dd91-a8d247c85fc4	3252	Rogatec
00050000-553e-91d0-97c7-0e97bc81a6a5	1373	Rovte
00050000-553e-91d0-f336-c46d14f5a29b	2342	Ruše
00050000-553e-91d0-55f2-75b45ad29544	1282	Sava
00050000-553e-91d0-7753-3a397f1e3837	6333	Sečovlje/Sicciole
00050000-553e-91d0-1962-df2c467ef001	4227	Selca
00050000-553e-91d0-3a8c-c37da0093d58	2352	Selnica ob Dravi
00050000-553e-91d0-ac53-5240ab5c8c84	8333	Semič
00050000-553e-91d0-868b-e1c0f4978d1c	8281	Senovo
00050000-553e-91d0-0133-0ae0ed4e97af	6224	Senožeče
00050000-553e-91d0-b112-cc1cd52a647a	8290	Sevnica
00050000-553e-91d0-5262-04c0be935061	6210	Sežana
00050000-553e-91d0-ae4d-d164ce81efb4	2214	Sladki Vrh
00050000-553e-91d0-1976-06b6fa1a06f1	5283	Slap ob Idrijci
00050000-553e-91d0-8f79-3316802b42bc	2380	Slovenj Gradec
00050000-553e-91d0-0f9d-b89be60d01fd	2310	Slovenska Bistrica
00050000-553e-91d0-d102-d0810ec4ab3a	3210	Slovenske Konjice
00050000-553e-91d0-9450-6a3ee620d184	1216	Smlednik
00050000-553e-91d0-3d69-e50b071e4f4d	5232	Soča
00050000-553e-91d0-3d9c-001b227984fa	1317	Sodražica
00050000-553e-91d0-7191-548a6abf830a	3335	Solčava
00050000-553e-91d0-6948-f84f7eedc703	5250	Solkan
00050000-553e-91d0-9f7d-ac54408ace09	4229	Sorica
00050000-553e-91d0-0783-8def2478520b	4225	Sovodenj
00050000-553e-91d0-2490-910bc5dd8d73	5281	Spodnja Idrija
00050000-553e-91d0-6842-3113c8ed9f23	2241	Spodnji Duplek
00050000-553e-91d0-a39f-c9c1f46f0cc9	9245	Spodnji Ivanjci
00050000-553e-91d0-8b1b-ec82103ead01	2277	Središče ob Dravi
00050000-553e-91d0-6e74-9eb690a0f865	4267	Srednja vas v Bohinju
00050000-553e-91d0-442e-c15e8ccdd00d	8256	Sromlje 
00050000-553e-91d0-2e33-50563cf6646e	5224	Srpenica
00050000-553e-91d0-f00a-3682a07252ab	1242	Stahovica
00050000-553e-91d0-efac-cf4292196cb2	1332	Stara Cerkev
00050000-553e-91d0-c9e8-b1f67269d563	8342	Stari trg ob Kolpi
00050000-553e-91d0-07fb-20b0ac1599fa	1386	Stari trg pri Ložu
00050000-553e-91d0-c9bc-81ffd56f155e	2205	Starše
00050000-553e-91d0-5f74-9f5bafdbe53b	2289	Stoperce
00050000-553e-91d0-3beb-a4a94567ebb7	8322	Stopiče
00050000-553e-91d0-2c4b-64d3529ea669	3206	Stranice
00050000-553e-91d0-efa7-731d1894f003	8351	Straža
00050000-553e-91d0-cfa9-de5af5e96abd	1313	Struge
00050000-553e-91d0-a6ec-514a2d4cba72	8293	Studenec
00050000-553e-91d0-7547-c1f0391956b9	8331	Suhor
00050000-553e-91d0-5b1c-4e8d0a13828f	2233	Sv. Ana v Slovenskih goricah
00050000-553e-91d0-01af-d62cd74443c6	2235	Sv. Trojica v Slovenskih goricah
00050000-553e-91d0-8f39-6f74ee8fde5f	2353	Sveti Duh na Ostrem Vrhu
00050000-553e-91d0-ae3a-b342818023e1	9244	Sveti Jurij ob Ščavnici
00050000-553e-91d0-3eaa-0be1f08c806b	3264	Sveti Štefan
00050000-553e-91d0-c31d-ba5fea5c2c18	2258	Sveti Tomaž
00050000-553e-91d0-7ebd-53a76d0e9051	9204	Šalovci
00050000-553e-91d0-10a3-3b89489bdf4a	5261	Šempas
00050000-553e-91d0-3d50-5b4fcbd11cb5	5290	Šempeter pri Gorici
00050000-553e-91d0-f7e5-906ca33b51a5	3311	Šempeter v Savinjski dolini
00050000-553e-91d0-71e4-212dc51ec0d2	4208	Šenčur
00050000-553e-91d0-7327-1285d27632c9	2212	Šentilj v Slovenskih goricah
00050000-553e-91d0-217b-78692d0b7687	8297	Šentjanž
00050000-553e-91d0-f49c-470099b58c75	2373	Šentjanž pri Dravogradu
00050000-553e-91d0-a5c4-825347461cf1	8310	Šentjernej
00050000-553e-91d0-0385-756f19ee6fbd	3230	Šentjur
00050000-553e-91d0-36ed-4481a0e26e84	3271	Šentrupert
00050000-553e-91d0-9ad8-b3ddb4edeb81	8232	Šentrupert
00050000-553e-91d0-2506-13433a7aec3c	1296	Šentvid pri Stični
00050000-553e-91d0-44cd-0c05fa9b9da1	8275	Škocjan
00050000-553e-91d0-a9c9-7a9b1ef2b0cf	6281	Škofije
00050000-553e-91d0-c177-4617a9703903	4220	Škofja Loka
00050000-553e-91d0-a8a3-f22bf9b9248c	3211	Škofja vas
00050000-553e-91d0-7b68-5c704566a1d4	1291	Škofljica
00050000-553e-91d0-6a1d-e52a3c017c3b	6274	Šmarje
00050000-553e-91d0-a271-949ea60fbafa	1293	Šmarje - Sap
00050000-553e-91d0-f122-3ffadbe40a8a	3240	Šmarje pri Jelšah
00050000-553e-91d0-c933-abb64a82b808	8220	Šmarješke Toplice
00050000-553e-91d0-7e2f-aa853bfc8868	2315	Šmartno na Pohorju
00050000-553e-91d0-d9fb-9cc8731e5846	3341	Šmartno ob Dreti
00050000-553e-91d0-a2d2-43cf565ec459	3327	Šmartno ob Paki
00050000-553e-91d0-1538-cf4ebf5ec932	1275	Šmartno pri Litiji
00050000-553e-91d0-5ad3-94c6b65f4134	2383	Šmartno pri Slovenj Gradcu
00050000-553e-91d0-e032-231fefca4355	3201	Šmartno v Rožni dolini
00050000-553e-91d0-3998-4cc4398959f6	3325	Šoštanj
00050000-553e-91d0-4794-7a101a9b2e87	6222	Štanjel
00050000-553e-91d0-2f42-44502b9a3aca	3220	Štore
00050000-553e-91d0-7a4c-2ca10562f26d	3304	Tabor
00050000-553e-91d0-1c93-3fb87f68b7fb	3221	Teharje
00050000-553e-91d0-fadb-ce849f98ff4b	9251	Tišina
00050000-553e-91d0-7f9b-0708443a3592	5220	Tolmin
00050000-553e-91d0-5d0e-5457982ddc10	3326	Topolšica
00050000-553e-91d0-7106-45f9e9924717	2371	Trbonje
00050000-553e-91d0-0cfe-0f94bbf0b5dd	1420	Trbovlje
00050000-553e-91d0-f8f5-77e0b1f2aba6	8231	Trebelno 
00050000-553e-91d0-a859-f0f7860005cd	8210	Trebnje
00050000-553e-91d0-cfd9-33571a22903f	5252	Trnovo pri Gorici
00050000-553e-91d0-0bbc-330ef910e15e	2254	Trnovska vas
00050000-553e-91d0-3607-99584a7b6a35	1222	Trojane
00050000-553e-91d0-37ce-910c9b71ce2f	1236	Trzin
00050000-553e-91d0-f73f-fe46ceeb8b19	4290	Tržič
00050000-553e-91d0-5a1f-eff522cd3112	8295	Tržišče
00050000-553e-91d0-31e0-4445ceb2e56f	1311	Turjak
00050000-553e-91d0-c1a6-6ccaffe8ca70	9224	Turnišče
00050000-553e-91d0-0b25-54d7194ef395	8323	Uršna sela
00050000-553e-91d0-427e-333f671c67b5	1252	Vače
00050000-553e-91d0-76ad-14c38a110c0d	3320	Velenje 
00050000-553e-91d0-a95e-aa60bb57fd7b	3322	Velenje - poštni predali
00050000-553e-91d0-292e-0c847dd33a1b	8212	Velika Loka
00050000-553e-91d0-befb-240f185a1a0a	2274	Velika Nedelja
00050000-553e-91d0-9947-a6bd1abea1e3	9225	Velika Polana
00050000-553e-91d0-c613-9f870ca71121	1315	Velike Lašče
00050000-553e-91d0-82af-d3d83c7e567e	8213	Veliki Gaber
00050000-553e-91d0-6b26-15b8372e7780	9241	Veržej
00050000-553e-91d0-3082-87728f4a1d57	1312	Videm - Dobrepolje
00050000-553e-91d0-06ab-c47401b41722	2284	Videm pri Ptuju
00050000-553e-91d0-f10e-55dd3552fc0d	8344	Vinica
00050000-553e-91d0-b43a-772ad8dadde3	5271	Vipava
00050000-553e-91d0-355c-db49a2c59943	4212	Visoko
00050000-553e-91d0-7a77-deaf08c8c658	1294	Višnja Gora
00050000-553e-91d0-753a-a0ea352ddc44	3205	Vitanje
00050000-553e-91d0-8852-4e871f9c4cde	2255	Vitomarci
00050000-553e-91d0-f2ef-735842570f1f	1217	Vodice
00050000-553e-91d0-42d9-07a47adc759d	3212	Vojnik\t
00050000-553e-91d0-5e0f-45e3d8f704bf	5293	Volčja Draga
00050000-553e-91d0-4ea3-39dc272b94b3	2232	Voličina
00050000-553e-91d0-ba68-c02ed7fe1e17	3305	Vransko
00050000-553e-91d0-b830-ec1cb3b63f01	6217	Vremski Britof
00050000-553e-91d0-db23-3c89550c8784	1360	Vrhnika
00050000-553e-91d0-506d-99bdaa361c88	2365	Vuhred
00050000-553e-91d0-6dfd-73e00cf43b8b	2367	Vuzenica
00050000-553e-91d0-e54b-9ce608fd8a96	8292	Zabukovje 
00050000-553e-91d0-2343-7d551e5fd1c7	1410	Zagorje ob Savi
00050000-553e-91d0-842f-eda1f4d14dc4	1303	Zagradec
00050000-553e-91d0-96ba-40f175c526f3	2283	Zavrč
00050000-553e-91d0-9c9c-7006153c95ff	8272	Zdole 
00050000-553e-91d0-d9a6-7bc4888973f5	4201	Zgornja Besnica
00050000-553e-91d0-8397-ea88bf630dcd	2242	Zgornja Korena
00050000-553e-91d0-bda8-69860d876283	2201	Zgornja Kungota
00050000-553e-91d0-d526-0c9da7b4b5d8	2316	Zgornja Ložnica
00050000-553e-91d0-ccb9-c97ca631f4d4	2314	Zgornja Polskava
00050000-553e-91d0-5d7b-a8dbd212e3af	2213	Zgornja Velka
00050000-553e-91d0-49f3-f17a51dbbffa	4247	Zgornje Gorje
00050000-553e-91d0-4c2e-3a7c93c1231a	4206	Zgornje Jezersko
00050000-553e-91d0-16ee-48bf2769dec7	2285	Zgornji Leskovec
00050000-553e-91d0-282b-a33496d88bb4	1432	Zidani Most
00050000-553e-91d0-2bda-83f3bb8897b4	3214	Zreče
00050000-553e-91d0-cb6a-bf69cfe02508	4209	Žabnica
00050000-553e-91d0-9353-09656ef225c1	3310	Žalec
00050000-553e-91d0-a5c1-606a6970a590	4228	Železniki
00050000-553e-91d0-87aa-704479442d85	2287	Žetale
00050000-553e-91d0-48bf-397773a945db	4226	Žiri
00050000-553e-91d0-8f30-7bf32eb1b024	4274	Žirovnica
00050000-553e-91d0-e856-3fc92675445c	8360	Žužemberk
\.


--
-- TOC entry 2660 (class 0 OID 1472200)
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
-- TOC entry 2643 (class 0 OID 1472023)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1472089)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1472212)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1472317)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1472361)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 1472241)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 1472185)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1472175)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1472351)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1472307)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1471888)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-553e-91d0-97ba-b4466922615f	00010000-553e-91d0-7666-9c556a10553b	2015-04-27 21:45:21	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROHinUGzev2vvjgtrBNAyCYGhZRETpi1q";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2667 (class 0 OID 1472250)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 1471928)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-553e-91d0-4a1f-41dd84c6185f	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-553e-91d0-fc79-647b1efbfa1d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-553e-91d0-7fd1-31ed2aa8f4ab	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-553e-91d0-406c-0ba33c364e56	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-553e-91d0-bba8-2fba57d67739	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-553e-91d0-7d60-e648c9da0db4	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2633 (class 0 OID 1471911)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-553e-91d0-97ba-b4466922615f	00020000-553e-91d0-406c-0ba33c364e56
00010000-553e-91d0-7666-9c556a10553b	00020000-553e-91d0-406c-0ba33c364e56
\.


--
-- TOC entry 2669 (class 0 OID 1472264)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1472206)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1472156)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1471988)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1472162)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1472342)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1472058)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 1471897)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-553e-91d0-7666-9c556a10553b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROOse0/KCN8IztA3aft5I9lNiBeASpyxy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-553e-91d0-97ba-b4466922615f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2681 (class 0 OID 1472392)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1472104)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1472233)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1472299)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1472132)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 1472382)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1472289)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2276 (class 2606 OID 1471952)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 1472431)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 1472424)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 1472341)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 1472122)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 1472155)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 1472084)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 1472285)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 1472102)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 1472149)
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
-- TOC entry 2366 (class 2606 OID 1472198)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 1472225)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 1472056)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2280 (class 2606 OID 1471961)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 1472020)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2282 (class 2606 OID 1471986)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 1471941)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 1471926)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 1472231)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 1472263)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 1472378)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 1472013)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 1472044)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 1472204)
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
-- TOC entry 2300 (class 2606 OID 1472034)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 1472093)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 1472216)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 1472323)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 1472366)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 1472248)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 1472189)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 1472180)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 1472360)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 1472314)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 1471896)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 1472254)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 1471915)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2269 (class 2606 OID 1471935)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 1472272)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 1472211)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 1472161)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 1471993)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 1472171)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 1472350)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 1472069)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 1471909)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 1472406)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 1472108)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 1472239)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 1472305)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 1472144)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 1472391)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 1472298)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 1259 OID 1472129)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2288 (class 1259 OID 1472015)
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
-- TOC entry 2379 (class 1259 OID 1472232)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2373 (class 1259 OID 1472218)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2374 (class 1259 OID 1472217)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2325 (class 1259 OID 1472109)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 1472288)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2401 (class 1259 OID 1472286)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 1472287)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2425 (class 1259 OID 1472379)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 1472380)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2427 (class 1259 OID 1472381)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2432 (class 1259 OID 1472409)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2433 (class 1259 OID 1472408)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2434 (class 1259 OID 1472407)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2307 (class 1259 OID 1472071)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2308 (class 1259 OID 1472070)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 1472022)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2293 (class 1259 OID 1472021)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 1472255)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2343 (class 1259 OID 1472150)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2271 (class 1259 OID 1471942)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2272 (class 1259 OID 1471943)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2393 (class 1259 OID 1472275)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2394 (class 1259 OID 1472274)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2395 (class 1259 OID 1472273)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2317 (class 1259 OID 1472094)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2318 (class 1259 OID 1472096)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2319 (class 1259 OID 1472095)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2353 (class 1259 OID 1472184)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2354 (class 1259 OID 1472182)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2355 (class 1259 OID 1472181)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2356 (class 1259 OID 1472183)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 1471916)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 1471917)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2382 (class 1259 OID 1472240)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2368 (class 1259 OID 1472205)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2408 (class 1259 OID 1472315)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2409 (class 1259 OID 1472316)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2296 (class 1259 OID 1472036)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2297 (class 1259 OID 1472035)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2298 (class 1259 OID 1472037)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2412 (class 1259 OID 1472324)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2413 (class 1259 OID 1472325)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2443 (class 1259 OID 1472434)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2444 (class 1259 OID 1472433)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2445 (class 1259 OID 1472436)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2446 (class 1259 OID 1472432)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2447 (class 1259 OID 1472435)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2405 (class 1259 OID 1472306)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2359 (class 1259 OID 1472193)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2360 (class 1259 OID 1472192)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2361 (class 1259 OID 1472190)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2362 (class 1259 OID 1472191)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2439 (class 1259 OID 1472426)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 1472425)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2324 (class 1259 OID 1472103)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2277 (class 1259 OID 1471963)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2278 (class 1259 OID 1471962)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2284 (class 1259 OID 1471994)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2285 (class 1259 OID 1471995)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 1472174)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2349 (class 1259 OID 1472173)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2350 (class 1259 OID 1472172)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2331 (class 1259 OID 1472131)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2332 (class 1259 OID 1472127)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2333 (class 1259 OID 1472124)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2334 (class 1259 OID 1472125)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2335 (class 1259 OID 1472123)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2336 (class 1259 OID 1472128)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2337 (class 1259 OID 1472126)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2291 (class 1259 OID 1472014)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1472085)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2314 (class 1259 OID 1472087)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2315 (class 1259 OID 1472086)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2316 (class 1259 OID 1472088)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2367 (class 1259 OID 1472199)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2283 (class 1259 OID 1471987)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2306 (class 1259 OID 1472057)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2258 (class 1259 OID 1471910)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2387 (class 1259 OID 1472249)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2267 (class 1259 OID 1471927)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2303 (class 1259 OID 1472045)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2424 (class 1259 OID 1472367)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2270 (class 1259 OID 1471936)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2338 (class 1259 OID 1472130)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2472 (class 2606 OID 1472567)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2475 (class 2606 OID 1472552)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2474 (class 2606 OID 1472557)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2470 (class 2606 OID 1472577)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2476 (class 2606 OID 1472547)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2471 (class 2606 OID 1472572)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2473 (class 2606 OID 1472562)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2457 (class 2606 OID 1472482)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2493 (class 2606 OID 1472662)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 1472657)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2492 (class 2606 OID 1472652)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2469 (class 2606 OID 1472542)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1472702)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2501 (class 2606 OID 1472692)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 1472697)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2489 (class 2606 OID 1472642)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 1472737)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2509 (class 2606 OID 1472742)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 1472747)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2511 (class 2606 OID 1472762)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2512 (class 2606 OID 1472757)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2513 (class 2606 OID 1472752)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2463 (class 2606 OID 1472517)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2464 (class 2606 OID 1472512)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 1472492)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 1472487)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 1472467)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2495 (class 2606 OID 1472672)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2477 (class 2606 OID 1472582)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2451 (class 2606 OID 1472447)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 1472452)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2496 (class 2606 OID 1472687)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2497 (class 2606 OID 1472682)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2498 (class 2606 OID 1472677)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2467 (class 2606 OID 1472522)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 1472532)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2466 (class 2606 OID 1472527)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2481 (class 2606 OID 1472617)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2483 (class 2606 OID 1472607)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2484 (class 2606 OID 1472602)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2482 (class 2606 OID 1472612)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2449 (class 2606 OID 1472437)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 1472442)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2494 (class 2606 OID 1472667)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2490 (class 2606 OID 1472647)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2504 (class 2606 OID 1472712)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2503 (class 2606 OID 1472717)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2461 (class 2606 OID 1472502)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 1472497)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2460 (class 2606 OID 1472507)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1472722)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 1472727)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2518 (class 2606 OID 1472787)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 1472782)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2516 (class 2606 OID 1472797)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2520 (class 2606 OID 1472777)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2517 (class 2606 OID 1472792)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2502 (class 2606 OID 1472707)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2485 (class 2606 OID 1472637)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2486 (class 2606 OID 1472632)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2488 (class 2606 OID 1472622)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2487 (class 2606 OID 1472627)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2514 (class 2606 OID 1472772)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 1472767)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2468 (class 2606 OID 1472537)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2507 (class 2606 OID 1472732)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 1472462)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2453 (class 2606 OID 1472457)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2456 (class 2606 OID 1472472)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 1472477)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2478 (class 2606 OID 1472597)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2479 (class 2606 OID 1472592)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2480 (class 2606 OID 1472587)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-27 21:45:21 CEST

--
-- PostgreSQL database dump complete
--

