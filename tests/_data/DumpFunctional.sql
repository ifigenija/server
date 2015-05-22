--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-22 12:29:01 CEST

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
-- TOC entry 179 (class 1259 OID 4665386)
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
-- TOC entry 225 (class 1259 OID 4665865)
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
-- TOC entry 224 (class 1259 OID 4665848)
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
-- TOC entry 217 (class 1259 OID 4665762)
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
-- TOC entry 193 (class 1259 OID 4665552)
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
-- TOC entry 196 (class 1259 OID 4665586)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4665511)
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
-- TOC entry 212 (class 1259 OID 4665711)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    tip_vloge_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean,
    sort integer
);


--
-- TOC entry 191 (class 1259 OID 4665536)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4665580)
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
-- TOC entry 201 (class 1259 OID 4665629)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4665654)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4665485)
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
-- TOC entry 180 (class 1259 OID 4665395)
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
-- TOC entry 181 (class 1259 OID 4665406)
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
-- TOC entry 184 (class 1259 OID 4665456)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4665360)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4665379)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4665661)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4665691)
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
-- TOC entry 221 (class 1259 OID 4665804)
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
-- TOC entry 183 (class 1259 OID 4665436)
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
-- TOC entry 186 (class 1259 OID 4665477)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4665635)
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
-- TOC entry 185 (class 1259 OID 4665463)
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
-- TOC entry 190 (class 1259 OID 4665528)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4665647)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4665753)
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
-- TOC entry 220 (class 1259 OID 4665797)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4665676)
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
-- TOC entry 200 (class 1259 OID 4665620)
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
-- TOC entry 199 (class 1259 OID 4665610)
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
-- TOC entry 219 (class 1259 OID 4665787)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4665743)
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
-- TOC entry 173 (class 1259 OID 4665331)
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
-- TOC entry 172 (class 1259 OID 4665329)
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
-- TOC entry 209 (class 1259 OID 4665685)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4665369)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4665353)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4665699)
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
-- TOC entry 203 (class 1259 OID 4665641)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4665591)
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
-- TOC entry 182 (class 1259 OID 4665428)
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
-- TOC entry 198 (class 1259 OID 4665597)
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
-- TOC entry 218 (class 1259 OID 4665776)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    dovoliprekrivanje boolean,
    maxprekrivanj integer,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 4665497)
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
-- TOC entry 174 (class 1259 OID 4665340)
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
-- TOC entry 223 (class 1259 OID 4665829)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
    faza character varying(35) DEFAULT NULL::character varying,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    delovninaslov character varying(255) DEFAULT NULL::character varying,
    datumzacstudija date,
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
-- TOC entry 192 (class 1259 OID 4665543)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4665668)
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
-- TOC entry 214 (class 1259 OID 4665735)
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
-- TOC entry 194 (class 1259 OID 4665575)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4665819)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4665725)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4665334)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2632 (class 0 OID 4665386)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4665865)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4665848)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4665762)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4665552)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4665586)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4665511)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555f-04ec-9e8c-d15c7b25fd2d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555f-04ec-feaa-194e9ebf4209	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555f-04ec-603b-08fe3ead6214	AL	ALB	008	Albania 	Albanija	\N
00040000-555f-04ec-6650-f8e3329d40e0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555f-04ec-c944-7741952a45a3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555f-04ec-5b52-ff64d3f1d194	AD	AND	020	Andorra 	Andora	\N
00040000-555f-04ec-5e43-ab9295ad9f60	AO	AGO	024	Angola 	Angola	\N
00040000-555f-04ec-a155-a194cbcb3016	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555f-04ec-913c-6ad26a5e6fbb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555f-04ec-6377-a6cb42a63109	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555f-04ec-161d-e1ea6847bcab	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555f-04ec-89dc-bdcf6e5167cb	AM	ARM	051	Armenia 	Armenija	\N
00040000-555f-04ec-b960-e85a413b5c21	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555f-04ec-1018-0a84d519f02e	AU	AUS	036	Australia 	Avstralija	\N
00040000-555f-04ec-06c0-5b8f164e2476	AT	AUT	040	Austria 	Avstrija	\N
00040000-555f-04ec-d96e-2be163e59304	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555f-04ec-46cf-67b0e18c84bd	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555f-04ec-4ca4-2afb7f43b005	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555f-04ec-622e-791ab597278d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555f-04ec-a825-c3d22dbdf8ce	BB	BRB	052	Barbados 	Barbados	\N
00040000-555f-04ec-4d5d-d40fbf1bbb4e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555f-04ec-4d53-c2e7f3907395	BE	BEL	056	Belgium 	Belgija	\N
00040000-555f-04ec-1425-4f632e6c7ae8	BZ	BLZ	084	Belize 	Belize	\N
00040000-555f-04ec-18af-8d436af48716	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555f-04ec-8430-bda28572b349	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555f-04ec-4427-1df64abc9e4f	BT	BTN	064	Bhutan 	Butan	\N
00040000-555f-04ec-8369-5c6995bd2628	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555f-04ec-6845-e31425c8d929	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555f-04ec-ffa8-e849d227e7b0	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555f-04ec-7b93-8856f108515e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555f-04ec-095b-9da59d240e7e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555f-04ec-acbe-41108d2be256	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555f-04ec-0c4f-c1eee2da9eae	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555f-04ec-ff0a-e86e522eccf8	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555f-04ec-b731-c4a44551d3dd	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555f-04ec-5f7b-e3c42e20c3d5	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555f-04ec-8352-9940879fd9f8	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555f-04ec-6635-75a001faa1ec	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555f-04ec-43ca-d316c764b379	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555f-04ec-ed56-8d288b31a165	CA	CAN	124	Canada 	Kanada	\N
00040000-555f-04ec-5653-fc3a3e427925	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555f-04ec-6fa8-e24e4a441a3e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555f-04ec-5609-a44d9927bfc6	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555f-04ec-9506-c8b68ae58e5a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555f-04ec-af11-d0eb19ce716d	CL	CHL	152	Chile 	Čile	\N
00040000-555f-04ec-dacd-58d81dc9ae6a	CN	CHN	156	China 	Kitajska	\N
00040000-555f-04ec-1d4a-681206acbeb5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555f-04ec-6852-efc97fe3d3f4	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555f-04ec-f332-47bc6e922905	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555f-04ec-3752-8bd2364f9d0b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555f-04ec-fbe2-ad6f7a906841	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555f-04ec-dda6-435cf66387c0	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555f-04ec-4f73-3c056367017f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555f-04ec-9fd3-d6e7cf5f1660	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555f-04ec-b18c-4a701c93b281	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555f-04ec-afa4-c251287bd1d9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555f-04ec-0a2a-435b7e0e0be0	CU	CUB	192	Cuba 	Kuba	\N
00040000-555f-04ec-1dfe-4b879d7a8093	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555f-04ec-e70c-be8a4673cf46	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555f-04ec-8fd0-14207368b5a3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555f-04ec-0e47-aa37de894ef4	DK	DNK	208	Denmark 	Danska	\N
00040000-555f-04ec-49c3-2c5c285deef0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555f-04ec-83b2-fe74c0e19e75	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555f-04ec-c125-87a32e83cecc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555f-04ec-6a50-0f5f0aaa3ff4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555f-04ec-37f3-7b051003a5bf	EG	EGY	818	Egypt 	Egipt	\N
00040000-555f-04ec-dd6c-60d88ce506b9	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555f-04ec-b782-1b6b73125e42	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555f-04ec-68de-06a2f5139e01	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555f-04ec-e26a-53903960b1e7	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555f-04ec-a892-063c87b53d06	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555f-04ec-1656-e96b000a9326	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555f-04ec-a743-d87b10308f7d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555f-04ec-20a2-a6c7adf719cb	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555f-04ec-d983-fc5e5be5ea7b	FI	FIN	246	Finland 	Finska	\N
00040000-555f-04ec-9fb7-19ae6ff10ceb	FR	FRA	250	France 	Francija	\N
00040000-555f-04ec-b733-5f8fb43c3306	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555f-04ec-1a7e-1bf85d4c6735	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555f-04ec-98de-b555a20e1f82	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555f-04ec-4c8c-34562c4faf0b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555f-04ec-cf2d-bb77b8384de6	GA	GAB	266	Gabon 	Gabon	\N
00040000-555f-04ec-d09b-1a2580951ebb	GM	GMB	270	Gambia 	Gambija	\N
00040000-555f-04ec-918c-8c1431448eee	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555f-04ec-3b77-a4ff275b7384	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555f-04ec-b075-d1b40db7d7d6	GH	GHA	288	Ghana 	Gana	\N
00040000-555f-04ec-a1fe-a9366edc193d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555f-04ec-db5d-29b3d3ab5c07	GR	GRC	300	Greece 	Grčija	\N
00040000-555f-04ec-4ff5-f61c6915cd4e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555f-04ec-2201-d6743d2d1f47	GD	GRD	308	Grenada 	Grenada	\N
00040000-555f-04ec-3278-3152e17ef645	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555f-04ec-08c0-71396eb100f1	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555f-04ec-d56c-7607689f82a4	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555f-04ec-d943-6536e83b6186	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555f-04ec-256e-a90a530d9c23	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555f-04ec-a2f7-ec43d15a31c2	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555f-04ec-16fa-f4047bce5450	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555f-04ec-f60f-62a2602aebf6	HT	HTI	332	Haiti 	Haiti	\N
00040000-555f-04ec-e558-185c0a755821	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555f-04ec-5c92-2673fdfcc4a8	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555f-04ec-a3a5-12b21aac4c74	HN	HND	340	Honduras 	Honduras	\N
00040000-555f-04ec-6c22-c1e3da2cb8e5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555f-04ec-f2b5-0c882395d36d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555f-04ec-9d05-dfb5dc81ce45	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555f-04ec-3cdc-3b167deae28e	IN	IND	356	India 	Indija	\N
00040000-555f-04ec-fa60-157ef90a5f2e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555f-04ec-b785-58ec4d589609	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555f-04ec-d1e6-96c349f2a373	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555f-04ec-4b0f-53a5dad6aa42	IE	IRL	372	Ireland 	Irska	\N
00040000-555f-04ec-77e7-3c3c06e6abae	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555f-04ec-f4c8-3fe0bfece3b1	IL	ISR	376	Israel 	Izrael	\N
00040000-555f-04ec-387e-233added5bd1	IT	ITA	380	Italy 	Italija	\N
00040000-555f-04ec-2de0-83633488abfb	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555f-04ec-6619-46e6d094be01	JP	JPN	392	Japan 	Japonska	\N
00040000-555f-04ec-cddd-525c26171c6e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555f-04ec-18ad-0c086f8f0af2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555f-04ec-d09f-57f3858e35fb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555f-04ec-838d-0068cdf25867	KE	KEN	404	Kenya 	Kenija	\N
00040000-555f-04ec-8f71-d3fac7653f2c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555f-04ec-da3f-5139d6b23d9e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555f-04ec-151b-7103ede1d302	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555f-04ec-faa0-d2cda41c8c17	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555f-04ec-4b14-852618593291	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555f-04ec-1409-0a4f03d4efd8	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555f-04ec-c30f-75622236bbb7	LV	LVA	428	Latvia 	Latvija	\N
00040000-555f-04ec-e22f-13677556e9e9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555f-04ec-1063-d5d73e47e254	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555f-04ec-0719-ac0a72f29ded	LR	LBR	430	Liberia 	Liberija	\N
00040000-555f-04ec-ef6b-948658dd7598	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555f-04ec-13b7-42db8b98c42a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555f-04ec-eb97-4886137b6b2a	LT	LTU	440	Lithuania 	Litva	\N
00040000-555f-04ec-837d-34c1f5236124	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555f-04ec-adf2-ae5674009928	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555f-04ec-6f21-c7e3233cde66	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555f-04ec-7766-910122ed27ee	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555f-04ec-b40c-aeea70817882	MW	MWI	454	Malawi 	Malavi	\N
00040000-555f-04ec-95c3-4c09dfd6c27b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555f-04ec-d4c3-79025ad2b987	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555f-04ec-89c7-a5a97205dbf7	ML	MLI	466	Mali 	Mali	\N
00040000-555f-04ec-fe6c-bfd05b0b9b8d	MT	MLT	470	Malta 	Malta	\N
00040000-555f-04ec-911a-f8068741abe0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555f-04ec-dfe6-3c52589435cb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555f-04ec-9b30-371e3e1ec26e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555f-04ec-2398-d9649282db73	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555f-04ec-86b1-b802fb0eb08f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555f-04ec-bb14-ea70149d695f	MX	MEX	484	Mexico 	Mehika	\N
00040000-555f-04ec-97e6-b78f2ba8a164	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555f-04ec-8273-5e45b99b4103	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555f-04ec-ebe8-56de5caa28da	MC	MCO	492	Monaco 	Monako	\N
00040000-555f-04ec-a31e-bdd6b08e8c42	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555f-04ec-8a1c-98cb5adb3e4f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555f-04ec-7a5e-ad2f2124917b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555f-04ec-b0df-92e56885fb38	MA	MAR	504	Morocco 	Maroko	\N
00040000-555f-04ec-017c-eeb93fbc60d8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555f-04ec-e7f1-ce5f4bdb8ba7	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555f-04ec-61e4-4f9f8243da7c	NA	NAM	516	Namibia 	Namibija	\N
00040000-555f-04ec-381a-3cd96028b74e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555f-04ec-cede-6bcc21e5a900	NP	NPL	524	Nepal 	Nepal	\N
00040000-555f-04ec-c54d-a3a4d459a813	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555f-04ec-4e48-27b1afe5e4a6	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555f-04ec-6ba1-b22766946c58	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555f-04ec-ec89-759f40209eb1	NE	NER	562	Niger 	Niger 	\N
00040000-555f-04ec-2338-b35188be264d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555f-04ec-47b2-d9be65bdac99	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555f-04ec-570f-fe61a9560cca	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555f-04ec-32dd-8ae2288b6b95	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555f-04ec-77d2-5a897fc0d4b4	NO	NOR	578	Norway 	Norveška	\N
00040000-555f-04ec-f9cf-3e929c151728	OM	OMN	512	Oman 	Oman	\N
00040000-555f-04ec-2ac8-a2b9aabc5bbb	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555f-04ec-4f4e-eefd87afa404	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555f-04ec-e8e3-32c289a7f6f0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555f-04ec-eb7e-b21a1b32449f	PA	PAN	591	Panama 	Panama	\N
00040000-555f-04ec-3a8d-21728375a40a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555f-04ec-5ba2-7e7fb1cf402c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555f-04ec-a2c5-e611a415b2e6	PE	PER	604	Peru 	Peru	\N
00040000-555f-04ec-8007-c206ad7eb3ad	PH	PHL	608	Philippines 	Filipini	\N
00040000-555f-04ec-8515-5f182a3a6c20	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555f-04ec-8a0c-394bc7772bcc	PL	POL	616	Poland 	Poljska	\N
00040000-555f-04ec-6698-1bba84a61760	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555f-04ec-776d-280dce061827	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555f-04ec-fb17-b476e7dd9728	QA	QAT	634	Qatar 	Katar	\N
00040000-555f-04ec-298f-b1c035c8aa2a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555f-04ec-cd4d-d7582ec53b5e	RO	ROU	642	Romania 	Romunija	\N
00040000-555f-04ec-9991-f7b74a99e3df	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555f-04ec-88c3-bdb49c555ce5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555f-04ec-058e-f4ca07e33eee	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555f-04ec-59a9-ffd8b9e291f9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555f-04ec-8668-a814315a0322	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555f-04ec-8fe0-f50c1e6e567f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555f-04ec-cf39-b10de44c5861	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555f-04ec-a55e-454efc765180	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555f-04ec-fe74-41b6357dd7d5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555f-04ec-feab-2f1bb9ad738c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555f-04ec-4826-2444e6514dda	SM	SMR	674	San Marino 	San Marino	\N
00040000-555f-04ec-67ad-f153f08399d9	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555f-04ec-40ce-4461b3b19d2b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555f-04ec-aff4-4d191065cf50	SN	SEN	686	Senegal 	Senegal	\N
00040000-555f-04ec-d74c-e8e3c1e970ee	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555f-04ec-b834-5f9d2edc7926	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555f-04ec-086b-5335e9d9a8ff	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555f-04ec-f50e-dd8ac2295246	SG	SGP	702	Singapore 	Singapur	\N
00040000-555f-04ec-60a3-9ea19eb20ce9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555f-04ec-7419-1efa71d8aede	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555f-04ec-7ed5-5140eaf06877	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555f-04ec-957e-a898a1617558	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555f-04ec-d733-e774642cf92e	SO	SOM	706	Somalia 	Somalija	\N
00040000-555f-04ec-fb23-badc3c4197b0	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555f-04ec-9e93-29cd3d357b8c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555f-04ec-cdef-17392ee15a8a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555f-04ec-78e5-119c2f564b25	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555f-04ec-9f1e-6294b4dbcf22	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555f-04ec-0aae-0e9f2debd740	SD	SDN	729	Sudan 	Sudan	\N
00040000-555f-04ec-7f38-efaaad4e9240	SR	SUR	740	Suriname 	Surinam	\N
00040000-555f-04ec-4285-22cdbe9f1df9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555f-04ec-3b4d-8da9983c0ad8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555f-04ec-f6b0-08c769b313e7	SE	SWE	752	Sweden 	Švedska	\N
00040000-555f-04ec-cea4-b408b1ecf654	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555f-04ec-dbd1-46ae21ec0e33	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555f-04ec-8b46-40ea8c3b3843	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555f-04ec-fad8-408d8f19ab12	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555f-04ec-eeff-b2547d164e59	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555f-04ec-ba69-777eb39d6408	TH	THA	764	Thailand 	Tajska	\N
00040000-555f-04ec-0200-7864e48c596e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555f-04ec-6f98-78fbe2b960b3	TG	TGO	768	Togo 	Togo	\N
00040000-555f-04ec-901e-cdcede76f9ef	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555f-04ec-b5fd-c28053ed95c8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555f-04ec-b971-ff24afaef4b0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555f-04ec-e564-fdc27af0d64d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555f-04ec-ded0-a399efb73eaf	TR	TUR	792	Turkey 	Turčija	\N
00040000-555f-04ec-4a4b-754938854329	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555f-04ec-1b4d-6348046bab13	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555f-04ec-7a4d-387b1d102111	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555f-04ec-6d0a-b168adaa6180	UG	UGA	800	Uganda 	Uganda	\N
00040000-555f-04ec-a394-35e103569c98	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555f-04ec-ef21-288285dc20fd	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555f-04ec-b6de-79ac07232398	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555f-04ec-d3c2-2cc0d1f753a6	US	USA	840	United States 	Združene države Amerike	\N
00040000-555f-04ec-8697-4c39faaaaf09	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555f-04ec-7041-a737cba75d02	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555f-04ec-3d74-75c3772c643f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555f-04ec-e8f4-7bf525100434	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555f-04ec-876f-5fe1f57ce72a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555f-04ec-e41a-5f3636347c9a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555f-04ec-9a33-2c6312cd22cd	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555f-04ec-9388-c186e50ff873	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555f-04ec-458a-6fb81b0cf922	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555f-04ec-39c8-491e3a9ccbd8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555f-04ec-32c2-377771931b1d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555f-04ec-9c7b-3763ad698545	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555f-04ec-768f-1e7277cb29c0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2665 (class 0 OID 4665711)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4665536)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4665580)
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
-- TOC entry 2654 (class 0 OID 4665629)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4665654)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4665485)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555f-04ec-2b41-1eda9b8452d6	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555f-04ec-075d-7985dc7cd28a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555f-04ec-9254-527576752029	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555f-04ec-6516-43a017706712	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555f-04ec-f628-f672a369a703	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555f-04ec-dbc0-4f57e7bac05e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555f-04ec-e220-383ea371c1b2	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555f-04ec-ef87-6a7cd66b0117	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555f-04ec-1ee2-c549c7837390	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555f-04ec-64bf-abc7ca08b10a	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555f-04ec-2dfb-1cea7364cfb5	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-555f-04ec-3db7-e5ac6fb0203d	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-555f-04ec-5f36-f26c43d69b8c	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-555f-04ec-8734-95eafd0df518	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2633 (class 0 OID 4665395)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555f-04ec-d5e2-dde732adf133	00000000-555f-04ec-f628-f672a369a703	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555f-04ec-4fc6-aad414a3bd6d	00000000-555f-04ec-f628-f672a369a703	00010000-555f-04ec-43d3-6d59ed6fad6e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555f-04ec-4087-a4d809805527	00000000-555f-04ec-dbc0-4f57e7bac05e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2634 (class 0 OID 4665406)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4665456)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4665360)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555f-04ec-9d72-2a606e566e7c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555f-04ec-43ca-432bf4c0633a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555f-04ec-9a62-28fdda52e2d5	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555f-04ec-3d21-834d7726c25c	Abonma-read	Abonma - branje	f
00030000-555f-04ec-7672-82f2f4963388	Abonma-write	Abonma - spreminjanje	f
00030000-555f-04ec-2153-b6bfef12fc5f	Alternacija-read	Alternacija - branje	f
00030000-555f-04ec-9825-8c8721bc924b	Alternacija-write	Alternacija - spreminjanje	f
00030000-555f-04ec-81ad-9f611cb8995b	Arhivalija-read	Arhivalija - branje	f
00030000-555f-04ec-3375-c79632cc4980	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555f-04ec-141c-7fb12aeaf951	Besedilo-read	Besedilo - branje	f
00030000-555f-04ec-35f6-d262c6551aa0	Besedilo-write	Besedilo - spreminjanje	f
00030000-555f-04ec-9595-79c5a37e0c33	DogodekIzven-read	DogodekIzven - branje	f
00030000-555f-04ec-b7ee-aaf10d8058e3	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555f-04ec-616a-98ad7501964c	Dogodek-read	Dogodek - branje	f
00030000-555f-04ec-54ff-783baf6a8d7a	Dogodek-write	Dogodek - spreminjanje	f
00030000-555f-04ec-5246-1dcefdc88143	Drzava-read	Drzava - branje	f
00030000-555f-04ec-473f-291309fe3343	Drzava-write	Drzava - spreminjanje	f
00030000-555f-04ec-807c-31306f6c68ed	Funkcija-read	Funkcija - branje	f
00030000-555f-04ec-cbe0-ab19553544de	Funkcija-write	Funkcija - spreminjanje	f
00030000-555f-04ec-1591-4d92c5643dc8	Gostovanje-read	Gostovanje - branje	f
00030000-555f-04ec-04f7-91457ce711a0	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555f-04ec-581a-a7072b47c282	Gostujoca-read	Gostujoca - branje	f
00030000-555f-04ec-93d1-84c1721c27b5	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555f-04ec-3a49-6583ea9f2fdd	Kupec-read	Kupec - branje	f
00030000-555f-04ec-adfa-7554d6ea0ef7	Kupec-write	Kupec - spreminjanje	f
00030000-555f-04ec-70f5-cf92b62073cd	NacinPlacina-read	NacinPlacina - branje	f
00030000-555f-04ec-40ea-fda10748ad14	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555f-04ec-d831-d11eb325bb2d	Option-read	Option - branje	f
00030000-555f-04ec-9930-1e5b21e41e57	Option-write	Option - spreminjanje	f
00030000-555f-04ec-c599-923cc16f548f	OptionValue-read	OptionValue - branje	f
00030000-555f-04ec-904f-e5e54b6975cf	OptionValue-write	OptionValue - spreminjanje	f
00030000-555f-04ec-c49c-7d6651ed500f	Oseba-read	Oseba - branje	f
00030000-555f-04ec-5509-23abe3cb4893	Oseba-write	Oseba - spreminjanje	f
00030000-555f-04ec-904d-6d23dbec8ced	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555f-04ec-d2ec-fe58921095e9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555f-04ec-6c40-67488c530220	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555f-04ec-6826-c2f07d0ff3a5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555f-04ec-3990-5716fb2b523d	Pogodba-read	Pogodba - branje	f
00030000-555f-04ec-d509-c5f041d2bd27	Pogodba-write	Pogodba - spreminjanje	f
00030000-555f-04ec-0001-d4bb674e7f4a	Popa-read	Popa - branje	f
00030000-555f-04ec-f357-f9340fb88165	Popa-write	Popa - spreminjanje	f
00030000-555f-04ec-f2d0-28adb139dfab	Posta-read	Posta - branje	f
00030000-555f-04ec-3ace-07303ba18c4a	Posta-write	Posta - spreminjanje	f
00030000-555f-04ec-21a6-40fad5afc3bc	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555f-04ec-ec12-718199809457	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555f-04ec-2eba-6b6deaaa5745	PostniNaslov-read	PostniNaslov - branje	f
00030000-555f-04ec-bfad-6239a98176de	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555f-04ec-637e-a222c9df3254	Predstava-read	Predstava - branje	f
00030000-555f-04ec-2641-60f073661f3a	Predstava-write	Predstava - spreminjanje	f
00030000-555f-04ec-07af-2484601d29b4	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555f-04ec-29c6-3f3fdc643f70	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555f-04ec-be2d-b6f2ede12816	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555f-04ec-2ccc-9c51d9691069	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555f-04ec-da76-8c6bdb1e7bdd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555f-04ec-aaec-7410ec620e9b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555f-04ec-d210-05f053653bfe	Prostor-read	Prostor - branje	f
00030000-555f-04ec-034b-3e909cd4008c	Prostor-write	Prostor - spreminjanje	f
00030000-555f-04ec-b3f4-ae92816bf293	Racun-read	Racun - branje	f
00030000-555f-04ec-5519-990e1ac2f736	Racun-write	Racun - spreminjanje	f
00030000-555f-04ec-1783-96b0eb66a4d7	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555f-04ec-42fd-e9b1506a541b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555f-04ec-9c7d-268f59a9e6b2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555f-04ec-29cf-240aea414f01	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555f-04ec-3882-84d795138b0a	Rekvizit-read	Rekvizit - branje	f
00030000-555f-04ec-726f-5c5bb01c5cc7	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555f-04ec-001e-50ef17a29395	Rezervacija-read	Rezervacija - branje	f
00030000-555f-04ec-030b-bcddba355d6e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555f-04ec-797c-040230bed0d3	SedezniRed-read	SedezniRed - branje	f
00030000-555f-04ec-d36b-8c4176d4afd4	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555f-04ec-3ff4-7d687c744eab	Sedez-read	Sedez - branje	f
00030000-555f-04ec-62d1-2abd0c31c305	Sedez-write	Sedez - spreminjanje	f
00030000-555f-04ec-ff86-f2281e75abbb	Sezona-read	Sezona - branje	f
00030000-555f-04ec-f597-cfb7e0f86f18	Sezona-write	Sezona - spreminjanje	f
00030000-555f-04ec-b03c-ee331e5cca31	Telefonska-read	Telefonska - branje	f
00030000-555f-04ec-ad92-d4831cd7cdad	Telefonska-write	Telefonska - spreminjanje	f
00030000-555f-04ec-ac42-5d7e40c47474	TerminStoritve-read	TerminStoritve - branje	f
00030000-555f-04ec-70d3-7fada2c0760c	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555f-04ec-81ca-2a6220315c57	TipFunkcije-read	TipFunkcije - branje	f
00030000-555f-04ec-a3fe-a72ff173e918	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555f-04ec-8110-a95ddc61bae2	Trr-read	Trr - branje	f
00030000-555f-04ec-6312-f024d80b984c	Trr-write	Trr - spreminjanje	f
00030000-555f-04ec-27bb-c67c94cd5d90	Uprizoritev-read	Uprizoritev - branje	f
00030000-555f-04ec-ae80-97e32684de5c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555f-04ec-98ac-ea43d38cfb42	Vaja-read	Vaja - branje	f
00030000-555f-04ec-2f04-7f480b883697	Vaja-write	Vaja - spreminjanje	f
00030000-555f-04ec-9bf7-a23d758694df	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555f-04ec-4493-0c2a99f71135	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555f-04ec-b47e-558f8d6b6aae	Zaposlitev-read	Zaposlitev - branje	f
00030000-555f-04ec-0085-c11b0be2a265	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555f-04ec-96ec-8acf96705818	Zasedenost-read	Zasedenost - branje	f
00030000-555f-04ec-61a7-9c867339f70d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555f-04ec-fedb-6dcdb670facd	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555f-04ec-24b8-b1dc58a3466d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555f-04ec-980c-bebf2ddae00d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555f-04ec-5d17-9034a557c1aa	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2631 (class 0 OID 4665379)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555f-04ec-57ff-9eb0907b3061	00030000-555f-04ec-5246-1dcefdc88143
00020000-555f-04ec-3f80-19eb3e282763	00030000-555f-04ec-473f-291309fe3343
00020000-555f-04ec-3f80-19eb3e282763	00030000-555f-04ec-5246-1dcefdc88143
\.


--
-- TOC entry 2659 (class 0 OID 4665661)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4665691)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4665804)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 4665436)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4665477)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555f-04ec-43be-bf3432bd61d4	8341	Adlešiči
00050000-555f-04ec-c756-1b141d2b3e19	5270	Ajdovščina
00050000-555f-04ec-ebc2-978c9aab78e9	6280	Ankaran/Ancarano
00050000-555f-04ec-149d-a8b3352b615d	9253	Apače
00050000-555f-04ec-62fc-3a7aebf43ba1	8253	Artiče
00050000-555f-04ec-38f3-ce1ae54f8a85	4275	Begunje na Gorenjskem
00050000-555f-04ec-abd5-a8dcea95cf68	1382	Begunje pri Cerknici
00050000-555f-04ec-5235-bd4b2adb12d4	9231	Beltinci
00050000-555f-04ec-49a2-7cedc7960597	2234	Benedikt
00050000-555f-04ec-ef13-0053cbcb7701	2345	Bistrica ob Dravi
00050000-555f-04ec-a9cc-33bf783726f4	3256	Bistrica ob Sotli
00050000-555f-04ec-cfe6-0f96e3b0b5fa	8259	Bizeljsko
00050000-555f-04ec-805b-a77fb0d7e70b	1223	Blagovica
00050000-555f-04ec-1293-984c0772e58f	8283	Blanca
00050000-555f-04ec-bf49-880c5afe1d2c	4260	Bled
00050000-555f-04ec-d26d-281af6778179	4273	Blejska Dobrava
00050000-555f-04ec-5f78-f201f26aaa08	9265	Bodonci
00050000-555f-04ec-f7e2-2362b2d256cf	9222	Bogojina
00050000-555f-04ec-2b1d-4e19f321f732	4263	Bohinjska Bela
00050000-555f-04ec-ca3a-4315dfdc0437	4264	Bohinjska Bistrica
00050000-555f-04ec-81e1-922d3c16cacc	4265	Bohinjsko jezero
00050000-555f-04ec-e5d1-47646cb5ce67	1353	Borovnica
00050000-555f-04ec-333b-5d78eb16352c	8294	Boštanj
00050000-555f-04ec-4c2f-d55be6d55443	5230	Bovec
00050000-555f-04ec-66bf-dd9a4c667235	5295	Branik
00050000-555f-04ec-a37f-37085f0d97ab	3314	Braslovče
00050000-555f-04ec-e79f-62354831d6d9	5223	Breginj
00050000-555f-04ec-7cb4-de87de801a69	8280	Brestanica
00050000-555f-04ec-2ae5-aca4ac448bb8	2354	Bresternica
00050000-555f-04ec-d196-feb49c8ebbb5	4243	Brezje
00050000-555f-04ec-24ec-4bd04fda7e2a	1351	Brezovica pri Ljubljani
00050000-555f-04ec-67ab-c465824fe4dc	8250	Brežice
00050000-555f-04ec-4b38-5b5f86937b83	4210	Brnik - Aerodrom
00050000-555f-04ec-f68c-6da6d1dc5c3f	8321	Brusnice
00050000-555f-04ec-5aad-decda01626ea	3255	Buče
00050000-555f-04ec-e4dd-e9b5e5b2ec5f	8276	Bučka 
00050000-555f-04ec-63ab-b75f60705eba	9261	Cankova
00050000-555f-04ec-aafd-b1825c9dd671	3000	Celje 
00050000-555f-04ec-2b1c-75ae422e039d	3001	Celje - poštni predali
00050000-555f-04ec-1b4a-cce426084fa4	4207	Cerklje na Gorenjskem
00050000-555f-04ec-c463-e4bd73c324af	8263	Cerklje ob Krki
00050000-555f-04ec-d393-b457efcf9fed	1380	Cerknica
00050000-555f-04ec-acf3-807ce619d0ac	5282	Cerkno
00050000-555f-04ec-e8af-1957ff00e76e	2236	Cerkvenjak
00050000-555f-04ec-49bf-1826a06ca600	2215	Ceršak
00050000-555f-04ec-9b25-1d6cd002d9f4	2326	Cirkovce
00050000-555f-04ec-3b5b-332f4bfacbbc	2282	Cirkulane
00050000-555f-04ec-655f-74e5200d8cf5	5273	Col
00050000-555f-04ec-da95-9c1b14c1d2f1	8251	Čatež ob Savi
00050000-555f-04ec-d776-e0f9012bdb08	1413	Čemšenik
00050000-555f-04ec-e098-414a9ec9a506	5253	Čepovan
00050000-555f-04ec-23ef-31c1afd03388	9232	Črenšovci
00050000-555f-04ec-d666-65cc42bdb251	2393	Črna na Koroškem
00050000-555f-04ec-09da-9c7c51c21577	6275	Črni Kal
00050000-555f-04ec-c305-5744ef06030a	5274	Črni Vrh nad Idrijo
00050000-555f-04ec-a63b-9fd98efd4d77	5262	Črniče
00050000-555f-04ec-b89a-b8586d1d8d50	8340	Črnomelj
00050000-555f-04ec-28c4-685d32903665	6271	Dekani
00050000-555f-04ec-1c2e-6ba6b063d182	5210	Deskle
00050000-555f-04ec-08e2-bf0c9e7066b2	2253	Destrnik
00050000-555f-04ec-a333-ba9a7f10bb9a	6215	Divača
00050000-555f-04ec-1aea-4e1739feb708	1233	Dob
00050000-555f-04ec-fd4d-4ee996558b1e	3224	Dobje pri Planini
00050000-555f-04ec-6b68-05cd74644d5d	8257	Dobova
00050000-555f-04ec-7878-1f5515217d97	1423	Dobovec
00050000-555f-04ec-db80-c92c204fb7a9	5263	Dobravlje
00050000-555f-04ec-59ce-93fbb7bf00b6	3204	Dobrna
00050000-555f-04ec-c79d-a2c7523809dd	8211	Dobrnič
00050000-555f-04ec-da67-daf68ecaeab7	1356	Dobrova
00050000-555f-04ec-0621-f3d4b7bbdc3b	9223	Dobrovnik/Dobronak 
00050000-555f-04ec-fee8-7d2d68579285	5212	Dobrovo v Brdih
00050000-555f-04ec-c66d-8e2349b97e34	1431	Dol pri Hrastniku
00050000-555f-04ec-073f-4e24529e495e	1262	Dol pri Ljubljani
00050000-555f-04ec-7d61-4d54c091d6fd	1273	Dole pri Litiji
00050000-555f-04ec-d4a1-45d6bfc6f39a	1331	Dolenja vas
00050000-555f-04ec-7645-2913e94f0817	8350	Dolenjske Toplice
00050000-555f-04ec-424d-0f84f12e4ff5	1230	Domžale
00050000-555f-04ec-2cab-6ae38e42c4f3	2252	Dornava
00050000-555f-04ec-ce8c-be472dce8797	5294	Dornberk
00050000-555f-04ec-0d3d-165819ce00c1	1319	Draga
00050000-555f-04ec-d6bf-64c57097c419	8343	Dragatuš
00050000-555f-04ec-8227-238a001c1a47	3222	Dramlje
00050000-555f-04ec-420d-8f9231b68d57	2370	Dravograd
00050000-555f-04ec-ea80-d14291a5abfa	4203	Duplje
00050000-555f-04ec-8b0b-c9c5a35cce2e	6221	Dutovlje
00050000-555f-04ec-7ede-2b9d49688989	8361	Dvor
00050000-555f-04ec-74f2-246512766284	2343	Fala
00050000-555f-04ec-1375-81142cd8ca4d	9208	Fokovci
00050000-555f-04ec-5537-d65aa50a9e37	2313	Fram
00050000-555f-04ec-cfe3-30bcd12a6c15	3213	Frankolovo
00050000-555f-04ec-873a-39bb27910d7d	1274	Gabrovka
00050000-555f-04ec-74c9-9d8bb3692ee1	8254	Globoko
00050000-555f-04ec-989a-b654784229cb	5275	Godovič
00050000-555f-04ec-f5b2-3b4361166556	4204	Golnik
00050000-555f-04ec-a116-37221e2f36ab	3303	Gomilsko
00050000-555f-04ec-7543-ea2ff649465c	4224	Gorenja vas
00050000-555f-04ec-fa78-4fa7e6f9019b	3263	Gorica pri Slivnici
00050000-555f-04ec-9bf8-c94dc4d6c811	2272	Gorišnica
00050000-555f-04ec-554b-dc430f557f11	9250	Gornja Radgona
00050000-555f-04ec-5537-6d2acbf6b56c	3342	Gornji Grad
00050000-555f-04ec-5484-5dc1ff7c6e55	4282	Gozd Martuljek
00050000-555f-04ec-b353-6bfbf1effded	6272	Gračišče
00050000-555f-04ec-7be8-e84febd4a02c	9264	Grad
00050000-555f-04ec-9617-a74b1c39c50e	8332	Gradac
00050000-555f-04ec-6254-d97d0b8cef29	1384	Grahovo
00050000-555f-04ec-0c53-0a8c9355d149	5242	Grahovo ob Bači
00050000-555f-04ec-adb2-f4f85a4987cf	5251	Grgar
00050000-555f-04ec-125c-6a8f4327880c	3302	Griže
00050000-555f-04ec-5630-8f899b479026	3231	Grobelno
00050000-555f-04ec-6159-fc562cf9ac38	1290	Grosuplje
00050000-555f-04ec-7eee-09c42146430f	2288	Hajdina
00050000-555f-04ec-d202-3c16910a05cd	8362	Hinje
00050000-555f-04ec-2845-872f1c1e17c8	2311	Hoče
00050000-555f-04ec-986f-115486a7e1af	9205	Hodoš/Hodos
00050000-555f-04ec-09cc-5ba2c6c0c060	1354	Horjul
00050000-555f-04ec-cfbb-ce12eb53c839	1372	Hotedršica
00050000-555f-04ec-9667-1738df580242	1430	Hrastnik
00050000-555f-04ec-a494-28d0f9475d86	6225	Hruševje
00050000-555f-04ec-943e-77e9426d6e94	4276	Hrušica
00050000-555f-04ec-6454-936b07f0f04d	5280	Idrija
00050000-555f-04ec-8f52-3b05472d3a87	1292	Ig
00050000-555f-04ec-5127-c121df561bd8	6250	Ilirska Bistrica
00050000-555f-04ec-f632-7e0f63a82a72	6251	Ilirska Bistrica-Trnovo
00050000-555f-04ec-b70f-a1ad528da88d	1295	Ivančna Gorica
00050000-555f-04ec-fd93-8b908870b03a	2259	Ivanjkovci
00050000-555f-04ec-c774-fa1f53df86b0	1411	Izlake
00050000-555f-04ec-386f-32ed7c308d49	6310	Izola/Isola
00050000-555f-04ec-5c67-c76991a2530c	2222	Jakobski Dol
00050000-555f-04ec-cd4b-1a747b5d6d27	2221	Jarenina
00050000-555f-04ec-8dfb-2e987b2fee3a	6254	Jelšane
00050000-555f-04ec-21a6-7ab1078a3c28	4270	Jesenice
00050000-555f-04ec-37f6-a61f710e26c4	8261	Jesenice na Dolenjskem
00050000-555f-04ec-99e9-2db2700f24d6	3273	Jurklošter
00050000-555f-04ec-3e1f-c9ebd6b3dce5	2223	Jurovski Dol
00050000-555f-04ec-e1e5-d713415586a5	2256	Juršinci
00050000-555f-04ec-101c-299588d8b933	5214	Kal nad Kanalom
00050000-555f-04ec-e41a-ca30553beac6	3233	Kalobje
00050000-555f-04ec-bcfa-d7bbc8eb2ebe	4246	Kamna Gorica
00050000-555f-04ec-ffbb-ae1d82b5b324	2351	Kamnica
00050000-555f-04ec-3d30-d0f3f41f5497	1241	Kamnik
00050000-555f-04ec-a2d9-8e69bfc62721	5213	Kanal
00050000-555f-04ec-3222-664208a4ca77	8258	Kapele
00050000-555f-04ec-25fd-6dbbdb653291	2362	Kapla
00050000-555f-04ec-de06-677e56104766	2325	Kidričevo
00050000-555f-04ec-cd67-839e37b0c384	1412	Kisovec
00050000-555f-04ec-7aef-325dc92f487d	6253	Knežak
00050000-555f-04ec-f005-86436e798d5c	5222	Kobarid
00050000-555f-04ec-1ecf-d39c885ea4de	9227	Kobilje
00050000-555f-04ec-c3f3-805d51fe0923	1330	Kočevje
00050000-555f-04ec-66ad-0f8360fe7406	1338	Kočevska Reka
00050000-555f-04ec-f48a-c332038f308f	2276	Kog
00050000-555f-04ec-3d4c-05102310d2a0	5211	Kojsko
00050000-555f-04ec-3c31-750e82ac460f	6223	Komen
00050000-555f-04ec-8995-122e81939dc9	1218	Komenda
00050000-555f-04ec-a118-3edaaa43c1de	6000	Koper/Capodistria 
00050000-555f-04ec-92a6-08e35124ae32	6001	Koper/Capodistria - poštni predali
00050000-555f-04ec-6d11-f93097a612ab	8282	Koprivnica
00050000-555f-04ec-e611-fda2e69ab3ab	5296	Kostanjevica na Krasu
00050000-555f-04ec-86e1-adb8ab09c7e5	8311	Kostanjevica na Krki
00050000-555f-04ec-907d-513185baf5b4	1336	Kostel
00050000-555f-04ec-bc70-35bcbb37d78e	6256	Košana
00050000-555f-04ec-373f-4ca138a96574	2394	Kotlje
00050000-555f-04ec-e070-2f8da51148c0	6240	Kozina
00050000-555f-04ec-f1c0-8ae2aed8a0e7	3260	Kozje
00050000-555f-04ec-ba7b-d5946113225c	4000	Kranj 
00050000-555f-04ec-2dba-adab9f4a660d	4001	Kranj - poštni predali
00050000-555f-04ec-6e48-e8c028c212ce	4280	Kranjska Gora
00050000-555f-04ec-3ca3-347ff0ad786a	1281	Kresnice
00050000-555f-04ec-1d28-bacdfee703a9	4294	Križe
00050000-555f-04ec-b610-3f6efab546f9	9206	Križevci
00050000-555f-04ec-7e92-05132f20e5a0	9242	Križevci pri Ljutomeru
00050000-555f-04ec-b4bb-d4f6525d407a	1301	Krka
00050000-555f-04ec-df65-0dd90d9ed4e6	8296	Krmelj
00050000-555f-04ec-5e76-92d6dfe990cb	4245	Kropa
00050000-555f-04ec-3a6c-292c414ed2e4	8262	Krška vas
00050000-555f-04ec-ce0b-9fb2538bf171	8270	Krško
00050000-555f-04ec-97c5-9ab50067f4b1	9263	Kuzma
00050000-555f-04ec-65ec-b6cf80623010	2318	Laporje
00050000-555f-04ec-a27a-e047352889de	3270	Laško
00050000-555f-04ec-4e99-95c798dacb6a	1219	Laze v Tuhinju
00050000-555f-04ec-a78b-b665e32e12cb	2230	Lenart v Slovenskih goricah
00050000-555f-04ec-fbfa-0a35c742c51c	9220	Lendava/Lendva
00050000-555f-04ec-8052-84465550579b	4248	Lesce
00050000-555f-04ec-9538-34c8551647da	3261	Lesično
00050000-555f-04ec-f34a-811f0c3054e9	8273	Leskovec pri Krškem
00050000-555f-04ec-8816-9b534475f421	2372	Libeliče
00050000-555f-04ec-c775-3e3aa4b5fdd8	2341	Limbuš
00050000-555f-04ec-77fb-234884670ed8	1270	Litija
00050000-555f-04ec-38e6-e1f92073becf	3202	Ljubečna
00050000-555f-04ec-2ff5-d22357128b20	1000	Ljubljana 
00050000-555f-04ec-56e5-7baa5c27a9d0	1001	Ljubljana - poštni predali
00050000-555f-04ec-22bb-4f1bd504d741	1231	Ljubljana - Črnuče
00050000-555f-04ec-d0ce-07d3a7a5642c	1261	Ljubljana - Dobrunje
00050000-555f-04ec-3a04-f95bbd9f9a40	1260	Ljubljana - Polje
00050000-555f-04ec-f52c-d825afe3979f	1210	Ljubljana - Šentvid
00050000-555f-04ec-ef57-b20c7b8f0550	1211	Ljubljana - Šmartno
00050000-555f-04ec-7956-0ad55388a8d2	3333	Ljubno ob Savinji
00050000-555f-04ec-4b19-2ac70167c66a	9240	Ljutomer
00050000-555f-04ec-55e5-281514545891	3215	Loče
00050000-555f-04ec-daf6-62ad32e5d75c	5231	Log pod Mangartom
00050000-555f-04ec-05a2-6ed53d46720a	1358	Log pri Brezovici
00050000-555f-04ec-a08a-dbcc53a85670	1370	Logatec
00050000-555f-04ec-39f7-aadca91b5775	1371	Logatec
00050000-555f-04ec-8f8d-4f1a22ae3ed9	1434	Loka pri Zidanem Mostu
00050000-555f-04ec-8414-6476e91bf3b0	3223	Loka pri Žusmu
00050000-555f-04ec-1028-89db463260ec	6219	Lokev
00050000-555f-04ec-431c-f3c62b3079e7	1318	Loški Potok
00050000-555f-04ec-2ecc-738ed9eee859	2324	Lovrenc na Dravskem polju
00050000-555f-04ec-c09f-59e73298df1d	2344	Lovrenc na Pohorju
00050000-555f-04ec-3a8c-a5b8fc2b54f8	3334	Luče
00050000-555f-04ec-312f-9d87b09a5535	1225	Lukovica
00050000-555f-04ec-d6bd-d453d64c3bb9	9202	Mačkovci
00050000-555f-04ec-305b-665b5d3b3c0c	2322	Majšperk
00050000-555f-04ec-2265-9b0d9b75e20d	2321	Makole
00050000-555f-04ec-9908-e80c6efb2cb5	9243	Mala Nedelja
00050000-555f-04ec-8d73-d2093f970bf8	2229	Malečnik
00050000-555f-04ec-b5c2-853be6dfa30d	6273	Marezige
00050000-555f-04ec-8616-d8c2591b4ed0	2000	Maribor 
00050000-555f-04ec-c452-11283abd7b14	2001	Maribor - poštni predali
00050000-555f-04ec-0fbe-7bd8c935ba5b	2206	Marjeta na Dravskem polju
00050000-555f-04ec-32ba-982a93de1ff2	2281	Markovci
00050000-555f-04ec-9ca3-2f6165a1d2af	9221	Martjanci
00050000-555f-04ec-7c55-0a1978b37089	6242	Materija
00050000-555f-04ec-45f4-9642160177c3	4211	Mavčiče
00050000-555f-04ec-385c-a24346a563dd	1215	Medvode
00050000-555f-04ec-ffd9-d05e35c9a0e6	1234	Mengeš
00050000-555f-04ec-5710-72fdd801b0c9	8330	Metlika
00050000-555f-04ec-6428-c49332ae39ff	2392	Mežica
00050000-555f-04ec-1cb9-ddf4e1988451	2204	Miklavž na Dravskem polju
00050000-555f-04ec-8253-1966f9e5efeb	2275	Miklavž pri Ormožu
00050000-555f-04ec-b794-2266c612e931	5291	Miren
00050000-555f-04ec-af93-639e869cd4f9	8233	Mirna
00050000-555f-04ec-5314-535866e4afdb	8216	Mirna Peč
00050000-555f-04ec-f3bc-1288be6e22f3	2382	Mislinja
00050000-555f-04ec-6253-ae6a949d1de1	4281	Mojstrana
00050000-555f-04ec-d67b-5509abdc33c0	8230	Mokronog
00050000-555f-04ec-9883-b8534357a3db	1251	Moravče
00050000-555f-04ec-b6d4-9d385c9f8afd	9226	Moravske Toplice
00050000-555f-04ec-392d-9ac99a2c3b9e	5216	Most na Soči
00050000-555f-04ec-7083-cc9375d03dda	1221	Motnik
00050000-555f-04ec-88e8-5abe3a5eb688	3330	Mozirje
00050000-555f-04ec-f58a-75adcf3e127f	9000	Murska Sobota 
00050000-555f-04ec-fefd-d02d58308873	9001	Murska Sobota - poštni predali
00050000-555f-04ec-341b-279316526d5a	2366	Muta
00050000-555f-04ec-2b41-38daf7859133	4202	Naklo
00050000-555f-04ec-7b16-2e367a6ed1f8	3331	Nazarje
00050000-555f-04ec-525a-fc375e702a89	1357	Notranje Gorice
00050000-555f-04ec-df09-c606c921d34c	3203	Nova Cerkev
00050000-555f-04ec-eebd-e8e1edef156b	5000	Nova Gorica 
00050000-555f-04ec-eed4-413b90cf0d82	5001	Nova Gorica - poštni predali
00050000-555f-04ec-3260-bbbaff2c80f9	1385	Nova vas
00050000-555f-04ec-7d3a-2ac2bc3858de	8000	Novo mesto
00050000-555f-04ec-19bf-21e77355755c	8001	Novo mesto - poštni predali
00050000-555f-04ec-955c-900efa301601	6243	Obrov
00050000-555f-04ec-3a64-fbb241fd5e1e	9233	Odranci
00050000-555f-04ec-2cce-c16a4df1cce7	2317	Oplotnica
00050000-555f-04ec-0af1-dd3b4a3c86d8	2312	Orehova vas
00050000-555f-04ec-b5b6-c75d1a13a3a4	2270	Ormož
00050000-555f-04ec-f911-e00a9aa19f67	1316	Ortnek
00050000-555f-04ec-60d1-f40d6a09984b	1337	Osilnica
00050000-555f-04ec-e877-1b0b0b39f0a6	8222	Otočec
00050000-555f-04ec-85a3-f0b8a27e3309	2361	Ožbalt
00050000-555f-04ec-de4e-676bde63124e	2231	Pernica
00050000-555f-04ec-70a3-ce53ecd55b10	2211	Pesnica pri Mariboru
00050000-555f-04ec-19ac-5e0b6d88f21c	9203	Petrovci
00050000-555f-04ec-49aa-76c7b7db98a9	3301	Petrovče
00050000-555f-04ec-c3de-bee8d6ab3aad	6330	Piran/Pirano
00050000-555f-04ec-83cb-0d5f93b98f1f	8255	Pišece
00050000-555f-04ec-d266-58c0cf695ffc	6257	Pivka
00050000-555f-04ec-be15-bc7371d7c175	6232	Planina
00050000-555f-04ec-86b7-f302091a0950	3225	Planina pri Sevnici
00050000-555f-04ec-b362-6ce465f7cefb	6276	Pobegi
00050000-555f-04ec-84ce-4e9e49e312b5	8312	Podbočje
00050000-555f-04ec-1023-21b968e8dd83	5243	Podbrdo
00050000-555f-04ec-d5de-9be062b341e0	3254	Podčetrtek
00050000-555f-04ec-7a33-c9863bd1f4c2	2273	Podgorci
00050000-555f-04ec-b460-6dcfe21bdb47	6216	Podgorje
00050000-555f-04ec-00d7-44e96bb73679	2381	Podgorje pri Slovenj Gradcu
00050000-555f-04ec-a2cf-0b595ad31077	6244	Podgrad
00050000-555f-04ec-f641-68f56d28134b	1414	Podkum
00050000-555f-04ec-ccc2-783d144fdac9	2286	Podlehnik
00050000-555f-04ec-eaa1-51a794bcc0ac	5272	Podnanos
00050000-555f-04ec-b249-30fba60288d3	4244	Podnart
00050000-555f-04ec-6766-090221b37930	3241	Podplat
00050000-555f-04ec-4c2e-43693248976b	3257	Podsreda
00050000-555f-04ec-a06b-29e35336ef63	2363	Podvelka
00050000-555f-04ec-1d77-c6eb91fab28e	2208	Pohorje
00050000-555f-04ec-3666-8cb720118a8d	2257	Polenšak
00050000-555f-04ec-c2e9-9749de7657b2	1355	Polhov Gradec
00050000-555f-04ec-c240-1f32580dd26e	4223	Poljane nad Škofjo Loko
00050000-555f-04ec-d445-7ca237f0deb1	2319	Poljčane
00050000-555f-04ec-6d43-11426a0da770	1272	Polšnik
00050000-555f-04ec-9ed0-78f6c35a2921	3313	Polzela
00050000-555f-04ec-a854-109f429b689c	3232	Ponikva
00050000-555f-04ec-49b2-f4e38c811f79	6320	Portorož/Portorose
00050000-555f-04ec-98ef-170feb88cadf	6230	Postojna
00050000-555f-04ec-5618-7e4984efb842	2331	Pragersko
00050000-555f-04ec-f275-fc5fc13147b9	3312	Prebold
00050000-555f-04ec-ed9b-f0aee34118eb	4205	Preddvor
00050000-555f-04ec-e9e9-36748e64164a	6255	Prem
00050000-555f-04ec-c474-bbe8cd104022	1352	Preserje
00050000-555f-04ec-8a7b-b13134851fe6	6258	Prestranek
00050000-555f-04ec-034a-8530576bb736	2391	Prevalje
00050000-555f-04ec-f617-a1e8bcb9a4ea	3262	Prevorje
00050000-555f-04ec-401d-45e844ffe641	1276	Primskovo 
00050000-555f-04ec-8344-6098f369390d	3253	Pristava pri Mestinju
00050000-555f-04ec-02cc-7de027d0e9c5	9207	Prosenjakovci/Partosfalva
00050000-555f-04ec-7eab-ef02e2409489	5297	Prvačina
00050000-555f-04ec-675a-6e9a7993c3ad	2250	Ptuj
00050000-555f-04ec-3bd7-8e651877f516	2323	Ptujska Gora
00050000-555f-04ec-b026-f849b1260217	9201	Puconci
00050000-555f-04ec-efe3-686a5747d98f	2327	Rače
00050000-555f-04ec-b465-927b1443524b	1433	Radeče
00050000-555f-04ec-c78f-eab63d6d868e	9252	Radenci
00050000-555f-04ec-3f82-b03d3bf095e6	2360	Radlje ob Dravi
00050000-555f-04ec-103e-768eb41bc118	1235	Radomlje
00050000-555f-04ec-623c-dbd8dbbc4b9e	4240	Radovljica
00050000-555f-04ec-41b4-1c5ed7ae0879	8274	Raka
00050000-555f-04ec-9513-5775720871bf	1381	Rakek
00050000-555f-04ec-5164-9fb805b3d672	4283	Rateče - Planica
00050000-555f-04ec-24ac-994fe02ce3ce	2390	Ravne na Koroškem
00050000-555f-04ec-bba4-4617e8f6e5a7	9246	Razkrižje
00050000-555f-04ec-ded1-e63c71fbab29	3332	Rečica ob Savinji
00050000-555f-04ec-a6a6-f83fbcb70c56	5292	Renče
00050000-555f-04ec-a16a-c545c51f2e22	1310	Ribnica
00050000-555f-04ec-49b4-5e2a412da2fa	2364	Ribnica na Pohorju
00050000-555f-04ec-1db9-1d03fcdb72ef	3272	Rimske Toplice
00050000-555f-04ec-4de1-7c3e99ac954c	1314	Rob
00050000-555f-04ec-b5f3-38677ee465da	5215	Ročinj
00050000-555f-04ec-1ca3-0d1d45521aa4	3250	Rogaška Slatina
00050000-555f-04ec-ea5f-586b25361825	9262	Rogašovci
00050000-555f-04ec-d68e-348e3755370f	3252	Rogatec
00050000-555f-04ec-78e4-d22ef4bb6876	1373	Rovte
00050000-555f-04ec-443f-983ae0a2e436	2342	Ruše
00050000-555f-04ec-55c3-4d093b0e9496	1282	Sava
00050000-555f-04ec-e77c-6b9b2f0bad52	6333	Sečovlje/Sicciole
00050000-555f-04ec-dfbd-86d2ba36c827	4227	Selca
00050000-555f-04ec-5b9e-c1a0363dc538	2352	Selnica ob Dravi
00050000-555f-04ec-f0e8-31748f696e82	8333	Semič
00050000-555f-04ec-86cf-589090cf693b	8281	Senovo
00050000-555f-04ec-8a52-583eb6605781	6224	Senožeče
00050000-555f-04ec-2129-831960bf8edb	8290	Sevnica
00050000-555f-04ec-b41a-ad3bb3acbc6d	6210	Sežana
00050000-555f-04ec-2ae3-a009c55ae1ef	2214	Sladki Vrh
00050000-555f-04ec-9e4a-4800b038fb91	5283	Slap ob Idrijci
00050000-555f-04ec-427c-1d48194806fb	2380	Slovenj Gradec
00050000-555f-04ec-0804-adef1cdef4d2	2310	Slovenska Bistrica
00050000-555f-04ec-1cb6-80a1587e506c	3210	Slovenske Konjice
00050000-555f-04ec-a061-886c7af60ece	1216	Smlednik
00050000-555f-04ec-87ca-d4080d7041fa	5232	Soča
00050000-555f-04ec-4575-83d96ca93223	1317	Sodražica
00050000-555f-04ec-fe6a-0d7a30128d1b	3335	Solčava
00050000-555f-04ec-62e6-36de3cbbdf21	5250	Solkan
00050000-555f-04ec-776e-0e322b5caa5b	4229	Sorica
00050000-555f-04ec-c2b3-71c9e3125836	4225	Sovodenj
00050000-555f-04ec-d4fc-1700ef946307	5281	Spodnja Idrija
00050000-555f-04ec-b05d-27d92513e077	2241	Spodnji Duplek
00050000-555f-04ec-ff4b-181b23c975b9	9245	Spodnji Ivanjci
00050000-555f-04ec-8831-f5560deffc8f	2277	Središče ob Dravi
00050000-555f-04ec-5323-d0d00bc39e15	4267	Srednja vas v Bohinju
00050000-555f-04ec-6b56-f574aa09947a	8256	Sromlje 
00050000-555f-04ec-7f8e-7a7cd5f3e6d7	5224	Srpenica
00050000-555f-04ec-9377-b53ef8cfe04a	1242	Stahovica
00050000-555f-04ec-ab4a-bc1f0687e436	1332	Stara Cerkev
00050000-555f-04ec-6371-a877b76a7c49	8342	Stari trg ob Kolpi
00050000-555f-04ec-59d3-c2865c3ac2e9	1386	Stari trg pri Ložu
00050000-555f-04ec-9d3e-e6fb56025727	2205	Starše
00050000-555f-04ec-9a11-d9dec4af269b	2289	Stoperce
00050000-555f-04ec-9a52-67a675a4d73e	8322	Stopiče
00050000-555f-04ec-3711-34c03f712bcf	3206	Stranice
00050000-555f-04ec-9b8a-2a0da2b9e5e2	8351	Straža
00050000-555f-04ec-f12e-941ae6b241d7	1313	Struge
00050000-555f-04ec-6b96-56418a2acbb6	8293	Studenec
00050000-555f-04ec-a283-9146ddc33776	8331	Suhor
00050000-555f-04ec-5261-61294f445417	2233	Sv. Ana v Slovenskih goricah
00050000-555f-04ec-9b1f-26829b303a31	2235	Sv. Trojica v Slovenskih goricah
00050000-555f-04ec-4130-ebcb2a17287f	2353	Sveti Duh na Ostrem Vrhu
00050000-555f-04ec-a57a-ea84c71fe842	9244	Sveti Jurij ob Ščavnici
00050000-555f-04ec-f78a-eda2239b5b62	3264	Sveti Štefan
00050000-555f-04ec-68c9-52b2dd45ccab	2258	Sveti Tomaž
00050000-555f-04ec-f385-f3629100bc01	9204	Šalovci
00050000-555f-04ec-218d-01a9d775e5a4	5261	Šempas
00050000-555f-04ec-d5e3-abf23ad04f38	5290	Šempeter pri Gorici
00050000-555f-04ec-7cc4-2bde0159776a	3311	Šempeter v Savinjski dolini
00050000-555f-04ec-cadc-040083310989	4208	Šenčur
00050000-555f-04ec-9551-54a90a938df1	2212	Šentilj v Slovenskih goricah
00050000-555f-04ec-abf0-472c62780e9d	8297	Šentjanž
00050000-555f-04ec-a387-05becac31b8c	2373	Šentjanž pri Dravogradu
00050000-555f-04ec-9f1e-d544f98829d0	8310	Šentjernej
00050000-555f-04ec-3108-022a81a7fff8	3230	Šentjur
00050000-555f-04ec-6c5f-f3f27651814b	3271	Šentrupert
00050000-555f-04ec-3cb3-d05cec10cfe6	8232	Šentrupert
00050000-555f-04ec-b497-473524ea935e	1296	Šentvid pri Stični
00050000-555f-04ec-a796-fefe3e2d3f7a	8275	Škocjan
00050000-555f-04ec-24f4-1734f102322d	6281	Škofije
00050000-555f-04ec-20b9-4fa0e70ef6b6	4220	Škofja Loka
00050000-555f-04ec-45dc-fddefb60bfb0	3211	Škofja vas
00050000-555f-04ec-d73a-55a04df0037f	1291	Škofljica
00050000-555f-04ec-9adf-419593000fe8	6274	Šmarje
00050000-555f-04ec-4088-0ac7d8f13206	1293	Šmarje - Sap
00050000-555f-04ec-b0c5-68dabcf1ccc7	3240	Šmarje pri Jelšah
00050000-555f-04ec-5aa4-5fdaf5c87e45	8220	Šmarješke Toplice
00050000-555f-04ec-7250-83509f4a9f12	2315	Šmartno na Pohorju
00050000-555f-04ec-f52f-bb8b3e9f0406	3341	Šmartno ob Dreti
00050000-555f-04ec-e2ae-d056b546f4d9	3327	Šmartno ob Paki
00050000-555f-04ec-61ca-80ef6daaa771	1275	Šmartno pri Litiji
00050000-555f-04ec-0032-ba1184fac06d	2383	Šmartno pri Slovenj Gradcu
00050000-555f-04ec-1cd2-a7c9bae29565	3201	Šmartno v Rožni dolini
00050000-555f-04ec-62a4-fd5be3900c90	3325	Šoštanj
00050000-555f-04ec-7d89-d248d050959b	6222	Štanjel
00050000-555f-04ec-d4ee-8ad19179feec	3220	Štore
00050000-555f-04ec-c2f2-ef77d8d3a46e	3304	Tabor
00050000-555f-04ec-c492-85690d1ce34a	3221	Teharje
00050000-555f-04ec-3d79-aac25cb47b11	9251	Tišina
00050000-555f-04ec-afe1-fbe887e52283	5220	Tolmin
00050000-555f-04ec-cb39-1e21deea1592	3326	Topolšica
00050000-555f-04ec-3b74-01c84b854f3d	2371	Trbonje
00050000-555f-04ec-7002-bcbfdb17f4b3	1420	Trbovlje
00050000-555f-04ec-ef03-51666048fcfc	8231	Trebelno 
00050000-555f-04ec-ef5d-ec8bb857f98b	8210	Trebnje
00050000-555f-04ec-62f8-2b83678e71e6	5252	Trnovo pri Gorici
00050000-555f-04ec-7f86-fba1e83eefd2	2254	Trnovska vas
00050000-555f-04ec-d908-7a32e5662a74	1222	Trojane
00050000-555f-04ec-9cdb-46ddc4917178	1236	Trzin
00050000-555f-04ec-56a1-e4d34f2f0538	4290	Tržič
00050000-555f-04ec-86e4-3228ffbb5c2a	8295	Tržišče
00050000-555f-04ec-462f-dd97d3e0a810	1311	Turjak
00050000-555f-04ec-ca75-dd14023a77b4	9224	Turnišče
00050000-555f-04ec-ff77-dbbb54e410bc	8323	Uršna sela
00050000-555f-04ec-1348-b39c277e28a4	1252	Vače
00050000-555f-04ec-80ed-08e6ea92b148	3320	Velenje 
00050000-555f-04ec-88b3-4ea33378af10	3322	Velenje - poštni predali
00050000-555f-04ec-b064-47af3a5316ac	8212	Velika Loka
00050000-555f-04ec-af00-3e6625ba44ce	2274	Velika Nedelja
00050000-555f-04ec-a3d0-f6d6f76f5b7a	9225	Velika Polana
00050000-555f-04ec-1c5b-dce07e68ae43	1315	Velike Lašče
00050000-555f-04ec-b652-4b112a3c2339	8213	Veliki Gaber
00050000-555f-04ec-afd1-c78e47b4cda6	9241	Veržej
00050000-555f-04ec-06a7-815612e90230	1312	Videm - Dobrepolje
00050000-555f-04ec-3504-1b8b7f76e45b	2284	Videm pri Ptuju
00050000-555f-04ec-3e60-a0f72da107f2	8344	Vinica
00050000-555f-04ec-78ba-e43517a1228d	5271	Vipava
00050000-555f-04ec-a137-1fb6e54e75b8	4212	Visoko
00050000-555f-04ec-8ffe-0d9d1eb0e468	1294	Višnja Gora
00050000-555f-04ec-6df3-b85289aa2763	3205	Vitanje
00050000-555f-04ec-f7dc-6784acb5e6a9	2255	Vitomarci
00050000-555f-04ec-c966-0128311924b4	1217	Vodice
00050000-555f-04ec-224d-21e0c3991f69	3212	Vojnik\t
00050000-555f-04ec-abc8-c0a443672424	5293	Volčja Draga
00050000-555f-04ec-4637-6f4efd4ba660	2232	Voličina
00050000-555f-04ec-b384-3ffef578f080	3305	Vransko
00050000-555f-04ec-faf4-3b875c44639c	6217	Vremski Britof
00050000-555f-04ec-84c0-ca1514fde7d4	1360	Vrhnika
00050000-555f-04ec-e6a1-d7423e6c775f	2365	Vuhred
00050000-555f-04ec-6209-ae229bb9b649	2367	Vuzenica
00050000-555f-04ec-6c21-7262fb22adbb	8292	Zabukovje 
00050000-555f-04ec-74fa-288dc3239b43	1410	Zagorje ob Savi
00050000-555f-04ec-9f09-f348a4e07e08	1303	Zagradec
00050000-555f-04ec-ed1c-8305e1df4a06	2283	Zavrč
00050000-555f-04ec-54f7-80ca32139215	8272	Zdole 
00050000-555f-04ec-9950-72f49f078608	4201	Zgornja Besnica
00050000-555f-04ec-c63a-637618ac6f43	2242	Zgornja Korena
00050000-555f-04ec-72ce-0f7dfec4e109	2201	Zgornja Kungota
00050000-555f-04ec-203b-bf0b82a44727	2316	Zgornja Ložnica
00050000-555f-04ec-990f-514bc036aeff	2314	Zgornja Polskava
00050000-555f-04ec-007c-95aa090b7ad4	2213	Zgornja Velka
00050000-555f-04ec-36d5-c90a8fb63067	4247	Zgornje Gorje
00050000-555f-04ec-d8de-15134f19f8c9	4206	Zgornje Jezersko
00050000-555f-04ec-e0f0-842301e95155	2285	Zgornji Leskovec
00050000-555f-04ec-392b-4d2bbf6e34c0	1432	Zidani Most
00050000-555f-04ec-bbd5-e692d19a11e9	3214	Zreče
00050000-555f-04ec-72cc-85c639c789f4	4209	Žabnica
00050000-555f-04ec-b97e-55920b215a25	3310	Žalec
00050000-555f-04ec-9990-cb4e31766b5e	4228	Železniki
00050000-555f-04ec-e10f-3ea3f9ba09b2	2287	Žetale
00050000-555f-04ec-3b1f-ef14b4ab1d0d	4226	Žiri
00050000-555f-04ec-cebf-92f0d101cb25	4274	Žirovnica
00050000-555f-04ec-e329-34aef83ea7d7	8360	Žužemberk
\.


--
-- TOC entry 2655 (class 0 OID 4665635)
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
-- TOC entry 2638 (class 0 OID 4665463)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4665528)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4665647)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4665753)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4665797)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4665676)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4665620)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4665610)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4665787)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4665743)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 4665331)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555f-04ec-43d3-6d59ed6fad6e	00010000-555f-04ec-3d4e-58914d74225c	2015-05-22 12:29:01	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROgVX0rBCjGdWglcNvcemrii2Cjtt8squ";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2662 (class 0 OID 4665685)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4665369)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555f-04ec-865e-db8194810136	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555f-04ec-a8e8-278b9fd177ed	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555f-04ec-57ff-9eb0907b3061	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555f-04ec-3525-7ba7877f6e4c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555f-04ec-6cdb-cbcf0199e60a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555f-04ec-3f80-19eb3e282763	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2628 (class 0 OID 4665353)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555f-04ec-43d3-6d59ed6fad6e	00020000-555f-04ec-3525-7ba7877f6e4c
00010000-555f-04ec-3d4e-58914d74225c	00020000-555f-04ec-3525-7ba7877f6e4c
\.


--
-- TOC entry 2664 (class 0 OID 4665699)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4665641)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4665591)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 4665428)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4665597)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4665776)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, imezenski, podrocje) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4665497)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 4665340)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555f-04ec-3d4e-58914d74225c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROEhkjojPNjEFf7ejVJ0pejEiG5x2DvE2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555f-04ec-43d3-6d59ed6fad6e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2676 (class 0 OID 4665829)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4665543)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4665668)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4665735)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4665575)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4665819)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 4665725)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4665394)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4665869)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4665862)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4665775)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4665565)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4665590)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4665523)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4665721)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4665541)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4665584)
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
-- TOC entry 2360 (class 2606 OID 4665633)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4665660)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4665495)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4665403)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4665460)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4665426)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4665383)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4665368)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4665666)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4665698)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4665814)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4665453)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4665483)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4665639)
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
-- TOC entry 2294 (class 2606 OID 4665473)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4665532)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4665651)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4665759)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4665802)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4665683)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4665624)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4665615)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4665796)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4665750)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4665339)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4665689)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4665357)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4665377)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4665707)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4665646)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4665596)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4665433)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4665606)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4665786)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4665508)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4665352)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4665844)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4665550)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4665674)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4665741)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4665579)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4665828)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4665734)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4665572)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4665455)
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
-- TOC entry 2373 (class 1259 OID 4665667)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4665653)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4665652)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4665551)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4665724)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4665722)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4665723)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4665816)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4665817)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4665818)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4665847)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4665846)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2429 (class 1259 OID 4665845)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4665510)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4665509)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4665462)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4665461)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4665690)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4665585)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4665384)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4665385)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4665710)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4665709)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4665708)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4665533)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4665535)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4665534)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4665619)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4665617)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4665616)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4665618)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4665358)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4665359)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4665675)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4665640)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4665751)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4665752)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4665475)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4665474)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4665476)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4665760)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4665761)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2438 (class 1259 OID 4665872)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 4665871)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2440 (class 1259 OID 4665874)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2441 (class 1259 OID 4665870)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2442 (class 1259 OID 4665873)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4665742)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4665628)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4665627)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4665625)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4665626)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2434 (class 1259 OID 4665864)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 4665863)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4665542)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4665405)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4665404)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4665434)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4665435)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4665609)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4665608)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4665607)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4665574)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4665570)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4665567)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4665568)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4665566)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4665571)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4665569)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4665454)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4665524)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4665526)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4665525)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4665527)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4665634)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4665815)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4665427)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4665496)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4665684)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4665484)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4665803)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4665378)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4665573)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2467 (class 2606 OID 4666005)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 4665990)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2469 (class 2606 OID 4665995)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2465 (class 2606 OID 4666015)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2471 (class 2606 OID 4665985)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2466 (class 2606 OID 4666010)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2468 (class 2606 OID 4666000)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2452 (class 2606 OID 4665920)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2488 (class 2606 OID 4666100)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2486 (class 2606 OID 4666095)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2487 (class 2606 OID 4666090)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2464 (class 2606 OID 4665980)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2494 (class 2606 OID 4666140)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2496 (class 2606 OID 4666130)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4666135)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2484 (class 2606 OID 4666080)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2505 (class 2606 OID 4666175)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2504 (class 2606 OID 4666180)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2503 (class 2606 OID 4666185)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2506 (class 2606 OID 4666200)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2507 (class 2606 OID 4666195)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2508 (class 2606 OID 4666190)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2458 (class 2606 OID 4665955)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 4665950)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4665930)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4665925)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2449 (class 2606 OID 4665905)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2490 (class 2606 OID 4666110)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2472 (class 2606 OID 4666020)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2446 (class 2606 OID 4665885)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2445 (class 2606 OID 4665890)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2491 (class 2606 OID 4666125)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2492 (class 2606 OID 4666120)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2493 (class 2606 OID 4666115)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2462 (class 2606 OID 4665960)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4665970)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2461 (class 2606 OID 4665965)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2476 (class 2606 OID 4666055)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2478 (class 2606 OID 4666045)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2479 (class 2606 OID 4666040)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2477 (class 2606 OID 4666050)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2444 (class 2606 OID 4665875)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 4665880)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2489 (class 2606 OID 4666105)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2485 (class 2606 OID 4666085)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2499 (class 2606 OID 4666150)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2498 (class 2606 OID 4666155)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 4665940)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 4665935)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 4665945)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2501 (class 2606 OID 4666160)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 4666165)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2513 (class 2606 OID 4666225)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4666220)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2511 (class 2606 OID 4666235)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 4666215)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2512 (class 2606 OID 4666230)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2497 (class 2606 OID 4666145)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 4666075)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2481 (class 2606 OID 4666070)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2483 (class 2606 OID 4666060)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2482 (class 2606 OID 4666065)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2509 (class 2606 OID 4666210)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 4666205)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2463 (class 2606 OID 4665975)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4666170)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2447 (class 2606 OID 4665900)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 4665895)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2451 (class 2606 OID 4665910)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2450 (class 2606 OID 4665915)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2473 (class 2606 OID 4666035)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2474 (class 2606 OID 4666030)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2475 (class 2606 OID 4666025)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-22 12:29:01 CEST

--
-- PostgreSQL database dump complete
--

