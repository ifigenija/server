--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-21 21:14:23 CEST

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
-- TOC entry 2680 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 692629)
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
-- TOC entry 225 (class 1259 OID 693102)
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
-- TOC entry 224 (class 1259 OID 693085)
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
-- TOC entry 217 (class 1259 OID 693001)
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
-- TOC entry 193 (class 1259 OID 692785)
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
-- TOC entry 196 (class 1259 OID 692826)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 692747)
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
-- TOC entry 212 (class 1259 OID 692951)
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
-- TOC entry 191 (class 1259 OID 692772)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 692820)
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
-- TOC entry 201 (class 1259 OID 692869)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 692894)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 692723)
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
-- TOC entry 180 (class 1259 OID 692638)
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
-- TOC entry 181 (class 1259 OID 692649)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) NOT NULL,
    priimek character varying(255) NOT NULL,
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
-- TOC entry 184 (class 1259 OID 692694)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 692603)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 692622)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 692901)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 692931)
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
-- TOC entry 221 (class 1259 OID 693043)
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
-- TOC entry 183 (class 1259 OID 692676)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid,
    sifra character varying(4) NOT NULL,
    tipkli character varying(20) NOT NULL,
    stakli character varying(2) DEFAULT NULL::character varying,
    naziv character varying(60) NOT NULL,
    naziv1 character varying(60) DEFAULT NULL::character varying,
    email character varying(50) DEFAULT NULL::character varying,
    url character varying(100) DEFAULT NULL::character varying,
    opomba text,
    idddv character varying(18) DEFAULT NULL::character varying,
    maticna character varying(20) DEFAULT NULL::character varying,
    zavezanec character varying(1) DEFAULT NULL::character varying,
    jeeu character varying(1) DEFAULT NULL::character varying,
    datzav date,
    datnzav date,
    zamejstvo boolean NOT NULL
);


--
-- TOC entry 186 (class 1259 OID 692715)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 692875)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 185 (class 1259 OID 692701)
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
-- TOC entry 171 (class 1259 OID 529329)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    klient_id uuid,
    drzava_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    nazivdva character varying(50) DEFAULT NULL::character varying,
    ulica character varying(50) DEFAULT NULL::character varying,
    ulicadva character varying(50) DEFAULT NULL::character varying,
    posta character varying(50) DEFAULT NULL::character varying,
    postanaziv character varying(50) DEFAULT NULL::character varying,
    pokrajina character varying(50) DEFAULT NULL::character varying,
    jeeu character varying(1) DEFAULT NULL::character varying,
    privzeti boolean
);


--
-- TOC entry 190 (class 1259 OID 692764)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 692887)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 692992)
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
-- TOC entry 220 (class 1259 OID 693036)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 692916)
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
-- TOC entry 200 (class 1259 OID 692860)
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
-- TOC entry 199 (class 1259 OID 692850)
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
-- TOC entry 219 (class 1259 OID 693026)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 692982)
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
-- TOC entry 173 (class 1259 OID 692575)
-- Name: revizije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE revizije (
    id integer NOT NULL,
    razred character varying(100) NOT NULL,
    objectid uuid NOT NULL,
    upor uuid,
    datum timestamp(0) without time zone NOT NULL,
    tip character varying(3) NOT NULL,
    data text NOT NULL
);


--
-- TOC entry 172 (class 1259 OID 692573)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2681 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 692925)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 692612)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 692596)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 692939)
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
-- TOC entry 203 (class 1259 OID 692881)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 692831)
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
-- TOC entry 182 (class 1259 OID 692669)
-- Name: telefonska; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE telefonska (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    vrsta character varying(20) NOT NULL,
    stevilka character varying(30) NOT NULL,
    privzeta boolean NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 692837)
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
-- TOC entry 218 (class 1259 OID 693017)
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
-- TOC entry 188 (class 1259 OID 692735)
-- Name: trr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trr (
    id uuid NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    stevilka character varying(255) NOT NULL,
    swift character varying(255) DEFAULT NULL::character varying,
    bic character varying(255) DEFAULT NULL::character varying,
    banka character varying(255) NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 692584)
-- Name: uporabniki; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uporabniki (
    id uuid NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    username character varying(10) NOT NULL,
    password character varying(90) DEFAULT NULL::character varying,
    enabled boolean,
    expires date,
    defaultroute text,
    defaultrouteparams text,
    email character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 693067)
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
-- TOC entry 192 (class 1259 OID 692779)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 692908)
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
-- TOC entry 214 (class 1259 OID 692974)
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
-- TOC entry 194 (class 1259 OID 692807)
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
-- TOC entry 222 (class 1259 OID 693057)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 692964)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2123 (class 2604 OID 692578)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2627 (class 0 OID 692629)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 693102)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 693085)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 693001)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 692785)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 692826)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 692747)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5536-a18d-2655-2830717b3879	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5536-a18d-72a7-5ab702f7fcee	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5536-a18d-c87f-c66de23e6a3b	AL	ALB	008	Albania 	Albanija	\N
00040000-5536-a18d-a1cc-e81cf1214627	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5536-a18d-8899-a76ff9faa97f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5536-a18d-0bf7-ab948fd3cff7	AD	AND	020	Andorra 	Andora	\N
00040000-5536-a18d-3bff-482e8b51cd34	AO	AGO	024	Angola 	Angola	\N
00040000-5536-a18d-5838-c027d69a3047	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5536-a18d-2e51-c39af64c2cdb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5536-a18d-f7fc-27cd00bf134c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5536-a18d-9f6b-e3283ff8398c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5536-a18d-19cf-9333b70f2f95	AM	ARM	051	Armenia 	Armenija	\N
00040000-5536-a18d-5491-18f2670ffb81	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5536-a18d-0e12-7bd48c5f66a5	AU	AUS	036	Australia 	Avstralija	\N
00040000-5536-a18d-7011-feeabdfe7480	AT	AUT	040	Austria 	Avstrija	\N
00040000-5536-a18d-8543-f61787a1cd5d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5536-a18d-3422-b93903a40f2c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5536-a18d-5bcb-eb5205f80b51	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5536-a18d-d817-7b17a0788405	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5536-a18d-c615-561d60ab33c1	BB	BRB	052	Barbados 	Barbados	\N
00040000-5536-a18d-0697-e26edb2ef33e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5536-a18d-194a-830ed3e5030d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5536-a18d-60be-c3b7956c2790	BZ	BLZ	084	Belize 	Belize	\N
00040000-5536-a18d-f56f-9921c67d73cd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5536-a18d-fb6c-d11a139e6bc4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5536-a18d-34e0-a5e4f19265a7	BT	BTN	064	Bhutan 	Butan	\N
00040000-5536-a18d-1f10-708eefc8344c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5536-a18d-ad57-15f78271e7d3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5536-a18d-85ce-5dfa97804630	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5536-a18d-9124-dcbb13aabf2c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5536-a18d-0585-b719f1f1f65f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5536-a18d-b654-9541b29de494	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5536-a18d-b6cf-0bed1eb0ea89	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5536-a18d-d265-ebdf867ec2a0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5536-a18d-3b59-cf1102054ee4	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5536-a18d-04c7-2a3af5def472	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5536-a18d-22f1-be5ac35200a7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5536-a18d-99e1-a52728ccefec	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5536-a18d-e91a-53986997f805	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5536-a18d-f80d-3b6b18bee218	CA	CAN	124	Canada 	Kanada	\N
00040000-5536-a18d-f5c1-3e800b9b9805	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5536-a18d-b9db-85888fe3d120	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5536-a18d-0906-3bb3ee9b7fb0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5536-a18d-6a15-c9fe93201f1d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5536-a18d-9ecd-159107efb1a2	CL	CHL	152	Chile 	Čile	\N
00040000-5536-a18d-a30b-82ac19046737	CN	CHN	156	China 	Kitajska	\N
00040000-5536-a18d-2b04-1223f0e1adf2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5536-a18d-8c2b-6559d3b51163	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5536-a18d-ff33-86e0d0da5c0a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5536-a18d-6994-2f87548c9854	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5536-a18d-8ef8-1f1fbac746db	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5536-a18d-5ac5-41e5c35f828c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5536-a18d-eaa1-5de9f90f42e0	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5536-a18d-b30a-248cc01b55fe	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5536-a18d-c2ca-180ac8a0a1cf	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5536-a18d-ce4b-46cb40bd29f8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5536-a18d-98fd-b5de492b245b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5536-a18d-3676-a7483ee2bf5a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5536-a18d-aeb4-25e2eaac551b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5536-a18d-2fdb-81e46ec3a758	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5536-a18d-a9ed-ed46d9708169	DK	DNK	208	Denmark 	Danska	\N
00040000-5536-a18d-0bc3-f5ae79ddae7a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5536-a18d-a44a-810d1317ec06	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5536-a18d-06a3-5a0e5b986789	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5536-a18d-8f01-153debd6d8bb	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5536-a18d-8bb3-f6e9d1039e9b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5536-a18d-6585-ffca2ed6ebb8	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5536-a18d-284e-acb02c056f21	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5536-a18d-ade3-395590aade99	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5536-a18d-c479-6fe5fd664769	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5536-a18d-6aed-b28fb38c0803	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5536-a18d-01c3-acaf2d16ec78	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5536-a18d-0804-c18ff540b9ab	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5536-a18d-54bb-e9e3f3138d33	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5536-a18d-fde8-bd0294431065	FI	FIN	246	Finland 	Finska	\N
00040000-5536-a18d-a05f-fffac4025a26	FR	FRA	250	France 	Francija	\N
00040000-5536-a18d-ba69-40958669eb5d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5536-a18d-5bb1-60a4ccabd47b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5536-a18d-26fb-1b35390074dc	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5536-a18d-beef-8a22b4f16e43	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5536-a18d-1a35-f92fe20caae4	GA	GAB	266	Gabon 	Gabon	\N
00040000-5536-a18d-fc7f-139f906b621e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5536-a18d-f902-4a982fe7b20a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5536-a18d-c0b6-bb11ecb83cea	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5536-a18d-760c-b45de594dad5	GH	GHA	288	Ghana 	Gana	\N
00040000-5536-a18d-8b73-5e2565995279	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5536-a18d-ac85-8fd6559202b1	GR	GRC	300	Greece 	Grčija	\N
00040000-5536-a18d-bdae-3692ccc17808	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5536-a18d-87f8-f3db388678b2	GD	GRD	308	Grenada 	Grenada	\N
00040000-5536-a18d-b292-3bbe269765cb	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5536-a18d-6332-6df38179827c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5536-a18d-56e4-0a0f35d417f4	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5536-a18d-13a0-79c254936bfa	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5536-a18d-4d6b-2991ab32e239	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5536-a18d-fcf2-88f313d3e674	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5536-a18d-30a2-c96a03ad1eb8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5536-a18d-53e5-e6f3a8a12b8d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5536-a18d-3952-14fe78ba28fd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5536-a18d-d95b-cb3cc18ace0d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5536-a18d-48f1-8473cc1a91cf	HN	HND	340	Honduras 	Honduras	\N
00040000-5536-a18d-bc99-7a483c7bde3b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5536-a18d-6b7a-6efc811e7c5d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5536-a18d-9f8a-252ba7623a20	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5536-a18d-9a39-1b7054b9468c	IN	IND	356	India 	Indija	\N
00040000-5536-a18d-2f6d-d455fd220696	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5536-a18d-58d4-b13aaa752d58	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5536-a18d-5b61-4beed941acb6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5536-a18d-4337-b9c73dc7120f	IE	IRL	372	Ireland 	Irska	\N
00040000-5536-a18d-7231-72096277c4ec	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5536-a18d-a352-477fef140c53	IL	ISR	376	Israel 	Izrael	\N
00040000-5536-a18d-b3b0-5301d230760b	IT	ITA	380	Italy 	Italija	\N
00040000-5536-a18d-b8d3-95c3bf050965	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5536-a18d-e84c-28d2a4150754	JP	JPN	392	Japan 	Japonska	\N
00040000-5536-a18d-1173-c3317e27c3d8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5536-a18d-11ef-e9ca1d573127	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5536-a18d-202c-aaa08ccc30b0	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5536-a18d-257e-22b4837a6163	KE	KEN	404	Kenya 	Kenija	\N
00040000-5536-a18d-998c-198fe00d330b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5536-a18d-303d-2e81ad91924f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5536-a18d-6271-3a3aaa66430a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5536-a18d-574f-81f9ea42fbb1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5536-a18d-a97f-411db2c9cc4b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5536-a18d-416b-7a466063bb6b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5536-a18d-3ebd-d5529f382113	LV	LVA	428	Latvia 	Latvija	\N
00040000-5536-a18d-b1bf-c56c9c89c510	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5536-a18d-beed-01224fa75acf	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5536-a18d-99c5-a19b9b0ab3ca	LR	LBR	430	Liberia 	Liberija	\N
00040000-5536-a18d-d111-13655ac96b29	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5536-a18d-a4e5-5db5f018200e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5536-a18d-7d02-3fd40522ed4d	LT	LTU	440	Lithuania 	Litva	\N
00040000-5536-a18d-4fcb-f3a80e5dbf69	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5536-a18d-73ae-3a365f4c3c65	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5536-a18d-e374-67141a569e6a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5536-a18d-8cb4-d91ab522ce5a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5536-a18d-01a1-342da0c4ff29	MW	MWI	454	Malawi 	Malavi	\N
00040000-5536-a18d-4199-183fe6db8e63	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5536-a18d-0050-ea5c350c7c18	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5536-a18d-dd0a-c6f51636c109	ML	MLI	466	Mali 	Mali	\N
00040000-5536-a18d-2486-9d1da733edd4	MT	MLT	470	Malta 	Malta	\N
00040000-5536-a18d-f0e5-d0d01d483c9c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5536-a18d-237d-741b0e3afe02	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5536-a18d-fb1b-47bd896331dd	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5536-a18d-b3b3-5da9be24745d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5536-a18d-d18e-f9b6386b4657	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5536-a18d-27a1-c6aa0e4be66b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5536-a18d-e5dc-f488bc02f662	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5536-a18d-cb33-829453efbb31	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5536-a18d-b5cf-306839367198	MC	MCO	492	Monaco 	Monako	\N
00040000-5536-a18d-af27-81c4711daefa	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5536-a18d-e325-4d658384e1dc	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5536-a18d-76ef-47943024b2a3	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5536-a18d-9d6c-7aff6d8fdc4d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5536-a18d-5775-cec84fb71b07	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5536-a18d-50b7-4f5b81c163ce	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5536-a18d-1e6e-5ad022de83c8	NA	NAM	516	Namibia 	Namibija	\N
00040000-5536-a18d-ccd6-6ada79f4b14d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5536-a18d-c65a-1a765e292963	NP	NPL	524	Nepal 	Nepal	\N
00040000-5536-a18d-80e4-2222193ca072	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5536-a18d-8dd5-01ffa7c9bad8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5536-a18d-74d0-0afbfd1e9b9d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5536-a18d-2da8-578798f52c85	NE	NER	562	Niger 	Niger 	\N
00040000-5536-a18d-cba1-5b1091ec9093	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5536-a18d-2219-ace021232df7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5536-a18d-2390-10e3c0b4a1e0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5536-a18d-ed44-3476f2fbee62	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5536-a18d-894d-8087b29718e8	NO	NOR	578	Norway 	Norveška	\N
00040000-5536-a18d-c00e-7cbceff6fd6a	OM	OMN	512	Oman 	Oman	\N
00040000-5536-a18d-3364-c6048b36571e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5536-a18d-37dc-b6e8edaad15d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5536-a18d-8925-f6cd2a67a624	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5536-a18d-e893-f951d5e82405	PA	PAN	591	Panama 	Panama	\N
00040000-5536-a18d-1769-9c1c7023ed33	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5536-a18d-ac12-f3e9941be345	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5536-a18d-876b-730dace91b9e	PE	PER	604	Peru 	Peru	\N
00040000-5536-a18d-eccc-afed2de1c21a	PH	PHL	608	Philippines 	Filipini	\N
00040000-5536-a18d-2839-6b7024abac1a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5536-a18d-6d8c-9ee64896317f	PL	POL	616	Poland 	Poljska	\N
00040000-5536-a18d-abe0-390caf41fff2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5536-a18d-1ef6-517febcc86fe	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5536-a18d-6aef-de408df4a1e5	QA	QAT	634	Qatar 	Katar	\N
00040000-5536-a18d-5991-706ac7729a7d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5536-a18d-90cc-d76aab8d6717	RO	ROU	642	Romania 	Romunija	\N
00040000-5536-a18d-3ecd-fbb1255102a1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5536-a18d-e97c-19840779623c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5536-a18d-6072-a83f9c54af0a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5536-a18d-cee8-ccb3eca9e985	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5536-a18d-9b6d-1beb0314a8df	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5536-a18d-ec5b-08929bc4fbfc	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5536-a18d-ecec-b3ba3260e16c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5536-a18d-e30e-f47c4804d65c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5536-a18d-d906-89eaf206688c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5536-a18d-223a-867beca38464	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5536-a18d-38b3-f6ea25956782	SM	SMR	674	San Marino 	San Marino	\N
00040000-5536-a18d-65d5-7be0632cc89f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5536-a18d-82fc-021ec811604a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5536-a18d-beac-aa358c88f835	SN	SEN	686	Senegal 	Senegal	\N
00040000-5536-a18d-e265-d67441466af4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5536-a18d-e977-263c7398ef1c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5536-a18d-5487-deef91cdace1	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5536-a18d-37e2-85280ac0625e	SG	SGP	702	Singapore 	Singapur	\N
00040000-5536-a18d-b86f-5174fd900da1	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5536-a18d-c3ee-fc532b1c27bf	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5536-a18d-9df7-2c728dbe1699	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5536-a18d-4c5c-c5dedb5f2f2a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5536-a18d-2e74-8b48eabc147f	SO	SOM	706	Somalia 	Somalija	\N
00040000-5536-a18d-f898-38ce64e08cf5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5536-a18d-b038-c910dcd08852	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5536-a18d-519a-9e9dd7902c4f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5536-a18d-921d-d216dca677a8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5536-a18d-9f2d-e34790c40e30	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5536-a18d-0c70-478361f13c35	SD	SDN	729	Sudan 	Sudan	\N
00040000-5536-a18d-965a-825aea93c624	SR	SUR	740	Suriname 	Surinam	\N
00040000-5536-a18d-f4dc-e3a054c1ba94	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5536-a18d-a4b6-3b6541d9eaf0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5536-a18d-358d-6ce03689cf0e	SE	SWE	752	Sweden 	Švedska	\N
00040000-5536-a18d-3e49-933124c6a64a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5536-a18d-86b2-8768fbffe47c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5536-a18d-7f5e-20cf278e79e6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5536-a18d-9e0f-df344d11ce9a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5536-a18d-3d88-a44214eb85d9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5536-a18d-f1ec-c1a49ca9db92	TH	THA	764	Thailand 	Tajska	\N
00040000-5536-a18d-ae4e-dc62b86745a3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5536-a18d-228a-d6ced5bcd813	TG	TGO	768	Togo 	Togo	\N
00040000-5536-a18d-f3b5-9966f2186585	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5536-a18d-0e1a-83f1a8a7bb5c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5536-a18d-5cc7-396fca52e57a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5536-a18d-7a06-d5daedb5d483	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5536-a18d-d9b2-0440ef2d11ad	TR	TUR	792	Turkey 	Turčija	\N
00040000-5536-a18d-c81b-f623ee772f3b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5536-a18d-5413-252bad78383d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5536-a18d-cd4b-92ca703a8f5a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5536-a18d-fa9a-96c58bdeaf08	UG	UGA	800	Uganda 	Uganda	\N
00040000-5536-a18d-8725-422a0251fe3f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5536-a18d-c7a8-72c008c7210c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5536-a18d-70e9-e2be225cb4a0	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5536-a18d-42aa-96947548d668	US	USA	840	United States 	Združene države Amerike	\N
00040000-5536-a18d-4e30-99ec7fa3ba28	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5536-a18d-a16f-6403b24466ff	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5536-a18d-bdbb-e34925122a67	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5536-a18d-5d1c-dec950324ca0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5536-a18d-d1dd-727d7fbf5d95	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5536-a18d-cff2-b29f56beb0a0	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5536-a18d-6549-8184e10e5a0c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5536-a18d-60ff-58c3b2253ce3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5536-a18d-5ad7-459a7c846e1d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5536-a18d-eb6e-58348bb7587c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5536-a18d-274d-45c8ddee257c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5536-a18d-eb15-51cf3add080c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5536-a18d-d6d1-9e520445c7a4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2660 (class 0 OID 692951)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 692772)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 692820)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2618 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 692869)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 692894)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 692723)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5536-a18f-adf0-865c9a3d5d85	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5536-a18f-e62e-6690e4ab0b07	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5536-a18f-cb00-c810d505288b	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5536-a18f-bc98-e906630f71f6	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5536-a18f-d37e-5e0f22bd2953	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5536-a18f-9798-4129446ebc1f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5536-a18f-9d23-716720678829	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5536-a18f-2aeb-82d8a27527ae	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5536-a18f-7aff-f48909307318	test5	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5536-a18f-c264-a537129e40de	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2628 (class 0 OID 692638)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5536-a18f-fdb1-74332736aa5c	00000000-5536-a18f-d37e-5e0f22bd2953	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5536-a18f-cd1d-64cf4ea842b4	00000000-5536-a18f-d37e-5e0f22bd2953	00010000-5536-a18f-92e7-4a5570ba1d31	a:1:{i:0;a:2:{s:3:"key";s:1:"z";s:5:"value";s:6:"zelena";}}	f
00000000-5536-a18f-0703-eec7c172c919	00000000-5536-a18f-d37e-5e0f22bd2953	00010000-5536-a18f-a5a8-24d77fa23267	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5536-a18f-002f-c1302ac9f363	00000000-5536-a18f-9798-4129446ebc1f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2629 (class 0 OID 692649)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 692694)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 692603)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5536-a18e-ce7b-71fbcb053cd6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-5e1f-230eb2004b66	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-ceb6-b103b105c2da	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-862c-99db3ee7aed2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-7b76-b477872c41c1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-50d6-899161962419	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-6308-1bca7613aed5	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-94c5-4218c63ffe30	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-1509-a6ca2aa683ee	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-53fd-8293f0d15501	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-78f3-5dc902f1e844	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-d066-6262abaad7a7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-5144-975e713559ea	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-16af-babddadd165f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-77a4-44e3edfad177	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-d6d8-8a9d4e7b0377	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-cd4c-a7c7e88b18c4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-6daa-d10378269cef	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-5cc5-d97120f584a1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-f287-e331a3ae2928	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-6e33-d54579dd0d76	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-3dbd-c609ae9b70d0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-2316-64c13d345795	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-6157-3abeed311e43	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-6c41-521fb4d6f9b2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-9d00-4eecbcde8ccd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-560c-9094013fbf68	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-fef4-55d0365ef592	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-c738-ef119cf71c0b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-ccc7-6d834a4f686d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-b23c-2fb2d99ed642	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-ff63-24af47a6ca11	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-1d9c-1921aa2dff7b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-a853-e08b51ef7ff8	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-7aa8-fdaca37c1631	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-e417-e7b9f28d1d59	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-86cf-32f517ba4e1c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-3b03-7612dc1ba1d3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-52fd-d3c9751cd141	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-8e2c-cd3ef7c55dec	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-46a5-40ef9b16741a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-952c-2f8e06addd70	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-36cf-33bae03a04eb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-b696-81b3c492e2ed	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-c881-3bd8b212d2b2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-3082-d93ec02ea8c1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-2064-84171d1be038	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-17f9-890a7e88ed13	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-ae3d-ddaf45b10df7	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-8506-649a121dd86e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-e41b-144d02a9d798	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-3763-c55132c1394e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-da93-1daa54767b2b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-a44f-aa30da612d1b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-8572-22cf9acd2d9c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-82fc-5a8db6a933a1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-98f6-b76be12beb82	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-9ee8-341a4c0c3f72	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-3234-69e8e2428a58	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-068a-f2e3b69ed3a5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-b334-a62c6f390f5f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-9964-d7af9a4d874d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-f297-0dc57ba45a1b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-2f4c-1745d5b2b7a9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-13f4-2a3bd9cce4de	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-b940-c8799aeee5d1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-9558-080c1cd695f1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-219d-0b3f3461b149	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-37e9-b7706b270909	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-ae3c-2e431f10111d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-1f5f-0c0faf5abd19	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-8ca1-1330334d4651	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-74f7-a43ca0d5b229	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-5364-211d70b9ccd5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-56d9-5fa435eab83a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-f0e9-9d69d05bd304	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-c0ae-367b42a67577	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-e390-20f0731b0200	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-ec86-3666f1d2d685	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-f204-237657d0624f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-c622-ce30e2d134fc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-59e1-8aebd8b1e20e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-cd21-fd5c54fe25f3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-3f55-861fa2dc6c74	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-8549-9c8e7a8a016b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-d94b-97be52e423f9	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-507a-5fa12176d0e7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-08a7-a6d96835ed15	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-df9a-6a45bffbaff3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-2a1c-1d0e912b225b	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-572b-b4aaa2371a6f	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-9b9c-9b10f5ed0745	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-7698-ca6b1a79abab	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-590e-5459954c9b99	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-5f67-75521144d387	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-f4b5-7cc74227a419	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-98d5-380c47976d9e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-19ce-2061f5cd9821	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-bc3b-188b8173fdfc	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-9d2b-397126471b59	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-2dcf-bfcf29afc67e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-64a5-ab5b97b21650	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-6a9a-b8f26ec8ade4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-11d7-21f039082215	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-8a0a-ff087650f9be	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-6def-486bdc059ec5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-b693-310f2a1e412f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-e685-78b5c8f20e4a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-5c34-3832d9a61de5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-d952-ee88107ae1dc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-d9f6-4760175e26c2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-ad06-30548f6f4374	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-e6e0-7f0a08cf7504	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-57fc-e56cd3c41075	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-62fc-9ab6c29ab2a3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-4594-3922ce887a22	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-6524-44b79abc0c56	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-8399-53f4a181a864	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-63a1-bda2aecda754	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-84b1-d60619e70583	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-6680-60151a472220	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-da19-40a92591a91e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-7326-3c2eeeb89322	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-a399-e643bf3a45ee	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-cf38-7401dd8b14c9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-9f43-3c880cbfb4fb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-e0bc-383131a33dbb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-c496-bd00c4c18cc2	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-cf5e-0ea8d8b5f9ac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-c9ae-8931ad9258a1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-c78a-ad12d2aff27d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-2a45-dc2a8ac24fe1	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-fc55-adb05c46a2e0	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-21bf-894c88d0cd28	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-aa88-0f4074292836	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-2bea-c89433795410	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-6fc8-1bad3cb8c056	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-7a73-9556f4c95d92	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-2452-64813879cb2b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-7892-c3e4e45c25f9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-ead4-75c2cf62861c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-ec14-550f9434359f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-d96b-ed932fb2cac6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-25f5-12c7b0a6d9f9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-8232-ab268317de27	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-943a-5d648ba10668	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-7dd0-a38d4d923d5b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-34be-68b9aa516d21	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-5656-2b032e5740af	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-5ed9-62b8f2eff83b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-d4c9-a01553a1b62d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-8808-693a04c3fd2d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-8b4f-76a39d8ff44e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-eba9-00136669f354	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-464c-4f924c5379d9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-4693-24b2ac20e94d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-bd68-5635baf6b3b3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-8d42-6b39a4f55674	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-bc3b-5a307d6a51e6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-757a-e1469cf94552	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-30a6-e29f4e68280d	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-26dd-b4c8a9059d71	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-6040-a7e5653e8141	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-5940-328333ba7573	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-f576-ee75f0c9603f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-a708-c452a3ff107e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-6ed0-741940679dec	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-d3a5-8159b1dd6e17	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-623b-76153e0be62c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-b63e-0a974d824dce	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-53ff-c9a773633719	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-28bb-b1eccc51c734	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-8603-421dccc682e6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-18b4-0efd774eeb02	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-7aa1-6c10dfcffc9e	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-a543-9c3dfe4f86cd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-49c9-f2b8bef06577	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-b31e-dbce82ecef83	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-fc08-cc3461129c1c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-03e8-c260de355167	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-43b2-62d3aa93ab4b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-f4db-44a55dbac4b4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-d8db-58b3e5d0dc89	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-acc7-da685104d9bf	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-6572-8130a34b1790	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-a40c-0f342cf7a279	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-8375-e89efe88343b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-6096-530baec7e9be	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-5108-3596ad9da490	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-8596-51310237b5b8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-2b49-c3873cb4def9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-a75c-78ec86f8509c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-fd64-16118e8f55ef	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-d73a-94d906f8b886	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-a038-69c7923217d2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-0de4-bdf6213fa4b3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-1141-a3408e9dc417	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-c40d-0d33a12ae764	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-dfd9-df4bfb633035	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-5388-74bce6ab2613	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-dc56-d13011617e07	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-dcda-4d4c0ceba70a	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-8608-0fed5ee4f172	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-7bda-8d3888cb944e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-8381-7ffa1109a539	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-cd6d-fbbbdc30b59e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-5c3a-f46bd4ada4e1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-73f4-acae3943bd2f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-e78f-cd8ab328d3a8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-0b0f-160290b724f8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-1831-93d90f56676d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-4706-be1bb4b462d6	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-3448-76949d0782bd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-f7d9-5f793b681f46	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-3842-b9a6c30d0d7d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-f6fd-e0a210443f97	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-93a6-2a431237fe1a	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-2188-7061747e20b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-3e20-0a00fdea8dda	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-6d80-cb22fb00a887	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-9263-8e8ca2a2fbfb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-bfc8-51697e000bff	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-2cb1-f77e631c2ec7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-d3f1-cb9286eb3ddf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-5c25-e66599f4134b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-4c93-183e4e0d91b4	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-9250-8e07f1c0dee3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-9847-abfd61d40601	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-bbf3-cdb5d15e5342	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-e448-b3a7629a531d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-5edf-a7c87c1aeb7f	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-6677-47b895a89e70	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-43ae-8b7d710ff738	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-36fa-4f48618f9de0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-a703-e9e8877a2092	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-b730-ee81d141204b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-dec6-7c71c245ef80	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-ed07-62a7133ffb2c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-6580-9a8966e95f44	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-842d-e20b6448ada6	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-16f2-98677fe90865	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-0b46-6da461551d67	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-b8d6-f727d530fdeb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-1f96-1c6e5f3cb60d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-f718-f10a11a86f32	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-29da-c945a7b9636f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-1fc9-9881fcf82857	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-e8fa-5ed98e2f243d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-9baa-084fc53ba934	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-67f4-59922b7298ea	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-68b6-54e3aaeff10f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-3490-d37788590aef	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-5404-9f4126855ede	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-a10b-5526329624a1	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-974c-a3dad6dd1fe9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-7f36-fdf711e71c68	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-3b25-f57bd190ee9b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-cefc-c45dba3552a5	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-169f-f66108b75450	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-7dab-0c6f3aaf711d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-d256-a3f905d33c30	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-e708-a8bc6367dd85	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-6859-67b920592cea	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-f69a-f5ec03eae8d7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-d63a-1843aeca4824	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-810a-0552df2939db	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-8413-75f02c93d90e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-0717-0f0757dc3b48	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-9396-a9fc3f38113a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-1e61-f4fcd9e0dd2e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-452b-fbb3bd2562a6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-5371-1227c0e30737	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-5134-342816d405c1	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-0fed-75cf089ea433	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-cb36-5311ca14ab8e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-1698-9a4990131aea	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-edac-4eef30abb13d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-80ef-ecc6dad1cff9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-b9c1-2cfeaa3f8b61	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-5bf5-3ebf9ccc04c8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-4e8f-9b11c3afd658	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-7b47-eb15df1c96c1	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-e6f7-f34170c7381c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-3d89-a3b887a6b310	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-dca6-fde3ff41ab51	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-0529-f5f479ad3da2	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-012c-859cf99fbed6	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-65f3-e66137b61ec5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-239f-347432d13976	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-4db9-6e9ed1b6e137	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-0ecd-e4545e0289d7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-d454-70c3a635df40	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-4815-f67c1227e937	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-6072-bc70a662c7bf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-bd5d-9e5ca53f8081	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-850b-67693b113c43	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-e05d-a8f74ab3c9d5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-3be3-a75f07dcc754	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-3e47-9777e6a34567	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-9b62-bd18130c057c	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-12ca-4830e504f7b1	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-c6e9-233ea447988b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-b488-cf6cbc4e1f30	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-2bdf-5577ab6d7319	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-7b31-1477206ada87	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-cbf9-50b3493b9aaa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-88d0-6ee059a0b435	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-a04e-6f955d564fc2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-a1d5-efc6f7ece063	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-86f3-9fb209a229d1	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-c27e-4f87adbdbabc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-98f4-5125d267a2ec	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-ab00-eef9340b3e15	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-79a2-3c8587a03744	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-9d04-fd247ffd961b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-72ef-a55efdab75cf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-2573-eae0683184a5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-be9c-82b521df52ec	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-782a-96cf9841f566	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-a36b-9f556fd0b41d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-2776-b3ec5860e2b1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-b87c-1a41a23f33f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-7b5e-11f85faac5f0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-b08f-70d4c893b844	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-a92e-97cf520dcc04	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-6710-37d2ef0391d3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-699b-31d6b80ee302	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-e8c6-719034bd3e95	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-7fea-b66ea89982ad	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-10be-71235efaed60	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-00e7-636ae67414f7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-6124-7d37f620688e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-5b7f-566c38992f66	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-f951-c931e01a5954	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-f092-870a17243be0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-676e-6588f61cd092	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-d268-f76cdec56f93	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-8556-0380a554022a	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-1b9c-a7d30e671efc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-0c7d-c30714f7fbd9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-2e90-0822e862a1bc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-2099-494c519c31d4	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-e59b-1a167bedea24	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-7255-c90224654327	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-3e8c-c616ab13f329	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-d70e-1158dfe4e840	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-319b-d33c7702881a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-75f3-0aabe4a5c1ce	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-55b8-b3f5a4afdef5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-dbb1-c7946ca48428	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-053f-65dc4faebdb7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-099e-2ac28660dee7	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-25a8-40c4b08d8118	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-540d-677934ec8c12	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-170c-e965a9517712	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-5f41-1932aff0521c	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-2897-57f21450ecac	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-9448-0791f938ebba	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-6cd2-8f88d70df152	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-3d3f-9291014c08c7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-87c3-9d3d28dbafef	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-7096-1ecd70ca48c6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-7fae-eedbeebb0e13	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-e210-642af3601d55	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-679a-059b93e58c59	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-9b9a-7063ad126446	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-612c-409692cbb581	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-fab7-dd2cbe1d95ab	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-228a-8b934a78e8cf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-f2a1-21ea6c36ae71	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-976a-7f53997cf508	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-bc87-6ad993030cce	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-5846-3de4cae1dd43	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-49e8-0dab742c2636	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-20eb-a9dd596ef08c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-3d13-ff3ed749ac33	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-a63d-f4a481882934	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-506e-cce55194f7b6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-1ba0-35df8f832e06	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-a95a-85f1d4e38323	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-bcc3-da01cd3ed305	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-9bec-1455094c5481	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-3c2e-02629271e230	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-b386-e9ed6438107f	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-d832-2311a7d8382c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-4734-1331c556397d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-e327-f8479d5a90e9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-8e53-b7fd94c31bf2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-d629-d8face341cf5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-e975-fee26d93ae94	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-8358-f47b5847f5a7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-7346-f1bf7e028850	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-9ba7-e7cfc12cd429	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-ff63-04dc588e0010	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-51eb-26ebd5e0aa35	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-ac6b-2396c65d01eb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-cd05-48de53b866d6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-4e78-a52333fe5430	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-bb1c-03837e9f05c7	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-9a91-7709fb37e5e2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-2802-56310ad35933	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-4c68-152a513c9ed3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-4bfd-16cf6b516721	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-e0a3-9dcc9e9eda6b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-2473-0bc669ab8721	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-d53e-1decb95fc0e2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-3837-978bc89a2c81	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-b7a3-2340a91643ff	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-57f2-1555fb3d4b8b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-cf20-188fb14f3cb7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-5643-51766b0a98d1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-9566-08873c93e36d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-8d65-7327472b65f7	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-1769-16fb149fe843	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-e3b0-f524c8bfb8f5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-0bcd-99fbccd03a9a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-31c5-4fa8194f06f7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-5d8f-a190c8228101	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-9d80-2e8b6c6468d4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-274c-fa4047268d5d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-a5de-caa87048c318	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-8af5-8e5df6393c65	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-1e55-9d81a4e80037	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-8b81-73cc6ed5c687	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-6a31-20503a9fc437	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-58d0-3f901b7954cc	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-9fd2-d6ff596931ad	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-e5aa-1c68385be73b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-77e4-b1fa06e2a8a9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-07cf-047357c0466e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-69c2-d157f205e39a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-43f5-f766050647fb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-1b09-2ae869deb83c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-8b02-e5608df8bdc2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-ddf8-7cc3f3929d31	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-2cb7-cdc61ff3dfb0	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-135f-575f66aae6e7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-e66c-738f342ba513	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-dd6f-d6a82fa271ab	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-4a27-cb210204f79a	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-7de2-58eedd847673	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-47ed-b952d5327d44	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-ba19-6d0bf460714d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-0e97-7a43e3d7957a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-ca6c-1a3840d0ddfa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-4855-ddcd771f2a71	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-dcc3-b1e6e31f089d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-110b-a7a1bafc597d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-907a-a8e3090f060e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-eddf-3f47e7d78ccf	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-67a0-ea9f7db2f3c2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-03e2-051d7e252303	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-2a4e-d387cc085ef3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-14f7-e15571440b95	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-31a3-e0999db59828	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-630a-c3d1ad873158	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-8417-9ded06946c88	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-d91d-6c78fb3a4ebe	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-81a7-89079d64bd57	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-5026-1b146074d5ed	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-923e-4a7c8a8ed627	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-4792-d7b0ce24e343	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-f644-905ca874e781	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-df29-921b6a611ad6	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-009a-adedc59940fb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-731e-6d144916578b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-697f-b36727834d71	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-7b68-9ccc855317b9	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-2ac1-8b30c886b2bc	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-7d0b-d7d1fe8f0b0a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-fefd-2ec669a024ef	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-fdde-1a3729e37505	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-2a79-eff3217cc5e9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-50b9-7e6744d0c1fe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-aa05-3091afa27e50	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-1887-291cc780935f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-f8a4-ba68e4200afd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-ccc4-fc354f72deb3	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-152c-acd3bfbe2a57	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-a39b-749854d4d3ef	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-6c29-eec42a28d82f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-d74d-c50415e588b6	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-1d02-908ffbc6b94c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-16ea-47429167bdb6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-2704-068586fe5df8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-d099-2ef49b18e87b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-2fa3-6c9e8ad7ea6c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-165d-57394e3447dd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-2d93-033040522541	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-3e58-7c8aaadc8c96	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-dbac-a46f3fdbfac1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-49c5-6a07dcaada1a	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-0b35-402512dc9115	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-effe-5f19ba84de45	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-bb8c-be357e94d6d7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-a59f-950c11cdbcba	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-6e9a-b159113ed0b6	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-e44d-262d5f33a147	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-cb36-3fdd9d9ae809	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-4f3d-8675136958f3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-9f26-0aef58b8459f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-a205-913efb2e1548	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-a51e-1d9082f404ae	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-7ff1-3b3acab43339	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-ac42-acbfb1225a41	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-6c61-c8aaa00fb0de	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-6a36-070a1a0a09b4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-14ab-51c73a9f886f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-a001-b62cf98c4cca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-edba-a4783f0a58fe	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-1586-0707f06e2822	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-85a5-2af1a72a98b2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-5767-375039bb0d72	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-86c0-3de21c6cab6e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-7cba-2651fbb6a99f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-53d2-bbd28306539f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-120a-d3d725eef4c0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-f0c8-33e4039c0622	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-efac-4cc0b7a1f141	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-ab0f-b1d0e821a28a	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-da04-60196d7a7b7a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-2245-15003aad0d2d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-3568-7ff2df2ddc10	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-0e08-0eeaf987c584	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-6f67-30668e4ada4a	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-5d80-4a7f6326a43d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-5a92-3339a6fd62a6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-4399-9302e928dba5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-1dd8-dde83c1323db	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-3058-3a40bcc0e294	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-1b95-1e830f555ccc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-b1ae-6c69b7b06015	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-af58-96d2b73351b0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-ffc7-7b7cca51268c	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-7531-332dc810eeb5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-f6f9-e2e9f26e4fd1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-ca91-c3f4ea44f20d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-34c8-e46f3249ceec	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-ca2b-6194d020e849	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-a960-59fc73fef92f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-251c-5286a21d8e9b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-03fd-52ba69359c9a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-5139-7fd73d456057	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-99f4-88f6613cf397	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-596d-8d5fe5cdb5e3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-28a8-ff4047ac31ef	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-814a-ce4821858f6f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-3bdd-fa70395e0ab0	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-7d40-f37f8534b83e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-20c0-73bcc3016884	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-1fc7-3d9f36a23211	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-50fd-02204dce6403	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-f707-efff6de658fc	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-388c-2c6e7b351b10	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-edaa-6c52e7aade9c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-c05d-ad323bae74ce	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-583f-a1be829dc71b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-51e7-cbda85fa93ec	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-d487-1d0c47509098	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-da09-efcb4d877efc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-47b1-ab236c8d0d95	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-1ecc-4a72c024db25	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-c760-1150fd464e43	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-4f46-d51932c0fd58	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-d57e-a973d67001f5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-7e3e-c9660eadccc7	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-8498-ce954ed52a50	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-82af-67c2f2f74f1f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-ea35-87ccfd1feb81	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-9d71-7b0ad6f5348a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-d90a-1cc6f0306180	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-533a-af484a51cd7b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-d73d-7cc1c75a3826	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-5464-b36ce24a035a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-6767-d0b9c18756a3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-fd0f-a0387581e3f1	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-1ae2-cedb245b1ec1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-c4bb-3fa48058dd97	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-aef4-7a0e7c002f30	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-dcb6-b550c5a1957a	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-c410-378257b7228d	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-33ba-fa624d66b77f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-510d-aa17ac2be53d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-ff27-2c28ed16358e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-92f4-54a68cfe5aa3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-0451-c47a07069f5c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-c7b3-48cf2e4d23f3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-fec3-a6fad2ea09cc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-8e57-de6ee5d809a2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-9d17-8c8b21c2f782	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-f475-8f1aba64fcae	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-640e-3b71dbb57bb7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-9345-760f1e53532f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-48cd-47cbb6e05a91	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-9914-354c28ce373c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-dc13-93d27f0548ae	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-a7a6-87efac700530	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-4c0e-2fe968fc3ed8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-0af2-2d0f9f7d07dc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-4a0b-38d8c021d9e3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-2c0d-b62ba0f382ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-4629-fb3c7a1f92e7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-0230-995908b47285	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-125e-412c7b42a927	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-4d3f-afdc4dbb258c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-1956-3d5be6f87d95	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-1243-57b20d714d21	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-593e-f9722280403b	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-142b-12f622c4d5b0	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-044f-dd59eaeb58a0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-73cc-9ea345280498	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-6746-19b32c7bd041	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-184a-9cd38b9fc0a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-c6b9-d107d28f11d8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-74f8-2b08cd608a2b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-c93a-5554f06b72a5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-79fb-0148952c3a9c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-9d91-8b47679b1f06	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-8302-b4c6eafd654d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-e93e-0115c59a26f4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-f00e-7ea8b76ad446	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-d8b5-33eed7e8f76c	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-25c9-387cd5856314	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-4a28-33542219541d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-b82f-37e48317c0f9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-6046-a963966bfd93	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-3dab-e58f6eafcb39	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-7209-948209605872	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-a942-db1032cd178f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-5a66-0f441be0c21f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-2db8-abc6b90b952b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-5a53-3b2cd684e4af	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-fe3f-129d7e7006f3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-5cda-7c4ae87a4924	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-3bbe-f46fa7f41d29	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-f41f-03e4953b2e77	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-6270-f04078d0e2e5	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-96a6-9fdc7d187032	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-d445-189facb19d6e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-4de2-1d9f7b46e813	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-00c5-d643eb0941b0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-1a01-cc30106316a4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-5a07-c49173a0c99a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-f2cd-60a5544b017c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-bd48-37415dc13c29	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-f383-f2fcf65c6925	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-c592-f91dadd45a0e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-6dae-f642dfecb398	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-ca31-c4dc4d2df46f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-dbca-920da91e06e8	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-ba6f-91eb96ebe541	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-04e5-fa38566367f5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-e179-5488fd5660ef	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-1c49-256cefd53fbc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-9c9e-5f80d5e6f17c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-b17d-b9f5fa1c2914	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-af1a-b788e5c5badf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-a77e-fc9401670445	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-4bca-5b18da92398a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-4fca-326e23a7644e	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-694c-753f11e415ab	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-e394-d8534578eb7a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-7095-d6b85c9e3e3d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-3df5-167f26625eb9	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-9575-688769c8e797	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-f34b-7f73f9962bcc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-fbf2-8176e5953193	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-5bec-aa99978ae688	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-8ff0-5c4b8f011d30	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-256f-7a2971d6b5d2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-669e-ff5145bd1488	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-8793-1f1c9b99f07e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-5a3b-de33d9bfb278	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-b8bf-0622a7ed4a39	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-01ac-c6a1552ef8ad	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-c357-56d089436059	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-4908-1fcf0e897309	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-53d7-6f42e8fd04e9	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-78c8-31238f634674	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-e4e4-8fabc08792a6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-6a11-87b2de633aa1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-0d14-ee20fdf056de	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-afd5-58112825cb52	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-7a23-83e1e94aaaf3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-96fd-dfd72ae423d3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-97f4-3690674ee72b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-bce0-8362e179925e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-dcd9-a2e175fd28bd	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-8260-cd45631c6ccd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-d4cc-01a3b6375393	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-daec-7d1009196865	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-243e-49b635578ee2	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-8a6a-918376cc777c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-c9b1-a37506cb085e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-e9e2-b9251fb2006f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-c7ea-b8c17e517f42	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-be93-f4e4afa636d1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-69ff-f59684eee9c6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-8fda-26b2d2726e11	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-68dc-6fbee79c8cc8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-833d-1ecb940d4d5e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-63bf-79987adec4c1	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-eeec-3e3ea7304ffd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-a2b8-86c46be7b4bd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-8c6c-8f243b22fc36	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-1c19-c62ab62a9113	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-21c8-8c6801adf989	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-234d-ef12f950a22c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-b1bb-a7200582eb7c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-f242-afe68b093ef4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-3cad-4faea4174f15	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-5490-02dca49d6805	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-de9e-ae021d615e92	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-634f-333ec31e0c7a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-fa92-1d2975bb730a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-0348-cfb1da552fd5	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-d437-fcf20fc7a12e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-2289-3aeb20b97785	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-bf50-f616fbe23c0f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-cef3-b1cc13effc88	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-cb28-839619739c70	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-e35d-58fe84c40630	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-6a4a-0be946a05953	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-626a-6e3cc0203ffb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-ca5d-6c993a95e3cf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-74a4-a71264274981	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-3623-833b8f6f7832	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-de18-79d21cfaba20	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-6de1-386c18f97df4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-3042-76473c3d3908	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-1552-5b4e523d5a9d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-6e2e-9defb8e19973	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-b1f9-c266cef14d8f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-1a1e-af728f9c9051	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-1516-a105beff6f05	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-1132-2e9e1dc3e86c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-5dcf-f8c1fca777a8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-3355-6f03c4bbbb52	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-9c83-6abf2fe59072	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-5a09-35dd47884178	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-0ead-52f1360981ea	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-0ec5-6931e0220d34	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-e9a3-821c1da66e17	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-57d2-db69a66c5541	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-e3ec-b5fb94ad510a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-9cde-a5fe65a70161	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-3aef-139d3c813b4f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-e345-40db87417b9c	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-a7a2-8288d93468cd	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-ec70-1ec30ec75ab9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-2278-a5b88b5c526f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-0388-93eab0bc91ab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-038a-7dba10b4fdc4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-c737-ee8a08097c05	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-b424-19b75a444b80	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-63d6-d542b8ea1179	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-60ef-16c0581817c9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-80d0-68dbf1165794	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-abd3-21503381022a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-7b1c-1b87e883be67	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-e22b-b0d0bcd5455f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-67e8-c69f3aaae480	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-a8b6-45d6963c6a90	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-9297-9ac468f6f958	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-044a-572bb48e74db	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-5960-74d0fe9e4fae	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-9d31-b566cf9a3a9b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-1e6a-979d96ad9962	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-99bd-dd1a52baa63f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-b9e4-d89690055748	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-4629-1eae88cf3bd7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-2cc2-36484de77227	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-2873-10365febb993	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-84ae-c732487f5825	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-efca-78618cac4858	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-a50e-5d1bfb80d705	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-7466-0f195a0de8bb	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-d9b5-910380282d1f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-6cf0-aac1f31a9400	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-7e18-35da257c5673	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-fd42-1021d089d5c5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-a8ac-91e5e372f322	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-397f-0471f7745575	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-df3f-862b77245eac	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-60a2-1b5e6aa9537a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-7788-2097ba47cd20	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-d5df-9321c91b47fc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-7248-b898d9a38ae5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-cda3-5be750193f9c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-96ff-b594b013aa58	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-558d-cd4813eb691e	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-30ce-a16ecc36b82c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-8e1d-3d4521c1077d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-ed14-bf5179d50759	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-9e7d-74ea1f79faa9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-0c34-c36edd871afc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-3be0-244148807b09	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-6b00-a7fd9666de8a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-dd2d-39dfb9890c6c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-ba7e-2df7c8d4d524	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-65bf-4a7d0d60bf81	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-83cc-84ac470f4db7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-b001-e9f52a5f6e8c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-05bc-4c0ba39e75a9	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-0c78-fea704421c10	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-f065-71977048d110	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-2533-dcce9c0863d2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-a209-b39788de4ab7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-e50c-ac5955bc15e8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-5814-44c656c0bf4a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-20fc-7e75fc93bcae	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-11a1-755b036531bc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-2b8c-e74c507e6d3b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-2521-aece9c7d361d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-6b55-9835d87c1c02	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-e8ff-8fa021c1888a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-64a5-cb9ebe389f56	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-aa5e-ec3e4bf5627f	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-be8d-74260729c7a0	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-c0be-3255de21099b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-31b9-b1710aa1ae67	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-a8cc-c6897a20742f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-67d2-9090ced7aab2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-cfb4-2045327dcc32	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-a3e0-885f2b213406	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-9138-a126b2f2fb5c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-3e93-ca8ee93ea939	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-68c2-458c64a8fc80	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-e1e3-c23f6e0e52b5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-9eb1-0a1606e371a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-e6a0-6d658096caf3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-ebd1-8d860c3c66c1	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-0ada-2a959f817dfe	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-f8ea-3e02d6639541	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-f7ca-2a3110bc0edd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-51b1-9d8250804cba	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-78da-fff1a8b65303	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-113c-1fa3ca7e0ce5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-b418-9050bbb3bac1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-3677-77174ed9eca2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-f104-005303d4d459	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-a294-22c39ecbac47	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-991a-b042380ced22	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-f1d2-502ac0ab175e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-ed98-020d51ce9cdd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-6619-f869b6698ea5	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-0043-99f036f49213	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-1a06-488b72dbb4c2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-90df-985e0e1afe65	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-d124-1bcbeec409b5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-51d7-f80a1f13db85	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-0bfe-c96916e7199f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-44ce-ef2d12f405fc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-1212-a2dd621d2913	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-3115-0a6a619f6460	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-7840-e2fb8f8cc2d4	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-034d-651fc54e418e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-4a52-f1d670044d4b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-886c-10ac1ecf6e9a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-facb-65a801c55d7e	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-83db-bed70e87f851	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-8cd5-025558b2dda3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-57b0-672300c97771	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-72fe-7fe2ab50730e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-faec-be95a379b556	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-34e7-30cdc8a332d2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-2e98-9191b2febb5b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-0367-7645f72f82b0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-3256-4a20a98dedde	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-d4dc-d27a487f1b9a	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-6c75-6dd11d6fcc27	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-e8a6-aefd39550347	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-16f7-21089b3c92b9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-e35b-841e530d0eea	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-6e88-c658f00ae800	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-2835-58c7fb1d94eb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-00b3-de50736c1635	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-c147-4c9f5486744e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-585b-fd7ff69c6024	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-56f7-a79966536eb6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-13bb-6dab0ee96f96	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-156a-1ab389f3a2a1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-976e-4582bf8ab4be	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-f36f-63867a90aa7c	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-2352-9823c88a2f6a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-e2ea-342022ff0902	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-fde9-c1a57ca0f748	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-5551-91cede6b64b8	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-8344-d5e3ec7b6032	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-10f0-df1e04571b84	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-4f30-5ac8ed7424b3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-acbb-0c90fd5862a8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-d5d5-1fe49da1a60b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-26b3-e8baa736fe69	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-2be5-efe36c1e0176	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-ca90-fd4ea72d667c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-4731-894fa54ef682	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-dfbd-ee249d5d8834	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-90a7-4ad3bfe6d02f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-d1fe-d47acae6a649	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-fc43-e73ba1ae904c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-3fd7-5bbff9fe749c	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-a8b3-3f2b9eb0b22d	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-02f0-2b82fdff9eff	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-4520-1bd2ae15bd75	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-78e1-9aee5ed3e648	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-969b-9fbf7dfd82c0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-f808-623e99c7ee51	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-ee25-425fa5c793dd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-cd1e-bae8fbc0f4b0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-a6b4-25553a076b54	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-bef9-b4310064e3bd	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-18be-03daf9f78841	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-347d-dd18475a5d59	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-d056-cb1b156d6747	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-2214-7c63c58e507e	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-d366-4aff89a16548	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-8c79-95d5fc3d8e4c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-0604-b89bb1865ebf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-e0b6-975c56d548ca	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-6244-ba8dfc3cf7fa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-2948-c2203de0f2a4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-dea6-66e3e4f55d1e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-2ac1-e15d0966f526	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-322d-ad6853eb6a86	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-3f1d-8199e062317d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-879d-bf52030fb75e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-c136-99d4b1d79546	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-4662-0608f81cfa62	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-1860-2730374008e7	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-ad8b-bfeecf89b85b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-af5b-928d9833acae	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-52ff-b16b72775d71	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-2ce8-2b6a07e30f52	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-c6b0-12a9e35b1039	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-f126-cd5a108f3662	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-ecfe-9dbd7b07c37d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-c077-741db2375fe0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-6e3c-f6a6738de786	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-c532-8e7a375d54f4	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-8da1-1127849611cb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-fb70-115969a95e77	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-34c5-d8a88f36feec	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-3e9f-d613fe475f64	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-008a-9f7f5e9ce16b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-6ce2-4f97649021fa	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-99f8-4f97d2c9f0b1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-c24c-3410725d2073	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-5505-d1bb2c046824	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-1772-dd420cf043c5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-5b43-6b3e06d06f06	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-a271-293827de0c0c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-b809-2418b9e2c6d5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-2768-741f385f18ce	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-f248-4aef785e5a47	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-843b-9fe15c4d8c87	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-8d88-91c36664cc42	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-32d8-d045ac90209f	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-baae-6ad2e89b4b9e	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-3209-2b135fde2b3b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-d193-51a9bd650256	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-d362-f327d34a5dbc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-50c9-476dbab9c8bb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-ff27-da88d95c9da7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-333c-ef74e542be91	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-7596-a6dddd91a1f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-2417-2b10b9fa3304	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-00c0-541711c44128	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-3369-2c216504a994	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-10dc-ba6cd3e4fbe2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-c7ac-86745cff2b15	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-f2ba-7b9d68b8bec5	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-7755-218f73edbc32	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-95ec-ae07b0a75874	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-c514-3c8caa225ce6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-ddc0-3f62fbc7967e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-d843-04e0b856a7cf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-a2fa-84b997c0bcda	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-472b-e548895ed7fc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-273d-95cf6bfc7c69	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-9b80-18710371adc4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-2a4e-289fa2cc4087	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-61be-1edd8dafbd89	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-8ff1-d37fbdf17c95	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-c612-09f17818ce30	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-2e4c-dc7e23bb2a98	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-0dfc-8bd7bb64179b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-fbf7-34ea763c24d9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-1953-4441b6c4b95d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-294e-7e5166aab4d0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-befa-bfe9a3b098f4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-7480-a2e0e0fd4c1a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-ee46-a75a53de0d7b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-1d9c-b269ac1e82d4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-40ee-a7a228ebedda	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-74dc-973fe087518a	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-2643-be7ee6670212	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-c4f8-807431220596	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-4a9d-1b40ffb15a45	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-5eda-09512a42d263	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-a6ca-fbaa2ec514a2	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-7ffa-0d820a5209e4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-d3ed-4b3f67e194c2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-9fb6-93fbfd3c38e7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-c7f8-f9fc0e79cc03	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-a9f4-1dd2416f7832	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-1b0d-b12d28e3fd86	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-74a4-82291834acfc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-f94d-24ee184d16ea	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-14e3-5b320f808662	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-4cf5-d27e71dbbf3b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-0593-5a980df1a2e5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-3927-de56e87430ef	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-2e5f-842ad387372c	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-e6b2-1cb51031e100	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-6052-5e7d3e3c44ff	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-2aab-d0b67c291f0a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-9aa8-a285317d86ad	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-430b-86d8e503d7a3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-f694-c7d4b08ab433	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-5871-be8cdcbc00c8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-0e4a-ef27699ce739	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-7a27-059079dd5de0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-8ed6-6a7a1e69fd1f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-f632-1c9d5732e54d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-c60b-849080512be1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-5239-650fa11a1e1c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-65bf-1be137f72755	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-3267-3715562b7489	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-3da3-7b5b798a12dd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-4e3c-5631181c7c70	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-306a-63a4ac34a5c2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-81a6-74c564cf8be1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-f4fe-dd258ded4bc5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-2874-49ee697a9fc9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-6e6a-aaaa0b8ecbe3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-b1ea-0a2320c423cf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-b04d-7830cbe1c4b0	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-33a0-672a88ff6d3d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-7ed5-dbb293ea11fd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-12ee-283a93ebbf24	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-d2e8-7c20e56e9003	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-fc99-56d602ce76d9	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-575a-c219360dc75d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-6d65-ceb20cf3a433	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-b707-427e7615d7b8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-8427-41d4027bafdb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-b9b1-c19ce43d5159	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-3f74-c2ad47196218	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-ed33-fdcc060ebfaa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-49b1-fb066657ea59	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-15b5-0b8ee26483a8	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-ac2f-e9f1833f29ae	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-9bd4-1ea97bf2299f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-17f8-8a88e361d132	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-3e91-f28271df0286	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-791d-49206304ec5d	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-15e0-2f6c784e8cbe	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-bf0c-8b4a178752ae	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-1cef-bf93825142ee	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-d24d-5a5e835a4078	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-12dd-de6c5924e345	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-853d-a904cdca10b7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-563d-ee1f9f463acb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-b4f9-946925719d4f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-49c2-9e38c7235a8b	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-5dc3-03915be4771b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-88ed-dc005aafaaaa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-1e79-40f5a9071ed5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-abb5-64512f1dc9a5	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-61d0-4e41ed54e8bc	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-f79a-8a12b6cde941	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-a596-181906bc3896	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-2a66-db2189f9442c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-a59d-7b33ceb08a5b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-ea89-17fa236f862e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-41d1-2808f2d47440	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-0330-4a65c01e8057	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-7d37-b8c03aa6082c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-d1c0-bac30baf19fd	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-99b7-b577e6b04b64	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-ba5f-4cde1d15e9c4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-6165-c21b71239f92	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-c047-0b56b1b67198	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-bb77-e332f177bed4	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-c891-4ea27a3fd4f8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-0fb9-efdced6df8ab	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-1987-b1c60e719ce8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-e0bd-ccf871bd9731	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-3b43-d18f3e947333	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-62f1-9999e0cebc1c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-a8a9-3db257bfc83f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-cfdb-14d029906c3a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-3235-964b24e0c425	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-5763-4f0624bf58b8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-d595-32caedd9a0e9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-3973-ca4b07d8910d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-6d0e-fdbe0d0124c4	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-28ba-bbfb82a223fa	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-6134-674f9147b83f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-e376-a6cbf8172b64	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-bdb3-b549491df52e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-558c-91f0860afa08	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-408f-4243b4472952	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-6700-338de3900e03	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-ac5d-128bd75c7bb3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-9923-f8ac044b4708	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-0cf6-79499b8d77d5	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-0dab-390b31af3e10	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-5544-46c706c85236	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-cd20-623f3b70a529	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-4a5d-daee1ead44da	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-6525-a2ccf7c2e7a0	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-867d-ba342ce69b36	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-5a7a-937962e5d798	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-9d4f-73600b9336f8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-1b5a-69faa432099e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-fe82-2de3fd7f1229	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-5563-4e1b68cfc535	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-1b32-a994148d390e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-a4d8-bdae318d3bd0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-cbb3-453a2a90ac2e	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-bbf4-de43d022ac84	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-f3d2-7130bf67b00c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-eb8e-ab2aa6428da1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-5b12-890ceabebdfe	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-3c51-a2eccf0193ac	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-73f1-17ccd14e3e78	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-8edd-2425d66afa0d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-95ed-3eb7936f19d8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-ce81-7d6303b90252	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-b375-11c348650365	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-7a54-51b85b77c63b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-c3d6-ae1749a994f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-e18b-18c2f1926c9c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-ba88-2032acdfb355	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-1ae4-8b9ee3c2cb25	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-0df6-bce3870e20ea	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-2932-bc8dc13c0c2e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-eedc-0bb77e399b1d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-268c-f918543082d5	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-88c6-e547075f17e6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-b5eb-0cd3e36236e2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-6774-42281d9d85a5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-9141-10b43755d775	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-48b2-ea5cb1f17078	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-bf5b-4dc4751a563d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-1f2e-cc645e47f7ac	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-ba2a-0e2ca65c49a1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-ed24-3a057f2b98ce	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-9551-d73292757fe5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-5777-09f7094fcff8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-7851-efd4f8aa2079	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-1569-fabbe08ac5b5	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-8a0f-93e5f6105f00	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-0f1a-6fd9b9e77511	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-1642-2ca411418874	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-a5be-6a2632f20643	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-e031-36dd3789ed07	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-cbbb-35c4f7c57863	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-ac2c-947690c9e331	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-848d-1beae1ab984e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-e396-21537d35a69b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-4341-2ec900e59408	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-1ce1-4ef1b35abafd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-8d4e-9215026ff4c7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-7839-8ff2dda5b812	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-242f-c40fa5b00569	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-dbdd-d210e95b896c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-0855-8b91e10ef5f7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-406e-77711fc2cdb7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-8b2b-a0e4bb617ed4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-de91-643659aabd79	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-7849-5760bc575631	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-1a4a-f2cf35c21348	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-e089-94db9fb7aad7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-4c9f-1937b00788ad	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-d43d-2d300d11a836	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-108a-c022bccb8c80	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-fd65-2fc878303e49	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-9464-d144717acb8a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-e889-1cacf41f7e75	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-4111-69d1a138fabb	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-ea63-155d01111583	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-474d-ea10cbd2550d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-5e14-73fb35c51c59	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-fcbd-1ea6a7ebbe02	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-673a-6482f5b761a8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-afc3-1d1f70504671	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-be11-fea34da943a8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-5bde-64f81a0416a3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-8eb2-19ddd1444145	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-c9cd-9426a2e187ff	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-3318-061556cc4bed	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-59d7-efd0a7dbfa24	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-fc46-e2a80ca104f6	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-8262-b4fa8ae9c410	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-0aba-3ae3c4fa6ea2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-ab98-4d85a4ae280c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-934f-4d5df344e971	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-ce58-6626f3163c96	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-2df3-9a0f807c424f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-0f72-94c5991efa34	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-5d46-b0c4a3f9af73	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-77a7-2071462fc672	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-eed9-f570bea22d96	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-abaf-b408d15c35d7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-bfee-f59725821ccd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-a1e8-727e8829cf42	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-5a94-a85538135962	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-6e16-d368c19731ea	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-6358-165e34327888	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-e17a-051873277c1b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-48cf-a983f857711f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-adb1-14086bdbc139	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-99ef-e764f8721e0a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-8985-8a955631fd94	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-b429-6aab5bd6e207	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-ad90-769eff67dd0c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-c690-d018f975311c	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-7849-6f1b46a3bd52	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-789f-f813040d84ac	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-9558-f37c447d9fa5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-a2a8-a4e66a697117	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-2016-070ba8497ae1	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-f59e-8a0c7b368bbd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-d426-9c6229fafc4c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-caed-a74e26421ca4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-39da-b1a60c2baa93	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-373e-e828b1c562f3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-274b-ae734a9197dd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-98b0-b286f5f7ec40	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-ec70-5eb142988282	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-553e-d601601bd08a	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-29ad-f6e283db5a7b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-f1c3-dc9604197f7d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-0aff-dbd600068eca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-e04b-875550b2ad1a	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-7fbd-2f753fb53f43	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-01d0-948a66243dd1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-95eb-9b89e924513c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-045d-df7160fef47c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-ef11-d101447dcebc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-e76a-ff855793b0c8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-7e17-7ec998948d07	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-3197-1d54248d5b88	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-a13a-4be75fbaff14	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-9e2e-faf81e699c64	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-404b-9f36c4192380	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-7314-bfcbcef356f7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-ade8-41051a3f7d0a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-401e-6efd63635a0d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-3c40-12bb8ae657c0	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-02bd-49fa1c23da91	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-bea7-5e12520c78f8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-1a3e-ff3917aa35c1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-62e0-6b858c398127	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-0eaf-1967c46e1b4a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-8f8e-57c6b2eabd0b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-0af0-3d50eedd051c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-9e92-606e190c7b21	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-f9e6-64e2e86492ac	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-59c0-94ab01c10975	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-02cc-65fbe64fcaf5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-1fd9-7fa35c787c0a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-88fe-2b7d117c5c36	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-b04f-2d2d7f35acb4	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-c56b-57f8a21d86eb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-5f74-8715d7f77606	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-2854-604208e9d302	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-679c-0ddb31aadf19	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-f354-c070fd24ebc1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-be03-04b7a7840233	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-42cb-17d6fc01e7f4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-a09f-d61eb7d6ad4d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-d97e-c39c422ea9f6	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-26f3-8004b0d4fa5b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-6ffd-273fb662ef05	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-6420-9869b2982b61	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-e325-ecba93bbbdee	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-5d3a-0c62dd1a6e4c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-d797-3bccf9d6b113	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-f727-768c3a6b34da	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-f821-785bd9a3e167	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-72a5-f658e19d9e42	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-210b-2c9124c80407	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-e588-11231e68fdab	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-b4f2-af2ea37452c5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-f2bf-77da57b727f3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-4c9b-f6107b912eed	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-3c56-0f0fc89447e7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-57d9-2c4a8b955b7d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-42f7-ba1912eaa42b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-6754-0aec9673ca7c	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-a798-0df0fb215c8b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-9c7f-8f27ccab31a0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-0999-9728cadfd0d8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-164c-70d290eef2ae	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-1a2e-e76cb4973d52	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-888e-277ab6ce7a45	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-9793-2e998e5fef8e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-47ec-fead37a64e6e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-0818-bc84d8a101c2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-ba3c-e7651fa02621	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-9d09-4cb0a243bbcb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-a61e-c9305aa4a94a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-adca-5d3830af8c22	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-4a48-bd662b2c5b05	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-fb93-d0f8d0d2ccb7	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-820f-4ae05d3d0e40	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-0280-3595fa9662f7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-3a9b-dfe4c8654721	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-2d4a-32997b2fabfc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-b302-4487991177ea	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-7ede-1ef11afea988	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-a121-9d869c1d82fd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-7fde-ad575bf8f50d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-fc86-417fcab0ca76	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-e5dc-4a381f6961b7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-4615-ac62f567d210	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-e7fd-60388bc61e01	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-2ed6-0aa028baea6e	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-c5cf-d1e835ef3956	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-642f-8fb509e1b60f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-c8f2-801f5189f8ad	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-2e20-9bd230c5a4b4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-1c5d-a17761afa90c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-7299-035542db62e1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-d2b0-c9c2f634a335	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-2b20-c86ac6ba885c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-c56e-1a125d638bc9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-47d7-b5b7d87cd8d0	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-f779-e8e535f6db3f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-8fea-d3254524ecf8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-99e2-81cffc1a7e87	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-d20c-71f3c4a9d6db	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-9fe0-2af767860f9a	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-9de2-2e73c67ed21d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-90cd-0de069f8259d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-bfe8-f1982a2f4dde	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-d240-285243aee8e2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-8771-df2bdc7db0a0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-0378-7dc04ad6fab5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-4633-6cf444eb01f8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-76b7-6ee9cd401127	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-f61c-7a226de89109	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-818a-8600b1241137	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-de86-18d4f3a8f1a6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-8d19-a2b23a2de90b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-c19a-a8b764da5493	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-00ae-04c15ae0c7dd	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-a075-5d1d38b0a3b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-7e3f-6585d77d4f8a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-6ea1-62ad54f76d48	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-a214-5fb805fd15ea	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-b7a4-e33acf8f3c13	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-179b-7fe7d1faddc4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-30ad-ca5134e045bd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-1482-506dc89bea98	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-4510-917169105aa4	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-b442-2ecac74c19ca	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-f96b-ecf73e344bc4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-91c3-bc0e4f655718	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-d477-c251895e1888	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-5f3a-12a0d411904b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-7c6c-5546186d5e44	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-0407-fd3c88df9614	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-f460-7a965bdcd22f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-0399-e17cf327c59b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-12b1-3389dcefff05	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-edd1-c0839805640f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-5999-b79b50d00c1d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-8385-169121658a93	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-9a95-34a1a85e241e	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-e416-b9cb3b42649a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-7455-463d6c3f7a11	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-4b84-954720e09c4e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-c140-41e208bba6bb	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-90ce-82e4b8df9ef1	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-c231-b94760e909e2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-bda6-450acc8625c0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-f583-8ebf0daf9fc3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-3729-10d18aa31761	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-29db-863e6b3fa365	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-88d1-c2d77dfcf030	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-2451-9079324c481e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-278d-2b068caa8453	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-0a78-5c8af6bbadff	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-b649-d18fccf7c1d9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-222a-726ed268d1fa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-ec15-ca32eff7bb58	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-cc5f-649a487a14e1	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-fa32-88e345191ddc	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-bb22-4324cd2b9116	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-e7da-953c133c33f1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-911d-c918475847fb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-4028-3c109ac854a0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-e462-c18e96c1a287	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-b874-7efc1f318d41	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-16ec-b04e1eaa6af1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-581e-137c812ffe67	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-f7ee-2b282ef9da41	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-19b3-cb7995b516c5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-c644-31fe99b637b6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-8c6f-9e41689a9c4f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-2431-3d71f45fce13	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-103f-e7a0415af87d	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-8b11-10badf125874	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-0356-8de034960683	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-279b-005eb2f7577d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-f2e4-e600d8ae8648	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-df57-bead4f776694	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-58d7-8baba08bc368	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-67e9-06063babc020	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-3e5b-11ce002043f7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-21ba-7e738f6506ed	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-67af-918525144f3d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-1236-0bee5e05b90e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-be1e-5cc2811d6f42	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-4e86-8ebe957247fa	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-e5b5-06e39f23fae0	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-b2bc-023c4af431e3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-6300-1ba5a502c926	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-7efc-e901292c4222	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-3aa2-485d712fc64c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-700e-b3c5a9ace437	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-22aa-d260c3c4d7d7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-63a9-c0bd1cbab47b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-3a07-1dc8733da748	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-b794-b61c15c932c8	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-9c41-8e966b0981a4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-ecd0-cbae804ae232	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-8ad1-3d5b0c6d0f89	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-0cee-a0843f9bfd6d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-76f3-1e9e6ce1ae1a	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-0238-86e6990aff05	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-5a84-71e65a57cb76	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-abb8-1da1f216395f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-1c5c-e4f5f7eaf740	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-53ea-e7445464ea92	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-b50d-a2e472702d9d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-4f07-3ddd5d6c6208	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-84d5-0b474fdc2869	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-2b4d-56ca5e8ad10f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-aae7-0e22b9c0c40f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-1f3c-07afaa7b7f2a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-fe1d-fea942ea4fca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-975e-a90f3e685e73	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-cc6d-6f2ca0c644c6	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-5c7d-99384a5e2f07	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-34e6-2d5b58da6c9a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-4ed4-ed40ca4d3243	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-e1ec-1eaf931b5502	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-7150-ce3a7ae19408	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-c15a-f911f8dd735e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-e955-c9535cc75cc7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-6595-4814507d42b3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-7453-1ebfb0a9a827	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-636a-dffba6f11be7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-4313-6ae5ef6208f5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-977c-6c2301438a44	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-eba5-cb3263e49d83	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-0ec5-2a5f407aa524	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-e9ce-03dc88e5b886	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-5583-63a1c374e924	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-8c21-3d80ceddedde	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-b162-ed000aee12ba	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-acbc-0df5ee47ec48	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-977a-b2ea36d490c7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-4426-7a32087e8d16	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-8af0-ad952ef992d1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-5aa2-ae9d7d434ef1	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-2b1a-eb4c2860e215	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-a237-b1556c223324	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-a9a2-2600d25c0b6f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-78d7-c5fd0bdc2e28	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-b5e2-7cd746b5eda9	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-b465-b1aa6a0515e3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-44f4-8e29a482e7cf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-772b-83da64c84585	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-113d-f3dd68ba21ac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-ffe0-1d8252b90fd2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-997c-a31d0350a119	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-71e3-ca16bfbd6920	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-1ee8-e1bc851b4397	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-1e56-25c41d5e23a2	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-48e5-a4a3d4119cf1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-5143-166cc3be3255	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-410b-a90577ffdcff	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-2dbe-a37b577eb811	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-b986-d63b5d4f06d6	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-90d8-52adc0ecc6ae	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-461e-39b2078563f5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-8496-3ad24574c71f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-e8f0-ac21571c914d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-5903-f7d62a171685	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-3491-61ce0fb98321	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-73df-f6850a28f513	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-e536-65e2197e85ed	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-2e8a-cb6d2a64c3b4	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-71c1-aa86fbe5e02b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-2924-d0656b14713c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-6a1e-929ebd763d70	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-5e1d-70574a9aadd3	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-0804-9db2a03a87db	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-3380-efdc0f3483a8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-03c1-deec8d7d9942	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-5d8c-f2d9efa85125	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-c518-49a4b0fb257b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-bf60-c12d7e64b46b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-4973-efcf36066747	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-95f0-213e83a577bb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-c591-8f97ca60126c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-603a-0c71410b9d0f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-4009-0992b4a7d2a4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-c92d-110c86722e8d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-219e-8006903df06e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-179f-9103b58d8a9a	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-1744-2468befd235a	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-448a-6f1bcbd651ba	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-4559-86859fb645a3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-8eaf-2c1a82a8fbc0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-d296-6a28e9f2f39c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-4b7b-3683cca9038c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-8689-2fefc40f424e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-2864-99b7cecbe694	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-89ee-a3cc66656be7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-1a7b-268f3f300501	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-68bf-920ee465d579	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-cbc3-5eac3ac53de1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-8a34-a668782cc9a8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-054e-8854a03ebf30	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-580f-74acf3c9f49d	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-1ac9-95d0feaeaa86	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-7493-19e9a286c7c1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-877f-c47cdce9b5b3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-2c64-31e7c2109533	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-6c5e-15cc45768bb3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-83f4-0598b0236010	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-0c50-e1589a4a8792	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-a8f3-e60811d9b56a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-bd81-8a9a734bed94	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-0c2b-9e1034faf42f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-ece8-bb44114d26af	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-86d3-144cdc16db62	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-ad42-a67683110a6d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-5a27-63d6a2a6378c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-8db8-8edbb2b8a48e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-faeb-86a154a85edf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-cd21-af1013e3b458	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-298d-125bcaf9da48	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-318b-1573ba756b01	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-62d2-67a54b50c485	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-b773-c456b96f3951	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-3296-b97ccb32498f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-e8a3-cec0197281c5	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-eab2-86d22783a043	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-86a2-eb790a5ca23e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-ef67-38642af2dfae	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-e246-d4797526473b	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-8a93-ae33aab06504	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-62d9-c6476adce75c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-a1ed-427c2d36eb02	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-8299-2750d11f5285	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-964f-05c3ee73a192	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-f7b2-a78beb46f3d9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-7d42-ffa11170153a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-6639-c8082f55c410	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-3360-df23f38252ab	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-2fe9-5ce32e876b78	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-26e7-e50975b13c0b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-a4bd-711b3f9a7b61	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-9256-91097abb2858	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-2348-4a15dae296f0	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-5626-f27e86f3a967	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-f3ba-67bb39c6fe01	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-659e-9b4916543380	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-96f6-b47285f212ff	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-4c33-793d0239335c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-c0d8-77e83221f5fd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-094f-a1a4117479c9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-b9c6-b3524608887a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-80ec-84ecebe4a021	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-5197-d613df61c58d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-9f0a-86d5c6ffc81b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-f811-f9a8b573f7d4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-8f34-c12d31f40a4c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-d6b4-97798b726309	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-25e5-174d8f6611cd	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-bd4d-720745bcaf18	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-10c6-5347d5166a23	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-9d2e-d3df43b44150	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-d9b1-6ead80639e96	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-0dcd-7ee713ec6b11	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-3bab-93f7fdb470c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-cda9-22512715afda	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-4065-53de8d2e8513	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-0fc3-333116e53cc9	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-75fe-6dfbc8e3535f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-af04-a7c83005bf8a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-9b0b-f4f540c68590	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-d5c6-bef7fe064139	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-839a-6f9890290cf9	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-75b6-99dc30332870	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-f7df-83050402f001	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-850d-750ac524c0e3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-bde9-72d9a82abfb0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-78e2-86ce40866d42	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-1378-c4cb95199fd5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-f3a3-896c5b2534bd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-b808-aae53e6a2293	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-ee94-f48962bf11b5	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-68d7-e01a71180c35	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-d91a-9c057a90ed3c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-dde8-e06a23a4bb28	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-5a52-516fa2a5bb27	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-38aa-7752d0d12986	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-6c31-4c6ac24adc73	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-f3a6-de09de5be904	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-01ff-b1c9c6d6c139	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-b91e-20fe6e852e8b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-26fe-7529d6f825c5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-7f32-7f137d535dff	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-a43d-6cd5d25a09be	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-7a24-74b4a72a4dcf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-7383-8c749c743b1d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-5c45-19621a75f403	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-344a-5b2992b696b2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-ed9b-eb88a4ad9e72	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-f4b0-77d25ff40e96	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-ada4-78aed0795b6c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-865d-8f912e0426f7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-1fff-2530123b1c9d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-1807-37c3decf8fdf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-8c2a-83b939f610e1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-c241-0c5592789825	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-d0c8-ae1443f8b587	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-2743-21ff9d92f76b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-5928-4470930f33ad	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-a18e-c5ff-c60d11338cd6	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-a18e-f86f-c93e409b7a37	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-a18e-3ffa-a9b783c208fe	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-a18e-3d9d-0a4e1e26702c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-a18e-1e04-3577d9294513	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-a18e-8cbc-1925183ca3ca	Role-read	Aaa - Vloga - Beri	f
00020000-5536-a18e-dae5-dc607f8eff72	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-a18e-df4a-818cc417f0a9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-a18e-7fa2-0517c67c15e4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-a18e-6d67-691c08ec0764	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-a18e-292d-0e2474918661	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-a18e-2004-491ddaedad26	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-a18e-574e-fc3ff2940ed8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-a18e-efdd-6a70da14cf4a	Drzava-read	Seznam držav	f
00020000-5536-a18e-5f01-36402c129311	Drzava-write	Urejanje držav	f
00020000-5536-a18e-ceef-6ae344990e68	Popa-delete	Poslovni partner - Briši	f
00020000-5536-a18e-29ba-33ab13686c48	Popa-list	Poslovni partner - Beri	f
00020000-5536-a18e-b2b9-38fccd53aed4	Popa-update	Poslovni partner - Posodobi	f
00020000-5536-a18e-8aee-5bbddf8965af	Popa-create	Poslovni partner - Ustvari	f
00020000-5536-a18e-d536-a29bbd0439ec	Posta-delete	Pošta - Briši	f
00020000-5536-a18e-9f36-12a48b27858b	Posta-list	Pošta - Beri	f
00020000-5536-a18e-1336-ea2523ee2558	Posta-update	Pošta - Posodobi	f
00020000-5536-a18e-7e3b-993436109163	Posta-create	Pošta - Ustvari	f
00020000-5536-a18e-c4af-6680d0269abe	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5536-a18e-81be-2a374fde8b1c	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5536-a18e-587d-541c65fed7a1	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5536-a18e-ccd0-9449448a3f38	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2626 (class 0 OID 692622)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5536-a18f-e662-cd8ca14dd5fe	00020000-5536-a18e-efdd-6a70da14cf4a
00000000-5536-a18f-e662-cd8ca14dd5fe	00020000-5536-a18e-16af-babddadd165f
00000000-5536-a18f-3948-03740f583896	00020000-5536-a18e-5f01-36402c129311
00000000-5536-a18f-3948-03740f583896	00020000-5536-a18e-efdd-6a70da14cf4a
\.


--
-- TOC entry 2654 (class 0 OID 692901)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 692931)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 693043)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 692676)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 692715)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5536-a18d-b8db-daba271bc687	8341	Adlešiči
00050000-5536-a18d-6f2d-a04f76839e25	5270	Ajdovščina
00050000-5536-a18d-65ac-9737a031219e	6280	Ankaran/Ancarano
00050000-5536-a18d-e253-d1e3e0e7fe5a	9253	Apače
00050000-5536-a18d-627f-124b592196a3	8253	Artiče
00050000-5536-a18d-8928-7ce305d2c196	4275	Begunje na Gorenjskem
00050000-5536-a18d-7288-fa1e261394f0	1382	Begunje pri Cerknici
00050000-5536-a18d-ea45-6fc105ca4abe	9231	Beltinci
00050000-5536-a18d-3243-9466c9ebf47e	2234	Benedikt
00050000-5536-a18d-b15b-2d14d533f3d3	2345	Bistrica ob Dravi
00050000-5536-a18d-93ee-569ce546f49c	3256	Bistrica ob Sotli
00050000-5536-a18d-13b3-c06f4dca51f6	8259	Bizeljsko
00050000-5536-a18d-a3f5-047e9a30b05c	1223	Blagovica
00050000-5536-a18d-afd9-c9a53ea43fe3	8283	Blanca
00050000-5536-a18d-2e95-06441d66c734	4260	Bled
00050000-5536-a18d-91d8-532c929854a1	4273	Blejska Dobrava
00050000-5536-a18d-90e1-5cc73ea48bbb	9265	Bodonci
00050000-5536-a18d-94e3-0d88acd78a6c	9222	Bogojina
00050000-5536-a18d-7fd8-82506c9ade24	4263	Bohinjska Bela
00050000-5536-a18d-01a7-ee20c6c570fc	4264	Bohinjska Bistrica
00050000-5536-a18d-cf52-dc2f6142472a	4265	Bohinjsko jezero
00050000-5536-a18d-a82a-81bee49d4dbc	1353	Borovnica
00050000-5536-a18d-a9a1-9b5fe841b772	8294	Boštanj
00050000-5536-a18d-58f1-298aed1660b6	5230	Bovec
00050000-5536-a18d-c735-db36b32d150b	5295	Branik
00050000-5536-a18d-cbac-55f5aeec9dbc	3314	Braslovče
00050000-5536-a18d-2269-6a237cad11fd	5223	Breginj
00050000-5536-a18d-029e-295b7287cd31	8280	Brestanica
00050000-5536-a18d-ade1-14bd861e8379	2354	Bresternica
00050000-5536-a18d-1f29-664411c6c8f1	4243	Brezje
00050000-5536-a18d-e514-93612c391b69	1351	Brezovica pri Ljubljani
00050000-5536-a18d-1f4f-3116aacae204	8250	Brežice
00050000-5536-a18d-1353-0123a49abbdb	4210	Brnik - Aerodrom
00050000-5536-a18d-4dfb-d5665a7c05f3	8321	Brusnice
00050000-5536-a18d-cbdd-31a9c71c495d	3255	Buče
00050000-5536-a18d-8287-f5310dbb366c	8276	Bučka 
00050000-5536-a18d-6c1d-0fe1afe26124	9261	Cankova
00050000-5536-a18d-b611-59042d5c9dae	3000	Celje 
00050000-5536-a18d-f4b6-1db1480c1a84	3001	Celje - poštni predali
00050000-5536-a18d-841c-144a2ff13392	4207	Cerklje na Gorenjskem
00050000-5536-a18d-19c4-50cc233218c3	8263	Cerklje ob Krki
00050000-5536-a18d-61d8-9a49af63e668	1380	Cerknica
00050000-5536-a18d-2da1-a5dd8b56fcfd	5282	Cerkno
00050000-5536-a18d-6406-6c15a5670433	2236	Cerkvenjak
00050000-5536-a18d-31d9-632663441db1	2215	Ceršak
00050000-5536-a18d-377a-30c33a2e41e2	2326	Cirkovce
00050000-5536-a18d-0de1-2adf563cf705	2282	Cirkulane
00050000-5536-a18d-8bdb-75d0cdd7f25c	5273	Col
00050000-5536-a18d-5d70-d5aad5a6a30c	8251	Čatež ob Savi
00050000-5536-a18d-315d-f638f2af00dd	1413	Čemšenik
00050000-5536-a18d-c9b2-142bb46c9277	5253	Čepovan
00050000-5536-a18d-6482-33d6a2a1af4d	9232	Črenšovci
00050000-5536-a18d-c512-2337b16d84b6	2393	Črna na Koroškem
00050000-5536-a18d-42ab-680c1e156d33	6275	Črni Kal
00050000-5536-a18d-ab6c-12c49cb0e95e	5274	Črni Vrh nad Idrijo
00050000-5536-a18d-6bda-3e6ea41c5b59	5262	Črniče
00050000-5536-a18d-965f-901063348dd5	8340	Črnomelj
00050000-5536-a18d-edcf-0ac26c2011c9	6271	Dekani
00050000-5536-a18d-0861-1beb255001da	5210	Deskle
00050000-5536-a18d-85c2-cfaf84aaf4db	2253	Destrnik
00050000-5536-a18d-4225-999d929b49f3	6215	Divača
00050000-5536-a18d-011b-777159664f7c	1233	Dob
00050000-5536-a18d-3402-d5c7f9fd17bc	3224	Dobje pri Planini
00050000-5536-a18d-47d8-96fc8079220d	8257	Dobova
00050000-5536-a18d-f49d-5fc43bfa7696	1423	Dobovec
00050000-5536-a18d-2720-b53456587e05	5263	Dobravlje
00050000-5536-a18d-367a-f7310be2b1d0	3204	Dobrna
00050000-5536-a18d-8fb2-fe4676efa2d7	8211	Dobrnič
00050000-5536-a18d-d25f-b67a2362c0da	1356	Dobrova
00050000-5536-a18d-35c3-cb44382725d3	9223	Dobrovnik/Dobronak 
00050000-5536-a18d-50d0-11f6cdceadc7	5212	Dobrovo v Brdih
00050000-5536-a18d-f159-9fd110c6e4a8	1431	Dol pri Hrastniku
00050000-5536-a18d-dc14-4f50b4edb66d	1262	Dol pri Ljubljani
00050000-5536-a18d-fbbb-c73090d50e23	1273	Dole pri Litiji
00050000-5536-a18d-0ea1-1791f1e35788	1331	Dolenja vas
00050000-5536-a18d-89e8-8e66d2eab835	8350	Dolenjske Toplice
00050000-5536-a18d-344e-8c4f2c3a8a70	1230	Domžale
00050000-5536-a18d-792e-ec36e0ff89ce	2252	Dornava
00050000-5536-a18d-8c75-5d15a6b18da4	5294	Dornberk
00050000-5536-a18d-5998-653802044cfb	1319	Draga
00050000-5536-a18d-8331-4c2c23094db5	8343	Dragatuš
00050000-5536-a18d-e44b-f21deac79103	3222	Dramlje
00050000-5536-a18d-1196-53e280644923	2370	Dravograd
00050000-5536-a18d-f0c7-dac5717c1e75	4203	Duplje
00050000-5536-a18d-20d5-fcf9bc44df9b	6221	Dutovlje
00050000-5536-a18d-75e5-f70805c678c5	8361	Dvor
00050000-5536-a18d-4e75-af89cd332309	2343	Fala
00050000-5536-a18d-77a9-35724d8df2a7	9208	Fokovci
00050000-5536-a18d-ec55-949b1693bf9c	2313	Fram
00050000-5536-a18d-b6e7-ad47d4b21164	3213	Frankolovo
00050000-5536-a18d-8d06-c46bb429dd2b	1274	Gabrovka
00050000-5536-a18d-71f2-37ff48fdb222	8254	Globoko
00050000-5536-a18d-ed49-11e635b79081	5275	Godovič
00050000-5536-a18d-2391-8a8b3444407d	4204	Golnik
00050000-5536-a18d-13c1-ac5d698f1480	3303	Gomilsko
00050000-5536-a18d-da45-50da9514fa40	4224	Gorenja vas
00050000-5536-a18d-a68f-877a3e88b80c	3263	Gorica pri Slivnici
00050000-5536-a18d-7334-1c9b000e2946	2272	Gorišnica
00050000-5536-a18d-9f62-4d1efda8b282	9250	Gornja Radgona
00050000-5536-a18d-cd35-645734cb94e9	3342	Gornji Grad
00050000-5536-a18d-ee16-7996410fe37c	4282	Gozd Martuljek
00050000-5536-a18d-1040-911487cfdca8	6272	Gračišče
00050000-5536-a18d-4526-021ffb034ef2	9264	Grad
00050000-5536-a18d-3e63-2083331cf7ec	8332	Gradac
00050000-5536-a18d-fa4f-29bcd57396b9	1384	Grahovo
00050000-5536-a18d-f625-f8eba083673d	5242	Grahovo ob Bači
00050000-5536-a18d-52ee-885459dbf256	5251	Grgar
00050000-5536-a18d-1ce9-57e644eedddd	3302	Griže
00050000-5536-a18d-ab4c-8de24d0d97a5	3231	Grobelno
00050000-5536-a18d-4a5d-97de1a9e1e01	1290	Grosuplje
00050000-5536-a18d-9cd1-35daafe29ad2	2288	Hajdina
00050000-5536-a18d-060d-984e1f9339e7	8362	Hinje
00050000-5536-a18d-c70c-385635eaa5b1	2311	Hoče
00050000-5536-a18d-7cb8-99d85b2cc95e	9205	Hodoš/Hodos
00050000-5536-a18d-506e-0af3122f18e6	1354	Horjul
00050000-5536-a18d-8786-9b0cfd82594e	1372	Hotedršica
00050000-5536-a18d-6bfd-90cc0c01c214	1430	Hrastnik
00050000-5536-a18d-8c03-7ae032123ff0	6225	Hruševje
00050000-5536-a18d-83cd-388ca4ab2c33	4276	Hrušica
00050000-5536-a18d-7b62-c6af2bd424b5	5280	Idrija
00050000-5536-a18d-2f78-52c7e009428c	1292	Ig
00050000-5536-a18d-c852-a758fbc5eec4	6250	Ilirska Bistrica
00050000-5536-a18d-841b-0d4d74911958	6251	Ilirska Bistrica-Trnovo
00050000-5536-a18d-196a-be0bd646971b	1295	Ivančna Gorica
00050000-5536-a18d-33c3-923d1c36d20b	2259	Ivanjkovci
00050000-5536-a18d-83c1-432cb666398c	1411	Izlake
00050000-5536-a18d-96a9-b779f94af4c9	6310	Izola/Isola
00050000-5536-a18d-6e9a-32ba76144f61	2222	Jakobski Dol
00050000-5536-a18d-933d-1a0dc07e4b9c	2221	Jarenina
00050000-5536-a18d-9fb3-1b53b1be722e	6254	Jelšane
00050000-5536-a18d-4475-7395d749efed	4270	Jesenice
00050000-5536-a18d-af6a-42977adb4555	8261	Jesenice na Dolenjskem
00050000-5536-a18d-0a2e-bf5ea20258e1	3273	Jurklošter
00050000-5536-a18d-b691-c257720efbfa	2223	Jurovski Dol
00050000-5536-a18d-0d82-5adae21a7cce	2256	Juršinci
00050000-5536-a18d-3235-bf34e6c16f3b	5214	Kal nad Kanalom
00050000-5536-a18d-0d03-930f363cb5be	3233	Kalobje
00050000-5536-a18d-3e8b-77e278d640e1	4246	Kamna Gorica
00050000-5536-a18d-dc9f-def949f9d232	2351	Kamnica
00050000-5536-a18d-f404-3d3b8c0f2480	1241	Kamnik
00050000-5536-a18d-f3e1-6c2ace6feeb3	5213	Kanal
00050000-5536-a18d-7ca3-19ece00091b2	8258	Kapele
00050000-5536-a18d-ba7c-1abf2975583e	2362	Kapla
00050000-5536-a18d-04d9-ae9b50ea46e2	2325	Kidričevo
00050000-5536-a18d-189f-8c8ac8970aeb	1412	Kisovec
00050000-5536-a18d-eccd-3f1deeccbd8d	6253	Knežak
00050000-5536-a18d-5f51-315d6213ceaa	5222	Kobarid
00050000-5536-a18d-0725-be8f114e5f12	9227	Kobilje
00050000-5536-a18d-7bbb-f52cb71ef533	1330	Kočevje
00050000-5536-a18d-00ce-fe58241a481f	1338	Kočevska Reka
00050000-5536-a18d-1b2c-6e14ae9d020c	2276	Kog
00050000-5536-a18d-f9f6-3b0cb8a477b6	5211	Kojsko
00050000-5536-a18d-ea67-9b67f9fc9dc4	6223	Komen
00050000-5536-a18d-2e92-ea0b89fd1d0b	1218	Komenda
00050000-5536-a18d-9e74-62045f18a265	6000	Koper/Capodistria 
00050000-5536-a18d-2cb6-61f10489a4fc	6001	Koper/Capodistria - poštni predali
00050000-5536-a18d-17dd-47e723bb7894	8282	Koprivnica
00050000-5536-a18d-b10d-b40b2ea83751	5296	Kostanjevica na Krasu
00050000-5536-a18d-ea2d-f315128dd755	8311	Kostanjevica na Krki
00050000-5536-a18d-7073-286ff24d3c44	1336	Kostel
00050000-5536-a18d-1cc4-842a2b89d7d7	6256	Košana
00050000-5536-a18d-4e98-ab2282c3780d	2394	Kotlje
00050000-5536-a18d-5faa-42ed31a56541	6240	Kozina
00050000-5536-a18d-b3ad-6e182d8d62c8	3260	Kozje
00050000-5536-a18d-6e71-3ab8324ca26c	4000	Kranj 
00050000-5536-a18d-31dd-6b0a7444dd23	4001	Kranj - poštni predali
00050000-5536-a18d-6755-3216a9d72ff8	4280	Kranjska Gora
00050000-5536-a18d-5d28-e83750830d8e	1281	Kresnice
00050000-5536-a18d-d3ff-6395097c1d45	4294	Križe
00050000-5536-a18d-4c57-51536b3178ce	9206	Križevci
00050000-5536-a18d-9eef-7887bab1993b	9242	Križevci pri Ljutomeru
00050000-5536-a18d-d693-962d17b25be6	1301	Krka
00050000-5536-a18d-ab01-ad3df72e56f3	8296	Krmelj
00050000-5536-a18d-f3f3-b7a644c6851a	4245	Kropa
00050000-5536-a18d-4406-133a7f789ab7	8262	Krška vas
00050000-5536-a18d-547d-f0ef904d74cf	8270	Krško
00050000-5536-a18d-2efb-2240cfde1f08	9263	Kuzma
00050000-5536-a18d-946e-3058776c3dc4	2318	Laporje
00050000-5536-a18d-80dc-d6049ff0ac32	3270	Laško
00050000-5536-a18d-6e51-09e9bc06a27d	1219	Laze v Tuhinju
00050000-5536-a18d-5b02-ee9e5d4af6be	2230	Lenart v Slovenskih goricah
00050000-5536-a18d-b016-da3000e6931e	9220	Lendava/Lendva
00050000-5536-a18d-6ddb-bd60d815c7a9	4248	Lesce
00050000-5536-a18d-a006-cc93f44898cb	3261	Lesično
00050000-5536-a18d-af76-7f12045c2b2d	8273	Leskovec pri Krškem
00050000-5536-a18d-6642-59268c37330a	2372	Libeliče
00050000-5536-a18d-5a45-fc7c51bab83c	2341	Limbuš
00050000-5536-a18d-74dc-2e054e2f75fb	1270	Litija
00050000-5536-a18d-3a86-cbeaba8b0c6f	3202	Ljubečna
00050000-5536-a18d-b42e-5e150c036d4b	1000	Ljubljana 
00050000-5536-a18d-cd61-805d2edcfd7e	1001	Ljubljana - poštni predali
00050000-5536-a18d-6967-98ae46b047d9	1231	Ljubljana - Črnuče
00050000-5536-a18d-969a-4f90fede5643	1261	Ljubljana - Dobrunje
00050000-5536-a18d-12c0-624f42a9bd10	1260	Ljubljana - Polje
00050000-5536-a18d-8047-f66f46c5cca8	1210	Ljubljana - Šentvid
00050000-5536-a18d-3fc9-def595449560	1211	Ljubljana - Šmartno
00050000-5536-a18d-6c44-a2484bbb651f	3333	Ljubno ob Savinji
00050000-5536-a18d-24de-432ab86b3abb	9240	Ljutomer
00050000-5536-a18d-daf9-64402a784eba	3215	Loče
00050000-5536-a18d-fcdc-b161f00d9783	5231	Log pod Mangartom
00050000-5536-a18d-ed74-d24b6154218f	1358	Log pri Brezovici
00050000-5536-a18d-1e12-26bf4bab3e4d	1370	Logatec
00050000-5536-a18d-9985-c5a5c397f408	1371	Logatec
00050000-5536-a18d-ccbc-d6d383aa1c80	1434	Loka pri Zidanem Mostu
00050000-5536-a18d-6e05-cf8dd88c1e63	3223	Loka pri Žusmu
00050000-5536-a18d-a6d3-d910496d8767	6219	Lokev
00050000-5536-a18d-4ba3-e09f48714e06	1318	Loški Potok
00050000-5536-a18d-eeb1-5eac10e2f073	2324	Lovrenc na Dravskem polju
00050000-5536-a18d-2227-5a639879a021	2344	Lovrenc na Pohorju
00050000-5536-a18d-389b-1a3c673506b7	3334	Luče
00050000-5536-a18d-2c03-4e878b01baab	1225	Lukovica
00050000-5536-a18d-e5bb-6810a579d9a9	9202	Mačkovci
00050000-5536-a18d-738e-2ac34bef93bc	2322	Majšperk
00050000-5536-a18d-f9cd-f33b75183d8c	2321	Makole
00050000-5536-a18d-5869-84aaea526d88	9243	Mala Nedelja
00050000-5536-a18d-fe65-e366dbdf9695	2229	Malečnik
00050000-5536-a18d-16f9-efc8ae5f6615	6273	Marezige
00050000-5536-a18d-2726-d1faa36b05fe	2000	Maribor 
00050000-5536-a18d-e211-01e437a2d509	2001	Maribor - poštni predali
00050000-5536-a18d-3612-acc2df266e40	2206	Marjeta na Dravskem polju
00050000-5536-a18d-a22f-0e00218909b1	2281	Markovci
00050000-5536-a18d-3f39-46bcc3a0b64a	9221	Martjanci
00050000-5536-a18d-eb61-4867c762fc67	6242	Materija
00050000-5536-a18d-892f-9cf4d5ae517f	4211	Mavčiče
00050000-5536-a18d-0c4a-f144170434be	1215	Medvode
00050000-5536-a18d-4b5d-edcf26a0b88a	1234	Mengeš
00050000-5536-a18d-499f-43b27eb0cb6c	8330	Metlika
00050000-5536-a18d-a589-4b4bc8259c2f	2392	Mežica
00050000-5536-a18d-7047-e7d134e89fb8	2204	Miklavž na Dravskem polju
00050000-5536-a18d-e0ac-3475f0191f48	2275	Miklavž pri Ormožu
00050000-5536-a18d-ed4f-36cb33298cd7	5291	Miren
00050000-5536-a18d-2a65-6613606da591	8233	Mirna
00050000-5536-a18d-7455-aca2e7109292	8216	Mirna Peč
00050000-5536-a18d-f2aa-7db3d6256988	2382	Mislinja
00050000-5536-a18d-8b10-57c6466833d5	4281	Mojstrana
00050000-5536-a18d-6ba6-cb1cb58fa2dd	8230	Mokronog
00050000-5536-a18d-f5ff-534338877062	1251	Moravče
00050000-5536-a18d-dd91-d670138d9989	9226	Moravske Toplice
00050000-5536-a18d-1104-0035c6d22079	5216	Most na Soči
00050000-5536-a18d-b32e-ef53073c8117	1221	Motnik
00050000-5536-a18d-541f-e75502965c3b	3330	Mozirje
00050000-5536-a18d-9262-f39d0c1fe81d	9000	Murska Sobota 
00050000-5536-a18d-aee3-06725c1b95a0	9001	Murska Sobota - poštni predali
00050000-5536-a18d-d2b2-346b9cea529a	2366	Muta
00050000-5536-a18d-005c-5be5f6b8c3c6	4202	Naklo
00050000-5536-a18d-cb56-cf41ad77ecf4	3331	Nazarje
00050000-5536-a18d-aed2-ef22373bbac0	1357	Notranje Gorice
00050000-5536-a18d-458f-5d3e4d100ac1	3203	Nova Cerkev
00050000-5536-a18d-14fa-dab6811fdc2a	5000	Nova Gorica 
00050000-5536-a18d-15b0-328d3bec9b87	5001	Nova Gorica - poštni predali
00050000-5536-a18d-8ca6-67f342c060d2	1385	Nova vas
00050000-5536-a18d-f445-92ec47b5b684	8000	Novo mesto
00050000-5536-a18d-dac6-77cceecb3c27	8001	Novo mesto - poštni predali
00050000-5536-a18d-fa68-b9062a52af77	6243	Obrov
00050000-5536-a18d-7535-b23c323ff27f	9233	Odranci
00050000-5536-a18d-e9f5-21e81d05b3af	2317	Oplotnica
00050000-5536-a18d-c7af-ebf671e4b553	2312	Orehova vas
00050000-5536-a18d-18ea-06fcfb4cf040	2270	Ormož
00050000-5536-a18d-3cb8-cb5f465de972	1316	Ortnek
00050000-5536-a18d-9f29-4cdc7c971f6f	1337	Osilnica
00050000-5536-a18d-7545-4fed97d1adef	8222	Otočec
00050000-5536-a18d-30b7-cfd44cf0384f	2361	Ožbalt
00050000-5536-a18d-1d29-a8398d63dfed	2231	Pernica
00050000-5536-a18d-ced0-4f75f052ff13	2211	Pesnica pri Mariboru
00050000-5536-a18d-76ec-a5a64a9833c5	9203	Petrovci
00050000-5536-a18d-69a4-faab056f2679	3301	Petrovče
00050000-5536-a18d-f242-6df504812470	6330	Piran/Pirano
00050000-5536-a18d-b41a-aaff383d985d	8255	Pišece
00050000-5536-a18d-b9d1-43a83bbabb30	6257	Pivka
00050000-5536-a18d-24d9-20334ab60be4	6232	Planina
00050000-5536-a18d-b19a-da539ee2ccf5	3225	Planina pri Sevnici
00050000-5536-a18d-ec9e-aee7e00289b0	6276	Pobegi
00050000-5536-a18d-ef69-b0704dbb7e59	8312	Podbočje
00050000-5536-a18d-ae9c-7396d98a69b9	5243	Podbrdo
00050000-5536-a18d-c840-c60b20cc7edc	3254	Podčetrtek
00050000-5536-a18d-0e20-97155f41967f	2273	Podgorci
00050000-5536-a18d-f81a-9d7914eb5127	6216	Podgorje
00050000-5536-a18d-f5f2-051e482f5ee0	2381	Podgorje pri Slovenj Gradcu
00050000-5536-a18d-9c56-68bd59d85b11	6244	Podgrad
00050000-5536-a18d-6a6e-39ee9585aee5	1414	Podkum
00050000-5536-a18d-6997-c40abf4122eb	2286	Podlehnik
00050000-5536-a18d-e316-36cd179d5aac	5272	Podnanos
00050000-5536-a18d-647f-572e5ffeb16e	4244	Podnart
00050000-5536-a18d-cbb4-43e5f90cf967	3241	Podplat
00050000-5536-a18d-5053-1471f56c5dca	3257	Podsreda
00050000-5536-a18d-7e51-42cb4859edac	2363	Podvelka
00050000-5536-a18d-be66-2980c5d72fd8	2208	Pohorje
00050000-5536-a18d-883d-6d78f076376a	2257	Polenšak
00050000-5536-a18d-87d8-52c8c8e57430	1355	Polhov Gradec
00050000-5536-a18d-7e27-3d1709c4da1c	4223	Poljane nad Škofjo Loko
00050000-5536-a18d-0818-66f53c64ac33	2319	Poljčane
00050000-5536-a18d-0bcc-dec57834315a	1272	Polšnik
00050000-5536-a18d-ce7b-d642af87f6c6	3313	Polzela
00050000-5536-a18d-f92f-b2368b6b8a42	3232	Ponikva
00050000-5536-a18d-142d-b425eb1fc5f5	6320	Portorož/Portorose
00050000-5536-a18d-d9d7-9aba365244c2	6230	Postojna
00050000-5536-a18d-8b29-640f8f8d29ad	2331	Pragersko
00050000-5536-a18d-5157-acafcd1df8a4	3312	Prebold
00050000-5536-a18d-901c-6e80ba6dcca6	4205	Preddvor
00050000-5536-a18d-f152-a6511a56806f	6255	Prem
00050000-5536-a18d-6974-2a4a5be8f03b	1352	Preserje
00050000-5536-a18d-0d39-b32363131c19	6258	Prestranek
00050000-5536-a18d-bf67-731e65ae13e6	2391	Prevalje
00050000-5536-a18d-e7d4-ee5f72f2d6e3	3262	Prevorje
00050000-5536-a18d-0e70-719c3933da71	1276	Primskovo 
00050000-5536-a18d-2e48-87dbc9f375c9	3253	Pristava pri Mestinju
00050000-5536-a18d-c952-e902299b718c	9207	Prosenjakovci/Partosfalva
00050000-5536-a18d-a522-046f8098d2de	5297	Prvačina
00050000-5536-a18d-f0d7-6aed8b1f7808	2250	Ptuj
00050000-5536-a18d-7249-a21f86152694	2323	Ptujska Gora
00050000-5536-a18d-241e-224540aaeb3a	9201	Puconci
00050000-5536-a18d-467a-dce0f714dd7e	2327	Rače
00050000-5536-a18d-473b-e3afd09ea616	1433	Radeče
00050000-5536-a18d-4c8e-fd341357cddb	9252	Radenci
00050000-5536-a18d-354e-17b5d0d4896a	2360	Radlje ob Dravi
00050000-5536-a18d-8c92-3782ef5b03ea	1235	Radomlje
00050000-5536-a18d-6a62-d85e5dda86c8	4240	Radovljica
00050000-5536-a18d-c225-3e40c302064a	8274	Raka
00050000-5536-a18d-8200-03d1b9bc7a88	1381	Rakek
00050000-5536-a18d-e7fa-b221ed72f0fc	4283	Rateče - Planica
00050000-5536-a18d-a838-f24ccd40a60f	2390	Ravne na Koroškem
00050000-5536-a18d-40c1-d877de55ce02	9246	Razkrižje
00050000-5536-a18d-97b5-219e8e399b94	3332	Rečica ob Savinji
00050000-5536-a18d-e632-ee22148ec6d9	5292	Renče
00050000-5536-a18d-3aa8-554a8f303c96	1310	Ribnica
00050000-5536-a18d-8e3f-92ed1f01b804	2364	Ribnica na Pohorju
00050000-5536-a18d-fe44-573b3b69125b	3272	Rimske Toplice
00050000-5536-a18d-bea1-8d2582f2106a	1314	Rob
00050000-5536-a18d-c8a0-b8ef90dc82e9	5215	Ročinj
00050000-5536-a18d-43b2-3d0ba6668472	3250	Rogaška Slatina
00050000-5536-a18d-fee5-d3b0c367d423	9262	Rogašovci
00050000-5536-a18d-4f54-3f529aa0dad7	3252	Rogatec
00050000-5536-a18d-94d9-4d1d77a803f5	1373	Rovte
00050000-5536-a18d-1bdb-3c2c29462ec7	2342	Ruše
00050000-5536-a18d-4de6-01d495e6487f	1282	Sava
00050000-5536-a18d-0ce0-b172cd400674	6333	Sečovlje/Sicciole
00050000-5536-a18d-623b-b847b921fdf6	4227	Selca
00050000-5536-a18d-b21f-cec46cb6dea7	2352	Selnica ob Dravi
00050000-5536-a18d-d2ba-cb03ae7b69f0	8333	Semič
00050000-5536-a18d-30f7-0313aea63c20	8281	Senovo
00050000-5536-a18d-d328-71dbe3cf6f94	6224	Senožeče
00050000-5536-a18d-1a43-b6d6db490c2b	8290	Sevnica
00050000-5536-a18d-1259-516ad42c1c71	6210	Sežana
00050000-5536-a18d-d288-95c221f2f858	2214	Sladki Vrh
00050000-5536-a18d-9b68-f4bc1e41f7fe	5283	Slap ob Idrijci
00050000-5536-a18d-a8b4-f0d9213fee7f	2380	Slovenj Gradec
00050000-5536-a18d-4198-b05d1f935599	2310	Slovenska Bistrica
00050000-5536-a18d-89df-00296c25e727	3210	Slovenske Konjice
00050000-5536-a18d-d371-34eb3e914eba	1216	Smlednik
00050000-5536-a18d-9b8b-bdc8b2a26169	5232	Soča
00050000-5536-a18d-c3f0-2b59b243e2d6	1317	Sodražica
00050000-5536-a18d-4358-8c74744746fb	3335	Solčava
00050000-5536-a18d-43ee-e61ff9e05163	5250	Solkan
00050000-5536-a18d-8d9a-ffb8a74e50cd	4229	Sorica
00050000-5536-a18d-8458-22b4b47ffcfe	4225	Sovodenj
00050000-5536-a18d-e6f6-07c2ddb91741	5281	Spodnja Idrija
00050000-5536-a18d-dc24-99dd744cb079	2241	Spodnji Duplek
00050000-5536-a18d-7d53-a25f8f0456c6	9245	Spodnji Ivanjci
00050000-5536-a18d-0c60-34b5eefcee75	2277	Središče ob Dravi
00050000-5536-a18d-3c34-bf4ca0e8d7f9	4267	Srednja vas v Bohinju
00050000-5536-a18d-8eaa-728ae25e0e43	8256	Sromlje 
00050000-5536-a18d-f711-4c699ae742e1	5224	Srpenica
00050000-5536-a18d-82c3-9f8a50aa89a5	1242	Stahovica
00050000-5536-a18d-5d1e-7af1e210bb54	1332	Stara Cerkev
00050000-5536-a18d-a25e-a29baa7c5072	8342	Stari trg ob Kolpi
00050000-5536-a18d-e4bb-2fa52261a3e7	1386	Stari trg pri Ložu
00050000-5536-a18d-8965-cf529edc0642	2205	Starše
00050000-5536-a18d-ee64-c127ace9db61	2289	Stoperce
00050000-5536-a18d-e666-fb43394845e9	8322	Stopiče
00050000-5536-a18d-6622-636273451c13	3206	Stranice
00050000-5536-a18d-5e01-d8e9e84a8699	8351	Straža
00050000-5536-a18d-c984-1075ad12f122	1313	Struge
00050000-5536-a18d-f21e-474ffc2afcae	8293	Studenec
00050000-5536-a18d-0086-1a244151f6d6	8331	Suhor
00050000-5536-a18d-ebff-cc4cb0b1ea99	2233	Sv. Ana v Slovenskih goricah
00050000-5536-a18d-7e95-689c5edbbeb3	2235	Sv. Trojica v Slovenskih goricah
00050000-5536-a18d-d767-32a3173004fa	2353	Sveti Duh na Ostrem Vrhu
00050000-5536-a18d-20d3-8da8a73f14bb	9244	Sveti Jurij ob Ščavnici
00050000-5536-a18d-9e9a-237134d49d7a	3264	Sveti Štefan
00050000-5536-a18d-8928-2744648a2c00	2258	Sveti Tomaž
00050000-5536-a18d-35b0-1579f9bfbcbe	9204	Šalovci
00050000-5536-a18d-a862-b07ee83f00c9	5261	Šempas
00050000-5536-a18d-8d11-137fd3c8dae7	5290	Šempeter pri Gorici
00050000-5536-a18d-a6ab-12efeb28378b	3311	Šempeter v Savinjski dolini
00050000-5536-a18d-d897-8b6abd828945	4208	Šenčur
00050000-5536-a18d-b241-362d8c878b6d	2212	Šentilj v Slovenskih goricah
00050000-5536-a18d-e636-1af939b84b6e	8297	Šentjanž
00050000-5536-a18d-cccb-992e5b7874a9	2373	Šentjanž pri Dravogradu
00050000-5536-a18d-0ba1-ab97dbb7542c	8310	Šentjernej
00050000-5536-a18d-cf99-52510e977c95	3230	Šentjur
00050000-5536-a18d-a1da-03e6245009de	3271	Šentrupert
00050000-5536-a18d-0fa8-df075dbc85a0	8232	Šentrupert
00050000-5536-a18d-b15b-9af5cede4103	1296	Šentvid pri Stični
00050000-5536-a18d-0ba2-b2fcc00085c8	8275	Škocjan
00050000-5536-a18d-290b-b3a8f1a87bfd	6281	Škofije
00050000-5536-a18d-3dd7-284952829c86	4220	Škofja Loka
00050000-5536-a18d-b3b4-22c871bf9b2e	3211	Škofja vas
00050000-5536-a18d-4880-bb7c521d0542	1291	Škofljica
00050000-5536-a18d-6ff7-f6caebe10ea5	6274	Šmarje
00050000-5536-a18d-3441-f831bed25be1	1293	Šmarje - Sap
00050000-5536-a18d-2ecd-7fe99319c594	3240	Šmarje pri Jelšah
00050000-5536-a18d-b355-33861290c72a	8220	Šmarješke Toplice
00050000-5536-a18d-dabb-bceb10890dc3	2315	Šmartno na Pohorju
00050000-5536-a18d-d0d6-3ba821f2a90a	3341	Šmartno ob Dreti
00050000-5536-a18d-a6aa-2db4a304b350	3327	Šmartno ob Paki
00050000-5536-a18d-8f6d-c73235e56a0b	1275	Šmartno pri Litiji
00050000-5536-a18d-d8de-39d542579b2e	2383	Šmartno pri Slovenj Gradcu
00050000-5536-a18d-1074-5b3f3f69e025	3201	Šmartno v Rožni dolini
00050000-5536-a18d-979c-840c4b676eb1	3325	Šoštanj
00050000-5536-a18d-f0bb-f5d2aa27cd97	6222	Štanjel
00050000-5536-a18d-0287-b207233e5268	3220	Štore
00050000-5536-a18d-8f0b-35f8e7e6376b	3304	Tabor
00050000-5536-a18d-c5f0-0cb7061d0ac4	3221	Teharje
00050000-5536-a18d-6420-f83d80a4ba2b	9251	Tišina
00050000-5536-a18d-30a0-e79e5969b231	5220	Tolmin
00050000-5536-a18d-3810-819e0eb6b9d6	3326	Topolšica
00050000-5536-a18d-c5a3-793eb04a8559	2371	Trbonje
00050000-5536-a18d-c4eb-7c627cf8435b	1420	Trbovlje
00050000-5536-a18d-85e2-c157235d85f1	8231	Trebelno 
00050000-5536-a18d-546f-38940e0ed25c	8210	Trebnje
00050000-5536-a18d-c8fe-a6aa0427ab72	5252	Trnovo pri Gorici
00050000-5536-a18d-8390-1a4be55657a4	2254	Trnovska vas
00050000-5536-a18d-b867-d3357eb2cc69	1222	Trojane
00050000-5536-a18d-7ce5-514379408803	1236	Trzin
00050000-5536-a18d-c630-d49b456ee39c	4290	Tržič
00050000-5536-a18d-6751-3e9c50f7256f	8295	Tržišče
00050000-5536-a18d-7352-bf8790f4af5c	1311	Turjak
00050000-5536-a18d-8d5c-4020e35bbdc6	9224	Turnišče
00050000-5536-a18d-7807-c2505507a80e	8323	Uršna sela
00050000-5536-a18d-5b08-117102f5db6a	1252	Vače
00050000-5536-a18d-357c-255dc515b177	3320	Velenje 
00050000-5536-a18d-7c04-1d46a1bd77f8	3322	Velenje - poštni predali
00050000-5536-a18d-d57a-a77a61f79ece	8212	Velika Loka
00050000-5536-a18d-86f7-a06c58701e3f	2274	Velika Nedelja
00050000-5536-a18d-fd12-55efdfbd3637	9225	Velika Polana
00050000-5536-a18d-74cb-3ec6354d784d	1315	Velike Lašče
00050000-5536-a18d-1ab2-1322f21d7bc8	8213	Veliki Gaber
00050000-5536-a18d-4beb-eb58ae6bb7bc	9241	Veržej
00050000-5536-a18d-43f3-8798f2589c45	1312	Videm - Dobrepolje
00050000-5536-a18d-e748-75fbf636f09d	2284	Videm pri Ptuju
00050000-5536-a18d-4bc7-5de5e8851b4f	8344	Vinica
00050000-5536-a18d-a564-ed8415bcca59	5271	Vipava
00050000-5536-a18d-0c42-dd409c3e2803	4212	Visoko
00050000-5536-a18d-8d83-fdcf523f9d18	1294	Višnja Gora
00050000-5536-a18d-b09b-012919038686	3205	Vitanje
00050000-5536-a18d-00c1-64128e0abef2	2255	Vitomarci
00050000-5536-a18d-54bd-d6e5ed81b9f6	1217	Vodice
00050000-5536-a18d-d3af-d8d1179b0dec	3212	Vojnik\t
00050000-5536-a18d-da0f-cc8b6e357507	5293	Volčja Draga
00050000-5536-a18d-a506-5aab4ccdf13a	2232	Voličina
00050000-5536-a18d-f679-2cfe7b78fc31	3305	Vransko
00050000-5536-a18d-1289-cf5fd3602f1b	6217	Vremski Britof
00050000-5536-a18d-b81a-9051d56fee4f	1360	Vrhnika
00050000-5536-a18d-06ec-61de0515d43d	2365	Vuhred
00050000-5536-a18d-8255-283843b860e0	2367	Vuzenica
00050000-5536-a18d-c86d-e82f988ccc9b	8292	Zabukovje 
00050000-5536-a18d-b832-c9ff0bc1de20	1410	Zagorje ob Savi
00050000-5536-a18d-ebb5-737677796cf6	1303	Zagradec
00050000-5536-a18d-300f-777a1ef4c5c1	2283	Zavrč
00050000-5536-a18d-d379-ff98e9769521	8272	Zdole 
00050000-5536-a18d-b67e-706e62a6c33c	4201	Zgornja Besnica
00050000-5536-a18d-45aa-22e6384d04b2	2242	Zgornja Korena
00050000-5536-a18d-7f09-a281d971f6cb	2201	Zgornja Kungota
00050000-5536-a18d-f55d-aa8eb91b9341	2316	Zgornja Ložnica
00050000-5536-a18d-0baf-835e4fdd0437	2314	Zgornja Polskava
00050000-5536-a18d-c40b-e43b1973ec34	2213	Zgornja Velka
00050000-5536-a18d-76d5-1e23b96b62fe	4247	Zgornje Gorje
00050000-5536-a18d-8ab7-bc2dfaeb6b2c	4206	Zgornje Jezersko
00050000-5536-a18d-1d1e-5c05d1e445d5	2285	Zgornji Leskovec
00050000-5536-a18d-af8b-e119dff0ed28	1432	Zidani Most
00050000-5536-a18d-53af-7e02637a8e33	3214	Zreče
00050000-5536-a18d-25e6-6d8e77934901	4209	Žabnica
00050000-5536-a18d-81d9-a04595cd230a	3310	Žalec
00050000-5536-a18d-4287-730d6f0db62b	4228	Železniki
00050000-5536-a18d-a44b-e9dbd428900c	2287	Žetale
00050000-5536-a18d-408f-da0b4ee689d7	4226	Žiri
00050000-5536-a18d-403d-685e741d5676	4274	Žirovnica
00050000-5536-a18d-b2e1-be350ab1f329	8360	Žužemberk
\.


--
-- TOC entry 2650 (class 0 OID 692875)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 692701)
-- Dependencies: 185
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2619 (class 0 OID 529329)
-- Dependencies: 171
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 692764)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 692887)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 692992)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 693036)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 692916)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 692860)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 692850)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 693026)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 692982)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2621 (class 0 OID 692575)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2657 (class 0 OID 692925)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2625 (class 0 OID 692612)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5536-a18f-bc16-a545cb7bdb52	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5536-a18f-d5d7-761c5bc5569e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5536-a18f-e662-cd8ca14dd5fe	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5536-a18f-7fcf-872c18b36255	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5536-a18f-604c-f55baa7eaa14	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5536-a18f-3948-03740f583896	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2623 (class 0 OID 692596)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5536-a18f-a5a8-24d77fa23267	00000000-5536-a18f-7fcf-872c18b36255
00010000-5536-a18f-92e7-4a5570ba1d31	00000000-5536-a18f-e662-cd8ca14dd5fe
\.


--
-- TOC entry 2659 (class 0 OID 692939)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 692881)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 692831)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 692669)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 692837)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 693017)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 692735)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2622 (class 0 OID 692584)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-5536-a18f-82be-398d7bb6a1b4	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxROihrxnfYbYmsV9iDfIUGGY5FGYARryju	t	\N	\N	\N	rootmail@max.si
00010000-5536-a18f-92e7-4a5570ba1d31	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxROBA0b/gXZn/Q2xrNGHh77EyTmLE8fzKy	t	\N	\N	\N	noreply@max.si
00010000-5536-a18f-a5a8-24d77fa23267	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2671 (class 0 OID 693067)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 692779)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 692908)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 692974)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 692807)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 693057)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 692964)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2265 (class 2606 OID 692637)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 693106)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 693099)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 693016)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 692797)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 692830)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 692759)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 692960)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 692777)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 692824)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 692873)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 692900)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 692733)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2269 (class 2606 OID 692646)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 692698)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2271 (class 2606 OID 692667)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 692626)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2256 (class 2606 OID 692611)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 692906)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 692938)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 693053)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 692691)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2291 (class 2606 OID 692721)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 692879)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2245 (class 2606 OID 529341)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 692768)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 692891)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 692998)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 693041)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 692923)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 692864)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 692855)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 693035)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 692989)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2247 (class 2606 OID 692583)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 692929)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2254 (class 2606 OID 692600)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2258 (class 2606 OID 692620)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 692947)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 692886)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 692836)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 692673)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 692846)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 693025)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 692744)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2250 (class 2606 OID 692594)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 693081)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2316 (class 2606 OID 692783)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2373 (class 2606 OID 692914)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 692980)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 692819)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 693066)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 692973)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 1259 OID 692804)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2277 (class 1259 OID 692693)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2285 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2286 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2287 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2368 (class 1259 OID 692907)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2362 (class 1259 OID 692893)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2363 (class 1259 OID 692892)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2314 (class 1259 OID 692784)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2389 (class 1259 OID 692963)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2390 (class 1259 OID 692961)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2391 (class 1259 OID 692962)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2414 (class 1259 OID 693054)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2415 (class 1259 OID 693055)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2416 (class 1259 OID 693056)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2421 (class 1259 OID 693084)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2422 (class 1259 OID 693083)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2423 (class 1259 OID 693082)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2296 (class 1259 OID 692746)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2297 (class 1259 OID 692745)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2281 (class 1259 OID 692700)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2282 (class 1259 OID 692699)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2377 (class 1259 OID 692930)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2332 (class 1259 OID 692825)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2260 (class 1259 OID 692627)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2261 (class 1259 OID 692628)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2382 (class 1259 OID 692950)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2383 (class 1259 OID 692949)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2384 (class 1259 OID 692948)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2306 (class 1259 OID 692769)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2307 (class 1259 OID 692771)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2308 (class 1259 OID 692770)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2342 (class 1259 OID 692859)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2343 (class 1259 OID 692857)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2344 (class 1259 OID 692856)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2345 (class 1259 OID 692858)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2251 (class 1259 OID 692601)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2252 (class 1259 OID 692602)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2371 (class 1259 OID 692915)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2357 (class 1259 OID 692880)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2397 (class 1259 OID 692990)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2398 (class 1259 OID 692991)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2242 (class 1259 OID 529342)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2243 (class 1259 OID 529343)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2401 (class 1259 OID 692999)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 693000)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2432 (class 1259 OID 693109)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 693108)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2434 (class 1259 OID 693111)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2435 (class 1259 OID 693107)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2436 (class 1259 OID 693110)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2394 (class 1259 OID 692981)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 692868)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2349 (class 1259 OID 692867)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2350 (class 1259 OID 692865)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2351 (class 1259 OID 692866)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2238 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2428 (class 1259 OID 693101)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2429 (class 1259 OID 693100)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2313 (class 1259 OID 692778)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2266 (class 1259 OID 692648)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2267 (class 1259 OID 692647)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2273 (class 1259 OID 692674)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2274 (class 1259 OID 692675)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2337 (class 1259 OID 692849)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2338 (class 1259 OID 692848)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2339 (class 1259 OID 692847)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2320 (class 1259 OID 692806)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2321 (class 1259 OID 692802)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2322 (class 1259 OID 692799)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2323 (class 1259 OID 692800)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2324 (class 1259 OID 692798)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2325 (class 1259 OID 692803)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2326 (class 1259 OID 692801)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2280 (class 1259 OID 692692)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2302 (class 1259 OID 692760)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2303 (class 1259 OID 692762)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2304 (class 1259 OID 692761)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2305 (class 1259 OID 692763)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2356 (class 1259 OID 692874)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2272 (class 1259 OID 692668)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2295 (class 1259 OID 692734)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2248 (class 1259 OID 692595)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2376 (class 1259 OID 692924)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2241 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2292 (class 1259 OID 692722)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2413 (class 1259 OID 693042)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2259 (class 1259 OID 692621)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2327 (class 1259 OID 692805)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2462 (class 2606 OID 693242)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2465 (class 2606 OID 693227)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2464 (class 2606 OID 693232)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2460 (class 2606 OID 693252)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2466 (class 2606 OID 693222)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2461 (class 2606 OID 693247)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2463 (class 2606 OID 693237)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2447 (class 2606 OID 693157)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2451 (class 2606 OID 693177)
-- Name: fk_1db842d610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT fk_1db842d610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2452 (class 2606 OID 693172)
-- Name: fk_1db842d6a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT fk_1db842d6a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2450 (class 2606 OID 693182)
-- Name: fk_1db842d6ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT fk_1db842d6ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2483 (class 2606 OID 693337)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2481 (class 2606 OID 693332)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2482 (class 2606 OID 693327)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2459 (class 2606 OID 693217)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2489 (class 2606 OID 693377)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2491 (class 2606 OID 693367)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2490 (class 2606 OID 693372)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 693317)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2500 (class 2606 OID 693412)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2499 (class 2606 OID 693417)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2498 (class 2606 OID 693422)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2501 (class 2606 OID 693437)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2502 (class 2606 OID 693432)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2503 (class 2606 OID 693427)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2453 (class 2606 OID 693192)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 693187)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2448 (class 2606 OID 693167)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2449 (class 2606 OID 693162)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2444 (class 2606 OID 693142)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2485 (class 2606 OID 693347)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2467 (class 2606 OID 693257)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2441 (class 2606 OID 693122)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2440 (class 2606 OID 693127)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2486 (class 2606 OID 693362)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2487 (class 2606 OID 693357)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2488 (class 2606 OID 693352)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2457 (class 2606 OID 693197)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2455 (class 2606 OID 693207)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2456 (class 2606 OID 693202)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2471 (class 2606 OID 693292)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2473 (class 2606 OID 693282)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2474 (class 2606 OID 693277)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2472 (class 2606 OID 693287)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2439 (class 2606 OID 693112)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2438 (class 2606 OID 693117)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2484 (class 2606 OID 693342)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2480 (class 2606 OID 693322)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2494 (class 2606 OID 693387)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2493 (class 2606 OID 693392)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2496 (class 2606 OID 693397)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 693402)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2508 (class 2606 OID 693462)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2509 (class 2606 OID 693457)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2506 (class 2606 OID 693472)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2510 (class 2606 OID 693452)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2507 (class 2606 OID 693467)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2492 (class 2606 OID 693382)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2475 (class 2606 OID 693312)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2476 (class 2606 OID 693307)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2478 (class 2606 OID 693297)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2477 (class 2606 OID 693302)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2437 (class 2606 OID 529773)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2504 (class 2606 OID 693447)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 693442)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2458 (class 2606 OID 693212)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2497 (class 2606 OID 693407)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2442 (class 2606 OID 693137)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 693132)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2446 (class 2606 OID 693147)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2445 (class 2606 OID 693152)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2468 (class 2606 OID 693272)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2469 (class 2606 OID 693267)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2470 (class 2606 OID 693262)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-21 21:14:23 CEST

--
-- PostgreSQL database dump complete
--

