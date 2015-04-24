--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-24 12:14:24 CEST

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
-- TOC entry 179 (class 1259 OID 1252873)
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
-- TOC entry 225 (class 1259 OID 1253356)
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
-- TOC entry 224 (class 1259 OID 1253339)
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
-- TOC entry 217 (class 1259 OID 1253255)
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
-- TOC entry 193 (class 1259 OID 1253039)
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
-- TOC entry 196 (class 1259 OID 1253080)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1253001)
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
-- TOC entry 212 (class 1259 OID 1253205)
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
-- TOC entry 191 (class 1259 OID 1253026)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1253074)
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
-- TOC entry 201 (class 1259 OID 1253123)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1253148)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1252975)
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
-- TOC entry 180 (class 1259 OID 1252882)
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
-- TOC entry 181 (class 1259 OID 1252893)
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
-- TOC entry 184 (class 1259 OID 1252945)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1252847)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1252866)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1253155)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1253185)
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
-- TOC entry 221 (class 1259 OID 1253297)
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
-- TOC entry 183 (class 1259 OID 1252925)
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
-- TOC entry 186 (class 1259 OID 1252967)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1253129)
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
-- TOC entry 185 (class 1259 OID 1252952)
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
-- TOC entry 190 (class 1259 OID 1253018)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1253141)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1253246)
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
-- TOC entry 220 (class 1259 OID 1253290)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1253170)
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
-- TOC entry 200 (class 1259 OID 1253114)
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
-- TOC entry 199 (class 1259 OID 1253104)
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
-- TOC entry 219 (class 1259 OID 1253280)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1253236)
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
-- TOC entry 173 (class 1259 OID 1252818)
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
-- TOC entry 172 (class 1259 OID 1252816)
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
-- TOC entry 209 (class 1259 OID 1253179)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1252856)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1252840)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1253193)
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
-- TOC entry 203 (class 1259 OID 1253135)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1253085)
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
-- TOC entry 182 (class 1259 OID 1252917)
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
-- TOC entry 198 (class 1259 OID 1253091)
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
-- TOC entry 218 (class 1259 OID 1253271)
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
-- TOC entry 188 (class 1259 OID 1252987)
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
-- TOC entry 174 (class 1259 OID 1252827)
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
-- TOC entry 223 (class 1259 OID 1253321)
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
-- TOC entry 192 (class 1259 OID 1253033)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1253162)
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
-- TOC entry 214 (class 1259 OID 1253228)
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
-- TOC entry 194 (class 1259 OID 1253061)
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
-- TOC entry 222 (class 1259 OID 1253311)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1253218)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1252821)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 1252873)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1253356)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 1253339)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1253255)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1253039)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1253080)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1253001)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-553a-177d-42aa-ffcca87f157a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-553a-177d-8735-f44a534a37ed	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-553a-177d-837c-e47d5c5d4162	AL	ALB	008	Albania 	Albanija	\N
00040000-553a-177d-4891-92c5e1920dc3	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-553a-177d-29a0-c61b1da69479	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-553a-177d-7ae2-1acedd762c5d	AD	AND	020	Andorra 	Andora	\N
00040000-553a-177d-1f29-eeaf77188faf	AO	AGO	024	Angola 	Angola	\N
00040000-553a-177d-8db8-e02a32346ecd	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-553a-177d-4611-11aa365fffc9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-553a-177d-3a8e-9a6aa37d8569	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-177d-3024-0d57a8e0586e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-553a-177d-b2e1-22299e3006fe	AM	ARM	051	Armenia 	Armenija	\N
00040000-553a-177d-5821-835de736f844	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-553a-177d-55d8-b1c1dd6a6f4c	AU	AUS	036	Australia 	Avstralija	\N
00040000-553a-177d-9f51-06b8a98a721e	AT	AUT	040	Austria 	Avstrija	\N
00040000-553a-177d-195c-c71c1957ff02	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-553a-177d-bc1b-d5ff013205c5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-553a-177d-b1f3-1bb601a23299	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-553a-177d-7f72-f9bfa68e8af5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-553a-177d-18a4-e970f5358fa5	BB	BRB	052	Barbados 	Barbados	\N
00040000-553a-177d-343f-1a4c0863e14c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-553a-177d-ffc9-3c5ecc89a2ec	BE	BEL	056	Belgium 	Belgija	\N
00040000-553a-177d-7820-e72ddc1c4a84	BZ	BLZ	084	Belize 	Belize	\N
00040000-553a-177d-77fd-b42f268aba5c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-553a-177d-f267-b96f2cb476e3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-553a-177d-6d23-fae5ff6bc436	BT	BTN	064	Bhutan 	Butan	\N
00040000-553a-177d-ee84-2048e3d12b10	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-553a-177d-27cd-51c0149e0222	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-553a-177d-b42e-5a6cc14928b9	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-553a-177d-a3e9-4428a1e94178	BW	BWA	072	Botswana 	Bocvana	\N
00040000-553a-177d-c47e-b7472836966d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-553a-177d-5b50-92a95f043687	BR	BRA	076	Brazil 	Brazilija	\N
00040000-553a-177d-2578-774ca05eb11b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-553a-177d-dfc2-0e8e047ddb0c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-553a-177d-fba4-8ae2e98156e5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-553a-177d-acd0-6e2f3a5e96f5	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-553a-177d-306f-544bd6257777	BI	BDI	108	Burundi 	Burundi 	\N
00040000-553a-177d-2a25-74a4cf00e557	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-553a-177d-59c4-77ffabc19e52	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-553a-177d-292c-9e6f8bf2fb29	CA	CAN	124	Canada 	Kanada	\N
00040000-553a-177d-fd73-4772573de9d5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-553a-177d-42e9-f3155e167584	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-553a-177d-a834-bb8bee63349d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-553a-177d-1e36-67897ba53b6c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-553a-177d-3f9e-22d00243b6e5	CL	CHL	152	Chile 	Čile	\N
00040000-553a-177d-5660-071bae452f88	CN	CHN	156	China 	Kitajska	\N
00040000-553a-177d-4280-d217dcba0a58	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-553a-177d-3c7a-96ac100c87fa	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-553a-177d-e91a-4a57c39ad4aa	CO	COL	170	Colombia 	Kolumbija	\N
00040000-553a-177d-8c8c-56f46e1e9015	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-553a-177d-c6d4-68c2d954d465	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-553a-177d-ecb9-39b75227ba83	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-553a-177d-7325-877697f1dbb9	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-553a-177d-1944-8c9fcadffd9f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-553a-177d-278a-f13c90dd4bf3	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-553a-177d-8933-fdb76a189024	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-553a-177d-6a3f-d3dd60e37fe4	CU	CUB	192	Cuba 	Kuba	\N
00040000-553a-177d-5d1f-9c4499042696	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-553a-177d-44a9-fd233ccee0a7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-553a-177d-4a0f-4563df2a6745	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-553a-177d-f2a2-1ca0550a5eb6	DK	DNK	208	Denmark 	Danska	\N
00040000-553a-177d-81ca-4537ee573680	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-553a-177d-ef9d-88c95ddc40d4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-177d-b445-5ff268735193	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-553a-177d-cfe0-c8812c584146	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-553a-177d-e3d0-77ed4b0fa300	EG	EGY	818	Egypt 	Egipt	\N
00040000-553a-177d-7439-7d6cae764521	SV	SLV	222	El Salvador 	Salvador	\N
00040000-553a-177d-e0a0-4567f548fdf4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-553a-177d-f0ef-4fbf41170631	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-553a-177d-dc40-0828dc329f38	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-553a-177d-e814-79e1bb72fa9d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-553a-177d-13c1-b76c9897f6e6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-553a-177d-02a5-4a2cae30998a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-553a-177e-33a9-fb08604706a3	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-553a-177e-a01f-ace50e9a2ed4	FI	FIN	246	Finland 	Finska	\N
00040000-553a-177e-db62-8ba728aa6294	FR	FRA	250	France 	Francija	\N
00040000-553a-177e-1b89-26db392b1ccb	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-553a-177e-2df9-83d47ce449a8	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-553a-177e-47ec-125a75343a2b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-553a-177e-c11a-af3dc8b9575d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-553a-177e-2b3a-560d6a40efef	GA	GAB	266	Gabon 	Gabon	\N
00040000-553a-177e-e824-7d530a4e1224	GM	GMB	270	Gambia 	Gambija	\N
00040000-553a-177e-dc4c-ede6fcf8e0e1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-553a-177e-124e-6ed36789008f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-553a-177e-d91a-5a3dc2dbaaee	GH	GHA	288	Ghana 	Gana	\N
00040000-553a-177e-9304-3c00a93a21ff	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-553a-177e-e856-93c2d3ce4b6c	GR	GRC	300	Greece 	Grčija	\N
00040000-553a-177e-3a29-0b84bea4f9e6	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-553a-177e-924e-5112ddc59bcf	GD	GRD	308	Grenada 	Grenada	\N
00040000-553a-177e-3ae1-39e35ce0c014	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-553a-177e-5729-8917765e90a0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-553a-177e-ee5d-7bf0a5ab4acc	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-553a-177e-f7f8-9ee652d2a729	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-553a-177e-8470-006776d47577	GN	GIN	324	Guinea 	Gvineja	\N
00040000-553a-177e-4209-4e11c31f9eb4	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-553a-177e-88db-7febdb6178b1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-553a-177e-5983-e1504e40ec5c	HT	HTI	332	Haiti 	Haiti	\N
00040000-553a-177e-8319-1dd3ba9e7752	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-553a-177e-de3d-9d0f2b7deab2	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-553a-177e-758e-d9320591f49f	HN	HND	340	Honduras 	Honduras	\N
00040000-553a-177e-aa57-e9f92009e95a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-553a-177e-8092-a8574ed56350	HU	HUN	348	Hungary 	Madžarska	\N
00040000-553a-177e-8004-91a99c53b30b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-553a-177e-c06c-46fbf9f53145	IN	IND	356	India 	Indija	\N
00040000-553a-177e-6c7f-fea0d39c18d0	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-553a-177e-f980-21b3576814f4	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-553a-177e-041f-d80d60e7c782	IQ	IRQ	368	Iraq 	Irak	\N
00040000-553a-177e-a5f1-2b0e236edaba	IE	IRL	372	Ireland 	Irska	\N
00040000-553a-177e-7289-5343f88b3803	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-553a-177e-9bf3-a00c90762cf0	IL	ISR	376	Israel 	Izrael	\N
00040000-553a-177e-fd54-84611ec520b8	IT	ITA	380	Italy 	Italija	\N
00040000-553a-177e-86ba-70f3e59f81af	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-553a-177e-de13-17f7761c8319	JP	JPN	392	Japan 	Japonska	\N
00040000-553a-177e-c0cd-fabaa46998f2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-553a-177e-ed16-d6a974187b92	JO	JOR	400	Jordan 	Jordanija	\N
00040000-553a-177e-e641-49e504cbd1c3	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-553a-177e-9b2e-db4ea17bbb0b	KE	KEN	404	Kenya 	Kenija	\N
00040000-553a-177e-27ba-0ed2fcd50139	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-553a-177e-9d55-06f861da4ee2	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-553a-177e-93a7-887f1da09921	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-553a-177e-1c18-5051a4608f18	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-553a-177e-5899-eb79b53136f6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-553a-177e-24bf-d3d1a8c44a67	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-553a-177e-271f-b427b43d88ac	LV	LVA	428	Latvia 	Latvija	\N
00040000-553a-177e-3c0e-28b4a80a4fe3	LB	LBN	422	Lebanon 	Libanon	\N
00040000-553a-177e-d917-ce1fd3fcfa13	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-553a-177e-d717-c1fd7f361297	LR	LBR	430	Liberia 	Liberija	\N
00040000-553a-177e-4935-25c1a5e766c0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-553a-177e-79fd-abd8ec3bf2f0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-553a-177e-395a-8deaf3d88713	LT	LTU	440	Lithuania 	Litva	\N
00040000-553a-177e-1ffc-e3e84e5fa765	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-553a-177e-57de-4dc20168e38e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-553a-177e-3ec1-50d60f9baa2c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-553a-177e-16ea-a7eba7d34ce6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-553a-177e-cd36-ef5f896de9c6	MW	MWI	454	Malawi 	Malavi	\N
00040000-553a-177e-ef7e-5143007da24b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-553a-177e-a7f3-8877869f374f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-553a-177e-04b8-6ac3da18b819	ML	MLI	466	Mali 	Mali	\N
00040000-553a-177e-c811-2658c0eb9b06	MT	MLT	470	Malta 	Malta	\N
00040000-553a-177e-530b-be5f2ba4bbd1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-553a-177e-0a75-ff4a50af3ace	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-553a-177e-35f2-e93e5d7748fc	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-553a-177e-56e6-c992526e7509	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-553a-177e-59bb-cdae0135af1f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-553a-177e-a837-2c6ba7c3a96c	MX	MEX	484	Mexico 	Mehika	\N
00040000-553a-177e-0c0d-a5de59968009	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-553a-177e-fc6d-5e3b7bc633ef	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-553a-177e-84d9-c3253b745f66	MC	MCO	492	Monaco 	Monako	\N
00040000-553a-177e-acb8-7274bb210940	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-553a-177e-5c96-4e7cff9d0c65	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-553a-177e-3bca-edc40f95f61b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-553a-177e-696e-131540dd3861	MA	MAR	504	Morocco 	Maroko	\N
00040000-553a-177e-8a5e-5129af60ba7c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-553a-177e-c719-d07c7d02eb7c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-553a-177e-4135-6651fdb8cff8	NA	NAM	516	Namibia 	Namibija	\N
00040000-553a-177e-2da6-f021e4ebbbe0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-553a-177e-a5ab-1c7e69514bd1	NP	NPL	524	Nepal 	Nepal	\N
00040000-553a-177e-cd6b-b51d510b0fb9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-553a-177e-e3ff-83c9de49c112	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-553a-177e-65f1-4cd813a981e9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-553a-177e-da8f-a0bb2d50c88e	NE	NER	562	Niger 	Niger 	\N
00040000-553a-177e-10ed-64f18695d45f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-553a-177e-e52c-9c61b3e93482	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-553a-177e-8c76-60e28d90cfad	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-553a-177e-dee9-e6675da97253	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-553a-177e-9e8a-a0587dd7a255	NO	NOR	578	Norway 	Norveška	\N
00040000-553a-177e-5624-e4afd5f5d843	OM	OMN	512	Oman 	Oman	\N
00040000-553a-177e-5898-ff82c85c6dcb	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-553a-177e-ad2d-3fb0e65349c1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-553a-177e-a3d2-15c2d4c88fdc	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-553a-177e-e09d-b1b5203b7088	PA	PAN	591	Panama 	Panama	\N
00040000-553a-177e-7c91-cff8431c25d8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-553a-177e-43fc-801c26152791	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-553a-177e-cb2c-6f521e4aa6ce	PE	PER	604	Peru 	Peru	\N
00040000-553a-177e-2328-56df5a13ebb4	PH	PHL	608	Philippines 	Filipini	\N
00040000-553a-177e-36ba-cb90096aa6fa	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-553a-177e-2759-a8a2afd8f828	PL	POL	616	Poland 	Poljska	\N
00040000-553a-177e-f212-1f64dfc92412	PT	PRT	620	Portugal 	Portugalska	\N
00040000-553a-177e-5194-921362c39422	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-553a-177e-0ad7-6c0779d22d8d	QA	QAT	634	Qatar 	Katar	\N
00040000-553a-177e-0a0a-8bec93c12933	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-553a-177e-42d6-d62dc3e13018	RO	ROU	642	Romania 	Romunija	\N
00040000-553a-177e-f0e6-0e6ab83c60c1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-553a-177e-913b-1d070d000241	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-553a-177e-0477-1dd0657b39ac	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-553a-177e-d434-686d07640d2f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-553a-177e-c664-701e6316fb17	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-553a-177e-8c5b-f4714c4e16b1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-553a-177e-5786-10b287fdefa4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-553a-177e-0deb-cca3a192708b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-553a-177e-de0f-07eed2a450ce	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-553a-177e-ef1d-49ac25036fd0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-553a-177e-819c-7e1b6dd61445	SM	SMR	674	San Marino 	San Marino	\N
00040000-553a-177e-88e5-f49a2f34370a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-553a-177e-3839-e97fc2d6360d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-553a-177e-c771-c45761e36c84	SN	SEN	686	Senegal 	Senegal	\N
00040000-553a-177e-2510-b33c1af7da98	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-553a-177e-62ca-f3e214004944	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-553a-177e-3d74-fb6d9e8eae18	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-553a-177e-d561-2f7f1967e8f9	SG	SGP	702	Singapore 	Singapur	\N
00040000-553a-177e-1910-6554ae5cf551	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-553a-177e-faa7-d2e800a59b34	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-553a-177e-aa72-484cda4bfa7b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-553a-177e-6dd0-a2f01343730d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-553a-177e-5a94-c1f8e2677d2b	SO	SOM	706	Somalia 	Somalija	\N
00040000-553a-177e-292f-c33f1358fdfa	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-553a-177e-4c95-afa144445aea	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-553a-177e-a21d-f272ddc0a274	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-553a-177e-fe1b-c54e2c4b1392	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-553a-177e-34ef-aa6fd285fd46	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-553a-177e-73ab-c73504b03457	SD	SDN	729	Sudan 	Sudan	\N
00040000-553a-177e-12b1-b4ddc28ca830	SR	SUR	740	Suriname 	Surinam	\N
00040000-553a-177e-6e87-9f2d67e2d9b6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-553a-177e-56b7-90748cded4de	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-553a-177e-51d4-8eefa05e8368	SE	SWE	752	Sweden 	Švedska	\N
00040000-553a-177e-8408-bc62bbc7958c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-553a-177e-1356-2db0c935d7d1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-553a-177e-f97a-78b90e61aa89	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-553a-177e-67f7-cd4de547ad2d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-553a-177e-b0bf-dd96ce338542	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-553a-177e-2927-3b2e4fc2f6be	TH	THA	764	Thailand 	Tajska	\N
00040000-553a-177e-6dec-45cd72433dff	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-553a-177e-d3b2-108978aea870	TG	TGO	768	Togo 	Togo	\N
00040000-553a-177e-4015-d6f7c749bd66	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-553a-177e-3434-ea7a44e19fdf	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-553a-177e-01ad-cdb5d6e0690f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-553a-177e-f803-a801d93af80f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-553a-177e-98a5-5fd4fb2f9d9f	TR	TUR	792	Turkey 	Turčija	\N
00040000-553a-177e-13bd-1fe27a09e83e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-553a-177e-2019-9dfd6337f49a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-177e-b773-ad62a4c5f5a1	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-553a-177e-a47b-35ebd71b4683	UG	UGA	800	Uganda 	Uganda	\N
00040000-553a-177e-e1c6-4b2fd3dca562	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-553a-177e-d2da-177669ca205c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-553a-177e-c0b7-0ee96044753c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-553a-177e-6e29-75839c209088	US	USA	840	United States 	Združene države Amerike	\N
00040000-553a-177e-e750-b9ed5f31e045	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-553a-177e-f461-fd20b8476d54	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-553a-177e-9ff6-3425bbda7066	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-553a-177e-8c51-72d237b94fe0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-553a-177e-bc74-ed4a6560a94e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-553a-177e-21f3-6660d88e4f12	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-553a-177e-2595-fa9b1a1f0680	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-177e-bb89-7de6515aae16	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-553a-177e-69ba-2adc896329a9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-553a-177e-2ad0-b0cd05a507ae	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-553a-177e-734c-39d2c839781a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-553a-177e-6ece-ce61fe321dce	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-553a-177e-33b9-ad58e827dd2e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 1253205)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1253026)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1253074)
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
-- TOC entry 2658 (class 0 OID 1253123)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1253148)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1252975)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-553a-177f-6d62-398e74afaba8	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-553a-177f-e8b4-198288dc6a9c	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-553a-177f-9ea3-acdfbf798f79	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-553a-177f-1b45-582ee26631e4	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-553a-177f-d1db-3f36e46569d7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-553a-177f-5450-9d4591eb3c95	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-553a-177f-76c7-17c5400be8ba	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-553a-177f-415d-e57d91222ad8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-553a-177f-8ec2-d0808b46d553	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-553a-177f-2362-47bf6a52bcb8	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 1252882)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-553a-177f-63de-44d848d7e382	00000000-553a-177f-d1db-3f36e46569d7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-553a-177f-b28f-667bf2c6277a	00000000-553a-177f-d1db-3f36e46569d7	00010000-553a-177f-114e-9b7524c332ba	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-553a-177f-5580-f800d6d8e903	00000000-553a-177f-5450-9d4591eb3c95	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 1252893)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1252945)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 1252847)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-553a-177e-f5dc-b660b4937fe3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-2b9f-c92466813a73	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-9717-2e3c2248d958	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-7c5b-d30c7e8e0edb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-5236-3ca67ae28d27	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-91c9-e300a97237c0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-ae89-2aba27673061	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-1656-38aaa45559e9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-7917-0f9ae9f626ae	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-a550-4a8f94fb9ea0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-fa42-e0a70d1fbc64	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-eb4f-09fecac121e9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-78c5-f33a3ce9fda2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-0cbe-61a50ae4d212	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-c792-3aeb5560d6af	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-4b46-3437bce4762c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-c8d9-c5732a61089e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-53e3-15759a42411c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-24a0-ed70b5588eab	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-01e8-cb591d822146	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-c6d2-76719e6cd30e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-4d1f-1a6177d64d1a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-63f8-558e44f4f663	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-68cb-f7da030e3e1b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-8a54-f98c42625070	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-06f9-c11b4e604648	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-94c6-10e6b4e70279	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-f3f5-c71688c5e338	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-7bdf-fe55686154e0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-7df4-8404543b024a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-6829-18ef9c26c489	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-2e87-f1b3d1206de0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-6d6e-b889bd65d686	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-41d5-f103ffa121de	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-ec36-3899ac543ab5	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-cac5-c687e63d707e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-8524-53d2540e6658	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-9ce4-faffd2d5b42d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-bdc2-bf282592d94d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-4b31-f82553224cc4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-6c22-78da9e53d7c2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-1003-9e32d171eb03	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-c2bd-21715f338e12	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-acc0-875f2d79fe7c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-a643-19677415cb35	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-08c8-4d95b7e2ebb4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-80a6-6c04e27e3ae8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-0b1b-d3ab83d0e50e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-88e9-d24d60e2a0c2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-f4c2-952e32fbe41f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-dd2c-309f9ee5a790	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-8ece-a6917dfd8833	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-0eea-a152a0ef078c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-eb79-019147120c0d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-25cd-82848c724560	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-10fe-cabf57e934b5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-b0d5-b04cd1c2fab2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-d5ee-000dd3dab8f8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-542f-5b10074432a2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-3d5b-8e3310bd28f8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-fc34-408515dd046b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-5b4f-2a9d56cb22c0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-a337-7b215fdfafb8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-024d-b146b6061476	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-5cac-54590f92dafc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-1e58-47938511b04d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-6314-47c287b03fae	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-745a-e4e50ae5327a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-4c50-f371b66df32b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-5f2b-3790039226ad	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-c8db-8bc234a426dd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-9b69-7cb8470a825e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-9d9b-bf4252d8c3e9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-36c5-abc908a91fbe	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-0ad8-c1bf550134fe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-f4c8-2cdd53f48e92	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-ae19-3c4dbf4e8820	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-bd46-a0db97b523b3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-5a72-48fddedfda87	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-3b6f-7dbd12980d0f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-bee1-02d27a5ff470	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-167f-c391393de730	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-c7ab-eb8c116746fb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-7bfb-76ee102f4f47	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-716f-e11ec64e9a3e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-149c-0d8284ee575a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-f2f5-ab405d7970d5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-4e39-0b418e73bc9f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-65de-bce66644ed8c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-1da3-17709c4b7d55	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-3e71-3f228f39465e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-5817-73c60ef776ea	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-f7ac-4726f7da0b31	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-90ed-3e5ef018a6a7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-e0b8-7bb1091cab1c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-8f0f-18aac211dd78	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-731d-c856da66bf21	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-cd76-306a25cdbe55	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-4406-e943d3cda2b6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-22ed-ca383fde0927	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-cd62-d61db176514f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-ccc5-c5c77a099633	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-42d3-c0113ac33143	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-d1e2-a0736147d504	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-63fc-8125886a4525	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-3090-48b58493c154	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-c640-147412ec8254	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-47e8-331c0f03f5d5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-adf9-3d61ad5850ac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-37d5-190cc670b302	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-b3ae-660a3bee9b7c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-c58c-dd7aab878b86	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-0822-8caa94bcb13f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-43f9-2b49ec500016	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-8fef-210375f00e44	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-a2ea-92c16b08ceda	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-4ebf-69c6e0d42ae2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-08ed-3cbe741da760	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-224f-349aba067684	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-9c6d-5ee57da4236e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-8d13-70d54133f10e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-4ffc-a4a275659c91	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-eb73-5e8fec380caf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-5a60-16bfea27932d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-7656-1a170603fff1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-c214-234cb1a39947	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-678d-853a3cfab8da	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-8dde-67bafeb11edf	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-a1a2-a86c5cb7a26a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-d248-63acdde3121f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-948a-835d4d61980c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-d9a8-da022f359991	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-77d6-ea22bc8761d8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-2b39-45f8ae0b5e9a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-1713-8756f4277c0c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-39db-2c378a9a6519	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-76c8-72e85ad8c607	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-f918-c575c46a9eee	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-4772-e503fb46dc30	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-06c5-87e9e6c51d5b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-9ca2-3d550b808b3e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-6feb-ae6d1aab4469	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-2040-ac8c361af015	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-4c68-95eb05727e57	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-6ad0-6babfd2608d1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-a277-c4f3c41ff3d9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-27d2-7539615a8270	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-04ca-426588e21004	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-3bd5-b5e890e35c77	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-eaf1-beb9ad313ce0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-e9f1-847b738ba8e7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-5be3-c607f6f1a171	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-6184-611f9a60c788	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-15ff-5774570645ce	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-8d1a-0018b56d1f71	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-b429-fb98c5b673bb	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-43eb-040758eade7c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-3307-109f2a3a65a7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-3f8f-7a4fefea576c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-15b6-7c411a5cfcc8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-b364-acdf4434eb39	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-52b7-4c06f5c27aa0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-aa65-c0f39cd57775	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-e4b7-59f5396deb8d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-8869-ef34753d569a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-e112-251870c38bfb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-ec1b-6898e4bce68d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-b0b4-9a8792057efe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-9f0d-5eb8687b1138	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-315c-6496383f5662	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-b710-48852f91b637	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-90b3-d352e49009f5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-f4ea-e5fe1b1d2735	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-f4ce-e81b424648bb	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-5b52-b6465470b8e3	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-0daa-88568400ce42	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-e5b5-ffe3e9010366	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-97ce-ca2608e37e41	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-c6dd-3c0700dd82f0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-23e4-cd307d058443	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-ca1a-a4f85436bb79	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-0312-eeed193623ba	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-ed08-af714fa8d0a1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-1524-bccf0716cf68	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-57f4-851a24ab5b64	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-f8ce-7255a193334b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-0722-212ed9175fe7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-e75e-961a40033f49	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-e2d1-0259b0c65196	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-42c0-ea0a8ea8866e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-f5aa-2c7abc30d270	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-d2c6-0ce6a4e5ec22	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-12a9-ffd90966aa3e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-2f45-a32ffe72a0d2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-7149-f7a18f605df2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-e351-84fb4ef448bb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-f5aa-1ed39196bb79	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-1bb1-950d3f8eb03b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-4d91-87b34652dbf7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-b484-0a9a877ca045	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-db59-2e88004cdd54	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-7ea8-ad48d5536e74	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-c8f4-deba54255c73	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-0b2a-badef1eddd8d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-87ea-8785ff3d838c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-be91-2a6de11e886b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-eaba-7ba78a93c618	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-66b9-87cd6a5af080	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-3735-af4408a8b574	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-a9de-d99d195f9faf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-014d-9150254fa301	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-10d6-ecb920770bd0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-dcdc-45a92492e56e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-f7c8-e1e4d3b29d8e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-4853-0533b777afbc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-8d9b-6e9beeccb526	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-e66a-68124bc6d89d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-e0b4-9ae655c2226d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-a8f1-322aee95a5ab	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-1148-555ca814c524	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-9c13-284fb2787e44	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-96f5-a2d3bf4b4f88	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-5a58-f3efcd6dadd3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-cb17-8ef72df426b7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-02d2-60e5fce570a3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-f20c-5e9b6f44830d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-60d2-e6fe6230d4e4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-300c-dfd2315c0538	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-a998-ed5c15cd515b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-b674-ad1f5ef3c9d4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-782e-0dd8f1858fcf	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-4448-82c396b6b15d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-35f3-d46be7c63f74	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-7366-b82807992ac4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-5238-103409d133cd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-2828-25b1872ca3a9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-d7aa-e30ad895fa60	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-d8e0-ee84f894c4c7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-b4ef-221737af5e0d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-db08-ebf1511c5216	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-1ef4-06f88763cf6a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-f862-d4c7681d199f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-7e07-7c6a04454d53	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-ca63-a06f6a908a0a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-6829-b68eb52cc82d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-2f47-0e6188877bc8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-8592-ce8d783c3d22	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-4ed4-7fcc91d5d02f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-ad18-a3f8fb397e41	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-b656-e95e689adc28	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-8fdd-2f7679dc2033	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-be99-542b8fe51428	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-d22e-8f01489484ad	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-ac31-132fd54e7702	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-1cd9-3bcd7ee99d76	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-c3ac-dcfb0724c952	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-f2ef-e6ce74e37a24	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-85d9-094663cac1bf	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-97a3-3a8accd4ea9b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-63d2-c396718b1e1b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-190b-49a8c80942dd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-85b3-0c6b6d393490	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-f76c-2f238a3b20b5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-89ca-45cdf13d237e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-9005-7a453e71b66f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-371e-5b7e6694844b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-7433-4c29e98d4a21	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-9797-a0fcd6f9ce06	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-fcf5-b753c38803bb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-1867-2c2caacd80b2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-7d4d-927343d744d1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-a1d5-ebd60f7e8af1	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-453d-93997fdb0717	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-cb9c-84cc2085225c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-794f-eaa459d973db	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-fe07-f3fe37bd3514	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-0ab6-ca202ece0229	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-e448-de2bc03c7e85	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-84e9-dfa195ba546b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-c748-bc55201457f4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-871a-f9e4e729a929	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-7519-d49281028835	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-bbf5-0f2feb50344a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-926b-517864478a64	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-ceaa-c8b1ec83327f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-10ab-657310c8a82c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-0c56-9f3b32dbe8eb	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-f327-f62d0c71b362	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-dac0-7c5e7f7de966	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-4a5c-edbd48809e0f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-440a-dabe37ab8070	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-4956-e22484630b08	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-6eb8-bf325ba90250	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-2028-c71b82fb1ef4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-27fd-c958170cfd49	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-f162-cdd798a87b9f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-364a-54f323678f8f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-2fda-1856462dc440	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-e309-a476dbbb45ab	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-e050-4a2b8d033c22	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-1901-26443f4409f0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-d09d-799fdb4504ec	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-9aa9-3197253168da	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-08d9-f435533e6591	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-f646-c77db9e3c4a6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-7990-4fa82e0e5dcd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-2aee-782e97c1482d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-185d-a8d868ce4f84	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-1f0c-b1069f5482c8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-8bf1-56fdc532197d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-514c-630b5daaa7d0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-0cfb-feeee2d33ef4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-4dbf-09484cca8cd2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-b2a3-9d86bc13ec32	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-34d9-90c5e5681feb	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-4fd6-dd92a2e16cca	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-d436-910bb9adb2bc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-74b5-210e09eb169e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-24d1-5f64906edb3a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-12eb-57f13d018a27	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-adac-94a09d999425	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-b44d-7a57acb56897	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-3a66-5b74e8418bf5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-0f93-20a4a5d54fff	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-6630-8b2e74f06f6b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-b6fe-e7e2b9506ae9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-5617-deb5978a70f0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-402b-9609d00c669b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-98dd-e14221c6056d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-b396-0b7600573a4c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-b143-54affe450f07	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-8e9e-ab0a64aad19e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-53cb-d50c604cf985	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-6a84-14a260341f6c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-0967-80cd05acf8f5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-b2bf-a1092e9bdb68	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-a886-4fbc34494c72	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-a36a-61fc72d91f5d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-dbf6-68dec75c1c70	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-ce83-c35486a760c2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-66cd-5e5724f4da51	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-0d6b-8e696ae5ebf4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-7bb7-d9ea8a32039b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-9ed9-05d418bcc8a6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-0b43-23b4c894623e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-ca10-b68a872a4354	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-a696-f1594d1e0d8a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-f1e7-09b01fa323d6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-0d9f-0012780077c6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-6469-2eefd8c83c68	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-b90a-3c29fcaf640a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-6b98-3edaa0d9456f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-f325-84944b47a95b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-cc85-2af1c14333ac	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-82ad-2aaaf22e2ab8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-2ac0-f553dcd67c0e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-85fe-af76467edbd2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-9e67-4cd1d6572074	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-b1d4-bc311ac80be2	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-5de6-8e587154a6d8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-617a-09f86fab775d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-e5e9-d05ae3c84839	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-19bd-374a188e56fa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-2949-0bc96d94790b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-cf82-ba2245573a3b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-0fc7-59560277f5f9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-1e9a-a9bf2569e38a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-3a37-d92bf23f25e5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-0f6d-7da9ea9d0622	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-c14c-03fd468fc3af	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-f7c1-fc90e16bdf4d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-5e94-32a09c2744f3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-5f31-d10cd079d64b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-87ad-cacd3548de1d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-5ce8-ffff4d8c62e0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-dce3-0dcb1b99aaaa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-5345-0aef6e20364e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-9b40-f2aecaca1d26	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-ee1b-27189f3259a1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-82f0-0d0775dbd5a6	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-6f1e-7fb6b8ea1c30	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-0a28-e9b05721c03a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-b2f5-9387603ed447	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-d8c1-ffe1dd47a70c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-3d4a-eb22ceb91498	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-5647-83aa2435af22	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-638e-940900548be7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-5a1a-ca0cbe16cd7e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-99c5-6c67f91a0f35	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-22b5-7003f2a79e80	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-c33d-1cbb1d075d17	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-7433-abe478298b81	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-0fff-d45f91ce8c9e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-4dd2-1548bc20f4ad	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-5bbe-72573b1c3cfc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-bc57-8aba9c2564a9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-00e1-5d92c9d0bea3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-07cb-90f8fef110f6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-0697-7ffff8f21ae4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-614b-ffd17badb671	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-e004-2d716fd172cd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-f12e-cae0bf56cba3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-3cdc-0bee54c382d8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-8804-4fd3280372e1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-72b4-d45fd2e4cb6e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-0f63-3f15f2d04578	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-91fe-b89a34c5eca7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-bca5-8dde84424832	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-7cf4-ed74fd715c69	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-ae3f-af4a738889b4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-f85c-d528ef063cb3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-1a09-eef1fbd87d8a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-bb44-e3e54a8b4d2d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-7894-e828ee4208bf	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-91aa-7330653b1d84	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-cf5f-7d33fd30da83	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-6758-6a9a253b171c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-bb8d-241cab337a25	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-a31b-62a58408f582	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-f472-0f5de97eb544	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-8cc5-c17eb1957b11	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-7c6c-7dd89b997c08	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-b538-0b36662da1db	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-05a8-dfb0b74e5830	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-5c88-4a3fb8532896	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-d264-d6289d547979	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-eb59-9104cd890432	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-59a9-8e1238e447bf	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-5695-d484e7a80e0c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-2ce0-1f37910d6fce	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-7c19-62016413c765	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-2872-98de94976546	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-358b-5e6cc22f9991	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-0cb2-5f0f19d1d0a7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-dd0a-c6a002aa91a8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-cc8f-54a7fd95d003	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-6577-09042743e478	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-c06d-dff8a8bfd059	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-183f-91a12c02be43	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-48c0-c09df2499fab	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-a1c2-c30bdadbb23d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-d6c7-e5f7bcfc004c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-e601-b58d3f09ae36	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-df3c-3f0f0a271657	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-47ea-28541aab1e00	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-4a42-fea5304d946c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-0802-987d53c2b988	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-e8ea-8819cf54e517	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-3d19-1f548d559a51	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-3529-99a312ff8e2f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-c51f-c1026f75c86d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-afd0-04eb3fb76b6e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-62fb-79dc80a9b3c9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-546c-5995d27dbbc4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-68bd-194fe4700c2c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-06ba-cae6955b7bb6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-8849-faa29e866e09	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-8a72-eb51fadd0b75	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-31d2-0070ba9e310e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-d953-aa6aa1a22d3e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-2b93-63b202792332	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-bc3e-45282313682c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-e464-c111ce924115	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-266a-01c35cbafcb1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-f4d6-5344e6ccb72a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-977f-987dc4497752	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-224a-368dcadfe015	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-57c5-23b45b7d409f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-faba-660f1bdfd985	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-fc27-aa394fd96f8d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-ebd5-c8daf79e5676	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-0cc0-12e6578c363b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-a1d3-bd1736bc689a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-c16f-29d678179b74	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-8bcb-9b35a1f16a0c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-1236-005a7f53d0df	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-232d-a51f172df30f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-2829-1ccd674b5504	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-d7e9-52b04a5a874c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-3010-cc51b8f8e8bf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-f3bf-3ff714702bfc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-a931-a424d30b977f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-817c-9714c28dff09	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-2e0a-d2af42d9b432	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-712d-03cf169b7cce	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-e7fd-07dae56f8fe5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-b174-6295f9fdda6c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-d226-59f0d369a5f4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-a3ae-00af6a606841	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-c221-2cd3be56d6c8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-7d6d-5a1b260c12e8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-dd74-46b5f32feb7c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-58b7-b12ff6b122ab	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-dcc8-70d6b8471357	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-ff0c-9a5c8012fa23	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-d952-45b05dc8c023	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-040b-d893d186f9f4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-b3ac-8473b57e31ea	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-e067-68c6f7712b37	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-6557-b8bcd941b486	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-b304-2c8565253c92	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-eff2-f2cd0385202f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-48ec-5740ae256148	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-6753-8f7a721784b7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-d71f-2a2f864c6445	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-5422-972c703df14b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-7a3b-ed3248430b70	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-0c0f-638bf017e7f2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-2068-fb2644c811c6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-15cd-b69bd281d606	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-8588-2f6884ba8ec4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-c08c-c91712571695	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-fc98-9ea14f8fe17a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-e115-408344614b30	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-d1e3-52c0f22efd33	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-8ec0-20dc3a56317e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-c395-e9adebdd235e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-710c-a0e3f7448b74	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-8df6-d51442ef6e12	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-697f-170343ad6be3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-fef2-9db0822768d8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-85a0-612fa1afcefd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-486a-efb6c9b522e5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-6373-d4845d7f1127	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-b2a5-e216191edba8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-44ce-e82da6f4b3e6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-57a2-bf19116c6440	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-20cf-6c6f384b53ce	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-ba8c-5ece6019c68c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-d4c5-34af51eca6ba	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-f7ad-d1c2c69ed9a6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-46f7-b514c65c7a0a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-44b0-d35d637b1f40	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-a27a-76c513161f90	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-988b-8fa56153cbd9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-9bc3-aeb83a426f04	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-f1dd-440158a7bc10	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-9232-c36b13a2c7f7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-4d02-d2c0fde96e79	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-8472-5a5efdccc39f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-6a62-67de97e2a900	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-b8ec-37576e3658d2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-b4de-8ae25b627cff	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-fa57-22c1dd4a9162	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-ac15-2312c719d9ab	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-ab0d-71fb650577b5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-e783-5c07f7b6bf76	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-05ad-34f650706672	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-2d32-1c8d4c2ce236	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-57f3-e58064222782	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-2802-5217432e994e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-fc5d-e1beaf39b8db	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-e635-6a8abdfacea1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-b0fe-445d559fba22	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-47e8-48ef0cbe3224	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-961e-b0630130c117	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-bc31-d44db7fc2e28	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-dd2c-2b1d6cd4a16e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-6401-de97f07adf91	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-5dd4-a302b146a43d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-6d87-0abae93c133d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-4515-78a3972d1ee4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-ee27-c3b2ae6dfca5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-2fc3-988a1e820565	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-202e-b1dbd5de0ff2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-b6a9-aeda6630494c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-6e42-5481fa1d6957	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-7475-e9a64596f200	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-6934-3b7e1430d0b0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-41a4-32e9f51d234c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-747e-64eb829c26a0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-6948-43e85b65d51f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-4890-2261d520bfa4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-c234-1f88c4fc46a9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-4294-8d724aba71c8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-4a93-98503f9b9004	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-359f-4e316cc85934	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-1e48-1cbe8abbccfa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-d3fb-c4ad94d7caa5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-2a11-6bea4a861f2d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-5d30-0e408f152edf	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-b792-37bdbf061d1a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-c1e8-3f2da204880e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-9765-ab62e9d356e2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-6b34-e57ec4557368	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-b293-62aeacf460be	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-7191-5cc22fab7b4d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-4cc7-a5dd5c880d3c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-ac94-68c3f70bf19d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-3f91-500d68fecbcb	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-eb54-ca96f03dc899	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-4091-9762ed756646	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-b57e-b3d583448dbb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-ca1c-2d726fbd24e0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-9e98-b7dfc5809489	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-dae5-c657f1f2b7f6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-d4bc-3fda3cc72e8a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-7841-1e1e5a7f2bdc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-c103-1f37c9bbe489	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-3422-b32844ba3d31	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-4131-c1cee6cd6ce1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-1ab0-8dea8bf61344	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-2e90-2e40d5a13492	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-e8fb-dd5610ef4884	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-808f-3f7557f34358	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-c7e0-6e1dcdac658e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-dc49-f47220e6ae6f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-fc86-2e794d5aad1b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-3c93-0458d982aa22	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-3887-fcb4ea201077	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-a9d5-34279d47ba82	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-e736-6fa351c6a7e0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-8bfd-3eb7f5b29738	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-0593-5a3b2e78c871	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-5b6d-907eec7d9a0f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-0893-0de4f36473a5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-8cb7-5ef90485ed50	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-3d9f-5ba48bdb25c9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-c567-df5f2b581094	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-9601-81e63565b5db	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-8295-316dd94d67c5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-e6d8-c69b20c4d06d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-49d0-ac604f1d39da	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-3aa3-088ca2ee38e5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-5576-c2910a6c34e0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-395e-36ade0daef63	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-e958-b7d28753fffc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-bf05-213dc5e6552e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-0e28-9d61a1ec8066	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-2857-03333269013e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-d364-eba9ed5d79f7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-9230-31074ae82299	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-746f-5346d96bba6a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-121e-81c1005715a6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-de69-beb58f5e06b3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-e94d-a85c32203d1f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-aaea-6ca6aa79da67	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-f27d-93f0a5ee16b6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-6ffc-92856b5cb921	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-8ac3-1b843ad25491	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-696f-79ba0a40f656	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-e849-58a0858ce884	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-f123-c9352d95fc85	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-a983-08ea57c8a50a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-6121-a047d66d3577	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-ffdc-37bd08c9faef	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-2981-310837ef7e26	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-8443-b103fedccd6c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-11e8-4cde1b182eee	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-0e36-3039359bf825	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-ba22-9f5d04368b51	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-268c-0f94f36374c8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-a4e3-c726cd0f2994	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-c169-6f9c29777c06	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-35e5-3faadb6d04b1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-82cc-e3a000162446	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-9fc9-c57b1edd2fe5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-2632-f6c6e655f2ae	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-6e80-792c03409232	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-70c4-86097abd5711	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-e1eb-b4d152b1b3eb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-4b2e-0bddf4754c92	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-256e-570315eecc6b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-a6bb-ff74a4ce9f4b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-6936-9f972813f744	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-4d5c-5b8123b684e2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-cbac-5024eeb9c1cc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-b776-4e58785ef812	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-d815-e205fd41840f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-337c-9721c8c2575b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-eb26-cc2436373586	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-b63f-1d41c88a740d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-4956-ff873ceeb5a4	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-4236-d632267aa9e7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-a564-cb4b9161d8cc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-6c21-15a3cdac4145	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-7132-783afb873de9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-ace4-de49340c17c4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-c644-19c769cf5601	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-0361-46ad7e24f8a8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-4755-ee1a93b6f691	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-8b01-fd19ac806218	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-3bd6-080a67e623b8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-3ae0-a78662b8a932	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-9b0a-3a3006fa4a76	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-056f-8c25e1eb92d4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-ae97-e12acc412751	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-60f5-45b593f81060	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-32b2-607c19b37e04	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-f423-a5a97d7b55f7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-62b9-72a1fc6deb9d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-a47c-8c9dc60bc056	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-3787-df8f744a5e5f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-3b8b-273b8696ff28	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-e478-3a7faec6b1c4	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-721a-7694325aeabe	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-1b56-029a172be0f7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-5f4d-01b2298df4fb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-a3b7-aa7b6d68938d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-7c69-d35c4a4730a2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-98b8-e5d3d93ff769	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-5e75-9f9adcff0ac8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-3e94-f5fea6dfc5fc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-e371-5b03acbb99f7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-97fc-9815c9a8460e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-503b-8e2b2e8f18d4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-70b5-635e679d8020	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-a52f-26504a70dde0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-cf7d-a77b28a2c807	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-c60a-73b43aa26be7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-72a5-31124f54d1d8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-8b87-31195d032d8a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-5d4c-6b24ea4cf1c1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-99f3-8edc9683fd3b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-6160-e29c6d77f71d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-3c8a-0c62059a6924	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-34c9-71149b1cba84	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-c596-58c398ff40be	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-0918-a168b17104a7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-1671-51a76d56724c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-1039-35573e1937fd	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-10b0-a6cb79e242fd	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-9464-8d5a025b3ec3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-d2c5-88b9aaa61a2c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-029e-a9825f16214c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-b556-55a69adf49ae	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-db5d-b35069a3a940	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-ea2f-1d74aed2f2c9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-53db-01fd83bfd99f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-08e6-3719d0bb01b9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-ffb6-45125b0cc698	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-b9e7-f2d5e8971b93	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-d495-a604f901553b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-e062-b99cc64c4c1b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-056b-329449e7a295	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-9be2-ee362cf1e67b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-1a6b-e57128852537	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-c1c1-6a9ea725d5b3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-865c-e56c27a5fc18	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-b748-cfcffb113804	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-fadc-3726e1a773b9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-0954-4b4f985d8061	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-0bea-f3667453a550	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-e786-654165f35f8d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-c1aa-9d77b6f2b4ee	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-c905-f79a3ef98812	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-2ccb-eae16e2ae971	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-154a-489c34c759fa	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-15fa-c0a1ede5c950	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-1ec5-bd5a1debea28	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-8e89-d08fd435eb0b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-85dd-8ca3ae2635cc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-7565-a4246d67332b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-4374-b279d0ef9a4c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-5e5c-5f9565fb2ef8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-5b1c-6ace90639714	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-1d17-ec67e2bae562	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-a0b0-804e23402d34	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-83ef-8f3096995ba4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-2f03-d3c8193bfeb5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-edf0-7eeba2150e90	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-5f31-9f688c5b944a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-a0d9-26face062849	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-3f32-ea5c281b6556	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-b1d5-ac67276a2830	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-6ff0-c45e3f2d24ea	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-d40a-48f21df193ed	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-46e2-f46d5ff9160f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-9d2d-fbd33a3f8aec	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-a2c0-4c365ef3c353	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-0358-b87393d4ecc8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-2305-73996ebbd000	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-1507-96c1a7912d12	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-f674-25a4537b3daf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-7b27-b285c544995e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-e804-e53888e0042e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-5a04-b02802159894	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-1f9c-cf9c8b82b3b3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-d3a6-1f899a3b93cc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-0e81-3d96cab51694	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-3ebb-fe9d41e1f377	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-dbdc-1457519efd51	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-aed5-404eec44ce13	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-e6f1-7c56764d1345	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-f102-aee14c618e3c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-1449-6d99fe148c6d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-c740-f33f0ac643bf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-1ad3-2cea0e271a56	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-06ed-a0c8d858ecfa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-091e-7ef0eec5f977	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-9f0f-96b6e0e6a96c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-29c9-4513baad7e9e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-2860-305fd8c4b45c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-40b7-a88f6dadf914	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-02fb-3d7db16a2f92	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-2315-383c798ac41d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-35a0-ed36bc9bda3f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-93a3-e7432602b5db	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-51e8-5f9dd2452091	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-06cf-80c2ac89ffbd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-0389-318e663f4df9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-29f0-35c25b7b10d4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-ca27-5096754d7d5a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-dbac-99f919cfb5d9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-95ad-f53f9c67cc67	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-475e-861faf001e01	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-6a7a-d9e2cf2b2039	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-8358-271b092d4b75	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-1ba5-6b6563c7b7d3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-22c0-68837800de76	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-f191-5a7872801cd6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-f5b1-9eb6ec701900	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-8268-d19b1a969bd7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-305c-4c80ba140e01	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-4c2c-b710059f1049	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-7ce2-6411966a1d38	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-2778-e32b73f95fa5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-34b8-d55002e3dfa7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-1a6e-14e18a84c582	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-ba13-5bcca2c4706c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-bacc-2a5eec3a2dd7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-c68f-e55668f9d58a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-2134-069b19f18f23	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-ab46-15fb073c973f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-414d-387cd1c8bbef	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-04fe-41fc27b4105f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-84c1-eba666230592	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-4da1-e33c26a9abf7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-de41-a40f518e0db2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-e52f-f17b132c4654	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-d4a2-f5044e1d7a08	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-aff7-4e52c3169bb9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-7c0c-d8a9aea90aa0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-6f06-b6a5d6b9db52	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-ae19-7bd874a4f9b1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-dd2c-bb8f72301d2b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-588d-89e4c3a82b21	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-caf1-f4c64c453f32	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-3666-c53fa6cb43bc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-9c87-3bed6f2dcca0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-791a-325af80234ff	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-3767-479061c51809	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-5b61-e68a082b75c1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-02b5-b76708b23394	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-8ff1-a9e550a24e1d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-7267-be3e6f4eb9f9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-06ea-b6b48504cf6b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-2e81-577c427ba3d8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-42b6-34c51a0c02ac	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-7a1e-4bc2e25769c2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-54a3-f38b7ed8fe53	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-e771-6c0623838ba6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-0061-9cccde675147	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-c0b6-e84796fd26ee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-9427-c08da0f3fafb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-20cf-0605f0861b20	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-c864-97500673ba87	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-e367-e85397fbdab5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-08d4-95b5eea9ccfb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-2f7f-267704017518	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-0aec-f8c745a00611	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-79a9-ccc1376867a4	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-01db-b68aa0ea9aa0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-bc37-35634429a7de	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-544f-0e27e1465da7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-3230-dacb9480914f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-0697-0d8eea85d1ab	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-878c-6010f8ce8837	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-17aa-beeec1459fb3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-4d25-3f7d8a412ec4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-11c6-14c24c234f88	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-bd88-f90fdc0590a0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-15a1-2d886f8cb21b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-c1cf-e6a2fe6c4376	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-35e7-ddca449eb2d7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-d5a6-18dc468e744d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-1490-d51ba96915b6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-adac-8bac88b6a214	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-21d7-c2bc598740c2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-9ac6-14fc405672b1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-4f73-8add2a5ab7b8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-284f-fdcba7a51c6f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-6d34-e7ecf03f4184	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-3e53-009ecc4ea256	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-c961-2f9893ee6d00	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-79fb-afd572402cb0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-18a5-b4b8c7f6ca10	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-5c11-3557d5431c14	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-9173-d81bda6fc117	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-8d26-eb5cfe0f700d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-d796-c66befccd98b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-13d3-7379eefc2f80	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-c811-b692f1484bae	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-4553-ab42fb7db510	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-eaeb-c5be25231229	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-d709-200aafae6a25	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-20d5-bca198148e6a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-282c-3496027e80bc	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-fdfa-6e04fe3ca45a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-2220-7a2266d59cde	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-8b5e-306574109513	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-3ddf-72e9dc62d4c5	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-235e-d834b1239146	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-5bf3-4452706df72c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-b02d-abc53513eed7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-b242-a23ae29c38b7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-65dd-7736becdf538	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-3283-98eebf68e357	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-2964-317a0ef2312a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-1a24-e3c253ae2bdc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-e5c9-041b57f999e1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-1f94-89b2ba528890	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-28c3-bfb950453ef1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-6c21-452aae416bcd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-ec81-c01d4470b1eb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-3188-b31d603d050b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-6624-fe1c6b63e475	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-9397-d0cd9d782420	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-3f99-3ed297cf2324	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-0531-cc1c173dd23a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-9216-a682dcbe0edc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-4e39-1d777fdf01ef	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-4c93-94412391df5a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-2e2c-79c99841d652	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-5772-51c138e2f222	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-265e-992f4bb0d316	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-582c-478b90d91f2f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-f96c-9f7d7196eeee	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-50da-96fa0cf032d2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-8d97-2417c2560859	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-0e17-731e2a848e2a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-fbcc-7839173e175d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-ee43-1a0f1d498792	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-b983-4c9c56fee63e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-389e-23bd3019f8a3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-782b-76361c8d5e8b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-8cbf-47cb2afa404e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-1269-224efde00774	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-82e8-6389868d38da	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-d73e-8dee82eb03fe	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-c792-45b030c064d5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-2cad-b24a66f41d84	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-6ee4-1a0a2f52ef5a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-710f-a60b1ac4d141	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-8891-57c5650344af	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-71f9-1bf19d4947c2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-10f4-00d73db3c0fd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-2526-bf2c5e07f3da	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-c297-80c193c7a0d3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-0c5d-7017cb35a616	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-205d-f7a6f1c5e063	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-ecbb-da978cc54306	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-138f-0d5f25e5721b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-d4d6-2af0963cf94f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-bb54-5858d154d6da	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-fb75-be18f3e05807	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-87f7-d29b0e3bfe47	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-51a6-9bd96d64a7c3	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-090b-42d1350f0538	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-d5a8-20a87b7280f1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-6cdc-d602725fbd16	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-d280-d9fa71af8834	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-ad4b-5832c881a17d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-772d-48763f2cd3e7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-04cb-f0774d2427c0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-50f8-bcda17b400aa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-2277-01ef1d08ffb2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-8d03-4fe29763d5ed	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-f07c-b9ade9451d40	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-bb2b-a32fe30c58b1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-d63f-7ae198e6ead9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-f2e9-7a7ced4a7c15	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-94be-36b0c1640176	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-1ee0-80dfb1acb889	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-33cc-a312e1453361	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-d5dc-3084322babdc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-5b02-30cc70cc672c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-4f46-eaa0d3a1ee22	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-8ece-4c8b2db06b4e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-afae-47b4f35323a1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-3424-6e591867d61a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-66b1-06c5dc20180d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-ef86-fa68191fd2ad	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-dfe2-30073123cf0d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-1b13-a9706ee56713	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-fe9c-51d9565ddbe4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-4094-7535bd0b056a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-fd24-0f2974f60d7e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-46a3-e16fef8d4bd4	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-7ea9-4061a6bd7aa7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-62a1-3775e826e05f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-f631-68b4ea8f506c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-ada6-d274c631118f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-189a-1b3098205b31	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-3758-50cea81088fd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-b862-f10e82038ce7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-97d5-44c3e566882b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-71e8-661e5afc72db	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-e161-716d9d2bb605	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-634f-0bf847eccd78	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-a90f-7eafe394864c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-3a2c-0ef883a78c8e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-9835-720490a3602d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-b0bc-8b5f6a9b8dda	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-bff5-b530f722c54c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-2a5a-d7a7a1516c1d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-0be0-d4c694c59143	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-e9ec-3c5480d4b175	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-12e2-8882ae316c51	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-ab75-548fadfac6ad	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-9f84-5d2c164d0bc1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-4866-954d2b1d28ff	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-391d-45286c999616	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-ed67-2df681197d8d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-7781-f23aea8cb85a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-a462-74e494179dd7	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-bedf-05083164857a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-ffee-0e7b7c270fb9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-d36d-82288012f242	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-929b-0bdc6eadecfa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-d264-855480ac75e8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-be7a-5145542b6e14	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-6427-468a6e46a7b0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-f8fb-1f054a9a1ff2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-0953-d24ffd17828f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-0b3c-4f4d0222bda9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-863b-d439e10b1cb5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-3802-10ac66ac304f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-4516-786e50045e88	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-c3f2-787d28d436b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-01c9-ab2200d5d9fc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-729f-3496dfb4f2b0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-da8e-5630eb26869b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-d2c0-e5fa157e0e9d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-1877-0492b7242933	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-3036-f5aae8701e22	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-40b9-39616e9286dc	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-c9a5-df05b2733137	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-268a-cc47b89bcb2b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-6d62-e3a79ca4b32b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-ab49-7a2f37b23a00	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-64da-85995a52b637	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-bcb9-38c15354ed58	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-3cd7-2c73b7c09441	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-d506-3febeb98dc00	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-084a-96b7aa6a7c5b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-e137-e02ed3d4c15a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-24a9-61ebb81afb53	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-f00f-eb35729efafb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-9142-1672464a4eee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-3fe8-0c2ea5585db3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-adf3-db57d5d9e4de	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-9773-30385fcc25b6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177e-0eda-653e7095f3e4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177e-6711-1ef0a9911798	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177e-b5e8-3a65f3723d87	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177e-c19d-72f7214ad25b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177e-4e3d-108690be9bea	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177e-db0a-76f8682d7d1f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177e-954b-6526c75e2410	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177e-23f8-bc4f94c2383e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177e-6b66-264010d7300a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177e-9814-0c56a8fdcb8d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177e-f316-822c120dc822	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177e-82dc-a887b2a6eb22	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177e-8410-c6c74b977bba	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177e-e09b-21ce123123b4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-2aec-f250895166f4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-b70f-b0e87aa95561	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-b5fc-b0c554b8b75c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-012e-f15007b4a56a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-6b03-01d6bffdcc37	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-f4d7-225a46023e51	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-da9c-faae8193a883	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-3965-cec28e2c2636	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-43b4-ac05f4e7a071	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-12a2-0f5d48238146	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-63ad-87f2b582486c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-86b5-272f803218e6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-f651-0a139d08fb2e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-5541-f5e613097c47	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-9ed9-2df3696953ec	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-79ae-28b79d9b217b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-10b2-4bbc425e9616	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-8e7b-ff8b25b16070	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-bcca-cf2313e787cc	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-200a-ae8d2d3e2d99	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-54ea-007a97ad4d76	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-15aa-d6ecf5bdc8ff	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-2f39-b79dff4dcab5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-2b18-c702b5dc70a2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-d762-025e85038ef3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-1a98-4740fb2deb0d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-5d07-bee4ad4c5d98	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-84ce-a518789a475f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-88d3-253610897e7b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-4582-9f39f0ffd33c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-69ac-28ad8b9d7077	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-3ee6-3474956106a6	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-0c83-7ae1480a4d35	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-1333-e29f95f8c20a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-badd-3e291f54aafb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-1d30-e98de72cead8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-25a1-d9b824d97ff7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-d9c3-83a9ecad64d5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-05a1-64d081dacf54	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-3937-db222c66bd4a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-8ed6-1838e568605e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-6eef-3563433ba332	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-f0b1-edb6a05a14af	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-6cf1-c8384fd62865	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-d375-42a3db549772	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-a81e-cdb27d40d075	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-a0c8-7eb47c82ee03	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-a304-c88978ca04ae	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-1a30-5bf37c7519e7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-8662-19fce4155488	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-f9a4-f8f9c1fc6924	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-be59-cd4f250f2114	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-1c4c-5957b2928555	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-b1fb-8c614cda5259	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-0ad6-e77b579712f8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-927e-2ad6365fb12c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-fe8f-dc7b945c5778	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-1323-9ce7a189b445	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-db27-108b818dbd22	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-fc51-49ca626a4bcf	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-c43d-c98fde880b11	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-122c-3467ea67d6a6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-7b2a-80eb826bfa7e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-c560-1b6a5fdf428b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-d46d-0557213f4237	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-08d3-3c2088073b81	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-dcbc-1569b8cd611b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-0d52-c76f75ddd265	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-a58a-22803cb20a42	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-3b29-d720524164f7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-dc0e-5c7d10ab0071	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-7a26-51abf8105ef6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-6794-d0ce23d93f19	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-4f51-6f90b22918cb	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-1f31-2e9168c379f0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-d6e7-9b1bd5edc1cd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-c5ca-8840075c44b1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-4833-77e0fc906020	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-c381-97b0bdb9f891	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-7644-946bd0e68db8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-c48d-d9fda0248e6d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-8cb8-f15d288adeed	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-174a-faf523a1fe22	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-2136-3eacad6b0e90	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-ec5f-fa4e7da7250e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-8827-050fc24828dd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-c14a-f06db093c662	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-72d2-ac31e8055b9c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-eade-6b7160077707	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-f7b1-b6a309844499	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-2b46-9f00b2c6ed5a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-eb34-3013cf3c5aa2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-cc49-280e16121579	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-51ba-8ee5cf4451ca	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-1495-ad0b678fc33a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-1044-431241baeddb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-6ec7-4d6af6dc8b44	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-1511-789af44ba373	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-e57c-d6a18c09ba22	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-5142-1e3644354d8d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-9cd4-1a5793bc0879	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-3817-38397961cbde	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-e25c-ba064bca1b0f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-a4f9-6da672bfbdc8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-335b-b0c08378291f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-09c8-19571199a527	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-c0ab-7f103c615dba	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-9e0a-5d1048198f65	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-0902-5c6863cec169	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-d8a3-bca0216e1add	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-e9f0-213036768137	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-831d-6f694bad27d1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-c353-edb98e28d538	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-b3f1-42524fcb74ca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-7dd5-c9d0d56b1af1	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-32da-e588c99bdf46	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-e9a1-aca799f23997	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-c46f-4ca5696e7e7a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-bd2b-3cfd80a10d0d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-0b11-8575716f9a4e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-d35a-a763157ba2b5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-fdb1-b756fd17e0d8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-5b54-244d1a21c32c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-ac8f-2042f46358ad	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-19b8-41c9dcc92ff5	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-adb0-c446c7c8e350	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-4049-33fa43b71458	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-e35b-5b2c14197042	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-69e2-89aaa909ff45	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-f16d-4ff9e5ab66fe	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-895b-814e2221bd18	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-cd4e-42db26f3e6ca	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-e628-c8fac50814dd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-c56e-a0e529f8a4e7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-af05-6fc9a0e52fdf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-8db3-fd79b389a3cc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-3286-d88b999288e5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-ee3a-31cb6dff5f9f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-c49b-186e18a63127	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-97cb-2a46e3359893	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-3e5c-8493bbcf7dfb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-7aff-9902873588d4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-c38d-e66da4d26d4f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-0743-37abb349fd5b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-bd89-a111b53bad16	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-34b5-5bf7856619fa	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-931a-80887d5af82c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-28f9-483c940e7869	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-0fa4-7079339610a7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-c159-277729eb6336	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-1542-9baa6fb6288c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-3950-183ca6722753	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-8144-3e81225a2ada	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-1da4-7edf706350f4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-c30b-8814ab591260	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-4ace-b6f513749d70	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-6bb1-f484c0d8c8c0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-5608-74e05d5bbd7b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-4fec-470621792c14	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-a885-954f6d6a2905	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-a3a5-0b27e5d46afd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-bff5-a0f1a36b5dde	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-c2a3-aa3f3febdde1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-4539-bb8b403973c0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-80f9-99c4626d37eb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-0f3f-d55216dbead9	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-57ea-c21ae3f90b4e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-d1b2-7513023b0a70	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-5e40-cf6ed8c3ad3e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-fdd9-b5dd6d384819	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-379a-9aa8be95986f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-d565-1005e8fd2c38	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-2cad-2ff77266c63f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-a605-58fbd45acbbd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-a5ff-ddff328e96da	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-d287-74aae44eafce	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-19f9-cc56941f5778	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-3121-5027dcecc5b4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-b963-452d3231d7e7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-1621-9bdcdacc36d1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-96fe-9d8eceb18db8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-7c56-6a39938a20bf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-80f6-79a221d7e885	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-d086-4a95d9067999	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-346f-e9890f29d105	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-937d-284e1e751d8c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-9f16-f99e779ca768	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-c6d4-018be3939a07	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-a989-058c6c5cead2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-8775-0126eb241b82	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-d774-b2f6ecfbc4ab	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-a498-5a531799a4a2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-87ad-053b297fd853	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-ee52-e6b7aab926d3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-31ee-9580b8811df1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-287e-3adf7d618041	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-ee95-c43577380ce1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-f089-e476fdbf762a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-9f02-33da63aad7e0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-1bd7-54e8ce0ed5b2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-f8f4-5ff9a7bd6548	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-c297-294fe206e3ef	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-be66-d0b0096da0a4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-eeb9-d671a8002609	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-6391-75c8b0b49619	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-0ca7-32a444fbdd06	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-8b92-8d45bf561c0f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-f77f-adeda6e13f29	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-4b6e-1e221e32dc71	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-3d40-fa27109e5123	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-e07a-398baf3a1183	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-d6e1-c56743567d35	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-11f4-6868a159eb81	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-2768-931973b6d258	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-7266-3fdf1d173715	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-9751-f9653b36f041	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-ad7e-d8bca8ed1283	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-d45f-aba6be853f54	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-e8dd-36bff68ab230	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-0997-727f8bd602f7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-b506-c801eaa4c71a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-9a47-a830f09b6420	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-7d38-5a2b01956013	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-a7f1-83db07961b21	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-8c90-26c4646c674b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-8f05-76196fd31006	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-9a0e-a1be8a3a1e32	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-9212-104940a27f21	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-1e4d-b420984e788c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-7394-af7aedb11de8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-2f76-3d99a0e924ed	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-7e1d-8cfdfb34a163	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-1410-ceafcc746ef2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-127d-a9a1d1417421	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-2485-05a801121cf0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-661d-fb17fee7a90b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-4ffe-b78d96acbffc	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-26c4-4b0c8f5a0d19	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-1659-84276a01114d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-15dd-42b19fce7d54	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-2413-e5f781fd8eea	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-b2e8-9910b3411f56	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-c88d-0788f41665f1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-b66f-a341382f6222	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-c8da-a5085b98eaff	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-624b-e00f4facaa9a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-114e-cfc72c109119	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-5896-0c8358375597	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-8359-7f102257bc25	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-b94b-b9ddad45186f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-3ae7-fe731895d36a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-68fa-78f3f048260f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-db2f-ba4c1ff3d8a2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-2e16-34dded231be7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-b12a-b32c114e1a4c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-c4b7-7c9648152b17	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-0bf1-1cb44532eeff	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-141f-82afacfe8bd6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-99c6-64b8fcb1059d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-73fa-05fe7995a1b0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-f462-e2f7b984f0a5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-6c6e-7138a28bb906	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-efd1-2484a732ec02	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-2470-86e3a97ca792	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-4ce4-568368b896ef	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-455f-a97b1ee6163c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-a675-7a0dc0695f7d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-fc6f-5cd819cd3c11	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-55cc-12a81fcc0558	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-e523-dcb1920f9c74	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-ba2b-a3a257a9dc1b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-ffec-868740822c55	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-d021-c2fc7fcb9079	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-9808-047304483bba	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-aff4-0a8f39d12c31	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-6c70-1c541c888f83	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-2d0b-5b7ed8852905	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-1c99-aff25a83822d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-ec97-e9dbd7889dc6	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-6240-7234ea20af93	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-fc7e-7bc049cf67e9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-a087-6ad416f6d0f7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-6e93-ed6232f88576	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-2be4-5b5011e23426	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-df18-a468da4801fe	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-4fa6-baaaf545c953	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-8325-6b3dc27dfd0a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-0a04-2d0657031a2e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-06b1-02b5283f0173	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-99ec-a29e0fddd48e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-1143-7a36aecd09c8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-8aa5-7e4389f90fa9	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-c4eb-b73af9a3beea	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-4a1f-7d5c217eafa0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-77a2-b1e36f427f9c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-4a02-321712cbc779	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-6b08-17e7f4e2c5d0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-ce29-ba052e1fcb74	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-f6e2-5a0a9d53c45e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-06b7-d90403b74f27	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-806c-cdc9892f60b6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-7a75-cfea257cb7ce	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-9463-3f54680fa94c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-7200-6269484656ea	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-1df4-ca0870e68d01	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-2b43-65166e64b562	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-0874-44707a3a71f3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-1bcf-511ecc63910f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-2350-470a660b67dc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-a99d-1353b4431b6e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-36bd-a52c309cecde	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-56a1-8d6f1220648f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-a125-6fa912b49014	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-6084-0e6fa312bc80	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-8c4d-2ee963d947e9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-8c3b-c840f324809d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-c704-8cbf7a01e221	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-3dc8-a63cd3105f42	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-abc6-0f906c5ccf5f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-02fe-34c3576d3834	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-23b1-be9645b7a65b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-f1c3-077b602f6176	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-a2f3-387b617f8af5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-af4c-c81266a0494e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-6f33-36d97c571031	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-6557-f6128fceb58a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-ccde-d7134c0c864d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-b076-b681ae5fcb56	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-cf1d-1e29fe41e381	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-4e27-0112f7579141	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-d8c1-956fc32bcf90	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-662b-ff62b3a8ea20	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-50a2-b3100d791c61	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-8438-aba00414b18e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-6ed9-a9efc5491465	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-bf3c-2e2e45c53a8b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-af84-bc03145fd3dd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-2cf9-e185b68bdb69	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-c012-6ed3121349fd	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-5058-8ddf9698e683	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-9f9a-40d4703a576f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-92de-f277216d286e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-9052-4c1b7c5436fd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-30e4-8e866cb2ad0c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-4ebf-86aa78f1ec00	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-b648-b8b9a8123afd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-42ae-4471949be203	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-4613-be03f92fe5ca	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-6934-dbc3b391b8b7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-dfbd-f99c32e05dcb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-a6ab-593a182227d2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-f037-dac761fae9fe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-5856-be06300719f8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-f845-0e05cf7a7a30	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-899e-4945fc0d140c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-7eba-1f0ac0151c70	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-945b-7b299b274dba	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-10c3-a0a1d1fd40f3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-5f04-043c89aa49de	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-e649-993a714cea44	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-7822-549fec54284f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-19a3-5c856cd4adc2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-6ca7-d4cb88b18069	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-676a-31eb4a2c24a7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-4012-c0e438e8f58c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-1f94-7024745d0fd7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-f00c-48266d11a729	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-1024-efb775f5b143	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-faf3-6c42ce457e1f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-b592-8716cb3f1426	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-5d40-861671682837	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-ca45-d4ac2ec953b4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-4b96-abe6b551ac52	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-ed80-2e2501d55471	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-1ba7-f82e077b9c40	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-7f74-eb6b4046702a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-3ad5-cb8f46b841bb	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-3a13-bbda5191a4cb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-d136-1293f278195c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-d42d-9caf12c8e640	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-1e28-f85f2dfda7ed	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-23f4-b6715c182c53	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-11df-b535b13cf14c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-1d83-cab0844f5ab9	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-0f27-c1d97ae6bf09	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-f6b1-70e1522e589e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-5186-d7043fa8e928	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-e24e-15648e10f822	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-d97b-b729f4066353	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-3621-33e535faf22e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-495f-aa3f29c699f1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-d114-d2ef1c9e7836	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-0dea-de89de5ffd56	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-58dd-dbb855447fdd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-c2c2-6550729fc907	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-99bf-6f246aa0cff5	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-d9f3-500cc4bef566	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-0206-201096acb712	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-3702-94f0d2c231c1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-309b-b7cf7f882ba0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-56a3-250916e27ff1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-cb31-aba227071f68	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-8ce6-1123a8da6085	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-250c-bb9b66207926	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-1da2-fae4055fcbe3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-c08d-2fc8f40c395c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-c951-b2ba0dbb5d93	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-d821-fb363659c325	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-789e-edde5e0487ec	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-c981-b3a73448c741	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-2203-86671350947f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-8609-28d5a1668c66	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-8427-b7f09a58d7a5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-8f54-037a9790b3ac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-e17a-645bf69aa08f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-8402-0feb615e8905	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-8290-b36d38fe3f11	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-5c0c-bda2342522af	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-4230-047dc374d717	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-fe8c-5cf251ea52b3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-a158-4eebe9226164	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-b5cc-2f5acab26758	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-a77d-073291098a16	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-9f1d-8db8a254959a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-ab87-104dbf6f819d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-c8fb-35b4a1f5f552	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-6be6-025a88490af0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-42f8-869db508e85b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-139d-17b3cbda8673	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-7b66-72eba098aeaa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-c6b9-4382f23ac094	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-67ef-feea89a1edef	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-ce33-435bcb514f8d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-f9a5-53f03dcaab6d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-2317-c5122ce2c78e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-4dca-3e88af0ef263	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-c6fd-c4bbdad479ff	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-82ed-644d90a63fba	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-d265-4398fc1a877f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-a376-813d0d2700bc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-4bd8-79ea15658bdd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-e195-ed8455093691	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-a1ec-f61887d00557	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-9d1d-72f2281ef3e7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-cfb0-1a94f0835dbe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-1276-7cd99598f740	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-ec02-9d35849bca3c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-05af-5ea40f41877c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-626e-c264d2bbef56	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-cf86-18e09aadc2b7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-6611-2f579bddf2df	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-f55f-aa6275061fbb	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-dd16-5097278f483e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-c94c-a7c685c5a26e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-b5e3-82f0e7784365	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-343c-8f15aeb01112	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-e591-0a5412de5338	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-456c-f432a2a52c31	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-1a21-ea77017ba666	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-344f-f63f8a517e34	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-a5ab-9efb094cd323	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-1eb0-0fe5e2a5dec9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-55a0-d6f57e6f8d38	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-bda6-70ec7f1ae0fc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-d70d-297d0136c4a4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-79f2-f104632d5093	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-4ca7-c70dbc428e7d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-17ed-9e73835dcc1b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-9aa3-2a74ff5784af	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-4717-2b49ed6b5ecd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-8584-ed44bd865c36	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-6bfe-56e90e3b62de	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-7ad0-0aaef3dd50fe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-60b7-ad6fdf262c38	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-58ed-2b2510d24366	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-6999-e66ee034668b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-d9a6-43db0af25e36	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-6acb-bda5543119d1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-72e3-bebef76ee7bb	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-5536-48b13145fca8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-7c1c-eaeb3b049492	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-8e3d-5b57065eac24	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-d6c7-412683f6282f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-ec2d-ad0e0978d341	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-ab0c-9b3f93cc1bdf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-7889-2d68ed011b09	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-952c-548e68845703	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-5931-78535ae42884	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-35fe-4c2a63380279	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-ebb3-d9177f438b81	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-152e-c153c91a7df2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-9137-61935d4aa475	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-b51e-e60243fbc561	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-9709-d94c37b843b0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-f456-1ccefeca38ee	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-870f-8030d8b12c5a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-1257-80059b27001e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-0207-42a816d230a6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-199d-d4adff89f16b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-6c82-aa32ea60db9d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-35cd-c0c7e7c482ca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-2772-92b2bef2f92d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-6334-3a2c1e2b7e95	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-b8a2-4c638c72e389	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-302c-6b57850e02bf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-4843-9133238f1c23	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-557f-9ebc9353fda7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-2bef-ea7f94d05630	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-7303-05b94a2f2421	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-a72d-ab40e8578f0f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-15cc-34cb256ff823	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-4643-3884a05e09c7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-0535-7735fba75e2d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-de98-1c3f0a8d2e94	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-0fb5-bee38eced3f7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-8e61-0f5b7911433d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-3eab-499eb26f7be0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-a264-ffa8db0b13dc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-076c-f9a875116b37	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-bf4e-c4df8c1c3c21	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-b168-89fd6cfeccab	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-fcaa-f7a78b0d5fe1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-8f3b-564e513a3cd3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-24e9-0e4b68504a6e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-d08b-9c370e40336f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-01b0-d98f0cae46e4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-c818-8ec09892b289	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-b8bd-071dbc76fece	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-010b-bbb061a188ff	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-f349-39f18dd3011f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-31df-47d7c96a3504	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-4917-406068de0570	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-bb7b-8c4f5e85e5b7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-0136-65201b3944bd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-1e4c-80f5e96b09bf	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-bbf6-9aef2d411283	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-44f4-d43f1f7508e9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-5026-6dcf611e505c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-ba8c-d7917edbe210	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-2670-88198aad1cfb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-24f5-5fc3bd942878	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-586c-59d3181656e9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-8636-4a1e63895a1a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-bfb1-764a45f129de	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-5b4d-8404e838bafd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-f8cf-bc95401c0ac3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-6f74-42b75701af54	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-b569-e0cc89c41261	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-dfcd-eac1787a16d6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-f61f-ea5b4d4dc674	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-261c-5b351ffc17cb	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-1933-b5b948888f75	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-28d7-fc27f360dde3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-21c3-0da721404c41	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-7139-9595e74c6dd1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-40f5-1dff3bf5c703	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-a6d8-5fded7bb63ab	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-ac90-e39c2a5dbe90	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-c3f3-3b1db2999cb4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-4d2a-326d3a81f23a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-76ed-8073d1b30efa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-6afd-2888b8016098	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-20bc-18bc7e38ea17	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-04a1-2ed193fc8ea7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-4105-44f44c5bcd16	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-1ac6-3bd97f623af8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-3b12-b10daaa751d5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-af5b-ca261488c619	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-cf67-07559d82cb79	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-c550-af6ae805c01e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-004f-f515de4b4d43	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-d292-80f6483e1845	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-177f-7b5c-8056823b2708	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-177f-fcc6-5ce07fedd801	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-177f-74ed-1dabc39ffd86	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-177f-85b7-b765b8d5f71e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-177f-96a6-de7d1ec1a7b6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-177f-26a5-43d05903a6b3	Role-read	Aaa - Vloga - Beri	f
00020000-553a-177f-3fca-07ee8dc8d54d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-177f-ca9e-d6e737773cb7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-177f-8e84-093c990fe328	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-177f-fc00-1784370140bf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-177f-f2e4-3970a9d3f559	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-177f-e21b-f83d2c3a0a8a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-177f-bfd4-d68e952a35cb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-177f-c8bc-972a59225493	Drzava-read	Seznam držav	f
00020000-553a-177f-024e-abbda5cabe28	Drzava-write	Urejanje držav	f
00020000-553a-177f-337b-03a7da505ee5	Popa-delete	Poslovni partner - Briši	f
00020000-553a-177f-a1b2-c3f7d7a1a130	Popa-list	Poslovni partner - Beri	f
00020000-553a-177f-3c02-dbded9906ff6	Popa-update	Poslovni partner - Posodobi	f
00020000-553a-177f-64ea-8100806a9343	Popa-create	Poslovni partner - Ustvari	f
00020000-553a-177f-248e-e828c37e5474	Posta-delete	Pošta - Briši	f
00020000-553a-177f-3247-8c7784417807	Posta-list	Pošta - Beri	f
00020000-553a-177f-1464-4c61b4b20cb9	Posta-update	Pošta - Posodobi	f
00020000-553a-177f-28bf-e90700527162	Posta-create	Pošta - Ustvari	f
00020000-553a-177f-f8c9-17488d7fc736	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-553a-177f-f533-345ac178a999	PostniNaslov-list	Poštni naslov - Beri	f
00020000-553a-177f-bea7-072b55f73faa	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-553a-177f-6979-6a29f05ee4e3	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2635 (class 0 OID 1252866)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-553a-177f-11f8-aae723dcefd3	00020000-553a-177f-c8bc-972a59225493
00000000-553a-177f-11f8-aae723dcefd3	00020000-553a-177e-0cbe-61a50ae4d212
00000000-553a-177f-93fd-94340d00a0a1	00020000-553a-177f-024e-abbda5cabe28
00000000-553a-177f-93fd-94340d00a0a1	00020000-553a-177f-c8bc-972a59225493
\.


--
-- TOC entry 2663 (class 0 OID 1253155)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 1253185)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1253297)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1252925)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1252967)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-553a-177d-caa9-a43b319eef1c	8341	Adlešiči
00050000-553a-177d-7895-2683ca907cf1	5270	Ajdovščina
00050000-553a-177d-ef70-eb1f9b59aa89	6280	Ankaran/Ancarano
00050000-553a-177d-fb19-cfc3660f3db5	9253	Apače
00050000-553a-177d-339c-b9bc2c24279c	8253	Artiče
00050000-553a-177d-b650-903cabe18146	4275	Begunje na Gorenjskem
00050000-553a-177d-8b70-c7cb60c03a6c	1382	Begunje pri Cerknici
00050000-553a-177d-9a75-b80a12194cee	9231	Beltinci
00050000-553a-177d-8116-294e34029b5e	2234	Benedikt
00050000-553a-177d-3358-dbbcc4d042e6	2345	Bistrica ob Dravi
00050000-553a-177d-687e-b079901fc7f0	3256	Bistrica ob Sotli
00050000-553a-177d-4855-252087171db8	8259	Bizeljsko
00050000-553a-177d-1f1d-5e72d7ca9f31	1223	Blagovica
00050000-553a-177d-159a-9d225b930742	8283	Blanca
00050000-553a-177d-f4c0-0f179f277893	4260	Bled
00050000-553a-177d-8c1e-1b2ea7bfcd80	4273	Blejska Dobrava
00050000-553a-177d-b978-6d09c5fce0b9	9265	Bodonci
00050000-553a-177d-9b29-7ada91e382f4	9222	Bogojina
00050000-553a-177d-47a7-c99ffe81c1fd	4263	Bohinjska Bela
00050000-553a-177d-2ee7-f27832a51bc8	4264	Bohinjska Bistrica
00050000-553a-177d-f924-aab980acf760	4265	Bohinjsko jezero
00050000-553a-177d-5ace-6632ba759715	1353	Borovnica
00050000-553a-177d-4822-6ebfdc43e167	8294	Boštanj
00050000-553a-177d-1eff-9adc7e0e9e97	5230	Bovec
00050000-553a-177d-85bc-cb3acad4df94	5295	Branik
00050000-553a-177d-d014-9067eab3c176	3314	Braslovče
00050000-553a-177d-21b2-add72d33b332	5223	Breginj
00050000-553a-177d-a903-3d618441ab05	8280	Brestanica
00050000-553a-177d-455e-438b4af83a1c	2354	Bresternica
00050000-553a-177d-d825-5a4e0bd144db	4243	Brezje
00050000-553a-177d-b157-5c52d3587662	1351	Brezovica pri Ljubljani
00050000-553a-177d-a105-022fd1b892df	8250	Brežice
00050000-553a-177d-5506-de72a6e566f1	4210	Brnik - Aerodrom
00050000-553a-177d-b646-7ca2a2041e1b	8321	Brusnice
00050000-553a-177d-b42e-9ad4e7777ac5	3255	Buče
00050000-553a-177d-9cab-a291dc5edfb0	8276	Bučka 
00050000-553a-177d-dc35-5a880065c34f	9261	Cankova
00050000-553a-177d-05fe-06e0e34c5d00	3000	Celje 
00050000-553a-177d-e1dc-a71084577dd2	3001	Celje - poštni predali
00050000-553a-177d-c3d4-278f8bd0b2c1	4207	Cerklje na Gorenjskem
00050000-553a-177d-90e7-7fd2443c7f76	8263	Cerklje ob Krki
00050000-553a-177d-e40a-a50526f13d23	1380	Cerknica
00050000-553a-177d-dec2-ac009fde562c	5282	Cerkno
00050000-553a-177d-bf2e-2823406d8be2	2236	Cerkvenjak
00050000-553a-177d-fd31-1ad7b0ee1437	2215	Ceršak
00050000-553a-177d-71fd-e15d68f0e7b0	2326	Cirkovce
00050000-553a-177d-9d85-04eb8bf27dbe	2282	Cirkulane
00050000-553a-177d-6ee8-dd5e62ab65af	5273	Col
00050000-553a-177d-c0a3-d8b9f1a82279	8251	Čatež ob Savi
00050000-553a-177d-0ae6-f1a84a6bf959	1413	Čemšenik
00050000-553a-177d-df50-e06f0c011821	5253	Čepovan
00050000-553a-177d-976a-6a0e95e946a2	9232	Črenšovci
00050000-553a-177d-0a70-c7f2ddf6d122	2393	Črna na Koroškem
00050000-553a-177d-4c03-de904f4f828f	6275	Črni Kal
00050000-553a-177d-8348-8031bad09b7c	5274	Črni Vrh nad Idrijo
00050000-553a-177d-ef72-cd0c84459a8d	5262	Črniče
00050000-553a-177d-42a5-ad4da44e7fa0	8340	Črnomelj
00050000-553a-177d-c3ae-d52f0f444619	6271	Dekani
00050000-553a-177d-d26b-7029ba22b52d	5210	Deskle
00050000-553a-177d-4506-cf9f04fef77d	2253	Destrnik
00050000-553a-177d-b885-9420f96a0af8	6215	Divača
00050000-553a-177d-49ed-fcf117549c00	1233	Dob
00050000-553a-177d-e81d-caac104b807b	3224	Dobje pri Planini
00050000-553a-177d-9fd6-ddc4170fdb95	8257	Dobova
00050000-553a-177d-1e84-5c3c36672382	1423	Dobovec
00050000-553a-177d-80fd-4388189b7870	5263	Dobravlje
00050000-553a-177d-d728-ce3b38e1b3a8	3204	Dobrna
00050000-553a-177d-4046-425f445a25c0	8211	Dobrnič
00050000-553a-177d-dab1-f0996781a30c	1356	Dobrova
00050000-553a-177d-3dfb-b07737e5da06	9223	Dobrovnik/Dobronak 
00050000-553a-177d-77f1-20a25feb132c	5212	Dobrovo v Brdih
00050000-553a-177d-b295-4d0118109732	1431	Dol pri Hrastniku
00050000-553a-177d-a287-b4fcf3cbced6	1262	Dol pri Ljubljani
00050000-553a-177d-2002-7d37bf83c6d9	1273	Dole pri Litiji
00050000-553a-177d-12b1-fefc2c312a9d	1331	Dolenja vas
00050000-553a-177d-12d7-0511dc53f1db	8350	Dolenjske Toplice
00050000-553a-177d-edd6-8da5f023a7eb	1230	Domžale
00050000-553a-177d-7b02-fb9deaa9cd97	2252	Dornava
00050000-553a-177d-e57d-02b0dc5f97a0	5294	Dornberk
00050000-553a-177d-646c-2288e878c5fd	1319	Draga
00050000-553a-177d-2382-d6c0175fc345	8343	Dragatuš
00050000-553a-177d-556f-0886b4f290b3	3222	Dramlje
00050000-553a-177d-a11f-fad33a43b03e	2370	Dravograd
00050000-553a-177d-77bf-43ed0821b2cb	4203	Duplje
00050000-553a-177d-613e-025261c291d3	6221	Dutovlje
00050000-553a-177d-d795-5bae5da91de0	8361	Dvor
00050000-553a-177d-c054-8cc32ebda79e	2343	Fala
00050000-553a-177d-5b97-a22743ee1f0c	9208	Fokovci
00050000-553a-177d-f85e-b50d2d1174a1	2313	Fram
00050000-553a-177d-74c2-08b3fbd0e135	3213	Frankolovo
00050000-553a-177d-7fd4-3531867a4e60	1274	Gabrovka
00050000-553a-177d-b770-e7c4caca878a	8254	Globoko
00050000-553a-177d-f005-689261074f93	5275	Godovič
00050000-553a-177d-251a-87d770ff30fe	4204	Golnik
00050000-553a-177d-6011-abe296141cea	3303	Gomilsko
00050000-553a-177d-02db-f0f7d8797606	4224	Gorenja vas
00050000-553a-177d-8b08-7e31ce71aaf6	3263	Gorica pri Slivnici
00050000-553a-177d-4612-7c5917b06f80	2272	Gorišnica
00050000-553a-177d-e530-70d00d8e6c1c	9250	Gornja Radgona
00050000-553a-177d-9d0a-20d363990b65	3342	Gornji Grad
00050000-553a-177d-55bb-e9e38a97e595	4282	Gozd Martuljek
00050000-553a-177d-2c0d-d522c802987f	6272	Gračišče
00050000-553a-177d-39aa-a037a996893a	9264	Grad
00050000-553a-177d-3540-f2a8110d4c44	8332	Gradac
00050000-553a-177d-2a24-1387ceb5a219	1384	Grahovo
00050000-553a-177d-2758-cc8918bd87f4	5242	Grahovo ob Bači
00050000-553a-177d-bea8-dff6be5706a7	5251	Grgar
00050000-553a-177d-a5ef-3f625714b63f	3302	Griže
00050000-553a-177d-36e8-1008b4b52927	3231	Grobelno
00050000-553a-177d-8206-cb8c22f7668b	1290	Grosuplje
00050000-553a-177d-2902-4e680a2d5d3e	2288	Hajdina
00050000-553a-177d-6b3a-ef22f9f92f39	8362	Hinje
00050000-553a-177d-8b40-ce8dd01015ec	2311	Hoče
00050000-553a-177d-2cc7-8c2043d74cfe	9205	Hodoš/Hodos
00050000-553a-177d-e7c2-c0b285d068e6	1354	Horjul
00050000-553a-177d-ba95-9744bf4a4112	1372	Hotedršica
00050000-553a-177d-76b3-fb94a5f4709e	1430	Hrastnik
00050000-553a-177d-a415-700e94f1c5eb	6225	Hruševje
00050000-553a-177d-8bcd-18243a49fec6	4276	Hrušica
00050000-553a-177d-1125-e8f29721189a	5280	Idrija
00050000-553a-177d-b0ca-ddd2cc8457cf	1292	Ig
00050000-553a-177d-00e8-74c69c7d286c	6250	Ilirska Bistrica
00050000-553a-177d-1a3f-e74b0419a549	6251	Ilirska Bistrica-Trnovo
00050000-553a-177d-824e-c77fd3bc3c41	1295	Ivančna Gorica
00050000-553a-177d-a47c-9f5b8ff5e016	2259	Ivanjkovci
00050000-553a-177d-ce94-53487c67ec3f	1411	Izlake
00050000-553a-177d-ecbc-db4c0d35ae44	6310	Izola/Isola
00050000-553a-177d-1516-783b14e88e02	2222	Jakobski Dol
00050000-553a-177d-5c88-51b1d9e5cf5e	2221	Jarenina
00050000-553a-177d-ecb4-84750fe0f8e8	6254	Jelšane
00050000-553a-177d-af10-473a01fa8c15	4270	Jesenice
00050000-553a-177d-8dfd-3fb75aebbe38	8261	Jesenice na Dolenjskem
00050000-553a-177d-d70f-b5df722e281a	3273	Jurklošter
00050000-553a-177d-2763-457136b4d07d	2223	Jurovski Dol
00050000-553a-177d-ec4e-72147a3ca03e	2256	Juršinci
00050000-553a-177d-3956-363abea386ad	5214	Kal nad Kanalom
00050000-553a-177d-6678-4d59f37499ed	3233	Kalobje
00050000-553a-177d-fc9a-2ec142bcdaaa	4246	Kamna Gorica
00050000-553a-177d-4e18-dd53c277070a	2351	Kamnica
00050000-553a-177d-89c5-200a1be85bae	1241	Kamnik
00050000-553a-177d-8b5b-4f63db736f38	5213	Kanal
00050000-553a-177d-3a33-7058f48d2bb5	8258	Kapele
00050000-553a-177d-c543-c6d54b7c10ad	2362	Kapla
00050000-553a-177d-eded-9574bcabf356	2325	Kidričevo
00050000-553a-177d-d5a1-92a54b9140e1	1412	Kisovec
00050000-553a-177d-eae3-947b7764306e	6253	Knežak
00050000-553a-177d-23b2-923806948eee	5222	Kobarid
00050000-553a-177d-ac8d-8edbab4585dd	9227	Kobilje
00050000-553a-177d-3645-177b043ebb05	1330	Kočevje
00050000-553a-177d-5339-15ad6d12fc6c	1338	Kočevska Reka
00050000-553a-177d-e0cd-49d8e6f30cff	2276	Kog
00050000-553a-177d-a04d-074eceb8a7be	5211	Kojsko
00050000-553a-177d-a6c2-4414d3f97b25	6223	Komen
00050000-553a-177d-1f3c-047aa2554c21	1218	Komenda
00050000-553a-177d-aede-125cef089a9f	6000	Koper/Capodistria 
00050000-553a-177d-123e-d98b148e38bd	6001	Koper/Capodistria - poštni predali
00050000-553a-177d-17a7-e62c6df0c797	8282	Koprivnica
00050000-553a-177d-fdac-1a323f74058f	5296	Kostanjevica na Krasu
00050000-553a-177d-8090-50095b394c5b	8311	Kostanjevica na Krki
00050000-553a-177d-d89d-cc0ff2c70f29	1336	Kostel
00050000-553a-177d-0ced-7893b751c031	6256	Košana
00050000-553a-177d-5b9b-fbce8b631ae9	2394	Kotlje
00050000-553a-177d-0cf0-8b95641d550a	6240	Kozina
00050000-553a-177d-dd23-4831c89f7b53	3260	Kozje
00050000-553a-177d-5c63-9b3ad7f41e34	4000	Kranj 
00050000-553a-177d-1fe6-0ba0f69dcd24	4001	Kranj - poštni predali
00050000-553a-177d-57b3-6fa119880c09	4280	Kranjska Gora
00050000-553a-177d-adb1-0b9a832f225a	1281	Kresnice
00050000-553a-177d-72a4-7da9048ebd71	4294	Križe
00050000-553a-177d-7e42-ce8cd9e804ec	9206	Križevci
00050000-553a-177d-210d-1a889f657cf0	9242	Križevci pri Ljutomeru
00050000-553a-177d-8cb7-a269a327cca1	1301	Krka
00050000-553a-177d-fe0d-0959fc810982	8296	Krmelj
00050000-553a-177d-11bf-a1cbf60b573d	4245	Kropa
00050000-553a-177d-f236-254ecb2b1c1f	8262	Krška vas
00050000-553a-177d-948d-ea00cfba6b29	8270	Krško
00050000-553a-177d-92e8-99873036c2cb	9263	Kuzma
00050000-553a-177d-6a72-99f8e8a461ce	2318	Laporje
00050000-553a-177d-ca9d-4ec19c6ce7db	3270	Laško
00050000-553a-177d-778e-22531714830e	1219	Laze v Tuhinju
00050000-553a-177d-558b-4641bee621e8	2230	Lenart v Slovenskih goricah
00050000-553a-177d-4ac1-5ad5ae36c03b	9220	Lendava/Lendva
00050000-553a-177d-458e-313623b3d2fc	4248	Lesce
00050000-553a-177d-ff07-721f6c5bb752	3261	Lesično
00050000-553a-177d-b535-62dd1b7b776c	8273	Leskovec pri Krškem
00050000-553a-177d-1589-a26fe77c2050	2372	Libeliče
00050000-553a-177d-c05d-481dd4496914	2341	Limbuš
00050000-553a-177d-c419-7bed05b4c1e7	1270	Litija
00050000-553a-177d-1861-2b8cd14874e5	3202	Ljubečna
00050000-553a-177d-1ce0-76382a09d85c	1000	Ljubljana 
00050000-553a-177d-e6d3-56c4d7a4b020	1001	Ljubljana - poštni predali
00050000-553a-177d-538b-d12ae02c936b	1231	Ljubljana - Črnuče
00050000-553a-177d-af0c-f2dcdfcc3479	1261	Ljubljana - Dobrunje
00050000-553a-177d-6b43-649a4c3ffd67	1260	Ljubljana - Polje
00050000-553a-177d-cbb1-feb56e5069f7	1210	Ljubljana - Šentvid
00050000-553a-177d-e453-3cd48b1d1c3b	1211	Ljubljana - Šmartno
00050000-553a-177d-1dbd-856d0e582c7a	3333	Ljubno ob Savinji
00050000-553a-177d-3636-4c9aebf09e0b	9240	Ljutomer
00050000-553a-177d-76a0-8687eef9f45a	3215	Loče
00050000-553a-177d-5015-5bb2ec693560	5231	Log pod Mangartom
00050000-553a-177d-d3b6-235feec2b4f4	1358	Log pri Brezovici
00050000-553a-177d-ac7d-fd3051ee727a	1370	Logatec
00050000-553a-177d-044e-2999899f0555	1371	Logatec
00050000-553a-177d-9be8-d6cd764fd57d	1434	Loka pri Zidanem Mostu
00050000-553a-177d-3c65-3bdab6dd459c	3223	Loka pri Žusmu
00050000-553a-177d-6b21-b855e2411709	6219	Lokev
00050000-553a-177d-1479-bb63b738c847	1318	Loški Potok
00050000-553a-177d-74dc-ffed9673bf80	2324	Lovrenc na Dravskem polju
00050000-553a-177d-4ce9-b1f882e7974d	2344	Lovrenc na Pohorju
00050000-553a-177d-ad31-caa25b07af73	3334	Luče
00050000-553a-177d-5111-a457f9ba20c4	1225	Lukovica
00050000-553a-177d-464c-bdb149ad1b97	9202	Mačkovci
00050000-553a-177d-0138-b4de0fea51e2	2322	Majšperk
00050000-553a-177d-f58d-090e6307f425	2321	Makole
00050000-553a-177d-f57c-5fdb107c7ed3	9243	Mala Nedelja
00050000-553a-177d-41e0-6407e6eed2ac	2229	Malečnik
00050000-553a-177d-be40-e8d16cef5b9c	6273	Marezige
00050000-553a-177d-a3aa-6c2cec80191a	2000	Maribor 
00050000-553a-177d-ca5b-86830a838a76	2001	Maribor - poštni predali
00050000-553a-177d-8cd1-cc7a682fbb78	2206	Marjeta na Dravskem polju
00050000-553a-177d-3f5d-31c2591f5c0c	2281	Markovci
00050000-553a-177d-cd17-fe8629f52865	9221	Martjanci
00050000-553a-177d-0fb5-a3a698b6f785	6242	Materija
00050000-553a-177d-3365-216e314fb247	4211	Mavčiče
00050000-553a-177d-de65-df73b7d1c130	1215	Medvode
00050000-553a-177d-03fa-660cbc3b2729	1234	Mengeš
00050000-553a-177d-51f5-ed531bf8f303	8330	Metlika
00050000-553a-177d-d7e0-2559902bbf58	2392	Mežica
00050000-553a-177d-9e26-02d4d08b570a	2204	Miklavž na Dravskem polju
00050000-553a-177d-f9d1-2bf2ccf02081	2275	Miklavž pri Ormožu
00050000-553a-177d-94fb-1cb57a849653	5291	Miren
00050000-553a-177d-ed01-e9aa5a9b9cc9	8233	Mirna
00050000-553a-177d-1fb3-707b1b2ef4f6	8216	Mirna Peč
00050000-553a-177d-b92b-d33876039ddf	2382	Mislinja
00050000-553a-177d-3ec8-7e8c1dc1efd8	4281	Mojstrana
00050000-553a-177d-8f70-9eccaf5f6546	8230	Mokronog
00050000-553a-177d-5efc-c776b720defa	1251	Moravče
00050000-553a-177d-52d4-7c90ade19682	9226	Moravske Toplice
00050000-553a-177d-43d3-bf016baae20c	5216	Most na Soči
00050000-553a-177d-decd-2f087a6fb04b	1221	Motnik
00050000-553a-177d-d5df-fd594236c276	3330	Mozirje
00050000-553a-177d-0898-ae98c5a804c7	9000	Murska Sobota 
00050000-553a-177d-2f3d-9e31eea13a19	9001	Murska Sobota - poštni predali
00050000-553a-177d-6062-fae28ca6c705	2366	Muta
00050000-553a-177d-6872-109aea1dfe45	4202	Naklo
00050000-553a-177d-3a2a-52b0dcfebdd0	3331	Nazarje
00050000-553a-177d-f93c-4d008422cbf2	1357	Notranje Gorice
00050000-553a-177d-6ff4-b73aa1e72418	3203	Nova Cerkev
00050000-553a-177d-e640-dabeb1c8b070	5000	Nova Gorica 
00050000-553a-177d-3893-28dd61008892	5001	Nova Gorica - poštni predali
00050000-553a-177d-1fdd-15e9db61656b	1385	Nova vas
00050000-553a-177d-de33-f41211de0b06	8000	Novo mesto
00050000-553a-177d-c88d-a3500eb5cdc6	8001	Novo mesto - poštni predali
00050000-553a-177d-b6cd-06eecae9fa97	6243	Obrov
00050000-553a-177d-a067-a2590d4b685e	9233	Odranci
00050000-553a-177d-ed85-ccd405d6b582	2317	Oplotnica
00050000-553a-177d-2a3f-a3e1318d1795	2312	Orehova vas
00050000-553a-177d-ec1b-bc693d4bd7b1	2270	Ormož
00050000-553a-177d-4ab4-068bcc2cd686	1316	Ortnek
00050000-553a-177d-6230-0ca2721edfff	1337	Osilnica
00050000-553a-177d-f10f-de7959c5d7ef	8222	Otočec
00050000-553a-177d-ef67-3970cad13271	2361	Ožbalt
00050000-553a-177d-9eee-a411fe490d56	2231	Pernica
00050000-553a-177d-8b26-b46fca75f294	2211	Pesnica pri Mariboru
00050000-553a-177d-3038-20ae81204f7c	9203	Petrovci
00050000-553a-177d-0d69-4c12bb4ce6ea	3301	Petrovče
00050000-553a-177d-3c48-1a9a48ebb07f	6330	Piran/Pirano
00050000-553a-177d-d898-370341706b28	8255	Pišece
00050000-553a-177d-26d4-87c058461220	6257	Pivka
00050000-553a-177d-7d8f-0f8da40ff7b2	6232	Planina
00050000-553a-177d-b9af-346218bc341f	3225	Planina pri Sevnici
00050000-553a-177d-d6c4-66596d9926fb	6276	Pobegi
00050000-553a-177d-6015-14502eda0cd2	8312	Podbočje
00050000-553a-177d-ad2e-e11e932bb984	5243	Podbrdo
00050000-553a-177d-411a-8a736eb6d595	3254	Podčetrtek
00050000-553a-177d-35be-a653bc47a22c	2273	Podgorci
00050000-553a-177d-d195-a59a3e52a62c	6216	Podgorje
00050000-553a-177d-30c1-85a38a091e4c	2381	Podgorje pri Slovenj Gradcu
00050000-553a-177d-26b6-d4b30a024a43	6244	Podgrad
00050000-553a-177d-2845-9620fafbaf6c	1414	Podkum
00050000-553a-177d-2f2c-e7504a424b75	2286	Podlehnik
00050000-553a-177d-3262-5370f39770d8	5272	Podnanos
00050000-553a-177d-dd99-554438cc9b32	4244	Podnart
00050000-553a-177d-9465-7e023037c8e3	3241	Podplat
00050000-553a-177d-5e7b-04c3fdd13635	3257	Podsreda
00050000-553a-177d-90a5-d969006d74b5	2363	Podvelka
00050000-553a-177d-2b6c-fa85bb65f90e	2208	Pohorje
00050000-553a-177d-e29e-a85c403b08b0	2257	Polenšak
00050000-553a-177d-c37d-6dc9d6e839b8	1355	Polhov Gradec
00050000-553a-177d-93f3-1a5a47a69bce	4223	Poljane nad Škofjo Loko
00050000-553a-177d-f9a4-f6ce77567764	2319	Poljčane
00050000-553a-177d-ef3a-8d4df3b10bfe	1272	Polšnik
00050000-553a-177d-37fd-c906e9df2375	3313	Polzela
00050000-553a-177d-3930-45242a18bf15	3232	Ponikva
00050000-553a-177d-0c1f-46eaf097dd6c	6320	Portorož/Portorose
00050000-553a-177d-b794-dc610df465e3	6230	Postojna
00050000-553a-177d-8e83-2d959b82ed68	2331	Pragersko
00050000-553a-177d-f9dd-08d730c719f9	3312	Prebold
00050000-553a-177d-5b25-b364c736dc3a	4205	Preddvor
00050000-553a-177d-c5dd-6399aa2c63f1	6255	Prem
00050000-553a-177d-85f1-046c2f5a418b	1352	Preserje
00050000-553a-177d-855f-0a3dcb46c677	6258	Prestranek
00050000-553a-177d-9e34-8246754988ff	2391	Prevalje
00050000-553a-177d-61f8-4f0611be7e9a	3262	Prevorje
00050000-553a-177d-c23a-8fa48cf01d4e	1276	Primskovo 
00050000-553a-177d-8dc2-a6aba82b574c	3253	Pristava pri Mestinju
00050000-553a-177d-6209-6d6bc902cbd3	9207	Prosenjakovci/Partosfalva
00050000-553a-177d-c782-050c26c34f88	5297	Prvačina
00050000-553a-177d-1304-ac51dde26413	2250	Ptuj
00050000-553a-177d-7bda-d5219c9d8785	2323	Ptujska Gora
00050000-553a-177d-64e7-f27139ab6457	9201	Puconci
00050000-553a-177d-5274-98708cfd0794	2327	Rače
00050000-553a-177d-0ec6-8bd407a475f7	1433	Radeče
00050000-553a-177d-3ba6-941536e44c99	9252	Radenci
00050000-553a-177d-81f9-cafabf4e0065	2360	Radlje ob Dravi
00050000-553a-177d-8f83-d440a9cfcb09	1235	Radomlje
00050000-553a-177d-dba9-fc5b3d9154c5	4240	Radovljica
00050000-553a-177d-5ee1-351078cda16a	8274	Raka
00050000-553a-177d-44cd-ba775da1321b	1381	Rakek
00050000-553a-177d-8641-a10029a580c8	4283	Rateče - Planica
00050000-553a-177d-9fbf-696a96a19d24	2390	Ravne na Koroškem
00050000-553a-177d-4c82-d909c5c31308	9246	Razkrižje
00050000-553a-177d-d244-b878214c930b	3332	Rečica ob Savinji
00050000-553a-177d-a530-b74211fec075	5292	Renče
00050000-553a-177d-176e-224b285c1d9d	1310	Ribnica
00050000-553a-177d-b4d3-9d5bc4ca36db	2364	Ribnica na Pohorju
00050000-553a-177d-0b47-6f02699d371b	3272	Rimske Toplice
00050000-553a-177d-4b29-212b510793f2	1314	Rob
00050000-553a-177d-26d9-f9876e7369ed	5215	Ročinj
00050000-553a-177d-25e9-7745d39075a7	3250	Rogaška Slatina
00050000-553a-177d-3abc-90eae635d9d3	9262	Rogašovci
00050000-553a-177d-3246-f95ce39bcf24	3252	Rogatec
00050000-553a-177d-9e2c-c631fbb3c179	1373	Rovte
00050000-553a-177d-4d93-746dc85d6b85	2342	Ruše
00050000-553a-177d-cd94-d87440a986f6	1282	Sava
00050000-553a-177d-fb69-fa8a33c4dbd4	6333	Sečovlje/Sicciole
00050000-553a-177d-916b-b18bbcd1d95b	4227	Selca
00050000-553a-177d-2de2-3eb639deb7be	2352	Selnica ob Dravi
00050000-553a-177d-3e72-c2ebc1a46b00	8333	Semič
00050000-553a-177d-87a1-3a0c02bd4527	8281	Senovo
00050000-553a-177d-6b97-b6d71edd3ce6	6224	Senožeče
00050000-553a-177d-0ad6-bddb33cc47fb	8290	Sevnica
00050000-553a-177d-6625-9e41ba211685	6210	Sežana
00050000-553a-177d-18d4-2749a90d8cbd	2214	Sladki Vrh
00050000-553a-177d-82ee-09dfa6a63fd0	5283	Slap ob Idrijci
00050000-553a-177d-2f06-12be26d3b074	2380	Slovenj Gradec
00050000-553a-177d-704d-9a11ac2b2ed2	2310	Slovenska Bistrica
00050000-553a-177d-170f-028ea2bc1e0f	3210	Slovenske Konjice
00050000-553a-177d-d039-a24c7d5c1b45	1216	Smlednik
00050000-553a-177d-f1be-7e31f2fe2602	5232	Soča
00050000-553a-177d-f2ec-331579ea92f5	1317	Sodražica
00050000-553a-177d-6172-6b47a45def36	3335	Solčava
00050000-553a-177d-44df-127f5a158782	5250	Solkan
00050000-553a-177d-e5aa-35bb12f5f0d7	4229	Sorica
00050000-553a-177d-5c68-994f4e2620b6	4225	Sovodenj
00050000-553a-177d-c931-8d1441b84835	5281	Spodnja Idrija
00050000-553a-177d-460a-7e311aee2588	2241	Spodnji Duplek
00050000-553a-177d-40c9-2f8125eb9f42	9245	Spodnji Ivanjci
00050000-553a-177d-7b3b-9460b5cebe4a	2277	Središče ob Dravi
00050000-553a-177d-0b09-8dc3d32a8f08	4267	Srednja vas v Bohinju
00050000-553a-177d-24b2-d4782d3a4850	8256	Sromlje 
00050000-553a-177d-c894-3a53e1adaa2b	5224	Srpenica
00050000-553a-177d-9c3f-f55c7efefa44	1242	Stahovica
00050000-553a-177d-dad5-448372027d7f	1332	Stara Cerkev
00050000-553a-177d-1a84-4f71d6c704f4	8342	Stari trg ob Kolpi
00050000-553a-177d-f3d8-d03112b673b6	1386	Stari trg pri Ložu
00050000-553a-177d-5091-e67de1b7d60a	2205	Starše
00050000-553a-177d-d794-81899209fe74	2289	Stoperce
00050000-553a-177d-fbfb-2cec65968c5c	8322	Stopiče
00050000-553a-177d-a5ba-97a47568f949	3206	Stranice
00050000-553a-177d-1ce3-4bba199b165d	8351	Straža
00050000-553a-177d-bcc8-4080c27534e4	1313	Struge
00050000-553a-177d-0445-000e7192dbd4	8293	Studenec
00050000-553a-177d-4e0c-f48048447088	8331	Suhor
00050000-553a-177d-f2fb-0ed5ed0c9d3b	2233	Sv. Ana v Slovenskih goricah
00050000-553a-177d-89d9-4fe07fa4219c	2235	Sv. Trojica v Slovenskih goricah
00050000-553a-177d-aa96-f80dd5fed879	2353	Sveti Duh na Ostrem Vrhu
00050000-553a-177d-f5ce-c246a03cedf0	9244	Sveti Jurij ob Ščavnici
00050000-553a-177d-55f6-521080f8c898	3264	Sveti Štefan
00050000-553a-177d-c65d-843bed6b20f6	2258	Sveti Tomaž
00050000-553a-177d-fa16-2167fd649dc4	9204	Šalovci
00050000-553a-177d-f202-879a85e765b5	5261	Šempas
00050000-553a-177d-e2d0-a060ba14945b	5290	Šempeter pri Gorici
00050000-553a-177d-03a2-4a8f7a5243b8	3311	Šempeter v Savinjski dolini
00050000-553a-177d-51bd-1f027ba8932a	4208	Šenčur
00050000-553a-177d-b806-c25eadaa10ee	2212	Šentilj v Slovenskih goricah
00050000-553a-177d-6cc4-3d2ff4d12922	8297	Šentjanž
00050000-553a-177d-f8d0-2ff3dfd3654c	2373	Šentjanž pri Dravogradu
00050000-553a-177d-0e4d-802ac8fe9e16	8310	Šentjernej
00050000-553a-177d-6cda-0b7f4624d593	3230	Šentjur
00050000-553a-177d-a243-cc3dcb8186d5	3271	Šentrupert
00050000-553a-177d-c72e-e92af047705d	8232	Šentrupert
00050000-553a-177d-44f9-63b3e257e540	1296	Šentvid pri Stični
00050000-553a-177d-86d1-ad299c9010e6	8275	Škocjan
00050000-553a-177d-612b-b211303b6272	6281	Škofije
00050000-553a-177d-117a-f93195f1fbf2	4220	Škofja Loka
00050000-553a-177d-de1a-6a54b9f302b2	3211	Škofja vas
00050000-553a-177d-04bf-f6bf9bd9f952	1291	Škofljica
00050000-553a-177d-6823-4815336d4622	6274	Šmarje
00050000-553a-177d-674c-6848afda2d3b	1293	Šmarje - Sap
00050000-553a-177d-f580-340e48348bda	3240	Šmarje pri Jelšah
00050000-553a-177d-326e-809a0a926dbe	8220	Šmarješke Toplice
00050000-553a-177d-128e-1588d048d7b5	2315	Šmartno na Pohorju
00050000-553a-177d-fb98-847e3749d867	3341	Šmartno ob Dreti
00050000-553a-177d-a3a9-087ba8e35bcc	3327	Šmartno ob Paki
00050000-553a-177d-ac7f-6a89db944204	1275	Šmartno pri Litiji
00050000-553a-177d-7fdc-ae67468b282b	2383	Šmartno pri Slovenj Gradcu
00050000-553a-177d-4915-20d07427fb89	3201	Šmartno v Rožni dolini
00050000-553a-177d-a4f8-a240cc66fe5e	3325	Šoštanj
00050000-553a-177d-d703-9652edb9fae0	6222	Štanjel
00050000-553a-177d-092c-7f56c20cceed	3220	Štore
00050000-553a-177d-1ecd-562d103fb4f4	3304	Tabor
00050000-553a-177d-513b-4c8b232b21f3	3221	Teharje
00050000-553a-177d-0259-939c45ac5feb	9251	Tišina
00050000-553a-177d-807a-aff2081f8d61	5220	Tolmin
00050000-553a-177d-d3fe-2bad0f6ed4a6	3326	Topolšica
00050000-553a-177d-c74d-9fcf9f94e2f6	2371	Trbonje
00050000-553a-177d-5bef-f83f208cf21c	1420	Trbovlje
00050000-553a-177d-51dc-0e6efe56c490	8231	Trebelno 
00050000-553a-177d-e61a-677fbe28df2e	8210	Trebnje
00050000-553a-177d-95e0-73134248de3d	5252	Trnovo pri Gorici
00050000-553a-177d-498c-d14d6f8ddad5	2254	Trnovska vas
00050000-553a-177d-8d84-fe40939e23bb	1222	Trojane
00050000-553a-177d-6b2c-8e4f09952b0a	1236	Trzin
00050000-553a-177d-b05e-2cea27633fb7	4290	Tržič
00050000-553a-177d-d34c-ace89cd4c5ac	8295	Tržišče
00050000-553a-177d-ed10-e38777e6a291	1311	Turjak
00050000-553a-177d-21d9-f2ea00231e26	9224	Turnišče
00050000-553a-177d-3b19-32d4400aaaaa	8323	Uršna sela
00050000-553a-177d-9886-5aaa6fe0836e	1252	Vače
00050000-553a-177d-7a47-74fe190d0269	3320	Velenje 
00050000-553a-177d-b19a-02aefc837261	3322	Velenje - poštni predali
00050000-553a-177d-d77b-34f2fbbcb2d1	8212	Velika Loka
00050000-553a-177d-c886-8e8aced41521	2274	Velika Nedelja
00050000-553a-177d-99b6-e0a5da0da714	9225	Velika Polana
00050000-553a-177d-b700-53bc7a8d7e1e	1315	Velike Lašče
00050000-553a-177d-3b57-66d1aa2d4ad3	8213	Veliki Gaber
00050000-553a-177d-9e98-eb1e69c048d9	9241	Veržej
00050000-553a-177d-5852-9754865add6f	1312	Videm - Dobrepolje
00050000-553a-177d-fe5b-8ec5db8d33db	2284	Videm pri Ptuju
00050000-553a-177d-6d7a-5f2fa04c94c0	8344	Vinica
00050000-553a-177d-30ea-7db9b20e74f6	5271	Vipava
00050000-553a-177d-1af2-555d344a32f8	4212	Visoko
00050000-553a-177d-ba28-373d948cedc4	1294	Višnja Gora
00050000-553a-177d-55a5-d49c71543426	3205	Vitanje
00050000-553a-177d-cd35-3e0cf16cd123	2255	Vitomarci
00050000-553a-177d-e3d7-848cc05749ec	1217	Vodice
00050000-553a-177d-ca46-8fcef23e1649	3212	Vojnik\t
00050000-553a-177d-103c-91f2938a2ab8	5293	Volčja Draga
00050000-553a-177d-5368-68798f3f8934	2232	Voličina
00050000-553a-177d-22a2-2af1567056f6	3305	Vransko
00050000-553a-177d-3c57-eec67e3cc747	6217	Vremski Britof
00050000-553a-177d-7b74-8d1390fb202d	1360	Vrhnika
00050000-553a-177d-86c4-c11482043297	2365	Vuhred
00050000-553a-177d-f28a-8faf0dc62d9d	2367	Vuzenica
00050000-553a-177d-2946-3a518f18b8ac	8292	Zabukovje 
00050000-553a-177d-b6d4-774d461c3e35	1410	Zagorje ob Savi
00050000-553a-177d-4ed0-435a4f6c5d50	1303	Zagradec
00050000-553a-177d-ab19-b5a3b3e3a016	2283	Zavrč
00050000-553a-177d-4bb7-f73d9077d24c	8272	Zdole 
00050000-553a-177d-cac2-788b2974cb5e	4201	Zgornja Besnica
00050000-553a-177d-2385-d0e152e89081	2242	Zgornja Korena
00050000-553a-177d-3ea2-15551f9d5423	2201	Zgornja Kungota
00050000-553a-177d-5130-627c47964397	2316	Zgornja Ložnica
00050000-553a-177d-6571-5329f099af4e	2314	Zgornja Polskava
00050000-553a-177d-c169-d061badfdb83	2213	Zgornja Velka
00050000-553a-177d-6052-499602aa27b7	4247	Zgornje Gorje
00050000-553a-177d-9c04-bfb11fcacf71	4206	Zgornje Jezersko
00050000-553a-177d-856c-34f8357b58d8	2285	Zgornji Leskovec
00050000-553a-177d-844a-8086320cd91e	1432	Zidani Most
00050000-553a-177d-275c-1ef97b391b88	3214	Zreče
00050000-553a-177d-dcc7-5b44f1c84416	4209	Žabnica
00050000-553a-177d-33f6-41fcdccb9c18	3310	Žalec
00050000-553a-177d-0ab9-baad50da5f4f	4228	Železniki
00050000-553a-177d-1699-9088b8300cf2	2287	Žetale
00050000-553a-177d-844b-740414a92a20	4226	Žiri
00050000-553a-177d-9248-bca43e9c9d5c	4274	Žirovnica
00050000-553a-177d-c07d-0fd365bd5989	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 1253129)
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
-- TOC entry 2642 (class 0 OID 1252952)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1253018)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1253141)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1253246)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1253290)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1253170)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1253114)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1253104)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1253280)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1253236)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 1252818)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-553a-177f-114e-9b7524c332ba	00010000-553a-177f-06e5-59036ed60423	2015-04-24 12:14:24	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO9KZH5.Cop9C4.lE9q2eUUNdumD7966W";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 1253179)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1252856)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-553a-177f-7453-c397587cf10f	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-553a-177f-4227-f7a9ef153a06	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-553a-177f-11f8-aae723dcefd3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-553a-177f-a0ca-ac63ef7a66b7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-553a-177f-623d-93571913f765	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-553a-177f-93fd-94340d00a0a1	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 1252840)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-553a-177f-114e-9b7524c332ba	00000000-553a-177f-a0ca-ac63ef7a66b7
00010000-553a-177f-06e5-59036ed60423	00000000-553a-177f-a0ca-ac63ef7a66b7
\.


--
-- TOC entry 2668 (class 0 OID 1253193)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 1253135)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1253085)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 1252917)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1253091)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1253271)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1252987)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1252827)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-553a-177f-06e5-59036ed60423	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hH3UeErdN1c0kfjqe4XGeOpJJz4UVG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-553a-177f-114e-9b7524c332ba	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 1253321)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1253033)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 1253162)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1253228)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1253061)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1253311)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 1253218)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 1252881)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 1253360)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 1253353)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 1253270)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 1253051)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 1253084)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 1253013)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 1253214)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 1253031)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 1253078)
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
-- TOC entry 2365 (class 2606 OID 1253127)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 1253154)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 1252985)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 1252890)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 1252949)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 1252915)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 1252870)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 1252855)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 1253160)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 1253192)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 1253307)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 1252942)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 1252973)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 1253133)
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
-- TOC entry 2299 (class 2606 OID 1252963)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 1253022)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 1253145)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 1253252)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 1253295)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 1253177)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 1253118)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 1253109)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 1253289)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 1253243)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 1252826)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 1253183)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 1252844)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 1252864)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 1253201)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 1253140)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 1253090)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 1252922)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 1253100)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 1253279)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 1252998)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 1252839)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 1253335)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 1253037)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 1253168)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 1253234)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 1253073)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 1253320)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 1253227)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 1253058)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 1252944)
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
-- TOC entry 2378 (class 1259 OID 1253161)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 1253147)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 1253146)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 1253038)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 1253217)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 1253215)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 1253216)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 1253308)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 1253309)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 1253310)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 1253338)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 1253337)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 1253336)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 1253000)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 1252999)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 1252951)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 1252950)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 1253184)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 1253079)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 1252871)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 1252872)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 1253204)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 1253203)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 1253202)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 1253023)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 1253025)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 1253024)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 1253113)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 1253111)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 1253110)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 1253112)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 1252845)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 1252846)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 1253169)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 1253134)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 1253244)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 1253245)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 1252965)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 1252964)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 1252966)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 1253253)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 1253254)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 1253363)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 1253362)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 1253365)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 1253361)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 1253364)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 1253235)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 1253122)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 1253121)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 1253119)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 1253120)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 1253355)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 1253354)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 1253032)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 1252892)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 1252891)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 1252923)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 1252924)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 1253103)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 1253102)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 1253101)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 1253060)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 1253056)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 1253053)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 1253054)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 1253052)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 1253057)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 1253055)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 1252943)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 1253014)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1253016)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 1253015)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 1253017)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 1253128)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 1252916)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 1252986)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2386 (class 1259 OID 1253178)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 1252974)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 1253296)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 1252865)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 1253059)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 1253496)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 1253481)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 1253486)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 1253506)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 1253476)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 1253501)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 1253491)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 1253411)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 1253591)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 1253586)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 1253581)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 1253471)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 1253631)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 1253621)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1253626)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 1253571)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 1253666)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 1253671)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 1253676)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 1253691)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 1253686)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 1253681)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 1253446)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 1253441)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 1253421)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 1253416)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 1253396)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 1253601)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 1253511)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 1253376)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 1253381)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 1253616)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 1253611)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 1253606)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 1253451)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 1253461)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 1253456)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 1253546)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 1253536)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 1253531)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 1253541)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 1253366)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 1253371)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 1253596)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 1253576)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 1253641)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 1253646)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 1253431)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 1253426)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 1253436)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 1253651)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 1253656)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 1253716)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 1253711)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 1253726)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 1253706)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 1253721)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 1253636)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 1253566)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 1253561)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 1253551)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 1253556)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 1253701)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 1253696)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 1253466)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1253661)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 1253391)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 1253386)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 1253401)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 1253406)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 1253526)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 1253521)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 1253516)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-24 12:14:24 CEST

--
-- PostgreSQL database dump complete
--

