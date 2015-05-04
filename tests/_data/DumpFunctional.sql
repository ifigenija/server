--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-04 17:21:44 CEST

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
-- TOC entry 179 (class 1259 OID 2129547)
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
-- TOC entry 225 (class 1259 OID 2130029)
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
-- TOC entry 224 (class 1259 OID 2130012)
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
-- TOC entry 217 (class 1259 OID 2129928)
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
-- TOC entry 193 (class 1259 OID 2129712)
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
-- TOC entry 196 (class 1259 OID 2129753)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 2129674)
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
-- TOC entry 212 (class 1259 OID 2129878)
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
-- TOC entry 191 (class 1259 OID 2129699)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 2129747)
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
-- TOC entry 201 (class 1259 OID 2129796)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 2129821)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 2129648)
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
-- TOC entry 180 (class 1259 OID 2129556)
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
-- TOC entry 181 (class 1259 OID 2129567)
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
-- TOC entry 184 (class 1259 OID 2129618)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 2129521)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 2129540)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 2129828)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 2129858)
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
-- TOC entry 221 (class 1259 OID 2129970)
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
-- TOC entry 183 (class 1259 OID 2129598)
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
-- TOC entry 186 (class 1259 OID 2129640)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 2129802)
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
-- TOC entry 185 (class 1259 OID 2129625)
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
-- TOC entry 190 (class 1259 OID 2129691)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 2129814)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 2129919)
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
-- TOC entry 220 (class 1259 OID 2129963)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 2129843)
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
-- TOC entry 200 (class 1259 OID 2129787)
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
-- TOC entry 199 (class 1259 OID 2129777)
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
-- TOC entry 219 (class 1259 OID 2129953)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 2129909)
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
-- TOC entry 173 (class 1259 OID 2129491)
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
-- TOC entry 172 (class 1259 OID 2129489)
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
-- TOC entry 209 (class 1259 OID 2129852)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 2129531)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 2129514)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 2129866)
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
-- TOC entry 203 (class 1259 OID 2129808)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 2129758)
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
-- TOC entry 182 (class 1259 OID 2129590)
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
-- TOC entry 198 (class 1259 OID 2129764)
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
-- TOC entry 218 (class 1259 OID 2129944)
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
-- TOC entry 188 (class 1259 OID 2129660)
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
-- TOC entry 174 (class 1259 OID 2129500)
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
-- TOC entry 223 (class 1259 OID 2129994)
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
-- TOC entry 192 (class 1259 OID 2129706)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 2129835)
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
-- TOC entry 214 (class 1259 OID 2129901)
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
-- TOC entry 194 (class 1259 OID 2129734)
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
-- TOC entry 222 (class 1259 OID 2129984)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 2129891)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 2129494)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 2129547)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 2130029)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 2130012)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 2129928)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 2129712)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 2129753)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 2129674)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5547-8e87-cdbc-89c478602ec3	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5547-8e87-d6b4-7b276ae84642	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5547-8e87-0329-90037518a40a	AL	ALB	008	Albania 	Albanija	\N
00040000-5547-8e87-f596-9c6afe519f44	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5547-8e87-9f4c-dd1fcaaa8cc8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5547-8e87-6b34-848781ec01fe	AD	AND	020	Andorra 	Andora	\N
00040000-5547-8e87-61d3-7530989c6781	AO	AGO	024	Angola 	Angola	\N
00040000-5547-8e87-93f0-565402c89086	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5547-8e87-4c03-3f219dc4aa4b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5547-8e87-6e51-e6a64d5cec43	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5547-8e87-32ff-64af3abb4ce3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5547-8e87-74bc-d342f5552bdb	AM	ARM	051	Armenia 	Armenija	\N
00040000-5547-8e87-c8c7-d378b5a1d0c5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5547-8e87-276d-4091d8c71c7f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5547-8e87-8579-adfedfda2c1d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5547-8e87-28f9-86e7e0e291c7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5547-8e87-2c41-7a2095608be9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5547-8e87-f674-6f5c743aa79f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5547-8e87-c079-da401f5eb233	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5547-8e87-451a-e6958adaa932	BB	BRB	052	Barbados 	Barbados	\N
00040000-5547-8e87-f6f2-b734f7c7ab82	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5547-8e87-8a0d-f5cadd4410bc	BE	BEL	056	Belgium 	Belgija	\N
00040000-5547-8e87-2b02-2a9680664ff3	BZ	BLZ	084	Belize 	Belize	\N
00040000-5547-8e87-8adc-c4b38f706e08	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5547-8e87-b6d9-8c0cc994a418	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5547-8e87-9558-2aa9020d8de6	BT	BTN	064	Bhutan 	Butan	\N
00040000-5547-8e87-59f4-846662f3481a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5547-8e87-32a6-76465c831b11	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5547-8e87-a510-624d7bb2e4af	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5547-8e87-a13f-16434925b389	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5547-8e87-c0d3-ed44a9c76f0c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5547-8e87-956d-59c610815893	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5547-8e87-9bac-b6aacdb1a7e3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5547-8e87-f591-c44d97d0a825	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5547-8e87-d57a-de452e81d65b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5547-8e87-ea5d-3af1f0d66a72	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5547-8e87-fcb4-1c03375a6452	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5547-8e87-42bd-2b804734a70a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5547-8e87-b954-bdad920dbe9e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5547-8e87-2d1e-854931403c5e	CA	CAN	124	Canada 	Kanada	\N
00040000-5547-8e87-6610-44f29c387481	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5547-8e87-2f42-26b3ad5a586c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5547-8e87-1d5b-98f479a241d6	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5547-8e87-446a-c32f6531de58	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5547-8e87-a4aa-3e46dbec0854	CL	CHL	152	Chile 	Čile	\N
00040000-5547-8e87-2f4c-8c17abf22e3f	CN	CHN	156	China 	Kitajska	\N
00040000-5547-8e87-1f5d-21f0899a031f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5547-8e87-3ce1-5974f48674d7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5547-8e87-2422-a1b7f4290fc1	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5547-8e87-bc3d-9bf1b34e287e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5547-8e87-733d-a3e335188d90	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5547-8e87-fded-4fd125f9d75f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5547-8e87-9efa-812729280482	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5547-8e87-b98f-1691dd94dc3a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5547-8e87-ed0c-bc1cc2c52af8	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5547-8e87-e522-4fb97e9f7bb8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5547-8e87-483a-135accf7414c	CU	CUB	192	Cuba 	Kuba	\N
00040000-5547-8e87-29c4-9c1c97b7c667	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5547-8e87-367c-a6f9484ead1e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5547-8e87-0e50-7de56705b27e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5547-8e87-eef8-c31719f60337	DK	DNK	208	Denmark 	Danska	\N
00040000-5547-8e87-ac2a-7c8217b3d2c0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5547-8e87-6d73-860c65b1ed97	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5547-8e87-26e2-7ae9e65bc2e9	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5547-8e87-0aae-b6dcc1e08fcf	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5547-8e87-507d-0646f6687888	EG	EGY	818	Egypt 	Egipt	\N
00040000-5547-8e87-e9cb-16427b527f80	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5547-8e87-dc0c-2d94e9e12ec0	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5547-8e87-0f3b-f113d6b9aa6e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5547-8e87-b5f7-4d5a12e7f849	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5547-8e87-d97a-87306767e4fe	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5547-8e87-a1f6-73a2df87fe11	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5547-8e87-c9b2-79fce5c689b1	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5547-8e87-3e23-27ee26fa6b14	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5547-8e87-a3b1-dcb7101f3d4a	FI	FIN	246	Finland 	Finska	\N
00040000-5547-8e87-1639-b859dcc946bb	FR	FRA	250	France 	Francija	\N
00040000-5547-8e87-b6eb-d65bc6f652a5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5547-8e87-b95e-3a04f21ec17f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5547-8e87-94ab-0e41f2077dbf	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5547-8e87-f8f4-efcd092b6ccc	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5547-8e87-410b-d01c24a65546	GA	GAB	266	Gabon 	Gabon	\N
00040000-5547-8e87-d1f4-19a7ce8ea5e0	GM	GMB	270	Gambia 	Gambija	\N
00040000-5547-8e87-4c99-bc35facd112e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5547-8e87-29e4-26ada716f66e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5547-8e87-bd3c-2384a197fe9b	GH	GHA	288	Ghana 	Gana	\N
00040000-5547-8e87-2ab6-cc77acd529e6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5547-8e87-d413-d2c3d71ed600	GR	GRC	300	Greece 	Grčija	\N
00040000-5547-8e87-3523-f72a2f861a84	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5547-8e87-0299-e3f88f64a7be	GD	GRD	308	Grenada 	Grenada	\N
00040000-5547-8e87-e8f9-03734ceecfc9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5547-8e87-7f97-d89d550e279b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5547-8e87-547e-cee50a1b2bac	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5547-8e87-256c-14a7e2c70a38	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5547-8e87-5840-de4caefa8889	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5547-8e87-a1c7-f443917634a5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5547-8e87-2368-462081a8116a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5547-8e87-33bc-5e34dce12a16	HT	HTI	332	Haiti 	Haiti	\N
00040000-5547-8e87-7a3b-06d9a857fd18	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5547-8e87-33a9-36fee683ae00	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5547-8e87-c308-c4dc7b2c4d62	HN	HND	340	Honduras 	Honduras	\N
00040000-5547-8e87-7bed-91c79e707f59	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5547-8e87-0863-67b7f4ce8681	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5547-8e87-b6da-d9672daf87af	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5547-8e87-5960-d6434dedf65b	IN	IND	356	India 	Indija	\N
00040000-5547-8e87-e298-0365a8889840	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5547-8e87-336b-10dd5a4e3ac1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5547-8e87-4872-08f48f68614d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5547-8e87-6d23-984cd8b46b6a	IE	IRL	372	Ireland 	Irska	\N
00040000-5547-8e87-4108-d6cf2668d425	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5547-8e87-ddce-e2de48385509	IL	ISR	376	Israel 	Izrael	\N
00040000-5547-8e87-8340-df4a9a3ba1c6	IT	ITA	380	Italy 	Italija	\N
00040000-5547-8e87-9042-c5fc79a7e7df	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5547-8e87-56e5-ed46d78cd4cb	JP	JPN	392	Japan 	Japonska	\N
00040000-5547-8e87-69bd-2c2b50814571	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5547-8e87-8066-fda1068a26f0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5547-8e87-c6a8-00b8e4c64360	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5547-8e87-6e6a-514e826919e2	KE	KEN	404	Kenya 	Kenija	\N
00040000-5547-8e87-7166-17c212aafdee	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5547-8e87-ca44-dcf9de1f3719	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5547-8e87-8261-415adf64ccc4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5547-8e87-a2ce-c58061b227af	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5547-8e87-cb0e-ef12d9ca96ca	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5547-8e87-d24d-fa418925d355	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5547-8e87-b48c-6afeb5fe8a9c	LV	LVA	428	Latvia 	Latvija	\N
00040000-5547-8e87-f20a-e8ae73b650aa	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5547-8e87-ecc6-18e67de9852a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5547-8e87-73a1-0dbb20e54870	LR	LBR	430	Liberia 	Liberija	\N
00040000-5547-8e87-261e-2a503d6d32fc	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5547-8e87-9397-7bad1568ad8e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5547-8e87-acee-ec123d246e61	LT	LTU	440	Lithuania 	Litva	\N
00040000-5547-8e87-21e8-458cab8c7144	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5547-8e87-a38d-e4a788146d8a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5547-8e87-0c5b-301a37facd2b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5547-8e87-b75e-195807827c81	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5547-8e87-a85a-188f8e14babe	MW	MWI	454	Malawi 	Malavi	\N
00040000-5547-8e87-8034-ef32a4459b58	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5547-8e87-2e6d-475578a2460a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5547-8e87-27fa-b56665abb180	ML	MLI	466	Mali 	Mali	\N
00040000-5547-8e87-05c2-88469673c78f	MT	MLT	470	Malta 	Malta	\N
00040000-5547-8e87-78a9-9708a0a33d8d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5547-8e87-b82a-4060bb9eec20	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5547-8e87-2bd2-c806b380cae9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5547-8e87-1e30-8a7320c2e501	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5547-8e87-bdf3-e75d9201fb9b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5547-8e87-aad8-23e386d23d15	MX	MEX	484	Mexico 	Mehika	\N
00040000-5547-8e87-e923-702cb8a93edb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5547-8e87-a871-d6dfdf054902	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5547-8e87-109f-a0c93fddf151	MC	MCO	492	Monaco 	Monako	\N
00040000-5547-8e87-546e-1e66d4ce3f75	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5547-8e87-5af9-6e7e0f56db1e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5547-8e87-5eea-2e6815e3618e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5547-8e87-9e9d-6248075471f8	MA	MAR	504	Morocco 	Maroko	\N
00040000-5547-8e87-c4ed-1823cca4a2e5	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5547-8e87-49b2-92e27c9ae529	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5547-8e87-2770-d91db9b9c7a6	NA	NAM	516	Namibia 	Namibija	\N
00040000-5547-8e87-3158-1bc9ed4a364c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5547-8e87-02b1-0a3b68c6a603	NP	NPL	524	Nepal 	Nepal	\N
00040000-5547-8e87-b71b-1bf15abd762a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5547-8e87-4892-b069900b1e09	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5547-8e87-8ddf-2f0a4c847305	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5547-8e87-2efa-2ad375a34872	NE	NER	562	Niger 	Niger 	\N
00040000-5547-8e87-53f6-fdf3d50a7f77	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5547-8e87-8be8-a5defec6b9b3	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5547-8e87-9284-af743eb28a4c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5547-8e87-25a3-016af4b0cdbf	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5547-8e87-4759-cf23a49a4f9d	NO	NOR	578	Norway 	Norveška	\N
00040000-5547-8e87-9c61-fc8acd3bedce	OM	OMN	512	Oman 	Oman	\N
00040000-5547-8e87-595f-c13291371751	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5547-8e87-5e28-e472c45bf9f9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5547-8e87-4704-de47fed8f271	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5547-8e87-e245-1af1700a28ce	PA	PAN	591	Panama 	Panama	\N
00040000-5547-8e87-39a6-0fe62bbc14fc	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5547-8e87-e7fd-7831b24b25c4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5547-8e87-0bdb-cf40d492fac7	PE	PER	604	Peru 	Peru	\N
00040000-5547-8e87-8aaf-e55ea2371dc0	PH	PHL	608	Philippines 	Filipini	\N
00040000-5547-8e87-4e7a-890906808643	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5547-8e87-576c-5e7a879f74c8	PL	POL	616	Poland 	Poljska	\N
00040000-5547-8e87-660a-4ccf7bded1fd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5547-8e87-db60-35fc8756d3f4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5547-8e87-a801-74a283577cfc	QA	QAT	634	Qatar 	Katar	\N
00040000-5547-8e87-05c5-9090deba8551	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5547-8e87-1f27-89bf84312f74	RO	ROU	642	Romania 	Romunija	\N
00040000-5547-8e87-6dc4-6fed0868b460	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5547-8e87-e5db-05ad228df2fb	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5547-8e87-4bea-a140bb4e15b2	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5547-8e87-9f1c-7ff4ca759acc	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5547-8e87-0f81-ab7e9766d379	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5547-8e87-6b53-f079a89fef60	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5547-8e87-ed91-ca5975f56be8	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5547-8e87-86e5-a58960b38b80	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5547-8e87-c6a1-0ffd74403bb4	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5547-8e87-eb47-02866fbdff2a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5547-8e87-0e41-9c5a5d8d365a	SM	SMR	674	San Marino 	San Marino	\N
00040000-5547-8e87-ec10-360516a6b1e2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5547-8e87-4473-0d342e699724	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5547-8e87-4c69-072eb4f4acd1	SN	SEN	686	Senegal 	Senegal	\N
00040000-5547-8e87-8063-03d7c40fa29c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5547-8e87-c583-690b829b8ebc	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5547-8e87-bee2-285fbffffb63	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5547-8e87-e845-24428d798f98	SG	SGP	702	Singapore 	Singapur	\N
00040000-5547-8e87-d8b6-dc07fbb51654	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5547-8e87-79b7-966347b4cd20	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5547-8e87-a6ad-01b1c0633e8b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5547-8e87-da9a-3060736c7a00	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5547-8e87-9dae-3df7de1ed853	SO	SOM	706	Somalia 	Somalija	\N
00040000-5547-8e87-e3c9-8e6b93a3cdee	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5547-8e87-be22-5bad90f83454	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5547-8e87-e55a-5bca5389bed2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5547-8e87-fc9a-1c3d3cbdc495	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5547-8e87-b918-b150f6aa9489	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5547-8e87-db49-09dc94b06ac2	SD	SDN	729	Sudan 	Sudan	\N
00040000-5547-8e87-bafb-213de46ba5cb	SR	SUR	740	Suriname 	Surinam	\N
00040000-5547-8e87-daaa-6fa6fb60aca7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5547-8e87-aaea-6e0b4d114cfd	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5547-8e87-a88c-65327b1b71c1	SE	SWE	752	Sweden 	Švedska	\N
00040000-5547-8e87-9c4e-c4a736e7a86c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5547-8e87-3f9b-b2a5275e04b8	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5547-8e87-680f-3efccee2055d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5547-8e87-4608-4505332b6a42	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5547-8e87-f123-57af2e4f2f7d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5547-8e87-d39c-e34c83dd9f8c	TH	THA	764	Thailand 	Tajska	\N
00040000-5547-8e87-46b0-35bb3f6da37a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5547-8e87-317b-61b150ba1c9f	TG	TGO	768	Togo 	Togo	\N
00040000-5547-8e87-6da0-3d45c3236cbc	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5547-8e87-6524-9d2bd436051c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5547-8e87-74d3-ae9ca51f55b9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5547-8e87-778b-858d236efa68	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5547-8e87-2992-2eda0d346829	TR	TUR	792	Turkey 	Turčija	\N
00040000-5547-8e87-8984-d6b2e5628673	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5547-8e87-336a-c00d10cdb03d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5547-8e87-2637-9b128796f72c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5547-8e87-2d08-ca5df422b989	UG	UGA	800	Uganda 	Uganda	\N
00040000-5547-8e87-0e6d-4e66d1a6ae08	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5547-8e87-25ec-fc014433deb7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5547-8e87-eeb3-4722f2ce9f52	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5547-8e87-fffc-ca3246848e57	US	USA	840	United States 	Združene države Amerike	\N
00040000-5547-8e87-522d-8ef8c863a4b7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5547-8e87-5496-bb023d81c50d	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5547-8e87-af3b-ef4cf7b02c5c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5547-8e87-3530-7863004378d5	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5547-8e87-d68f-600ce16e212a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5547-8e87-75f4-4c6a7f4cebb1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5547-8e87-f8ef-0cacf2755f80	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5547-8e87-4744-f36c95ac152a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5547-8e87-0745-d9e87343f6f6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5547-8e87-4ffc-6524f802a0d5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5547-8e87-e5d2-0cffca6d1c05	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5547-8e87-8330-373917ea6dec	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5547-8e87-99b9-295963b038e2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 2129878)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 2129699)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 2129747)
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
-- TOC entry 2658 (class 0 OID 2129796)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 2129821)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 2129648)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5547-8e87-63d6-ae090766442e	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5547-8e87-c4d2-8f75e7eccc59	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5547-8e87-ace8-52e509c03333	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5547-8e87-10e5-5dbe7efe7cd6	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5547-8e87-bae1-5b873aea8890	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5547-8e87-f4cb-7ab021631caa	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5547-8e87-35fd-4f3761f58b0f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5547-8e87-a2e2-dcace3a292e1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5547-8e87-93e9-37c11a8a95d4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5547-8e87-d0ba-80480d40ec7d	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 2129556)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5547-8e87-d3f1-ceea1fdecdba	00000000-5547-8e87-bae1-5b873aea8890	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5547-8e87-bf38-fd4e83579dbf	00000000-5547-8e87-bae1-5b873aea8890	00010000-5547-8e87-7019-6722b93203ba	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5547-8e87-c28e-21b12916163d	00000000-5547-8e87-f4cb-7ab021631caa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 2129567)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 2129618)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 2129521)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5547-8e87-51b6-4913b6b871e4	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5547-8e87-1dc5-25d19d3d3d7d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5547-8e87-7dda-29df140e27f3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5547-8e87-b92c-89a8273954fd	Abonma-read	Abonma - branje	f
00030000-5547-8e87-67b1-cd12c84ac4c5	Abonma-write	Abonma - spreminjanje	f
00030000-5547-8e87-43db-dbc91933eae5	Alternacija-read	Alternacija - branje	f
00030000-5547-8e87-6b64-74544b80c1ab	Alternacija-write	Alternacija - spreminjanje	f
00030000-5547-8e87-ebd5-6acda6edd44e	Arhivalija-read	Arhivalija - branje	f
00030000-5547-8e87-0a20-3b29343a411f	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5547-8e87-c6bd-879e8297c8a9	Besedilo-read	Besedilo - branje	f
00030000-5547-8e87-4a80-e0964b388496	Besedilo-write	Besedilo - spreminjanje	f
00030000-5547-8e87-add5-e0170914f688	DogodekIzven-read	DogodekIzven - branje	f
00030000-5547-8e87-a3fd-580af4279ca7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5547-8e87-1fd8-a7a8b247db46	Dogodek-read	Dogodek - branje	f
00030000-5547-8e87-1756-cb1adab4053d	Dogodek-write	Dogodek - spreminjanje	f
00030000-5547-8e87-c082-1c5829bf9903	Drzava-read	Drzava - branje	f
00030000-5547-8e87-4668-3e28d6251abd	Drzava-write	Drzava - spreminjanje	f
00030000-5547-8e87-390f-36823e0849bc	Funkcija-read	Funkcija - branje	f
00030000-5547-8e87-133f-5c3b8851ac2d	Funkcija-write	Funkcija - spreminjanje	f
00030000-5547-8e87-aa21-fd23634ca21d	Gostovanje-read	Gostovanje - branje	f
00030000-5547-8e87-65dc-010dce78d2d5	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5547-8e87-5c9b-16905d8d6c41	Gostujoca-read	Gostujoca - branje	f
00030000-5547-8e87-1efc-7f3b0cf87938	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5547-8e87-c6e4-63767b84d2fa	Kupec-read	Kupec - branje	f
00030000-5547-8e87-4dab-035080f1429a	Kupec-write	Kupec - spreminjanje	f
00030000-5547-8e87-de2e-bae7fc27386c	NacinPlacina-read	NacinPlacina - branje	f
00030000-5547-8e87-09af-e3ddc8c9644f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5547-8e87-40ac-5433804fcb16	Option-read	Option - branje	f
00030000-5547-8e87-9b18-527a7899dea6	Option-write	Option - spreminjanje	f
00030000-5547-8e87-58bb-cdb9fc2691cd	OptionValue-read	OptionValue - branje	f
00030000-5547-8e87-8b0f-60d8a613c531	OptionValue-write	OptionValue - spreminjanje	f
00030000-5547-8e87-22ed-d84fc8cc198c	Oseba-read	Oseba - branje	f
00030000-5547-8e87-9918-89223f5cef52	Oseba-write	Oseba - spreminjanje	f
00030000-5547-8e87-b09f-57514b9d19ad	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5547-8e87-7593-0f5af888fb0d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5547-8e87-1953-48708e81f400	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5547-8e87-ecf2-5a235cbe21e5	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5547-8e87-300c-29562c1ca2e1	Pogodba-read	Pogodba - branje	f
00030000-5547-8e87-eb33-147a4c974c1c	Pogodba-write	Pogodba - spreminjanje	f
00030000-5547-8e87-7b41-9c329a236383	Popa-read	Popa - branje	f
00030000-5547-8e87-b607-f950f14dff21	Popa-write	Popa - spreminjanje	f
00030000-5547-8e87-b697-2ec32b9b96fd	Posta-read	Posta - branje	f
00030000-5547-8e87-7c39-b5b99c484a5c	Posta-write	Posta - spreminjanje	f
00030000-5547-8e87-5526-910115c8cfd5	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5547-8e87-ca45-1586cc549763	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5547-8e87-1607-2e32d55dfdb1	PostniNaslov-read	PostniNaslov - branje	f
00030000-5547-8e87-276f-99c5e90e9b06	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5547-8e87-3d95-d401e5164070	Predstava-read	Predstava - branje	f
00030000-5547-8e87-39dd-e1f0787aae25	Predstava-write	Predstava - spreminjanje	f
00030000-5547-8e87-9c92-d83d96b39b58	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5547-8e87-8c4c-75bf78a9dac4	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5547-8e87-f96a-64bbe47b7603	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5547-8e87-177a-2bb21419b00c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5547-8e87-dcc5-3a21660ac2fa	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5547-8e87-abf2-61cac8d2a897	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5547-8e87-cd58-441781098727	Prostor-read	Prostor - branje	f
00030000-5547-8e87-6b73-d58300f10279	Prostor-write	Prostor - spreminjanje	f
00030000-5547-8e87-cc6c-5b27bde50017	Racun-read	Racun - branje	f
00030000-5547-8e87-70b3-dac4fbbe5a8a	Racun-write	Racun - spreminjanje	f
00030000-5547-8e87-8ad6-3a89ec5d25e3	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5547-8e87-7b95-19e29f78b8b5	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5547-8e87-7caa-5d4177b0ea07	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5547-8e87-7c58-776a1ba9f64f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5547-8e87-d670-b52064544989	Rekvizit-read	Rekvizit - branje	f
00030000-5547-8e87-b31b-abbe77445375	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5547-8e87-c8c2-2bd568a18dfa	Rezervacija-read	Rezervacija - branje	f
00030000-5547-8e87-e5c7-439983a8d887	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5547-8e87-ffb1-6652349ee3ab	SedezniRed-read	SedezniRed - branje	f
00030000-5547-8e87-fbff-6b8de8b69b0f	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5547-8e87-3a95-07fc97233d4f	Sedez-read	Sedez - branje	f
00030000-5547-8e87-fa3c-67d0f235c3ef	Sedez-write	Sedez - spreminjanje	f
00030000-5547-8e87-3d23-4c9e1c195127	Sezona-read	Sezona - branje	f
00030000-5547-8e87-9fbd-473a5840dc41	Sezona-write	Sezona - spreminjanje	f
00030000-5547-8e87-6759-32db7c2591f8	Telefonska-read	Telefonska - branje	f
00030000-5547-8e87-1617-39efc6770787	Telefonska-write	Telefonska - spreminjanje	f
00030000-5547-8e87-1246-3070390af4f1	TerminStoritve-read	TerminStoritve - branje	f
00030000-5547-8e87-ebd9-d9127ba0b246	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5547-8e87-67fb-7e9514cffa20	TipFunkcije-read	TipFunkcije - branje	f
00030000-5547-8e87-c334-df138082c3e0	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5547-8e87-7cf9-5e7713e0788d	Trr-read	Trr - branje	f
00030000-5547-8e87-ccc4-c9196462f50a	Trr-write	Trr - spreminjanje	f
00030000-5547-8e87-f7fa-2f91143097d3	Uprizoritev-read	Uprizoritev - branje	f
00030000-5547-8e87-5c03-b688eee44358	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5547-8e87-12fe-7288adb30f64	Vaja-read	Vaja - branje	f
00030000-5547-8e87-f8e9-976f595f8906	Vaja-write	Vaja - spreminjanje	f
00030000-5547-8e87-f53a-ee23cb2209c0	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5547-8e87-6d21-63860c707fca	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5547-8e87-335f-52971a87900d	Zaposlitev-read	Zaposlitev - branje	f
00030000-5547-8e87-17ae-5914cebf8b43	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5547-8e87-0685-cc256ff6fd63	Zasedenost-read	Zasedenost - branje	f
00030000-5547-8e87-588a-b599f3f22570	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5547-8e87-8317-6244135f5448	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5547-8e87-6b72-0ade4a0a548f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5547-8e87-83bb-8628d62cf3cf	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5547-8e87-a1a5-135a1d24a374	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 2129540)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5547-8e87-8e61-7d814acc2bd3	00030000-5547-8e87-c082-1c5829bf9903
00020000-5547-8e87-14e4-9b27ca48f378	00030000-5547-8e87-4668-3e28d6251abd
00020000-5547-8e87-14e4-9b27ca48f378	00030000-5547-8e87-c082-1c5829bf9903
\.


--
-- TOC entry 2663 (class 0 OID 2129828)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 2129858)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 2129970)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 2129598)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 2129640)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5547-8e87-6a9f-c8854dd22999	8341	Adlešiči
00050000-5547-8e87-2f17-31f8c6c7b50c	5270	Ajdovščina
00050000-5547-8e87-c204-d87692af82e5	6280	Ankaran/Ancarano
00050000-5547-8e87-04ed-b291e32a495e	9253	Apače
00050000-5547-8e87-043e-6702322ec9aa	8253	Artiče
00050000-5547-8e87-beec-0a34cc20b97b	4275	Begunje na Gorenjskem
00050000-5547-8e87-b73f-9911533d5868	1382	Begunje pri Cerknici
00050000-5547-8e87-c49d-067dab617210	9231	Beltinci
00050000-5547-8e87-9ac3-fc11f20c5d27	2234	Benedikt
00050000-5547-8e87-4d87-524f45fa17a2	2345	Bistrica ob Dravi
00050000-5547-8e87-2631-7c503fd9744f	3256	Bistrica ob Sotli
00050000-5547-8e87-385b-70aec1d6634e	8259	Bizeljsko
00050000-5547-8e87-9e8d-661a86130651	1223	Blagovica
00050000-5547-8e87-d4cc-d10a5e87343a	8283	Blanca
00050000-5547-8e87-23f9-834084da5eb1	4260	Bled
00050000-5547-8e87-4990-cd777eef6c7b	4273	Blejska Dobrava
00050000-5547-8e87-9d33-89dd4803c889	9265	Bodonci
00050000-5547-8e87-3c77-6a781c84a634	9222	Bogojina
00050000-5547-8e87-a1b8-a31888999cc6	4263	Bohinjska Bela
00050000-5547-8e87-4638-8e6a06df6b8f	4264	Bohinjska Bistrica
00050000-5547-8e87-07de-2af1e59562e0	4265	Bohinjsko jezero
00050000-5547-8e87-e58e-426c8044edd6	1353	Borovnica
00050000-5547-8e87-3ad5-b266effa7faa	8294	Boštanj
00050000-5547-8e87-3f2f-e3bf0efade39	5230	Bovec
00050000-5547-8e87-778c-0b4cde6e12d4	5295	Branik
00050000-5547-8e87-5db7-a78fd032feaf	3314	Braslovče
00050000-5547-8e87-d804-a30afc419ba8	5223	Breginj
00050000-5547-8e87-b593-171cba366afb	8280	Brestanica
00050000-5547-8e87-24cf-cc4d8a704863	2354	Bresternica
00050000-5547-8e87-c9ca-00c74036f2d9	4243	Brezje
00050000-5547-8e87-91c6-37c979589e21	1351	Brezovica pri Ljubljani
00050000-5547-8e87-de95-38d21bccbd63	8250	Brežice
00050000-5547-8e87-05dd-dd2e35663d0d	4210	Brnik - Aerodrom
00050000-5547-8e87-2341-e19fa7ea3e66	8321	Brusnice
00050000-5547-8e87-7a43-0efdd9479c11	3255	Buče
00050000-5547-8e87-c0d5-3bd0a07a58d0	8276	Bučka 
00050000-5547-8e87-fef7-1b74c6709292	9261	Cankova
00050000-5547-8e87-d04a-66cab4e32e77	3000	Celje 
00050000-5547-8e87-11ac-406fd4b4c974	3001	Celje - poštni predali
00050000-5547-8e87-224a-87ce4663d41e	4207	Cerklje na Gorenjskem
00050000-5547-8e87-8e1f-a5c8a1be6280	8263	Cerklje ob Krki
00050000-5547-8e87-ee29-0d7788d06104	1380	Cerknica
00050000-5547-8e87-b45b-22ab2c3160b8	5282	Cerkno
00050000-5547-8e87-f9c4-60786c62e124	2236	Cerkvenjak
00050000-5547-8e87-de63-b170644fdb11	2215	Ceršak
00050000-5547-8e87-ff20-cf1aec78ebf1	2326	Cirkovce
00050000-5547-8e87-a545-c0a32113c092	2282	Cirkulane
00050000-5547-8e87-1d25-8c32573cb116	5273	Col
00050000-5547-8e87-70e4-ae9fa35d2c0a	8251	Čatež ob Savi
00050000-5547-8e87-07f6-bdb4b901903e	1413	Čemšenik
00050000-5547-8e87-502c-ba21b9ad1842	5253	Čepovan
00050000-5547-8e87-d2d0-570ef339d753	9232	Črenšovci
00050000-5547-8e87-07b4-b3733e5bf7e0	2393	Črna na Koroškem
00050000-5547-8e87-41fa-d433a035ce14	6275	Črni Kal
00050000-5547-8e87-d8a6-bef601ed0fe1	5274	Črni Vrh nad Idrijo
00050000-5547-8e87-9d37-590803536de8	5262	Črniče
00050000-5547-8e87-c9cc-44e8ee9661fd	8340	Črnomelj
00050000-5547-8e87-c600-2bb680006112	6271	Dekani
00050000-5547-8e87-1a9d-db4e56566357	5210	Deskle
00050000-5547-8e87-380a-a371215c5881	2253	Destrnik
00050000-5547-8e87-6506-8e553208a606	6215	Divača
00050000-5547-8e87-abb9-bbadcbe66bbb	1233	Dob
00050000-5547-8e87-32a9-387588bc7316	3224	Dobje pri Planini
00050000-5547-8e87-3473-222b55f914d4	8257	Dobova
00050000-5547-8e87-efa2-fd5b531a81fc	1423	Dobovec
00050000-5547-8e87-2c0c-c996643c5064	5263	Dobravlje
00050000-5547-8e87-6cfa-059afade61bf	3204	Dobrna
00050000-5547-8e87-41b4-08bb1ca2ec2d	8211	Dobrnič
00050000-5547-8e87-abf1-730466a399da	1356	Dobrova
00050000-5547-8e87-91e9-a97eaff651a1	9223	Dobrovnik/Dobronak 
00050000-5547-8e87-84db-e16a85ed6f77	5212	Dobrovo v Brdih
00050000-5547-8e87-a626-864a4fab825b	1431	Dol pri Hrastniku
00050000-5547-8e87-87f2-fdb7a2c1cd04	1262	Dol pri Ljubljani
00050000-5547-8e87-5bf3-72914087709e	1273	Dole pri Litiji
00050000-5547-8e87-d008-4c9b0db67c34	1331	Dolenja vas
00050000-5547-8e87-a529-1caca6e1ae12	8350	Dolenjske Toplice
00050000-5547-8e87-d98a-d8a608943264	1230	Domžale
00050000-5547-8e87-9549-0a26c4314301	2252	Dornava
00050000-5547-8e87-942a-a5380f40830e	5294	Dornberk
00050000-5547-8e87-df49-4ec35ba19400	1319	Draga
00050000-5547-8e87-a953-904e7e0bf120	8343	Dragatuš
00050000-5547-8e87-0f49-df922bd01488	3222	Dramlje
00050000-5547-8e87-1bda-cbefce312522	2370	Dravograd
00050000-5547-8e87-a4ec-f537173b8ba5	4203	Duplje
00050000-5547-8e87-2239-12dd8e263fe7	6221	Dutovlje
00050000-5547-8e87-7f94-2da17bf32d7c	8361	Dvor
00050000-5547-8e87-734e-f7769a318f63	2343	Fala
00050000-5547-8e87-9017-e3e74d7b6560	9208	Fokovci
00050000-5547-8e87-3c2d-aee5f78b31dc	2313	Fram
00050000-5547-8e87-168a-edec047964de	3213	Frankolovo
00050000-5547-8e87-b9c3-1ccc998cd83a	1274	Gabrovka
00050000-5547-8e87-2684-86144dd35f7c	8254	Globoko
00050000-5547-8e87-b352-58000fd90ab9	5275	Godovič
00050000-5547-8e87-3f5f-e18ceccad594	4204	Golnik
00050000-5547-8e87-55df-3ec155e5901a	3303	Gomilsko
00050000-5547-8e87-6b99-69e7825e4170	4224	Gorenja vas
00050000-5547-8e87-0641-65d69127bdf8	3263	Gorica pri Slivnici
00050000-5547-8e87-610d-9c11adaf5d4c	2272	Gorišnica
00050000-5547-8e87-3d45-3ae72e05e412	9250	Gornja Radgona
00050000-5547-8e87-3856-adebc87e64c4	3342	Gornji Grad
00050000-5547-8e87-fdd0-8f2eaafe3d31	4282	Gozd Martuljek
00050000-5547-8e87-401d-e3a3621cf7c5	6272	Gračišče
00050000-5547-8e87-799d-ef276603e58b	9264	Grad
00050000-5547-8e87-b7da-31b16348e832	8332	Gradac
00050000-5547-8e87-583f-f27a3d204823	1384	Grahovo
00050000-5547-8e87-53e4-886e2365b6c2	5242	Grahovo ob Bači
00050000-5547-8e87-5990-026be533075f	5251	Grgar
00050000-5547-8e87-998f-da151403ee7f	3302	Griže
00050000-5547-8e87-b067-cdc7fa5a51c1	3231	Grobelno
00050000-5547-8e87-eb46-26245d140d73	1290	Grosuplje
00050000-5547-8e87-0ab8-9994b3375b35	2288	Hajdina
00050000-5547-8e87-d3b3-f87403668017	8362	Hinje
00050000-5547-8e87-e544-f0fca7d32e5e	2311	Hoče
00050000-5547-8e87-48a2-7777e1d677d3	9205	Hodoš/Hodos
00050000-5547-8e87-27ab-cafb4090ab41	1354	Horjul
00050000-5547-8e87-eca8-584258f045c2	1372	Hotedršica
00050000-5547-8e87-a42c-be516e8ff3eb	1430	Hrastnik
00050000-5547-8e87-d83e-51157a54b67f	6225	Hruševje
00050000-5547-8e87-39ac-40de27d79cf9	4276	Hrušica
00050000-5547-8e87-1798-b60d8a54e302	5280	Idrija
00050000-5547-8e87-b662-ed3ce13cb929	1292	Ig
00050000-5547-8e87-92ce-a4eb97e8b378	6250	Ilirska Bistrica
00050000-5547-8e87-79b4-82ddf0442bd1	6251	Ilirska Bistrica-Trnovo
00050000-5547-8e87-bc52-12f315c4993e	1295	Ivančna Gorica
00050000-5547-8e87-06ba-e958505fd384	2259	Ivanjkovci
00050000-5547-8e87-8e40-4dcf1e0db6fa	1411	Izlake
00050000-5547-8e87-a424-bcdb4301c544	6310	Izola/Isola
00050000-5547-8e87-6382-4e8b9478fa10	2222	Jakobski Dol
00050000-5547-8e87-c0e5-b12c2e31b13e	2221	Jarenina
00050000-5547-8e87-acd4-c53babae6a19	6254	Jelšane
00050000-5547-8e87-88eb-15a79f1264d0	4270	Jesenice
00050000-5547-8e87-8700-b837d3661b43	8261	Jesenice na Dolenjskem
00050000-5547-8e87-36cc-8d73dd7cc950	3273	Jurklošter
00050000-5547-8e87-dbdb-cd9d30d9b049	2223	Jurovski Dol
00050000-5547-8e87-1458-e130efc6218c	2256	Juršinci
00050000-5547-8e87-4c19-0123cce9da42	5214	Kal nad Kanalom
00050000-5547-8e87-7aff-eb2bba9ea482	3233	Kalobje
00050000-5547-8e87-4c11-c3c04cd01a0a	4246	Kamna Gorica
00050000-5547-8e87-d01f-b30e5bc02f8b	2351	Kamnica
00050000-5547-8e87-ca75-18798fa813a7	1241	Kamnik
00050000-5547-8e87-a8eb-035189cd06c5	5213	Kanal
00050000-5547-8e87-0a75-6e2127ea1536	8258	Kapele
00050000-5547-8e87-c8b5-0726d129c844	2362	Kapla
00050000-5547-8e87-d4c6-704a924b833c	2325	Kidričevo
00050000-5547-8e87-7647-19f692c37bd1	1412	Kisovec
00050000-5547-8e87-9de3-70c775d9b506	6253	Knežak
00050000-5547-8e87-f6d2-5171c51dfb04	5222	Kobarid
00050000-5547-8e87-5b31-beaa0d05e10b	9227	Kobilje
00050000-5547-8e87-d0ac-5b1a2f54adb9	1330	Kočevje
00050000-5547-8e87-5d7e-b6fcd27353de	1338	Kočevska Reka
00050000-5547-8e87-34e4-d8435ded7fcb	2276	Kog
00050000-5547-8e87-9775-2b2679b7f1bf	5211	Kojsko
00050000-5547-8e87-0be4-9233e1b9ec12	6223	Komen
00050000-5547-8e87-f647-a00ecab18d54	1218	Komenda
00050000-5547-8e87-7cd3-85486d922f25	6000	Koper/Capodistria 
00050000-5547-8e87-aef9-74ce22582dfa	6001	Koper/Capodistria - poštni predali
00050000-5547-8e87-9d35-25caae31801b	8282	Koprivnica
00050000-5547-8e87-25e7-452297835175	5296	Kostanjevica na Krasu
00050000-5547-8e87-3d93-062bec834d96	8311	Kostanjevica na Krki
00050000-5547-8e87-ad74-a536915dda80	1336	Kostel
00050000-5547-8e87-fca8-1b1b86924f03	6256	Košana
00050000-5547-8e87-e6d0-7704ebae3d29	2394	Kotlje
00050000-5547-8e87-e7df-653c6e531494	6240	Kozina
00050000-5547-8e87-1db8-277ad5ee19e8	3260	Kozje
00050000-5547-8e87-b967-c40ec7256d71	4000	Kranj 
00050000-5547-8e87-09c9-325ec72bc951	4001	Kranj - poštni predali
00050000-5547-8e87-8c1f-2f90f6f6a5ee	4280	Kranjska Gora
00050000-5547-8e87-8cc8-dcf5bd300cf4	1281	Kresnice
00050000-5547-8e87-ce97-aa4d85622f8d	4294	Križe
00050000-5547-8e87-4920-7e635dacfbee	9206	Križevci
00050000-5547-8e87-05cf-fb85b849f99e	9242	Križevci pri Ljutomeru
00050000-5547-8e87-45ac-e6a96b484d44	1301	Krka
00050000-5547-8e87-7430-deef0d1d3613	8296	Krmelj
00050000-5547-8e87-30d6-436c72ae02eb	4245	Kropa
00050000-5547-8e87-a315-5320c064ebbb	8262	Krška vas
00050000-5547-8e87-f5b5-98b31e616bc5	8270	Krško
00050000-5547-8e87-3bea-8955f541ecbb	9263	Kuzma
00050000-5547-8e87-074f-e050a9b6e160	2318	Laporje
00050000-5547-8e87-0c4a-8662ac3b370f	3270	Laško
00050000-5547-8e87-b465-551a7b070015	1219	Laze v Tuhinju
00050000-5547-8e87-ccd8-4fcd63240762	2230	Lenart v Slovenskih goricah
00050000-5547-8e87-702b-5472e030392a	9220	Lendava/Lendva
00050000-5547-8e87-f0aa-61aca1c1326d	4248	Lesce
00050000-5547-8e87-c730-2d82dcd3f94e	3261	Lesično
00050000-5547-8e87-115d-763901d2ef13	8273	Leskovec pri Krškem
00050000-5547-8e87-510c-05d3d0cd7459	2372	Libeliče
00050000-5547-8e87-db21-0472574393b8	2341	Limbuš
00050000-5547-8e87-2606-66da11920564	1270	Litija
00050000-5547-8e87-3b8a-ed1906aade17	3202	Ljubečna
00050000-5547-8e87-afe7-7ea9258c3499	1000	Ljubljana 
00050000-5547-8e87-d30b-351874bb7884	1001	Ljubljana - poštni predali
00050000-5547-8e87-5edc-130daeb15057	1231	Ljubljana - Črnuče
00050000-5547-8e87-e97d-f9d911234706	1261	Ljubljana - Dobrunje
00050000-5547-8e87-f1d0-bb92d2afd960	1260	Ljubljana - Polje
00050000-5547-8e87-fd91-35174a218f40	1210	Ljubljana - Šentvid
00050000-5547-8e87-3a09-0cc9da1f0fe3	1211	Ljubljana - Šmartno
00050000-5547-8e87-bba8-8f4da2818aac	3333	Ljubno ob Savinji
00050000-5547-8e87-380c-ef393ae65a67	9240	Ljutomer
00050000-5547-8e87-1c74-0790d49c6525	3215	Loče
00050000-5547-8e87-371f-515c9bc16e41	5231	Log pod Mangartom
00050000-5547-8e87-37da-a0ac75c81f74	1358	Log pri Brezovici
00050000-5547-8e87-7edb-fdafdbb8a54c	1370	Logatec
00050000-5547-8e87-9faf-e3fcfd9f0bcb	1371	Logatec
00050000-5547-8e87-194c-0b3e4e130feb	1434	Loka pri Zidanem Mostu
00050000-5547-8e87-001d-a72e39de5380	3223	Loka pri Žusmu
00050000-5547-8e87-91ba-5dd39913dfc5	6219	Lokev
00050000-5547-8e87-a2b8-5a83a786527d	1318	Loški Potok
00050000-5547-8e87-09b9-263cd7ea5087	2324	Lovrenc na Dravskem polju
00050000-5547-8e87-b523-ecfdcb2af5bd	2344	Lovrenc na Pohorju
00050000-5547-8e87-54f9-07604028db61	3334	Luče
00050000-5547-8e87-b31b-efa29782dbcc	1225	Lukovica
00050000-5547-8e87-8c36-cda7b9bcab43	9202	Mačkovci
00050000-5547-8e87-c7a5-226f2ab924ef	2322	Majšperk
00050000-5547-8e87-f87e-dbf2826184ae	2321	Makole
00050000-5547-8e87-4bc1-ba24545ecd87	9243	Mala Nedelja
00050000-5547-8e87-58c7-b2fef6edbdea	2229	Malečnik
00050000-5547-8e87-da21-01b6b7ffee2e	6273	Marezige
00050000-5547-8e87-4498-7ec7959ec1d3	2000	Maribor 
00050000-5547-8e87-6c39-0b76ec703cd0	2001	Maribor - poštni predali
00050000-5547-8e87-2879-d423e0cf7298	2206	Marjeta na Dravskem polju
00050000-5547-8e87-8ebd-f1b32991c76f	2281	Markovci
00050000-5547-8e87-448c-bd9160eff9e5	9221	Martjanci
00050000-5547-8e87-5404-ac4a0e330aab	6242	Materija
00050000-5547-8e87-ae71-da17ec02ca46	4211	Mavčiče
00050000-5547-8e87-013f-23b0a935c8bd	1215	Medvode
00050000-5547-8e87-47cb-c0edcc7c842b	1234	Mengeš
00050000-5547-8e87-27fa-2378cad73487	8330	Metlika
00050000-5547-8e87-05d3-b4e82b0d0523	2392	Mežica
00050000-5547-8e87-ef6b-2ac74d839803	2204	Miklavž na Dravskem polju
00050000-5547-8e87-1e08-d81d2ccc4960	2275	Miklavž pri Ormožu
00050000-5547-8e87-0fc1-b967119b30c9	5291	Miren
00050000-5547-8e87-41dc-008dedadfb91	8233	Mirna
00050000-5547-8e87-e328-620ef0e774ea	8216	Mirna Peč
00050000-5547-8e87-5f17-d85adcecfaef	2382	Mislinja
00050000-5547-8e87-ee70-40d3a26e4868	4281	Mojstrana
00050000-5547-8e87-516d-8e5d20b73998	8230	Mokronog
00050000-5547-8e87-a927-7ee62e90e3a4	1251	Moravče
00050000-5547-8e87-6323-84347f9af0a0	9226	Moravske Toplice
00050000-5547-8e87-ecec-281f9ca44ac5	5216	Most na Soči
00050000-5547-8e87-7a1c-ad648d0c0083	1221	Motnik
00050000-5547-8e87-bd76-7cc24d81086e	3330	Mozirje
00050000-5547-8e87-4679-539b3f30aa4d	9000	Murska Sobota 
00050000-5547-8e87-0fc4-c5b95a005c0b	9001	Murska Sobota - poštni predali
00050000-5547-8e87-f6d1-064db5cbc2c2	2366	Muta
00050000-5547-8e87-d9b5-f18d152955cb	4202	Naklo
00050000-5547-8e87-eff8-fe3ddb591792	3331	Nazarje
00050000-5547-8e87-33d8-bd820d22a88a	1357	Notranje Gorice
00050000-5547-8e87-9f7c-407aa5b9d833	3203	Nova Cerkev
00050000-5547-8e87-aaf0-3e122ceed361	5000	Nova Gorica 
00050000-5547-8e87-1910-899405e7d922	5001	Nova Gorica - poštni predali
00050000-5547-8e87-e4a1-45e05965b12e	1385	Nova vas
00050000-5547-8e87-6f2a-1898b956880e	8000	Novo mesto
00050000-5547-8e87-6ab2-9e717909429a	8001	Novo mesto - poštni predali
00050000-5547-8e87-4899-63792690e461	6243	Obrov
00050000-5547-8e87-c7d9-25006bcd7ae0	9233	Odranci
00050000-5547-8e87-916b-c18341b71f05	2317	Oplotnica
00050000-5547-8e87-eba1-7b92d371f167	2312	Orehova vas
00050000-5547-8e87-2bd4-26302364f084	2270	Ormož
00050000-5547-8e87-abab-553a1f9290d9	1316	Ortnek
00050000-5547-8e87-51c2-eaeaa3cdbebe	1337	Osilnica
00050000-5547-8e87-a05e-90acc29f064f	8222	Otočec
00050000-5547-8e87-f732-64a9a54d55ab	2361	Ožbalt
00050000-5547-8e87-16b5-47494d4cf3c3	2231	Pernica
00050000-5547-8e87-f6d9-6c9ebdbf9c98	2211	Pesnica pri Mariboru
00050000-5547-8e87-5f7b-75d0d9d0a234	9203	Petrovci
00050000-5547-8e87-3f93-2d9b2946dec4	3301	Petrovče
00050000-5547-8e87-410d-1bd0d9518d03	6330	Piran/Pirano
00050000-5547-8e87-691a-723e90fdfdb1	8255	Pišece
00050000-5547-8e87-3218-8a9b7759d9c1	6257	Pivka
00050000-5547-8e87-e24c-526fe6e7fb6a	6232	Planina
00050000-5547-8e87-9074-7ac6931d7028	3225	Planina pri Sevnici
00050000-5547-8e87-11b4-a973f578b0d6	6276	Pobegi
00050000-5547-8e87-4c2a-d8dab9fda390	8312	Podbočje
00050000-5547-8e87-b548-7f3f54a25b52	5243	Podbrdo
00050000-5547-8e87-4929-1309de3fcb80	3254	Podčetrtek
00050000-5547-8e87-7547-a70f33a3837a	2273	Podgorci
00050000-5547-8e87-75ab-52ee8f4318f6	6216	Podgorje
00050000-5547-8e87-a813-9327f99be94d	2381	Podgorje pri Slovenj Gradcu
00050000-5547-8e87-cd03-276566f068b6	6244	Podgrad
00050000-5547-8e87-ca86-dff14f5ab508	1414	Podkum
00050000-5547-8e87-4393-0026fc7ed9ad	2286	Podlehnik
00050000-5547-8e87-b03c-650457650d33	5272	Podnanos
00050000-5547-8e87-870d-fc01f7e3ca80	4244	Podnart
00050000-5547-8e87-ee79-5abc7e1ca21c	3241	Podplat
00050000-5547-8e87-7adf-7ff2354104eb	3257	Podsreda
00050000-5547-8e87-318f-be585b1af45c	2363	Podvelka
00050000-5547-8e87-ca80-399c252056cb	2208	Pohorje
00050000-5547-8e87-0c4c-ec5c9b6b2467	2257	Polenšak
00050000-5547-8e87-00af-ccea62bca8c4	1355	Polhov Gradec
00050000-5547-8e87-f9d5-135fc9f00e5a	4223	Poljane nad Škofjo Loko
00050000-5547-8e87-929f-520e39cd870f	2319	Poljčane
00050000-5547-8e87-5e4d-1045bf8dc23d	1272	Polšnik
00050000-5547-8e87-a45e-2243ee2498d5	3313	Polzela
00050000-5547-8e87-fb6d-8e599ccffb61	3232	Ponikva
00050000-5547-8e87-b72b-633176c4dc91	6320	Portorož/Portorose
00050000-5547-8e87-63d1-bec595ed4626	6230	Postojna
00050000-5547-8e87-429b-e0c399e62c94	2331	Pragersko
00050000-5547-8e87-ac37-f07a7b405707	3312	Prebold
00050000-5547-8e87-cdb6-0abbb63e205e	4205	Preddvor
00050000-5547-8e87-ea7e-d5428be0e61c	6255	Prem
00050000-5547-8e87-fe9f-b2e237b0ade9	1352	Preserje
00050000-5547-8e87-a29c-c3aa1c761d7f	6258	Prestranek
00050000-5547-8e87-90f8-4512efca57dc	2391	Prevalje
00050000-5547-8e87-917c-31b79e4289c1	3262	Prevorje
00050000-5547-8e87-1583-26cfa3b1ffa9	1276	Primskovo 
00050000-5547-8e87-20c7-1b162d5673c6	3253	Pristava pri Mestinju
00050000-5547-8e87-948e-fcaa23b5bf6e	9207	Prosenjakovci/Partosfalva
00050000-5547-8e87-5aae-a83526f6042e	5297	Prvačina
00050000-5547-8e87-7744-84af0870a94e	2250	Ptuj
00050000-5547-8e87-7dbc-1145ac2704c3	2323	Ptujska Gora
00050000-5547-8e87-1ce8-2b79c9ffa3bb	9201	Puconci
00050000-5547-8e87-b0e9-7804d4dcb015	2327	Rače
00050000-5547-8e87-8c62-f13fbc9f9cdd	1433	Radeče
00050000-5547-8e87-f9c6-62a165f99c97	9252	Radenci
00050000-5547-8e87-ed38-726678b23b78	2360	Radlje ob Dravi
00050000-5547-8e87-0716-470ec59d28d5	1235	Radomlje
00050000-5547-8e87-9073-6cacb46b6d31	4240	Radovljica
00050000-5547-8e87-1c33-5f71718a7936	8274	Raka
00050000-5547-8e87-72c4-26661c82d129	1381	Rakek
00050000-5547-8e87-41b6-c9bb29608bba	4283	Rateče - Planica
00050000-5547-8e87-2964-e51227ce682f	2390	Ravne na Koroškem
00050000-5547-8e87-9cb8-3ffc7571a13d	9246	Razkrižje
00050000-5547-8e87-fa5f-104c266c57f0	3332	Rečica ob Savinji
00050000-5547-8e87-e8d1-7b7a5c4b8167	5292	Renče
00050000-5547-8e87-9e52-7536b6e4157b	1310	Ribnica
00050000-5547-8e87-6606-a56e415a6200	2364	Ribnica na Pohorju
00050000-5547-8e87-ec5c-a74d0bf2a160	3272	Rimske Toplice
00050000-5547-8e87-2aaa-04fd23177bc9	1314	Rob
00050000-5547-8e87-c391-b5f9b2a1d48f	5215	Ročinj
00050000-5547-8e87-b720-55abc6884c53	3250	Rogaška Slatina
00050000-5547-8e87-6356-e77c21fe0ca8	9262	Rogašovci
00050000-5547-8e87-10b0-502e5726563b	3252	Rogatec
00050000-5547-8e87-7fcc-5e8006fb6df4	1373	Rovte
00050000-5547-8e87-695e-9a1f1d013b51	2342	Ruše
00050000-5547-8e87-db4d-617bb230eec3	1282	Sava
00050000-5547-8e87-6b7b-8c67c9aaf157	6333	Sečovlje/Sicciole
00050000-5547-8e87-dad4-92b78f9b888a	4227	Selca
00050000-5547-8e87-2b6f-add6c5bf7700	2352	Selnica ob Dravi
00050000-5547-8e87-3056-478e0254404e	8333	Semič
00050000-5547-8e87-9497-784702ee107c	8281	Senovo
00050000-5547-8e87-2023-442bbfa59246	6224	Senožeče
00050000-5547-8e87-939d-4a622cc5b89c	8290	Sevnica
00050000-5547-8e87-0958-d59a35ff9cce	6210	Sežana
00050000-5547-8e87-3318-762be2173ac7	2214	Sladki Vrh
00050000-5547-8e87-212f-08ed254902de	5283	Slap ob Idrijci
00050000-5547-8e87-4838-fb21f11b238a	2380	Slovenj Gradec
00050000-5547-8e87-18f8-91450c1e9d80	2310	Slovenska Bistrica
00050000-5547-8e87-bb10-27381c4d2137	3210	Slovenske Konjice
00050000-5547-8e87-276f-7c084cb41c0f	1216	Smlednik
00050000-5547-8e87-1429-1dc83c833d02	5232	Soča
00050000-5547-8e87-18f6-0186a5fb6b8d	1317	Sodražica
00050000-5547-8e87-8a57-65acf1dec49a	3335	Solčava
00050000-5547-8e87-468d-2bf96776d9e9	5250	Solkan
00050000-5547-8e87-7298-3c0afbc9a623	4229	Sorica
00050000-5547-8e87-bc17-6df1f207bcd3	4225	Sovodenj
00050000-5547-8e87-cd4b-a7eea7be31e1	5281	Spodnja Idrija
00050000-5547-8e87-7163-c578eb595d56	2241	Spodnji Duplek
00050000-5547-8e87-46d5-2ecaafac0b94	9245	Spodnji Ivanjci
00050000-5547-8e87-0e07-078f56e17a7a	2277	Središče ob Dravi
00050000-5547-8e87-7df9-d6281f51806f	4267	Srednja vas v Bohinju
00050000-5547-8e87-eab4-bbd0df138b95	8256	Sromlje 
00050000-5547-8e87-622f-9d180d9c4d23	5224	Srpenica
00050000-5547-8e87-1fb6-17c72b7eab78	1242	Stahovica
00050000-5547-8e87-c0d6-2211bd5a6c4c	1332	Stara Cerkev
00050000-5547-8e87-7d56-051bf6932304	8342	Stari trg ob Kolpi
00050000-5547-8e87-ef0d-b7128b19c803	1386	Stari trg pri Ložu
00050000-5547-8e87-96ba-d2d8a484590d	2205	Starše
00050000-5547-8e87-ff0a-827d3e0bb3ee	2289	Stoperce
00050000-5547-8e87-ed9c-1341b2e38076	8322	Stopiče
00050000-5547-8e87-8358-7dff50d6b830	3206	Stranice
00050000-5547-8e87-b7bc-9773fb62e143	8351	Straža
00050000-5547-8e87-93f0-9858134cbfe1	1313	Struge
00050000-5547-8e87-ea46-ca35ad0189f4	8293	Studenec
00050000-5547-8e87-be77-ee80cfbff153	8331	Suhor
00050000-5547-8e87-d796-94f3914a82db	2233	Sv. Ana v Slovenskih goricah
00050000-5547-8e87-ff1c-b0e66fde2e6b	2235	Sv. Trojica v Slovenskih goricah
00050000-5547-8e87-05d6-b0ca2cf592cc	2353	Sveti Duh na Ostrem Vrhu
00050000-5547-8e87-2439-0b3f0e488f0c	9244	Sveti Jurij ob Ščavnici
00050000-5547-8e87-1033-69535a5e8ad5	3264	Sveti Štefan
00050000-5547-8e87-849f-2bd938ce33b0	2258	Sveti Tomaž
00050000-5547-8e87-e07c-3e04a4cd7cdd	9204	Šalovci
00050000-5547-8e87-3cde-f126d45a4dac	5261	Šempas
00050000-5547-8e87-f0be-f6ecb5746950	5290	Šempeter pri Gorici
00050000-5547-8e87-0e56-e0919459b3a0	3311	Šempeter v Savinjski dolini
00050000-5547-8e87-60c7-08117d297297	4208	Šenčur
00050000-5547-8e87-5353-f48f782e1b33	2212	Šentilj v Slovenskih goricah
00050000-5547-8e87-9ed6-bcb6a0b56c12	8297	Šentjanž
00050000-5547-8e87-f5f0-27da71f0b7e5	2373	Šentjanž pri Dravogradu
00050000-5547-8e87-cd78-95092324ed9d	8310	Šentjernej
00050000-5547-8e87-20c4-b84d2d1c78a3	3230	Šentjur
00050000-5547-8e87-1dec-e0a82ed50d5a	3271	Šentrupert
00050000-5547-8e87-be5d-5652f8bb8f1c	8232	Šentrupert
00050000-5547-8e87-e02e-d33f5943fd98	1296	Šentvid pri Stični
00050000-5547-8e87-5112-550718aceaf2	8275	Škocjan
00050000-5547-8e87-8a3e-8f50ef7f284f	6281	Škofije
00050000-5547-8e87-36c0-3780d6fd709e	4220	Škofja Loka
00050000-5547-8e87-cc95-f026ef6625df	3211	Škofja vas
00050000-5547-8e87-80b8-8c1439c6b15f	1291	Škofljica
00050000-5547-8e87-9cf9-57e213ad505d	6274	Šmarje
00050000-5547-8e87-dcda-6b52ff1027fc	1293	Šmarje - Sap
00050000-5547-8e87-9634-9ceea4145e4c	3240	Šmarje pri Jelšah
00050000-5547-8e87-44b4-2deebb83f49e	8220	Šmarješke Toplice
00050000-5547-8e87-445d-cf02a0108fe1	2315	Šmartno na Pohorju
00050000-5547-8e87-6260-93ed5f96a345	3341	Šmartno ob Dreti
00050000-5547-8e87-9942-38f061837965	3327	Šmartno ob Paki
00050000-5547-8e87-b6c8-5bae3e89290b	1275	Šmartno pri Litiji
00050000-5547-8e87-321c-4c1b31476577	2383	Šmartno pri Slovenj Gradcu
00050000-5547-8e87-290f-a23dbbf28485	3201	Šmartno v Rožni dolini
00050000-5547-8e87-05af-405d42a55279	3325	Šoštanj
00050000-5547-8e87-6f2b-a97d74a05865	6222	Štanjel
00050000-5547-8e87-8bd3-5f8fd796d460	3220	Štore
00050000-5547-8e87-11b7-12bceace630c	3304	Tabor
00050000-5547-8e87-5169-f99cf421e737	3221	Teharje
00050000-5547-8e87-fed4-59d1b0b3f8a7	9251	Tišina
00050000-5547-8e87-a221-76afd5e05055	5220	Tolmin
00050000-5547-8e87-4e4a-54fe935c5e9d	3326	Topolšica
00050000-5547-8e87-514e-8ac7333d2131	2371	Trbonje
00050000-5547-8e87-cdf4-218cb705987b	1420	Trbovlje
00050000-5547-8e87-32e6-ad8923ca5124	8231	Trebelno 
00050000-5547-8e87-c665-2be626f1e6b1	8210	Trebnje
00050000-5547-8e87-e4a0-e0d5af1752be	5252	Trnovo pri Gorici
00050000-5547-8e87-5fe6-e1816b376d98	2254	Trnovska vas
00050000-5547-8e87-a010-69081fffffed	1222	Trojane
00050000-5547-8e87-d9c6-9e3dda706113	1236	Trzin
00050000-5547-8e87-4fc3-bf3d056de787	4290	Tržič
00050000-5547-8e87-7329-cf7cd7291b86	8295	Tržišče
00050000-5547-8e87-39f9-7c60cdb9cabd	1311	Turjak
00050000-5547-8e87-ce83-3eb337ddfe66	9224	Turnišče
00050000-5547-8e87-95fd-e55ac6dbdcfa	8323	Uršna sela
00050000-5547-8e87-f9b9-cfc4330c469f	1252	Vače
00050000-5547-8e87-9c6c-e22636abe9a7	3320	Velenje 
00050000-5547-8e87-da5b-db83fd2a2036	3322	Velenje - poštni predali
00050000-5547-8e87-010e-94bfbc448538	8212	Velika Loka
00050000-5547-8e87-5a2e-99c565c91035	2274	Velika Nedelja
00050000-5547-8e87-a577-59b04902bcd3	9225	Velika Polana
00050000-5547-8e87-fc06-7ca5162d0232	1315	Velike Lašče
00050000-5547-8e87-944d-511d61cc4601	8213	Veliki Gaber
00050000-5547-8e87-ce20-615855dc5f38	9241	Veržej
00050000-5547-8e87-0147-dca604f1850a	1312	Videm - Dobrepolje
00050000-5547-8e87-6b8c-86f65d1aed4d	2284	Videm pri Ptuju
00050000-5547-8e87-a314-b017b32e20bb	8344	Vinica
00050000-5547-8e87-4408-b4806dae29e8	5271	Vipava
00050000-5547-8e87-0df8-e7bd22632b6c	4212	Visoko
00050000-5547-8e87-810e-1e18cb1d169a	1294	Višnja Gora
00050000-5547-8e87-1e63-f793e05fdc17	3205	Vitanje
00050000-5547-8e87-d884-b322469cf72d	2255	Vitomarci
00050000-5547-8e87-193b-909a8ab2cd73	1217	Vodice
00050000-5547-8e87-afc1-4087b0659c5f	3212	Vojnik\t
00050000-5547-8e87-f894-b8f180ce207b	5293	Volčja Draga
00050000-5547-8e87-5a4e-463cf3ce3689	2232	Voličina
00050000-5547-8e87-2f9d-654cca0621e8	3305	Vransko
00050000-5547-8e87-992c-33c2d9780603	6217	Vremski Britof
00050000-5547-8e87-f865-da1f523d8892	1360	Vrhnika
00050000-5547-8e87-12f9-2c8e3d1ed2a1	2365	Vuhred
00050000-5547-8e87-ac0f-f8b692bcb625	2367	Vuzenica
00050000-5547-8e87-7b65-af9edd0bc553	8292	Zabukovje 
00050000-5547-8e87-9d24-aa1017fdbec9	1410	Zagorje ob Savi
00050000-5547-8e87-44ab-08d60bc29d44	1303	Zagradec
00050000-5547-8e87-914b-6896f7cf7e35	2283	Zavrč
00050000-5547-8e87-a71d-d47e08bbca7f	8272	Zdole 
00050000-5547-8e87-4053-f1e181282ad7	4201	Zgornja Besnica
00050000-5547-8e87-deef-57943be2f093	2242	Zgornja Korena
00050000-5547-8e87-85a5-5d14f08a0a96	2201	Zgornja Kungota
00050000-5547-8e87-cad9-f46b11a28897	2316	Zgornja Ložnica
00050000-5547-8e87-e662-b9b972df63d8	2314	Zgornja Polskava
00050000-5547-8e87-ecc3-04bef33e41c3	2213	Zgornja Velka
00050000-5547-8e87-4063-e12c30a4164a	4247	Zgornje Gorje
00050000-5547-8e87-7a99-6377a859715b	4206	Zgornje Jezersko
00050000-5547-8e87-3b05-cfd8d1a24101	2285	Zgornji Leskovec
00050000-5547-8e87-50da-2cb6b842e9c1	1432	Zidani Most
00050000-5547-8e87-8077-8588c9d8b082	3214	Zreče
00050000-5547-8e87-f35b-5a939fffe68d	4209	Žabnica
00050000-5547-8e87-c508-36e19130829f	3310	Žalec
00050000-5547-8e87-fb8b-796dab46f4f9	4228	Železniki
00050000-5547-8e87-28cd-6efdb145b013	2287	Žetale
00050000-5547-8e87-3c1f-ca812b2c3ff0	4226	Žiri
00050000-5547-8e87-01e6-7987ae2859b8	4274	Žirovnica
00050000-5547-8e87-f83f-5f4db0eadf7c	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 2129802)
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
-- TOC entry 2642 (class 0 OID 2129625)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 2129691)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 2129814)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 2129919)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 2129963)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 2129843)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 2129787)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 2129777)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 2129953)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 2129909)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 2129491)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5547-8e87-7019-6722b93203ba	00010000-5547-8e87-42a9-d75c84d1b21c	2015-05-04 17:21:44	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROwXsJhIqMQ4FajrCiNfgbuu.Bqum5p9O";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 2129852)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 2129531)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5547-8e87-2c0a-ad417bf6f50a	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5547-8e87-7fba-21ae14315e6c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5547-8e87-8e61-7d814acc2bd3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5547-8e87-aad1-b3fe96fc4d94	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5547-8e87-a8a0-53bcf04177d8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5547-8e87-14e4-9b27ca48f378	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 2129514)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5547-8e87-7019-6722b93203ba	00020000-5547-8e87-aad1-b3fe96fc4d94
00010000-5547-8e87-42a9-d75c84d1b21c	00020000-5547-8e87-aad1-b3fe96fc4d94
\.


--
-- TOC entry 2668 (class 0 OID 2129866)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 2129808)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 2129758)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 2129590)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 2129764)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 2129944)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 2129660)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 2129500)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5547-8e87-42a9-d75c84d1b21c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROQ0VEQiMC.3CKJb2arP4YV0XJKWzbU.C	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5547-8e87-7019-6722b93203ba	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 2129994)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 2129706)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 2129835)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 2129901)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 2129734)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 2129984)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 2129891)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 2129555)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 2130033)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 2130026)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 2129943)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 2129724)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 2129757)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 2129686)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 2129887)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 2129704)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 2129751)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 2129800)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 2129827)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 2129658)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 2129564)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 2129622)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 2129588)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 2129544)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 2129529)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 2129833)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 2129865)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 2129980)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 2129615)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 2129646)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 2129806)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2254 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 2129636)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 2129695)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 2129818)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 2129925)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 2129968)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 2129850)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 2129791)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 2129782)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 2129962)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 2129916)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 2129499)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 2129856)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 2129518)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 2129538)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 2129874)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 2129813)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 2129763)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 2129595)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 2129773)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 2129952)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 2129671)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 2129512)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 2130008)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 2129710)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 2129841)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 2129907)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 2129746)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 2129993)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 2129900)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 2129731)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 2129617)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2250 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2251 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2252 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2378 (class 1259 OID 2129834)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 2129820)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 2129819)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 2129711)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 2129890)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 2129888)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 2129889)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 2129981)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 2129982)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 2129983)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 2130011)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 2130010)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 2130009)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 2129673)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 2129672)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 2129624)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 2129623)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 2129857)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 2129752)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 2129545)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 2129546)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 2129877)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 2129876)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 2129875)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 2129696)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 2129698)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 2129697)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 2129786)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 2129784)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 2129783)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 2129785)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 2129519)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 2129520)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 2129842)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 2129807)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 2129917)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 2129918)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 2129638)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 2129637)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2297 (class 1259 OID 2129639)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 2129926)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 2129927)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 2130036)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 2130035)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 2130038)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 2130034)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 2130037)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 2129908)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 2129795)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 2129794)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 2129792)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 2129793)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2246 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 2130028)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 2130027)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 2129705)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 2129566)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 2129565)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 2129596)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 2129597)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 2129776)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 2129775)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 2129774)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 2129733)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 2129729)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 2129726)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 2129727)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 2129725)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 2129730)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 2129728)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 2129616)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 2129687)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 2129689)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 2129688)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 2129690)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 2129801)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 2129589)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 2129659)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2257 (class 1259 OID 2129513)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2386 (class 1259 OID 2129851)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2266 (class 1259 OID 2129530)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2249 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 2129647)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 2129969)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 2129539)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 2129732)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 2130169)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 2130154)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 2130159)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 2130179)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 2130149)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 2130174)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 2130164)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 2130084)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 2130264)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 2130259)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 2130254)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 2130144)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 2130304)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 2130294)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 2130299)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 2130244)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 2130339)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 2130344)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 2130349)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 2130364)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 2130359)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 2130354)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 2130119)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 2130114)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 2130094)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 2130089)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 2130069)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 2130274)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 2130184)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 2130049)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 2130054)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 2130289)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 2130284)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 2130279)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 2130124)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 2130134)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 2130129)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 2130219)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 2130209)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 2130204)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 2130214)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 2130039)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 2130044)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 2130269)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 2130249)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 2130314)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 2130319)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 2130104)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 2130099)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 2130109)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 2130324)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 2130329)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 2130389)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 2130384)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 2130399)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 2130379)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 2130394)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 2130309)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 2130239)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 2130234)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 2130224)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 2130229)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 2130374)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 2130369)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 2130139)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 2130334)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 2130064)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 2130059)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 2130074)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 2130079)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 2130199)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 2130194)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 2130189)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-04 17:21:44 CEST

--
-- PostgreSQL database dump complete
--

