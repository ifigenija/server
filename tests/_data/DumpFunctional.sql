--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-21 14:42:33 CEST

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
-- TOC entry 179 (class 1259 OID 4486084)
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
-- TOC entry 225 (class 1259 OID 4486563)
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
-- TOC entry 224 (class 1259 OID 4486546)
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
-- TOC entry 217 (class 1259 OID 4486459)
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
-- TOC entry 193 (class 1259 OID 4486250)
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
-- TOC entry 196 (class 1259 OID 4486284)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4486209)
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
-- TOC entry 212 (class 1259 OID 4486409)
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
-- TOC entry 191 (class 1259 OID 4486234)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4486278)
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
-- TOC entry 201 (class 1259 OID 4486327)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4486352)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4486183)
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
-- TOC entry 180 (class 1259 OID 4486093)
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
-- TOC entry 181 (class 1259 OID 4486104)
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
-- TOC entry 184 (class 1259 OID 4486154)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4486058)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4486077)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4486359)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4486389)
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
-- TOC entry 221 (class 1259 OID 4486502)
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
-- TOC entry 183 (class 1259 OID 4486134)
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
-- TOC entry 186 (class 1259 OID 4486175)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4486333)
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
-- TOC entry 185 (class 1259 OID 4486161)
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
-- TOC entry 190 (class 1259 OID 4486226)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4486345)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4486450)
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
-- TOC entry 220 (class 1259 OID 4486495)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4486374)
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
-- TOC entry 200 (class 1259 OID 4486318)
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
-- TOC entry 199 (class 1259 OID 4486308)
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
-- TOC entry 219 (class 1259 OID 4486485)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4486440)
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
-- TOC entry 173 (class 1259 OID 4486029)
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
-- TOC entry 172 (class 1259 OID 4486027)
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
-- TOC entry 209 (class 1259 OID 4486383)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4486067)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4486051)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4486397)
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
-- TOC entry 203 (class 1259 OID 4486339)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4486289)
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
-- TOC entry 182 (class 1259 OID 4486126)
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
-- TOC entry 198 (class 1259 OID 4486295)
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
-- TOC entry 218 (class 1259 OID 4486473)
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
-- TOC entry 188 (class 1259 OID 4486195)
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
-- TOC entry 174 (class 1259 OID 4486038)
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
-- TOC entry 223 (class 1259 OID 4486527)
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
-- TOC entry 192 (class 1259 OID 4486241)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4486366)
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
-- TOC entry 214 (class 1259 OID 4486432)
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
-- TOC entry 194 (class 1259 OID 4486273)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4486517)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4486422)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4486032)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2632 (class 0 OID 4486084)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4486563)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4486546)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4486459)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4486250)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4486284)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4486209)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555d-d2b8-3295-de32f954e97c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555d-d2b8-06bd-ca99b6e67ab9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555d-d2b8-d1c1-bdec183b02d8	AL	ALB	008	Albania 	Albanija	\N
00040000-555d-d2b8-cb15-e7eaea9bba24	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555d-d2b8-91eb-78e1efe03836	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555d-d2b8-a457-b4f9b79284aa	AD	AND	020	Andorra 	Andora	\N
00040000-555d-d2b8-670e-fa387c55cb9b	AO	AGO	024	Angola 	Angola	\N
00040000-555d-d2b8-71e9-c06253bb6792	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555d-d2b8-c8e6-34315a46f0a0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555d-d2b8-93f5-8f1aa00dbc53	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-d2b8-9be9-6d9a253693ed	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555d-d2b8-c07f-7cbc7f71661d	AM	ARM	051	Armenia 	Armenija	\N
00040000-555d-d2b8-b1fb-28594c35f5c4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555d-d2b8-48e4-602382f90a77	AU	AUS	036	Australia 	Avstralija	\N
00040000-555d-d2b8-84b1-926e5c5dbc5a	AT	AUT	040	Austria 	Avstrija	\N
00040000-555d-d2b8-8c14-7e48fa63bc88	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555d-d2b8-182f-4e5a7fb89d1a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555d-d2b8-5f3f-bc91bc0bfd15	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555d-d2b8-fffc-5f6440132676	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555d-d2b8-8db5-2baf787b151b	BB	BRB	052	Barbados 	Barbados	\N
00040000-555d-d2b8-976a-b1fc9850b7f1	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555d-d2b8-50d6-5cb23797db98	BE	BEL	056	Belgium 	Belgija	\N
00040000-555d-d2b8-5d64-43c98872a9b9	BZ	BLZ	084	Belize 	Belize	\N
00040000-555d-d2b8-d85e-9ee0f5c7b300	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555d-d2b8-7940-40bea3b0a691	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555d-d2b8-6d77-84e1ba307cbf	BT	BTN	064	Bhutan 	Butan	\N
00040000-555d-d2b8-209d-02b7e48d2baf	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555d-d2b8-e1ea-9d20905dbea1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555d-d2b8-5b2c-df6215680b07	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555d-d2b8-83e8-f1ed109b9147	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555d-d2b8-5203-e40c4da037bb	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555d-d2b8-0f8e-6d18b9e330ce	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555d-d2b8-09fa-33551c1837ee	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555d-d2b8-f783-bb2b893a21d1	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555d-d2b8-62ba-cae1f32fa7c5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555d-d2b8-c71c-7d406e4cd749	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555d-d2b8-021c-2dc5ef8e428c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555d-d2b8-dc50-567876a0e60a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555d-d2b8-2159-ed2d99951113	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555d-d2b8-86b6-e09a4b4c6dc0	CA	CAN	124	Canada 	Kanada	\N
00040000-555d-d2b8-d1dd-0fa77ca0d82d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555d-d2b8-f079-ac62790af81b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555d-d2b8-8602-0c0a528bd7ff	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555d-d2b8-45fd-45396a0e5a43	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555d-d2b8-8304-25738150cb79	CL	CHL	152	Chile 	Čile	\N
00040000-555d-d2b8-40ff-2d429c0026b4	CN	CHN	156	China 	Kitajska	\N
00040000-555d-d2b8-2e1b-2cb6d1aae2f1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555d-d2b8-889c-f02dc9fa7b3f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555d-d2b8-5cbf-80bd4e447ef0	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555d-d2b8-6e00-02d7e8a887e1	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555d-d2b8-894c-be40007e9f83	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555d-d2b8-56f2-9867bce58d8a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555d-d2b8-ad64-5efb15c40735	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555d-d2b8-b5b1-0271e9cbdae3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555d-d2b8-dc20-d3b771ad0331	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555d-d2b8-55ea-78185828f0c7	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555d-d2b8-04ce-49406b8a0a65	CU	CUB	192	Cuba 	Kuba	\N
00040000-555d-d2b8-a303-42e3f544e1ec	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555d-d2b8-218d-e3bd38811a62	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555d-d2b8-ec3a-14fa88ec6fac	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555d-d2b8-6746-3e97fd1b5db3	DK	DNK	208	Denmark 	Danska	\N
00040000-555d-d2b8-ac88-8d402fe8dcb3	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555d-d2b8-3234-d3da7a6d456e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-d2b8-6dc1-178c8c23fce9	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555d-d2b8-6ada-d7c7c58489a7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555d-d2b8-b31e-b5b344d0a7de	EG	EGY	818	Egypt 	Egipt	\N
00040000-555d-d2b8-9777-71a6468b1f49	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555d-d2b8-c8b0-d2a0b518f875	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555d-d2b8-1847-ad54ee453d6d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555d-d2b8-580d-1492ae1fb0cb	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555d-d2b8-28bc-04a12b6f0052	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555d-d2b8-0002-ae6792d75395	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555d-d2b8-1502-dd0d72a93642	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555d-d2b8-c512-82a22e4c08d7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555d-d2b8-efe3-864cd1d137b8	FI	FIN	246	Finland 	Finska	\N
00040000-555d-d2b8-927f-fdb7abd5e5db	FR	FRA	250	France 	Francija	\N
00040000-555d-d2b8-faaa-f53f350583c7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555d-d2b8-3405-aeda483e79a7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555d-d2b8-b0d4-f59fe0a127bb	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555d-d2b8-81c7-46b5b88d0e4c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555d-d2b8-6560-c0715c7f34b0	GA	GAB	266	Gabon 	Gabon	\N
00040000-555d-d2b8-5f1d-a6c5ca67acee	GM	GMB	270	Gambia 	Gambija	\N
00040000-555d-d2b8-3374-9ace6087c7a0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555d-d2b8-df9c-17cfc406ba46	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555d-d2b8-79d1-7217af1047e9	GH	GHA	288	Ghana 	Gana	\N
00040000-555d-d2b8-4253-0c0c3b908cf2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555d-d2b8-398f-5e5997e9677e	GR	GRC	300	Greece 	Grčija	\N
00040000-555d-d2b8-59d5-251cfa89d367	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555d-d2b8-0f87-490a21bb3c43	GD	GRD	308	Grenada 	Grenada	\N
00040000-555d-d2b8-ff8c-aa355dc3ff23	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555d-d2b8-b979-4ba42ac43bc7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555d-d2b8-12f4-3315ddfc9971	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555d-d2b8-64b6-a4a9db8da69b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555d-d2b8-2ee4-bde8b9a51b62	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555d-d2b8-c313-39c0f04e5444	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555d-d2b8-fd42-5ea942e11ae4	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555d-d2b8-234f-447b955a571a	HT	HTI	332	Haiti 	Haiti	\N
00040000-555d-d2b8-cc6b-4ed76bb4eea7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555d-d2b8-edf3-ee95d4bcdfbd	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555d-d2b8-8c5a-51f78f255d94	HN	HND	340	Honduras 	Honduras	\N
00040000-555d-d2b8-f05d-3280713f4fe6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555d-d2b8-6407-f3f245f45b5a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555d-d2b8-56c8-ef6073cb9c1a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555d-d2b8-7138-0f7effa9907f	IN	IND	356	India 	Indija	\N
00040000-555d-d2b8-d41c-4507b2c0c4c9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555d-d2b8-3e56-8814461556ff	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555d-d2b8-613b-a8b98fc7a4ff	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555d-d2b8-a52d-cc17c1f428c3	IE	IRL	372	Ireland 	Irska	\N
00040000-555d-d2b8-5445-0d6ca0d4dc3b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555d-d2b8-5af3-7812c2666818	IL	ISR	376	Israel 	Izrael	\N
00040000-555d-d2b8-6908-b675010a57fa	IT	ITA	380	Italy 	Italija	\N
00040000-555d-d2b8-b236-23c43c810743	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555d-d2b8-2aa9-443c8d64a2a1	JP	JPN	392	Japan 	Japonska	\N
00040000-555d-d2b8-cf8f-9d68291d7443	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555d-d2b8-e332-753c992e5348	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555d-d2b8-63e4-58adc19d284f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555d-d2b8-c042-89edc9f1b53b	KE	KEN	404	Kenya 	Kenija	\N
00040000-555d-d2b8-46f4-ae2395c4c87b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555d-d2b8-73e2-6f6a8d3f28f6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555d-d2b8-d7bd-aade14ef79e3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555d-d2b8-8a64-3ebc5b45f33c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555d-d2b8-a505-ccefa12b4b25	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555d-d2b8-b4cf-067623774cac	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555d-d2b8-998d-c34b3d5e0a6d	LV	LVA	428	Latvia 	Latvija	\N
00040000-555d-d2b8-4969-37db96184aef	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555d-d2b8-fe94-7c9405737f6d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555d-d2b8-d930-c4745f971da3	LR	LBR	430	Liberia 	Liberija	\N
00040000-555d-d2b8-7538-13f82f9014d7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555d-d2b8-2edb-ca424cc5de89	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555d-d2b8-eba2-5d3d8b8e9a54	LT	LTU	440	Lithuania 	Litva	\N
00040000-555d-d2b8-f5d3-a9a4b22e358b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555d-d2b8-7409-28ad1a506bba	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555d-d2b8-dbc4-364eaa84de8d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555d-d2b8-6a6c-e7360e6aae4c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555d-d2b8-6b88-df53633601b0	MW	MWI	454	Malawi 	Malavi	\N
00040000-555d-d2b8-de49-40de8b8b9319	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555d-d2b8-9c27-80ba4cadb007	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555d-d2b8-eafe-35fbd0bd642d	ML	MLI	466	Mali 	Mali	\N
00040000-555d-d2b8-8e40-ec53bd566b8d	MT	MLT	470	Malta 	Malta	\N
00040000-555d-d2b8-fad4-c1e83e7c966c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555d-d2b8-f1f0-350b82ee69f2	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555d-d2b8-b1c7-6a84afa333f4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555d-d2b8-f6af-6dd927f18e69	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555d-d2b8-9018-3b425587e213	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555d-d2b8-688f-05429f4032d0	MX	MEX	484	Mexico 	Mehika	\N
00040000-555d-d2b8-e7f5-6ef885dbaa3b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555d-d2b8-fea2-7b445dc051f6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555d-d2b8-9b55-a52be1166a38	MC	MCO	492	Monaco 	Monako	\N
00040000-555d-d2b8-b133-87fe1dcfbdb6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555d-d2b8-0c7b-4680987fa003	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555d-d2b8-245f-27e7c0bee86d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555d-d2b8-27a1-15b1e086fbe7	MA	MAR	504	Morocco 	Maroko	\N
00040000-555d-d2b8-d0c8-477592c30fa7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555d-d2b8-f314-09ed0c4d7f34	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555d-d2b8-79ce-0475df2d37bc	NA	NAM	516	Namibia 	Namibija	\N
00040000-555d-d2b8-be8f-0d474cd58aca	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555d-d2b8-e2ce-b2a9f8ed0a95	NP	NPL	524	Nepal 	Nepal	\N
00040000-555d-d2b8-fcee-6080fc86e355	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555d-d2b8-1d89-a95d58aa1e64	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555d-d2b8-6188-699205659154	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555d-d2b8-d157-df7924967296	NE	NER	562	Niger 	Niger 	\N
00040000-555d-d2b8-32bc-cd1f80afcb0f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555d-d2b8-bf36-fb3549159f22	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555d-d2b8-0cfb-3597ac7b4902	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555d-d2b8-5c49-cc3446daf4b3	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555d-d2b8-a875-cd1e7b51e0e2	NO	NOR	578	Norway 	Norveška	\N
00040000-555d-d2b8-bc4d-ea462568e72d	OM	OMN	512	Oman 	Oman	\N
00040000-555d-d2b8-d0ec-c6ca9a445aaf	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555d-d2b8-4ce5-d181e9b0a108	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555d-d2b8-4cbb-2c7e4b1bf627	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555d-d2b8-0fd5-45521113859a	PA	PAN	591	Panama 	Panama	\N
00040000-555d-d2b8-45af-52887b3872d6	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555d-d2b8-e236-6e9bef993e59	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555d-d2b8-dd0f-d7a60e780634	PE	PER	604	Peru 	Peru	\N
00040000-555d-d2b8-108a-a2435c8758e1	PH	PHL	608	Philippines 	Filipini	\N
00040000-555d-d2b8-6dbd-2207c2bb62a7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555d-d2b8-1fca-1de52de1c313	PL	POL	616	Poland 	Poljska	\N
00040000-555d-d2b8-4ff6-36aee194cfe5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555d-d2b8-4123-e255ce2aa6e5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555d-d2b8-1358-47d23ab79863	QA	QAT	634	Qatar 	Katar	\N
00040000-555d-d2b8-ddfe-a5274699a14a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555d-d2b8-3267-356a5b1a95fc	RO	ROU	642	Romania 	Romunija	\N
00040000-555d-d2b8-92e6-3b82023b745a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555d-d2b8-efa2-33fa5045b61d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555d-d2b8-cfbd-9b75c473d85b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555d-d2b8-1e2b-e3f0672448c8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555d-d2b8-ba07-c4ab586cf356	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555d-d2b8-c56f-39d13a2e9932	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555d-d2b8-9b61-64847bb0773e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555d-d2b8-8baf-d8cccc676c0b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555d-d2b8-9348-0e934f79309b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555d-d2b8-0411-8956b2b1a90c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555d-d2b8-3768-bac6f79fec16	SM	SMR	674	San Marino 	San Marino	\N
00040000-555d-d2b8-0c93-80b5dfd4c5cf	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555d-d2b8-feb3-e70882863c84	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555d-d2b8-6fd8-f72fce977d84	SN	SEN	686	Senegal 	Senegal	\N
00040000-555d-d2b8-a91d-f6c2224eaa2d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555d-d2b8-ae1d-a98d20bd7c0a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555d-d2b8-e68a-72985b601d4d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555d-d2b8-b39d-560bdf6771f5	SG	SGP	702	Singapore 	Singapur	\N
00040000-555d-d2b8-7d3b-a6471a27d5b3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555d-d2b8-7935-f84410d90837	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555d-d2b8-fba9-542849af3884	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555d-d2b8-98fe-87767b023199	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555d-d2b8-6361-8de9c7cd6fc6	SO	SOM	706	Somalia 	Somalija	\N
00040000-555d-d2b8-1e20-71bfdb8947ad	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555d-d2b8-e157-bd8c6c7ffd7f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555d-d2b8-e054-5c212897ac02	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555d-d2b8-a03a-ca00be149855	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555d-d2b8-bae8-5f614414adb9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555d-d2b8-f2e3-88694a76f6aa	SD	SDN	729	Sudan 	Sudan	\N
00040000-555d-d2b8-d505-6286e404a532	SR	SUR	740	Suriname 	Surinam	\N
00040000-555d-d2b8-65d8-23aa41478cce	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555d-d2b8-baa0-c612a50404f1	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555d-d2b8-5b5a-9babb08aee8c	SE	SWE	752	Sweden 	Švedska	\N
00040000-555d-d2b8-e960-58670c39b707	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555d-d2b8-b468-4095085904c6	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555d-d2b8-f5c6-16ef56725e62	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555d-d2b8-10de-7f80fa652a75	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555d-d2b8-6968-64081c74426e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555d-d2b8-d83a-5bd59a42e4c9	TH	THA	764	Thailand 	Tajska	\N
00040000-555d-d2b8-a325-6796d53d14c7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555d-d2b8-c97b-0137dcbd7b86	TG	TGO	768	Togo 	Togo	\N
00040000-555d-d2b8-cd30-67ab0dfcf864	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555d-d2b8-e847-fdc118e47510	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555d-d2b8-729c-0b2c88e8b7c2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555d-d2b8-e01e-a0df72a30922	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555d-d2b8-dc35-498384217c1d	TR	TUR	792	Turkey 	Turčija	\N
00040000-555d-d2b8-bde3-c5dfc72c6fc6	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555d-d2b8-dfdf-8dccc5b7547c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-d2b8-7618-8a8e02c4fdfe	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555d-d2b8-f731-69c6190bcd29	UG	UGA	800	Uganda 	Uganda	\N
00040000-555d-d2b8-68ea-b58cbb43dc0a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555d-d2b8-17f0-3d9ec99030f0	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555d-d2b8-6d50-ebba6c46415f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555d-d2b8-965f-36d30e8bb15d	US	USA	840	United States 	Združene države Amerike	\N
00040000-555d-d2b8-72ad-0f2f7e93d8a1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555d-d2b8-0e4e-7054af419cb3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555d-d2b8-7535-87ab7da8a7e5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555d-d2b8-15a8-79d0c3477811	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555d-d2b8-e630-5739b72e1828	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555d-d2b8-8a0c-a12cf6150f6a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555d-d2b8-0312-ef29da0a5266	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-d2b8-1edf-9194cefb6b12	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555d-d2b8-278e-5e01a0dfdaf9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555d-d2b8-c598-0fe11f31537e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555d-d2b8-d97f-688930c7aaa3	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555d-d2b8-cccc-c78cadbf15db	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555d-d2b8-b9fa-7490a1db7c6e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2665 (class 0 OID 4486409)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4486234)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4486278)
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
-- TOC entry 2654 (class 0 OID 4486327)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4486352)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4486183)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555d-d2b8-e786-397fa439a805	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555d-d2b8-3f26-4350b0fadbee	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555d-d2b8-d850-329ad1b23abe	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555d-d2b8-c0a7-7a4c7f4f3abc	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555d-d2b8-e3b9-6ed79444c99f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555d-d2b8-6e53-ce3683422670	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555d-d2b8-8e07-8e2cf81ebd13	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555d-d2b8-eeef-f132b418b77c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555d-d2b8-061c-06dc913c3efb	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555d-d2b8-b4b4-55a19d31f2f0	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555d-d2b8-5230-a8011a1331e2	uprizoritev.faza	array	a:5:{s:7:"osnutek";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:4:"plan";a:1:{s:5:"label";s:14:"Predprodukcija";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
\.


--
-- TOC entry 2633 (class 0 OID 4486093)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555d-d2b8-5485-fa0506d7126f	00000000-555d-d2b8-e3b9-6ed79444c99f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555d-d2b8-6f80-649c945efd92	00000000-555d-d2b8-e3b9-6ed79444c99f	00010000-555d-d2b8-4740-343b4be5e1ec	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555d-d2b8-426c-b5c9748e5b12	00000000-555d-d2b8-6e53-ce3683422670	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2634 (class 0 OID 4486104)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4486154)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4486058)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555d-d2b8-4016-96322a701ea6	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555d-d2b8-6855-b525851e32ab	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555d-d2b8-de8d-dd268244f419	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555d-d2b8-ce76-9a38ce2e394d	Abonma-read	Abonma - branje	f
00030000-555d-d2b8-7079-d86f5bf34b8d	Abonma-write	Abonma - spreminjanje	f
00030000-555d-d2b8-e2b7-eb8e54175dd6	Alternacija-read	Alternacija - branje	f
00030000-555d-d2b8-c6a5-b09e9a552ced	Alternacija-write	Alternacija - spreminjanje	f
00030000-555d-d2b8-873e-b9e93a572782	Arhivalija-read	Arhivalija - branje	f
00030000-555d-d2b8-294e-7679d13bd752	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555d-d2b8-b3bf-6abb617bd332	Besedilo-read	Besedilo - branje	f
00030000-555d-d2b8-c648-0881159b02f4	Besedilo-write	Besedilo - spreminjanje	f
00030000-555d-d2b8-4eca-466dd40f75ad	DogodekIzven-read	DogodekIzven - branje	f
00030000-555d-d2b8-4609-8e28f37a251b	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555d-d2b8-b497-24ed2afba0b0	Dogodek-read	Dogodek - branje	f
00030000-555d-d2b8-2429-77927db5f118	Dogodek-write	Dogodek - spreminjanje	f
00030000-555d-d2b8-b6ef-2ff4c8d8cede	Drzava-read	Drzava - branje	f
00030000-555d-d2b8-7d26-952f44aa4d63	Drzava-write	Drzava - spreminjanje	f
00030000-555d-d2b8-ddf4-87e760b50aba	Funkcija-read	Funkcija - branje	f
00030000-555d-d2b8-7937-a9a7e5788361	Funkcija-write	Funkcija - spreminjanje	f
00030000-555d-d2b8-88e1-7e8b0675acd5	Gostovanje-read	Gostovanje - branje	f
00030000-555d-d2b8-36c9-7e18f32e455a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555d-d2b8-bc04-efdaffdf376f	Gostujoca-read	Gostujoca - branje	f
00030000-555d-d2b8-c35e-241ff0848561	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555d-d2b8-68fd-78a11b11e501	Kupec-read	Kupec - branje	f
00030000-555d-d2b8-4da9-9517fbf13622	Kupec-write	Kupec - spreminjanje	f
00030000-555d-d2b8-f59b-876910e574f5	NacinPlacina-read	NacinPlacina - branje	f
00030000-555d-d2b8-2070-789e6fc10c19	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555d-d2b8-3604-36fc7dae586a	Option-read	Option - branje	f
00030000-555d-d2b8-eafc-81e10e8416c8	Option-write	Option - spreminjanje	f
00030000-555d-d2b8-de6c-1a5a1140adb3	OptionValue-read	OptionValue - branje	f
00030000-555d-d2b8-e556-b10f7b45ba68	OptionValue-write	OptionValue - spreminjanje	f
00030000-555d-d2b8-fff0-a9b239c48b10	Oseba-read	Oseba - branje	f
00030000-555d-d2b8-ecbc-83c5f45e75e0	Oseba-write	Oseba - spreminjanje	f
00030000-555d-d2b8-215f-81fd62d250f4	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555d-d2b8-2f8b-7031753b3dc7	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555d-d2b8-d458-e47e75fe035d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555d-d2b8-77e6-7aacf135fe1b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555d-d2b8-ae53-c32c0fe7c985	Pogodba-read	Pogodba - branje	f
00030000-555d-d2b8-2afa-3bb3b1f5f325	Pogodba-write	Pogodba - spreminjanje	f
00030000-555d-d2b8-feda-5ccacc3138a5	Popa-read	Popa - branje	f
00030000-555d-d2b8-5e9b-3f7270789fe9	Popa-write	Popa - spreminjanje	f
00030000-555d-d2b8-f372-e1449c11c3d1	Posta-read	Posta - branje	f
00030000-555d-d2b8-a39a-461d9665fec8	Posta-write	Posta - spreminjanje	f
00030000-555d-d2b8-8b3e-241a82599339	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555d-d2b8-c333-efe3466c3da3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555d-d2b8-2585-4d1955e701bf	PostniNaslov-read	PostniNaslov - branje	f
00030000-555d-d2b8-c617-80470aad1db5	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555d-d2b8-7e32-07e2bde03d7f	Predstava-read	Predstava - branje	f
00030000-555d-d2b8-5f08-a20d4de4cb2c	Predstava-write	Predstava - spreminjanje	f
00030000-555d-d2b8-52a2-6d43760993bb	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555d-d2b8-3d69-998328206634	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555d-d2b8-facb-95f78a263b8a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555d-d2b8-2ba8-3921321ad228	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555d-d2b8-a395-dcfff286dc4e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555d-d2b8-2316-8fdcd01ebeb2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555d-d2b8-85c6-2963ccaac58e	Prostor-read	Prostor - branje	f
00030000-555d-d2b8-b72a-ec809125f0ee	Prostor-write	Prostor - spreminjanje	f
00030000-555d-d2b8-f672-7cde48a498f7	Racun-read	Racun - branje	f
00030000-555d-d2b8-d7a8-fccd706037d9	Racun-write	Racun - spreminjanje	f
00030000-555d-d2b8-3f74-0533c1ebfad6	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555d-d2b8-06ee-835ace608bc3	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555d-d2b8-21d3-e75dbb2276f2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555d-d2b8-0db1-16b918a4347a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555d-d2b8-26c7-14a27f855c32	Rekvizit-read	Rekvizit - branje	f
00030000-555d-d2b8-116f-8d729e35becc	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555d-d2b8-2299-e69798daf323	Rezervacija-read	Rezervacija - branje	f
00030000-555d-d2b8-1523-6633ee64ac87	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555d-d2b8-2a15-2bfead47b14f	SedezniRed-read	SedezniRed - branje	f
00030000-555d-d2b8-e6e9-31b074bb0f15	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555d-d2b8-64f5-369bf830849f	Sedez-read	Sedez - branje	f
00030000-555d-d2b8-d297-227cc21761ec	Sedez-write	Sedez - spreminjanje	f
00030000-555d-d2b8-526e-c3b3eca59339	Sezona-read	Sezona - branje	f
00030000-555d-d2b8-cfa7-d5e225f918d3	Sezona-write	Sezona - spreminjanje	f
00030000-555d-d2b8-667a-df3df1b4e147	Telefonska-read	Telefonska - branje	f
00030000-555d-d2b8-a9b8-7c64a69c6d18	Telefonska-write	Telefonska - spreminjanje	f
00030000-555d-d2b8-88b2-7f26246572d3	TerminStoritve-read	TerminStoritve - branje	f
00030000-555d-d2b8-a74c-5f2ab19846c1	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555d-d2b8-32c6-6c1f1c8f2eb7	TipFunkcije-read	TipFunkcije - branje	f
00030000-555d-d2b8-decb-510b6d54957c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555d-d2b8-de60-d0d6dc429cda	Trr-read	Trr - branje	f
00030000-555d-d2b8-8298-d41d1f8da5de	Trr-write	Trr - spreminjanje	f
00030000-555d-d2b8-5d78-c1334f913de9	Uprizoritev-read	Uprizoritev - branje	f
00030000-555d-d2b8-7b5c-f4b3c8646b57	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555d-d2b8-e0fd-4ee37ecf61c8	Vaja-read	Vaja - branje	f
00030000-555d-d2b8-6c6a-29d629f5db7a	Vaja-write	Vaja - spreminjanje	f
00030000-555d-d2b8-fe46-bc0fb6a75471	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555d-d2b8-afff-aeadf31ff9c3	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555d-d2b8-53be-6f9eb3ff90e9	Zaposlitev-read	Zaposlitev - branje	f
00030000-555d-d2b8-531a-5328e4c99756	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555d-d2b8-0f35-fadb795ab4d3	Zasedenost-read	Zasedenost - branje	f
00030000-555d-d2b8-9dc7-5acfc0782473	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555d-d2b8-be72-17d4f1a7bb7a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555d-d2b8-a40b-fa57619271a3	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555d-d2b8-078b-7e7e70e70d9b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555d-d2b8-9f19-08d19c64f300	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2631 (class 0 OID 4486077)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555d-d2b8-9d79-878067b2a9af	00030000-555d-d2b8-b6ef-2ff4c8d8cede
00020000-555d-d2b8-ab90-e5895a098d73	00030000-555d-d2b8-7d26-952f44aa4d63
00020000-555d-d2b8-ab90-e5895a098d73	00030000-555d-d2b8-b6ef-2ff4c8d8cede
\.


--
-- TOC entry 2659 (class 0 OID 4486359)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4486389)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4486502)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 4486134)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4486175)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555d-d2b7-d5bb-5648504fb89c	8341	Adlešiči
00050000-555d-d2b7-f8d5-c900448d464f	5270	Ajdovščina
00050000-555d-d2b7-074b-f6f218f22959	6280	Ankaran/Ancarano
00050000-555d-d2b7-06c6-a623f39df40d	9253	Apače
00050000-555d-d2b7-c3ca-3f7cc313fb69	8253	Artiče
00050000-555d-d2b7-de50-157967803af7	4275	Begunje na Gorenjskem
00050000-555d-d2b7-6c0e-0030fbf3ed97	1382	Begunje pri Cerknici
00050000-555d-d2b7-7aa4-a271e88be473	9231	Beltinci
00050000-555d-d2b7-324e-332a508a95a4	2234	Benedikt
00050000-555d-d2b7-cada-9a0d2bc1a93c	2345	Bistrica ob Dravi
00050000-555d-d2b7-07a6-39cd330eafe8	3256	Bistrica ob Sotli
00050000-555d-d2b7-556e-a1079b284c78	8259	Bizeljsko
00050000-555d-d2b7-f35c-1914fc3febe0	1223	Blagovica
00050000-555d-d2b7-d09e-7242f932ce1f	8283	Blanca
00050000-555d-d2b7-b101-28c0b8a70dfa	4260	Bled
00050000-555d-d2b7-b32c-664e4d86195d	4273	Blejska Dobrava
00050000-555d-d2b7-9f6b-a48eff7aba52	9265	Bodonci
00050000-555d-d2b7-4bd7-0ac556b3aaa1	9222	Bogojina
00050000-555d-d2b7-5a34-e3554e883714	4263	Bohinjska Bela
00050000-555d-d2b7-51d6-045b51ac7780	4264	Bohinjska Bistrica
00050000-555d-d2b7-16ca-fe78f3c654b4	4265	Bohinjsko jezero
00050000-555d-d2b7-1df4-2d982904af81	1353	Borovnica
00050000-555d-d2b7-6264-d4a7b2e6170b	8294	Boštanj
00050000-555d-d2b7-4b84-b247ab4ebfef	5230	Bovec
00050000-555d-d2b7-24b9-8354b5d706c4	5295	Branik
00050000-555d-d2b7-7685-bdbc4a061c07	3314	Braslovče
00050000-555d-d2b7-12bf-d768e396ceb1	5223	Breginj
00050000-555d-d2b7-df77-926e85d3f9d7	8280	Brestanica
00050000-555d-d2b7-8eee-ee823c7567a1	2354	Bresternica
00050000-555d-d2b7-986d-3c963113256c	4243	Brezje
00050000-555d-d2b7-7ec0-193ce76b5929	1351	Brezovica pri Ljubljani
00050000-555d-d2b7-eb59-d6ff20896b93	8250	Brežice
00050000-555d-d2b7-42a3-4c92cbed9f8f	4210	Brnik - Aerodrom
00050000-555d-d2b7-dc03-1018752ca8d9	8321	Brusnice
00050000-555d-d2b7-a0b7-b22ddfb8f7a2	3255	Buče
00050000-555d-d2b7-3761-90858bab6f71	8276	Bučka 
00050000-555d-d2b7-b805-7a69aedeeda1	9261	Cankova
00050000-555d-d2b7-6333-ea6d91da21f5	3000	Celje 
00050000-555d-d2b7-96bf-4fca39043caa	3001	Celje - poštni predali
00050000-555d-d2b7-bf3f-63163fde8357	4207	Cerklje na Gorenjskem
00050000-555d-d2b7-5159-992dcc522930	8263	Cerklje ob Krki
00050000-555d-d2b7-b7ba-a3f62119c144	1380	Cerknica
00050000-555d-d2b7-e61e-87590bf1e499	5282	Cerkno
00050000-555d-d2b7-9cd9-554b333eeed0	2236	Cerkvenjak
00050000-555d-d2b7-e6fc-f23fa45c13fe	2215	Ceršak
00050000-555d-d2b7-cfa9-578c6372f0a5	2326	Cirkovce
00050000-555d-d2b7-7d1f-6faceb0886c3	2282	Cirkulane
00050000-555d-d2b7-11f2-56fd82e51f31	5273	Col
00050000-555d-d2b7-e558-a889eec0033c	8251	Čatež ob Savi
00050000-555d-d2b7-cad4-bcd9e80f9646	1413	Čemšenik
00050000-555d-d2b7-7b29-335d31c3f7b6	5253	Čepovan
00050000-555d-d2b7-b8a3-1af5ac42ec47	9232	Črenšovci
00050000-555d-d2b7-484c-0e2d0f0d1fdc	2393	Črna na Koroškem
00050000-555d-d2b7-8d38-6b5d56d05817	6275	Črni Kal
00050000-555d-d2b7-eec0-e1dcaf2192e0	5274	Črni Vrh nad Idrijo
00050000-555d-d2b7-3fe7-35f017152ce4	5262	Črniče
00050000-555d-d2b7-d5c4-57e150a4739b	8340	Črnomelj
00050000-555d-d2b7-7ab1-a6171de45168	6271	Dekani
00050000-555d-d2b7-52ef-74479a19e34b	5210	Deskle
00050000-555d-d2b7-571b-373475bda54d	2253	Destrnik
00050000-555d-d2b7-5f2c-4b83606f952c	6215	Divača
00050000-555d-d2b7-fc12-5da01f6d47a0	1233	Dob
00050000-555d-d2b7-d86f-9b7d50dedbe8	3224	Dobje pri Planini
00050000-555d-d2b7-852b-67188fe1c70f	8257	Dobova
00050000-555d-d2b7-c963-b12400cd659b	1423	Dobovec
00050000-555d-d2b7-0ad0-8eafa893a04c	5263	Dobravlje
00050000-555d-d2b7-88aa-a8aeb007901e	3204	Dobrna
00050000-555d-d2b7-77e4-b360a6fbdb5b	8211	Dobrnič
00050000-555d-d2b7-d54c-1245b0538755	1356	Dobrova
00050000-555d-d2b7-8a0d-2c58de8b2560	9223	Dobrovnik/Dobronak 
00050000-555d-d2b7-ecd3-adf61678d174	5212	Dobrovo v Brdih
00050000-555d-d2b7-bf89-566a10d65741	1431	Dol pri Hrastniku
00050000-555d-d2b7-a483-7c30184cb7c0	1262	Dol pri Ljubljani
00050000-555d-d2b7-9dac-cfd015ad41eb	1273	Dole pri Litiji
00050000-555d-d2b7-a39c-ab3aead4a635	1331	Dolenja vas
00050000-555d-d2b7-5321-063f29f9e7d0	8350	Dolenjske Toplice
00050000-555d-d2b7-dfe8-2b92ee5eaf43	1230	Domžale
00050000-555d-d2b7-bf33-b9e61d71bd07	2252	Dornava
00050000-555d-d2b7-8ba9-32cd9dcb24c1	5294	Dornberk
00050000-555d-d2b7-00ed-ea0fee63b37a	1319	Draga
00050000-555d-d2b7-b594-0838f7af30dc	8343	Dragatuš
00050000-555d-d2b7-86a2-02a0925ad79b	3222	Dramlje
00050000-555d-d2b7-a81b-92dcd6ccbecc	2370	Dravograd
00050000-555d-d2b7-ab8d-f2b2de4f33ba	4203	Duplje
00050000-555d-d2b7-234e-04f65c77e7e3	6221	Dutovlje
00050000-555d-d2b7-16a9-063d55fe3ed2	8361	Dvor
00050000-555d-d2b7-fecb-6bf272693d17	2343	Fala
00050000-555d-d2b7-4bed-cb1406e0f28c	9208	Fokovci
00050000-555d-d2b7-fc50-60ac8e6c4e6e	2313	Fram
00050000-555d-d2b7-1b7e-3c71bdbe03e1	3213	Frankolovo
00050000-555d-d2b7-2952-2577d3059f34	1274	Gabrovka
00050000-555d-d2b7-4aa0-ec9b8edeb853	8254	Globoko
00050000-555d-d2b7-f2ed-1a9b22e58ffb	5275	Godovič
00050000-555d-d2b7-3245-6fe4d5e85d39	4204	Golnik
00050000-555d-d2b7-99f9-24cbf8124b97	3303	Gomilsko
00050000-555d-d2b7-6fd2-f7d686ae42a2	4224	Gorenja vas
00050000-555d-d2b7-c6f4-3f42d0eb3cb7	3263	Gorica pri Slivnici
00050000-555d-d2b7-7a08-c25c96baa572	2272	Gorišnica
00050000-555d-d2b7-4a94-95c9d8a51f1c	9250	Gornja Radgona
00050000-555d-d2b7-7a27-062c4dab2574	3342	Gornji Grad
00050000-555d-d2b7-b7d2-03c03ee02086	4282	Gozd Martuljek
00050000-555d-d2b7-68cf-37d2ab7920f7	6272	Gračišče
00050000-555d-d2b7-5ad4-556582c50ced	9264	Grad
00050000-555d-d2b7-366c-da5c5b2bc79a	8332	Gradac
00050000-555d-d2b7-0f1c-1b762baf1018	1384	Grahovo
00050000-555d-d2b7-eeb7-f769008b536d	5242	Grahovo ob Bači
00050000-555d-d2b7-296e-2eaa40875a4e	5251	Grgar
00050000-555d-d2b7-b725-014a8bfd8d5a	3302	Griže
00050000-555d-d2b7-2e30-a69eb95c3426	3231	Grobelno
00050000-555d-d2b7-db66-a94ac1378456	1290	Grosuplje
00050000-555d-d2b7-77af-4ee9d2bce79a	2288	Hajdina
00050000-555d-d2b7-dd30-7a6c1d4234bf	8362	Hinje
00050000-555d-d2b7-2bf5-571ea41307cd	2311	Hoče
00050000-555d-d2b7-1088-934bafa8df10	9205	Hodoš/Hodos
00050000-555d-d2b7-0ea3-25f593be2088	1354	Horjul
00050000-555d-d2b7-eea0-23066995f4b5	1372	Hotedršica
00050000-555d-d2b7-2d99-6227d61413c6	1430	Hrastnik
00050000-555d-d2b7-bebe-67aea0d4259c	6225	Hruševje
00050000-555d-d2b7-7334-dffbd9868f19	4276	Hrušica
00050000-555d-d2b7-8378-54cc4b94beff	5280	Idrija
00050000-555d-d2b7-4610-3aceb54a24d7	1292	Ig
00050000-555d-d2b7-d082-040140682e31	6250	Ilirska Bistrica
00050000-555d-d2b7-c264-19fde459f62d	6251	Ilirska Bistrica-Trnovo
00050000-555d-d2b7-6c52-8b0743040a5d	1295	Ivančna Gorica
00050000-555d-d2b7-8293-83d316611302	2259	Ivanjkovci
00050000-555d-d2b7-818c-357ceebae4fb	1411	Izlake
00050000-555d-d2b7-2daf-0411c6194e84	6310	Izola/Isola
00050000-555d-d2b7-8e58-1995c6d0f61f	2222	Jakobski Dol
00050000-555d-d2b7-ef4c-065bf11b01da	2221	Jarenina
00050000-555d-d2b7-539f-bbbdbd92780d	6254	Jelšane
00050000-555d-d2b7-fe04-f2099782a521	4270	Jesenice
00050000-555d-d2b7-37fc-a18207a6acf5	8261	Jesenice na Dolenjskem
00050000-555d-d2b7-c6b1-777cc5345d7d	3273	Jurklošter
00050000-555d-d2b7-467f-9405cd8769fd	2223	Jurovski Dol
00050000-555d-d2b7-0c33-b7093c1667c6	2256	Juršinci
00050000-555d-d2b7-e967-e046271cbe62	5214	Kal nad Kanalom
00050000-555d-d2b7-082c-6d9af02cb0fb	3233	Kalobje
00050000-555d-d2b7-fe96-c82677e23977	4246	Kamna Gorica
00050000-555d-d2b7-77f3-f96348f7002d	2351	Kamnica
00050000-555d-d2b7-2826-90223b1d593e	1241	Kamnik
00050000-555d-d2b7-95b5-12581bd517d0	5213	Kanal
00050000-555d-d2b7-02dd-a6f2896cf37d	8258	Kapele
00050000-555d-d2b7-e09d-7e41a69b861f	2362	Kapla
00050000-555d-d2b7-b13c-7778bcfd236b	2325	Kidričevo
00050000-555d-d2b7-1332-d5c2e183a3f2	1412	Kisovec
00050000-555d-d2b7-21b6-310e4775f877	6253	Knežak
00050000-555d-d2b7-887f-11e4ce28cc29	5222	Kobarid
00050000-555d-d2b7-024d-91e74f264828	9227	Kobilje
00050000-555d-d2b7-7e7d-bf74db93f04d	1330	Kočevje
00050000-555d-d2b7-e3ef-875ef468214f	1338	Kočevska Reka
00050000-555d-d2b7-a7e0-61ea32c881c8	2276	Kog
00050000-555d-d2b7-fca8-dd12d864dfca	5211	Kojsko
00050000-555d-d2b7-7805-6d3896c822cb	6223	Komen
00050000-555d-d2b7-46c2-dc7aae74a745	1218	Komenda
00050000-555d-d2b7-2e26-230e84592488	6000	Koper/Capodistria 
00050000-555d-d2b7-986f-0d84f27e5151	6001	Koper/Capodistria - poštni predali
00050000-555d-d2b7-b420-b569a01b04d4	8282	Koprivnica
00050000-555d-d2b7-cfac-63937f53e612	5296	Kostanjevica na Krasu
00050000-555d-d2b7-33c5-030257e27af6	8311	Kostanjevica na Krki
00050000-555d-d2b7-d7e7-b68296b35753	1336	Kostel
00050000-555d-d2b7-386e-1cf1d8f3ae62	6256	Košana
00050000-555d-d2b7-180e-b5754c0e7e60	2394	Kotlje
00050000-555d-d2b7-86a9-554a7884718e	6240	Kozina
00050000-555d-d2b7-101f-eb7eb40097be	3260	Kozje
00050000-555d-d2b7-40a4-1edff3e16c3d	4000	Kranj 
00050000-555d-d2b7-eab2-c850fcf0edf7	4001	Kranj - poštni predali
00050000-555d-d2b7-0392-5eb9e01e9ad9	4280	Kranjska Gora
00050000-555d-d2b7-a055-a8cc9111b499	1281	Kresnice
00050000-555d-d2b7-9716-f8b5041e341c	4294	Križe
00050000-555d-d2b7-2253-956b90f5eb38	9206	Križevci
00050000-555d-d2b7-0348-6064f9d9bff3	9242	Križevci pri Ljutomeru
00050000-555d-d2b7-e443-dce5fa8c0a64	1301	Krka
00050000-555d-d2b7-e0d4-ef43e8fbc612	8296	Krmelj
00050000-555d-d2b7-1e74-0077347ad093	4245	Kropa
00050000-555d-d2b7-830d-c66d277cb5f7	8262	Krška vas
00050000-555d-d2b7-d742-98482d8da858	8270	Krško
00050000-555d-d2b7-e8c9-cb73e590a5b5	9263	Kuzma
00050000-555d-d2b7-1442-d2dbc15e3c7e	2318	Laporje
00050000-555d-d2b7-c693-3ddf51e765f0	3270	Laško
00050000-555d-d2b7-b10c-0b09edb2ce1d	1219	Laze v Tuhinju
00050000-555d-d2b7-492e-6e0f3cc391df	2230	Lenart v Slovenskih goricah
00050000-555d-d2b7-9dc2-1bc7d2324bc2	9220	Lendava/Lendva
00050000-555d-d2b7-d0a6-e5f1781db9da	4248	Lesce
00050000-555d-d2b7-7b23-ea9ac161c3b0	3261	Lesično
00050000-555d-d2b7-ebfd-02c2d64d91ca	8273	Leskovec pri Krškem
00050000-555d-d2b7-32a2-93ecb4c95b12	2372	Libeliče
00050000-555d-d2b7-88d4-d9c4830d8144	2341	Limbuš
00050000-555d-d2b7-2f25-c375c28a08f7	1270	Litija
00050000-555d-d2b7-8a2f-ef5edacdcc94	3202	Ljubečna
00050000-555d-d2b7-9458-633530c57574	1000	Ljubljana 
00050000-555d-d2b7-3855-38e250d6609a	1001	Ljubljana - poštni predali
00050000-555d-d2b7-1045-1958cbe681a4	1231	Ljubljana - Črnuče
00050000-555d-d2b7-3524-e7760916a54e	1261	Ljubljana - Dobrunje
00050000-555d-d2b7-8b77-ef54f99d8042	1260	Ljubljana - Polje
00050000-555d-d2b7-2663-c561771b7260	1210	Ljubljana - Šentvid
00050000-555d-d2b7-8cec-24efa25a582b	1211	Ljubljana - Šmartno
00050000-555d-d2b7-0988-70e84fd26d7d	3333	Ljubno ob Savinji
00050000-555d-d2b7-d7de-b9b51650ed2a	9240	Ljutomer
00050000-555d-d2b7-74fe-3c607086e28c	3215	Loče
00050000-555d-d2b7-509d-4245dc63382c	5231	Log pod Mangartom
00050000-555d-d2b7-bfe0-90529a0ede50	1358	Log pri Brezovici
00050000-555d-d2b7-1933-225a45ead8e2	1370	Logatec
00050000-555d-d2b7-2733-331e24c5a2f7	1371	Logatec
00050000-555d-d2b7-6f8a-26b762d21d54	1434	Loka pri Zidanem Mostu
00050000-555d-d2b7-16c8-0838a28621bc	3223	Loka pri Žusmu
00050000-555d-d2b7-17f3-0321b9a75a2f	6219	Lokev
00050000-555d-d2b7-f4fa-4edfe0a0db8a	1318	Loški Potok
00050000-555d-d2b7-a259-eed4203290d5	2324	Lovrenc na Dravskem polju
00050000-555d-d2b7-6feb-d9a8ef2b810a	2344	Lovrenc na Pohorju
00050000-555d-d2b7-7286-cd6f417dc78b	3334	Luče
00050000-555d-d2b7-319a-43fd7baf22c5	1225	Lukovica
00050000-555d-d2b7-8d60-804ff7ebf87c	9202	Mačkovci
00050000-555d-d2b7-4b16-381827744582	2322	Majšperk
00050000-555d-d2b7-3d62-4d49c483999b	2321	Makole
00050000-555d-d2b7-9048-88c9c193f471	9243	Mala Nedelja
00050000-555d-d2b7-db0f-01eeee7cd6ba	2229	Malečnik
00050000-555d-d2b7-ed50-bb76634be136	6273	Marezige
00050000-555d-d2b7-991f-7cc4f4d6ef8e	2000	Maribor 
00050000-555d-d2b7-9125-891c1310e5d5	2001	Maribor - poštni predali
00050000-555d-d2b7-1842-c287a2747369	2206	Marjeta na Dravskem polju
00050000-555d-d2b7-7687-c145ed236524	2281	Markovci
00050000-555d-d2b7-d8df-36eec2556af6	9221	Martjanci
00050000-555d-d2b7-6b55-1798cfb1e4fa	6242	Materija
00050000-555d-d2b7-210f-5aa8ee49852b	4211	Mavčiče
00050000-555d-d2b7-16b3-ca56b1f1b6e0	1215	Medvode
00050000-555d-d2b7-14b3-eb186e847311	1234	Mengeš
00050000-555d-d2b7-7022-b6037ac51a52	8330	Metlika
00050000-555d-d2b7-5588-b132a814b5bc	2392	Mežica
00050000-555d-d2b7-304b-fa50e950a118	2204	Miklavž na Dravskem polju
00050000-555d-d2b7-ae25-264477965a4c	2275	Miklavž pri Ormožu
00050000-555d-d2b7-77f4-fe9283e07458	5291	Miren
00050000-555d-d2b7-5ee6-0f335c583b2e	8233	Mirna
00050000-555d-d2b7-4830-900ae588a0d3	8216	Mirna Peč
00050000-555d-d2b7-e989-4fa46b51342f	2382	Mislinja
00050000-555d-d2b7-c431-55ec70fd8aed	4281	Mojstrana
00050000-555d-d2b7-be4d-277173ee910d	8230	Mokronog
00050000-555d-d2b7-51d0-b7b4f61016aa	1251	Moravče
00050000-555d-d2b7-86c1-bf14c7839a9f	9226	Moravske Toplice
00050000-555d-d2b7-633d-b41e2c7941ba	5216	Most na Soči
00050000-555d-d2b7-e587-cfe4879228c8	1221	Motnik
00050000-555d-d2b7-831e-652896574c47	3330	Mozirje
00050000-555d-d2b7-c36d-295d5535ccf4	9000	Murska Sobota 
00050000-555d-d2b7-ed97-acd0b5ea915d	9001	Murska Sobota - poštni predali
00050000-555d-d2b7-fc58-ab5f9cb91110	2366	Muta
00050000-555d-d2b7-7ce9-83052db5c24f	4202	Naklo
00050000-555d-d2b7-b8ad-a04ccecbdf8b	3331	Nazarje
00050000-555d-d2b7-049f-52ee7d9d086f	1357	Notranje Gorice
00050000-555d-d2b7-6ec0-6c2bbfe3fa17	3203	Nova Cerkev
00050000-555d-d2b7-4e2c-4fc0324fdc00	5000	Nova Gorica 
00050000-555d-d2b7-8970-c8b101afd6ed	5001	Nova Gorica - poštni predali
00050000-555d-d2b7-be49-505b99c9c1f6	1385	Nova vas
00050000-555d-d2b7-9f73-4da4375584fa	8000	Novo mesto
00050000-555d-d2b7-bc3c-e8d4dbaf794f	8001	Novo mesto - poštni predali
00050000-555d-d2b7-2f2d-52fc3804e978	6243	Obrov
00050000-555d-d2b7-ce18-b96e1562767d	9233	Odranci
00050000-555d-d2b7-2ad2-6c4fa6e22346	2317	Oplotnica
00050000-555d-d2b7-8b96-6e33f26cd2a6	2312	Orehova vas
00050000-555d-d2b7-1a0c-3d459b8cbe2c	2270	Ormož
00050000-555d-d2b7-0ae4-1c72d8311713	1316	Ortnek
00050000-555d-d2b7-8a82-95c9adc60401	1337	Osilnica
00050000-555d-d2b7-b422-986b8a8323c4	8222	Otočec
00050000-555d-d2b7-3ab3-5a18abcc9d3c	2361	Ožbalt
00050000-555d-d2b7-37b8-f62f9d13fb49	2231	Pernica
00050000-555d-d2b7-2e42-ebc526ae2430	2211	Pesnica pri Mariboru
00050000-555d-d2b7-932b-11d3e287ca4f	9203	Petrovci
00050000-555d-d2b7-5d6c-747d5d499b17	3301	Petrovče
00050000-555d-d2b7-1040-eeec20c56724	6330	Piran/Pirano
00050000-555d-d2b7-e3eb-5e3b71928ade	8255	Pišece
00050000-555d-d2b7-7654-3c42bab266ca	6257	Pivka
00050000-555d-d2b7-0318-6986314730f5	6232	Planina
00050000-555d-d2b7-b06c-06600a72c4c2	3225	Planina pri Sevnici
00050000-555d-d2b7-2a91-2eab6e6930d5	6276	Pobegi
00050000-555d-d2b7-7ad8-02d5ab5d6c9d	8312	Podbočje
00050000-555d-d2b7-786b-087a9b8b7d9c	5243	Podbrdo
00050000-555d-d2b7-9902-e8ade956c915	3254	Podčetrtek
00050000-555d-d2b7-d62c-c8440a208f74	2273	Podgorci
00050000-555d-d2b7-dafc-dd6ffba82c53	6216	Podgorje
00050000-555d-d2b7-0477-97100f2c3c6d	2381	Podgorje pri Slovenj Gradcu
00050000-555d-d2b7-77a5-ecedeb425dd6	6244	Podgrad
00050000-555d-d2b7-1c17-134d19f2412b	1414	Podkum
00050000-555d-d2b7-02c1-0d7c17fdee70	2286	Podlehnik
00050000-555d-d2b7-c982-68bb8c6e27b4	5272	Podnanos
00050000-555d-d2b7-cb7e-4be37adb11a4	4244	Podnart
00050000-555d-d2b7-dc4c-c623d20dd9e9	3241	Podplat
00050000-555d-d2b7-41f9-35794df8974b	3257	Podsreda
00050000-555d-d2b7-3965-cc2b46a216e8	2363	Podvelka
00050000-555d-d2b7-eb38-fc5c98527f4b	2208	Pohorje
00050000-555d-d2b7-c249-6076f69e4825	2257	Polenšak
00050000-555d-d2b7-1fbd-98174e18062c	1355	Polhov Gradec
00050000-555d-d2b7-2fbc-ec4ab48aa3af	4223	Poljane nad Škofjo Loko
00050000-555d-d2b7-4ac0-22ba3b4f1948	2319	Poljčane
00050000-555d-d2b7-9dcc-fed8424dc028	1272	Polšnik
00050000-555d-d2b7-6f75-79bdeb67287b	3313	Polzela
00050000-555d-d2b7-fd59-a16d603e6962	3232	Ponikva
00050000-555d-d2b7-40b9-bf36acff9564	6320	Portorož/Portorose
00050000-555d-d2b7-e7e4-7b3388834be5	6230	Postojna
00050000-555d-d2b7-2ab7-59dec5b1360f	2331	Pragersko
00050000-555d-d2b7-5b9f-495281df1401	3312	Prebold
00050000-555d-d2b7-eb2f-09b4c84f9cef	4205	Preddvor
00050000-555d-d2b7-e1f8-86d93161a758	6255	Prem
00050000-555d-d2b7-2e78-ca6ce8374e03	1352	Preserje
00050000-555d-d2b7-9f8e-ee70d37b69f6	6258	Prestranek
00050000-555d-d2b7-86cc-8ffb591ba7f8	2391	Prevalje
00050000-555d-d2b7-fafe-3f71aa9d84d0	3262	Prevorje
00050000-555d-d2b7-3331-8fe426487ae0	1276	Primskovo 
00050000-555d-d2b7-9c4b-8bb5b9944020	3253	Pristava pri Mestinju
00050000-555d-d2b7-2e6d-24a159afcbc1	9207	Prosenjakovci/Partosfalva
00050000-555d-d2b7-30c7-89033fd8786b	5297	Prvačina
00050000-555d-d2b7-4874-8c19a78f91bd	2250	Ptuj
00050000-555d-d2b7-c2b4-f4d5917ec190	2323	Ptujska Gora
00050000-555d-d2b7-ff71-f8d7519f2db0	9201	Puconci
00050000-555d-d2b7-07d3-96c4413c2d65	2327	Rače
00050000-555d-d2b7-3bb1-cc6add9edd34	1433	Radeče
00050000-555d-d2b7-269b-bf6f30570680	9252	Radenci
00050000-555d-d2b7-c45c-f6de022acbff	2360	Radlje ob Dravi
00050000-555d-d2b7-a37e-2d7e09845165	1235	Radomlje
00050000-555d-d2b7-8819-4bf3f1177ec8	4240	Radovljica
00050000-555d-d2b7-5998-10dcc7b1aa90	8274	Raka
00050000-555d-d2b7-aa27-8c30b3649c67	1381	Rakek
00050000-555d-d2b7-c4eb-ec96c9170415	4283	Rateče - Planica
00050000-555d-d2b7-09b8-94991c88426a	2390	Ravne na Koroškem
00050000-555d-d2b7-6140-d811a6f3d045	9246	Razkrižje
00050000-555d-d2b7-adff-ff4c4d56b2ab	3332	Rečica ob Savinji
00050000-555d-d2b7-7498-81c91e12f79d	5292	Renče
00050000-555d-d2b7-eedc-067fd2b3971d	1310	Ribnica
00050000-555d-d2b7-073a-866ae55ae2fc	2364	Ribnica na Pohorju
00050000-555d-d2b7-18ff-eb1c74872873	3272	Rimske Toplice
00050000-555d-d2b7-6d11-b1e86b1e4cf0	1314	Rob
00050000-555d-d2b7-9ef8-d36e6b045d94	5215	Ročinj
00050000-555d-d2b7-2180-991d36846dc3	3250	Rogaška Slatina
00050000-555d-d2b7-a52b-066f810f343d	9262	Rogašovci
00050000-555d-d2b7-8618-816c6f33f6dc	3252	Rogatec
00050000-555d-d2b7-7684-9907aa4c57d7	1373	Rovte
00050000-555d-d2b7-64c3-3ccfeb8b34e1	2342	Ruše
00050000-555d-d2b7-cef8-4461e5a67aaf	1282	Sava
00050000-555d-d2b7-45a3-5b68be221719	6333	Sečovlje/Sicciole
00050000-555d-d2b7-821d-707efda34816	4227	Selca
00050000-555d-d2b7-2575-a2898aa64487	2352	Selnica ob Dravi
00050000-555d-d2b7-4bf7-d8dd84b4fe33	8333	Semič
00050000-555d-d2b7-dd2f-6abb1680a137	8281	Senovo
00050000-555d-d2b7-d1e0-f90f930bcaff	6224	Senožeče
00050000-555d-d2b7-9514-818e3e051165	8290	Sevnica
00050000-555d-d2b7-4e24-f865014df5e3	6210	Sežana
00050000-555d-d2b7-15c8-7243b924b4ec	2214	Sladki Vrh
00050000-555d-d2b7-ea3e-b8aada245188	5283	Slap ob Idrijci
00050000-555d-d2b7-56d6-6a928cc1551b	2380	Slovenj Gradec
00050000-555d-d2b7-bc37-e362c2017617	2310	Slovenska Bistrica
00050000-555d-d2b7-f129-4bc2346b0eec	3210	Slovenske Konjice
00050000-555d-d2b7-685b-783d74291b98	1216	Smlednik
00050000-555d-d2b7-4a96-8a45b2f13616	5232	Soča
00050000-555d-d2b7-10a6-ad8322f6f29a	1317	Sodražica
00050000-555d-d2b7-f15b-650c1d0c1de8	3335	Solčava
00050000-555d-d2b7-dc98-86633d4ac202	5250	Solkan
00050000-555d-d2b7-024a-b6b2aadd524c	4229	Sorica
00050000-555d-d2b7-8531-562bcb35a838	4225	Sovodenj
00050000-555d-d2b7-bbd5-fa6e359a1fc9	5281	Spodnja Idrija
00050000-555d-d2b7-0c8e-c55e08b0c9d3	2241	Spodnji Duplek
00050000-555d-d2b7-a095-8385a78dbe8e	9245	Spodnji Ivanjci
00050000-555d-d2b7-b63d-4543ec65d7c9	2277	Središče ob Dravi
00050000-555d-d2b7-bb23-7e0ec62b0636	4267	Srednja vas v Bohinju
00050000-555d-d2b7-c399-0e84ec802f57	8256	Sromlje 
00050000-555d-d2b7-a2ec-0d96cdd48385	5224	Srpenica
00050000-555d-d2b7-196f-bc9047d160e6	1242	Stahovica
00050000-555d-d2b7-1927-05d65c093a03	1332	Stara Cerkev
00050000-555d-d2b7-4637-cf6604ce7369	8342	Stari trg ob Kolpi
00050000-555d-d2b7-1b87-79c5e7fab5b2	1386	Stari trg pri Ložu
00050000-555d-d2b7-62a6-49e376289c3d	2205	Starše
00050000-555d-d2b7-947d-da097d389218	2289	Stoperce
00050000-555d-d2b7-d26b-106e86dfebb5	8322	Stopiče
00050000-555d-d2b7-b323-497079f791dd	3206	Stranice
00050000-555d-d2b7-95ec-db091f46a343	8351	Straža
00050000-555d-d2b7-e8f9-76c61fcc5a19	1313	Struge
00050000-555d-d2b7-0253-3378532c9509	8293	Studenec
00050000-555d-d2b7-7e4c-22c3bb99e7b0	8331	Suhor
00050000-555d-d2b7-ed8b-1eb6bdf10678	2233	Sv. Ana v Slovenskih goricah
00050000-555d-d2b7-1868-3ff650df4821	2235	Sv. Trojica v Slovenskih goricah
00050000-555d-d2b7-0765-c6cf98485356	2353	Sveti Duh na Ostrem Vrhu
00050000-555d-d2b7-97f2-178977859701	9244	Sveti Jurij ob Ščavnici
00050000-555d-d2b7-c09a-d6730c9d438c	3264	Sveti Štefan
00050000-555d-d2b7-2467-a263dd1e95b0	2258	Sveti Tomaž
00050000-555d-d2b7-5fa7-5e5cb1e67906	9204	Šalovci
00050000-555d-d2b7-9800-9d0d6366f742	5261	Šempas
00050000-555d-d2b7-eb99-0bf8efd8ce87	5290	Šempeter pri Gorici
00050000-555d-d2b7-b124-06729aacd868	3311	Šempeter v Savinjski dolini
00050000-555d-d2b7-e06b-a80b4166dc6f	4208	Šenčur
00050000-555d-d2b7-d3f9-469e4333abf2	2212	Šentilj v Slovenskih goricah
00050000-555d-d2b7-5753-157ee357ec1e	8297	Šentjanž
00050000-555d-d2b7-a1a5-b921267ce647	2373	Šentjanž pri Dravogradu
00050000-555d-d2b7-6e87-d6f683dbb818	8310	Šentjernej
00050000-555d-d2b7-bce2-411d40c8e666	3230	Šentjur
00050000-555d-d2b7-ad63-7b0b8674b812	3271	Šentrupert
00050000-555d-d2b7-1585-502588a6f9aa	8232	Šentrupert
00050000-555d-d2b7-8ab3-b79630af6042	1296	Šentvid pri Stični
00050000-555d-d2b7-f93f-90cda4b4b467	8275	Škocjan
00050000-555d-d2b7-dec0-62b6d9dc51b8	6281	Škofije
00050000-555d-d2b7-d011-56685cee8d64	4220	Škofja Loka
00050000-555d-d2b7-5d33-1193247d3fd7	3211	Škofja vas
00050000-555d-d2b7-8cf8-2d1e20eaa9de	1291	Škofljica
00050000-555d-d2b7-04b5-749d2ec12378	6274	Šmarje
00050000-555d-d2b8-85aa-2cae05f3a271	1293	Šmarje - Sap
00050000-555d-d2b8-8f11-815c170c7389	3240	Šmarje pri Jelšah
00050000-555d-d2b8-b408-97305d24df43	8220	Šmarješke Toplice
00050000-555d-d2b8-9831-e9b8050154eb	2315	Šmartno na Pohorju
00050000-555d-d2b8-6346-d3599f578a2d	3341	Šmartno ob Dreti
00050000-555d-d2b8-ac59-1fe2d4446030	3327	Šmartno ob Paki
00050000-555d-d2b8-a5c9-e281de3ca86b	1275	Šmartno pri Litiji
00050000-555d-d2b8-2e7a-704e3f670437	2383	Šmartno pri Slovenj Gradcu
00050000-555d-d2b8-cb64-80bb163e3a27	3201	Šmartno v Rožni dolini
00050000-555d-d2b8-c44d-777a4fa375cc	3325	Šoštanj
00050000-555d-d2b8-5ba4-f4668b156873	6222	Štanjel
00050000-555d-d2b8-4aaa-ae7d97dff5ce	3220	Štore
00050000-555d-d2b8-03fc-1c410ab58188	3304	Tabor
00050000-555d-d2b8-39d5-90cc23e0c424	3221	Teharje
00050000-555d-d2b8-e07a-be5e4f1a6a82	9251	Tišina
00050000-555d-d2b8-68b2-c8c073a952e5	5220	Tolmin
00050000-555d-d2b8-5f08-cdf1106b3876	3326	Topolšica
00050000-555d-d2b8-4a2d-0da664fe1fc0	2371	Trbonje
00050000-555d-d2b8-0e39-859a73255b34	1420	Trbovlje
00050000-555d-d2b8-92eb-7c47dffccf94	8231	Trebelno 
00050000-555d-d2b8-8d13-7b58adb3bd60	8210	Trebnje
00050000-555d-d2b8-881a-42685b1211c9	5252	Trnovo pri Gorici
00050000-555d-d2b8-f89f-0bac6ce7cdfc	2254	Trnovska vas
00050000-555d-d2b8-aaf3-0042725c564c	1222	Trojane
00050000-555d-d2b8-690f-085392370a52	1236	Trzin
00050000-555d-d2b8-126a-3c7197571999	4290	Tržič
00050000-555d-d2b8-4bd5-9be1b76c1ed4	8295	Tržišče
00050000-555d-d2b8-a8bb-60da55094304	1311	Turjak
00050000-555d-d2b8-6602-bf2736aeebf5	9224	Turnišče
00050000-555d-d2b8-2974-ac71f81f8e65	8323	Uršna sela
00050000-555d-d2b8-f747-2a616a84deb8	1252	Vače
00050000-555d-d2b8-0d08-daa99c576c45	3320	Velenje 
00050000-555d-d2b8-9ce5-af60e690efc4	3322	Velenje - poštni predali
00050000-555d-d2b8-69ca-85a2f5edd9b5	8212	Velika Loka
00050000-555d-d2b8-ca5e-fb9b7bb39199	2274	Velika Nedelja
00050000-555d-d2b8-8422-b3fdbe0f9322	9225	Velika Polana
00050000-555d-d2b8-6b8e-1b5268585941	1315	Velike Lašče
00050000-555d-d2b8-d30d-a76d33932a00	8213	Veliki Gaber
00050000-555d-d2b8-2a09-5e9e437618ed	9241	Veržej
00050000-555d-d2b8-35d5-4a893c824952	1312	Videm - Dobrepolje
00050000-555d-d2b8-1fe0-87a1b2d59f50	2284	Videm pri Ptuju
00050000-555d-d2b8-7491-d0a410402be0	8344	Vinica
00050000-555d-d2b8-7615-2945ea256d65	5271	Vipava
00050000-555d-d2b8-ace2-47f648a4419c	4212	Visoko
00050000-555d-d2b8-62c1-1d5206cbf598	1294	Višnja Gora
00050000-555d-d2b8-9123-c15b55187164	3205	Vitanje
00050000-555d-d2b8-8859-016eb2210a7f	2255	Vitomarci
00050000-555d-d2b8-d184-4603025e88fe	1217	Vodice
00050000-555d-d2b8-a604-09616a156533	3212	Vojnik\t
00050000-555d-d2b8-52df-0b93a25e7295	5293	Volčja Draga
00050000-555d-d2b8-f6aa-60c1738bf3c8	2232	Voličina
00050000-555d-d2b8-f0f3-138b918d9009	3305	Vransko
00050000-555d-d2b8-afd5-f122128dcfb1	6217	Vremski Britof
00050000-555d-d2b8-9de2-1f3f0450d2f1	1360	Vrhnika
00050000-555d-d2b8-dc1e-f2e79dc4668a	2365	Vuhred
00050000-555d-d2b8-e948-428fec7b4f6d	2367	Vuzenica
00050000-555d-d2b8-9a70-63bfe8eadee1	8292	Zabukovje 
00050000-555d-d2b8-96f9-cee387132d4d	1410	Zagorje ob Savi
00050000-555d-d2b8-1ba4-e7f7c34e1a6f	1303	Zagradec
00050000-555d-d2b8-549e-5f91341bf2ee	2283	Zavrč
00050000-555d-d2b8-503e-580be0125a2f	8272	Zdole 
00050000-555d-d2b8-4388-f8502be259cf	4201	Zgornja Besnica
00050000-555d-d2b8-c869-662025bcb84a	2242	Zgornja Korena
00050000-555d-d2b8-62b2-3efe2c24a889	2201	Zgornja Kungota
00050000-555d-d2b8-c454-fdef6c8667ef	2316	Zgornja Ložnica
00050000-555d-d2b8-65f5-e4eaf0b1b786	2314	Zgornja Polskava
00050000-555d-d2b8-32ab-5cfeeeed4ac6	2213	Zgornja Velka
00050000-555d-d2b8-17b5-6bc95dd958a6	4247	Zgornje Gorje
00050000-555d-d2b8-30f7-ea7d916575dd	4206	Zgornje Jezersko
00050000-555d-d2b8-d033-87296504ba9d	2285	Zgornji Leskovec
00050000-555d-d2b8-7a13-50884b586f6d	1432	Zidani Most
00050000-555d-d2b8-6b59-cc6b4f209b00	3214	Zreče
00050000-555d-d2b8-89fe-9412b06e1e5e	4209	Žabnica
00050000-555d-d2b8-d536-a5fa163a9931	3310	Žalec
00050000-555d-d2b8-29de-f2e2c5d52985	4228	Železniki
00050000-555d-d2b8-c326-20bed4ab9dc8	2287	Žetale
00050000-555d-d2b8-03bd-06c79a069b77	4226	Žiri
00050000-555d-d2b8-b0c0-24d1f761811b	4274	Žirovnica
00050000-555d-d2b8-a0a8-8cd37c8bd75d	8360	Žužemberk
\.


--
-- TOC entry 2655 (class 0 OID 4486333)
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
-- TOC entry 2638 (class 0 OID 4486161)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4486226)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4486345)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4486450)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4486495)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4486374)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4486318)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4486308)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4486485)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4486440)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 4486029)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555d-d2b8-4740-343b4be5e1ec	00010000-555d-d2b8-daeb-133d3dc737ef	2015-05-21 14:42:33	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROJdLkDAvMCZGkoP7Du7Hgr0zljeM7cc6";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2662 (class 0 OID 4486383)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4486067)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555d-d2b8-62c8-1860acd0c04d	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555d-d2b8-bb4f-c786cbbcff75	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555d-d2b8-9d79-878067b2a9af	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555d-d2b8-0ee4-369d6cb33e4c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555d-d2b8-aef7-1e4b5372c841	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555d-d2b8-ab90-e5895a098d73	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2628 (class 0 OID 4486051)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555d-d2b8-4740-343b4be5e1ec	00020000-555d-d2b8-0ee4-369d6cb33e4c
00010000-555d-d2b8-daeb-133d3dc737ef	00020000-555d-d2b8-0ee4-369d6cb33e4c
\.


--
-- TOC entry 2664 (class 0 OID 4486397)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4486339)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4486289)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 4486126)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4486295)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4486473)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4486195)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 4486038)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555d-d2b8-daeb-133d3dc737ef	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROrSPWrj36c8qYuA3h62IV8XCTiwtx2Dm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555d-d2b8-4740-343b4be5e1ec	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2676 (class 0 OID 4486527)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4486241)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4486366)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4486432)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4486273)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4486517)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 4486422)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4486092)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4486567)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4486560)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4486472)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4486263)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4486288)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4486221)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4486418)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4486239)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4486282)
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
-- TOC entry 2360 (class 2606 OID 4486331)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4486358)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4486193)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4486101)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4486158)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4486124)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4486081)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4486066)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4486364)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4486396)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4486512)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4486151)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4486181)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4486337)
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
-- TOC entry 2294 (class 2606 OID 4486171)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4486230)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4486349)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4486456)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4486500)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4486381)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4486322)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4486313)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4486494)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4486447)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4486037)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4486387)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4486055)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4486075)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4486405)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4486344)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4486294)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4486131)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4486304)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4486484)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4486206)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4486050)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4486542)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4486248)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4486372)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4486438)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4486277)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4486526)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4486431)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4486270)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4486153)
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
-- TOC entry 2373 (class 1259 OID 4486365)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4486351)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4486350)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4486249)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4486421)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4486419)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4486420)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4486514)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4486515)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4486516)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4486545)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4486544)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2429 (class 1259 OID 4486543)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4486208)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4486207)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4486160)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4486159)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4486388)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4486283)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4486082)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4486083)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4486408)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4486407)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4486406)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4486231)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4486233)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4486232)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4486317)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4486315)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4486314)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4486316)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4486056)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4486057)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4486373)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4486338)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4486448)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4486449)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4486173)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4486172)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4486174)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4486457)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4486458)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2438 (class 1259 OID 4486570)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 4486569)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2440 (class 1259 OID 4486572)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2441 (class 1259 OID 4486568)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2442 (class 1259 OID 4486571)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4486439)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4486326)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4486325)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4486323)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4486324)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2434 (class 1259 OID 4486562)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 4486561)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4486240)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4486103)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4486102)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4486132)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4486133)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4486307)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4486306)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4486305)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4486272)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4486268)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4486265)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4486266)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4486264)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4486269)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4486267)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4486152)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4486222)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4486224)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4486223)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4486225)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4486332)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4486513)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4486125)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4486194)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4486382)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4486182)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4486501)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4486076)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4486271)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2467 (class 2606 OID 4486703)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 4486688)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2469 (class 2606 OID 4486693)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2465 (class 2606 OID 4486713)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2471 (class 2606 OID 4486683)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2466 (class 2606 OID 4486708)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2468 (class 2606 OID 4486698)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2452 (class 2606 OID 4486618)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2488 (class 2606 OID 4486798)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2486 (class 2606 OID 4486793)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2487 (class 2606 OID 4486788)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2464 (class 2606 OID 4486678)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2494 (class 2606 OID 4486838)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2496 (class 2606 OID 4486828)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4486833)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2484 (class 2606 OID 4486778)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2505 (class 2606 OID 4486873)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2504 (class 2606 OID 4486878)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2503 (class 2606 OID 4486883)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2506 (class 2606 OID 4486898)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2507 (class 2606 OID 4486893)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2508 (class 2606 OID 4486888)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2458 (class 2606 OID 4486653)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 4486648)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4486628)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4486623)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2449 (class 2606 OID 4486603)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2490 (class 2606 OID 4486808)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2472 (class 2606 OID 4486718)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2446 (class 2606 OID 4486583)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2445 (class 2606 OID 4486588)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2491 (class 2606 OID 4486823)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2492 (class 2606 OID 4486818)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2493 (class 2606 OID 4486813)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2462 (class 2606 OID 4486658)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4486668)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2461 (class 2606 OID 4486663)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2476 (class 2606 OID 4486753)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2478 (class 2606 OID 4486743)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2479 (class 2606 OID 4486738)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2477 (class 2606 OID 4486748)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2444 (class 2606 OID 4486573)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 4486578)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2489 (class 2606 OID 4486803)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2485 (class 2606 OID 4486783)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2499 (class 2606 OID 4486848)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2498 (class 2606 OID 4486853)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 4486638)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 4486633)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 4486643)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2501 (class 2606 OID 4486858)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 4486863)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2513 (class 2606 OID 4486923)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4486918)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2511 (class 2606 OID 4486933)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 4486913)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2512 (class 2606 OID 4486928)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2497 (class 2606 OID 4486843)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 4486773)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2481 (class 2606 OID 4486768)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2483 (class 2606 OID 4486758)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2482 (class 2606 OID 4486763)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2509 (class 2606 OID 4486908)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 4486903)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2463 (class 2606 OID 4486673)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4486868)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2447 (class 2606 OID 4486598)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 4486593)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2451 (class 2606 OID 4486608)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2450 (class 2606 OID 4486613)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2473 (class 2606 OID 4486733)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2474 (class 2606 OID 4486728)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2475 (class 2606 OID 4486723)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-21 14:42:33 CEST

--
-- PostgreSQL database dump complete
--

