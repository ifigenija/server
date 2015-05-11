--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-11 11:06:11 CEST

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
-- TOC entry 179 (class 1259 OID 2883703)
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
-- TOC entry 225 (class 1259 OID 2884185)
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
-- TOC entry 224 (class 1259 OID 2884168)
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
-- TOC entry 217 (class 1259 OID 2884083)
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
-- TOC entry 193 (class 1259 OID 2883868)
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
-- TOC entry 196 (class 1259 OID 2883909)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 2883830)
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
-- TOC entry 212 (class 1259 OID 2884034)
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
-- TOC entry 191 (class 1259 OID 2883855)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 2883903)
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
-- TOC entry 201 (class 1259 OID 2883952)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 2883977)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 2883804)
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
-- TOC entry 180 (class 1259 OID 2883712)
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
-- TOC entry 181 (class 1259 OID 2883723)
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
-- TOC entry 184 (class 1259 OID 2883774)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 2883677)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 2883696)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 2883984)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 2884014)
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
-- TOC entry 221 (class 1259 OID 2884125)
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
-- TOC entry 183 (class 1259 OID 2883754)
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
-- TOC entry 186 (class 1259 OID 2883796)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 2883958)
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
-- TOC entry 185 (class 1259 OID 2883781)
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
-- TOC entry 190 (class 1259 OID 2883847)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 2883970)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 2884074)
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
-- TOC entry 220 (class 1259 OID 2884118)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 2883999)
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
-- TOC entry 200 (class 1259 OID 2883943)
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
-- TOC entry 199 (class 1259 OID 2883933)
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
-- TOC entry 219 (class 1259 OID 2884108)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 2884064)
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
-- TOC entry 173 (class 1259 OID 2883647)
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
-- TOC entry 172 (class 1259 OID 2883645)
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
-- TOC entry 209 (class 1259 OID 2884008)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 2883687)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 2883670)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 2884022)
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
-- TOC entry 203 (class 1259 OID 2883964)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 2883914)
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
-- TOC entry 182 (class 1259 OID 2883746)
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
-- TOC entry 198 (class 1259 OID 2883920)
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
-- TOC entry 218 (class 1259 OID 2884099)
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
-- TOC entry 188 (class 1259 OID 2883816)
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
-- TOC entry 174 (class 1259 OID 2883656)
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
-- TOC entry 223 (class 1259 OID 2884150)
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
-- TOC entry 192 (class 1259 OID 2883862)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 2883991)
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
-- TOC entry 214 (class 1259 OID 2884056)
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
-- TOC entry 194 (class 1259 OID 2883890)
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
-- TOC entry 222 (class 1259 OID 2884140)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 2884047)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 2883650)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 2883703)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 2884185)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 2884168)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 2884083)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 2883868)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 2883909)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 2883830)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5550-7102-6643-57ac15043294	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5550-7102-37f6-a933c621f539	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5550-7102-48a8-3304a9d66b59	AL	ALB	008	Albania 	Albanija	\N
00040000-5550-7102-5d86-35f8e3df6bdd	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5550-7102-c6e1-5b6ec5c3b1ba	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5550-7102-77bd-04d0a60fdfe1	AD	AND	020	Andorra 	Andora	\N
00040000-5550-7102-100c-4bf0bdc753ea	AO	AGO	024	Angola 	Angola	\N
00040000-5550-7102-41ee-364b6e7ec8b9	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5550-7102-3da2-23bb7419f473	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5550-7102-7557-6f7081a08785	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5550-7102-9ab7-c02e260281cc	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5550-7102-102f-edf2aaf4e1c3	AM	ARM	051	Armenia 	Armenija	\N
00040000-5550-7102-66fe-7a5ad2713362	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5550-7102-1ef2-dcfc69cf6fcd	AU	AUS	036	Australia 	Avstralija	\N
00040000-5550-7102-e9b1-edd367d98f3e	AT	AUT	040	Austria 	Avstrija	\N
00040000-5550-7102-9254-c37b83d77bb4	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5550-7102-e8ed-7252cd701303	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5550-7102-99fb-1035a7305603	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5550-7102-94ae-cb2ccd9597db	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5550-7102-e4e2-62b739b2bf40	BB	BRB	052	Barbados 	Barbados	\N
00040000-5550-7102-614e-ec45fe943b65	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5550-7102-f0fc-764b003557d2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5550-7102-8020-4c6906eecb71	BZ	BLZ	084	Belize 	Belize	\N
00040000-5550-7102-f7b1-9560f078c49d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5550-7102-cb42-cb8a839db83a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5550-7102-3ad0-a3e1e2acb5c9	BT	BTN	064	Bhutan 	Butan	\N
00040000-5550-7102-c34c-bf8d1dc7c867	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5550-7102-e3cd-709a0d04b0b6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5550-7102-b453-a971911ea470	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5550-7102-eef6-4950a4f1873f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5550-7102-4ae0-686740e18ce9	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5550-7102-ba44-cbd4e88da239	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5550-7102-4aeb-bfa87c6d0f0f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5550-7102-3e55-1c49017603f3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5550-7102-a307-25c335082a0a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5550-7102-9f30-85d1682e1f30	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5550-7102-7bd8-fdaa89b1c50a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5550-7102-d8a8-1d09a47e0e40	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5550-7102-d0c7-70756def4ee4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5550-7102-94c8-aaf2164707bb	CA	CAN	124	Canada 	Kanada	\N
00040000-5550-7102-0fc3-25fb28614e62	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5550-7102-4017-4e602d719d6c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5550-7102-187b-77038d049492	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5550-7102-59cc-871adbd42bd4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5550-7102-c649-f73b42d930ad	CL	CHL	152	Chile 	Čile	\N
00040000-5550-7102-eddb-db8879e60c42	CN	CHN	156	China 	Kitajska	\N
00040000-5550-7102-4d4d-ae76c90e7800	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5550-7102-1920-f0f85ad8ede1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5550-7102-5499-5452e9116ea3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5550-7102-7a92-87d371e7782a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5550-7102-03ad-de41aad8d7e4	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5550-7102-8361-27fc6d8a174b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5550-7102-35e9-992e8e3a6f85	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5550-7102-0ecf-55103345b5c7	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5550-7102-1320-196ac56bfeed	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5550-7102-c900-92690f91bdc5	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5550-7102-296d-b316ac19fcb6	CU	CUB	192	Cuba 	Kuba	\N
00040000-5550-7102-7266-93b0c2704cf9	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5550-7102-3b3e-8622dd49a034	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5550-7102-5ae1-5a10d14a899d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5550-7102-fa79-d2c4897cbac5	DK	DNK	208	Denmark 	Danska	\N
00040000-5550-7102-b8f1-f886a840934d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5550-7102-5c25-d74a55dee4c1	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5550-7102-78f6-548726ed910a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5550-7102-7274-63ec4694f1fa	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5550-7102-b198-54db6d1a1c57	EG	EGY	818	Egypt 	Egipt	\N
00040000-5550-7102-4e62-19075de2ca23	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5550-7102-13ff-24ab9a8f30e6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5550-7102-00d7-fca03d4ceeed	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5550-7102-fd25-db9d245da178	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5550-7102-c9f3-11afd8310633	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5550-7102-ae0f-54b52c07ff46	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5550-7102-e50a-7ff13a2e724c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5550-7102-298f-6254f982b45b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5550-7102-be1d-9a125e0fce6a	FI	FIN	246	Finland 	Finska	\N
00040000-5550-7102-a679-0f7ccd494e52	FR	FRA	250	France 	Francija	\N
00040000-5550-7102-c368-45f0dd12229f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5550-7102-664f-317b2cfc2706	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5550-7102-2f32-c48dd98e2dc7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5550-7102-1f72-d438579ba3db	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5550-7102-7d44-ab20aa52948f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5550-7102-e3cd-db348f453b86	GM	GMB	270	Gambia 	Gambija	\N
00040000-5550-7102-6c82-a76eef599f72	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5550-7102-b210-d8c0c0506123	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5550-7102-576e-37df075bb21a	GH	GHA	288	Ghana 	Gana	\N
00040000-5550-7102-cd25-bacd351ff69f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5550-7102-f020-36823d90c790	GR	GRC	300	Greece 	Grčija	\N
00040000-5550-7102-eb7e-dbfdb3b15f65	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5550-7102-ff19-4160642ed0d3	GD	GRD	308	Grenada 	Grenada	\N
00040000-5550-7102-418d-df1d1e05a3bb	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5550-7102-a349-aa142b83ba92	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5550-7102-1b06-4ca94410df66	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5550-7102-e690-adf8d3f8efd1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5550-7102-c2b7-0fabc5b2200c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5550-7102-4c02-a3995dcba067	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5550-7102-4292-cfe31499157c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5550-7102-dc13-6740180e50ab	HT	HTI	332	Haiti 	Haiti	\N
00040000-5550-7102-4f6b-a5e8668d0707	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5550-7102-cf25-b36456343a2e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5550-7102-f257-5dc95e549024	HN	HND	340	Honduras 	Honduras	\N
00040000-5550-7102-9768-4cc2c04207ba	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5550-7102-6f62-20bcba6b10fa	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5550-7102-06d8-159911064666	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5550-7102-7544-413e1d922816	IN	IND	356	India 	Indija	\N
00040000-5550-7102-6329-160ae1a97040	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5550-7102-eeab-fb3654b7982f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5550-7102-5f1a-b0f0f9c8985d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5550-7102-72ac-b19e9f1a221e	IE	IRL	372	Ireland 	Irska	\N
00040000-5550-7102-b016-9c3c66eb0a24	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5550-7102-0c16-2e9ad47bc5f7	IL	ISR	376	Israel 	Izrael	\N
00040000-5550-7102-fb2b-a77b5464356c	IT	ITA	380	Italy 	Italija	\N
00040000-5550-7102-52d1-dc2a186a4857	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5550-7102-7479-df62f2b319d9	JP	JPN	392	Japan 	Japonska	\N
00040000-5550-7102-5172-5bdedc8451ca	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5550-7102-d712-ac4c0059ca40	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5550-7102-8b75-0d6962a60577	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5550-7102-8bb4-26227b5c6c4b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5550-7102-42cd-e785680a421c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5550-7102-f687-84d7c3fe8f0b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5550-7102-9aef-1a9841ef59ef	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5550-7102-97c3-3fe16cfe5550	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5550-7102-f2fc-3390c223784b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5550-7102-5a00-9e2e1512b373	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5550-7102-3db4-0af87e0c5d55	LV	LVA	428	Latvia 	Latvija	\N
00040000-5550-7102-0aef-ceee06716e76	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5550-7102-ba6b-f3a1310d5d1c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5550-7102-dcc7-abf0a98a9fd4	LR	LBR	430	Liberia 	Liberija	\N
00040000-5550-7102-b759-6f279d357e04	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5550-7102-f495-60a80e21300f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5550-7102-2ffc-6749a6ccf5df	LT	LTU	440	Lithuania 	Litva	\N
00040000-5550-7102-f786-9edeabd469ee	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5550-7102-46cf-c916fec26c69	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5550-7102-7b00-e9486700b240	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5550-7102-3e10-08b501cc1e89	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5550-7102-3a6a-92e517860a0d	MW	MWI	454	Malawi 	Malavi	\N
00040000-5550-7102-d72f-d4ae33c4ac24	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5550-7102-80c1-1f215562b1bd	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5550-7102-a85e-359d1f5aa29e	ML	MLI	466	Mali 	Mali	\N
00040000-5550-7102-f373-f359730c7ec8	MT	MLT	470	Malta 	Malta	\N
00040000-5550-7102-b260-1e85281985ef	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5550-7102-cbd8-815aaf889b96	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5550-7102-ee7b-6b191d49592a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5550-7102-f7ad-85c6aeb39c6a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5550-7102-2338-0d675b94fab7	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5550-7102-b476-b82845a23126	MX	MEX	484	Mexico 	Mehika	\N
00040000-5550-7102-2555-7880fcd23c10	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5550-7102-10f2-9743a126eb66	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5550-7102-db52-9ab202743150	MC	MCO	492	Monaco 	Monako	\N
00040000-5550-7102-1d45-79ff90ecbeff	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5550-7102-b6e8-a0bf7fbef210	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5550-7102-99cf-d44b1c2a4446	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5550-7102-cce9-2ed63198d593	MA	MAR	504	Morocco 	Maroko	\N
00040000-5550-7102-17c6-794ab65e2720	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5550-7102-79da-88c97342cfd0	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5550-7102-1a2e-1ad9fd187e06	NA	NAM	516	Namibia 	Namibija	\N
00040000-5550-7102-5163-a3d4ef0a5c86	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5550-7102-6b5d-cd9a7a432d83	NP	NPL	524	Nepal 	Nepal	\N
00040000-5550-7102-81f6-3b142838c8f4	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5550-7102-cc25-4ecfea45270e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5550-7102-fcb3-3f3388355596	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5550-7102-c667-fa5685dfb066	NE	NER	562	Niger 	Niger 	\N
00040000-5550-7102-0a84-d6d3aa4ed100	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5550-7102-0a74-f1698d7a73a3	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5550-7102-7723-df6caa5e3b2a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5550-7102-24c1-5e7bdc6e1276	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5550-7102-6f34-ef180d70d9e3	NO	NOR	578	Norway 	Norveška	\N
00040000-5550-7102-6b0e-bbf99c15d92a	OM	OMN	512	Oman 	Oman	\N
00040000-5550-7102-a8da-c3a52a4a9dc8	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5550-7102-0ddf-470b569edf37	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5550-7102-4bf7-4d652474950c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5550-7102-da3f-65b2a7509110	PA	PAN	591	Panama 	Panama	\N
00040000-5550-7102-9ad2-901c0916c224	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5550-7102-dab6-9de949e1ebfc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5550-7102-99e4-684468356402	PE	PER	604	Peru 	Peru	\N
00040000-5550-7102-8f8b-d355c19aeea9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5550-7102-e3e2-fae102a56647	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5550-7102-2439-a7cfe5534cc5	PL	POL	616	Poland 	Poljska	\N
00040000-5550-7102-f631-c0707fd6245f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5550-7102-e72f-22197d637b75	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5550-7102-8da5-329de0ba6b2b	QA	QAT	634	Qatar 	Katar	\N
00040000-5550-7102-a477-7bd8efb37e35	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5550-7102-1780-9cbaf1c12c8d	RO	ROU	642	Romania 	Romunija	\N
00040000-5550-7102-2922-e46b7d598d83	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5550-7102-0517-365ec8deaead	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5550-7102-3052-8d48dedfeb19	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5550-7102-ad2a-cf06fc9a69de	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5550-7102-8b0e-ac8f64926d9c	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5550-7102-fe45-04eed79d580d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5550-7102-a0b1-0869a64f53c4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5550-7102-a96e-aa67c9ecf5a3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5550-7102-1236-a32a31eeea48	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5550-7102-a077-6be28d52ae33	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5550-7102-3b45-1f3428e12979	SM	SMR	674	San Marino 	San Marino	\N
00040000-5550-7102-bcf0-41d4e1998bad	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5550-7102-9fa2-2b978fa78be7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5550-7102-3c2d-ecd0615fc5dd	SN	SEN	686	Senegal 	Senegal	\N
00040000-5550-7102-1b4b-607e8bc94c8e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5550-7102-56cc-4b617deb3480	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5550-7102-5a78-dd90e58beda8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5550-7102-ed1a-6940a5df2fd6	SG	SGP	702	Singapore 	Singapur	\N
00040000-5550-7102-30b5-c7fe049ee128	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5550-7102-960b-3c137015816d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5550-7102-7b3d-c6b6e9d8e0f4	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5550-7102-6db6-c687d7c4603e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5550-7102-30f8-507a0580cf7f	SO	SOM	706	Somalia 	Somalija	\N
00040000-5550-7102-10d8-3711974d226d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5550-7102-e26f-bd15b8780204	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5550-7102-6b12-9727511d2715	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5550-7102-c370-63813659eb65	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5550-7102-8134-e39cbc4ed385	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5550-7102-e1f0-d1298f89c00a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5550-7102-f727-e90abcfb1965	SR	SUR	740	Suriname 	Surinam	\N
00040000-5550-7102-f0e2-d21d23fd40cc	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5550-7102-18ba-4e83e506d1da	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5550-7102-b47c-545134cf4431	SE	SWE	752	Sweden 	Švedska	\N
00040000-5550-7102-9948-388ba4394c98	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5550-7102-5311-03baaabbc76a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5550-7102-c180-b9620f2fb61d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5550-7102-3aaa-b4bfeebe5b40	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5550-7102-f68c-e15668e9b724	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5550-7102-0bce-c2fcdc30502c	TH	THA	764	Thailand 	Tajska	\N
00040000-5550-7102-5d2e-3e939050812a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5550-7102-8f88-c67fe1efedd6	TG	TGO	768	Togo 	Togo	\N
00040000-5550-7102-7ecc-791e6f1f2597	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5550-7102-8d50-a94609f02335	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5550-7102-a6fb-164e4186cceb	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5550-7102-e5f0-9395683d84c4	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5550-7102-75f5-83354f1721c5	TR	TUR	792	Turkey 	Turčija	\N
00040000-5550-7102-ad43-f8230d9b6c2e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5550-7102-500f-0d700997b74d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5550-7102-f511-88ca215b1487	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5550-7102-3ed8-b326b4642815	UG	UGA	800	Uganda 	Uganda	\N
00040000-5550-7102-f1b1-f0ae2c196b90	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5550-7102-5038-f3d04235a1d4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5550-7102-3ca1-aae1239d172a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5550-7102-d711-15d2a3fae17e	US	USA	840	United States 	Združene države Amerike	\N
00040000-5550-7102-12cf-1b85b981130a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5550-7102-5704-3c0d05144049	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5550-7102-0107-7d2e2c727de9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5550-7102-54a8-90230c9cb210	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5550-7102-0e82-2c54db06d6bf	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5550-7102-0a2d-03eabe8070fe	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5550-7102-30cd-588b71d36301	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5550-7102-ef4f-a178a942487b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5550-7102-18ec-704dc5d62800	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5550-7102-dd08-f53efdbbbdd8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5550-7102-0670-876b6542991e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5550-7102-7109-ef433af0c26d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5550-7102-847d-b50171699668	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 2884034)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 2883855)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 2883903)
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
-- TOC entry 2658 (class 0 OID 2883952)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 2883977)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 2883804)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5550-7103-3f4c-3198efd2ac7b	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5550-7103-237e-843694fbc41d	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5550-7103-e82a-a7f35be8dcd9	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5550-7103-a7f7-b68a5440391a	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5550-7103-e57f-eaad00e2c6db	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5550-7103-2c7f-f3982ea46d1d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5550-7103-df4d-48a9f11f3724	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5550-7103-6fae-8e9634bc6eba	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5550-7103-f725-d714f32ca40b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5550-7103-91a7-05d328ad7eb9	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 2883712)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5550-7103-99dc-da309fe39670	00000000-5550-7103-e57f-eaad00e2c6db	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5550-7103-861c-3d3c7cec1d12	00000000-5550-7103-e57f-eaad00e2c6db	00010000-5550-7103-cdb1-8168f8d18689	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5550-7103-d219-53575c65e777	00000000-5550-7103-2c7f-f3982ea46d1d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 2883723)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 2883774)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 2883677)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5550-7102-819b-37d37a074079	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5550-7102-ff8a-45626cfd38f7	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5550-7102-c9e7-ca9da44c63c8	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5550-7102-ede1-3754730318f4	Abonma-read	Abonma - branje	f
00030000-5550-7102-6c66-29b8a031f01e	Abonma-write	Abonma - spreminjanje	f
00030000-5550-7102-c197-986de1a4daba	Alternacija-read	Alternacija - branje	f
00030000-5550-7102-894f-7dd2f27582b3	Alternacija-write	Alternacija - spreminjanje	f
00030000-5550-7102-c6b9-669e060a094f	Arhivalija-read	Arhivalija - branje	f
00030000-5550-7102-9cdd-d2d8bed60eba	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5550-7102-4438-d80e96172969	Besedilo-read	Besedilo - branje	f
00030000-5550-7102-ef83-3faa8d7e1302	Besedilo-write	Besedilo - spreminjanje	f
00030000-5550-7102-cfc7-f27b2d448c70	DogodekIzven-read	DogodekIzven - branje	f
00030000-5550-7102-a47c-8ad18d24128f	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5550-7102-38c3-f663d96f491a	Dogodek-read	Dogodek - branje	f
00030000-5550-7102-e5b1-e749d6348ae4	Dogodek-write	Dogodek - spreminjanje	f
00030000-5550-7102-5a9b-cf3b4cd5efaa	Drzava-read	Drzava - branje	f
00030000-5550-7102-3348-081c3ef595d9	Drzava-write	Drzava - spreminjanje	f
00030000-5550-7102-8d9a-a0fa8bff9965	Funkcija-read	Funkcija - branje	f
00030000-5550-7102-b84b-305767403f34	Funkcija-write	Funkcija - spreminjanje	f
00030000-5550-7102-a975-f407a618ebb0	Gostovanje-read	Gostovanje - branje	f
00030000-5550-7102-a5ee-730c132a93f5	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5550-7102-7cd1-2026a5ce6f68	Gostujoca-read	Gostujoca - branje	f
00030000-5550-7102-5542-9f583b125cd6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5550-7102-bd23-ee07096eb821	Kupec-read	Kupec - branje	f
00030000-5550-7102-3cda-5c8a1070e758	Kupec-write	Kupec - spreminjanje	f
00030000-5550-7102-7cb1-e216fde5e67b	NacinPlacina-read	NacinPlacina - branje	f
00030000-5550-7102-3df3-0e06bf0614d9	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5550-7102-3c53-65fbf093432c	Option-read	Option - branje	f
00030000-5550-7102-958d-c5c94c3875b0	Option-write	Option - spreminjanje	f
00030000-5550-7102-2b23-dcfaec7fdf75	OptionValue-read	OptionValue - branje	f
00030000-5550-7102-61f7-1b66d0b71e42	OptionValue-write	OptionValue - spreminjanje	f
00030000-5550-7102-0fdc-fbb00a10afef	Oseba-read	Oseba - branje	f
00030000-5550-7102-f0a8-bac71c108e54	Oseba-write	Oseba - spreminjanje	f
00030000-5550-7102-de50-35d1c08c1029	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5550-7102-0348-cf1369d77a9b	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5550-7102-6115-a6e2b90831bf	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5550-7102-8d37-4a045ae22c62	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5550-7102-d1c5-a9362c9bc659	Pogodba-read	Pogodba - branje	f
00030000-5550-7102-db1e-6722cd7289b6	Pogodba-write	Pogodba - spreminjanje	f
00030000-5550-7102-2652-a5fea2092fc2	Popa-read	Popa - branje	f
00030000-5550-7102-44ba-e9488f2137b2	Popa-write	Popa - spreminjanje	f
00030000-5550-7102-bedd-26e960347ec1	Posta-read	Posta - branje	f
00030000-5550-7102-3afe-e122f94325a7	Posta-write	Posta - spreminjanje	f
00030000-5550-7102-3432-008bc06b868c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5550-7102-a4c3-3fb3c2612d5d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5550-7102-6ba7-560da90ac434	PostniNaslov-read	PostniNaslov - branje	f
00030000-5550-7102-d854-0fe123f1ed2f	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5550-7102-f3c5-e131ff7798e6	Predstava-read	Predstava - branje	f
00030000-5550-7102-8478-024dd58a14b2	Predstava-write	Predstava - spreminjanje	f
00030000-5550-7102-e1af-658ed93e495f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5550-7102-5443-7f07ee875780	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5550-7102-5639-38d85fb2b2e3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5550-7102-c5fe-20c6a963fccf	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5550-7102-8a2d-769dd0a6ae57	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5550-7102-a099-9de2a06ac29f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5550-7102-faa3-10c19abcd4fb	Prostor-read	Prostor - branje	f
00030000-5550-7102-ebce-5fed4c454a9b	Prostor-write	Prostor - spreminjanje	f
00030000-5550-7102-6247-bd18e7899e8c	Racun-read	Racun - branje	f
00030000-5550-7102-2122-340ef910254a	Racun-write	Racun - spreminjanje	f
00030000-5550-7102-f096-16acab07a427	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5550-7102-4a03-f735d9458c69	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5550-7102-538c-e0fa0f8153f9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5550-7102-3ebf-57036d0eda3a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5550-7102-6abe-9eb66771b78e	Rekvizit-read	Rekvizit - branje	f
00030000-5550-7102-c981-353caeab3cb9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5550-7102-12ab-7c807dd7cb88	Rezervacija-read	Rezervacija - branje	f
00030000-5550-7102-f994-56727ffd1214	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5550-7102-636f-2467ce873f16	SedezniRed-read	SedezniRed - branje	f
00030000-5550-7102-1ae8-633e93f50b82	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5550-7102-fa83-b1ecc4d54e70	Sedez-read	Sedez - branje	f
00030000-5550-7102-f864-ef5d688689aa	Sedez-write	Sedez - spreminjanje	f
00030000-5550-7102-b4d4-a716345eb75d	Sezona-read	Sezona - branje	f
00030000-5550-7102-4b80-e90d7b4f797b	Sezona-write	Sezona - spreminjanje	f
00030000-5550-7102-e836-2ee50847d6e3	Telefonska-read	Telefonska - branje	f
00030000-5550-7102-8939-3808870a6fc9	Telefonska-write	Telefonska - spreminjanje	f
00030000-5550-7102-7ba7-511cd5c8d158	TerminStoritve-read	TerminStoritve - branje	f
00030000-5550-7102-7f4b-5e3f45190d12	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5550-7102-9b7c-48326bf96f0f	TipFunkcije-read	TipFunkcije - branje	f
00030000-5550-7102-9bfc-f5ce5bdcd5cb	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5550-7102-aa54-0ee76e6ea056	Trr-read	Trr - branje	f
00030000-5550-7102-fc70-9f776675ebc2	Trr-write	Trr - spreminjanje	f
00030000-5550-7102-af11-016ea13715e0	Uprizoritev-read	Uprizoritev - branje	f
00030000-5550-7102-a0eb-53cf88f195a0	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5550-7102-e776-534fb379c703	Vaja-read	Vaja - branje	f
00030000-5550-7102-b613-e9b19e28b417	Vaja-write	Vaja - spreminjanje	f
00030000-5550-7102-4efa-daf97e1fd20b	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5550-7102-2f31-c0e38ec67551	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5550-7102-08d0-ff88fb79a926	Zaposlitev-read	Zaposlitev - branje	f
00030000-5550-7102-bde9-f22eb484950c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5550-7102-9cf5-8c431728196d	Zasedenost-read	Zasedenost - branje	f
00030000-5550-7102-b029-3a7da8524f75	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5550-7102-e12d-17f9c1a2c392	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5550-7102-d6b2-58f461df2c3d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5550-7102-d9f0-092274fa03c4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5550-7102-739d-09c27bc23a7c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 2883696)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5550-7103-4173-5a65da84f4fa	00030000-5550-7102-5a9b-cf3b4cd5efaa
00020000-5550-7103-92ed-f9a949d84568	00030000-5550-7102-3348-081c3ef595d9
00020000-5550-7103-92ed-f9a949d84568	00030000-5550-7102-5a9b-cf3b4cd5efaa
\.


--
-- TOC entry 2663 (class 0 OID 2883984)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 2884014)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 2884125)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 2883754)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 2883796)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5550-7102-d10e-6e372e698fda	8341	Adlešiči
00050000-5550-7102-3e4d-8261be9d5c20	5270	Ajdovščina
00050000-5550-7102-1945-c701c64a1d5a	6280	Ankaran/Ancarano
00050000-5550-7102-ed97-d1dcd44b61c1	9253	Apače
00050000-5550-7102-fc6d-753e47f734eb	8253	Artiče
00050000-5550-7102-0f06-673c22412a0d	4275	Begunje na Gorenjskem
00050000-5550-7102-dd2c-2298d14af544	1382	Begunje pri Cerknici
00050000-5550-7102-8f9c-4eba75754c4f	9231	Beltinci
00050000-5550-7102-4fcf-dbd772a2ad42	2234	Benedikt
00050000-5550-7102-6283-d71326306395	2345	Bistrica ob Dravi
00050000-5550-7102-08b4-faf63176f15c	3256	Bistrica ob Sotli
00050000-5550-7102-37e3-bbca0592bc50	8259	Bizeljsko
00050000-5550-7102-0c41-b0ae9b7d0bfc	1223	Blagovica
00050000-5550-7102-f721-9edf02a56d00	8283	Blanca
00050000-5550-7102-2e7c-9db2bf81019e	4260	Bled
00050000-5550-7102-ed5d-f7d17bcd1edc	4273	Blejska Dobrava
00050000-5550-7102-1572-0f1a02358289	9265	Bodonci
00050000-5550-7102-6393-db4dae689534	9222	Bogojina
00050000-5550-7102-539f-f243f29f8c63	4263	Bohinjska Bela
00050000-5550-7102-5bb4-18f2eac5adf0	4264	Bohinjska Bistrica
00050000-5550-7102-d328-c3be7f79a264	4265	Bohinjsko jezero
00050000-5550-7102-b671-69d913aabd56	1353	Borovnica
00050000-5550-7102-9987-ce876e9e6b7a	8294	Boštanj
00050000-5550-7102-8f12-d8eb8ef37a4d	5230	Bovec
00050000-5550-7102-c6a4-fbd45a5da53a	5295	Branik
00050000-5550-7102-0566-ad2429a814cd	3314	Braslovče
00050000-5550-7102-00a7-cbae1984ac0a	5223	Breginj
00050000-5550-7102-ad78-ee485b909b75	8280	Brestanica
00050000-5550-7102-297c-a1e589b1f489	2354	Bresternica
00050000-5550-7102-a0f7-ddfd3817977d	4243	Brezje
00050000-5550-7102-74b5-55bf32bb4d2c	1351	Brezovica pri Ljubljani
00050000-5550-7102-d667-65623c487a1b	8250	Brežice
00050000-5550-7102-18ec-3750028fa981	4210	Brnik - Aerodrom
00050000-5550-7102-8fea-72a3b7f63bf1	8321	Brusnice
00050000-5550-7102-1d94-a959e9faee4f	3255	Buče
00050000-5550-7102-7ad0-aaf1e524181b	8276	Bučka 
00050000-5550-7102-496a-f9e577f254b1	9261	Cankova
00050000-5550-7102-4d88-3a87495bfa26	3000	Celje 
00050000-5550-7102-ded0-d9125ee2632a	3001	Celje - poštni predali
00050000-5550-7102-be17-eb4b742b178b	4207	Cerklje na Gorenjskem
00050000-5550-7102-9793-f243aee21608	8263	Cerklje ob Krki
00050000-5550-7102-6c0a-560b71f0c6e4	1380	Cerknica
00050000-5550-7102-8412-65a108ace95f	5282	Cerkno
00050000-5550-7102-d309-cf71ff70a50d	2236	Cerkvenjak
00050000-5550-7102-dd05-069f52d34b4a	2215	Ceršak
00050000-5550-7102-f42f-825cda63068c	2326	Cirkovce
00050000-5550-7102-5fd0-36e37bd6e2c6	2282	Cirkulane
00050000-5550-7102-4d64-a90b44140876	5273	Col
00050000-5550-7102-3aaf-04f647e0c164	8251	Čatež ob Savi
00050000-5550-7102-a05b-fd44a717afdb	1413	Čemšenik
00050000-5550-7102-af1f-dd0182963569	5253	Čepovan
00050000-5550-7102-2807-278d6b17aac6	9232	Črenšovci
00050000-5550-7102-ca03-e3c5e65340aa	2393	Črna na Koroškem
00050000-5550-7102-8d1e-015222ef3869	6275	Črni Kal
00050000-5550-7102-7cc9-bb26c77d10b9	5274	Črni Vrh nad Idrijo
00050000-5550-7102-3e59-855bfe0f4903	5262	Črniče
00050000-5550-7102-746e-440b06eff591	8340	Črnomelj
00050000-5550-7102-31f5-a08ba3c50641	6271	Dekani
00050000-5550-7102-9fee-ea91a41d2f9e	5210	Deskle
00050000-5550-7102-24e1-7d95b33306f6	2253	Destrnik
00050000-5550-7102-25cb-f80dfbbb3c53	6215	Divača
00050000-5550-7102-2cea-4e8e2da51990	1233	Dob
00050000-5550-7102-a434-7e942602fa12	3224	Dobje pri Planini
00050000-5550-7102-13d5-46bb07dbbcbd	8257	Dobova
00050000-5550-7102-8797-ca72f8d6e67e	1423	Dobovec
00050000-5550-7102-ecd0-aee284870a90	5263	Dobravlje
00050000-5550-7102-741a-265bf5ed2655	3204	Dobrna
00050000-5550-7102-8a4c-e1444e0c96d3	8211	Dobrnič
00050000-5550-7102-c8b3-92d418278f9b	1356	Dobrova
00050000-5550-7102-6a8b-d37a92aeebdb	9223	Dobrovnik/Dobronak 
00050000-5550-7102-816b-548deee9f57b	5212	Dobrovo v Brdih
00050000-5550-7102-7252-a015512d3aaa	1431	Dol pri Hrastniku
00050000-5550-7102-09b3-5966646f5037	1262	Dol pri Ljubljani
00050000-5550-7102-3df3-bb7a13d88fe0	1273	Dole pri Litiji
00050000-5550-7102-412a-c77cb62ee9ae	1331	Dolenja vas
00050000-5550-7102-d4b5-2df4db0edc84	8350	Dolenjske Toplice
00050000-5550-7102-25e5-bc55c8775238	1230	Domžale
00050000-5550-7102-a373-9e586336a9f0	2252	Dornava
00050000-5550-7102-7cd3-3810e0d76ec3	5294	Dornberk
00050000-5550-7102-bc6f-0dcb24ca58b5	1319	Draga
00050000-5550-7102-ea9a-1df086319f1c	8343	Dragatuš
00050000-5550-7102-ebf0-a71d05ba7a20	3222	Dramlje
00050000-5550-7102-a5ca-ead523fa3c36	2370	Dravograd
00050000-5550-7102-daf0-acde3c2c1c56	4203	Duplje
00050000-5550-7102-34d9-ca180672163d	6221	Dutovlje
00050000-5550-7102-1a1b-1f1a508bed72	8361	Dvor
00050000-5550-7102-fd04-c3662d697118	2343	Fala
00050000-5550-7102-bb79-c9d72e517175	9208	Fokovci
00050000-5550-7102-f63f-fdd29397c93d	2313	Fram
00050000-5550-7102-621e-b35a8ed7e7f7	3213	Frankolovo
00050000-5550-7102-15b6-5fd4f54f9f90	1274	Gabrovka
00050000-5550-7102-2ba1-2aab14a8d55f	8254	Globoko
00050000-5550-7102-5524-617d1832c737	5275	Godovič
00050000-5550-7102-c5e0-8200cd3b08c9	4204	Golnik
00050000-5550-7102-b847-8e60a9d55b5c	3303	Gomilsko
00050000-5550-7102-1473-ca6821003552	4224	Gorenja vas
00050000-5550-7102-71f4-8a6d1405e544	3263	Gorica pri Slivnici
00050000-5550-7102-8dfa-83f5b0f02705	2272	Gorišnica
00050000-5550-7102-3675-2c79c8d1c574	9250	Gornja Radgona
00050000-5550-7102-20e3-5549815c706a	3342	Gornji Grad
00050000-5550-7102-28e2-406008e9600b	4282	Gozd Martuljek
00050000-5550-7102-4d51-26603d987dbf	6272	Gračišče
00050000-5550-7102-dc91-3372f6ae53f1	9264	Grad
00050000-5550-7102-c000-7b7efd4b5850	8332	Gradac
00050000-5550-7102-5b87-3d90ecbc5009	1384	Grahovo
00050000-5550-7102-c1bb-4c18ab6c6d6d	5242	Grahovo ob Bači
00050000-5550-7102-970e-5ed23f7ea125	5251	Grgar
00050000-5550-7102-243c-d9135feb933d	3302	Griže
00050000-5550-7102-61ab-cb449f0515d8	3231	Grobelno
00050000-5550-7102-bc80-922233499acb	1290	Grosuplje
00050000-5550-7102-9f1d-36754838b679	2288	Hajdina
00050000-5550-7102-0c47-728984e98fc5	8362	Hinje
00050000-5550-7102-049b-5d81f4e0ad16	2311	Hoče
00050000-5550-7102-c2a6-e422838718ee	9205	Hodoš/Hodos
00050000-5550-7102-6dcb-a09e0dc171b1	1354	Horjul
00050000-5550-7102-f263-07b062925f09	1372	Hotedršica
00050000-5550-7102-abf0-0c3d781d22ba	1430	Hrastnik
00050000-5550-7102-2733-399886744853	6225	Hruševje
00050000-5550-7102-dc2c-c73303e5222d	4276	Hrušica
00050000-5550-7102-52f7-2856f16143b3	5280	Idrija
00050000-5550-7102-c686-0d5ae7b05357	1292	Ig
00050000-5550-7102-c6c7-7932424011f2	6250	Ilirska Bistrica
00050000-5550-7102-652a-927f11cad481	6251	Ilirska Bistrica-Trnovo
00050000-5550-7102-e3a8-9e2a7d137fab	1295	Ivančna Gorica
00050000-5550-7102-078e-2ddbd328f067	2259	Ivanjkovci
00050000-5550-7102-5140-bee584f5cefe	1411	Izlake
00050000-5550-7102-d99c-ced0003183fb	6310	Izola/Isola
00050000-5550-7102-ef9a-b0b6ecc81449	2222	Jakobski Dol
00050000-5550-7102-f421-263b5f93c397	2221	Jarenina
00050000-5550-7102-963a-43557eb818ed	6254	Jelšane
00050000-5550-7102-44bf-ae361c12f3d0	4270	Jesenice
00050000-5550-7102-ead1-5c41b700cfb9	8261	Jesenice na Dolenjskem
00050000-5550-7102-380d-92e623a55b3f	3273	Jurklošter
00050000-5550-7102-3210-a8144c39597a	2223	Jurovski Dol
00050000-5550-7102-8be7-7b5dc949e32a	2256	Juršinci
00050000-5550-7102-8ace-a3d0be04b601	5214	Kal nad Kanalom
00050000-5550-7102-c628-a2eaf8fc9fb7	3233	Kalobje
00050000-5550-7102-48e3-8ca358b44198	4246	Kamna Gorica
00050000-5550-7102-ea9c-b3c1eb1f8d24	2351	Kamnica
00050000-5550-7102-f048-c0656191de94	1241	Kamnik
00050000-5550-7102-70b9-14cc497394c1	5213	Kanal
00050000-5550-7102-6c2d-b6c7d070e034	8258	Kapele
00050000-5550-7102-6965-0e5179bd98f3	2362	Kapla
00050000-5550-7102-eddb-53d499202856	2325	Kidričevo
00050000-5550-7102-7ee9-863a264fa7d1	1412	Kisovec
00050000-5550-7102-8ace-8eff234a2a6f	6253	Knežak
00050000-5550-7102-6d6e-7653f6a78ea1	5222	Kobarid
00050000-5550-7102-61c2-280a93c2dbfd	9227	Kobilje
00050000-5550-7102-2533-73af5ecf3efe	1330	Kočevje
00050000-5550-7102-9476-85baa50527b2	1338	Kočevska Reka
00050000-5550-7102-d05c-e4d7efbeb69a	2276	Kog
00050000-5550-7102-c03b-75a249c60f87	5211	Kojsko
00050000-5550-7102-14ab-9dff9c12e0c2	6223	Komen
00050000-5550-7102-ecc4-0028ee6288f5	1218	Komenda
00050000-5550-7102-745c-9656bee37600	6000	Koper/Capodistria 
00050000-5550-7102-516c-baf5a8d833f2	6001	Koper/Capodistria - poštni predali
00050000-5550-7102-0e91-92fc3af7aa69	8282	Koprivnica
00050000-5550-7102-02ec-e03054c6df21	5296	Kostanjevica na Krasu
00050000-5550-7102-1de0-f83b0e00f0fa	8311	Kostanjevica na Krki
00050000-5550-7102-037c-1964c3ab61aa	1336	Kostel
00050000-5550-7102-b70b-779a2729d5d9	6256	Košana
00050000-5550-7102-cb9a-b89683665bdb	2394	Kotlje
00050000-5550-7102-9a32-ed83406999be	6240	Kozina
00050000-5550-7102-6c86-fa1ed9400d92	3260	Kozje
00050000-5550-7102-4246-4cda45f96c1e	4000	Kranj 
00050000-5550-7102-ad73-171493debca6	4001	Kranj - poštni predali
00050000-5550-7102-688f-04682b3fe4c2	4280	Kranjska Gora
00050000-5550-7102-23fc-0cfd84f5cc59	1281	Kresnice
00050000-5550-7102-ab11-a8ee56e09c91	4294	Križe
00050000-5550-7102-c7c2-dc34d30dfd85	9206	Križevci
00050000-5550-7102-eeea-7b9604c9b989	9242	Križevci pri Ljutomeru
00050000-5550-7102-d480-532864247dfc	1301	Krka
00050000-5550-7102-3674-2e4a4c946e58	8296	Krmelj
00050000-5550-7102-cca7-f4d2b7cf99a4	4245	Kropa
00050000-5550-7102-20af-008273214df8	8262	Krška vas
00050000-5550-7102-a9fa-aa09e055613c	8270	Krško
00050000-5550-7102-8bde-729f1bb55c4b	9263	Kuzma
00050000-5550-7102-1c9c-7b7244a6a21b	2318	Laporje
00050000-5550-7102-1907-f068fa13fdb9	3270	Laško
00050000-5550-7102-24b9-0f8a5589997c	1219	Laze v Tuhinju
00050000-5550-7102-8b17-304cf1e1a30d	2230	Lenart v Slovenskih goricah
00050000-5550-7102-41a2-1fbf8933342e	9220	Lendava/Lendva
00050000-5550-7102-d1c1-52de7138d4a5	4248	Lesce
00050000-5550-7102-658a-0e7a115a0b92	3261	Lesično
00050000-5550-7102-958f-06d65e973185	8273	Leskovec pri Krškem
00050000-5550-7102-2835-6070a661b7b5	2372	Libeliče
00050000-5550-7102-b60d-b293500da9e6	2341	Limbuš
00050000-5550-7102-7cb8-346127f60533	1270	Litija
00050000-5550-7102-c2a2-063c797511a1	3202	Ljubečna
00050000-5550-7102-9408-3e661dec11b1	1000	Ljubljana 
00050000-5550-7102-12f8-f28f5ff147e3	1001	Ljubljana - poštni predali
00050000-5550-7102-7c3e-a957428491cb	1231	Ljubljana - Črnuče
00050000-5550-7102-322e-1dbfd01b96b2	1261	Ljubljana - Dobrunje
00050000-5550-7102-25a3-fcaa72377526	1260	Ljubljana - Polje
00050000-5550-7102-88c4-82feeb8b98b5	1210	Ljubljana - Šentvid
00050000-5550-7102-cbe2-28b4002f6a54	1211	Ljubljana - Šmartno
00050000-5550-7102-3d25-5b9093de21f5	3333	Ljubno ob Savinji
00050000-5550-7102-754a-ebe32ecb048a	9240	Ljutomer
00050000-5550-7102-a6e4-0c5d3d0d3010	3215	Loče
00050000-5550-7102-f8ee-c3751ea99fa6	5231	Log pod Mangartom
00050000-5550-7102-a660-a425baa9fad1	1358	Log pri Brezovici
00050000-5550-7102-2f41-3d3661ce11bd	1370	Logatec
00050000-5550-7102-d768-1c78d3b57fb5	1371	Logatec
00050000-5550-7102-60da-6584492831d4	1434	Loka pri Zidanem Mostu
00050000-5550-7102-9f64-2e21dd479672	3223	Loka pri Žusmu
00050000-5550-7102-cc3f-a6d969e130d5	6219	Lokev
00050000-5550-7102-b5fa-5dd5f74ad61d	1318	Loški Potok
00050000-5550-7102-6adb-2557f249129c	2324	Lovrenc na Dravskem polju
00050000-5550-7102-dab8-63b9a4d75614	2344	Lovrenc na Pohorju
00050000-5550-7102-7b72-b5c253545182	3334	Luče
00050000-5550-7102-deb7-f8ed8cb694ff	1225	Lukovica
00050000-5550-7102-e88d-74d48c6a2ab9	9202	Mačkovci
00050000-5550-7102-00dd-62c376fd982b	2322	Majšperk
00050000-5550-7102-9561-2faed3fd4e12	2321	Makole
00050000-5550-7102-3a3e-a962b5d8d738	9243	Mala Nedelja
00050000-5550-7102-20d8-fbcd1dc4a0c7	2229	Malečnik
00050000-5550-7102-7ad2-7e5aa77ad765	6273	Marezige
00050000-5550-7102-9373-3d512885cf8e	2000	Maribor 
00050000-5550-7102-e9a8-24338bebb1b0	2001	Maribor - poštni predali
00050000-5550-7102-92e1-cf6509919cb0	2206	Marjeta na Dravskem polju
00050000-5550-7102-9272-7cf6f39e779d	2281	Markovci
00050000-5550-7102-e813-fdd0021e137e	9221	Martjanci
00050000-5550-7102-7c81-ea021fdf49dd	6242	Materija
00050000-5550-7102-5fc5-d7361771c50d	4211	Mavčiče
00050000-5550-7102-8e0d-4831713712c4	1215	Medvode
00050000-5550-7102-e51e-7e8449654296	1234	Mengeš
00050000-5550-7102-bd21-e9a4a955b4ea	8330	Metlika
00050000-5550-7102-064d-425c65d52770	2392	Mežica
00050000-5550-7102-73ba-d07d5d0a24c3	2204	Miklavž na Dravskem polju
00050000-5550-7102-87ea-5d930a938fcb	2275	Miklavž pri Ormožu
00050000-5550-7102-7811-2eb098f07708	5291	Miren
00050000-5550-7102-cd32-1d8d564e0092	8233	Mirna
00050000-5550-7102-3f64-dcd933c95e5e	8216	Mirna Peč
00050000-5550-7102-b6d0-aef743ab8f5c	2382	Mislinja
00050000-5550-7102-8d0e-3c7eb364325c	4281	Mojstrana
00050000-5550-7102-cf86-be29335fdee3	8230	Mokronog
00050000-5550-7102-0d11-c653079f866c	1251	Moravče
00050000-5550-7102-3394-463fbf96d644	9226	Moravske Toplice
00050000-5550-7102-1e35-66a962c6c35e	5216	Most na Soči
00050000-5550-7102-3837-defe69b7cda2	1221	Motnik
00050000-5550-7102-65ff-c498d0f0cf1d	3330	Mozirje
00050000-5550-7102-04df-29d103ed1dc5	9000	Murska Sobota 
00050000-5550-7102-836f-04d815683ce2	9001	Murska Sobota - poštni predali
00050000-5550-7102-a969-535cb7f50d8f	2366	Muta
00050000-5550-7102-ac29-f2dbbd2d3ddd	4202	Naklo
00050000-5550-7102-4b13-da0f092ef61c	3331	Nazarje
00050000-5550-7102-18a0-453e76bab61c	1357	Notranje Gorice
00050000-5550-7102-8051-8bb57f1bec82	3203	Nova Cerkev
00050000-5550-7102-755b-b0feb827e104	5000	Nova Gorica 
00050000-5550-7102-72eb-be628d830d5e	5001	Nova Gorica - poštni predali
00050000-5550-7102-5249-307a4dcd2176	1385	Nova vas
00050000-5550-7102-1cec-eaab685487a8	8000	Novo mesto
00050000-5550-7102-0fb4-74347ecdd705	8001	Novo mesto - poštni predali
00050000-5550-7102-37a5-bb9248ee6b51	6243	Obrov
00050000-5550-7102-d890-f62194ab126f	9233	Odranci
00050000-5550-7102-bfe6-d928a7b57f28	2317	Oplotnica
00050000-5550-7102-381a-2c671972517b	2312	Orehova vas
00050000-5550-7102-b1f8-7dd2d36b18e2	2270	Ormož
00050000-5550-7102-0649-8b85db1ae4bc	1316	Ortnek
00050000-5550-7102-97bf-9b86c29e3a53	1337	Osilnica
00050000-5550-7102-02f9-cab3a3121a99	8222	Otočec
00050000-5550-7102-4d15-15651541df39	2361	Ožbalt
00050000-5550-7102-bb75-19cbccc4cbba	2231	Pernica
00050000-5550-7102-8f46-8ef781611329	2211	Pesnica pri Mariboru
00050000-5550-7102-e3dd-5dc3cf5a88aa	9203	Petrovci
00050000-5550-7102-ca04-38dcfd48134d	3301	Petrovče
00050000-5550-7102-07b6-5627f98561e3	6330	Piran/Pirano
00050000-5550-7102-0712-17d9aec75dce	8255	Pišece
00050000-5550-7102-15ca-f17c3cdbfbe9	6257	Pivka
00050000-5550-7102-1f0f-f1312ac636b4	6232	Planina
00050000-5550-7102-c596-7eb1ca757e9f	3225	Planina pri Sevnici
00050000-5550-7102-7159-96108fa77787	6276	Pobegi
00050000-5550-7102-ab9f-87c1ba53cb93	8312	Podbočje
00050000-5550-7102-3b44-89d5066a0d6b	5243	Podbrdo
00050000-5550-7102-e46c-a114e80f8cdd	3254	Podčetrtek
00050000-5550-7102-e6ec-52d6df6ef305	2273	Podgorci
00050000-5550-7102-c210-63f3302b91d6	6216	Podgorje
00050000-5550-7102-3ce6-ee8511d387ed	2381	Podgorje pri Slovenj Gradcu
00050000-5550-7102-408a-ac79180f3778	6244	Podgrad
00050000-5550-7102-77d1-a94d4da54cc2	1414	Podkum
00050000-5550-7102-2ba1-6c575a2a90a4	2286	Podlehnik
00050000-5550-7102-32bc-6374966f2062	5272	Podnanos
00050000-5550-7102-e1d0-bbfad6ae99ce	4244	Podnart
00050000-5550-7102-0344-9d5dab32b707	3241	Podplat
00050000-5550-7102-2e8b-571f6e436136	3257	Podsreda
00050000-5550-7102-ef3c-91ddd9314cc9	2363	Podvelka
00050000-5550-7102-4ffc-3c72073fa024	2208	Pohorje
00050000-5550-7102-c5f4-e19a6cebed3f	2257	Polenšak
00050000-5550-7102-d070-9bbfb9fae664	1355	Polhov Gradec
00050000-5550-7102-1ecf-93c03691ed51	4223	Poljane nad Škofjo Loko
00050000-5550-7102-2451-d83aef04427e	2319	Poljčane
00050000-5550-7102-532e-5e2ce1e95adf	1272	Polšnik
00050000-5550-7102-8deb-5c2d5fc5bc90	3313	Polzela
00050000-5550-7102-cae6-b1c7507abeea	3232	Ponikva
00050000-5550-7102-6899-0acea2e559b1	6320	Portorož/Portorose
00050000-5550-7102-a4e6-1ac239c6042f	6230	Postojna
00050000-5550-7102-e619-41580d8a1522	2331	Pragersko
00050000-5550-7102-e41e-126f11fa7a8a	3312	Prebold
00050000-5550-7102-0620-f29509c738c7	4205	Preddvor
00050000-5550-7102-d4cc-c0c5a701a825	6255	Prem
00050000-5550-7102-19fa-16b012a0f085	1352	Preserje
00050000-5550-7102-201a-ac9cf6920751	6258	Prestranek
00050000-5550-7102-dd83-da118093f6f7	2391	Prevalje
00050000-5550-7102-7e31-61c1cea408df	3262	Prevorje
00050000-5550-7102-7f42-8fe5afc1a4c8	1276	Primskovo 
00050000-5550-7102-1eb7-8819069f7a95	3253	Pristava pri Mestinju
00050000-5550-7102-e320-2ef0fb20b423	9207	Prosenjakovci/Partosfalva
00050000-5550-7102-7602-167af694f628	5297	Prvačina
00050000-5550-7102-ac52-fa35141b42fe	2250	Ptuj
00050000-5550-7102-8848-cbc513e68b93	2323	Ptujska Gora
00050000-5550-7102-6d49-ead03705d789	9201	Puconci
00050000-5550-7102-a079-cc309f5f25d5	2327	Rače
00050000-5550-7102-37a4-153cbc913257	1433	Radeče
00050000-5550-7102-bed7-c376068869dd	9252	Radenci
00050000-5550-7102-d6db-13e112cf17c3	2360	Radlje ob Dravi
00050000-5550-7102-d360-5bdb8d4a41dd	1235	Radomlje
00050000-5550-7102-309d-f755a217cf48	4240	Radovljica
00050000-5550-7102-1181-d3a2e79a458e	8274	Raka
00050000-5550-7102-6773-7abcb0428be1	1381	Rakek
00050000-5550-7102-0623-453d2c26f06b	4283	Rateče - Planica
00050000-5550-7102-2f81-8c54e33347f2	2390	Ravne na Koroškem
00050000-5550-7102-c395-43e9d99ffc51	9246	Razkrižje
00050000-5550-7102-7668-78d1a35bd8e8	3332	Rečica ob Savinji
00050000-5550-7102-f57b-e33ca0094544	5292	Renče
00050000-5550-7102-4c3a-245e4bd8f01c	1310	Ribnica
00050000-5550-7102-bfc9-e7b734a92129	2364	Ribnica na Pohorju
00050000-5550-7102-3744-be83ef212ff3	3272	Rimske Toplice
00050000-5550-7102-c0c6-7162283a0e0e	1314	Rob
00050000-5550-7102-dfe8-ad605a317e87	5215	Ročinj
00050000-5550-7102-9c99-fcd692cf5313	3250	Rogaška Slatina
00050000-5550-7102-d5c1-446dc2b31b9c	9262	Rogašovci
00050000-5550-7102-e187-0afba63d8fc8	3252	Rogatec
00050000-5550-7102-142c-5abaae0aaf18	1373	Rovte
00050000-5550-7102-6afe-d7bb1b8c042b	2342	Ruše
00050000-5550-7102-a3a6-520ad9997dd1	1282	Sava
00050000-5550-7102-dd81-8665963ed78f	6333	Sečovlje/Sicciole
00050000-5550-7102-1f93-3986c4fd7001	4227	Selca
00050000-5550-7102-7342-022dab21fc50	2352	Selnica ob Dravi
00050000-5550-7102-8394-177e6f17460f	8333	Semič
00050000-5550-7102-5370-14326adf2383	8281	Senovo
00050000-5550-7102-9a35-03d02b4f0536	6224	Senožeče
00050000-5550-7102-6d9a-daa935e02eaa	8290	Sevnica
00050000-5550-7102-a2c6-4ab59c968572	6210	Sežana
00050000-5550-7102-3c69-65cca30777ba	2214	Sladki Vrh
00050000-5550-7102-e6c2-2476f2ed8eb9	5283	Slap ob Idrijci
00050000-5550-7102-0171-a401f2f5aa0c	2380	Slovenj Gradec
00050000-5550-7102-0736-d4935146fea9	2310	Slovenska Bistrica
00050000-5550-7102-eb64-d341f3b5c980	3210	Slovenske Konjice
00050000-5550-7102-26de-4dc8dd40e8fe	1216	Smlednik
00050000-5550-7102-eb87-befcc1e20d6c	5232	Soča
00050000-5550-7102-4294-a7fb34431705	1317	Sodražica
00050000-5550-7102-fbcf-60c14ef78c8f	3335	Solčava
00050000-5550-7102-9b01-5dc79f8137c4	5250	Solkan
00050000-5550-7102-c3dd-2a8c0719ffb4	4229	Sorica
00050000-5550-7102-6e80-ec0b82d9cbf3	4225	Sovodenj
00050000-5550-7102-f823-dbb3cfd1f776	5281	Spodnja Idrija
00050000-5550-7102-3c3a-64dffd7eec20	2241	Spodnji Duplek
00050000-5550-7102-492e-e2f11fabca99	9245	Spodnji Ivanjci
00050000-5550-7102-014b-eb6a4a3cbd3c	2277	Središče ob Dravi
00050000-5550-7102-d8c4-e84448bf79a9	4267	Srednja vas v Bohinju
00050000-5550-7102-3d0b-22f64f97b6fb	8256	Sromlje 
00050000-5550-7102-59c8-6b11ef5ad791	5224	Srpenica
00050000-5550-7102-c63a-596a088c732a	1242	Stahovica
00050000-5550-7102-e70a-5134e7094aba	1332	Stara Cerkev
00050000-5550-7102-89b6-f0d4a1713717	8342	Stari trg ob Kolpi
00050000-5550-7102-df67-35b6863c4d3d	1386	Stari trg pri Ložu
00050000-5550-7102-615c-9cd909e01d1f	2205	Starše
00050000-5550-7102-7f32-0dbf194dfe14	2289	Stoperce
00050000-5550-7102-2c7b-8051b3a34768	8322	Stopiče
00050000-5550-7102-5724-7924316f8b5f	3206	Stranice
00050000-5550-7102-e473-9ff444ed92ff	8351	Straža
00050000-5550-7102-fe65-1862d4f22b3c	1313	Struge
00050000-5550-7102-6e8f-f703fab30ded	8293	Studenec
00050000-5550-7102-e5c3-ad1cb26c46b1	8331	Suhor
00050000-5550-7102-1160-0c2255e8b36c	2233	Sv. Ana v Slovenskih goricah
00050000-5550-7102-240e-70709586ee40	2235	Sv. Trojica v Slovenskih goricah
00050000-5550-7102-91ed-823568bf05b0	2353	Sveti Duh na Ostrem Vrhu
00050000-5550-7102-8681-4b32308c008c	9244	Sveti Jurij ob Ščavnici
00050000-5550-7102-e291-19fd5d24657b	3264	Sveti Štefan
00050000-5550-7102-f19c-beba117fc005	2258	Sveti Tomaž
00050000-5550-7102-bea1-d08549d28824	9204	Šalovci
00050000-5550-7102-eec3-c3a433acacaf	5261	Šempas
00050000-5550-7102-f693-39bea3a27b79	5290	Šempeter pri Gorici
00050000-5550-7102-0ac0-460f9d64fef3	3311	Šempeter v Savinjski dolini
00050000-5550-7102-de06-a52b8dd48d76	4208	Šenčur
00050000-5550-7102-d71d-92877df3fd7a	2212	Šentilj v Slovenskih goricah
00050000-5550-7102-319b-77d52fabc432	8297	Šentjanž
00050000-5550-7102-76ab-db67b19ae76c	2373	Šentjanž pri Dravogradu
00050000-5550-7102-3ba0-0c30841d571d	8310	Šentjernej
00050000-5550-7102-27a5-257de3a552c1	3230	Šentjur
00050000-5550-7102-ba2f-0936b2a235fd	3271	Šentrupert
00050000-5550-7102-b3ef-10c9053485c9	8232	Šentrupert
00050000-5550-7102-3336-7962514f67a1	1296	Šentvid pri Stični
00050000-5550-7102-207e-b4a50c5a007a	8275	Škocjan
00050000-5550-7102-5ffe-f1b0a9e501ab	6281	Škofije
00050000-5550-7102-9943-3bdb07ea632d	4220	Škofja Loka
00050000-5550-7102-11ac-8be6c4649bdf	3211	Škofja vas
00050000-5550-7102-2324-a4d0fbdb3a01	1291	Škofljica
00050000-5550-7102-244f-45a3f1147b28	6274	Šmarje
00050000-5550-7102-8a4e-74c16c8f5d28	1293	Šmarje - Sap
00050000-5550-7102-8638-464ea1288101	3240	Šmarje pri Jelšah
00050000-5550-7102-1359-ff89d4b31f5a	8220	Šmarješke Toplice
00050000-5550-7102-2139-2dfebb3dffe8	2315	Šmartno na Pohorju
00050000-5550-7102-1fab-3db56c23a0f4	3341	Šmartno ob Dreti
00050000-5550-7102-9fa3-ca0a40ede901	3327	Šmartno ob Paki
00050000-5550-7102-a5c1-7f9f202c4946	1275	Šmartno pri Litiji
00050000-5550-7102-f6ce-478a337eb668	2383	Šmartno pri Slovenj Gradcu
00050000-5550-7102-c4aa-b9d5d8cfc158	3201	Šmartno v Rožni dolini
00050000-5550-7102-f327-a88788ba1f69	3325	Šoštanj
00050000-5550-7102-f6c6-8fabf5e81505	6222	Štanjel
00050000-5550-7102-a53f-8e1554eeb0c9	3220	Štore
00050000-5550-7102-dfcb-426de7987559	3304	Tabor
00050000-5550-7102-ddeb-ccd935ec6416	3221	Teharje
00050000-5550-7102-79ae-06e45a318586	9251	Tišina
00050000-5550-7102-d258-0db57f0bea2c	5220	Tolmin
00050000-5550-7102-cc1c-67103ba1569d	3326	Topolšica
00050000-5550-7102-ee54-58eff481fadf	2371	Trbonje
00050000-5550-7102-23eb-becf788df1f0	1420	Trbovlje
00050000-5550-7102-45ad-6cc12214e08a	8231	Trebelno 
00050000-5550-7102-0118-3872d0f38a98	8210	Trebnje
00050000-5550-7102-6864-61c39335cf86	5252	Trnovo pri Gorici
00050000-5550-7102-0f30-04833ddc6ea7	2254	Trnovska vas
00050000-5550-7102-03f1-0521705f210d	1222	Trojane
00050000-5550-7102-7020-0cf705b0fa19	1236	Trzin
00050000-5550-7102-fb26-7259e355b0b7	4290	Tržič
00050000-5550-7102-c40f-f5107434c227	8295	Tržišče
00050000-5550-7102-d66b-0df6d805565b	1311	Turjak
00050000-5550-7102-0ea1-0a5ef97711c4	9224	Turnišče
00050000-5550-7102-669d-f37ba8eeb538	8323	Uršna sela
00050000-5550-7102-c539-d095d6b9c758	1252	Vače
00050000-5550-7102-901c-3a972e50fe68	3320	Velenje 
00050000-5550-7102-4895-1248f15a49b8	3322	Velenje - poštni predali
00050000-5550-7102-d929-cbcec28b7145	8212	Velika Loka
00050000-5550-7102-32d5-ad32b2cd5741	2274	Velika Nedelja
00050000-5550-7102-d7b9-3a03b20fe324	9225	Velika Polana
00050000-5550-7102-ec6e-8e227ddb67f5	1315	Velike Lašče
00050000-5550-7102-159b-49ba83d29950	8213	Veliki Gaber
00050000-5550-7102-2fdd-e30c40ea8e45	9241	Veržej
00050000-5550-7102-6e94-71dace7b7b36	1312	Videm - Dobrepolje
00050000-5550-7102-6418-6b1e90f0d95c	2284	Videm pri Ptuju
00050000-5550-7102-62f5-eb5c214cf146	8344	Vinica
00050000-5550-7102-01f8-4d2a759cfb37	5271	Vipava
00050000-5550-7102-e749-6dd60f6b6a73	4212	Visoko
00050000-5550-7102-2fa8-35b00f812181	1294	Višnja Gora
00050000-5550-7102-0e3b-f8f31590277d	3205	Vitanje
00050000-5550-7102-5253-89c62abfd8e2	2255	Vitomarci
00050000-5550-7102-8b0a-b6511fde2974	1217	Vodice
00050000-5550-7102-02a5-b25de5c31983	3212	Vojnik\t
00050000-5550-7102-9e25-c58f275c602b	5293	Volčja Draga
00050000-5550-7102-8a00-f14ca90cc2e6	2232	Voličina
00050000-5550-7102-038e-69b857f0e168	3305	Vransko
00050000-5550-7102-3060-d7ef508476bd	6217	Vremski Britof
00050000-5550-7102-7ab2-070562889e1a	1360	Vrhnika
00050000-5550-7102-63a3-cae31116488e	2365	Vuhred
00050000-5550-7102-fe9f-3f24994601f1	2367	Vuzenica
00050000-5550-7102-0661-906ea17ce128	8292	Zabukovje 
00050000-5550-7102-93d6-276bbcc7f302	1410	Zagorje ob Savi
00050000-5550-7102-9415-cdddcea7ec71	1303	Zagradec
00050000-5550-7102-aa84-bc5994cf90f4	2283	Zavrč
00050000-5550-7102-2848-3f4521c96007	8272	Zdole 
00050000-5550-7102-a6cd-4c53b6b44fde	4201	Zgornja Besnica
00050000-5550-7102-7766-300296f11879	2242	Zgornja Korena
00050000-5550-7102-1bf3-bde9daa757b8	2201	Zgornja Kungota
00050000-5550-7102-2ef4-00b27927ad65	2316	Zgornja Ložnica
00050000-5550-7102-6b99-59cd44c89a7e	2314	Zgornja Polskava
00050000-5550-7102-bfeb-7ec90e1c3e02	2213	Zgornja Velka
00050000-5550-7102-4fbe-7feb8e67ca9b	4247	Zgornje Gorje
00050000-5550-7102-6efc-95548f417e01	4206	Zgornje Jezersko
00050000-5550-7102-d42d-9808b2d7af0f	2285	Zgornji Leskovec
00050000-5550-7102-2fdc-fc66d201ed39	1432	Zidani Most
00050000-5550-7102-6c73-acf06ce9a9e9	3214	Zreče
00050000-5550-7102-6697-9eed61b6e7cd	4209	Žabnica
00050000-5550-7102-0a22-40cc715952e9	3310	Žalec
00050000-5550-7102-c24c-9a2661d2b426	4228	Železniki
00050000-5550-7102-e5ee-dd6f8d79eea7	2287	Žetale
00050000-5550-7102-db7c-5f414be10454	4226	Žiri
00050000-5550-7102-5da9-45362d0b1d63	4274	Žirovnica
00050000-5550-7102-f4a5-c848b7f9d352	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 2883958)
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
-- TOC entry 2642 (class 0 OID 2883781)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 2883847)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 2883970)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 2884074)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 2884118)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 2883999)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 2883943)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 2883933)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 2884108)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 2884064)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 2883647)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5550-7103-cdb1-8168f8d18689	00010000-5550-7103-5863-5e338f1eddb1	2015-05-11 11:06:11	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROLq6.TGSycs/7C.Jmqp7a8sxpdWKkaa6";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 2884008)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 2883687)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5550-7102-4fb2-2db7125b097c	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5550-7102-60c5-0f9757856531	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5550-7103-4173-5a65da84f4fa	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5550-7103-aa1f-f1b3414aa99f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5550-7103-7cc5-0852a94cca60	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5550-7103-92ed-f9a949d84568	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 2883670)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5550-7103-cdb1-8168f8d18689	00020000-5550-7103-aa1f-f1b3414aa99f
00010000-5550-7103-5863-5e338f1eddb1	00020000-5550-7103-aa1f-f1b3414aa99f
\.


--
-- TOC entry 2668 (class 0 OID 2884022)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 2883964)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 2883914)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 2883746)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 2883920)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 2884099)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 2883816)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 2883656)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5550-7103-5863-5e338f1eddb1	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO81tnmfc7QdQPP16azlcvTRue5Md/4uS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5550-7103-cdb1-8168f8d18689	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 2884150)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 2883862)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 2883991)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 2884056)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 2883890)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 2884140)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 2884047)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 2883711)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 2884189)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 2884182)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 2884098)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 2883880)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 2883913)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 2883842)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 2884043)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 2883860)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 2883907)
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
-- TOC entry 2364 (class 2606 OID 2883956)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 2883983)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 2883814)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 2883720)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 2883778)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 2883744)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 2883700)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2264 (class 2606 OID 2883685)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 2883989)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 2884021)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 2884135)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 2883771)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 2883802)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 2883962)
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
-- TOC entry 2298 (class 2606 OID 2883792)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 2883851)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 2883974)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 2884080)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 2884123)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 2884006)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 2883947)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 2883938)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 2884117)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 2884071)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 2883655)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 2884012)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 2883674)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 2883694)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 2884030)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 2883969)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 2883919)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 2883751)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 2883929)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 2884107)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 2883827)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 2883668)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 2884164)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 2883866)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 2883997)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 2884062)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 2883902)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 2884149)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 2884055)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 2883887)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 2883773)
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
-- TOC entry 2377 (class 1259 OID 2883990)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 2883976)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 2883975)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 2883867)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 2884046)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 2884044)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 2884045)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 2884137)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 2884138)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 2884139)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 2884167)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 2884166)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 2884165)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 2883829)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 2883828)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 2883780)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 2883779)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 2884013)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 2883908)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 2883701)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 2883702)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 2884033)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 2884032)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 2884031)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 2883852)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 2883854)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 2883853)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 2883942)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 2883940)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 2883939)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 2883941)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2259 (class 1259 OID 2883675)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2260 (class 1259 OID 2883676)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 2883998)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 2883963)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 2884072)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 2884073)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 2883794)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 2883793)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 2883795)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 2884081)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 2884082)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 2884192)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 2884191)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 2884194)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 2884190)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 2884193)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 2884063)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 2883951)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 2883950)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 2883948)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 2883949)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2245 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 2884184)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 2884183)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 2883861)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 2883722)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 2883721)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 2883752)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 2883753)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 2883932)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 2883931)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 2883930)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 2883889)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 2883885)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 2883882)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 2883883)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 2883881)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 2883886)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 2883884)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 2883772)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 2883843)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 2883845)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 2883844)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 2883846)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 2883957)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 2884136)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 2883745)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 2883815)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2256 (class 1259 OID 2883669)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2385 (class 1259 OID 2884007)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2265 (class 1259 OID 2883686)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2248 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 2883803)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 2884124)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 2883695)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 2883888)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 2884325)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 2884310)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 2884315)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 2884335)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 2884305)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 2884330)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 2884320)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 2884240)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 2884420)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 2884415)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 2884410)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 2884300)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 2884460)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 2884450)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 2884455)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 2884400)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 2884495)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 2884500)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 2884505)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 2884520)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 2884515)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 2884510)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 2884275)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 2884270)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 2884250)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 2884245)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 2884225)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 2884430)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 2884340)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 2884205)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 2884210)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 2884445)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 2884440)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 2884435)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 2884280)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 2884290)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 2884285)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 2884375)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 2884365)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 2884360)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 2884370)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 2884195)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 2884200)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 2884425)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 2884405)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 2884470)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 2884475)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 2884260)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 2884255)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 2884265)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 2884480)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 2884485)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 2884545)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 2884540)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 2884555)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 2884535)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 2884550)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 2884465)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 2884395)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 2884390)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 2884380)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 2884385)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 2884530)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 2884525)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 2884295)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 2884490)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 2884220)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 2884215)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 2884230)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 2884235)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 2884355)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 2884350)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 2884345)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-11 11:06:11 CEST

--
-- PostgreSQL database dump complete
--

