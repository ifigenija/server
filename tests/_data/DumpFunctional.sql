--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-07 15:32:21 CEST

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
-- TOC entry 179 (class 1259 OID 2631889)
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
-- TOC entry 225 (class 1259 OID 2632371)
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
-- TOC entry 224 (class 1259 OID 2632354)
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
-- TOC entry 217 (class 1259 OID 2632269)
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
-- TOC entry 193 (class 1259 OID 2632054)
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
-- TOC entry 196 (class 1259 OID 2632095)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 2632016)
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
-- TOC entry 212 (class 1259 OID 2632220)
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
-- TOC entry 191 (class 1259 OID 2632041)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 2632089)
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
-- TOC entry 201 (class 1259 OID 2632138)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 2632163)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 2631990)
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
-- TOC entry 180 (class 1259 OID 2631898)
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
-- TOC entry 181 (class 1259 OID 2631909)
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
-- TOC entry 184 (class 1259 OID 2631960)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 2631863)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 2631882)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 2632170)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 2632200)
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
-- TOC entry 221 (class 1259 OID 2632311)
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
-- TOC entry 183 (class 1259 OID 2631940)
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
-- TOC entry 186 (class 1259 OID 2631982)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 2632144)
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
-- TOC entry 185 (class 1259 OID 2631967)
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
-- TOC entry 190 (class 1259 OID 2632033)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 2632156)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 2632260)
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
-- TOC entry 220 (class 1259 OID 2632304)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 2632185)
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
-- TOC entry 200 (class 1259 OID 2632129)
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
-- TOC entry 199 (class 1259 OID 2632119)
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
-- TOC entry 219 (class 1259 OID 2632294)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 2632250)
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
-- TOC entry 173 (class 1259 OID 2631833)
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
-- TOC entry 172 (class 1259 OID 2631831)
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
-- TOC entry 209 (class 1259 OID 2632194)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 2631873)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 2631856)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 2632208)
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
-- TOC entry 203 (class 1259 OID 2632150)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 2632100)
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
-- TOC entry 182 (class 1259 OID 2631932)
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
-- TOC entry 198 (class 1259 OID 2632106)
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
-- TOC entry 218 (class 1259 OID 2632285)
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
-- TOC entry 188 (class 1259 OID 2632002)
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
-- TOC entry 174 (class 1259 OID 2631842)
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
-- TOC entry 223 (class 1259 OID 2632336)
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
-- TOC entry 192 (class 1259 OID 2632048)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 2632177)
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
-- TOC entry 214 (class 1259 OID 2632242)
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
-- TOC entry 194 (class 1259 OID 2632076)
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
-- TOC entry 222 (class 1259 OID 2632326)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 2632233)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 2631836)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 2631889)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 2632371)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 2632354)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 2632269)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 2632054)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 2632095)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 2632016)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-554b-6964-be75-4ff102f7a73a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-554b-6964-45ea-2c5d0164724a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-554b-6965-ef8a-9fadbcb71f24	AL	ALB	008	Albania 	Albanija	\N
00040000-554b-6965-6bce-9db80eb5ae13	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-554b-6965-a3b4-3dc6f428f650	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-554b-6965-2184-f2dcb859c7c0	AD	AND	020	Andorra 	Andora	\N
00040000-554b-6965-e5ca-5c1492cd4d51	AO	AGO	024	Angola 	Angola	\N
00040000-554b-6965-7e50-9493a6e712b9	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-554b-6965-e001-19ffcd213243	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-554b-6965-6f50-68b0949d7dc2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-554b-6965-5fb0-a23e8cd7224c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-554b-6965-1d8c-398ee7330880	AM	ARM	051	Armenia 	Armenija	\N
00040000-554b-6965-b6c5-138f352170f7	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-554b-6965-73fe-e8a3918f8f5c	AU	AUS	036	Australia 	Avstralija	\N
00040000-554b-6965-f4b0-b9100276baad	AT	AUT	040	Austria 	Avstrija	\N
00040000-554b-6965-6399-691d84fde5d5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-554b-6965-6dea-15e4906f3e1f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-554b-6965-edec-4b530ce1103b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-554b-6965-b818-ba13e504e9ed	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-554b-6965-e500-891d2cfd06dd	BB	BRB	052	Barbados 	Barbados	\N
00040000-554b-6965-1477-def45236d27b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-554b-6965-a882-bf2e37d8fc94	BE	BEL	056	Belgium 	Belgija	\N
00040000-554b-6965-9ede-e04050970155	BZ	BLZ	084	Belize 	Belize	\N
00040000-554b-6965-695c-ed88223e7d3d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-554b-6965-88d6-68cc16fd832d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-554b-6965-2642-ecc7eebfffd1	BT	BTN	064	Bhutan 	Butan	\N
00040000-554b-6965-906f-4cc2032e51c0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-554b-6965-0a7c-ad884ffaf285	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-554b-6965-b593-c2e1ea4a796d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-554b-6965-4517-29b86b2b369e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-554b-6965-90db-1fd406979e51	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-554b-6965-51fa-a2459e265731	BR	BRA	076	Brazil 	Brazilija	\N
00040000-554b-6965-9f97-c347eab15750	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-554b-6965-df05-1fe3137a300b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-554b-6965-fb4a-8bbc94326588	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-554b-6965-c741-e4f41a7a9e70	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-554b-6965-9ecc-43042a24ad1a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-554b-6965-ffa4-8def8160640a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-554b-6965-73f6-42ec56685a0e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-554b-6965-d878-db4d140874ee	CA	CAN	124	Canada 	Kanada	\N
00040000-554b-6965-e651-e0e2aac9dbd2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-554b-6965-56b3-fa0c321f088a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-554b-6965-6593-591594f49882	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-554b-6965-3cd7-69fb8bf2b06c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-554b-6965-1cc2-09bab17774e1	CL	CHL	152	Chile 	Čile	\N
00040000-554b-6965-9d42-0f45d427ee1d	CN	CHN	156	China 	Kitajska	\N
00040000-554b-6965-ae34-f64d3e40f4b3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-554b-6965-5490-78c0b0cbeea7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-554b-6965-88fa-ea996b77fdac	CO	COL	170	Colombia 	Kolumbija	\N
00040000-554b-6965-228d-9070e5c49e4c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-554b-6965-e7ea-168721f3c51b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-554b-6965-ff44-f38ffcf284b4	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-554b-6965-7f4e-3806c53f63b0	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-554b-6965-f6c2-9f7e8f31e064	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-554b-6965-a2d7-bf52ff357d9c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-554b-6965-a229-22cd759597a2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-554b-6965-039d-502b630549d3	CU	CUB	192	Cuba 	Kuba	\N
00040000-554b-6965-81a5-3dfe313a02c0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-554b-6965-6406-bb21162e9e45	CY	CYP	196	Cyprus 	Ciper	\N
00040000-554b-6965-dc77-23a75c3f1b74	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-554b-6965-69c8-f5a32a535412	DK	DNK	208	Denmark 	Danska	\N
00040000-554b-6965-273f-c62f1b2226cf	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-554b-6965-7c81-f438278f0bf8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-554b-6965-52ff-059af41a1604	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-554b-6965-78f9-7e7defabcf37	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-554b-6965-aed3-c7ec679b8487	EG	EGY	818	Egypt 	Egipt	\N
00040000-554b-6965-9e37-75f12c69b51a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-554b-6965-ed9c-0c1c75c37b75	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-554b-6965-16df-668c36a20482	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-554b-6965-1b6d-922e329cb7d4	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-554b-6965-a6c3-637f949d9e0b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-554b-6965-764c-cd3d309ebb86	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-554b-6965-76cf-3fe922b53436	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-554b-6965-79c9-52809f8003f4	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-554b-6965-d67f-9ff68e87a938	FI	FIN	246	Finland 	Finska	\N
00040000-554b-6965-7397-0b2b9fb45108	FR	FRA	250	France 	Francija	\N
00040000-554b-6965-2acd-e206cb9068d1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-554b-6965-5977-b579c42fc1de	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-554b-6965-5f14-fc3f141c05a7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-554b-6965-d0d1-0824d4667849	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-554b-6965-5a4e-ae1c01312cf4	GA	GAB	266	Gabon 	Gabon	\N
00040000-554b-6965-f8f0-a4401a9dbe95	GM	GMB	270	Gambia 	Gambija	\N
00040000-554b-6965-5498-6b4f03b386c0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-554b-6965-0bc2-5ad37fa3a2fb	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-554b-6965-10a6-00a8a59ee8f4	GH	GHA	288	Ghana 	Gana	\N
00040000-554b-6965-0786-a4cb9307ea27	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-554b-6965-fd6a-efa662b8ef22	GR	GRC	300	Greece 	Grčija	\N
00040000-554b-6965-48d8-c95dbbf91d35	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-554b-6965-49ea-39e365c95617	GD	GRD	308	Grenada 	Grenada	\N
00040000-554b-6965-790c-de46e7a006cb	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-554b-6965-73c4-f406151874b7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-554b-6965-a708-93e2a1802456	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-554b-6965-a782-08664a65fd3f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-554b-6965-ae34-f709935c87ee	GN	GIN	324	Guinea 	Gvineja	\N
00040000-554b-6965-6c95-bf9cff52220c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-554b-6965-2898-abfa012eb3de	GY	GUY	328	Guyana 	Gvajana	\N
00040000-554b-6965-4958-fbf5392ce983	HT	HTI	332	Haiti 	Haiti	\N
00040000-554b-6965-bf05-43b6f2f17cdb	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-554b-6965-e99b-a2339e05e65b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-554b-6965-3689-645d804e7642	HN	HND	340	Honduras 	Honduras	\N
00040000-554b-6965-cb27-ce8b065a1c69	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-554b-6965-8559-52ec38d8f562	HU	HUN	348	Hungary 	Madžarska	\N
00040000-554b-6965-0365-16d15d3f3cdf	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-554b-6965-c4fe-1fe0b32cfcca	IN	IND	356	India 	Indija	\N
00040000-554b-6965-5bd2-81f2d9234ab9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-554b-6965-f7c6-8a8d1056a0d8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-554b-6965-03aa-4ada4a02dc77	IQ	IRQ	368	Iraq 	Irak	\N
00040000-554b-6965-0ff0-88aea3270e67	IE	IRL	372	Ireland 	Irska	\N
00040000-554b-6965-0ea3-a9436fd23a12	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-554b-6965-5a44-3e3142f66b2e	IL	ISR	376	Israel 	Izrael	\N
00040000-554b-6965-f7d0-0fef64abc152	IT	ITA	380	Italy 	Italija	\N
00040000-554b-6965-3946-d3575dcb520c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-554b-6965-761e-43dd81f94b55	JP	JPN	392	Japan 	Japonska	\N
00040000-554b-6965-19c9-29ad2d3fba81	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-554b-6965-d76f-5d919178cc78	JO	JOR	400	Jordan 	Jordanija	\N
00040000-554b-6965-29b7-c0efe0c3787f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-554b-6965-f9c0-fd27bc6c9998	KE	KEN	404	Kenya 	Kenija	\N
00040000-554b-6965-a71a-bb7670f48444	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-554b-6965-fea0-20139b84bb17	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-554b-6965-43f1-7dbd0dbac7ae	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-554b-6965-9514-f98d3b193a4b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-554b-6965-65fd-3fd79ae18271	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-554b-6965-ad3e-09ad50db4682	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-554b-6965-a63e-254a28611636	LV	LVA	428	Latvia 	Latvija	\N
00040000-554b-6965-88c5-563799ff54d2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-554b-6965-2625-33efcd29e273	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-554b-6965-b518-678f3232809f	LR	LBR	430	Liberia 	Liberija	\N
00040000-554b-6965-98b2-4f94d969f043	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-554b-6965-4a25-b6696ba5ab30	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-554b-6965-8c74-c79b70ce2866	LT	LTU	440	Lithuania 	Litva	\N
00040000-554b-6965-cf35-322e71a108e7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-554b-6965-d701-a32dfdac4a17	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-554b-6965-3f1d-cf61d7232067	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-554b-6965-a415-f3cb40e8a5d4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-554b-6965-e882-8d49dcd2b42b	MW	MWI	454	Malawi 	Malavi	\N
00040000-554b-6965-96df-1313f333896a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-554b-6965-1fbc-00cf396d8565	MV	MDV	462	Maldives 	Maldivi	\N
00040000-554b-6965-2f47-1159fbd0197c	ML	MLI	466	Mali 	Mali	\N
00040000-554b-6965-5850-73afc8c5605a	MT	MLT	470	Malta 	Malta	\N
00040000-554b-6965-2f9d-8097758aee47	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-554b-6965-c2a7-0c6e77eab714	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-554b-6965-bb0e-0ec86e5c1690	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-554b-6965-9886-ea81a4fa071e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-554b-6965-a06f-fa22a84534db	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-554b-6965-7b1e-fd166119b799	MX	MEX	484	Mexico 	Mehika	\N
00040000-554b-6965-87ce-33c74f640ca2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-554b-6965-46e9-28e5435bdab3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-554b-6965-f7aa-50a692292f09	MC	MCO	492	Monaco 	Monako	\N
00040000-554b-6965-731e-90ee8cc4cb9a	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-554b-6965-1ce5-ddcf9c9ed900	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-554b-6965-1c7e-d7d39974eaa9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-554b-6965-3c71-f4610e9327fb	MA	MAR	504	Morocco 	Maroko	\N
00040000-554b-6965-ead8-16608917c380	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-554b-6965-8e36-971b28f7ab97	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-554b-6965-6c70-09c0d4f52137	NA	NAM	516	Namibia 	Namibija	\N
00040000-554b-6965-c9c8-ae76cebcac14	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-554b-6965-9f8d-5dc26032b169	NP	NPL	524	Nepal 	Nepal	\N
00040000-554b-6965-8dbd-7e4a87a1b9ce	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-554b-6965-1e84-660b7da53229	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-554b-6965-4307-b83aef7f1d0e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-554b-6965-ca71-47850e73f86c	NE	NER	562	Niger 	Niger 	\N
00040000-554b-6965-9079-3889c0d1beb5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-554b-6965-b34a-56ed2df13df0	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-554b-6965-df88-e145dba3f42d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-554b-6965-a9a4-63bfd96579ea	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-554b-6965-8acf-a8b7298450a9	NO	NOR	578	Norway 	Norveška	\N
00040000-554b-6965-309d-770b4eee2d31	OM	OMN	512	Oman 	Oman	\N
00040000-554b-6965-b9d7-af574eea68fd	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-554b-6965-ee68-573b41b2a807	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-554b-6965-dc17-e4f5e98a430e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-554b-6965-fc73-00647d640dc4	PA	PAN	591	Panama 	Panama	\N
00040000-554b-6965-aaf6-daef8f65c970	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-554b-6965-4d39-43e97b48b344	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-554b-6965-ade1-3051be7a5f8f	PE	PER	604	Peru 	Peru	\N
00040000-554b-6965-d98d-e477946f2235	PH	PHL	608	Philippines 	Filipini	\N
00040000-554b-6965-81c8-f0c98b0a87dc	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-554b-6965-cc88-4bc0a305c863	PL	POL	616	Poland 	Poljska	\N
00040000-554b-6965-2908-b7cb21d5156f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-554b-6965-4bd7-4e8a521e4e6a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-554b-6965-414e-ebeb46665c82	QA	QAT	634	Qatar 	Katar	\N
00040000-554b-6965-3150-66d6487ce785	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-554b-6965-3a08-8d7db9e52000	RO	ROU	642	Romania 	Romunija	\N
00040000-554b-6965-e892-07adb3f026c9	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-554b-6965-9343-9a3578d9cef1	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-554b-6965-c576-47bc7828327f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-554b-6965-9487-d59df9ed9b71	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-554b-6965-561f-49cbdf7e8015	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-554b-6965-8c3c-e2cf21d4ec9c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-554b-6965-f4f5-65ebe9403b4a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-554b-6965-6523-c97b9748bb08	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-554b-6965-e74d-0a2b38e4687c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-554b-6965-9aa1-273ffd568ffa	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-554b-6965-8a4c-fb5597cc7c4b	SM	SMR	674	San Marino 	San Marino	\N
00040000-554b-6965-a2b1-c2daf38950ee	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-554b-6965-8f2c-afd9a4dc5708	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-554b-6965-5e59-375b8f3b9b84	SN	SEN	686	Senegal 	Senegal	\N
00040000-554b-6965-8ac8-311de18d1374	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-554b-6965-9f60-6546bcd8f768	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-554b-6965-28a4-f8255c655a62	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-554b-6965-330d-51e8b336d931	SG	SGP	702	Singapore 	Singapur	\N
00040000-554b-6965-e810-13a42361d54a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-554b-6965-8f88-6e49c6f8975b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-554b-6965-a8c2-a93dd7798d65	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-554b-6965-ddfe-008d1fd6976c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-554b-6965-398d-34fd9102bb49	SO	SOM	706	Somalia 	Somalija	\N
00040000-554b-6965-fc53-00d8372c32a2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-554b-6965-f929-024b314d80cf	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-554b-6965-0b8b-cefae17ddc40	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-554b-6965-a393-3bc37142a5b6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-554b-6965-259c-b00211fa5c3e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-554b-6965-2636-bd4eaacc549b	SD	SDN	729	Sudan 	Sudan	\N
00040000-554b-6965-d9f1-b75629e8eca2	SR	SUR	740	Suriname 	Surinam	\N
00040000-554b-6965-4262-b767ee0f4a46	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-554b-6965-5e3f-5349d65187b9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-554b-6965-9f7b-94ac0afb9303	SE	SWE	752	Sweden 	Švedska	\N
00040000-554b-6965-3beb-c252823252bc	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-554b-6965-1af8-1f8eab385f21	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-554b-6965-1458-2f31ba26db87	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-554b-6965-fb7f-4e832e60fc03	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-554b-6965-3eea-ae923ebbb67e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-554b-6965-1f06-5dbc2cd03f08	TH	THA	764	Thailand 	Tajska	\N
00040000-554b-6965-eba6-f70674188dd9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-554b-6965-5bf5-0664f228dbdd	TG	TGO	768	Togo 	Togo	\N
00040000-554b-6965-94e6-1be1353c5f94	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-554b-6965-04b0-1f4b2cb56dda	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-554b-6965-e4b8-d40637d50c27	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-554b-6965-123f-f8519bc09562	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-554b-6965-73c7-3cbafb10a655	TR	TUR	792	Turkey 	Turčija	\N
00040000-554b-6965-ebb1-e4a4072ae8d8	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-554b-6965-b8b4-cf246decfbdd	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-554b-6965-ff08-5c9bb7e2908c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-554b-6965-61c8-002475a0d866	UG	UGA	800	Uganda 	Uganda	\N
00040000-554b-6965-47d9-e652865c3682	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-554b-6965-fb45-f1595ed2fc8d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-554b-6965-f896-9df2f0407d28	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-554b-6965-1d6b-e1aeb8a9cb38	US	USA	840	United States 	Združene države Amerike	\N
00040000-554b-6965-3eee-14ef451d1dd9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-554b-6965-c496-effeb0360e7f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-554b-6965-00c7-abe45077af14	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-554b-6965-0d22-8676ab6569c2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-554b-6965-1490-2b8c6901504e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-554b-6965-88e4-b7efa83a60e4	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-554b-6965-8175-a8a23d4e5ac9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-554b-6965-8eb5-b3b9b56cce40	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-554b-6965-d6c2-6e153eec9c98	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-554b-6965-826e-70e09684228e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-554b-6965-f753-704a5da9e47f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-554b-6965-a530-6b072dbbc57e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-554b-6965-b46c-fbf330806484	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 2632220)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 2632041)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 2632089)
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
-- TOC entry 2658 (class 0 OID 2632138)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 2632163)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 2631990)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-554b-6965-7022-699952b4d5cf	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-554b-6965-0add-e45aa44bb293	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-554b-6965-3571-04a30c9da3de	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-554b-6965-75a3-cc22e53bdcc7	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-554b-6965-18d6-e169026b6fa4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-554b-6965-0296-5051305d4906	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-554b-6965-e170-3a439110964a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-554b-6965-639f-674413880400	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-554b-6965-72c9-2ab92b5b3843	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-554b-6965-93ae-373f45aa3d63	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 2631898)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-554b-6965-399e-3ad9c7dd2949	00000000-554b-6965-18d6-e169026b6fa4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-554b-6965-d6ce-5920b2089279	00000000-554b-6965-18d6-e169026b6fa4	00010000-554b-6965-888d-79fbbccf4fb6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-554b-6965-eb17-5a337304ee20	00000000-554b-6965-0296-5051305d4906	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 2631909)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 2631960)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 2631863)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-554b-6965-9fc4-0943739e8a9b	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-554b-6965-bf80-922aacd3dddc	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-554b-6965-f41e-5ccbf5f08f9c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-554b-6965-8810-67e90f355e53	Abonma-read	Abonma - branje	f
00030000-554b-6965-8078-e9b0df0b05f8	Abonma-write	Abonma - spreminjanje	f
00030000-554b-6965-e089-e86c01bf700c	Alternacija-read	Alternacija - branje	f
00030000-554b-6965-afa5-aba69a5e805d	Alternacija-write	Alternacija - spreminjanje	f
00030000-554b-6965-070b-be78a5b43eb1	Arhivalija-read	Arhivalija - branje	f
00030000-554b-6965-284f-a11b345f89cf	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-554b-6965-13e1-6e4925271db9	Besedilo-read	Besedilo - branje	f
00030000-554b-6965-0c16-82fce8d85d13	Besedilo-write	Besedilo - spreminjanje	f
00030000-554b-6965-b6fa-23c619ae1709	DogodekIzven-read	DogodekIzven - branje	f
00030000-554b-6965-c6fb-f5827ed23eb4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-554b-6965-3e5b-e3bcad133ff1	Dogodek-read	Dogodek - branje	f
00030000-554b-6965-6031-43ecb042f97c	Dogodek-write	Dogodek - spreminjanje	f
00030000-554b-6965-755c-83c052cc2e9b	Drzava-read	Drzava - branje	f
00030000-554b-6965-6d39-128bd709b42c	Drzava-write	Drzava - spreminjanje	f
00030000-554b-6965-ecf5-eceba4103cc6	Funkcija-read	Funkcija - branje	f
00030000-554b-6965-f322-70aa2278850d	Funkcija-write	Funkcija - spreminjanje	f
00030000-554b-6965-34f3-c3873b0bc916	Gostovanje-read	Gostovanje - branje	f
00030000-554b-6965-4c89-edf0c5e85aa1	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-554b-6965-62eb-df8c2ef07e4a	Gostujoca-read	Gostujoca - branje	f
00030000-554b-6965-43b3-81b65e7d0183	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-554b-6965-75ff-86a7a89e93b9	Kupec-read	Kupec - branje	f
00030000-554b-6965-2c27-8cbc77be4253	Kupec-write	Kupec - spreminjanje	f
00030000-554b-6965-748f-32ff7e7b7d80	NacinPlacina-read	NacinPlacina - branje	f
00030000-554b-6965-76b8-79f07199d078	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-554b-6965-2aaa-bdc29a877b84	Option-read	Option - branje	f
00030000-554b-6965-c722-a0f1d3c3dd67	Option-write	Option - spreminjanje	f
00030000-554b-6965-6306-b8945e4e4972	OptionValue-read	OptionValue - branje	f
00030000-554b-6965-e2e6-1b9bb925e92f	OptionValue-write	OptionValue - spreminjanje	f
00030000-554b-6965-5502-b25da0943e17	Oseba-read	Oseba - branje	f
00030000-554b-6965-cbb7-5c571166434f	Oseba-write	Oseba - spreminjanje	f
00030000-554b-6965-3fdb-c9608a8cf9b1	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-554b-6965-78dc-929d0e310471	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-554b-6965-4605-2d909a0e7f8a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-554b-6965-3cce-976a79194088	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-554b-6965-388b-32a6a024ed52	Pogodba-read	Pogodba - branje	f
00030000-554b-6965-c3ac-8ab34593cb3e	Pogodba-write	Pogodba - spreminjanje	f
00030000-554b-6965-5a87-f6c2a647e2c0	Popa-read	Popa - branje	f
00030000-554b-6965-60c4-e87eaac48f9a	Popa-write	Popa - spreminjanje	f
00030000-554b-6965-c247-0393fcd40998	Posta-read	Posta - branje	f
00030000-554b-6965-c360-d8643f5aa43c	Posta-write	Posta - spreminjanje	f
00030000-554b-6965-4f00-d3775a52efe8	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-554b-6965-5522-ae235da51d7f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-554b-6965-16d1-6237bb57ef93	PostniNaslov-read	PostniNaslov - branje	f
00030000-554b-6965-1596-f9b48ec1b7ba	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-554b-6965-0c91-3d1afded73c7	Predstava-read	Predstava - branje	f
00030000-554b-6965-780e-45eccb55d6a7	Predstava-write	Predstava - spreminjanje	f
00030000-554b-6965-33e8-69fc497e8aeb	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-554b-6965-51d4-83cb8c90468c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-554b-6965-424e-bad7f4bd5847	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-554b-6965-288a-234c423f9c19	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-554b-6965-3887-cb5fcfca2377	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-554b-6965-5372-a0a3f14eab54	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-554b-6965-225c-bab5f728d123	Prostor-read	Prostor - branje	f
00030000-554b-6965-df7c-b5c81c7389e9	Prostor-write	Prostor - spreminjanje	f
00030000-554b-6965-447c-6afd2fd9065e	Racun-read	Racun - branje	f
00030000-554b-6965-62bb-bb74592cc842	Racun-write	Racun - spreminjanje	f
00030000-554b-6965-e67d-1631ed2c1268	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-554b-6965-704c-a44b71915595	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-554b-6965-9ee5-d8edac630038	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-554b-6965-dbc0-575a0ab61a4a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-554b-6965-6099-0db50c119b82	Rekvizit-read	Rekvizit - branje	f
00030000-554b-6965-f57f-4275baa008b6	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-554b-6965-8946-b20dad320d6c	Rezervacija-read	Rezervacija - branje	f
00030000-554b-6965-2c63-2d38712a3c8e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-554b-6965-9adc-f6cb6f067808	SedezniRed-read	SedezniRed - branje	f
00030000-554b-6965-b71b-f8d1ee312d6f	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-554b-6965-c349-5336c15212d8	Sedez-read	Sedez - branje	f
00030000-554b-6965-8c2f-8ab42c9616ca	Sedez-write	Sedez - spreminjanje	f
00030000-554b-6965-8f5a-0594c3c71dc0	Sezona-read	Sezona - branje	f
00030000-554b-6965-4715-fb91fca58667	Sezona-write	Sezona - spreminjanje	f
00030000-554b-6965-4e58-a9313237b1da	Telefonska-read	Telefonska - branje	f
00030000-554b-6965-ff9a-d10007eedb60	Telefonska-write	Telefonska - spreminjanje	f
00030000-554b-6965-e72c-c1e6fb8cc957	TerminStoritve-read	TerminStoritve - branje	f
00030000-554b-6965-2cac-1e2875347d81	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-554b-6965-dd86-7e758dab00f1	TipFunkcije-read	TipFunkcije - branje	f
00030000-554b-6965-47f2-9cfd4908a2ec	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-554b-6965-64ab-71950834f7d8	Trr-read	Trr - branje	f
00030000-554b-6965-cee2-382fcc06268a	Trr-write	Trr - spreminjanje	f
00030000-554b-6965-c639-8a78489321a7	Uprizoritev-read	Uprizoritev - branje	f
00030000-554b-6965-78d6-2a02bc5ff4fa	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-554b-6965-6439-8c8d2f74d51a	Vaja-read	Vaja - branje	f
00030000-554b-6965-4ce4-dad66dcbe791	Vaja-write	Vaja - spreminjanje	f
00030000-554b-6965-9420-9ae3b9708c6d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-554b-6965-030e-7711189b3c0b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-554b-6965-fe53-b1a353f3b701	Zaposlitev-read	Zaposlitev - branje	f
00030000-554b-6965-0402-83f8a908bd83	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-554b-6965-3480-6cf4bbccf133	Zasedenost-read	Zasedenost - branje	f
00030000-554b-6965-7c8e-5a101af38384	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-554b-6965-cc90-f2b4c06b2840	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-554b-6965-e430-beb43323d9ba	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-554b-6965-dc94-a7a6ee735165	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-554b-6965-96b5-0e7e441ab974	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 2631882)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-554b-6965-d79f-35971ee46a53	00030000-554b-6965-755c-83c052cc2e9b
00020000-554b-6965-e0d9-80f70522250b	00030000-554b-6965-6d39-128bd709b42c
00020000-554b-6965-e0d9-80f70522250b	00030000-554b-6965-755c-83c052cc2e9b
\.


--
-- TOC entry 2663 (class 0 OID 2632170)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 2632200)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 2632311)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 2631940)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 2631982)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-554b-6964-e2ca-f7bc8857d85d	8341	Adlešiči
00050000-554b-6964-2e7d-1296600b4d67	5270	Ajdovščina
00050000-554b-6964-0155-4a1aeb53f7e0	6280	Ankaran/Ancarano
00050000-554b-6964-3b97-61101d105796	9253	Apače
00050000-554b-6964-7459-bedf531a99f7	8253	Artiče
00050000-554b-6964-34e6-2b618c6a9419	4275	Begunje na Gorenjskem
00050000-554b-6964-214f-13d83fc48833	1382	Begunje pri Cerknici
00050000-554b-6964-60ac-e046fdcb1269	9231	Beltinci
00050000-554b-6964-f81d-3ad7425a86c3	2234	Benedikt
00050000-554b-6964-c742-74ea2b2c28fb	2345	Bistrica ob Dravi
00050000-554b-6964-ce9b-56515e1c2615	3256	Bistrica ob Sotli
00050000-554b-6964-fc5c-fc07eca5fccb	8259	Bizeljsko
00050000-554b-6964-2859-0cde809d67a2	1223	Blagovica
00050000-554b-6964-de21-5c2c555dcd1d	8283	Blanca
00050000-554b-6964-bc72-aa7546d51700	4260	Bled
00050000-554b-6964-1e31-4ade7d4dc092	4273	Blejska Dobrava
00050000-554b-6964-9e5c-a4294c49f5b4	9265	Bodonci
00050000-554b-6964-1119-4b07b1a88132	9222	Bogojina
00050000-554b-6964-ef48-60b96bcfbb31	4263	Bohinjska Bela
00050000-554b-6964-91f9-f011b0e293d9	4264	Bohinjska Bistrica
00050000-554b-6964-2411-babc400341d0	4265	Bohinjsko jezero
00050000-554b-6964-8741-aa92d7c4d822	1353	Borovnica
00050000-554b-6964-0dc2-2a7adab904a2	8294	Boštanj
00050000-554b-6964-40e3-f2e2a443d56a	5230	Bovec
00050000-554b-6964-ce3b-833a837ebcbe	5295	Branik
00050000-554b-6964-145d-7e624e6b44df	3314	Braslovče
00050000-554b-6964-2ad4-b93c3871c753	5223	Breginj
00050000-554b-6964-d703-b4df37064326	8280	Brestanica
00050000-554b-6964-2889-faa773caca7d	2354	Bresternica
00050000-554b-6964-6456-e5ccd1a3fcc4	4243	Brezje
00050000-554b-6964-e542-45b1f3ac3e44	1351	Brezovica pri Ljubljani
00050000-554b-6964-a36e-6469e8e56230	8250	Brežice
00050000-554b-6964-26df-15fdcaf5851a	4210	Brnik - Aerodrom
00050000-554b-6964-3474-5f542af57f99	8321	Brusnice
00050000-554b-6964-1d3f-e7fac15b531d	3255	Buče
00050000-554b-6964-c59c-01b89ee81440	8276	Bučka 
00050000-554b-6964-9c51-6e67e63c07e7	9261	Cankova
00050000-554b-6964-edf9-58caf4fffedd	3000	Celje 
00050000-554b-6964-2151-60b97a6a36f0	3001	Celje - poštni predali
00050000-554b-6964-c499-fc40294d2c92	4207	Cerklje na Gorenjskem
00050000-554b-6964-9a00-150b668edf92	8263	Cerklje ob Krki
00050000-554b-6964-04c5-9fa34b123777	1380	Cerknica
00050000-554b-6964-96c7-b3e7c40907f8	5282	Cerkno
00050000-554b-6964-c186-3fc4448aff96	2236	Cerkvenjak
00050000-554b-6964-7358-ae4c96f603a8	2215	Ceršak
00050000-554b-6964-342d-a89a4718b9b2	2326	Cirkovce
00050000-554b-6964-8c49-bab59acf8844	2282	Cirkulane
00050000-554b-6964-1c77-30128b1b0903	5273	Col
00050000-554b-6964-7dcf-407903a35cc8	8251	Čatež ob Savi
00050000-554b-6964-8765-4c612fc3c544	1413	Čemšenik
00050000-554b-6964-8802-a491b4de6ad6	5253	Čepovan
00050000-554b-6964-f09d-a41f97846ed9	9232	Črenšovci
00050000-554b-6964-5393-99cd790ae8c0	2393	Črna na Koroškem
00050000-554b-6964-4031-d594a0095bdb	6275	Črni Kal
00050000-554b-6964-2ca3-9a0bdbbf4b5b	5274	Črni Vrh nad Idrijo
00050000-554b-6964-bb00-49e7669f4ebc	5262	Črniče
00050000-554b-6964-5be4-8b3bb5bc74b6	8340	Črnomelj
00050000-554b-6964-0486-2e9c774584ef	6271	Dekani
00050000-554b-6964-c62d-355eec347dd3	5210	Deskle
00050000-554b-6964-4ff7-1e7c2f0d15ff	2253	Destrnik
00050000-554b-6964-143b-f144368c4963	6215	Divača
00050000-554b-6964-2bc5-0f2102bd206f	1233	Dob
00050000-554b-6964-e769-fa1851cf39ac	3224	Dobje pri Planini
00050000-554b-6964-0d18-9557dc953c3f	8257	Dobova
00050000-554b-6964-625e-9814fc8715e1	1423	Dobovec
00050000-554b-6964-3816-3f6c2f2e4c7f	5263	Dobravlje
00050000-554b-6964-dc47-1d474ab5e6b9	3204	Dobrna
00050000-554b-6964-e4ff-92142578d904	8211	Dobrnič
00050000-554b-6964-3743-4c1d3d21f298	1356	Dobrova
00050000-554b-6964-440c-9a7012d755db	9223	Dobrovnik/Dobronak 
00050000-554b-6964-e7b4-d6f276796fb1	5212	Dobrovo v Brdih
00050000-554b-6964-addd-e262c6b66e38	1431	Dol pri Hrastniku
00050000-554b-6964-1e1f-ebbbf13f8653	1262	Dol pri Ljubljani
00050000-554b-6964-1903-f2d898f03ada	1273	Dole pri Litiji
00050000-554b-6964-99c7-755c265fa759	1331	Dolenja vas
00050000-554b-6964-3584-9086e0b4f49b	8350	Dolenjske Toplice
00050000-554b-6964-3b24-bbeae2251fc8	1230	Domžale
00050000-554b-6964-61f7-246c26431459	2252	Dornava
00050000-554b-6964-4da1-a53886bc3aae	5294	Dornberk
00050000-554b-6964-1f26-3ed023d606e2	1319	Draga
00050000-554b-6964-8406-80573e8b3ffa	8343	Dragatuš
00050000-554b-6964-e274-23336aee2c0d	3222	Dramlje
00050000-554b-6964-a28f-ee29c4d695e2	2370	Dravograd
00050000-554b-6964-47e1-31a21eaef294	4203	Duplje
00050000-554b-6964-6d70-6a699b14b0a0	6221	Dutovlje
00050000-554b-6964-e200-1efdb1764620	8361	Dvor
00050000-554b-6964-1e38-8becde0a4aaf	2343	Fala
00050000-554b-6964-81be-d57c45b56daf	9208	Fokovci
00050000-554b-6964-1a6d-602c4c93fdee	2313	Fram
00050000-554b-6964-a1ef-65f6d731c77b	3213	Frankolovo
00050000-554b-6964-2280-87cffe598b7a	1274	Gabrovka
00050000-554b-6964-1ab9-0f6d5796b35b	8254	Globoko
00050000-554b-6964-656e-627fbb5cb1c7	5275	Godovič
00050000-554b-6964-5219-8771b3f87f22	4204	Golnik
00050000-554b-6964-3ccc-0ee2d8c7da74	3303	Gomilsko
00050000-554b-6964-0f05-c2aefd7825f9	4224	Gorenja vas
00050000-554b-6964-16f4-1b552144bf22	3263	Gorica pri Slivnici
00050000-554b-6964-7c9a-1813ba75d8d5	2272	Gorišnica
00050000-554b-6964-cff3-7abbbb9d1c56	9250	Gornja Radgona
00050000-554b-6964-33dc-378f3b023ceb	3342	Gornji Grad
00050000-554b-6964-2f80-22107360608d	4282	Gozd Martuljek
00050000-554b-6964-f151-50436b933d0e	6272	Gračišče
00050000-554b-6964-e69d-013976b7a669	9264	Grad
00050000-554b-6964-3c67-23b29ab00268	8332	Gradac
00050000-554b-6964-5fe4-26f2a10ca40f	1384	Grahovo
00050000-554b-6964-e811-c29592423a95	5242	Grahovo ob Bači
00050000-554b-6964-b78f-676833dc4ea3	5251	Grgar
00050000-554b-6964-28a2-74b1b8c5d30d	3302	Griže
00050000-554b-6964-eb69-aea248b788ee	3231	Grobelno
00050000-554b-6964-1898-8e557b98f862	1290	Grosuplje
00050000-554b-6964-8330-7d10e52877ba	2288	Hajdina
00050000-554b-6964-1796-8e75b46c10d2	8362	Hinje
00050000-554b-6964-65e9-ac8e6576879a	2311	Hoče
00050000-554b-6964-f5ef-aaccc097c5b3	9205	Hodoš/Hodos
00050000-554b-6964-e426-f78a28c3630e	1354	Horjul
00050000-554b-6964-35c5-7dfb2a1ae1af	1372	Hotedršica
00050000-554b-6964-fc25-f1d046fc7362	1430	Hrastnik
00050000-554b-6964-b0de-8367a60af04e	6225	Hruševje
00050000-554b-6964-cbb6-8f2c5525dfa1	4276	Hrušica
00050000-554b-6964-9805-4b1b8d4e2a9f	5280	Idrija
00050000-554b-6964-ecb4-cf56ccc3b99b	1292	Ig
00050000-554b-6964-8d0b-3c80bbb908a9	6250	Ilirska Bistrica
00050000-554b-6964-e758-e1f4db6266ff	6251	Ilirska Bistrica-Trnovo
00050000-554b-6964-b54a-34db0736463b	1295	Ivančna Gorica
00050000-554b-6964-0bf3-1ac0f608cf2b	2259	Ivanjkovci
00050000-554b-6964-2177-7cd0ed650b5b	1411	Izlake
00050000-554b-6964-cf0d-19514c2632d3	6310	Izola/Isola
00050000-554b-6964-2ac0-85920ec35c6c	2222	Jakobski Dol
00050000-554b-6964-12d6-fe4e586bde17	2221	Jarenina
00050000-554b-6964-cf3d-b7a982fe58bd	6254	Jelšane
00050000-554b-6964-bcc7-8f50ad703dd7	4270	Jesenice
00050000-554b-6964-72ae-3379d8e4c559	8261	Jesenice na Dolenjskem
00050000-554b-6964-dc13-75cf3d7c1c3c	3273	Jurklošter
00050000-554b-6964-9e03-d1838e7a53a5	2223	Jurovski Dol
00050000-554b-6964-6e89-b82c4cbd3edd	2256	Juršinci
00050000-554b-6964-ae11-f18411280f6b	5214	Kal nad Kanalom
00050000-554b-6964-e14c-591ba6e194e8	3233	Kalobje
00050000-554b-6964-8960-64cd2fe787a9	4246	Kamna Gorica
00050000-554b-6964-46cc-ac99f96ae75f	2351	Kamnica
00050000-554b-6964-6ed9-68766369e53d	1241	Kamnik
00050000-554b-6964-569a-0de56da3ed32	5213	Kanal
00050000-554b-6964-0262-08c45af65c4a	8258	Kapele
00050000-554b-6964-3194-65bfb18d4ee1	2362	Kapla
00050000-554b-6964-db96-04d6a2e891a4	2325	Kidričevo
00050000-554b-6964-57cc-ef1c59c317d4	1412	Kisovec
00050000-554b-6964-1703-445269e0d92a	6253	Knežak
00050000-554b-6964-a7a2-3522410cbdf8	5222	Kobarid
00050000-554b-6964-a436-708cc088417e	9227	Kobilje
00050000-554b-6964-f8b2-26add76e68ae	1330	Kočevje
00050000-554b-6964-c717-3b1d1e62050d	1338	Kočevska Reka
00050000-554b-6964-fd11-0fdf5d4a7ab2	2276	Kog
00050000-554b-6964-4c40-c9394443bb97	5211	Kojsko
00050000-554b-6964-b458-cc9338eed2fe	6223	Komen
00050000-554b-6964-f7df-ec1892c1eed0	1218	Komenda
00050000-554b-6964-8738-ec935bf0168d	6000	Koper/Capodistria 
00050000-554b-6964-613e-cc56e96fb5ff	6001	Koper/Capodistria - poštni predali
00050000-554b-6964-26dc-77f835019ba2	8282	Koprivnica
00050000-554b-6964-ba9d-1524f2ec38f6	5296	Kostanjevica na Krasu
00050000-554b-6964-503e-7ed5d0745be0	8311	Kostanjevica na Krki
00050000-554b-6964-cf24-241f403c5576	1336	Kostel
00050000-554b-6964-7b64-ceca4c0e7a87	6256	Košana
00050000-554b-6964-454d-35922850deaa	2394	Kotlje
00050000-554b-6964-6833-7abd5e0677b6	6240	Kozina
00050000-554b-6964-4fdc-f8a3e71df03a	3260	Kozje
00050000-554b-6964-ba36-ee17766c554d	4000	Kranj 
00050000-554b-6964-ec50-29c5cb5ccc63	4001	Kranj - poštni predali
00050000-554b-6964-6d01-f2bea2cb913a	4280	Kranjska Gora
00050000-554b-6964-4ce6-3d4cb63b88a1	1281	Kresnice
00050000-554b-6964-64b0-6adff8cf3094	4294	Križe
00050000-554b-6964-f2ed-7ca2a74ea43f	9206	Križevci
00050000-554b-6964-8f18-3b96604954cb	9242	Križevci pri Ljutomeru
00050000-554b-6964-ac1a-cac05871f1e8	1301	Krka
00050000-554b-6964-f040-c3db842b88fe	8296	Krmelj
00050000-554b-6964-a5dc-be37c158bda1	4245	Kropa
00050000-554b-6964-5e23-ceb418c39712	8262	Krška vas
00050000-554b-6964-1cdd-c796df7c0e27	8270	Krško
00050000-554b-6964-8ddd-614889a47159	9263	Kuzma
00050000-554b-6964-f2b4-2e541310dead	2318	Laporje
00050000-554b-6964-1409-417b64456411	3270	Laško
00050000-554b-6964-c10b-a8a4eba04445	1219	Laze v Tuhinju
00050000-554b-6964-9719-e886904d50f3	2230	Lenart v Slovenskih goricah
00050000-554b-6964-b6fc-5bb850b5ae94	9220	Lendava/Lendva
00050000-554b-6964-daae-96006a46aae4	4248	Lesce
00050000-554b-6964-a2ec-3bc6dac5df6d	3261	Lesično
00050000-554b-6964-86f9-b8bd6de7ac23	8273	Leskovec pri Krškem
00050000-554b-6964-6f30-e8e8b2b977c9	2372	Libeliče
00050000-554b-6964-f192-f88e125bcb76	2341	Limbuš
00050000-554b-6964-f98d-c3161b07e7d8	1270	Litija
00050000-554b-6964-69d2-6e2660429b7a	3202	Ljubečna
00050000-554b-6964-978b-f5b943c884dc	1000	Ljubljana 
00050000-554b-6964-c64a-faa2f5506cfb	1001	Ljubljana - poštni predali
00050000-554b-6964-3360-d080e6477045	1231	Ljubljana - Črnuče
00050000-554b-6964-43dd-c08753135d58	1261	Ljubljana - Dobrunje
00050000-554b-6964-7f5a-13329247bd0c	1260	Ljubljana - Polje
00050000-554b-6964-c857-25981a10ec99	1210	Ljubljana - Šentvid
00050000-554b-6964-3fca-b8fe2ab156d0	1211	Ljubljana - Šmartno
00050000-554b-6964-53b4-a437f28555d8	3333	Ljubno ob Savinji
00050000-554b-6964-ced7-e67a217c0d7f	9240	Ljutomer
00050000-554b-6964-e5c2-21900fb1e24c	3215	Loče
00050000-554b-6964-aea2-381db9339269	5231	Log pod Mangartom
00050000-554b-6964-da56-d23475c3cfc3	1358	Log pri Brezovici
00050000-554b-6964-ee20-1c1a4e40e1a4	1370	Logatec
00050000-554b-6964-4fa5-ab96756f7442	1371	Logatec
00050000-554b-6964-c2ff-8293a86c5dac	1434	Loka pri Zidanem Mostu
00050000-554b-6964-a491-1080172de6c3	3223	Loka pri Žusmu
00050000-554b-6964-dcff-e5705efbf1ce	6219	Lokev
00050000-554b-6964-cfe4-56858deb9565	1318	Loški Potok
00050000-554b-6964-7792-6a5c8fca9c7c	2324	Lovrenc na Dravskem polju
00050000-554b-6964-e42c-31e029cfc2f3	2344	Lovrenc na Pohorju
00050000-554b-6964-b540-5438833f47ea	3334	Luče
00050000-554b-6964-c6d4-c30e3d21be48	1225	Lukovica
00050000-554b-6964-151f-17d3e5432080	9202	Mačkovci
00050000-554b-6964-9582-743cbc235543	2322	Majšperk
00050000-554b-6964-3923-0eae0875c388	2321	Makole
00050000-554b-6964-937b-1b9dd53cf562	9243	Mala Nedelja
00050000-554b-6964-2c84-4d1075057495	2229	Malečnik
00050000-554b-6964-80f5-4f23f845f74a	6273	Marezige
00050000-554b-6964-d54a-475a4b194632	2000	Maribor 
00050000-554b-6964-08dd-20b55aad28f7	2001	Maribor - poštni predali
00050000-554b-6964-95d3-28eddce5ab56	2206	Marjeta na Dravskem polju
00050000-554b-6964-7224-75851f18d84e	2281	Markovci
00050000-554b-6964-5eb1-94383bcb892a	9221	Martjanci
00050000-554b-6964-29c3-b420944acb80	6242	Materija
00050000-554b-6964-bfe0-a2b61be6ae76	4211	Mavčiče
00050000-554b-6964-761a-176caabda907	1215	Medvode
00050000-554b-6964-2a20-5dd74ecbc032	1234	Mengeš
00050000-554b-6964-fb52-37c3c1dfe855	8330	Metlika
00050000-554b-6964-e4da-30ec0c2cf510	2392	Mežica
00050000-554b-6964-1d0f-b2f93f0dcc22	2204	Miklavž na Dravskem polju
00050000-554b-6964-3af7-c7b6fe4f1b00	2275	Miklavž pri Ormožu
00050000-554b-6964-73b4-8008c516cb9a	5291	Miren
00050000-554b-6964-c68e-50d79a7dcd68	8233	Mirna
00050000-554b-6964-2522-dd60e24803d0	8216	Mirna Peč
00050000-554b-6964-bc76-05000c419d70	2382	Mislinja
00050000-554b-6964-33fb-655005f4381b	4281	Mojstrana
00050000-554b-6964-6bb1-6033e2863d0c	8230	Mokronog
00050000-554b-6964-1430-f61073f965a4	1251	Moravče
00050000-554b-6964-a16d-2dfe719a8025	9226	Moravske Toplice
00050000-554b-6964-a5a0-a3fce8fff72f	5216	Most na Soči
00050000-554b-6964-16df-b314052a886a	1221	Motnik
00050000-554b-6964-5811-665cdd580305	3330	Mozirje
00050000-554b-6964-5ded-93d01fbf9c96	9000	Murska Sobota 
00050000-554b-6964-b7ef-f67a94806640	9001	Murska Sobota - poštni predali
00050000-554b-6964-fdd7-f602c1ee782e	2366	Muta
00050000-554b-6964-fe3c-b488e2bef4e9	4202	Naklo
00050000-554b-6964-c01e-6be4a365cf1c	3331	Nazarje
00050000-554b-6964-4ade-55f6325370ba	1357	Notranje Gorice
00050000-554b-6964-a512-80f468548959	3203	Nova Cerkev
00050000-554b-6964-0e68-b640266ba6f7	5000	Nova Gorica 
00050000-554b-6964-b0be-c97770f4ac23	5001	Nova Gorica - poštni predali
00050000-554b-6964-d17b-db6900e4c834	1385	Nova vas
00050000-554b-6964-c3dc-2cb7e7a71fdc	8000	Novo mesto
00050000-554b-6964-f996-d107cba8341e	8001	Novo mesto - poštni predali
00050000-554b-6964-fd89-c81a0f9f0bf5	6243	Obrov
00050000-554b-6964-81a4-769d38631e71	9233	Odranci
00050000-554b-6964-3220-fb717910af24	2317	Oplotnica
00050000-554b-6964-5a5b-9c6df4060411	2312	Orehova vas
00050000-554b-6964-f4a8-d70dd1254aa3	2270	Ormož
00050000-554b-6964-5d15-4d2944bf8370	1316	Ortnek
00050000-554b-6964-99ed-5f3a941a2b68	1337	Osilnica
00050000-554b-6964-b7ff-8450517baa47	8222	Otočec
00050000-554b-6964-8584-ad143790c204	2361	Ožbalt
00050000-554b-6964-b289-4aaa185004f6	2231	Pernica
00050000-554b-6964-5682-00cffa6ca028	2211	Pesnica pri Mariboru
00050000-554b-6964-c1c2-69edfeb2bff2	9203	Petrovci
00050000-554b-6964-940d-a76b0ba38e60	3301	Petrovče
00050000-554b-6964-99b7-8178c44b164a	6330	Piran/Pirano
00050000-554b-6964-4cbd-4474e90b9a2c	8255	Pišece
00050000-554b-6964-2f90-62c91489e809	6257	Pivka
00050000-554b-6964-a601-920ef9200905	6232	Planina
00050000-554b-6964-bc66-d446ef1a891c	3225	Planina pri Sevnici
00050000-554b-6964-b7b9-d2fc84c5b507	6276	Pobegi
00050000-554b-6964-9d68-f0520d8c585a	8312	Podbočje
00050000-554b-6964-978a-95c9fc1cee67	5243	Podbrdo
00050000-554b-6964-6377-fad9f74567d9	3254	Podčetrtek
00050000-554b-6964-f5c3-053a7b44a6a2	2273	Podgorci
00050000-554b-6964-7494-aaec4858935a	6216	Podgorje
00050000-554b-6964-ab5c-dc963205104f	2381	Podgorje pri Slovenj Gradcu
00050000-554b-6964-56ad-2b9d325d09de	6244	Podgrad
00050000-554b-6964-b7c0-d4af4450ddea	1414	Podkum
00050000-554b-6964-682f-10ffb077fd1e	2286	Podlehnik
00050000-554b-6964-1a77-884ae1b7eddc	5272	Podnanos
00050000-554b-6964-c4d7-25792322f338	4244	Podnart
00050000-554b-6964-5110-8bc0a4e620ea	3241	Podplat
00050000-554b-6964-d3ac-7199713c2ab6	3257	Podsreda
00050000-554b-6964-0d5e-7af4fa18209b	2363	Podvelka
00050000-554b-6964-5b5c-3a6affb28f3b	2208	Pohorje
00050000-554b-6964-b6d9-1b799e4449da	2257	Polenšak
00050000-554b-6964-30b1-d35bcfd905e8	1355	Polhov Gradec
00050000-554b-6964-f98c-e5da4ed75bcd	4223	Poljane nad Škofjo Loko
00050000-554b-6964-dd89-4f475c27dce2	2319	Poljčane
00050000-554b-6964-d2d0-cfbd45f7b87c	1272	Polšnik
00050000-554b-6964-e4a6-bc83868c63a2	3313	Polzela
00050000-554b-6964-4dd8-ed9ce3b50c1f	3232	Ponikva
00050000-554b-6964-510f-00eebd22c055	6320	Portorož/Portorose
00050000-554b-6964-6234-7b22740f3086	6230	Postojna
00050000-554b-6964-f7e9-b3591b4c1eef	2331	Pragersko
00050000-554b-6964-42ac-99696bae47ac	3312	Prebold
00050000-554b-6964-8a39-11e96de83aff	4205	Preddvor
00050000-554b-6964-cf8d-baa4bb5ecb9e	6255	Prem
00050000-554b-6964-77ce-9fb0d846cb9f	1352	Preserje
00050000-554b-6964-881c-cc94f37343f2	6258	Prestranek
00050000-554b-6964-f69c-980981b9817e	2391	Prevalje
00050000-554b-6964-9ed3-b20faee049ab	3262	Prevorje
00050000-554b-6964-ac02-54426f93aa21	1276	Primskovo 
00050000-554b-6964-d007-5be1cb6a2e79	3253	Pristava pri Mestinju
00050000-554b-6964-c3e4-cd2a652f2773	9207	Prosenjakovci/Partosfalva
00050000-554b-6964-13b9-552d7722a246	5297	Prvačina
00050000-554b-6964-044d-683b2b0c0d67	2250	Ptuj
00050000-554b-6964-59c1-ef5db36ca3f1	2323	Ptujska Gora
00050000-554b-6964-0947-bae536c48156	9201	Puconci
00050000-554b-6964-8bb2-aed6a4109383	2327	Rače
00050000-554b-6964-bd9a-1ddbc225f36c	1433	Radeče
00050000-554b-6964-ef87-5ffe8973ccc7	9252	Radenci
00050000-554b-6964-de08-9c3fcb98a5be	2360	Radlje ob Dravi
00050000-554b-6964-598f-87850d56e882	1235	Radomlje
00050000-554b-6964-200d-699cf526cf16	4240	Radovljica
00050000-554b-6964-ed61-865a1f91c24f	8274	Raka
00050000-554b-6964-af2d-0e1f4b2012e7	1381	Rakek
00050000-554b-6964-535d-bb548afd31dd	4283	Rateče - Planica
00050000-554b-6964-9658-2a11494c1c47	2390	Ravne na Koroškem
00050000-554b-6964-34a3-ed6bc24cddd7	9246	Razkrižje
00050000-554b-6964-04fd-d300e1fc989c	3332	Rečica ob Savinji
00050000-554b-6964-5786-3d0902a7be5a	5292	Renče
00050000-554b-6964-ac65-74ecdbc5413b	1310	Ribnica
00050000-554b-6964-c680-b5e6c69e59b1	2364	Ribnica na Pohorju
00050000-554b-6964-596c-ec31afeee730	3272	Rimske Toplice
00050000-554b-6964-66d4-c4e260b7d3f7	1314	Rob
00050000-554b-6964-2d41-07914314ee51	5215	Ročinj
00050000-554b-6964-188d-6a6f73c2b182	3250	Rogaška Slatina
00050000-554b-6964-ac12-10dcd706d30b	9262	Rogašovci
00050000-554b-6964-9968-6ea0337d2c1f	3252	Rogatec
00050000-554b-6964-d983-704adfea766e	1373	Rovte
00050000-554b-6964-3c40-1f1b9ed39277	2342	Ruše
00050000-554b-6964-d005-0c48224bef5a	1282	Sava
00050000-554b-6964-23ca-2a82f0bc7343	6333	Sečovlje/Sicciole
00050000-554b-6964-993e-0e35dd4d80ac	4227	Selca
00050000-554b-6964-e554-63c0aa7deb8b	2352	Selnica ob Dravi
00050000-554b-6964-277a-67b54397e23e	8333	Semič
00050000-554b-6964-772e-8de3ef21b1b4	8281	Senovo
00050000-554b-6964-e3a3-f7af6a9289aa	6224	Senožeče
00050000-554b-6964-a4b9-3fbfe14047df	8290	Sevnica
00050000-554b-6964-90ec-06aaa3506ad7	6210	Sežana
00050000-554b-6964-a5c9-d78910af5c1b	2214	Sladki Vrh
00050000-554b-6964-f198-59b52553aa04	5283	Slap ob Idrijci
00050000-554b-6964-2f29-2080320cf3e5	2380	Slovenj Gradec
00050000-554b-6964-0525-43784c3447e6	2310	Slovenska Bistrica
00050000-554b-6964-4da1-14e3a9448a3c	3210	Slovenske Konjice
00050000-554b-6964-d400-87cf4aea535c	1216	Smlednik
00050000-554b-6964-c8c5-40ecf36d7306	5232	Soča
00050000-554b-6964-c50f-7e43c0a6da8b	1317	Sodražica
00050000-554b-6964-7f7b-f291a956592f	3335	Solčava
00050000-554b-6964-25f6-e06181554ecb	5250	Solkan
00050000-554b-6964-f189-3c1e664369bf	4229	Sorica
00050000-554b-6964-587d-c52d1fa8dbfa	4225	Sovodenj
00050000-554b-6964-95a3-01f7cf400efd	5281	Spodnja Idrija
00050000-554b-6964-7283-3adc0ea676b6	2241	Spodnji Duplek
00050000-554b-6964-bdd7-8b550b72b5df	9245	Spodnji Ivanjci
00050000-554b-6964-72b7-3d16ab206a90	2277	Središče ob Dravi
00050000-554b-6964-f746-bcf4d613ad21	4267	Srednja vas v Bohinju
00050000-554b-6964-821a-9a6e643a15d3	8256	Sromlje 
00050000-554b-6964-9822-754ca01223b0	5224	Srpenica
00050000-554b-6964-f312-75e5d02d1a24	1242	Stahovica
00050000-554b-6964-1ca9-70adce0e95dd	1332	Stara Cerkev
00050000-554b-6964-9be8-0e2a6fa44d1b	8342	Stari trg ob Kolpi
00050000-554b-6964-5736-40e66be1618b	1386	Stari trg pri Ložu
00050000-554b-6964-af85-d31241e71bde	2205	Starše
00050000-554b-6964-f7f6-e2c466e45a64	2289	Stoperce
00050000-554b-6964-0a55-c0f2ea710f85	8322	Stopiče
00050000-554b-6964-b3bb-24feabb16ff9	3206	Stranice
00050000-554b-6964-81d9-1953b06e4dd3	8351	Straža
00050000-554b-6964-9c45-97113957bb7e	1313	Struge
00050000-554b-6964-474c-03da9a394649	8293	Studenec
00050000-554b-6964-9a80-4df6faf6c28b	8331	Suhor
00050000-554b-6964-a15a-66653e59d1c6	2233	Sv. Ana v Slovenskih goricah
00050000-554b-6964-10d2-b4d7d5102379	2235	Sv. Trojica v Slovenskih goricah
00050000-554b-6964-5f68-631dd03a31bb	2353	Sveti Duh na Ostrem Vrhu
00050000-554b-6964-bb92-d703b4679717	9244	Sveti Jurij ob Ščavnici
00050000-554b-6964-6f3c-171e5a41006b	3264	Sveti Štefan
00050000-554b-6964-5cbc-8b89b0f73ee2	2258	Sveti Tomaž
00050000-554b-6964-ccc6-647595cf1b27	9204	Šalovci
00050000-554b-6964-1ba6-6733e53de145	5261	Šempas
00050000-554b-6964-d3d3-534843b5092a	5290	Šempeter pri Gorici
00050000-554b-6964-5f67-9e7c545906f2	3311	Šempeter v Savinjski dolini
00050000-554b-6964-207d-d9f23179c85c	4208	Šenčur
00050000-554b-6964-bbb8-3458121fc66d	2212	Šentilj v Slovenskih goricah
00050000-554b-6964-0f3f-4bc13caa7bff	8297	Šentjanž
00050000-554b-6964-bb08-8d157cf71610	2373	Šentjanž pri Dravogradu
00050000-554b-6964-5cc1-c6d86ae17eb6	8310	Šentjernej
00050000-554b-6964-6767-a831ce4dd5e3	3230	Šentjur
00050000-554b-6964-4a51-78b544ab6516	3271	Šentrupert
00050000-554b-6964-61f8-78b24cdd8606	8232	Šentrupert
00050000-554b-6964-9cdf-4694ac867e8a	1296	Šentvid pri Stični
00050000-554b-6964-39b3-1329ffdf4855	8275	Škocjan
00050000-554b-6964-4793-3e399d7e1b70	6281	Škofije
00050000-554b-6964-3f80-b2f7fe90b581	4220	Škofja Loka
00050000-554b-6964-d588-44c1c0a115f1	3211	Škofja vas
00050000-554b-6964-31df-e6e0600ad3ba	1291	Škofljica
00050000-554b-6964-f3d7-23eef62ce852	6274	Šmarje
00050000-554b-6964-8f9c-eafe3eba4f7f	1293	Šmarje - Sap
00050000-554b-6964-a3e3-e2f3e7c43c05	3240	Šmarje pri Jelšah
00050000-554b-6964-0c0c-1e71c54198e0	8220	Šmarješke Toplice
00050000-554b-6964-8ccb-c146c23dedad	2315	Šmartno na Pohorju
00050000-554b-6964-4c34-7161ab1a744c	3341	Šmartno ob Dreti
00050000-554b-6964-7a30-57aff1f41cb7	3327	Šmartno ob Paki
00050000-554b-6964-1b91-8038ce4b017c	1275	Šmartno pri Litiji
00050000-554b-6964-3727-b72714e521ae	2383	Šmartno pri Slovenj Gradcu
00050000-554b-6964-10a2-49c0cd1f428c	3201	Šmartno v Rožni dolini
00050000-554b-6964-8ada-21087a15ce03	3325	Šoštanj
00050000-554b-6964-6756-fbff4a939f57	6222	Štanjel
00050000-554b-6964-085d-a25dbf2505ac	3220	Štore
00050000-554b-6964-a1c2-2828d053165a	3304	Tabor
00050000-554b-6964-60a1-8631f289f39a	3221	Teharje
00050000-554b-6964-869c-dac071107303	9251	Tišina
00050000-554b-6964-3934-cfc9fe66f09c	5220	Tolmin
00050000-554b-6964-c8af-4ecf10b23286	3326	Topolšica
00050000-554b-6964-59d4-b084f9c7d9b3	2371	Trbonje
00050000-554b-6964-da86-55e78e159275	1420	Trbovlje
00050000-554b-6964-a0b7-36b44639a384	8231	Trebelno 
00050000-554b-6964-9a7c-354de6357f36	8210	Trebnje
00050000-554b-6964-00e0-d9e58f8f8761	5252	Trnovo pri Gorici
00050000-554b-6964-1b69-e67dcebad804	2254	Trnovska vas
00050000-554b-6964-9426-c971e5bc6a3c	1222	Trojane
00050000-554b-6964-b69b-59830973dab9	1236	Trzin
00050000-554b-6964-b333-7dceebacde2e	4290	Tržič
00050000-554b-6964-4353-38153d05e1b3	8295	Tržišče
00050000-554b-6964-9a6f-9aa0f30e3ea8	1311	Turjak
00050000-554b-6964-80f5-18df83cdde66	9224	Turnišče
00050000-554b-6964-e4ca-e522176b052a	8323	Uršna sela
00050000-554b-6964-54fc-2e37b1ab26a6	1252	Vače
00050000-554b-6964-5e56-910d786dec8d	3320	Velenje 
00050000-554b-6964-9202-0d86904399bf	3322	Velenje - poštni predali
00050000-554b-6964-5ee2-fa8c92997035	8212	Velika Loka
00050000-554b-6964-3438-d233f32e3798	2274	Velika Nedelja
00050000-554b-6964-1036-0d9d35998569	9225	Velika Polana
00050000-554b-6964-c6c1-65c084168976	1315	Velike Lašče
00050000-554b-6964-1783-840282fe444a	8213	Veliki Gaber
00050000-554b-6964-501b-872ee7b9068f	9241	Veržej
00050000-554b-6964-a4d0-df988c2918f4	1312	Videm - Dobrepolje
00050000-554b-6964-d846-3dd1375426b8	2284	Videm pri Ptuju
00050000-554b-6964-eb88-b9a11ce799ce	8344	Vinica
00050000-554b-6964-235f-1cea51c3525e	5271	Vipava
00050000-554b-6964-b30f-a3beac7c77e7	4212	Visoko
00050000-554b-6964-d28f-aad13c96af91	1294	Višnja Gora
00050000-554b-6964-bccf-574aeae72962	3205	Vitanje
00050000-554b-6964-cf69-d1266fde571f	2255	Vitomarci
00050000-554b-6964-96df-37383b136d6b	1217	Vodice
00050000-554b-6964-2d5b-c1b464be5c4d	3212	Vojnik\t
00050000-554b-6964-a21a-a5412f3a0a16	5293	Volčja Draga
00050000-554b-6964-242e-ab5b7104e252	2232	Voličina
00050000-554b-6964-d10f-ff8aa893f1f6	3305	Vransko
00050000-554b-6964-62f7-d9534f859f20	6217	Vremski Britof
00050000-554b-6964-da9c-04c05ab5cd65	1360	Vrhnika
00050000-554b-6964-e771-71f94b07690d	2365	Vuhred
00050000-554b-6964-44de-3d2feaeeaf7b	2367	Vuzenica
00050000-554b-6964-d94f-84307e5335d7	8292	Zabukovje 
00050000-554b-6964-0ca2-6991d2450183	1410	Zagorje ob Savi
00050000-554b-6964-3e44-cdfeb56db862	1303	Zagradec
00050000-554b-6964-8981-c1a35627c847	2283	Zavrč
00050000-554b-6964-c48b-0e9883dacad2	8272	Zdole 
00050000-554b-6964-99f7-68483e827c65	4201	Zgornja Besnica
00050000-554b-6964-7a66-dbbbc61399dc	2242	Zgornja Korena
00050000-554b-6964-29a4-785a3fcdc5a0	2201	Zgornja Kungota
00050000-554b-6964-32aa-80f7a9ae8fcd	2316	Zgornja Ložnica
00050000-554b-6964-6219-7da273fe2f3e	2314	Zgornja Polskava
00050000-554b-6964-902e-d6a09bae1218	2213	Zgornja Velka
00050000-554b-6964-6134-a0b242702854	4247	Zgornje Gorje
00050000-554b-6964-7450-29088e2acba8	4206	Zgornje Jezersko
00050000-554b-6964-c22e-5bf51350388a	2285	Zgornji Leskovec
00050000-554b-6964-7efb-eac9a6c53e22	1432	Zidani Most
00050000-554b-6964-5618-623cc0c34a64	3214	Zreče
00050000-554b-6964-bc59-bf2389ba066f	4209	Žabnica
00050000-554b-6964-a2bc-fd26eb7c6777	3310	Žalec
00050000-554b-6964-b6c4-d49ca8d60d96	4228	Železniki
00050000-554b-6964-8e68-3b1dc75324ba	2287	Žetale
00050000-554b-6964-7564-7ad4de75e53c	4226	Žiri
00050000-554b-6964-9152-0bc6e6c4c176	4274	Žirovnica
00050000-554b-6964-4ba4-f575acbb6287	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 2632144)
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
-- TOC entry 2642 (class 0 OID 2631967)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 2632033)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 2632156)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 2632260)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 2632304)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 2632185)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 2632129)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 2632119)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 2632294)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 2632250)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 2631833)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-554b-6965-888d-79fbbccf4fb6	00010000-554b-6965-fc63-9d4a451a1e7e	2015-05-07 15:32:21	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROrfQfVevTRf2jOupJeG48y2Hck7zpvl.";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 2632194)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 2631873)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-554b-6965-d3f4-b6a3895695e7	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-554b-6965-8422-006c02290a04	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-554b-6965-d79f-35971ee46a53	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-554b-6965-8ad6-4639b1a627c2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-554b-6965-765b-cfbed3aea74e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-554b-6965-e0d9-80f70522250b	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 2631856)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-554b-6965-888d-79fbbccf4fb6	00020000-554b-6965-8ad6-4639b1a627c2
00010000-554b-6965-fc63-9d4a451a1e7e	00020000-554b-6965-8ad6-4639b1a627c2
\.


--
-- TOC entry 2668 (class 0 OID 2632208)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 2632150)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 2632100)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 2631932)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 2632106)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 2632285)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 2632002)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 2631842)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-554b-6965-fc63-9d4a451a1e7e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROeRtmUw95LFHBh5xwMH5dKzuKNdgKEDG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-554b-6965-888d-79fbbccf4fb6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 2632336)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 2632048)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 2632177)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 2632242)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 2632076)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 2632326)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 2632233)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 2631897)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 2632375)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 2632368)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 2632284)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 2632066)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 2632099)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 2632028)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 2632229)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 2632046)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 2632093)
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
-- TOC entry 2364 (class 2606 OID 2632142)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 2632169)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 2632000)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 2631906)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 2631964)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 2631930)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 2631886)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2264 (class 2606 OID 2631871)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 2632175)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 2632207)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 2632321)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 2631957)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 2631988)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 2632148)
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
-- TOC entry 2298 (class 2606 OID 2631978)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 2632037)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 2632160)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 2632266)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 2632309)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 2632192)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 2632133)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 2632124)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 2632303)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 2632257)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 2631841)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 2632198)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 2631860)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 2631880)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 2632216)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 2632155)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 2632105)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 2631937)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 2632115)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 2632293)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 2632013)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 2631854)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 2632350)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 2632052)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 2632183)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 2632248)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 2632088)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 2632335)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 2632241)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 2632073)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 2631959)
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
-- TOC entry 2377 (class 1259 OID 2632176)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 2632162)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 2632161)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 2632053)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 2632232)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 2632230)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 2632231)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 2632323)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 2632324)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 2632325)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 2632353)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 2632352)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 2632351)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 2632015)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 2632014)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 2631966)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 2631965)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 2632199)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 2632094)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 2631887)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 2631888)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 2632219)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 2632218)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 2632217)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 2632038)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 2632040)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 2632039)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 2632128)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 2632126)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 2632125)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 2632127)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2259 (class 1259 OID 2631861)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2260 (class 1259 OID 2631862)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 2632184)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 2632149)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 2632258)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 2632259)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 2631980)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 2631979)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 2631981)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 2632267)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 2632268)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 2632378)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 2632377)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 2632380)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 2632376)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 2632379)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 2632249)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 2632137)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 2632136)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 2632134)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 2632135)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2245 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 2632370)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 2632369)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 2632047)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 2631908)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 2631907)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 2631938)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 2631939)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 2632118)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 2632117)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 2632116)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 2632075)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 2632071)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 2632068)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 2632069)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 2632067)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 2632072)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 2632070)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 2631958)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 2632029)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 2632031)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 2632030)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 2632032)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 2632143)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 2632322)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 2631931)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 2632001)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2256 (class 1259 OID 2631855)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2385 (class 1259 OID 2632193)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2265 (class 1259 OID 2631872)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2248 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 2631989)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 2632310)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 2631881)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 2632074)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 2632511)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 2632496)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 2632501)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 2632521)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 2632491)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 2632516)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 2632506)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 2632426)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 2632606)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 2632601)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 2632596)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 2632486)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 2632646)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 2632636)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 2632641)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 2632586)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 2632681)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 2632686)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 2632691)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 2632706)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 2632701)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 2632696)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 2632461)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 2632456)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 2632436)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 2632431)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 2632411)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 2632616)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 2632526)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 2632391)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 2632396)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 2632631)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 2632626)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 2632621)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 2632466)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 2632476)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 2632471)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 2632561)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 2632551)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 2632546)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 2632556)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 2632381)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 2632386)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 2632611)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 2632591)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 2632656)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 2632661)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 2632446)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 2632441)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 2632451)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 2632666)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 2632671)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 2632731)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 2632726)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 2632741)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 2632721)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 2632736)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 2632651)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 2632581)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 2632576)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 2632566)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 2632571)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 2632716)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 2632711)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 2632481)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 2632676)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 2632406)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 2632401)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 2632416)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 2632421)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 2632541)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 2632536)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 2632531)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-07 15:32:22 CEST

--
-- PostgreSQL database dump complete
--

