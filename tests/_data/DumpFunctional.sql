--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-23 12:30:02 CEST

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
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 1021912)
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
-- TOC entry 225 (class 1259 OID 1022396)
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
-- TOC entry 224 (class 1259 OID 1022379)
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
-- TOC entry 217 (class 1259 OID 1022295)
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
-- TOC entry 193 (class 1259 OID 1022079)
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
-- TOC entry 196 (class 1259 OID 1022120)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1022041)
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
-- TOC entry 212 (class 1259 OID 1022245)
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
-- TOC entry 191 (class 1259 OID 1022066)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1022114)
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
-- TOC entry 201 (class 1259 OID 1022163)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1022188)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1022015)
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
-- TOC entry 180 (class 1259 OID 1021921)
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
-- TOC entry 181 (class 1259 OID 1021932)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
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
-- TOC entry 184 (class 1259 OID 1021985)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1021886)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1021905)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1022195)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1022225)
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
-- TOC entry 221 (class 1259 OID 1022337)
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
-- TOC entry 183 (class 1259 OID 1021965)
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
-- TOC entry 186 (class 1259 OID 1022007)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1022169)
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
-- TOC entry 185 (class 1259 OID 1021992)
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
-- TOC entry 190 (class 1259 OID 1022058)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1022181)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1022286)
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
-- TOC entry 220 (class 1259 OID 1022330)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1022210)
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
-- TOC entry 200 (class 1259 OID 1022154)
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
-- TOC entry 199 (class 1259 OID 1022144)
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
-- TOC entry 219 (class 1259 OID 1022320)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1022276)
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
-- TOC entry 173 (class 1259 OID 1021857)
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
-- TOC entry 172 (class 1259 OID 1021855)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 1022219)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1021895)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1021879)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1022233)
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
-- TOC entry 203 (class 1259 OID 1022175)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1022125)
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
-- TOC entry 182 (class 1259 OID 1021957)
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
-- TOC entry 198 (class 1259 OID 1022131)
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
-- TOC entry 218 (class 1259 OID 1022311)
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
-- TOC entry 188 (class 1259 OID 1022027)
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
-- TOC entry 174 (class 1259 OID 1021866)
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
-- TOC entry 223 (class 1259 OID 1022361)
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
-- TOC entry 192 (class 1259 OID 1022073)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1022202)
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
-- TOC entry 214 (class 1259 OID 1022268)
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
-- TOC entry 194 (class 1259 OID 1022101)
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
-- TOC entry 222 (class 1259 OID 1022351)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1022258)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1021860)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2638 (class 0 OID 1021912)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2684 (class 0 OID 1022396)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 1022379)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1022295)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1022079)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1022120)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1022041)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5538-c9a8-07ef-87678d43ba3e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5538-c9a8-18e1-ade575816a19	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5538-c9a8-f084-23d8a0c245e1	AL	ALB	008	Albania 	Albanija	\N
00040000-5538-c9a8-eed1-cff785e88748	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5538-c9a8-be67-570622180107	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5538-c9a8-6984-0cdca5db9a59	AD	AND	020	Andorra 	Andora	\N
00040000-5538-c9a8-6986-a03fd96797a4	AO	AGO	024	Angola 	Angola	\N
00040000-5538-c9a8-0033-c9b8dad11308	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5538-c9a8-bed9-9c37c60b7664	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5538-c9a8-c9fc-9e278429e30e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5538-c9a8-3f60-71ab9a40b072	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5538-c9a8-c066-652e8a00a10e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5538-c9a8-31e2-25830960db54	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5538-c9a8-ac51-231e9c6a0684	AU	AUS	036	Australia 	Avstralija	\N
00040000-5538-c9a8-1cc6-386b45aee046	AT	AUT	040	Austria 	Avstrija	\N
00040000-5538-c9a8-5946-3e7f59827ee9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5538-c9a8-9f1f-d4982af87dcc	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5538-c9a8-ba0f-c32fa484725b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5538-c9a8-3df8-9d577d4f5b9b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5538-c9a8-060d-3db52a311294	BB	BRB	052	Barbados 	Barbados	\N
00040000-5538-c9a8-df6b-adbb3fae3cc8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5538-c9a8-dec1-562dd4269b6f	BE	BEL	056	Belgium 	Belgija	\N
00040000-5538-c9a8-2631-460ec03781c3	BZ	BLZ	084	Belize 	Belize	\N
00040000-5538-c9a8-2dcb-d2ddd443c49b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5538-c9a8-6c7c-146b39fd22f6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5538-c9a8-a099-12cc36d8f8dc	BT	BTN	064	Bhutan 	Butan	\N
00040000-5538-c9a8-8aeb-c9570ad0ec40	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5538-c9a8-59cb-ae5c0c22e373	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5538-c9a8-1626-4fc7ab010ed2	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5538-c9a8-be3f-75631b40c3f9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5538-c9a8-917d-5bda80c8ab7e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5538-c9a8-87ec-97ac5c7cb66f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5538-c9a8-6b71-b5520e9d129a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5538-c9a8-e5c3-a560428dfd54	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5538-c9a8-1373-6b9a84f4c4ef	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5538-c9a8-31bb-59d56e2ebca2	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5538-c9a8-7b1d-994a56a7d736	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5538-c9a8-ea01-a2cc56e22724	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5538-c9a8-f558-b031fd5a2b24	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5538-c9a8-c7ac-bcda892cb6e2	CA	CAN	124	Canada 	Kanada	\N
00040000-5538-c9a8-ba92-acb86a5db490	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5538-c9a8-8141-f2fc5295a78a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5538-c9a8-52fd-d5f5d1d8275c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5538-c9a8-300f-dfed27648214	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5538-c9a8-3e5f-51b6a54f5946	CL	CHL	152	Chile 	Čile	\N
00040000-5538-c9a8-a100-f4a286af4b58	CN	CHN	156	China 	Kitajska	\N
00040000-5538-c9a8-bee0-3f851e46e195	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5538-c9a8-b122-bf8b98ce1c26	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5538-c9a8-4b72-ece306d63253	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5538-c9a8-78c1-8d25e538af32	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5538-c9a8-d336-70581e00d2fb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5538-c9a8-2bb9-2857483367ee	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5538-c9a8-f9b6-18508346afac	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5538-c9a8-cb47-c398fefe4d9f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5538-c9a8-e6f5-24459d0dd926	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5538-c9a8-0384-7f4ac50427db	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5538-c9a8-e132-b820a707d4e7	CU	CUB	192	Cuba 	Kuba	\N
00040000-5538-c9a8-04e6-78d974fa4284	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5538-c9a8-e61c-7553a4178fbc	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5538-c9a8-afcd-1a12975ef884	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5538-c9a8-6b78-bbe5fb0bd936	DK	DNK	208	Denmark 	Danska	\N
00040000-5538-c9a8-7803-f0c61bcede29	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5538-c9a8-6ca7-59423dcf4381	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5538-c9a8-cfcf-e7f3747aaaf4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5538-c9a8-7cc4-3ba3a56eaaa5	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5538-c9a8-49ff-1f2af22dd297	EG	EGY	818	Egypt 	Egipt	\N
00040000-5538-c9a8-9c78-3eb234fa8b7f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5538-c9a8-7544-8ed55a808713	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5538-c9a8-15af-3ee48355e476	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5538-c9a8-b81f-7c2fb222d81e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5538-c9a8-2cf2-78566c8727b7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5538-c9a8-d12b-174e1456c4dc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5538-c9a8-83d2-6d75b9a62680	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5538-c9a8-1bff-3713780987c8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5538-c9a8-b46e-235c7003fbd0	FI	FIN	246	Finland 	Finska	\N
00040000-5538-c9a8-a96e-d4edf3a4468a	FR	FRA	250	France 	Francija	\N
00040000-5538-c9a8-fda1-535ce3586609	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5538-c9a8-a295-7678d0613f01	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5538-c9a8-c7ea-e5f1686afaa3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5538-c9a8-08b7-e21a90a195de	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5538-c9a8-3ea9-8a8b785c238c	GA	GAB	266	Gabon 	Gabon	\N
00040000-5538-c9a8-c63d-0ce16d07db59	GM	GMB	270	Gambia 	Gambija	\N
00040000-5538-c9a8-e414-29abf200553e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5538-c9a8-7ecc-212b82d40446	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5538-c9a8-2ae7-6838d3c2e4e6	GH	GHA	288	Ghana 	Gana	\N
00040000-5538-c9a8-46df-a7f0b4855109	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5538-c9a8-8c70-dd18cb121427	GR	GRC	300	Greece 	Grčija	\N
00040000-5538-c9a8-4820-7ad56a1f8c1d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5538-c9a8-df96-80b30ee2ed9b	GD	GRD	308	Grenada 	Grenada	\N
00040000-5538-c9a8-19fc-341e474abc8d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5538-c9a8-8053-4d9cf1e8a98e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5538-c9a8-c9a8-ab7409d7d682	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5538-c9a8-e352-1c11b534dbc5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5538-c9a8-e3ac-57a0e27985ac	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5538-c9a8-ec62-11c778d4f76d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5538-c9a8-bdb8-967d92e9d770	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5538-c9a8-1594-5af830d5057a	HT	HTI	332	Haiti 	Haiti	\N
00040000-5538-c9a8-2f2f-2831121671dd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5538-c9a8-6af4-11c08eaba1f8	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5538-c9a8-cfb4-e6ff45ece74b	HN	HND	340	Honduras 	Honduras	\N
00040000-5538-c9a8-0a39-f6b889c2e44c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5538-c9a8-dd2f-c0677d967832	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5538-c9a8-0496-a5e9a375befa	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5538-c9a8-c639-4c6892295d37	IN	IND	356	India 	Indija	\N
00040000-5538-c9a8-8d11-091cd88ac7d3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5538-c9a8-940e-274500c55122	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5538-c9a8-1097-689b661d0a2e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5538-c9a8-4bc2-3ae1ed8cf5fd	IE	IRL	372	Ireland 	Irska	\N
00040000-5538-c9a8-216e-a2dd2872cd66	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5538-c9a8-0797-9ee514f8beea	IL	ISR	376	Israel 	Izrael	\N
00040000-5538-c9a8-5894-f94c827112bb	IT	ITA	380	Italy 	Italija	\N
00040000-5538-c9a8-57f7-d7a5bc4af00b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5538-c9a8-9428-31bbb738a293	JP	JPN	392	Japan 	Japonska	\N
00040000-5538-c9a8-1668-08fa63c6fad5	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5538-c9a8-9a90-0f48831dae7c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5538-c9a8-53c6-33af11cdee7a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5538-c9a8-69d0-90c043731672	KE	KEN	404	Kenya 	Kenija	\N
00040000-5538-c9a8-75ae-8ba880e16170	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5538-c9a8-1637-3b961b292ff1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5538-c9a8-4c38-90051b8040ba	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5538-c9a8-1b08-c639c675d5fb	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5538-c9a8-75c9-135152cf24bb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5538-c9a8-f4f5-5d7c8636e90b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5538-c9a8-20e1-a385ab2f290c	LV	LVA	428	Latvia 	Latvija	\N
00040000-5538-c9a8-71a4-95edc11ac8db	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5538-c9a8-73f5-c909d25fa559	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5538-c9a8-be02-afc61696a2a4	LR	LBR	430	Liberia 	Liberija	\N
00040000-5538-c9a8-f5c8-ee11d4eea11a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5538-c9a8-56dd-766d3baa1d4a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5538-c9a8-c18a-8f06958e50de	LT	LTU	440	Lithuania 	Litva	\N
00040000-5538-c9a8-6f94-bf057153239b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5538-c9a8-a34c-001cdeba588e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5538-c9a8-c47f-e6f1c4a42d35	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5538-c9a8-ac6b-c26e8b054141	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5538-c9a8-f305-e5afcfa8994a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5538-c9a8-250c-1af5fb743f6f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5538-c9a8-3260-cf8ec3f186a8	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5538-c9a8-527e-75116d74db56	ML	MLI	466	Mali 	Mali	\N
00040000-5538-c9a8-3fc2-245e4e020e83	MT	MLT	470	Malta 	Malta	\N
00040000-5538-c9a8-beab-e8a9e900bae2	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5538-c9a8-0527-1ac4fa4ad979	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5538-c9a8-1f62-b8e7c03453de	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5538-c9a8-cdd5-de4cce8ca50a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5538-c9a8-6b8a-c45bdfb86d89	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5538-c9a8-1fb7-d057d5f8cc85	MX	MEX	484	Mexico 	Mehika	\N
00040000-5538-c9a8-6344-726f674b38f7	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5538-c9a8-cae2-65ff83f5670d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5538-c9a8-5d82-5043ff4095b3	MC	MCO	492	Monaco 	Monako	\N
00040000-5538-c9a8-df1a-ab42a5767a01	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5538-c9a8-a42e-65da50c3ad37	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5538-c9a8-2384-5d8b7f93b85b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5538-c9a8-b265-d8cdc7014c20	MA	MAR	504	Morocco 	Maroko	\N
00040000-5538-c9a8-a358-0bd8c141801d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5538-c9a8-b56f-f84ba13f1330	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5538-c9a8-51c8-1f2634c94b4b	NA	NAM	516	Namibia 	Namibija	\N
00040000-5538-c9a8-8f88-1a5d853aaa7a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5538-c9a8-442e-f9b2d1572be9	NP	NPL	524	Nepal 	Nepal	\N
00040000-5538-c9a8-bd21-97023d31d49e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5538-c9a8-f574-96b0f5e00f8d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5538-c9a8-73a5-e97b960c1939	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5538-c9a8-06b9-bbd92f598749	NE	NER	562	Niger 	Niger 	\N
00040000-5538-c9a8-ff78-b0f4103d0eb3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5538-c9a8-3411-f55ab816723f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5538-c9a8-8b9a-a008d4ae5cb2	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5538-c9a8-744d-a821f5d3ceb4	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5538-c9a8-f907-0e40455d0422	NO	NOR	578	Norway 	Norveška	\N
00040000-5538-c9a8-ddcc-66624f78c079	OM	OMN	512	Oman 	Oman	\N
00040000-5538-c9a8-87eb-db4f4ba955ec	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5538-c9a8-dd1e-7da26abb5b0e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5538-c9a8-4481-bdbb9234c40f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5538-c9a8-14f5-42828937cd55	PA	PAN	591	Panama 	Panama	\N
00040000-5538-c9a8-aec4-55b0a3c7d002	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5538-c9a8-4c26-1e1f1e01aa92	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5538-c9a8-f7d9-e9070c5215c8	PE	PER	604	Peru 	Peru	\N
00040000-5538-c9a8-65d4-5785a50b8d92	PH	PHL	608	Philippines 	Filipini	\N
00040000-5538-c9a8-8be9-52af0bf5434d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5538-c9a8-79b0-1f1c64b3dff1	PL	POL	616	Poland 	Poljska	\N
00040000-5538-c9a8-a4b2-9b95e5c275d8	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5538-c9a8-a72d-e2c8b1d2047a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5538-c9a8-175c-36a3b5a1a701	QA	QAT	634	Qatar 	Katar	\N
00040000-5538-c9a8-ebc1-2cedf9c720ed	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5538-c9a8-65f0-e87fb295181b	RO	ROU	642	Romania 	Romunija	\N
00040000-5538-c9a8-1f27-88920399be03	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5538-c9a8-85fb-dae8ad2f0add	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5538-c9a8-d4b0-40f131708aab	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5538-c9a8-2d53-5bed02b94eae	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5538-c9a8-01a6-d6e4b7aaca05	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5538-c9a8-7c75-e4ce595e110f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5538-c9a8-3039-79bac5940e71	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5538-c9a8-2f94-0c1bcab916c3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5538-c9a8-7c8e-5fbb35a2b224	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5538-c9a8-282d-c47a8c044c91	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5538-c9a8-a650-c47f112d5813	SM	SMR	674	San Marino 	San Marino	\N
00040000-5538-c9a8-61ea-f03875499098	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5538-c9a8-0100-9492036715f5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5538-c9a8-beeb-b75769d969fc	SN	SEN	686	Senegal 	Senegal	\N
00040000-5538-c9a8-2029-9f860914ce79	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5538-c9a8-1451-65a7242a8543	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5538-c9a8-59aa-4b8c02a76fbb	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5538-c9a8-df94-3b4e61f79031	SG	SGP	702	Singapore 	Singapur	\N
00040000-5538-c9a8-765a-fdf024856bac	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5538-c9a8-7cdd-742cb9c07e0c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5538-c9a8-a1fd-6f14fe5a83f1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5538-c9a8-0c57-98f04e7d1473	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5538-c9a8-08a6-9df7e3cd51b9	SO	SOM	706	Somalia 	Somalija	\N
00040000-5538-c9a8-5845-56b5bcf1a7b9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5538-c9a8-89d8-0a1f999a61a1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5538-c9a8-33cb-29efe8db4042	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5538-c9a8-0e9a-feced318558e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5538-c9a8-5bd8-8392944efbfa	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5538-c9a8-ec30-0c18467766b7	SD	SDN	729	Sudan 	Sudan	\N
00040000-5538-c9a8-9a9a-3555da5a11e5	SR	SUR	740	Suriname 	Surinam	\N
00040000-5538-c9a8-d0fb-5fb03876f1cc	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5538-c9a8-28f4-67aed89d31a8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5538-c9a8-acda-dba7daffa627	SE	SWE	752	Sweden 	Švedska	\N
00040000-5538-c9a8-d740-d812fbf983b7	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5538-c9a8-e0a4-3401e710c9ef	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5538-c9a8-9287-5227195563a7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5538-c9a8-eb38-54d4814fac92	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5538-c9a8-e0c8-5b5eb773ec50	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5538-c9a8-e272-1ba3d94128f4	TH	THA	764	Thailand 	Tajska	\N
00040000-5538-c9a8-0016-11e34a9611e8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5538-c9a8-f99f-35168d649672	TG	TGO	768	Togo 	Togo	\N
00040000-5538-c9a8-d3a8-ec44bd559b2f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5538-c9a8-ddae-853bb7b5de1b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5538-c9a8-1a38-59cf4b1ff475	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5538-c9a8-4156-e6c18f47ea07	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5538-c9a8-91e6-5c5e9fce3245	TR	TUR	792	Turkey 	Turčija	\N
00040000-5538-c9a8-2eb5-03ddf549fe6d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5538-c9a8-6bf3-8e32daac1871	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5538-c9a8-e59d-25ae7e843308	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5538-c9a8-4647-ffa1f4b8c8fe	UG	UGA	800	Uganda 	Uganda	\N
00040000-5538-c9a8-10da-576330744f76	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5538-c9a8-eed2-73a719ab4e24	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5538-c9a8-53fa-76e44dfd9f95	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5538-c9a8-00d9-da27cccf57ee	US	USA	840	United States 	Združene države Amerike	\N
00040000-5538-c9a8-4dee-7ead6b6ec1a5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5538-c9a8-e9a2-b43fdd374b65	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5538-c9a8-ced2-24c98b1f7d46	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5538-c9a8-4fb8-fd4e8bae5a6c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5538-c9a8-c99a-07ae57a0075c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5538-c9a8-8e38-9b27183f5ecd	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5538-c9a8-1ef3-d3e6bdb5bb7e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5538-c9a8-62d0-699b63d9cb87	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5538-c9a8-8446-f4e31f192e16	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5538-c9a8-b172-9d52f88f098d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5538-c9a8-87f8-f81d6b328ac7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5538-c9a8-3e7a-dfc2a203291c	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5538-c9a8-23d2-af9ee95d3113	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2671 (class 0 OID 1022245)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1022066)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1022114)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 1022163)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 1022188)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1022015)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5538-c9aa-f502-b8fe01b62ad9	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5538-c9aa-76e2-8e2f304cd0aa	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5538-c9aa-be4a-1fe0d9ab7681	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5538-c9aa-e937-6640223a612f	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5538-c9aa-cd0e-6854eef1bb8a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5538-c9aa-6573-d8a167dde892	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5538-c9aa-29d1-fd1120de6582	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5538-c9aa-d29b-cc84c3a95163	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5538-c9aa-9323-e8403bff1846	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5538-c9aa-e3ca-f6c8789ed489	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2639 (class 0 OID 1021921)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5538-c9aa-6f83-3653d93bccf4	00000000-5538-c9aa-cd0e-6854eef1bb8a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5538-c9aa-0178-2fcd2c8732eb	00000000-5538-c9aa-cd0e-6854eef1bb8a	00010000-5538-c9aa-5488-9630161e47fb	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5538-c9aa-709d-22c679ee7690	00000000-5538-c9aa-6573-d8a167dde892	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2640 (class 0 OID 1021932)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1021985)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 1021886)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5538-c9a8-5e32-4209c2fc99f3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-b66c-310e9d17b31e	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-edb5-ba1a7e85bdb0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-4396-453fd8b3809d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-1b7e-aa86ee94ccb1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-ec97-521d10be4ebb	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-d2e3-75af893e41fa	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-bb59-3638b210b6fc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-e99d-250117e14376	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-b2f5-ba085fe4f626	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-c890-f7f9bbe0e18e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-151c-cd71c6784ae0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-d08a-29862e653838	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-5b85-00c409656824	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-82c4-e981e97ecd28	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-5b99-079bbf3b4074	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-3766-4474614fe924	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-32e9-0a9b1a9de47d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-c27f-dcac6d021d14	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-b90e-5b43aef86cb4	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-16b4-c3abb44d0ac4	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-274c-898e271df456	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-5938-29bc1049c51c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-f236-dc51bf82e9ca	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-2e55-9f20cf58ad13	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-08d3-3af987bb2512	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-c874-43866b105b9b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-50a8-d168af846722	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-1d47-b545a63969e1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-abe2-e2519940597e	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-fd31-a62ba5209834	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-b369-0f6a2c6df0c5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-ff5f-7d3a581ce988	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-9bdd-561931712d93	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-24e0-e693aa3e270e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-0759-4eea8c411895	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-5c82-2de9980467dc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-520a-7aa74e59a444	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-eded-71d75dde8383	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-7806-f125e30200a6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-e562-e928936bc670	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-3828-0b437e4f2dce	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-cbdb-c1f493fb3e91	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-4623-dac4a01e757f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-03e1-7178b5bd5fca	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-5c5e-6f8000f893d0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-8cf7-c8d11a96fa7d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-4f42-68286d1bcaf1	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-2f54-672d9803d418	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-b273-0bee8d1fe334	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-ea7c-3954734d47f2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-9b37-b91ab02787d6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-653c-daa714c1cdca	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-edc2-2b153797abd0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-0d1e-ffcb6f2699da	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-2e34-9d01621dd8de	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-518e-ef0abe0a5045	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-f8bf-c2889983c9c9	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-9138-7b9526aecd12	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-af4a-a622e9eb0935	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-f427-09498352d3c3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-2968-dc495d9de6c5	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-fd0d-33a2afc2392c	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-b5e7-b5582c32e3a3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-09bf-07e228d9dd46	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-b7d3-305346f53e3a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-f594-e615d2cb112a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-6530-79a745da1d9a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-945b-e8036563d4dc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-04c2-c8e18117690e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-bfdb-8694cc67572f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-6d58-23743adb1478	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-d4e2-d849c84d5f93	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-f9e1-dd401c7068fb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-ffbc-980f99c08033	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-e636-8454a032ac57	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-e784-30af0090ffc8	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-d978-0715864ff3d9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-5f91-b0d0b606eeaf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-8e4b-40b45b686527	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-117c-d89a5195a9f5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-aed0-4292b42be075	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-7c29-ee52f2a08878	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-557e-9a05114a0f37	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-84d6-0163fa1f7be7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-dc62-70e1e42a9ebb	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-f08a-88197671e417	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-0d51-6f780823f793	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-4758-ed3e56dc3512	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-9809-94dc7d1aff71	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-a58a-0df36c4c364e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-8548-690a1d07786a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-5d4c-84e741e1e0f4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-8b90-a1eb2768f4a3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-5d2b-14dbf544fae7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-c53d-bede9514eada	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-a219-979c37972078	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-9d0d-bdfb7909b162	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-aeb2-03e366c17084	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-c74a-6d3cbb92a7c3	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-cecf-e75a1fb2472f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-b588-64f658cf7892	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-ad37-9487c61fd594	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-b921-cf38e50f37ea	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-7b60-8bb1f1a9d9db	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-8ef3-d663c75d1417	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-ea43-515893d7ce5f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-99e3-093e66848290	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-6807-73be72d41f2d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-fef1-bba14b771e05	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-f71c-ab845752a013	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-3065-2563e13e3352	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-537d-93dc5270c07e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-4ffa-6c40386f2d88	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-e5d9-33dae21bf38c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-22a3-662c191ec7a7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-797f-5a52a68cf93a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-b2a1-cde7c26ba93c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-5a1b-684d8eabf4ec	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-dc1a-e6ca0b1f6717	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-dcc8-f059213365c0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-2a1f-e2d00113af1a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-4305-fadd23292508	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-3dd7-92281111aad1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-f5bc-2404d7e67a93	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-d873-0f0eb228c2e5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-e0e1-871f58b51494	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-d8f8-d0ea4d760ca1	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-a2d4-5f8830ed8bdb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-1b63-de87ab076d47	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-d062-4be67521537c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-bef5-49b3b812068d	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-70ad-2c79838b1203	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-d4ba-adeb45d8b667	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-cb9b-10197bf3852a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-af5a-e387620451fc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-3791-025d64043513	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-aa33-f42daa812595	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-590c-ad34d860b8d3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-f142-4df24588a9c5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-b739-57bad789590b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-0c04-9420cdfa1e3b	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-06e7-bb5f4fef78a0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-5502-21eae9aef826	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-8d85-e6660c0171ea	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-99c5-26c6b7bafa8e	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-35ae-97ec48bd6d70	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-d28f-538c1af7c2bb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-fbbd-41a5e6d0b3c2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-d000-6e5f2b65084f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-af60-82027ddaa206	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-03ce-63d8f4991d8d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-1b85-efc3573197b4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-4265-efdf9f610cee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-2a89-f1dc3dbd2430	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-d564-ae8e10b74cea	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-64eb-a59f7cab3de1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-ccc3-1751d3a7e51c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-8cdf-3fa41276f95e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-7f45-af5361d3762a	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-5a39-62f2909e9000	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-c8ba-21fd12a252f0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-82d0-995d87343ca4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-2113-b9f0ca55584f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-fa2e-642f3542b36b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-dd94-ce20f80188c3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-1107-cc4ec3b6f170	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-dc87-eb7e2e9981a0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-2368-af7479158b99	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a8-b12a-b79a55762645	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a8-c87c-0465df131429	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a8-d98d-9b10fca7bc6c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a8-f383-6cfcb112a321	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a8-5eb7-6945c971a540	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a8-0f5c-7a8620753b2b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a8-1f82-c98000d8fef6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a8-b94c-5df3bf1f5603	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a8-d7ad-c6d6b0ffc205	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a8-06ef-d7fe3004f09a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a8-fcc0-b92fe92079f9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a8-1b14-c73c863b421b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a8-d497-d12015165092	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a8-ca33-8ea8e65dc11c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-b252-d00cb860496b	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-b4da-2fa7dc2859dd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-8c4b-91a70cce4f45	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-7e42-ac1626035941	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-e81d-06b778c718d5	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-b5b6-a34f5ed30dd5	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-dbaf-b80d7645ce69	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-c4ca-8f4502883909	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-452b-d9eaaeedb6e9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-dc4f-ab17a448e92b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-ab82-74ab97bb59e6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-de4f-8d2dc3fc486f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-0d18-871137ea80d1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-d16b-9260270fe35e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-f53d-bb2bcb7a90c2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-2023-d8c721ffaaae	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-8318-30e74f84c3b3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-18c9-3339c371d03c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-1936-887dc637242c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-60ea-80fd62b253eb	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-608b-695f362d7b7d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-6336-bb43321bf6bc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-ef04-7e1b95736ade	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-83ef-59818fc569c8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-43f8-1014cfa5dff1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-0e10-59d5de4e0c75	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-8664-17a15ccd8b3b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-220f-1e912f3f541a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-7794-e65013719b38	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-1a64-77f5bc2e2d38	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-ffdc-d4e1fefe1909	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-534c-0608941fe5e9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-4e7e-8895d62e3b79	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-6209-fb8f1e0e770b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-a4a9-85f8cd46db46	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-38d9-3676b1988454	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-3862-37c1ab3aad69	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-fe94-5f9da6659686	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-7d62-7092f729b5e3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-bcac-c1be0a7ddc3d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-8ac3-c35f9efffb3e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-1098-3becf8404437	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-ba9f-8fb8a4702bb7	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-cc2e-31917fa0a8b6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-bd14-0a66a9d05e85	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-aaec-3448730e4471	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-4480-350251a61876	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-73e4-908197c1308d	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-067e-d7604d7b7765	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-0d68-bf5c0ebd2a1d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-4543-fc022ebe52dc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-88bc-4b785eddfd07	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-bde2-b4b7ab2ba7d7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-268d-5200ea0efd79	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-b567-4f3a01d6093b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-c1c9-4bd56d2e5b47	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-0e65-ebd4869cc0d8	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-5693-930e563ef219	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-0596-8ee6dc6338de	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-07f0-03d6781e20a2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-b561-d308853f04ec	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-adee-c8a8a0c415e7	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-11cc-efa98951799d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-afcf-164e3e2b1fad	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-aa1e-3d117e866ce4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-93e8-942e628ed06d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-7598-92f036e0cbf4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-9360-d0febd082357	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-9fea-3571e7e68c90	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-7673-ffbd79cfe4e5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-fcc5-47a46283efe2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-793b-abe5ca74c52b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-2164-766fb594523c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-a8bc-08682cda1ed8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-ad82-403dbc3530d6	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-6a3b-177ca62b5b96	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-2470-b0113abd4e09	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-fc05-8226a42031e4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-b2ed-5b1f395adf08	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-4160-a7884ace947e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-d681-1e32160e6962	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-c1fe-da8322760b16	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-4e93-580dcbc47d28	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-37fe-182eb5ad1f9f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-c9dc-5eaa198c2d66	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-22d0-29761202f51c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-bd45-c427d0f334a7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-db7b-f5feddc23446	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-f2c9-8ac99e796802	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-9010-56768931e564	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-7792-c594e60d9d1b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-9f85-d76e31cca805	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-0a2a-7f5b2464ddaa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-e45b-25ca1647a265	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-d323-e029998683aa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-be81-a56bcc89170c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-1d3d-ade8ab562492	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-4c68-268c61cc785c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-6e9b-9da0892de4a2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-567c-eacffceaaa4e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-4ce1-5a2b968d90a9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-ef7e-d2aa902eb841	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-477f-74d011c9d7df	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-2163-d2cbf643a394	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-72f3-a93a5c3b9b08	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-e77b-0d97049a274c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-5bca-b657fac8bad6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-4a7d-d6b696719598	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-02ef-94dbbbcc0598	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-92c0-84f3af57ebbd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-c00c-4ba56d5adbdf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-dd70-68e551b88e7f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-f1ae-17fe315b71e7	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-2b81-9baa565082d9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-65fd-a7d49f80a809	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-53d4-4a9c0a8153d9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-77e1-57f447e8e35a	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-28bc-eb2fbf3f6e54	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-cf8d-ed27ce80739f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-581d-6f526ce1dde9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-d3a9-d2dd3897d270	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-ef38-aba9db198866	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-ac1b-7376899726bc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-ef01-8900e776d84f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-eec6-2bf5b00aa412	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-cfb9-fdc97a968c56	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-df8f-ce22f53d9124	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-4a6a-b7ce47cf4814	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-1574-f8cd6f18ee05	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-692b-4ce632244551	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-4e2b-1cfb40af90ca	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-9ebe-36e7bdb01601	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-6924-1ed0c363ac9f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-de7b-45edd11f8c96	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-b004-4f9863d6c567	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-ef4d-4f2013a37a67	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-0007-b2f2498d7045	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-d4d7-d397b06ec524	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-79ce-9def983d249b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-de76-f3fe03aeaa91	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-9fca-29b5baf6d827	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-e211-de5712722554	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-f134-8d8501b2a4ac	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-9b79-dfb44e18edd7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-7c63-77768bc0187e	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-37e0-a868f2f58a53	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-13ed-859f89d353d1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-7a96-b8124f44b84c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-9fb5-c76c3ed1b492	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-3a32-ea69e8f35784	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-98a6-1d9879d64f08	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-220a-0369422030d2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-f5d8-c03466886775	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-0f55-1de2453fc024	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-83a8-4d82b0f91e60	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-5c11-7d633e7f2f38	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-8b5f-f17e9d87164d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-f1e0-b692b5197421	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-2d3f-e63244a44f8c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-2a86-1de2d33ea727	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-22b2-1038f90af59f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-5322-9a4cb9009049	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-0e2c-b90444854a04	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-6479-cbaf2f9a149e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-a1e2-653997e7e595	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-a088-5af194517bfb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-d6f9-046d739bd0d2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-53fa-0fd18194365f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-43ef-3f560a480272	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-aa46-ace3a8b1b046	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-12a0-f46bb0f47f38	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-48aa-142b5a67b51b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-f3c1-ef2b81782249	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-e79e-bd157d9268ed	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-2598-7f7ad805331d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-2f14-6de6dbdd19f6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-f3b4-4c7fbebdc436	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-e33d-b5ba767c0603	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-ca29-daf745f12254	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-0c6e-35a74f69852b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-8d66-4a70a4d7cce9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-6738-6553dc32b879	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-d0b4-caacb338b7dd	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-48bb-8bfc0bb64a5e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-8acf-fa0c35612933	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-245d-a002001507ac	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-e9e3-941a956a1bdf	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-1da8-6bdff8730780	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-a119-0293d8ab3e87	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-a7e3-b444458fe84a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-8bdb-8e3343c0d55d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-5ce5-5612803f82b6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-77bb-56637a3365e7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-674a-95355de319ce	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-f1a9-73636b554a3c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-50bd-c95e05f1cf3e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-9f4c-36b39133d18a	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-37b1-a529e180b659	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-ae83-ec7f0bdc356c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-a8f4-ce04c18f3a8a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-ec3e-2641446cc1d1	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-db0b-b3ad7492249a	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-3dfc-c64fd0098110	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-e953-e9bd285e8824	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-b77c-2a81bf3a24f5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-64cd-ec388798f2a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-ab16-a1204f6fa9e7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-4a27-005e0f305f13	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-523b-88a56e00f870	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-525b-788c27fb9d89	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-b3b0-e5c7a7ee4570	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-5795-4e7f397852d0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-84b1-ad57ade4c1f7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-00c1-cf7b13198661	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-65b6-d7249f0e50cf	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-dd25-0db27494676c	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-178d-e7a76360aa42	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-df33-3a3585b7e7eb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-4ee3-af57a12c4a58	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-5cd3-ed6d20512d5a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-e3db-ce2263edb1bc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-b2f3-6244f08c9858	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-4bbd-22660d3e0415	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-f3f7-6eab7ef694cb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-9f7e-8a298056aeaa	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-95a0-6ac562e92440	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-22e7-347b2f70afe5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-5001-ff5273b01148	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-edf4-3fd6e4731aa4	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-e0ff-ef6df943f834	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-1bd9-c3236d6a4515	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-cff3-b24a085b5c24	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-be15-785efec6118c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-97e3-f5567a303c44	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-7df3-3c4ddc084234	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-e1a3-aecb681af036	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-9353-e9a329bfe8de	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-306a-8b41146f6639	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-560e-3964b864c241	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-bfbf-955b3580a004	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-83a1-28ea673afe38	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-2810-4b3c9b03b16f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-beca-ba9dcd9ca38d	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-b338-58d84e10b4bd	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-9460-0388eacca915	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-1987-175f00eeb26d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-9cfe-30d75dd03fab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-4713-f037cd3ad2be	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-14ff-aa081f6c083e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-e5d4-2e1b7bedcbf5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-0ee7-ba0260b40e70	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-ad84-255e52a1f6bc	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-13a6-9e7ec6dc9124	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-2c96-2632d47546a3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-e1d8-b01755e89727	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-e516-d13afc0aac29	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-6237-51cf2a2f295f	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-49ac-46c639c6513b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-2a38-b5330686b679	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-1a7d-dad67eea8941	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-f921-2ce44c24065f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-c710-39060488e218	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-aeb8-44ed2832d4b7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-7caa-328bc568ecad	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-ac6d-fa01cf6be721	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-f3b0-ad3e43ea9124	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-88ed-9e790e9c7ab8	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-bde9-00f0b6da9aa1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-761e-438458c66ceb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-b30c-a2e0ecd58497	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-61f1-828f299ee975	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-faa1-39409a9a26ae	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-cfca-258aa11ff566	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-9aad-388a58ed2a5a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-21ae-53c067b69790	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-d8ce-5e244ea2bd0c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-8bbb-0b884a3afb8c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-19c0-838ef0cc86c0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-4903-2c2368c2b89a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-38b1-65d5ec488b0f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-2e71-adcd2510f216	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-4593-f88f62881b81	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-8a47-6e4a45a74abe	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-07b8-fca39839de26	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-201d-9dd1f44aefe6	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-ec7d-f668c50afa0c	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-6bea-f5f8e9a74437	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-4709-ec985cf9e4b0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-1284-6cf96bd87dd7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-8c57-ba7a8a4c5f84	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-4a3b-62b9c92a6867	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-3988-25f413a1696f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-1a47-b3928a75b278	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-6878-17587e27c22f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-d625-a030e9e51fa6	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-16c3-07b3bec2ba5b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-ef37-a9c271bfa4d4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-7fa1-042a148a04e7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-ff59-69ad433a4427	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-e015-b0e29ba96d8e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-ede1-ca641022ef28	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-c0d6-7a2f2676948a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-2fe0-6e3125c28ce8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-acea-06e5bedd20af	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-5cd3-895c310493bd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-8b9d-21d2f2bf54c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-86f3-5f337388d533	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-f2a7-18504ceaa0de	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-e861-fae1125c8cd8	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-c07f-b5ca5be84377	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-994a-16ce6f48b145	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-dca8-2eec3d36d760	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-545c-6c5d47dcf7ae	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-4a59-af4f1f5e33e7	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-d1e2-7fea426b49af	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-6168-f01509eea525	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-9845-e49b9ba2f0fe	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-64ae-1bce3aa93f70	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-a986-3a04ef5156c8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-f557-92d42f97e7c7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-2344-402ac0175e50	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-c6d3-fa0ce833c68b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-5ee7-bd3ff5dc0b27	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-46db-28c5e01bba9e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-a8a9-982b89e8e049	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-b314-c62f293f44bc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-f07b-6633d33496ea	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-6a9c-1674d71912d8	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-0ae7-d876aea9ee62	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-cfa7-2ed46d1ee5cf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-cd32-0a324a0b79fb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-d40f-e4a94501bb82	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-ae2d-c03c99677123	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-0abc-b8eea4cccc1b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-1f14-6f73de688a15	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-7561-12f16857136d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-9f71-c5525591039f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-ca92-b34abed7129a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-4ecc-707398205799	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-56f9-e6ec4232cd36	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-1fff-ff48a56722ba	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-f1a8-5d291ecabd9e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-e9db-c39e341749a8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-f3d7-5c26e065ecba	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-bfa8-00e6f8272d42	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-ff3e-a0ca04faad34	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-6aac-12eafe02278b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-90f9-f9400f8e71ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-61c5-e3c0ea8bea21	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-7920-faabbe7b5e10	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-ac2e-49ea8672dc00	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-fd17-9881748f901f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-1593-41950e162325	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-0aea-9a770ea10f2a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-2146-7e4262232717	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-4d57-6533cd72f220	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-8d89-98d686aeb335	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-2211-1a868ffe075a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-923d-41820894a67a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-3a93-b61798d8563d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-06e5-8d797b60589f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-63e1-6933e0fcfef5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-a70a-63ea78055e35	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-b5f9-f63ce568310c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-5e96-41bc138cf232	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-ec83-d9f94d48eabb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-a21a-e8729b7b2517	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-c123-cadee82722e8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-35cf-09309e2b6398	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-0f2f-442e4b205dfd	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-fec9-c392e0f9ff53	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-5b75-15ad4b4f4985	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-1c95-bb8fde81e991	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-af99-182f80317b5b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-6714-d4408c5fb2f7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-b612-d7b3c17684b2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-cf88-714982d5f68a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-c29b-3170e08855bd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-b7a2-a20a8478cc92	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-b3bb-3cec08c2e0d7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-d611-fbf0a995a3a2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-74cf-45e5ea317bdc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-1c7b-e2a74fa13418	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-8df2-ae43b9b43962	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-949e-e6c9866ce94d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-f944-f6864cbe63ad	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-62cd-349c9c530c26	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-b121-adb7d0906335	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-62c5-c928cffae7be	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-9ffe-064cd8eef29d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-3738-73bb4e666257	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-6d74-b3c6ac088c0a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-1ae0-17d305c6975f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-71e9-7848cd191f22	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-6ce6-d5210024c3fb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-a8aa-8a88c2f77393	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-8f7d-9c4dec7cf362	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-5d5b-246fd7673a56	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-7244-106804ae4c05	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-d648-ce57f9bd6d0c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-9b61-2fbf981184a6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-b10e-5f3a8258dd90	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-b1fd-c185eb3d081b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-d24b-bc7025e157a1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-0749-f639f8f60a77	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-768f-c34f0d6c2813	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-f268-25bb8b891efd	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-d4db-5dbf0a3c14c7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-4a71-748d00efead6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-39f7-d4b471bb7073	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-8f86-03aac82a3bc3	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-7b0a-f071652afe4d	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-8f25-0c7e2620a28b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-6ca0-d0c9e3b84221	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-f328-6c69dbfbb397	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-d42c-f05ff3eb0a64	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-8fd7-a7b886c8add4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-51e0-e71262c97a61	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-c7d2-cada46629457	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-4034-cf5ee1db05c0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-4411-e1db2abb0c3f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-0c96-5703629180f9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-3c91-7af5b316427e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-c982-3b636f14f8d1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-178c-f0b738df194b	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-0386-dc509d302394	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-af2d-09ecd8d07baa	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-a266-6dd5fce6c8a2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-872c-b083ce20d1e2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-1997-fb6a405de38b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-5bec-6c58d36cca5f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-5528-199ab3191096	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-a13d-12c18cf96182	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-c223-5fd0dd0c7b2c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-f315-da417cfe8315	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-d13a-40e639d81de6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-5a19-d6cb1c8342ac	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-4ef9-658a6c077533	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-adf1-816416db18a5	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-3502-19261479a6cb	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-2f30-2b431fc54d29	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-6141-e21a782a31ac	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-6f45-e190769f975a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-c6fe-59781da7dabc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-3eeb-80528e9090a6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-65cf-4e2bad7a398d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-ab7b-d3c343fd80d7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-0121-3d4c0624607a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-e98b-56f7aa33ce4f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-e0b1-6241f553380a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-c7da-c6895f384171	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-32c4-3266dba46383	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-6890-035bdf98e93e	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-8091-1aca2ae4bd6f	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-46a0-cd797720d070	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-794b-5b4b57533000	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-e5f0-794c760a9221	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-e41e-ecd5033dfdde	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-b31b-8e6830391597	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-44d4-4f29e6500bb5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-b402-46196a75ebb5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-2c9f-8cdf4b59d109	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-91ed-413f5729ec05	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-6df4-3caec4efa418	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-9641-eb7ff97237b5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-63e6-e7b73c0194f3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-175a-52c564326253	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-7b30-a70a830af83b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-7222-a84137511994	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-1d03-5750f105967f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-5ebe-11f40d5f13bb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-7464-f1c848be28d2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-cd2d-064c2fb23719	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-d80c-dea80241fdaa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-f775-3cf4edcbf26a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-1520-7efed43ef672	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-4d4b-45f7932c3c23	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-a5a0-b07628dce3f3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-0d86-469db15b62a5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-f9c8-b2d55e208945	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-b68a-755362f97b6f	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-3468-d771b144b9e0	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-5b13-1d3ba2d69a7e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-b516-eaadf44a3e30	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-c828-49258f017337	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-da57-3eb12ac55f58	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-17d9-7a89339750ac	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-fe89-99ff7e742ab4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-275c-7fa3f16582cf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-6e7e-690b1a4ea1ec	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-3a6f-fc8ab59b32a0	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-8a30-649e0fd5958f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-6746-8b3744e9a44e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-1d6b-5db2a651181b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-ca0e-553644e2eeff	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-ccbc-a56a36ecd825	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-f0aa-2c9fbc8074ad	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-07e9-a0bd702dd480	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-1721-ba41a90afa29	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-72d0-4a7f9751821b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-fc35-12e9355ccf68	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-04f9-6762897a4d87	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-acb8-74ddbc7487c7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-cdec-c05be6408ee1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-ce12-fc30fa2ce2ad	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-9ac3-e13537abdeb1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-02f7-31b5cd146aee	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-ebf7-9fa6efa3ee2d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-3723-87dfa76490cb	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-6c9f-24c63e09b9f3	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-77a0-3099027493ed	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-766d-aa207b25bd26	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-8b50-ac445a91fa67	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-5536-da9e3e9cd18e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-0e3c-11e82bc5705d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-8818-b50bf244a517	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-4ac4-9e4b2f655d2d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-f4cc-5776d7b14667	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-1f7c-e84a350e326a	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-6335-41a439322230	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-2324-bee2bf0dd4b6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-0f22-a08f27bde179	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-44ba-fa32756e1fe7	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-8b51-ce670cae7e8f	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-6ef1-6b61f2b83411	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-14cb-7ec73362f008	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-cff1-38369117bc56	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-cb37-e4d3820f4d33	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-017a-fc39ae54dafe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-4bf0-cd714fb0e8fd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-cd69-13013810b8d5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-62d7-af392fdc1879	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-3e81-8f1fc1a71f28	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-41a2-1cf772f500cb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-0424-cbdadd22503e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-ff1e-bd24adf87cff	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-994d-8c134ca2d06b	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-ef65-7dc5e902b50d	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-e90b-d7c66ddd35d1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-7092-c7fa636cf28f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-fde4-d09283f61139	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-01ed-41a99043f605	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-aadd-3f1d897dec9e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-24d2-e243f6e8a6fc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-f032-9306d02b9865	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-976b-fe74a42bd776	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-0384-d46ab23e4e83	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-5786-76e06d0da06d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-2293-544861a3bcfc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-2f94-7cf932a7c900	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-a3a9-1f329d6cb7ad	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-816b-50221588aea1	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-0ff1-da38d867a0b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-9416-d6579e8f73a1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-0315-a24b79a20499	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-cfa0-2451dc0b233c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-e303-41459f0e8d38	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-4be6-7d2db373fb16	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-c00d-32b70f7f12e8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-e701-b6172f78963b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-3cc3-cfcc7e4ce02b	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-0a67-a9e11c4b9eb9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-fe2e-3d0b89ba98c2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-523f-f70f7713ae98	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-8f3c-cd29a8879353	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-e6b2-c9b523b6bf39	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-e505-b4ce5ab05d2f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-8851-060f0a0ccf30	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-ed89-5b9bf631e572	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-a26e-808eacd53991	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-acd5-dc4fd39cf74a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-d5c2-036bfcb7b1e6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-113f-a07751d2c930	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-baee-8922da2a00db	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-6d41-93e04f63e0f1	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-3341-609abbaf9648	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-89b3-68153beb38f5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-7ef4-b49839fd73e5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-7a30-136430953d23	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-420f-263443cf6a94	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-8e2e-ff3d1f49baa0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-36f2-cf1f763ddd22	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-7b3e-5697af7378b5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-2727-791cc328e34e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-fb85-070f6a30eecb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-57ee-8ee9b246724e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-8a0e-f59f15f7f79d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-0e1c-66e9198820ac	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-7f22-5f695fff33a4	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-4e7c-6273e677a915	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-1d42-c167945167ae	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-cb67-d23cf1cffb3a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-b4c9-adad6fe7f78e	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-7afd-cac3852ede51	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-6678-0f02a50cc30b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-d9bb-b2b270d84c39	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-9f3a-9655fad3689f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-cb17-a6d329f3eb32	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-72cf-2aaa536dbe01	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-3439-8c82be06c1af	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-68d5-803a5354a90a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-f322-826a8821c1e3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-7959-46f012f2c2c7	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-e0b6-365c53dda122	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-86d6-81d35ac992f7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-09a1-ef325e119f82	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-821e-37a5879afd9c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-a74a-00f7cb9a05e3	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-7e0e-fd21173406eb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-c1eb-cc2a4dcc861d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-fcec-b220c8c7f4e1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-0c38-15566eef4f81	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-a55e-1fd70c48cdad	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-156a-f67e635adf82	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-c2ad-7331566a0c33	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-b849-f2eb8e10e90c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-b61c-dfb83b0e852f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-7514-d2feb6a941ec	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-ad33-19dcffb9f8ed	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-f0c3-4f8d4a913005	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-7e78-973847c5ef97	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-1ecb-41bbf9de26fb	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-bc25-08e221eea4d3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-cffc-8e7b1955a6ce	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-d477-aca869b8099a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-9d44-6efe3ef3fd56	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-a428-629334ae89ce	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-4916-0c063b362575	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-08c0-be78a5b6554b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-5fc6-23287c10fd9a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-e765-b53469a543de	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-13cf-b5db50197829	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-a0a0-0cd5c63c80de	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-6868-f2f7ddf983c3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-a6e1-a6f3829dab44	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-f0ec-75c9ea7bedd7	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-d142-806e7de037b8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-28f0-87fe6c4e92a3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-7808-aea5b9a733fa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-fad9-9bb7b065a1e3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-d76c-79a5d22f0644	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-6c83-8ead33503a5f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-46e0-38014764f904	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-6a38-48eb0467f182	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-b876-a0f1c5536b6e	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-07de-8f5352b131b3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-3ab4-9ac279213839	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-1c77-ddba8e9cfc1a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-4baa-023a4c7f0e78	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-d6b4-1425c94a4fa0	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-965b-e87af849514a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-ad47-3a9662b20e87	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-f116-02236c150393	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-9b7e-9f445af3813d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-4813-357e361d3482	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-5076-045539ee0852	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-a8e8-b37288d12928	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-64e7-c8b0bd98085a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-aa49-ba75c95a71df	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-a9d1-8d56db6f8b8a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-12a3-210460fc4a43	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-1428-b6653625502a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-55a3-e87c9f67ebd8	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-d192-2411362da48a	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-de21-921876a79db0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-b7a4-273a7907792b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-4d31-03a8961248be	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-f9e7-2a6f8e854421	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-ece7-828a34c7dac9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-ad4d-6e817a151bfd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-2271-496f82e94c92	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-8cc9-b97f33ed6593	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-a770-6ff0509b59b3	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-de8e-1a34a4a752cb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-4027-7243e54a176c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-c973-56bdc82568c7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-5dbc-45a606405d91	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-e0bc-a7b4db6020e3	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-a130-9b528530252d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-e8dd-49e85c0f80cf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-4afd-98335af89681	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-cfe7-42e8a3cb770c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-9fd3-82251e15c812	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-ccb7-38fbf4a2cfbb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-a3d1-2ea0d351eb55	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-64ef-72590620f197	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-8178-a7341d7e6a8f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-a656-247bb3d2fdea	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-8b2e-f78664a7210c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-b6e5-9f3baa2a0732	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-f4de-c1813faeaeda	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-1204-641b687a5d0d	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-2e95-fe95fa43d45a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-2659-4c012bcc513c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-dc8c-c1e6033fdcc1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-dff1-8747d3482a77	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-134d-7c4f5d83da84	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-85a3-2d06748b4aae	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-3504-30929c6b2b7d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-6f55-e7bbc5e4c591	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-1d89-9425400f3858	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-c0dd-eaa27346f9ff	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-1ddf-d9aea4b10936	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-7eb1-3c53388e1766	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-3676-e262208bb1ed	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-15a0-26a955996a8b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-cf82-11a25f23c231	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-b707-39477de729cf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-b29c-557d787d306b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-a860-0c87db23dd6c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-3362-b7a43125d9ae	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-58cf-b1fb993b9744	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-4e5b-66fb108451b8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-0bc4-ea9b94717928	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-9565-66bf4a1446fa	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-89b0-b7e7246d54ca	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-25c4-c50988f23ee7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-6ec7-14b0036bc3ca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-fd8a-382ce6d01b72	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-f7e6-5b452dc56595	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-e63c-f51b2732ee08	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-5212-a611eee01e83	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-ef45-6cc9d1febe1b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-b3e9-16493ce886e5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-546d-06394b8888e0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-9871-6d8491cf1ba8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-9b45-b3664ef6a368	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-d509-c791e441b873	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-8c14-643539868ce9	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-1acf-d8d1b63c3f5e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-967c-ad1656d6eec6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-daca-6d57114725ff	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-1be0-1e0d1d362dc9	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-e3f1-4df73e8f16ce	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-8b6e-25272aec6abe	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-40bb-72c3a730e28f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-b095-ba830142199a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-9d76-7b2bd6c55315	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-cadf-869cd66cdf42	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-c793-64e7f689cd1e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-b58b-49e577271a11	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-6fdc-8ebe5aa4819a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-13bb-ac76a696f78d	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-79a0-0a5a32559ded	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-28ca-f003708918c0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-6553-0a34b7190d93	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-160d-3e2b57321130	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-719b-98518c7fc311	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-64de-b8419834daa3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-dd26-e350dda84b7a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-cfc0-677fad80b277	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-79a4-6270972c2cd5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-c49f-40bdd2d52d49	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-8c2a-aaa00dc976c3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-2ae1-4621a51b8a43	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-dbc5-81ca5517fb8b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-d6e4-91913c4cfbc1	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-1077-9d405d0447d8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-c05b-c0ffb57196ba	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-e73a-0b9f2a6cc050	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-a4a4-799f5de8ad6b	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-1591-90f3505de3fa	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-040c-4cbe9bd31019	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-c75e-54a660cd48b6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-4aed-c35501d9cdf0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-a5cf-bc58e6581818	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-9c8e-1c8c631f6278	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-5081-b6000f0c9342	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-dbb1-cb9fc3e63620	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-f0b4-74baf40ab5db	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-05f2-415ce665a5ea	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-d198-740f0c9bc22d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-f966-bad932fd0d76	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-429a-0e4cdbbc744e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-fdee-8f732b230cca	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-e7cc-dee636a56ae7	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-9568-b1776526fb70	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-78a6-387598260699	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-9c23-ae6f9ec84dd9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-5610-f22970f2998e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-1853-74e80a6154de	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-9d92-604e407e8bd9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-8d33-20d5b685c182	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-ab16-a2dc01d3313a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-965d-16fc42f51d11	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-df73-c5e3d32ea1b3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-1959-3f2d4e2ae7fa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-bc30-ddc4cef655a9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-ec35-03d82f46a36b	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-b088-018cf128e144	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-8c27-c11da4ef2388	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-05d6-8a15edb8b533	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-dadf-67ffd9e7adef	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-5b1c-eda67c5bb7ad	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-58cd-e2ecc9b472fe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-becd-2c8555e0d046	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-940c-26bec6c4dac1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-77da-cb91517749d5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-ca51-04ebceef2653	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-7292-bb1b9897d188	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-19ce-b86479fbb2e2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-e1df-5bf1116c2840	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-0f84-b2bea81e29a9	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-9730-2b41385e48fc	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-c4fd-0736c2869b2d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-5f6f-a907d4402df2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-96f1-76cdce68912d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-e162-7fc8981aceec	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-aa79-19d7a3ea0a89	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-3b24-84c8b2a51641	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-a509-be537ee4b929	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-0df9-44d4be6da13b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-93ad-3289c483352e	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-67a5-40fde1086ae3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-1ea4-b3cd5598dbc7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-dd6c-92688bd13bfe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-4974-4513b76b00dd	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-95e4-9c773c268848	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-cc9e-a3bc567ea83c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-1680-e04eccf48cfd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-0a71-1414ee0a27a0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-98f3-46a667eb9228	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-4b76-2a702a54f7cc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-f7c3-b1831df1884e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-1878-f281205896d7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-1fec-eaba850c3cc9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-d929-ac764716525f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-11ab-cb7c29fb60d1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-3b49-6b46f8c49f12	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-79b5-67ef366f6cec	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-fea2-4e52b9796fa7	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-2692-51f200cee1cf	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-49f9-6b944047b3ee	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-256c-09b6dc01c9de	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-2e7b-87ba22fb88e3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-9963-8f1f44aa3997	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-63e6-4a0a4cfa5018	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-e40a-39246125414a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-ac41-630f64846385	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-6320-635b83d93a06	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-92fd-5b5ac8bb3f09	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-3859-b79f28bedee8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-028e-a5c8b66468ac	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-09d1-cdd1481d4002	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-0157-ad05f3160876	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-54b4-95dd2acde71a	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-0a5c-0117db5aa759	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-2b57-33f210f78997	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-747e-522539f7645a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-c32b-f177bcfe43db	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-a195-fdcecf028652	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-190d-6a906411da8b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-6c95-741b265232a9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-1cd0-79e611f443e2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-14cf-1734bf8069aa	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-7f56-b10bc3eb42a1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-559c-6c5d1457a651	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-c68c-b292d0d81123	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-92d6-dbebb43e13d3	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-b95b-dfe14255b920	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-3af3-3d57378436f6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-a75f-b5b2cef51844	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-30e1-ba3c0e49e439	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-a0d2-5d0ce0141845	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-a47c-e66f05f99b0b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-3304-bca830fec6a6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-59f4-8b6b6ea48bf5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-e2d4-e3fcc83473e2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-4410-d51ebfae74b7	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-ebd8-e188dc3748d2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-d574-a9ed9b53a107	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-f6aa-69e261aa8610	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-5447-fdb7fea9571f	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-357b-1cc6441b8eaf	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-70de-417a88495621	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-d501-828f3f35293c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-60dd-d6f6aebbd2c0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-e1ba-dee44ed3e2aa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-825b-b044bf53440e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-1b06-464518514157	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-8f96-8f5f22f6b7ee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-d64f-9e046bcc66a3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-ca70-3e0e25377c47	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-e9a0-57cdce27218f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-bcbb-ca58624e8b32	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-a323-644698121eb1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-efed-b2160a9927ab	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-85b1-c60c68831aae	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-62ef-a2a15faf53a5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-9c29-4bbc65ff198e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-0ac4-0dcc3a27a92f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-47be-3fd6f03ced5b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-3316-823032e677a7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-9e99-7be835bb6602	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-d4e4-4c53223b62b0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-59a5-7e4ffd0ceaa0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-cfc9-569183edfd4a	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-1a10-5cfa9e2b8625	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-0415-15338c9c6e44	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-9dd4-4c16f8cb0d2e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-8e83-dfdb8782b404	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-890b-909e8a5cd416	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-4c20-dda73bf57209	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-a53a-1fc511e82607	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-a9c7-771ea14b1ad0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-7324-cea3361e52f9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-a3ee-e71c1c18ab32	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-7636-f6615baed54d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-1ec9-eb7e93be46e7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-f1d7-b9e8059f34c8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-99bc-4283d48b7f56	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-2c3a-9a9867f4d818	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-9750-566ce8561687	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-dd75-f441454c6597	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-35aa-8347a601a8cd	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-f323-d0272656dd2b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-3bf2-58a168ae3640	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-3bf6-772f3f47fd94	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-3db4-07cbe7626a01	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-ea50-b700e6aafda4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-ed85-46045322bfc5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-8d9a-82969053e98a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-5899-89d245b804ee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-d158-e9b8a01e012d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-e5f5-a5584d57fdbf	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-1623-e0db4df9e822	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-f974-7f59c96848be	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-54e5-5f57fffed95b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-195d-7e43f6ae3fb1	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-325d-ec5d12d6b55f	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-3d8a-2f9897fba00c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-8da7-238fa6fbc0b4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-6902-559e710b906d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-d4fb-3f412d82b014	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-febb-56fc79966878	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-96ec-fa4dff1cc8c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-a319-75221ada0358	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-775e-f62a2a6b6d4c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-dad1-bc4a765b0db1	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-4de9-29d2d17a6f6e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-2b94-37b6d9b60594	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-99a5-6f52212b0485	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-50ef-ab7d75c008a4	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-356c-dfd42ad9cb55	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-ee95-cccd97c85eb5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-0420-35cb133af295	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-7764-2dc44dc9a9ac	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-9568-b73caabb5f8b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-0469-822ecd562687	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-6923-a7e89435183f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-1459-6db13fc04119	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-257a-db0a4b62c314	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-46cf-b28c7eaf923d	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-0c38-ae31511f34bf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-600f-f624c1dc933e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-cc55-768b443094dd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-056c-28f6f5235932	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-5818-63dedfb48fa1	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-281b-f8aa14314de2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-b889-389f5efb8f0a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-6915-121e8c361174	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-f3f2-6a1edb691fec	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-7314-3bacd39de409	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-caec-9f2081cd35b2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-7edf-015821d62120	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-67fc-d6fbd6c1a40c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-504f-c8c5c26328c5	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-4d73-f4c866580cb3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-6825-58db2a4762a6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-27fd-1ff75b9a7f69	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-ebcf-793bb9c84794	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-bded-88907d483f7d	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-f645-a733c3aef4a9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-7cb9-29c465c67fa4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-828e-660e73bc1302	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-79ab-093e8d3bf261	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-c58d-e865e04d0e59	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-a588-c3ef1ac6da30	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-1c64-35bf83d04af7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-4ae2-05c1ff022a69	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-18dc-ce70ab313684	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-0f07-4f1dbdf69632	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-7baf-14d79c180faa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-c596-b57bbadba72f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-470f-9b9f0992a070	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-3233-555cc763d299	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-f7cb-5218b57d849a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-467c-dd96705f13f8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-c19f-01e26baa1539	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-37e7-65d27cbeaf29	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-2c72-949c5204ac06	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-d188-97eaf49b3125	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-0669-a4802e2e314e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-88ef-8d510ed092aa	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-a1b1-762c78582c58	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-3144-160adca5b959	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-6330-b8f3c83e8b24	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-2b01-a80cdd3918c5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-93af-d3dff5d1cf4e	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-18a6-ad85ac08a103	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-2fc8-359e8ed98d77	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-136c-04f1bce254c5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-62a3-10b2fd03e11d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-9b9e-ec21378b540d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-bb52-aa0910eef9f9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-ddf2-e060ee4a82b0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-26c8-8bfbaa38127d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-e574-c3f596a3eccb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-1921-259f398c2cb7	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-378b-e077e83519bb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-f78f-b3cbb73851f4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-105d-15e6a03511f6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-7d34-cc938f9e0e21	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-9c79-f267ed637dde	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-4d4b-a34349f0687b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-d41f-60fb7993e700	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-94b2-1beb4a28e125	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-f0ab-1f28cec338e1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-7f3e-54af44ffe509	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-04e7-4fdb033d4cc5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-6866-155f3c170d95	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-7de4-d857ceb86d0a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-caff-7a5d87d9adf6	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-bee9-506f5bd3a1b0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-bcdc-73cf40ea1371	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-70b3-ab842354aa0d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-0932-3eb6eff9245b	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-3751-5e657156bede	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-4382-268e1258bf35	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-0c4a-5f64fb6c27cc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-5c97-34cee77a5000	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-d445-2a2480b2c7d3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-2ca3-f58000216b80	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-ea8b-a058802e9fec	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-7934-410912de439c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-4609-39633dbc5814	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-df6f-6062ac4ec1d5	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-42ff-56209c6faf3f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-9872-3deb07455432	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-a82a-5e945bd973b2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-db72-6b7b8d9ede3f	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-1fe7-d71016e57781	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-436b-cf4a919427d6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-375d-2282f8450444	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-d353-6cee7ed1270f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-4a30-7e471ee62cfb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-6575-098bd655566d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-8701-20c9588b720b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-d7ce-0b504bf225c1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-dc93-b2f0a23f07a9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-b95f-025bfee933ba	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-7e9f-fd61688c1809	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-e781-1b77d0c5576a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-db2b-e43bff7c2e9f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-49e7-7e7789d615e5	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-77b0-ad9938800b6f	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-5b6d-6e0eecc0d669	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-0809-1006f22329bc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-7607-ebbe7234ec9b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-6ec0-aca23f61d429	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-8537-2c2e9bb56722	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-dd5b-23f8ab3b3ea1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-c0b8-127e3ab9d3d4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-fa85-22328ce1b062	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-a635-b2abebcb28bb	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-153b-4b11567d41a4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-999e-4cce12a2c8f5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-b86b-4cdb58378487	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-a405-90a15cb87bf6	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-beeb-2374e48199d7	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-c312-01a8980ad6be	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-44d1-0ee60f8ecfbd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-8f69-8c1b1f071c56	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-7fbd-ee1cbb5fa90e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-0bf9-75f433113a19	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-76a0-15b55538b31a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-e4fe-ec1914e3a2c8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-5822-72b2f56fa98d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-9726-cd89b55ecdbd	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-e100-52a41a5ea1f2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-f78b-f4ad5a07298f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-4bb4-815bc7597424	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-f8fc-fac83637af41	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-c402-5e2fb7ce6dc3	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-3a1f-af670d447006	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-639c-eb8a8398f17e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-91b5-1303dee53908	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-61fb-73a295822d80	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-14aa-a2b69b9fe050	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-0722-8ad257a63fbb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-c7a6-1bb906457ac1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-0f55-397f80579810	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-9b0b-bd325215ea0f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-0132-807e13467fa6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-c338-9c5e3788fd42	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-2eff-1c93680f9694	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-ac52-26b5fda47dc7	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-9cb8-5511e74c9717	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-7edf-9ad0a9596218	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-c3a0-1eefc55d8b82	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-7109-18f26ffc3c90	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-d004-58d77b871282	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-6df2-c706f83ae4f6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-2a2f-49ddc68d1b9d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-6a51-99bf72ab2654	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-d189-87d27649efe4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-a868-0ccd732c703d	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-f36e-80209f67843f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-65cd-412632971221	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-5b49-90446ace9585	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-23e4-10c88fd57064	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-8cda-0239de954dd2	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-476e-b202230cbda3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-f2f2-013e4c255bd3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-027f-53fa16ad23a0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-55ec-956052208fca	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-b809-ae07893c45cb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-ab76-573092e779d1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-52cd-b91de8c03e8e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-73dc-47d3e27f5a36	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-8c4d-5b06095121d5	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-6de4-447cd50251cd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-f811-01be7321cd68	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-cae2-cd41d025392a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-75f7-16c36a903cbd	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-35aa-3c9c072154d1	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-4839-c71bd5276146	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-d15c-ad6362390628	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-eec9-c8bfc92b5f6f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-9695-091a7039c2ec	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-da44-c6b02eb8fe37	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-0ee3-b4d869d08ade	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-cf12-6e24bd58d763	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-2890-65b12a8eddd9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-5daa-0beecb9a3617	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-4520-b7b12f14e3d9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-a97f-a3c6305c321e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-c999-d97d4fd1ddc8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-9684-c2521840a717	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-906b-13c84ce7f254	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-359d-37da86c55081	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-9fdd-00712da17c3d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-bab4-2cca0fd91880	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-d317-7ce3242cd4b4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-b903-5ac1f2791a22	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-0d66-90f92a300bb8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-9e0c-a5b3d5bceda4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-2503-a765bb009301	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-a5dc-e80f43f47851	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-af20-55e04766796d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-0c94-d42062ec22f7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-ef4f-f0b2bdd19e86	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-fc13-7af76d333b8d	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-1acc-427f5048b0f2	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-8da6-761d7b64cc82	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-2c36-0812764cfd19	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-6429-a25fcae6e68c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-2f97-215697138611	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-4b36-6c635094d488	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-cecc-6d7d328f780e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-300b-598184675b0f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-958d-2eb023728193	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-fd93-e5ae82e89fbc	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-ced6-a08bfcadb082	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-ae17-4c178b93ba78	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-62f2-04766d514bbe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-4690-7be700a7c931	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-9816-8c56f1731337	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-a62c-a016e4f384df	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-3613-6377d869c293	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-c722-846e9569b89a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-7087-f11aeac57d2b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-3950-492b56281c3c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-7755-136f0564f321	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-9080-696768aba1f4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-be00-dfa5f8738347	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-6c7b-4be2e8798fb2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-c5a7-7749bbef10c2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-9366-9509e7ce8577	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-8f4b-0e4d7a59b3b4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-831a-4796ba137b25	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-3bf7-620193ee0828	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-07eb-ff877f7f11ae	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-72bc-5e7bfa4ea65e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-51a4-9393622eed22	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-6904-5ef651ab230a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-de21-94cca3613bfe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-b43a-56425278331e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-d7ee-3a3ea09ea739	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-8bc5-f54b92f440f2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-4a49-ef7266f51a8b	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-0723-83b223c6a865	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-156e-c01c5744406a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-01f7-2423a91523f8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-6835-5fddfc07d45c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-3fc7-bda0ab425797	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-e910-3deca0f2eb18	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-31c7-4338c86964a5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-2c09-919e5f004654	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-1268-13b36e1cbe41	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-9650-9d8d1beec067	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-0caf-0faa3997e514	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-c056-b685ba1884f4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-a776-f417498970a8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-0888-7cde6ff87c48	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-7784-ef6e731e4702	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-e5e4-80e6211ebab1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-e5f0-08b21234cd96	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-9c59-568442469c3e	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-51d6-01107cf709a3	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-663a-f42201491f4d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-eae2-e8631380d817	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-0723-5dd9d02c5a21	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-898b-0f89ae189cb4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-a23b-437d8a407f33	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-5a26-3ea6d2fca458	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-888c-345d80cc1ed8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-cf27-442b9dc0c17b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-578d-20ea0191ebf4	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-a703-3437277a3910	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-76ea-b713efa1e670	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-f052-58b6fd5eb369	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-b8c6-639585e6fdff	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-3769-be765c3be083	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-f2dd-36e49389ab1d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-a0c4-42971a088f9a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-b05d-199c3df24909	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-b0a7-96e0460c7f6b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-039f-e7530e077093	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-1ee0-c89c28baee05	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-3d2c-0dcb6c893b94	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-fee0-0c6592d345c9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-1399-1c581e21b6b9	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-f511-6dc3cfa227b5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-dbd9-0671c4199269	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-e7da-140ab33d90c0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-15c3-80648516c288	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-0e15-37033ad42216	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-b061-8d345af9d26b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-b8c1-9eccf744262a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-e963-d2b53d5c07eb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-643d-c53bd385ee0d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-7c07-b28a223c5f05	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-b0a1-7cf40f5f155d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-3451-5e1f4c0dd99e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-e8e2-a7f173b99115	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-2842-2410dbf68bbe	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-fa1a-878b1817383d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-3db8-1b82ed69232e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-6c04-33e2332c63d7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-c481-0a88cf53c211	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-d9bb-d6cf2f43820d	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-1732-81f6d9da845e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-32c1-99a8ee226fd2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-b845-c8319bef033d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-3e74-2c9e00f56821	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-e0c5-df8e5677281c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-3048-040782632874	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-0a0d-9b992fea5992	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-17ba-fb5d0da8fca4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-87dc-2220d5f80354	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-f6b9-7429980a8bf4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-02a2-3261cffc0f70	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-fffb-ee641891ec00	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-5e6d-faea596e3005	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-eed4-3bb2be06d809	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-7d5f-8ce1e7bebdb1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-d0a3-0ce843dc73cf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-46a9-ae81ea36a8c9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-64a9-9dd23516dd14	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-afa3-23ae6dc79e7a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-8411-aca97dc97bae	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-709a-858f6f1f4a45	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-6a1d-bb808ecaaf18	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-d289-bdd0a726b1ce	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-2616-9281c15c558a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-25d6-790be691c3e2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-ba63-eeebfa9f2c13	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-2d5a-bb88f8a6f16e	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-9f24-22a82859c773	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-990b-ea48765137ef	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-4512-920bff68022a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-3523-9f8ccffd48cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-e6e3-6700ece116fd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-ae74-8d23ad21287f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-36c5-3385ca1eb935	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-6c08-997f3105274c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-374f-b1752fd8a023	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-7683-81512916069d	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-74ed-5af651a60103	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-48f9-6268e3465647	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-2fdc-6d032e1d9448	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-5d89-e3c3bde0ffa2	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-0b28-6f8babfa8dc3	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-6240-32fd74e7c494	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-ed05-57e24a16fae0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-9207-f416b3a43a3e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-f457-8eac4d099b2c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-d472-daea9aeaac33	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-219f-55eba2bb78f7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-fee0-33c0e7e515ba	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-d1ef-3ffde0fbfb1e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-6b46-d1cc423a530c	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-22ed-aad02de1d412	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-7244-08d6168608c8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-332b-35b012df6a3d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-49ec-ec6944c6a641	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-30a7-a8dfae29f57e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-b7be-69e50a720857	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-c37b-de648cf1f35c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-1348-2b14da9839d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-ec99-0f42ca1cecdc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-41bf-143cac75dd4e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-a733-d71107265de9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-912e-d82b1b6014a0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-621a-f7d7b851e213	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-b839-e997e59ab22c	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-69fc-378856ac4362	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-c130-484f555d89c0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-cf4a-1fa36a1b9dc1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-22e8-d634c6e68982	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-88dc-1875a37c3ece	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-2e42-8cf9b11ef9e7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-a016-f805fc10c6e2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-95c1-e61c361ef023	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-5695-06f6a509f0ba	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-30a1-9bb3f6ff4147	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-6195-101b80fd6800	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-abad-e77a0e7fb272	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-7110-a38ddfb808e0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-40c2-b69e90501304	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-d75f-5312b7de0a3e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-63c9-65c6d39182f2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-bb43-9be4a8743c9e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-1137-b1678dfb08fc	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-548e-e5f371cda226	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-1a3e-3f50af486f20	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-5236-83d11036d826	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-08cd-3c0ccae694f8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-6df3-1b2ff43332d8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-16c7-c74c7c79136d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-f235-fa1a5bcc1f37	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-b505-afc8315958a9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-fe3e-0c8681403dbb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-cb2c-a3795128378d	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-3b02-72ef17441b34	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-b881-a84ef9cd506d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-8bd1-e9ca706b0528	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-102a-73e6d394f3cc	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-ccc2-6673f9bc0c04	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-cfe3-54cbdb8c43e0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-f308-878c57094052	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-42e6-fff2fecdea67	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-fb93-11d6121ac8e6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-c6cd-9967ce7abf3f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-cd05-7238377ff472	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-6bff-cdfed3aad674	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-d28a-8e370bbee896	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-14d0-4bba7b0cad35	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-1e63-71617aca01be	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-42ad-b294283e1773	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-9d05-bbb3c8646715	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-87cc-761c5fd30e82	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-819a-e695d59c1c83	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-ee98-28ec810df6b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-0fd1-18834e827188	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-6f95-5175f948742a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-57c2-48bcb1fe7ecc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-db90-c45c15662529	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-49b8-52c6fb27cf18	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-6dda-02fce4b0465a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-8730-3ff752d7357a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-fda2-505cb317f73d	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-99d5-8a78755d7646	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-a06b-3b0fa3c5b372	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-6ee3-08c7ca2c4da4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-b593-f4b58ede75d7	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-1741-455a99c68cc0	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-0ac6-e6acca0dea18	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-0cef-611baf877a85	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-5eee-c07152743cba	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-a14b-2e5ca2a3fbe7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-a268-4e24b9d2381e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-2920-a0c1e2dcf6ea	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-e3b0-eed620272a5f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-adb3-3147b55fc4b9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-1631-a161e03eb71a	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-e393-07b95ae74655	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-9c5a-79e63cac96f9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-cd16-1ac3543705de	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-8b74-8dd7bdd0da09	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-b225-06d923f8142b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-f3dc-8295f7700f1f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-fa92-ea91da5c1957	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-836b-a6593a221912	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-95e4-6de71b097ad3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-6adc-ae78c86d317f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-667a-72ed2cf263ba	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-4476-063f3ea772bc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-36ae-44bc2d42a7bd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-958c-e51ffc91e2d5	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-b543-4eea6d5004d4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-591a-9fb05a58398c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-bc31-8e9b02a38517	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-96e0-f4d2c1aeb4bd	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-a566-fa28eec3e5ee	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-4c74-1c311c9fbf02	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-50d0-cf836377d3c6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-7410-f8370a899562	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-9a4d-898a85f4e1d8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-0ec5-1ba3edacdc8c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-5e6c-339923cabfe8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-4e98-76364a0e76a9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-e008-434a7b5397eb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-51f5-5b3eb9c0c7e9	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-ab86-7bdf2b5da269	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-816b-1639f089d461	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-7124-2ff09d643b70	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-22b7-a4ce01feb847	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-5f24-3eb367844751	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-377b-c0ea30487cf3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-3089-ec0fd409a925	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-e007-7392b71e813c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-df99-f25382ee7134	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-4dae-40730c24b4bf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-f002-61c6a3567d46	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-b97e-4d5fb31437d1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-0b70-13113c215080	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-64f1-9999648380b7	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-6df2-0efaf6672ae6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-3129-517c28c1e1e4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-6bac-9f75c1f23471	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-d176-0f5b2a333393	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-89ff-27f2ac2fd4f8	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-75b2-56bb54c799d4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-c8c4-d6059b130a9b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-cf72-cd7eaaf22b96	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-c3e1-fa13a16acf66	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-045f-931c9f4654ef	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-4c00-de8aa4bbc52c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-fe63-3d195a205843	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-954e-d86210726bcf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-0fac-cbf3c493a217	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-aa65-ca43f16e681e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-e009-cfbe70616f9b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-552f-df3efbb82819	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-3863-c38a233ca3cd	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-5b80-d2d2c4619d4a	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-e376-77558f163535	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-cdd4-e6c74607ad39	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-9d04-bc14b4f51842	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-4dc3-474f0c5fb6a2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-03fa-cf4f487a6da8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-6d51-22413a0595be	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-c976-f627fbeb0ce2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-56ac-8386e2fd04fb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-c9a9-9d36-c01d0d141d83	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-c9a9-7de7-e3ad4a2699fa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-c9a9-6a19-ad895f5bf455	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-c9a9-1035-3abe42c8ccb4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-c9a9-97d4-288a16b53a6b	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-c9a9-ffd2-741e8bdddb7a	Role-read	Aaa - Vloga - Beri	f
00020000-5538-c9a9-51c9-b133baba2f13	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-c9a9-2941-331253895a85	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-c9a9-d1ca-e57ce9f2bf50	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-c9a9-0dbc-ad3142cfb1fe	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-c9a9-31ac-8559d254f371	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-c9a9-a5eb-22eb96dc583d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-c9a9-06ac-a23c94264915	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-c9a9-5905-15f141e55a28	Drzava-read	Seznam držav	f
00020000-5538-c9a9-a5a0-3156ff598a04	Drzava-write	Urejanje držav	f
00020000-5538-c9a9-9579-1158bf9202cf	Popa-delete	Poslovni partner - Briši	f
00020000-5538-c9a9-ebcb-05eaae80a35f	Popa-list	Poslovni partner - Beri	f
00020000-5538-c9a9-28b9-69e99d202623	Popa-update	Poslovni partner - Posodobi	f
00020000-5538-c9a9-3ed0-535e101416db	Popa-create	Poslovni partner - Ustvari	f
00020000-5538-c9a9-1101-0b55e654c881	Posta-delete	Pošta - Briši	f
00020000-5538-c9a9-5442-ea300adcf43c	Posta-list	Pošta - Beri	f
00020000-5538-c9a9-d486-bd05278c8a15	Posta-update	Pošta - Posodobi	f
00020000-5538-c9a9-b0eb-1798214ac471	Posta-create	Pošta - Ustvari	f
00020000-5538-c9a9-8488-cb397fc4e522	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5538-c9a9-0edb-9ef9d4571556	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5538-c9a9-f054-f6f3862b9436	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5538-c9a9-4ef1-786a2e2d53f7	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2637 (class 0 OID 1021905)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5538-c9aa-2f01-2e716276162b	00020000-5538-c9a9-5905-15f141e55a28
00000000-5538-c9aa-2f01-2e716276162b	00020000-5538-c9a8-5b85-00c409656824
00000000-5538-c9aa-74fb-3ac3463e7204	00020000-5538-c9a9-a5a0-3156ff598a04
00000000-5538-c9aa-74fb-3ac3463e7204	00020000-5538-c9a9-5905-15f141e55a28
\.


--
-- TOC entry 2665 (class 0 OID 1022195)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 1022225)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 1022337)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 1021965)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1022007)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5538-c9a8-e443-26b935f823d4	8341	Adlešiči
00050000-5538-c9a8-34db-7e935b6395cf	5270	Ajdovščina
00050000-5538-c9a8-4ef6-4d41295691dc	6280	Ankaran/Ancarano
00050000-5538-c9a8-46b3-951b6e714c8f	9253	Apače
00050000-5538-c9a8-3eb2-512d8f0762d0	8253	Artiče
00050000-5538-c9a8-822f-85eb4e941fd1	4275	Begunje na Gorenjskem
00050000-5538-c9a8-2d3c-30bd5abfbb43	1382	Begunje pri Cerknici
00050000-5538-c9a8-6741-0d941e671d05	9231	Beltinci
00050000-5538-c9a8-0537-3d238cbc4129	2234	Benedikt
00050000-5538-c9a8-2ca3-8514ab17e8f6	2345	Bistrica ob Dravi
00050000-5538-c9a8-d0e1-297a86f58f6c	3256	Bistrica ob Sotli
00050000-5538-c9a8-73fd-ed1a2ac1ddd6	8259	Bizeljsko
00050000-5538-c9a8-cbf5-337e260f47e8	1223	Blagovica
00050000-5538-c9a8-af76-5dc8b18fbe1f	8283	Blanca
00050000-5538-c9a8-645c-c69d64b60491	4260	Bled
00050000-5538-c9a8-3018-98f812cd389f	4273	Blejska Dobrava
00050000-5538-c9a8-313b-2a99eaa0fd77	9265	Bodonci
00050000-5538-c9a8-b472-198de32a7a0b	9222	Bogojina
00050000-5538-c9a8-0e8f-0393f98d188d	4263	Bohinjska Bela
00050000-5538-c9a8-e64b-1a72ed5d1671	4264	Bohinjska Bistrica
00050000-5538-c9a8-feb4-1b12b79f3573	4265	Bohinjsko jezero
00050000-5538-c9a8-980f-723010702a78	1353	Borovnica
00050000-5538-c9a8-ef3c-bb59213199d3	8294	Boštanj
00050000-5538-c9a8-2d9c-a6ebca4b0646	5230	Bovec
00050000-5538-c9a8-6ede-aae66953db6a	5295	Branik
00050000-5538-c9a8-86fb-490a63e272c6	3314	Braslovče
00050000-5538-c9a8-0e10-aea47081d8f0	5223	Breginj
00050000-5538-c9a8-6596-53d61ccda738	8280	Brestanica
00050000-5538-c9a8-c81a-2df85b215a60	2354	Bresternica
00050000-5538-c9a8-9633-e10410a79072	4243	Brezje
00050000-5538-c9a8-3b45-26e199bb13cf	1351	Brezovica pri Ljubljani
00050000-5538-c9a8-786f-c71f5034c521	8250	Brežice
00050000-5538-c9a8-80c5-42553d8d8213	4210	Brnik - Aerodrom
00050000-5538-c9a8-a348-7839f6f7669f	8321	Brusnice
00050000-5538-c9a8-cbf4-297ad8fce115	3255	Buče
00050000-5538-c9a8-b8e8-df760b93cc31	8276	Bučka 
00050000-5538-c9a8-e073-04c7cd24b90b	9261	Cankova
00050000-5538-c9a8-4c14-7eb776f61cce	3000	Celje 
00050000-5538-c9a8-f002-c3c49c3c46ce	3001	Celje - poštni predali
00050000-5538-c9a8-ffa7-7ba402f6d9da	4207	Cerklje na Gorenjskem
00050000-5538-c9a8-fc16-d993d90400c3	8263	Cerklje ob Krki
00050000-5538-c9a8-690d-3caa5615fed6	1380	Cerknica
00050000-5538-c9a8-b06e-b5e7e6768158	5282	Cerkno
00050000-5538-c9a8-1b57-677c5f11d268	2236	Cerkvenjak
00050000-5538-c9a8-54ae-14621da2c7b7	2215	Ceršak
00050000-5538-c9a8-2d4c-1a968c1c282b	2326	Cirkovce
00050000-5538-c9a8-b777-9e85f2ce66d1	2282	Cirkulane
00050000-5538-c9a8-a761-3f85b12bc63c	5273	Col
00050000-5538-c9a8-709a-74fec6f9e54a	8251	Čatež ob Savi
00050000-5538-c9a8-a6b7-917302a5233e	1413	Čemšenik
00050000-5538-c9a8-c927-da4d5a26886c	5253	Čepovan
00050000-5538-c9a8-9725-b23096b104ed	9232	Črenšovci
00050000-5538-c9a8-5e5e-f00597c28487	2393	Črna na Koroškem
00050000-5538-c9a8-5962-c637553bdec2	6275	Črni Kal
00050000-5538-c9a8-090b-cd3949d85e91	5274	Črni Vrh nad Idrijo
00050000-5538-c9a8-efbc-c79018b81735	5262	Črniče
00050000-5538-c9a8-b1c8-c887c69abe76	8340	Črnomelj
00050000-5538-c9a8-0146-71073b5f279e	6271	Dekani
00050000-5538-c9a8-c50d-fd981c9ec3ae	5210	Deskle
00050000-5538-c9a8-1b88-1057a3ad6a56	2253	Destrnik
00050000-5538-c9a8-d685-7d9a58259f16	6215	Divača
00050000-5538-c9a8-ecac-d9a157ba1eef	1233	Dob
00050000-5538-c9a8-bfa3-b135c069c43b	3224	Dobje pri Planini
00050000-5538-c9a8-5577-89353f6f52ee	8257	Dobova
00050000-5538-c9a8-1560-9aa5a1cac6ed	1423	Dobovec
00050000-5538-c9a8-13ea-94253062e91e	5263	Dobravlje
00050000-5538-c9a8-706f-42c54fb852a0	3204	Dobrna
00050000-5538-c9a8-a95e-7df2caeed39e	8211	Dobrnič
00050000-5538-c9a8-26d9-6d9482a30ea9	1356	Dobrova
00050000-5538-c9a8-f867-0c7e2c5ea586	9223	Dobrovnik/Dobronak 
00050000-5538-c9a8-9cab-c2ac356d610e	5212	Dobrovo v Brdih
00050000-5538-c9a8-f3d2-ce5f01d25831	1431	Dol pri Hrastniku
00050000-5538-c9a8-2736-470f0839b51b	1262	Dol pri Ljubljani
00050000-5538-c9a8-c967-da1f88aa9dcd	1273	Dole pri Litiji
00050000-5538-c9a8-5e90-2d49fcb7a2d8	1331	Dolenja vas
00050000-5538-c9a8-a41e-eb8ebf15061a	8350	Dolenjske Toplice
00050000-5538-c9a8-3c2e-e3024c1fa6bb	1230	Domžale
00050000-5538-c9a8-46f1-ffb9723c1163	2252	Dornava
00050000-5538-c9a8-a559-d2bd46b64d4f	5294	Dornberk
00050000-5538-c9a8-e5df-044df5964da9	1319	Draga
00050000-5538-c9a8-29ce-1c74067198e8	8343	Dragatuš
00050000-5538-c9a8-9ca3-cd4d8dd5d9fd	3222	Dramlje
00050000-5538-c9a8-99e2-46b720f1f375	2370	Dravograd
00050000-5538-c9a8-e171-3c36d0ee864d	4203	Duplje
00050000-5538-c9a8-823e-2e2132c068ac	6221	Dutovlje
00050000-5538-c9a8-7ecd-523cc0211b75	8361	Dvor
00050000-5538-c9a8-589d-6b2e60b01c7a	2343	Fala
00050000-5538-c9a8-5228-4bb8c2a1aad9	9208	Fokovci
00050000-5538-c9a8-ce32-a68ab662310e	2313	Fram
00050000-5538-c9a8-507c-249bc54afd75	3213	Frankolovo
00050000-5538-c9a8-8195-d981bd73c769	1274	Gabrovka
00050000-5538-c9a8-9f0a-d652549fe331	8254	Globoko
00050000-5538-c9a8-23aa-ec68df0ce566	5275	Godovič
00050000-5538-c9a8-e4f9-32c508327733	4204	Golnik
00050000-5538-c9a8-d3e7-3eb490640b6c	3303	Gomilsko
00050000-5538-c9a8-03d8-4861729865d0	4224	Gorenja vas
00050000-5538-c9a8-44bb-254a2862025a	3263	Gorica pri Slivnici
00050000-5538-c9a8-abca-121db854e079	2272	Gorišnica
00050000-5538-c9a8-40e1-e0db17b8deaa	9250	Gornja Radgona
00050000-5538-c9a8-fb5c-4ded20c117b6	3342	Gornji Grad
00050000-5538-c9a8-918d-eaf52c611fc1	4282	Gozd Martuljek
00050000-5538-c9a8-cff8-e7e72f3b1de9	6272	Gračišče
00050000-5538-c9a8-06f6-b25450f098c5	9264	Grad
00050000-5538-c9a8-0607-fe9ccdf3177a	8332	Gradac
00050000-5538-c9a8-93f8-91a3cb9e2cfa	1384	Grahovo
00050000-5538-c9a8-dcaa-514b8147638f	5242	Grahovo ob Bači
00050000-5538-c9a8-7626-aea82903985e	5251	Grgar
00050000-5538-c9a8-611c-db8c7258a128	3302	Griže
00050000-5538-c9a8-e674-06e0e06c0c56	3231	Grobelno
00050000-5538-c9a8-4c62-af000686b9ad	1290	Grosuplje
00050000-5538-c9a8-fc41-62af90961ac6	2288	Hajdina
00050000-5538-c9a8-5099-357ea680d010	8362	Hinje
00050000-5538-c9a8-1cbd-38c1c9be0029	2311	Hoče
00050000-5538-c9a8-cff8-15f9df309afc	9205	Hodoš/Hodos
00050000-5538-c9a8-82c5-a8d62af1207d	1354	Horjul
00050000-5538-c9a8-10b8-78ba74fd5ee5	1372	Hotedršica
00050000-5538-c9a8-f492-36f4694da1a2	1430	Hrastnik
00050000-5538-c9a8-7aeb-b9ac084e0e38	6225	Hruševje
00050000-5538-c9a8-069c-27502ac54d3b	4276	Hrušica
00050000-5538-c9a8-6647-adcae9ea6783	5280	Idrija
00050000-5538-c9a8-3149-f9c965efc595	1292	Ig
00050000-5538-c9a8-7123-10e158b52f70	6250	Ilirska Bistrica
00050000-5538-c9a8-b3d4-9bcb2b02d883	6251	Ilirska Bistrica-Trnovo
00050000-5538-c9a8-8edc-2fe4b65c2bac	1295	Ivančna Gorica
00050000-5538-c9a8-0a16-e0683148c8fa	2259	Ivanjkovci
00050000-5538-c9a8-75ba-c2d7d53206ca	1411	Izlake
00050000-5538-c9a8-396c-db09d0f64ea4	6310	Izola/Isola
00050000-5538-c9a8-457f-4063cb5754d2	2222	Jakobski Dol
00050000-5538-c9a8-93ae-a3a2508f0b31	2221	Jarenina
00050000-5538-c9a8-6b2c-e23d8871c207	6254	Jelšane
00050000-5538-c9a8-381c-706d6c0ccfcf	4270	Jesenice
00050000-5538-c9a8-831e-3e173ebb94c9	8261	Jesenice na Dolenjskem
00050000-5538-c9a8-6f7e-33bf29e9132d	3273	Jurklošter
00050000-5538-c9a8-0f40-8a87617f2186	2223	Jurovski Dol
00050000-5538-c9a8-b45f-7216990c9fca	2256	Juršinci
00050000-5538-c9a8-a775-6a7c13efdbaf	5214	Kal nad Kanalom
00050000-5538-c9a8-ac74-758c1de66058	3233	Kalobje
00050000-5538-c9a8-9366-5b4f5b81d778	4246	Kamna Gorica
00050000-5538-c9a8-7a5e-8d5600227bfd	2351	Kamnica
00050000-5538-c9a8-dccc-135ec50edb0b	1241	Kamnik
00050000-5538-c9a8-d45b-7cecce83c68e	5213	Kanal
00050000-5538-c9a8-998e-b65e19f81662	8258	Kapele
00050000-5538-c9a8-f570-e9d682f5a676	2362	Kapla
00050000-5538-c9a8-289a-ce93414b4ab4	2325	Kidričevo
00050000-5538-c9a8-d93e-c8ba218b7f59	1412	Kisovec
00050000-5538-c9a8-e337-4cbbcb912fcf	6253	Knežak
00050000-5538-c9a8-c279-a2d3e12b659b	5222	Kobarid
00050000-5538-c9a8-b70c-921105f2988f	9227	Kobilje
00050000-5538-c9a8-bfd3-30a2e463d6fe	1330	Kočevje
00050000-5538-c9a8-9f25-465af44afd34	1338	Kočevska Reka
00050000-5538-c9a8-aa83-164b3fe59f57	2276	Kog
00050000-5538-c9a8-4db9-7ab01b3ab5e4	5211	Kojsko
00050000-5538-c9a8-fbd4-4850582e5715	6223	Komen
00050000-5538-c9a8-721d-8df5c3bff352	1218	Komenda
00050000-5538-c9a8-55d5-da4741a2de5d	6000	Koper/Capodistria 
00050000-5538-c9a8-63d5-56aa40e5628d	6001	Koper/Capodistria - poštni predali
00050000-5538-c9a8-d7fa-001b914d54bf	8282	Koprivnica
00050000-5538-c9a8-866a-62d21561d7b1	5296	Kostanjevica na Krasu
00050000-5538-c9a8-72fa-cd8d2b1cd5d3	8311	Kostanjevica na Krki
00050000-5538-c9a8-1d7f-8615bc94570f	1336	Kostel
00050000-5538-c9a8-a678-2c9754981618	6256	Košana
00050000-5538-c9a8-e5e6-ae4b8be931af	2394	Kotlje
00050000-5538-c9a8-c1bc-1ccbeeea85d9	6240	Kozina
00050000-5538-c9a8-5de1-22d4e07411f9	3260	Kozje
00050000-5538-c9a8-db99-9d4df155a78a	4000	Kranj 
00050000-5538-c9a8-10f4-db32bfa3833d	4001	Kranj - poštni predali
00050000-5538-c9a8-40b7-f50b116a5cdd	4280	Kranjska Gora
00050000-5538-c9a8-07e6-8a5744fe5b0c	1281	Kresnice
00050000-5538-c9a8-b42a-7435ce08dbed	4294	Križe
00050000-5538-c9a8-de90-7a8dc89df27a	9206	Križevci
00050000-5538-c9a8-1fef-734c5e1ec6c0	9242	Križevci pri Ljutomeru
00050000-5538-c9a8-d965-08755c388ddb	1301	Krka
00050000-5538-c9a8-1726-0ec97c2688d8	8296	Krmelj
00050000-5538-c9a8-1b37-2c14a3355a67	4245	Kropa
00050000-5538-c9a8-39f5-4dd093aebeb9	8262	Krška vas
00050000-5538-c9a8-10e0-67c6ac628410	8270	Krško
00050000-5538-c9a8-520d-4bd165f8d7ad	9263	Kuzma
00050000-5538-c9a8-045f-98532aee8b18	2318	Laporje
00050000-5538-c9a8-4003-75b2507fff66	3270	Laško
00050000-5538-c9a8-12b6-7d665e99d693	1219	Laze v Tuhinju
00050000-5538-c9a8-db97-5ad998879d18	2230	Lenart v Slovenskih goricah
00050000-5538-c9a8-90fb-c43b6716915a	9220	Lendava/Lendva
00050000-5538-c9a8-0ad9-e28eb1020c46	4248	Lesce
00050000-5538-c9a8-5854-b0c2e474ee64	3261	Lesično
00050000-5538-c9a8-7a47-c1eedfe7ecaf	8273	Leskovec pri Krškem
00050000-5538-c9a8-784e-1139c16526b8	2372	Libeliče
00050000-5538-c9a8-f781-f89e666d76da	2341	Limbuš
00050000-5538-c9a8-b1fc-06573fa68c92	1270	Litija
00050000-5538-c9a8-0a9b-85a72ff19686	3202	Ljubečna
00050000-5538-c9a8-ffdf-5fdc9c50d573	1000	Ljubljana 
00050000-5538-c9a8-0a8b-7c06a9c1efa0	1001	Ljubljana - poštni predali
00050000-5538-c9a8-8ef1-63f2db516f25	1231	Ljubljana - Črnuče
00050000-5538-c9a8-5fce-fd75d015ef5d	1261	Ljubljana - Dobrunje
00050000-5538-c9a8-f648-923efff67dc3	1260	Ljubljana - Polje
00050000-5538-c9a8-8dda-e9250a004f05	1210	Ljubljana - Šentvid
00050000-5538-c9a8-ea34-23a30afd3c66	1211	Ljubljana - Šmartno
00050000-5538-c9a8-abf0-7ce4318f7673	3333	Ljubno ob Savinji
00050000-5538-c9a8-2b89-5340efcfe78e	9240	Ljutomer
00050000-5538-c9a8-a2fe-68e227eb1caf	3215	Loče
00050000-5538-c9a8-2b40-9d941f62e847	5231	Log pod Mangartom
00050000-5538-c9a8-8291-3d8179817069	1358	Log pri Brezovici
00050000-5538-c9a8-d5b6-5b47bc91c158	1370	Logatec
00050000-5538-c9a8-818d-13d8083b5a06	1371	Logatec
00050000-5538-c9a8-1f84-c9d7f96c3825	1434	Loka pri Zidanem Mostu
00050000-5538-c9a8-f5bd-42a94f075430	3223	Loka pri Žusmu
00050000-5538-c9a8-e1f4-93f05a4c8e5a	6219	Lokev
00050000-5538-c9a8-3f35-f61973e068ce	1318	Loški Potok
00050000-5538-c9a8-4508-d3b2db85b286	2324	Lovrenc na Dravskem polju
00050000-5538-c9a8-6dcb-2f947010e80a	2344	Lovrenc na Pohorju
00050000-5538-c9a8-2c0a-21e0a0062fcd	3334	Luče
00050000-5538-c9a8-f7ee-55361c6b9173	1225	Lukovica
00050000-5538-c9a8-88ab-60fe2955d0f2	9202	Mačkovci
00050000-5538-c9a8-9257-c7b88c6e561e	2322	Majšperk
00050000-5538-c9a8-fcb2-f8c89aeef83a	2321	Makole
00050000-5538-c9a8-0303-a259962a8dc1	9243	Mala Nedelja
00050000-5538-c9a8-d3f6-59a48023b81c	2229	Malečnik
00050000-5538-c9a8-e24f-51dedb7c2e68	6273	Marezige
00050000-5538-c9a8-95b2-cba344dda60a	2000	Maribor 
00050000-5538-c9a8-ce66-0817500809c1	2001	Maribor - poštni predali
00050000-5538-c9a8-4886-3cc6b6e8a8ba	2206	Marjeta na Dravskem polju
00050000-5538-c9a8-af3b-2b18d520552a	2281	Markovci
00050000-5538-c9a8-9c7e-9891eea1dff5	9221	Martjanci
00050000-5538-c9a8-2d00-1180b9a4670d	6242	Materija
00050000-5538-c9a8-0783-978cec0dc3d0	4211	Mavčiče
00050000-5538-c9a8-84d2-01fa0c8dea99	1215	Medvode
00050000-5538-c9a8-8394-7d9818d5d281	1234	Mengeš
00050000-5538-c9a8-9908-890f49691721	8330	Metlika
00050000-5538-c9a8-3d02-40f38212fc09	2392	Mežica
00050000-5538-c9a8-0831-e3ce52b9b5a5	2204	Miklavž na Dravskem polju
00050000-5538-c9a8-b810-375e4c03d554	2275	Miklavž pri Ormožu
00050000-5538-c9a8-e235-1013ff55bdf8	5291	Miren
00050000-5538-c9a8-ee44-ca3ec8c5c53b	8233	Mirna
00050000-5538-c9a8-c39b-b59c84d903dd	8216	Mirna Peč
00050000-5538-c9a8-9c3d-96294fcb6667	2382	Mislinja
00050000-5538-c9a8-87b4-cdcac02da00e	4281	Mojstrana
00050000-5538-c9a8-7020-1a69f9229656	8230	Mokronog
00050000-5538-c9a8-1533-6feb993884ac	1251	Moravče
00050000-5538-c9a8-e3a7-f4ddbb2a16e5	9226	Moravske Toplice
00050000-5538-c9a8-08de-c6047f03a291	5216	Most na Soči
00050000-5538-c9a8-6885-5ec8af784f79	1221	Motnik
00050000-5538-c9a8-26dd-6c6eabe97199	3330	Mozirje
00050000-5538-c9a8-15f5-6d3ba5e693c4	9000	Murska Sobota 
00050000-5538-c9a8-30f2-e5f47deca4f7	9001	Murska Sobota - poštni predali
00050000-5538-c9a8-c2e3-d4c18396d049	2366	Muta
00050000-5538-c9a8-1341-9b27723a2017	4202	Naklo
00050000-5538-c9a8-f598-cd6027deffa1	3331	Nazarje
00050000-5538-c9a8-f76f-a383f37b7045	1357	Notranje Gorice
00050000-5538-c9a8-194a-66b1e4f45329	3203	Nova Cerkev
00050000-5538-c9a8-7ca4-2fd750855122	5000	Nova Gorica 
00050000-5538-c9a8-1df5-65cf25b33c1e	5001	Nova Gorica - poštni predali
00050000-5538-c9a8-a100-8895c57c6d61	1385	Nova vas
00050000-5538-c9a8-8761-e7cc2b405661	8000	Novo mesto
00050000-5538-c9a8-40fe-eb893f83c8e8	8001	Novo mesto - poštni predali
00050000-5538-c9a8-f77e-55721ff249c5	6243	Obrov
00050000-5538-c9a8-2d4b-d8e3493e6ddf	9233	Odranci
00050000-5538-c9a8-bde3-ec866327fd82	2317	Oplotnica
00050000-5538-c9a8-ab68-12706073b891	2312	Orehova vas
00050000-5538-c9a8-2b7e-255e9ed01a92	2270	Ormož
00050000-5538-c9a8-a50c-2fa7cc84b427	1316	Ortnek
00050000-5538-c9a8-0ba0-cf80c2a82926	1337	Osilnica
00050000-5538-c9a8-edbb-5b3822c7a5ca	8222	Otočec
00050000-5538-c9a8-6954-e74f25eab900	2361	Ožbalt
00050000-5538-c9a8-2776-2321dd3d5371	2231	Pernica
00050000-5538-c9a8-1c1c-75546c3da5e2	2211	Pesnica pri Mariboru
00050000-5538-c9a8-c90f-f1b543f0edf3	9203	Petrovci
00050000-5538-c9a8-4a71-df9a35497ffb	3301	Petrovče
00050000-5538-c9a8-c9cc-0f2c36d61c7d	6330	Piran/Pirano
00050000-5538-c9a8-2977-763415d027d4	8255	Pišece
00050000-5538-c9a8-f8f0-569692a31768	6257	Pivka
00050000-5538-c9a8-4a8b-62f38a1bbe5a	6232	Planina
00050000-5538-c9a8-c298-5f091aa070b2	3225	Planina pri Sevnici
00050000-5538-c9a8-6efc-e45373633a6a	6276	Pobegi
00050000-5538-c9a8-ba3a-398901138b70	8312	Podbočje
00050000-5538-c9a8-f41a-9fcbf17c9ff9	5243	Podbrdo
00050000-5538-c9a8-4adf-ecba04c471fe	3254	Podčetrtek
00050000-5538-c9a8-d719-a00aeb0f1067	2273	Podgorci
00050000-5538-c9a8-88dc-8be5cbac4a8a	6216	Podgorje
00050000-5538-c9a8-2688-d798de7e679c	2381	Podgorje pri Slovenj Gradcu
00050000-5538-c9a8-c8ca-6331617d8b70	6244	Podgrad
00050000-5538-c9a8-6327-e63f3f157278	1414	Podkum
00050000-5538-c9a8-666b-4cc426bc02b7	2286	Podlehnik
00050000-5538-c9a8-2e8d-a028d0141e9a	5272	Podnanos
00050000-5538-c9a8-af07-c8b44b1da24d	4244	Podnart
00050000-5538-c9a8-0ad0-6699aba49716	3241	Podplat
00050000-5538-c9a8-4a9a-0971e90bd0fb	3257	Podsreda
00050000-5538-c9a8-88d7-3dcb9ee9a0f6	2363	Podvelka
00050000-5538-c9a8-93e1-1a2bea70e46b	2208	Pohorje
00050000-5538-c9a8-ee5d-e0652d57010e	2257	Polenšak
00050000-5538-c9a8-348b-ef0e4c98cdbe	1355	Polhov Gradec
00050000-5538-c9a8-6e8e-02f984705d17	4223	Poljane nad Škofjo Loko
00050000-5538-c9a8-43de-c49ec95f1c3b	2319	Poljčane
00050000-5538-c9a8-ba93-ba5543e976a4	1272	Polšnik
00050000-5538-c9a8-b7ef-87fb38d38881	3313	Polzela
00050000-5538-c9a8-1286-8704843e9fa7	3232	Ponikva
00050000-5538-c9a8-4c85-04728f70a211	6320	Portorož/Portorose
00050000-5538-c9a8-2b6a-bdc475f70c03	6230	Postojna
00050000-5538-c9a8-3271-59c796c08442	2331	Pragersko
00050000-5538-c9a8-24e4-24d63cc64587	3312	Prebold
00050000-5538-c9a8-4500-9e0a8b14c78b	4205	Preddvor
00050000-5538-c9a8-b4a2-5a138e37e379	6255	Prem
00050000-5538-c9a8-941f-ef67e9d5f1ae	1352	Preserje
00050000-5538-c9a8-6793-fe29ca4dd151	6258	Prestranek
00050000-5538-c9a8-9288-df2f1e767356	2391	Prevalje
00050000-5538-c9a8-e482-f66bf76c0318	3262	Prevorje
00050000-5538-c9a8-eac1-2253b9fbd7d6	1276	Primskovo 
00050000-5538-c9a8-0bfd-e991a34d26a7	3253	Pristava pri Mestinju
00050000-5538-c9a8-083c-5ccaa9ff5f23	9207	Prosenjakovci/Partosfalva
00050000-5538-c9a8-0d7a-2b6a64881251	5297	Prvačina
00050000-5538-c9a8-7817-ee26c55a32a9	2250	Ptuj
00050000-5538-c9a8-4dea-aa6b2d5b0a29	2323	Ptujska Gora
00050000-5538-c9a8-c297-6454d1ff00de	9201	Puconci
00050000-5538-c9a8-0ef8-5a0b2f3575a8	2327	Rače
00050000-5538-c9a8-efa2-ac9fad56efc8	1433	Radeče
00050000-5538-c9a8-fde8-3c0e83d3e98c	9252	Radenci
00050000-5538-c9a8-defd-a4e4bb4b794e	2360	Radlje ob Dravi
00050000-5538-c9a8-aa4e-0980e82a051f	1235	Radomlje
00050000-5538-c9a8-d46a-600590b3566e	4240	Radovljica
00050000-5538-c9a8-ad8b-eb8f3a9c9eef	8274	Raka
00050000-5538-c9a8-a7b3-8f940dd05e60	1381	Rakek
00050000-5538-c9a8-7828-a58d2d32642f	4283	Rateče - Planica
00050000-5538-c9a8-9629-28c36d88bb64	2390	Ravne na Koroškem
00050000-5538-c9a8-644c-ef69fa27cfae	9246	Razkrižje
00050000-5538-c9a8-0472-5ba91a5783f4	3332	Rečica ob Savinji
00050000-5538-c9a8-ce40-4e81f8d33979	5292	Renče
00050000-5538-c9a8-d91e-d3b83bf8d458	1310	Ribnica
00050000-5538-c9a8-52fd-edd19c554a86	2364	Ribnica na Pohorju
00050000-5538-c9a8-a641-7b02d6faff07	3272	Rimske Toplice
00050000-5538-c9a8-9053-bac07aa1dc7d	1314	Rob
00050000-5538-c9a8-ab8e-7c78c2c2841a	5215	Ročinj
00050000-5538-c9a8-759b-4ecb23eb4158	3250	Rogaška Slatina
00050000-5538-c9a8-a79e-a86cf64b1315	9262	Rogašovci
00050000-5538-c9a8-24cf-89d8fc18f524	3252	Rogatec
00050000-5538-c9a8-eaa5-94eeb0132fdf	1373	Rovte
00050000-5538-c9a8-27cf-01d89130eee5	2342	Ruše
00050000-5538-c9a8-c4bf-4811f21f1fc9	1282	Sava
00050000-5538-c9a8-5638-8a7d98dea350	6333	Sečovlje/Sicciole
00050000-5538-c9a8-0c9d-2688fa194a96	4227	Selca
00050000-5538-c9a8-542d-84e5d377b9da	2352	Selnica ob Dravi
00050000-5538-c9a8-b91f-be3f5cff4c99	8333	Semič
00050000-5538-c9a8-97e3-967bd84e86c9	8281	Senovo
00050000-5538-c9a8-5b6e-64cb184cdb9f	6224	Senožeče
00050000-5538-c9a8-bf0b-1191855ebdc2	8290	Sevnica
00050000-5538-c9a8-f21c-22cf329e59c9	6210	Sežana
00050000-5538-c9a8-c6d5-a47b83bbcf2f	2214	Sladki Vrh
00050000-5538-c9a8-fe2e-576703ac6f22	5283	Slap ob Idrijci
00050000-5538-c9a8-a689-1c51359ee1cc	2380	Slovenj Gradec
00050000-5538-c9a8-9f83-c448dccc602c	2310	Slovenska Bistrica
00050000-5538-c9a8-eca2-cbb4c5a120f5	3210	Slovenske Konjice
00050000-5538-c9a8-6bf5-af6c034e6046	1216	Smlednik
00050000-5538-c9a8-202d-9177bef226fc	5232	Soča
00050000-5538-c9a8-6a92-c8370e2242a2	1317	Sodražica
00050000-5538-c9a8-a5fc-370021580546	3335	Solčava
00050000-5538-c9a8-5fcd-7d24297583ab	5250	Solkan
00050000-5538-c9a8-8427-1011f7ee8d3d	4229	Sorica
00050000-5538-c9a8-1a7d-a4b73677c459	4225	Sovodenj
00050000-5538-c9a8-4463-c7401b2f486f	5281	Spodnja Idrija
00050000-5538-c9a8-70bc-f0f0cf46916c	2241	Spodnji Duplek
00050000-5538-c9a8-003c-e179c1d8c3b2	9245	Spodnji Ivanjci
00050000-5538-c9a8-bb7a-728e7d3a91c8	2277	Središče ob Dravi
00050000-5538-c9a8-678b-bac44ca17c26	4267	Srednja vas v Bohinju
00050000-5538-c9a8-e794-cca17cbde1dc	8256	Sromlje 
00050000-5538-c9a8-2c8f-18e973b18f34	5224	Srpenica
00050000-5538-c9a8-266f-d9b2ef526f89	1242	Stahovica
00050000-5538-c9a8-e358-8081344d4a49	1332	Stara Cerkev
00050000-5538-c9a8-bf29-6b6d7288206a	8342	Stari trg ob Kolpi
00050000-5538-c9a8-5436-9f9f1712adaf	1386	Stari trg pri Ložu
00050000-5538-c9a8-0a8d-21387ab515b4	2205	Starše
00050000-5538-c9a8-59f8-888f67c6190c	2289	Stoperce
00050000-5538-c9a8-746c-9ea93c2768bb	8322	Stopiče
00050000-5538-c9a8-efae-e7afd59ef858	3206	Stranice
00050000-5538-c9a8-78e7-e7076af287b1	8351	Straža
00050000-5538-c9a8-fba3-be22d04a1f55	1313	Struge
00050000-5538-c9a8-46b9-a32329be9018	8293	Studenec
00050000-5538-c9a8-be3f-1ce8d7767c2d	8331	Suhor
00050000-5538-c9a8-dad5-a6a9034e9262	2233	Sv. Ana v Slovenskih goricah
00050000-5538-c9a8-de8f-9e6ce4d74ef3	2235	Sv. Trojica v Slovenskih goricah
00050000-5538-c9a8-adc2-4988eb393aa0	2353	Sveti Duh na Ostrem Vrhu
00050000-5538-c9a8-b713-22547646813e	9244	Sveti Jurij ob Ščavnici
00050000-5538-c9a8-d9cb-e18175981eef	3264	Sveti Štefan
00050000-5538-c9a8-4fde-e89b7cd4cf38	2258	Sveti Tomaž
00050000-5538-c9a8-af4f-d83b8fa136d9	9204	Šalovci
00050000-5538-c9a8-ebf6-50a23ebf84f6	5261	Šempas
00050000-5538-c9a8-fac0-14f803ccd1fc	5290	Šempeter pri Gorici
00050000-5538-c9a8-63a3-b04cb06e7a4e	3311	Šempeter v Savinjski dolini
00050000-5538-c9a8-96be-0edf4ed42faf	4208	Šenčur
00050000-5538-c9a8-fcdd-88e07bfb77a8	2212	Šentilj v Slovenskih goricah
00050000-5538-c9a8-cd13-32ffd1cac524	8297	Šentjanž
00050000-5538-c9a8-2482-6e5ebe0bb5bf	2373	Šentjanž pri Dravogradu
00050000-5538-c9a8-b5c7-33a1eca29779	8310	Šentjernej
00050000-5538-c9a8-fa53-5997ae89c311	3230	Šentjur
00050000-5538-c9a8-311d-3b80cd8efbae	3271	Šentrupert
00050000-5538-c9a8-6235-f8e5693089c0	8232	Šentrupert
00050000-5538-c9a8-c273-3a992ef40945	1296	Šentvid pri Stični
00050000-5538-c9a8-b06d-c9286f1a8eaf	8275	Škocjan
00050000-5538-c9a8-2895-0e1a5cf8ff6a	6281	Škofije
00050000-5538-c9a8-1537-a38eedc8fe45	4220	Škofja Loka
00050000-5538-c9a8-b53f-f495e1f9bfeb	3211	Škofja vas
00050000-5538-c9a8-4c0c-c13465037ce3	1291	Škofljica
00050000-5538-c9a8-31e9-996fc0e561f1	6274	Šmarje
00050000-5538-c9a8-996c-f04eb1a8af1c	1293	Šmarje - Sap
00050000-5538-c9a8-7317-4118b44e6b8a	3240	Šmarje pri Jelšah
00050000-5538-c9a8-f7cd-48e8c7464196	8220	Šmarješke Toplice
00050000-5538-c9a8-a594-0dda896202f5	2315	Šmartno na Pohorju
00050000-5538-c9a8-284b-1ec0922bf12c	3341	Šmartno ob Dreti
00050000-5538-c9a8-a00b-99e779a238ea	3327	Šmartno ob Paki
00050000-5538-c9a8-f54f-5c68a08bbff7	1275	Šmartno pri Litiji
00050000-5538-c9a8-60a8-b4bbdd1772a9	2383	Šmartno pri Slovenj Gradcu
00050000-5538-c9a8-7c1c-258ca555c74c	3201	Šmartno v Rožni dolini
00050000-5538-c9a8-525f-d258de3bb2f7	3325	Šoštanj
00050000-5538-c9a8-960d-fd744f637c97	6222	Štanjel
00050000-5538-c9a8-b786-4e73d157be64	3220	Štore
00050000-5538-c9a8-ad19-acddea598b14	3304	Tabor
00050000-5538-c9a8-1ea4-2b5a58d6dea3	3221	Teharje
00050000-5538-c9a8-4906-2bcaf825170f	9251	Tišina
00050000-5538-c9a8-1449-88bd3a8d6e3e	5220	Tolmin
00050000-5538-c9a8-c5f2-5010e14b5253	3326	Topolšica
00050000-5538-c9a8-4486-216dcddeded5	2371	Trbonje
00050000-5538-c9a8-e1a7-9e59ec7525c9	1420	Trbovlje
00050000-5538-c9a8-54f5-69031f2347af	8231	Trebelno 
00050000-5538-c9a8-c963-dda47135f0be	8210	Trebnje
00050000-5538-c9a8-ba6a-a9826e5d99d4	5252	Trnovo pri Gorici
00050000-5538-c9a8-fd9c-bbdaad489e36	2254	Trnovska vas
00050000-5538-c9a8-79c3-0cd442b452ca	1222	Trojane
00050000-5538-c9a8-bf09-165f2d65bd57	1236	Trzin
00050000-5538-c9a8-c256-39a8fbf72e8a	4290	Tržič
00050000-5538-c9a8-41a7-e346a537ec84	8295	Tržišče
00050000-5538-c9a8-4a84-844f5e2a344a	1311	Turjak
00050000-5538-c9a8-618b-1097a84686f9	9224	Turnišče
00050000-5538-c9a8-ec36-a857640781c2	8323	Uršna sela
00050000-5538-c9a8-647d-4214c40c3451	1252	Vače
00050000-5538-c9a8-4ddd-9500cc3354ea	3320	Velenje 
00050000-5538-c9a8-efe7-be3b1e9b4ec6	3322	Velenje - poštni predali
00050000-5538-c9a8-0453-d034220b7d1d	8212	Velika Loka
00050000-5538-c9a8-4101-04fe747719c1	2274	Velika Nedelja
00050000-5538-c9a8-91ca-417e92ce29f0	9225	Velika Polana
00050000-5538-c9a8-8462-00ce1c0a23e5	1315	Velike Lašče
00050000-5538-c9a8-bf6b-1b4c5954d351	8213	Veliki Gaber
00050000-5538-c9a8-9443-24205f42aba4	9241	Veržej
00050000-5538-c9a8-3326-8ecf3fcbb48a	1312	Videm - Dobrepolje
00050000-5538-c9a8-a8b2-ece81a1af1aa	2284	Videm pri Ptuju
00050000-5538-c9a8-239c-d5f1c7a6412e	8344	Vinica
00050000-5538-c9a8-382d-9b5d3d945c89	5271	Vipava
00050000-5538-c9a8-fe69-75598dcb38d8	4212	Visoko
00050000-5538-c9a8-a1f9-d097fbda9cd1	1294	Višnja Gora
00050000-5538-c9a8-23fb-18aadedba954	3205	Vitanje
00050000-5538-c9a8-c1d9-a882b89fd515	2255	Vitomarci
00050000-5538-c9a8-a412-838093740285	1217	Vodice
00050000-5538-c9a8-a45b-ee69fe395fe9	3212	Vojnik\t
00050000-5538-c9a8-9d02-95820a6d0cd1	5293	Volčja Draga
00050000-5538-c9a8-33ac-8334bd89eff6	2232	Voličina
00050000-5538-c9a8-2020-10b5a7c8e289	3305	Vransko
00050000-5538-c9a8-c455-350732a9f454	6217	Vremski Britof
00050000-5538-c9a8-8cb1-f6c865643a73	1360	Vrhnika
00050000-5538-c9a8-f6f7-b28e720ea6f4	2365	Vuhred
00050000-5538-c9a8-a3f7-888c6add9339	2367	Vuzenica
00050000-5538-c9a8-2964-93778b48f64f	8292	Zabukovje 
00050000-5538-c9a8-1d38-3833016b2bee	1410	Zagorje ob Savi
00050000-5538-c9a8-df0f-fb518552437e	1303	Zagradec
00050000-5538-c9a8-fa81-92abf0144428	2283	Zavrč
00050000-5538-c9a8-5ce6-689d9cd922f2	8272	Zdole 
00050000-5538-c9a8-9a9b-c681a1783d3a	4201	Zgornja Besnica
00050000-5538-c9a8-d6bc-20602dce55b1	2242	Zgornja Korena
00050000-5538-c9a8-3272-076a98b88836	2201	Zgornja Kungota
00050000-5538-c9a8-a892-add0ea4786ce	2316	Zgornja Ložnica
00050000-5538-c9a8-0a81-072c45800c3a	2314	Zgornja Polskava
00050000-5538-c9a8-4ead-9f4b69c7347d	2213	Zgornja Velka
00050000-5538-c9a8-0c1f-eb30d7b7b25e	4247	Zgornje Gorje
00050000-5538-c9a8-0c9a-ee0872696496	4206	Zgornje Jezersko
00050000-5538-c9a8-7b8c-ade0546c9375	2285	Zgornji Leskovec
00050000-5538-c9a8-2193-c5b9ddbcf866	1432	Zidani Most
00050000-5538-c9a8-5720-c461c4de269a	3214	Zreče
00050000-5538-c9a8-1977-bea5ae21f900	4209	Žabnica
00050000-5538-c9a8-44cc-68b099ac9009	3310	Žalec
00050000-5538-c9a8-2deb-daf6f63c2d20	4228	Železniki
00050000-5538-c9a8-0d86-23b264523a13	2287	Žetale
00050000-5538-c9a8-172f-389745606a3a	4226	Žiri
00050000-5538-c9a8-f619-3df9359626ab	4274	Žirovnica
00050000-5538-c9a8-af6b-08af2ac7193e	8360	Žužemberk
\.


--
-- TOC entry 2661 (class 0 OID 1022169)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1021992)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1022058)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 1022181)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1022286)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1022330)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 1022210)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 1022154)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 1022144)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1022320)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1022276)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 1021857)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5538-c9aa-5488-9630161e47fb	00010000-5538-c9aa-cc88-1a05068950d1	2015-04-23 12:30:02	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROEzdAl.gIEvaPytUzxD6BmAAikPGM0S6";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2668 (class 0 OID 1022219)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 1021895)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5538-c9aa-f8b2-d49d65f3baa8	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5538-c9aa-7acf-243ba6eee76b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5538-c9aa-2f01-2e716276162b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5538-c9aa-ad1a-15efd98d28fd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5538-c9aa-12e7-48bac2d3a37c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5538-c9aa-74fb-3ac3463e7204	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2634 (class 0 OID 1021879)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5538-c9aa-5488-9630161e47fb	00000000-5538-c9aa-ad1a-15efd98d28fd
00010000-5538-c9aa-cc88-1a05068950d1	00000000-5538-c9aa-ad1a-15efd98d28fd
\.


--
-- TOC entry 2670 (class 0 OID 1022233)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1022175)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1022125)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1021957)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1022131)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1022311)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1022027)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 1021866)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5538-c9aa-cc88-1a05068950d1	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROekbZLdBLWbRhFkTqnwV66gfIq.gzqZ.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5538-c9aa-5488-9630161e47fb	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2682 (class 0 OID 1022361)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1022073)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 1022202)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1022268)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1022101)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 1022351)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1022258)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 1021920)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 1022400)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 1022393)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 1022310)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 1022091)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 1022124)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 1022053)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 1022254)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 1022071)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 1022118)
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
-- TOC entry 2366 (class 2606 OID 1022167)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 1022194)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 1022025)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 1021929)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 1021989)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2282 (class 2606 OID 1021954)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 1021909)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 1021894)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 1022200)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 1022232)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 1022347)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 1021982)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 1022013)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 1022173)
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
-- TOC entry 2300 (class 2606 OID 1022003)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 1022062)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 1022185)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 1022292)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 1022335)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 1022217)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 1022158)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 1022149)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 1022329)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 1022283)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 1021865)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 1022223)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 1021883)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 1021903)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 1022241)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 1022180)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 1022130)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 1021962)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 1022140)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 1022319)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 1022038)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 1021878)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 1022375)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 1022077)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 1022208)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 1022274)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 1022113)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 1022360)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 1022267)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 1259 OID 1022098)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2288 (class 1259 OID 1021984)
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
-- TOC entry 2379 (class 1259 OID 1022201)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2373 (class 1259 OID 1022187)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2374 (class 1259 OID 1022186)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2325 (class 1259 OID 1022078)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 1022257)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2401 (class 1259 OID 1022255)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 1022256)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2425 (class 1259 OID 1022348)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 1022349)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2427 (class 1259 OID 1022350)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2432 (class 1259 OID 1022378)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2433 (class 1259 OID 1022377)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2434 (class 1259 OID 1022376)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2307 (class 1259 OID 1022040)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2308 (class 1259 OID 1022039)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 1021991)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2293 (class 1259 OID 1021990)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2280 (class 1259 OID 1021956)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2388 (class 1259 OID 1022224)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2343 (class 1259 OID 1022119)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 1021910)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 1021911)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2393 (class 1259 OID 1022244)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2394 (class 1259 OID 1022243)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2395 (class 1259 OID 1022242)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2317 (class 1259 OID 1022063)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2318 (class 1259 OID 1022065)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2319 (class 1259 OID 1022064)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2353 (class 1259 OID 1022153)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2354 (class 1259 OID 1022151)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2355 (class 1259 OID 1022150)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2356 (class 1259 OID 1022152)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 1021884)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 1021885)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2382 (class 1259 OID 1022209)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2368 (class 1259 OID 1022174)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2408 (class 1259 OID 1022284)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2409 (class 1259 OID 1022285)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2296 (class 1259 OID 1022005)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2297 (class 1259 OID 1022004)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2298 (class 1259 OID 1022006)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2412 (class 1259 OID 1022293)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2413 (class 1259 OID 1022294)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2443 (class 1259 OID 1022403)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2444 (class 1259 OID 1022402)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2445 (class 1259 OID 1022405)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2446 (class 1259 OID 1022401)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2447 (class 1259 OID 1022404)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2405 (class 1259 OID 1022275)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2359 (class 1259 OID 1022162)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2360 (class 1259 OID 1022161)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2361 (class 1259 OID 1022159)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2362 (class 1259 OID 1022160)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2439 (class 1259 OID 1022395)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 1022394)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2324 (class 1259 OID 1022072)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 1021931)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 1021930)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2284 (class 1259 OID 1021963)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2285 (class 1259 OID 1021964)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 1022143)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2349 (class 1259 OID 1022142)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2350 (class 1259 OID 1022141)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2331 (class 1259 OID 1022100)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2332 (class 1259 OID 1022096)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2333 (class 1259 OID 1022093)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2334 (class 1259 OID 1022094)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2335 (class 1259 OID 1022092)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2336 (class 1259 OID 1022097)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2337 (class 1259 OID 1022095)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2291 (class 1259 OID 1021983)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1022054)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2314 (class 1259 OID 1022056)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2315 (class 1259 OID 1022055)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2316 (class 1259 OID 1022057)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2367 (class 1259 OID 1022168)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2283 (class 1259 OID 1021955)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2306 (class 1259 OID 1022026)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2387 (class 1259 OID 1022218)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2303 (class 1259 OID 1022014)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2424 (class 1259 OID 1022336)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 1021904)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2338 (class 1259 OID 1022099)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2473 (class 2606 OID 1022541)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2476 (class 2606 OID 1022526)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2475 (class 2606 OID 1022531)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2471 (class 2606 OID 1022551)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2477 (class 2606 OID 1022521)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2472 (class 2606 OID 1022546)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2474 (class 2606 OID 1022536)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2458 (class 2606 OID 1022456)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2494 (class 2606 OID 1022636)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2492 (class 2606 OID 1022631)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2493 (class 2606 OID 1022626)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2470 (class 2606 OID 1022516)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 1022676)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2502 (class 2606 OID 1022666)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2501 (class 2606 OID 1022671)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2490 (class 2606 OID 1022616)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 1022711)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2510 (class 2606 OID 1022716)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 1022721)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2512 (class 2606 OID 1022736)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2513 (class 2606 OID 1022731)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2514 (class 2606 OID 1022726)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2464 (class 2606 OID 1022491)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2465 (class 2606 OID 1022486)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 1022466)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2460 (class 2606 OID 1022461)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 1022441)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2455 (class 2606 OID 1022436)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2496 (class 2606 OID 1022646)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2478 (class 2606 OID 1022556)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2451 (class 2606 OID 1022416)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 1022421)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2497 (class 2606 OID 1022661)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2498 (class 2606 OID 1022656)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2499 (class 2606 OID 1022651)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2468 (class 2606 OID 1022496)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2466 (class 2606 OID 1022506)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2467 (class 2606 OID 1022501)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2482 (class 2606 OID 1022591)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2484 (class 2606 OID 1022581)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2485 (class 2606 OID 1022576)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2483 (class 2606 OID 1022586)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2449 (class 2606 OID 1022406)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 1022411)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2495 (class 2606 OID 1022641)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2491 (class 2606 OID 1022621)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2505 (class 2606 OID 1022686)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2504 (class 2606 OID 1022691)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2462 (class 2606 OID 1022476)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 1022471)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 1022481)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2507 (class 2606 OID 1022696)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2506 (class 2606 OID 1022701)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2519 (class 2606 OID 1022761)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 1022756)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2517 (class 2606 OID 1022771)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2521 (class 2606 OID 1022751)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2518 (class 2606 OID 1022766)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2503 (class 2606 OID 1022681)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2486 (class 2606 OID 1022611)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2487 (class 2606 OID 1022606)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2489 (class 2606 OID 1022596)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2488 (class 2606 OID 1022601)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2515 (class 2606 OID 1022746)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2516 (class 2606 OID 1022741)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2469 (class 2606 OID 1022511)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2508 (class 2606 OID 1022706)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 1022431)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2453 (class 2606 OID 1022426)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2457 (class 2606 OID 1022446)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2456 (class 2606 OID 1022451)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2479 (class 2606 OID 1022571)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 1022566)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2481 (class 2606 OID 1022561)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-23 12:30:03 CEST

--
-- PostgreSQL database dump complete
--

