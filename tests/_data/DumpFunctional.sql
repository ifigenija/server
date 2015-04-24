--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-24 14:02:47 CEST

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
-- TOC entry 179 (class 1259 OID 1301419)
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
-- TOC entry 225 (class 1259 OID 1301902)
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
-- TOC entry 224 (class 1259 OID 1301885)
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
-- TOC entry 217 (class 1259 OID 1301801)
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
-- TOC entry 193 (class 1259 OID 1301585)
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
-- TOC entry 196 (class 1259 OID 1301626)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1301547)
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
-- TOC entry 212 (class 1259 OID 1301751)
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
-- TOC entry 191 (class 1259 OID 1301572)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1301620)
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
-- TOC entry 201 (class 1259 OID 1301669)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1301694)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1301521)
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
-- TOC entry 180 (class 1259 OID 1301428)
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
-- TOC entry 181 (class 1259 OID 1301439)
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
-- TOC entry 184 (class 1259 OID 1301491)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1301393)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1301412)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1301701)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1301731)
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
-- TOC entry 221 (class 1259 OID 1301843)
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
-- TOC entry 183 (class 1259 OID 1301471)
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
-- TOC entry 186 (class 1259 OID 1301513)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1301675)
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
-- TOC entry 185 (class 1259 OID 1301498)
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
-- TOC entry 190 (class 1259 OID 1301564)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1301687)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1301792)
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
-- TOC entry 220 (class 1259 OID 1301836)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1301716)
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
-- TOC entry 200 (class 1259 OID 1301660)
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
-- TOC entry 199 (class 1259 OID 1301650)
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
-- TOC entry 219 (class 1259 OID 1301826)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1301782)
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
-- TOC entry 173 (class 1259 OID 1301364)
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
-- TOC entry 172 (class 1259 OID 1301362)
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
-- TOC entry 209 (class 1259 OID 1301725)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1301402)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1301386)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1301739)
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
-- TOC entry 203 (class 1259 OID 1301681)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1301631)
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
-- TOC entry 182 (class 1259 OID 1301463)
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
-- TOC entry 198 (class 1259 OID 1301637)
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
-- TOC entry 218 (class 1259 OID 1301817)
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
-- TOC entry 188 (class 1259 OID 1301533)
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
-- TOC entry 174 (class 1259 OID 1301373)
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
-- TOC entry 223 (class 1259 OID 1301867)
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
-- TOC entry 192 (class 1259 OID 1301579)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1301708)
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
-- TOC entry 214 (class 1259 OID 1301774)
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
-- TOC entry 194 (class 1259 OID 1301607)
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
-- TOC entry 222 (class 1259 OID 1301857)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1301764)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1301367)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 1301419)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1301902)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 1301885)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1301801)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1301585)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1301626)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1301547)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-553a-30e4-855e-8b7d26b05f96	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-553a-30e4-25b6-a289459a2dea	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-553a-30e4-70c3-2816fbc724ee	AL	ALB	008	Albania 	Albanija	\N
00040000-553a-30e4-b838-1263db2593f4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-553a-30e4-5693-842a746ac5b4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-553a-30e4-ddd2-6096ff8a5ec3	AD	AND	020	Andorra 	Andora	\N
00040000-553a-30e4-5c8d-af394e82dcd0	AO	AGO	024	Angola 	Angola	\N
00040000-553a-30e4-4001-7c4cfd70623a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-553a-30e4-505c-96ec8fedab96	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-553a-30e4-5c93-f875718b8cb3	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-30e4-cd51-1c36d0fda073	AR	ARG	032	Argentina 	Argenitna	\N
00040000-553a-30e4-3260-aa8f20a48104	AM	ARM	051	Armenia 	Armenija	\N
00040000-553a-30e4-b74c-5b9cd1ec3303	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-553a-30e4-81c6-539d5be5b27e	AU	AUS	036	Australia 	Avstralija	\N
00040000-553a-30e4-84be-a734621438a1	AT	AUT	040	Austria 	Avstrija	\N
00040000-553a-30e4-0988-08209a24ac71	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-553a-30e4-7c45-a06b020a2ce5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-553a-30e4-240b-a1ceb8140f74	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-553a-30e4-8328-301576d8ed68	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-553a-30e4-a5d0-cdc45c9e213c	BB	BRB	052	Barbados 	Barbados	\N
00040000-553a-30e4-4b39-87cf4c088361	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-553a-30e4-9958-9335e523c243	BE	BEL	056	Belgium 	Belgija	\N
00040000-553a-30e4-5139-9ce13b549248	BZ	BLZ	084	Belize 	Belize	\N
00040000-553a-30e4-0421-c65da030333e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-553a-30e4-58fe-19f320c95c0a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-553a-30e4-38f1-2bfe76017416	BT	BTN	064	Bhutan 	Butan	\N
00040000-553a-30e4-1a3f-4b7036d25b8e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-553a-30e4-ac6d-59e7bf1ed14e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-553a-30e4-6707-d2dd538745ba	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-553a-30e4-d8fd-5ad11d476204	BW	BWA	072	Botswana 	Bocvana	\N
00040000-553a-30e4-9d42-e9b7a7fc935f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-553a-30e4-7fc6-420cd9434133	BR	BRA	076	Brazil 	Brazilija	\N
00040000-553a-30e4-9a5b-0291c135c648	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-553a-30e4-a442-d67807a2dcef	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-553a-30e4-e814-e6b3eb8b0294	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-553a-30e4-0e02-c91760f3a14d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-553a-30e4-c821-f6086ebab274	BI	BDI	108	Burundi 	Burundi 	\N
00040000-553a-30e4-2bcd-01c626dbc4d8	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-553a-30e4-5d39-21bad6ed9287	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-553a-30e4-617c-96b8af1b41e9	CA	CAN	124	Canada 	Kanada	\N
00040000-553a-30e4-f1a6-eab4182adb93	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-553a-30e4-34fb-ab73515aecdb	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-553a-30e4-febc-130a68816cd7	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-553a-30e4-41a3-70516506a78f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-553a-30e4-400d-a089968407f7	CL	CHL	152	Chile 	Čile	\N
00040000-553a-30e4-7eff-8e8bf578f4a4	CN	CHN	156	China 	Kitajska	\N
00040000-553a-30e4-3a48-78e09e499008	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-553a-30e4-5eff-8a9702afed39	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-553a-30e4-9d7a-34ed585fa295	CO	COL	170	Colombia 	Kolumbija	\N
00040000-553a-30e4-213f-e88f21e75d47	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-553a-30e4-4dd3-070ad4ca3d25	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-553a-30e4-220a-f4e99d9a213c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-553a-30e4-9c98-9b73cbbf38fb	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-553a-30e4-1c3c-2361ebf7d889	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-553a-30e4-4e17-a1115ad7c38e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-553a-30e4-3825-5f565e824828	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-553a-30e4-ff9b-fc879b144f76	CU	CUB	192	Cuba 	Kuba	\N
00040000-553a-30e4-f5ac-bcca5557319d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-553a-30e4-c820-844487886006	CY	CYP	196	Cyprus 	Ciper	\N
00040000-553a-30e4-46b3-415c51174f69	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-553a-30e4-b342-70b7a6f84618	DK	DNK	208	Denmark 	Danska	\N
00040000-553a-30e4-eee6-c982294db4f1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-553a-30e4-c05e-f5b4905a913a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-30e4-0ff8-92f2334a1530	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-553a-30e4-f9e5-0ae06877e901	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-553a-30e4-808a-7186ff424628	EG	EGY	818	Egypt 	Egipt	\N
00040000-553a-30e4-fedd-64322bad4dcc	SV	SLV	222	El Salvador 	Salvador	\N
00040000-553a-30e4-dd6f-628d6fee08a3	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-553a-30e4-0a8e-72fbc7f946ed	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-553a-30e4-00f8-d74719916b7e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-553a-30e4-4aaf-e90449ade0f0	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-553a-30e4-877c-c4c0c6b8529f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-553a-30e4-79b2-69bdb5324020	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-553a-30e4-11ec-2ea927fa1621	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-553a-30e4-d729-71772ce8da6c	FI	FIN	246	Finland 	Finska	\N
00040000-553a-30e4-58be-bdc1b784b9d0	FR	FRA	250	France 	Francija	\N
00040000-553a-30e4-b57a-768a12a7f336	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-553a-30e4-0db6-f6c9371fbc51	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-553a-30e4-4c1a-29b47d153ec8	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-553a-30e4-cb24-9a6a5d9daacf	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-553a-30e4-227f-76f9d5792567	GA	GAB	266	Gabon 	Gabon	\N
00040000-553a-30e4-ac6c-ae344705ad90	GM	GMB	270	Gambia 	Gambija	\N
00040000-553a-30e4-1881-31a3d5d668df	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-553a-30e4-255b-d80b34b0f60e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-553a-30e4-b0f6-743b241704f2	GH	GHA	288	Ghana 	Gana	\N
00040000-553a-30e4-9415-501be6ee222a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-553a-30e4-4d70-7a754c79136a	GR	GRC	300	Greece 	Grčija	\N
00040000-553a-30e4-4ffb-deebcdee048f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-553a-30e4-fe9a-6623eda11aef	GD	GRD	308	Grenada 	Grenada	\N
00040000-553a-30e4-795c-309c606606db	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-553a-30e4-ca6d-bec8ec349298	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-553a-30e4-cccd-12d22463f22c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-553a-30e4-1a47-bd3c2b16b1cb	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-553a-30e4-b610-3f4a806c0b1d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-553a-30e4-304b-997e45b4893f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-553a-30e4-4c78-d2cc83379ed2	GY	GUY	328	Guyana 	Gvajana	\N
00040000-553a-30e4-ecc5-fd81c7844ace	HT	HTI	332	Haiti 	Haiti	\N
00040000-553a-30e4-b0c4-10919030ddb7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-553a-30e4-b436-77533a066bfe	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-553a-30e4-3216-269aaf1b6165	HN	HND	340	Honduras 	Honduras	\N
00040000-553a-30e4-fd4d-ce4e6202ec58	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-553a-30e4-91a8-8a7ac0a3ee0e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-553a-30e4-04bb-b58b2b8d244e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-553a-30e4-55cf-2abde95a8fd7	IN	IND	356	India 	Indija	\N
00040000-553a-30e4-63b5-3b05e146236e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-553a-30e4-6443-9ceca38e28ba	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-553a-30e4-691d-0e35cb3a24d2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-553a-30e4-1534-3c6dba2a0c6a	IE	IRL	372	Ireland 	Irska	\N
00040000-553a-30e4-5563-c9c033297775	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-553a-30e4-fe9a-6e5697964f4e	IL	ISR	376	Israel 	Izrael	\N
00040000-553a-30e4-d3fe-ba8793f37fe5	IT	ITA	380	Italy 	Italija	\N
00040000-553a-30e4-f34f-591400daef0d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-553a-30e4-6bee-60d241cdaea4	JP	JPN	392	Japan 	Japonska	\N
00040000-553a-30e4-116d-e4f62b0d5cb0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-553a-30e4-1e3c-b92836fc2331	JO	JOR	400	Jordan 	Jordanija	\N
00040000-553a-30e4-659d-ea5bd6af0198	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-553a-30e4-025b-c2dc0307f436	KE	KEN	404	Kenya 	Kenija	\N
00040000-553a-30e4-a882-3ca52efb2ed3	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-553a-30e4-0141-5bfe1b05d8c1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-553a-30e4-91f1-543287fb26a1	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-553a-30e4-9550-c106d69c6411	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-553a-30e4-69c0-1beb37276cd0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-553a-30e4-9f0c-fc31c7fa9e2b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-553a-30e4-b246-042bfe97ccf1	LV	LVA	428	Latvia 	Latvija	\N
00040000-553a-30e4-0711-32d9db5ca041	LB	LBN	422	Lebanon 	Libanon	\N
00040000-553a-30e4-7128-d1d3fcef4305	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-553a-30e4-7552-27219bd8976b	LR	LBR	430	Liberia 	Liberija	\N
00040000-553a-30e4-f471-e1ef4bad1442	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-553a-30e4-6155-8be342619690	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-553a-30e4-3fb2-46b3d9efbbe2	LT	LTU	440	Lithuania 	Litva	\N
00040000-553a-30e4-ea36-be16014b0735	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-553a-30e4-6939-144f047a249b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-553a-30e4-64f3-dfc86e76b8dd	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-553a-30e4-3826-10f634a89dd2	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-553a-30e4-fd8e-a1423fc0c5c9	MW	MWI	454	Malawi 	Malavi	\N
00040000-553a-30e4-3a88-ca5f7f881f8b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-553a-30e4-ba98-1e52d53a8775	MV	MDV	462	Maldives 	Maldivi	\N
00040000-553a-30e4-5bee-81313c44fa1c	ML	MLI	466	Mali 	Mali	\N
00040000-553a-30e4-842d-234e878f74ae	MT	MLT	470	Malta 	Malta	\N
00040000-553a-30e4-9983-e27a65b7a2a9	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-553a-30e4-aca0-d3ce4b66d86b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-553a-30e4-fe0c-9498188326eb	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-553a-30e4-484b-bf9161cac070	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-553a-30e4-f186-d1b5fff3b6d4	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-553a-30e4-f25a-dd97892823b3	MX	MEX	484	Mexico 	Mehika	\N
00040000-553a-30e4-0218-ecfcd1e14866	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-553a-30e4-47a0-932d847c673b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-553a-30e4-6251-ef98162e55bb	MC	MCO	492	Monaco 	Monako	\N
00040000-553a-30e4-a346-484d41f1b7e6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-553a-30e4-e2d6-3bc03b426381	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-553a-30e4-abb1-9148d9fc2aa9	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-553a-30e4-4109-cc0f1c211a9d	MA	MAR	504	Morocco 	Maroko	\N
00040000-553a-30e4-45b6-5fab817553d6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-553a-30e4-b266-e6e8dbeb313e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-553a-30e4-4fa2-c0fd77000645	NA	NAM	516	Namibia 	Namibija	\N
00040000-553a-30e4-1225-75b9a172a4cf	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-553a-30e4-91a7-bde01a32ba98	NP	NPL	524	Nepal 	Nepal	\N
00040000-553a-30e4-b0cb-443249fce5c8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-553a-30e4-bf07-1e9416c4649d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-553a-30e4-84b5-1fd2c2bc7b9c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-553a-30e4-9a5e-c74ef120a79c	NE	NER	562	Niger 	Niger 	\N
00040000-553a-30e4-a518-19df0bf94780	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-553a-30e4-22e8-a23912077a7d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-553a-30e4-de9d-8729d7dde21b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-553a-30e4-fa64-e728dc45fdf7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-553a-30e4-79d9-5fb766b6c242	NO	NOR	578	Norway 	Norveška	\N
00040000-553a-30e4-98d6-db244a4adf72	OM	OMN	512	Oman 	Oman	\N
00040000-553a-30e4-2b43-4f8f525bc2fe	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-553a-30e4-872c-f265ae8f4bd8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-553a-30e4-7d78-fe9bb95c350d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-553a-30e4-56d5-287e7b7291e2	PA	PAN	591	Panama 	Panama	\N
00040000-553a-30e4-26d4-5a2dd790ecc5	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-553a-30e4-672e-b6385a04aa1d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-553a-30e4-5476-f02250e0fd51	PE	PER	604	Peru 	Peru	\N
00040000-553a-30e4-8b53-30344cfdacce	PH	PHL	608	Philippines 	Filipini	\N
00040000-553a-30e4-a52a-58a1ebb4c569	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-553a-30e4-a49e-e21c9d1d8e6e	PL	POL	616	Poland 	Poljska	\N
00040000-553a-30e4-9415-65440d09e939	PT	PRT	620	Portugal 	Portugalska	\N
00040000-553a-30e4-7516-8a9584b59d78	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-553a-30e4-7de3-f26562950cde	QA	QAT	634	Qatar 	Katar	\N
00040000-553a-30e4-e0e5-12e64d17a584	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-553a-30e4-a0d1-e9f0059702d1	RO	ROU	642	Romania 	Romunija	\N
00040000-553a-30e4-ff9d-af2c92e75c31	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-553a-30e4-58a3-d41103d644dc	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-553a-30e4-643a-7a7e8c049d75	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-553a-30e4-0918-8b876cc8b6e2	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-553a-30e4-8317-ac1b3f2a01dc	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-553a-30e4-12a4-f2f1326660bc	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-553a-30e4-188e-ef6a2bb576e9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-553a-30e4-7f51-686ef0f9aa36	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-553a-30e4-d92c-ecf1276eaaa4	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-553a-30e4-ea52-dc1db187626c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-553a-30e4-30a3-5418073164fb	SM	SMR	674	San Marino 	San Marino	\N
00040000-553a-30e4-d5da-417143f0d392	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-553a-30e4-eff4-86296ee56d93	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-553a-30e4-56cf-8a177944e89c	SN	SEN	686	Senegal 	Senegal	\N
00040000-553a-30e4-a770-b8c84f8a2b08	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-553a-30e4-7e14-5ae16c52cc17	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-553a-30e4-034f-0c48ffc804a5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-553a-30e4-8ac4-9e6399119500	SG	SGP	702	Singapore 	Singapur	\N
00040000-553a-30e4-24a8-7cb8e2bce4d8	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-553a-30e4-10fe-137613489072	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-553a-30e4-fd14-6f6a1a65173d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-553a-30e4-daad-090b17cb44dc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-553a-30e4-2763-41ad09a47969	SO	SOM	706	Somalia 	Somalija	\N
00040000-553a-30e4-8549-3cfa6c589dce	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-553a-30e4-734a-e68485c406fe	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-553a-30e4-f181-47b8d4a04fe0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-553a-30e4-5d2a-ab1ca75c0551	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-553a-30e4-3dc2-b66b19b20312	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-553a-30e4-867b-a0c8dbc84165	SD	SDN	729	Sudan 	Sudan	\N
00040000-553a-30e4-fef1-65a4e47bdf74	SR	SUR	740	Suriname 	Surinam	\N
00040000-553a-30e4-cbb3-5f4fdc0ffcae	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-553a-30e4-b7da-8cfc0ffa783c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-553a-30e4-f2a4-c4e26fe66a37	SE	SWE	752	Sweden 	Švedska	\N
00040000-553a-30e4-df3f-df21f521daea	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-553a-30e4-cad5-b020f952c0de	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-553a-30e4-9ace-dfd146f5d999	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-553a-30e4-f902-b056601664ec	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-553a-30e4-67ed-b17a04bc9bf5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-553a-30e4-518e-f86cd62f5db7	TH	THA	764	Thailand 	Tajska	\N
00040000-553a-30e4-3e12-3d2336c263bd	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-553a-30e4-7503-72ae7e0ebd81	TG	TGO	768	Togo 	Togo	\N
00040000-553a-30e4-d0e0-e5cb837471ff	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-553a-30e4-51a8-4e98d27c1a78	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-553a-30e4-38f6-31ed1903a979	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-553a-30e4-bd6a-7a5bd25febfe	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-553a-30e4-39d4-5e5e26e9e00d	TR	TUR	792	Turkey 	Turčija	\N
00040000-553a-30e4-de0d-1b52695c1904	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-553a-30e4-fea2-e1fb9a4e70b9	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-30e4-ac79-d6af1be3d1ed	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-553a-30e4-d5e0-160d9b240db2	UG	UGA	800	Uganda 	Uganda	\N
00040000-553a-30e4-fa6d-04e7ada41847	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-553a-30e4-c944-aefbc061215f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-553a-30e4-4059-8c5cc2b03ee2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-553a-30e4-d6f0-da2bc203b1c7	US	USA	840	United States 	Združene države Amerike	\N
00040000-553a-30e4-01ba-43858aa5cf0a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-553a-30e4-e2ae-6b668416ebf0	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-553a-30e4-911b-21d998d326e5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-553a-30e4-f260-b818842e5331	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-553a-30e4-8b59-659e3e27a687	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-553a-30e4-b340-9696867b3310	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-553a-30e4-3c06-20ec3a3525d8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-30e4-a0e0-9053e9384f97	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-553a-30e4-8c40-cb02ae7aeedf	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-553a-30e4-6961-073a184c40d0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-553a-30e4-6ad6-6661fa3a6c5a	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-553a-30e4-e111-1f1c59943108	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-553a-30e4-937a-17d96cfbfc19	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 1301751)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1301572)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1301620)
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
-- TOC entry 2658 (class 0 OID 1301669)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1301694)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1301521)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-553a-30e6-730d-1033e1502553	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-553a-30e6-d387-6571535c6985	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-553a-30e6-92c1-fd05c1e62655	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-553a-30e6-847e-162e2a68f7df	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-553a-30e6-8cf9-d1f131441ef8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-553a-30e6-f5ed-fbff61195064	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-553a-30e6-ebd7-ddb14211574b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-553a-30e6-cfd8-d9aa5a64b51c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-553a-30e6-0127-7a32f734b03b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-553a-30e6-00b3-f7ea5deb69a0	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 1301428)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-553a-30e6-44e2-c3463642fb03	00000000-553a-30e6-8cf9-d1f131441ef8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-553a-30e6-1b07-502c5035d13e	00000000-553a-30e6-8cf9-d1f131441ef8	00010000-553a-30e6-d3ba-f37771d19e89	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-553a-30e6-fba0-14deffb5d1e5	00000000-553a-30e6-f5ed-fbff61195064	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 1301439)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1301491)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 1301393)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-553a-30e4-5578-911ced5ed708	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e4-034c-06569c7fc6de	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e4-a6c0-20c6279c1679	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e4-5288-5e4beeb7abc1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e4-96f9-e227ac218615	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e4-2e97-41e8b90d97e2	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e4-26b0-0d53f728f656	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e4-6e77-5d3189e4fe94	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e4-da60-981ef4cc6f5a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e4-8f99-ccdee8224744	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e4-3bf4-1912780dfc59	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e4-9d81-4140378917b0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e4-e479-d85ff6b6ee2a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e4-890d-ff738b328d2d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e4-09b8-47b2c8327558	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e4-9b00-e301f0a87c9e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e4-e8f9-2b3e1dec3a45	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e4-0c19-ba506bbf0ad3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e4-687e-d18192a008d5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e4-ba43-fc1c870c9fc7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e4-2ab6-5a8ba87bfbb0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e4-4289-c7c948ca0466	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e4-8721-0edc305b678e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e4-6619-37be225a2a35	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e4-b757-ebd0bdeaa080	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e4-b85c-db395cd23b8f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e4-df2a-769a7c7bdfd9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e4-6dce-d8fc1a169455	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e4-d23f-9cd772ebfb9c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e4-814c-220e3003eca4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e4-df21-1f9c5ebdfecc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e4-a9fb-a61e186af533	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e4-3d92-f2b19e902458	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e4-20a2-535cecfc1194	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e4-95ea-dc72d2ceec3d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e4-0cbf-6b58493fe9d1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e4-3649-e5fa7664e364	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e4-4e33-2317dfecfb68	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e4-79ba-90a0fa949d4d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e4-c12c-e4553e558762	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e4-030e-04f78dbe8ee7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e4-f493-e9e815f372da	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e4-76cf-e454b5762c87	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e4-bef5-ab1991a78c94	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e4-b9df-317cf7b2414d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e4-cdc1-33a323cb22c8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e4-7833-372051e2c10e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e4-9026-896377514e3f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e4-9875-40a462f50c49	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e4-cb3c-2b464ac508bd	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e4-4879-b8ead43a37c6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e4-c193-8c3e654dee05	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e4-2b4d-5c5d0894d1fe	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e4-bc9e-012809ae3e59	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e4-cd4e-3ef49f378f52	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e4-3a9d-7bfe8e00451e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e4-8e6f-74a0c370b3a0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e4-352e-71a5b0b35781	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e4-8fa9-2b28ce68429d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e4-0607-fc0656c7125e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e4-cf41-fdaf4fa87c24	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e4-232e-fc2a8ee236a9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e4-067c-b0fb0a58e5be	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e4-ac36-10a91bd9f18e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e4-030a-c35430f04b21	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e4-342c-c85457442b68	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e4-c52f-38c88cfdf718	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e4-b4e3-51fc04360c35	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e4-f9ee-cd0af2a90639	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e4-c6d3-97978db286ff	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e4-9fc9-652fb64ac309	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e4-3fd6-80a70565187d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e4-9f0b-20dcb37e2cf2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e4-81b9-489348bfec89	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e4-1c45-fce528136cb2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e4-10b4-db4333c22bdc	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e4-7717-49cc73e83768	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e4-002e-7e7ab7dc45ae	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e4-27ed-a90cf805f770	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e4-9b83-b5976848c023	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e4-cd6a-eb4e4d3661da	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e4-3d29-d7a5d64372a8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e4-586a-c71d3a81263e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e4-be09-5bbaa7827c83	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e4-83a3-f3055d327e2f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e4-1f2a-b12d7e130790	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e4-e057-4b5d01484bf0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e4-c70a-fa8bef66d218	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e4-35a1-00c8fa715bf5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e4-d46f-98b946f054a3	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e4-34c2-8300ee563703	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e4-cfc2-ae30a9138cb6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e4-4d95-beac4c4ed554	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e4-7797-711a0c949e82	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e4-7e66-9139a48105a1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e4-76bc-85453d247d54	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e4-9d45-d163cc54f671	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e4-7c9d-fb8555dd83c3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e4-ed29-110c41dfca83	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e4-6020-c9f3b4471015	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e4-177f-94ee56385868	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e4-fb82-2d47adebd434	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e4-2648-09d484473465	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e4-a463-14c1e375555e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e4-8957-fdd674d57d6a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e4-86ac-671efb5dd445	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e4-693a-e83e0baa4499	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e4-8fb6-b3deb4fde472	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e4-fe88-c39e37437160	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e4-5bfd-defe1679e050	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e4-109b-348512a6c5d7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e4-6a3b-c47669b8b056	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e4-23dd-7c1307f60738	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e4-2edc-180ab3a54e95	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e4-4df2-e11f6ef04a68	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e4-73ef-f3623d3a14bd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e4-05ca-7864dd14d1ad	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e4-da11-a9c35c5ec3c3	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e4-26b6-a0381a2be631	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e4-4613-0f761cd579ae	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e4-2287-8ffa318adf1f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e4-488b-8f2f5754af33	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e4-c9df-e20f188d6535	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e4-ab36-90ec3e626145	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e4-0d94-c1352c422b6a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e4-2b7d-7759479ecd78	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e4-0204-0516b7e1d481	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e4-07d5-e8dfd6642970	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e4-00f3-5a271621339e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e4-9d63-8ff58149f90a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e4-8349-5dc034a164be	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e4-3b9b-f4ea86cf8001	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e4-9879-a967e3b09c24	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e4-1bb1-8b77e0890f85	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e4-dfd9-94e72c0d582b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e4-758a-b0862065c45a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e4-d9dd-88daed219fb1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e4-65a6-b9bf955627b0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e4-148f-fe44d4b49210	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-8cbd-6e185770d644	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-6e81-043c95101c9e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-03a8-23abf485a92f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-6d33-9aa1f8c54a63	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-0f7f-338e26dc4be8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-118d-114a775ae5fe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-cc73-4d93bda1f7a0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-8c48-a0346b9a9cc6	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-765b-def42741596a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-4647-72e894e63580	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-f265-5a94213fa425	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-c77b-6fd6d98052cb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-2268-08e512c1ce41	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-365b-bb070977a27e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-75fa-935bb40b3eb3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-194b-1700db97746b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-9d4d-2a6d4f6f719d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-85f8-282388d30f56	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-c859-6aff06dcb0ed	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-a632-8504f6efeaf9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-ca3b-05e779eebe86	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-3a06-1090e2521c7e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-370e-a65b237f8426	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-5cb1-bf1e487b75fd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-3ae0-8d05c7642200	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-17c1-96d13c4ff679	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-9d23-69ed6b942ba0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-3334-400094ba9f97	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-5e97-c41850e6dcfc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-a202-a92b51a1dcac	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-3d53-488d52d3d746	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-1782-2776b3fab615	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-ef26-5fdeefc77a75	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-0a22-6a352097ca4e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-25cc-9ffe481954a4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-aa8b-08564b7db4ec	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-a6c1-6fbbe9e01dd1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-bd64-0c180ec1fe60	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-372b-1b56ca1a5a84	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-8e2b-238fe8e3117c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-b69d-68d8fd7fc4d6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-960e-3e0ee18bc739	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-fd6a-73f0a7fa0e4e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-8f3e-38f2d72d8750	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-0656-dbbdff4020d7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-e285-389c305daffb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-dd4a-28519135dabd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-4236-a571fb7536ef	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-bc22-e5352d555727	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-568d-b24b5e3785e1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-b3eb-1303dcf7ab63	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-c6af-e26d5d85610f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-7c64-596d64f03efc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-18e8-6236f3c26391	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-2ea6-2158000d8674	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-0ac0-58319cf2e7cc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-a801-12a811c2ab9b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-999a-fc06bbfdc427	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-f7bf-3d6240fe5ef8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-10ec-bccf93166066	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-27b3-8a91b3fbeaae	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-0b7e-37d6dfbf96cb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-a1ee-b95ef2fdd185	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-7466-e5873b67372f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-dba7-0495904de4b9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-f576-1f343f71f2ca	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-971e-f671e258f2bb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-6ac8-99ba3d89e184	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-0747-9297b25e15b9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-c5e2-5f0843cb9e2a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-4238-c0a4c4c5118b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-c3a8-d46ec4f8d10d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-21a9-e597eefc83c6	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-62d5-ed71abd54344	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-e937-2d6a09681bd9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-f13e-2ba04af277a0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-880f-86e53a197ef1	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-e735-f7ad03ae2673	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-55e1-048cce1cb9ac	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-9f4a-585b4addfc5b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-cf4b-82982672b7c7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-286f-e1cce69b0659	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-bdeb-8ff825f70ca6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-7cd7-c0fa57e88a79	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-9ef8-cd55cb502870	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-2b11-94747dab3cdb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-c165-bb72a96798d0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-ece6-fbd06239f958	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-5b7d-9010315438c8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-0a6d-bac2c99960e5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-db5b-27fa35153dee	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-8c94-7409df5a328c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-b21c-8bf41785aede	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-29f6-a3a25eaf2f20	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-54fe-fcc26ce35344	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-f16b-665eac944461	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-8676-959fc4cdbb0d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-f393-b4013a189aab	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-9fa6-0f8180dd6f46	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-8bdf-26308e648e36	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8984-b782626823a5	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-ef7c-f885260cc38b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-eef3-2877128a10e7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-dfa4-c09a491efe54	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-c728-4879afacb644	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-f9f5-d037561baf0f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-9402-b7a3aa3cef4f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-c2f8-561ccb62d45e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-722e-4fe74ed0bfdd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-3261-4c79608b9f64	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-5b25-d7996b369a2a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-a46a-3ae810ec1869	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-3b7f-a56ca9ed09d4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-2ab3-870b1abdaf8e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-83c9-baed1c912863	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-ce1a-005cba859202	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-a68e-f1828dd133d3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-fa44-9d2d71de8e36	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-38bc-e5a0b067412e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-fa5a-650116b1ac6f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-ffa3-8806b361659a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-bb6a-2172f8c8e4e4	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-7557-a7501cb5f0c4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-8c7c-9f13ecc50b21	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-0f94-74ffca21e428	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-16b8-3f5096516204	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-a2e1-09694e60e6bc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-1d5d-c59d0a5f457c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-a836-f551e1fbb578	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-99c8-de1ecff6c4eb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-988c-886825e3851a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-26c2-f266fefb04f5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-a8bf-b6e499d3e496	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-ae70-b4a3d9128de5	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-80d3-f273ecd70e53	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-44ee-73228c94882f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-1ae2-6cc7ae4eac19	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-a8d4-1b56fbb9e55c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-5bce-af40504669cf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-6d71-588bdb2564e3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-a13b-fa23690c17e1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-615b-5f1625fc2564	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-2a4b-21b674b1acb4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-a682-31dd4c989585	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-f792-2ffd1317738b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-604c-a6e47f1d63be	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-4f93-fbc1d2db025d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-9b86-bd3eaaf75c79	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-75e6-68d3fff36b8f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-8ad5-f8898ce4c17e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-7b0d-1ec96bdc2edd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-2c3a-6183e812ea9e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-a135-f79135eb2c43	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-01d1-64e65660ca7e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-0b53-fe01b995eca9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-8227-837d46e110fa	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-78d4-f7d972a43491	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-820b-8c5cca0ecc5d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-37b1-31e124ece897	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-74f0-da4c77144222	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-a414-9d776fbf9a3b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-4d54-d29ef809aab1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-8162-85994151e191	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-c990-95c9a9300538	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-577c-3af59ae45e3c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-efe5-19c8a898ae9f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-c2c5-10731a590aea	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-4417-8eed02565555	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-a137-62cd9df44b5d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-f724-cfbf64666559	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-f736-9da54e417378	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-8c7c-f86288efa1f7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-38fb-f37abb5b8dcd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-6a7c-5991c2b3a04e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-fa21-6dabe71a7224	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-9ea7-d003b0a65485	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-bdd0-0f81232e6070	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-3f38-03240660b750	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-c03c-0884bc5d1328	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-9bc7-5ee3654e52b9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-6775-166ee75a43c0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-7cb1-c630a5c7d3d3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-09f4-c35fc679e1f7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-e091-781a84f05afc	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-eb8f-a0a32aca8041	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-bdbc-0253a8bc4ad2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-5c71-f1eddb8cb42f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-cdb2-0056a89a797c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-754d-18297c16b0c7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-0dde-47ba47382cef	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-ffef-5dfe65c835cc	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-350c-b7f649ccace5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-bef6-fa2dbdff4bdd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-843e-15743d244410	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-bc44-9d9e38cfcef5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-995b-b28c0b31c11a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-4d18-3e909d851021	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-a611-7d4baea7f1e1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-124d-59a309133d11	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-de98-39f360398afd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-f2d0-c18bb3d5dcda	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-5db9-3dcd1a939cdb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-0bdc-51aef03db477	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-6182-f5b32da4f5c0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-751f-9067865cb55d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-11cb-ab83f0222d93	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-21fd-66e1e3aea086	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-243b-a72817d1c3c4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-d51e-594312dcf9b4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-3bee-40bbe4d9fed0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-0ed7-9b7c0c7ea542	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-f75c-e27c02b0a5cd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-4e7b-9c88b126e79a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-45be-834b13041a2a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-3301-da26a3d3804f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-2dc6-90fa08a2c3b5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-156f-1d755e1caffa	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-ee40-96c57fd3ff8a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-f3e3-4b26827fe60e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-6fc7-fbaafbf309b1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-0011-111b5e47023a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-8ab0-1a8adcb41601	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-278d-de5bc2e0c8ef	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-b54a-a383c0be3968	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-0a22-344027f4053c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-928f-85baf5b76bdb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8ac9-f79bd62a5ee1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-9abe-623b3f48d3c3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-b12b-194168fb2543	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-d943-c670cfcffee1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-3334-e5b0ac80eeb3	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-4e40-3266258ad845	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-5dfd-50a0132a43d8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-f2b6-e3e85939e2ec	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-2b77-ab90e7711a92	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-fae5-60fe38f505bf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-9bb5-80d6c2e36bd1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-fc51-0da04d8dee63	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-6ca2-10f1673632fe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-9b6c-92d58217f23b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-daa8-e8c075799197	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-bfe7-30b9c743cba6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-9472-0f0e217d0aa4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-bf85-4cd6fd50809d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-ba31-c4f121a7d51a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-6c6b-42eb089217e0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-3521-eadf47415d09	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-f517-1f7389a89a03	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-00f3-a3dc8ce2ebb6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-e552-27ed6ee5cbf3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-48de-560bc3f1257d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-4212-ee14ad05e4e2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-4058-9d06850c4fb5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-09cd-4210648e73fd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-323b-eb669f6c0a3f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-cff5-ad610662575d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-bc37-99add83029f0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-62a3-f9c358ec25d1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-b81a-6c141902e642	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-c99b-f927d3401c93	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-300b-87ba1b5f4403	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-b840-8f1319d1d72e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-b3cf-cf4e3ee31099	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-2b92-38792c09130a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-6b2e-ee9017088888	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-8640-4eb88d5f6898	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-6c3d-0c23bbdeff9e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-4619-c5a9551be4da	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-2171-5f1ff62f73d1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-3780-66c855d05a58	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-12c1-fd492f497f3d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-ff64-2992fe12bdd3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-7a6f-bbd7a2971f06	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-d098-91855c538212	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-e690-0832ffed71f7	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-8ca4-92183a8e0712	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-e169-9e6f30869f6e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-977b-ff1609c46aef	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-b563-9c53e6af299b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-b38c-893bc5cd9c1f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-b152-06a0e5e44868	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-3620-51aeefead0a4	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-9f58-a5f1cd109679	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-bcd3-c53645a61eaa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-6bf0-dcdc8dee6a16	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-89aa-2532a7f5119f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-8472-af8e3cd94e47	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-1683-5dd11f38020e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-bc73-c64f6ea4ff46	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-a3c9-7f1db9f648fa	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-4efd-2f812a8f18a8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-76ea-e4e6407a4f03	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-7df1-b3b1e163c535	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-071c-c37a8c011e3c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-5aef-cdea3e569b57	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-51e5-5a594a2ec804	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-450b-66c61fac7d7c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-04e8-c2bea52ec19c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-e752-6629e3c64199	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-c17f-a163e1c5c6d7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-b33f-259ca60279e9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-712b-4bc3a8d84b0d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-c3ca-1c8e85ab5f46	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-3469-a0a4a56074bd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-9d3c-022ec464b547	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-4a33-4b45c00c4112	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-afc0-2f191e2dec66	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-9b93-c63e674b7f67	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-0938-78f61bdb4a31	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-ac82-a73eddaa2d64	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8410-44ff8b699764	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-a7b4-381b978c9604	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-6916-bc97aec5c709	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-1254-a2a6b75b0d4d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-cb31-284a59e13c86	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-33b9-5c3e06a3a966	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-5a52-ef6b38965d2e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-c165-684f3b047e5f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-0101-adb18bb11975	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-0091-ddfd4f71df7f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-653b-ddfad981880e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-aa69-4f68848ef6de	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-b30a-5947c8e50cf6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-dee0-946344304422	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-fa92-7785cb511407	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-aa6e-e862b6b03e85	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-3192-ebfcb6bb70e5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-0d17-a58fe894da7d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-9cc0-07d3c155ebd9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-ea20-c0d86e7e19ea	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-5d73-4dc4c1496af5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-36d5-e488670450ba	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-75ae-6b68230ac8ad	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-4a20-d58424c6408b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-3c16-0de784efeb3c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-4ab0-5076cce7f607	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-db75-840e8918938f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-644a-50a819012a0e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-aab1-12280b4f6926	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-f5b1-13a20daebf88	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-7f14-bd4ee1d58a9d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-6f8b-2ede4456e3b7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-862d-d7ec5e42bd33	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-c54a-116a4145c1b8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-71c3-8cc452d318c3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-855e-025f9c4dbfdb	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-2f3f-953d2cd762a6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-2229-d798d80ba67f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-6547-61e2566cd095	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-b14e-25c6d47c4cac	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-0e35-699c3cb14688	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-6703-509d12413b32	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-9813-54d485d4dc5f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-e428-b7d76edc66c1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-42ea-5e65dba3df30	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-e997-333ae6940fa9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-60c1-4c9b299c60d4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-f2d7-8af861a2106c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-21aa-8865abedfbc1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-92f2-8f0487989f4f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-0219-d393bde5d2fa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-0a29-fc01f60e0a28	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-60bf-637313b160d4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-288b-f3121055dc3b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-ce99-11e663fce5f4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-1f7a-2090c50258be	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-e1a1-2a3b6f8a07d9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-fbf4-d14ef425c5d5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-9dc9-2acafd193123	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-3a46-e1378c8f6704	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-31aa-ba52fc36e20c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-3711-7898703deed1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-38ba-865d15cc3dbc	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-7f1a-a83556538b17	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-1b86-f9d398dcffcf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-675b-cd4c3365165b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-bf2b-3977e77ae447	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-dcff-2882e4dd6ce1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-5cce-be58d5db1f31	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-e5bf-1f48d02343f2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8d68-37295d24a1e8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-39e2-3ce47b8df899	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-404c-a0792d3b92a0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-e1f1-630d5c45bafa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-f0c1-cc5283466e24	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-ce2f-2fba5f7e18e2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-85b1-77db57655510	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-2f59-b4c1ed22bc3d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-61e3-ad9e43c0bf1f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-e67a-30c16f197aa9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-de92-844f4ca334ea	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-0038-95811b362a77	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-dd05-905c35b0bb0f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-a754-05ed078b9cf6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-3908-c4b51334666f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-f43e-1bb8097b5809	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-7d50-078f0a0e87b7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-8b0a-2ebe97030658	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-4937-774cd569fbf3	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-b264-872866f01074	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-427c-65ae5ad581d6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-8b36-b5d134a45e44	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-9a38-c81ee74405f1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-916a-08e76a0c0499	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-2574-67e5ec88f75b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-2451-ca77d6205e31	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-b33b-2f0898162a59	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-59f4-b50f239afe8f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-652d-21b7305c3c03	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-6c7e-dee14bf4778c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-66f7-ade7a7a62ab4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-2281-ce6654fbf6de	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-51d4-9e199705a17f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-16d3-00b522210cfd	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-42c5-f7b715c22192	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-d1a5-f9dec1c2bf89	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-1cec-ebbaedadd1c6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-f0ac-23e373e70675	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-3659-3397408fbd27	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-cdb0-66fc8898a369	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-8158-cd35443904fc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-b9ed-0657d0e41b3d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-9b07-62a766e36f5d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-19c6-a2341c7bc56f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-dbff-4d941f98ea58	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-c104-a65e4d54f11d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-b6b9-5bc2d77e3308	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-7508-e82fe25b1165	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-d949-04692f5de916	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-8ba6-b49609492f54	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-56d6-d71503d45f91	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-3b4c-aee6a598cdf8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-1279-46567a9fa534	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-0490-a1f41912d4d9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-355e-9b30917ad1f8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-93f6-34bf9b91c323	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-ef6a-eb4a6ac27fa0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-513e-d5b488c63afc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-51ee-f6fb38832801	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-e61b-15b18e101e64	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-52e6-fbe0e52eb564	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-d38c-5d5e02f1dc41	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-4afc-030e1b739a1c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-143a-96982de651a5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-ea78-559d29be17ff	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-5a9c-94d42285fc99	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-a495-915b4f414dec	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-e4a2-752e130ea106	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-3de1-a233069b7eaa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-4d57-1655cbd5809c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-0cf1-fb24ace7ca1c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-9630-5f1c094ea532	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-4c5b-eb8f21c0906e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-9c34-90213cc279fb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-86c6-0b875c7ee9c9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-adc8-d8844d430b44	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-ed26-39adb8e48eea	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-66be-3edd7b18d265	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-4a6c-9f2c4ecdb382	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-fb38-5fb58a6120c2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-d8a6-741d2388ddd0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-4a6b-93be4ca8002e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-e6bc-1b1587fb9536	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-bf96-aeb95736c5d6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-5a24-59442f9fa42e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-abdc-4fd8f28cc14a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-8f76-87587d7d36b1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-6403-85ac263e41cf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-cad5-e21da18ce961	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-7298-77785822b2f2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-fa80-564e1cd44a94	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-d1de-6ebe815aace0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-29f1-dd0a1e68a1db	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-202f-a8b625105552	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-d79c-33c51acbd397	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-c374-027edd279dfc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-8b6f-cc2481cd543e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-7ff2-933e9b159164	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-bc4a-27bcea17e65c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-a06b-004cfd88adea	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-a9c1-76ffa53c234f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-1058-2ddc69f8d715	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-c1a3-2439c5f9d6ae	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-661d-7b0deecd0795	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-cf24-99f2e1abf9b1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-f964-c9eefeaa1db2	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-b6f3-6b496bd7cf5c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-d12e-e469536d17ab	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-9091-a1cf46a584d4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-da57-99bf5a02095f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-dd1b-bfba73600de8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-0cdc-c0f637c497c0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-d3e0-f8bbe5ead4dc	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-e25b-194218855b94	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-7b0f-a3de20ef7b52	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-3438-64ca47726a55	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-6a26-eff3b46fd852	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-19d6-aad8e0a16acf	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-146a-e3c50f84bc9c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-a63b-470b31ade6d8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-9553-d6c72b1ea641	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-f13e-4251fd871144	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-2f62-6a0cb44211b5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-1bb6-bbfd8076f396	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-52c2-24c391199b11	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-5928-e990b0060577	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-b9d2-ef47ed6b50bb	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-4d9b-60044c8c5914	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-7677-1440c407f6fa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-580e-ca791813b4e7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-3c8a-8d9599220fe0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-c112-f82db826be34	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-e883-0d1c48d66d28	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-d4de-4ca35671320b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-bcac-b0438511a7ad	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-809f-a0058949cbd3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-d327-df1b493051ed	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-6dd2-3d14146e2ee4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-962d-d93ec16ac4b0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-8c13-3c1ec9c7d216	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-1a58-d45aa53b110f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-6ddb-554c2388c7b7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-60b1-6e55fec281af	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-f288-3738d6979d6a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-1c40-3f872708fdc7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-bca5-c8c0650549be	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-4f0a-d03bb04ca15c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-bcf1-8a5c2cb9e3f9	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-76e3-f1440fa8e481	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-8070-10014e9053a2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-d35a-f79452786031	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-1056-f61644f27558	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-a223-ddc01404180d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-cb78-24282382dc31	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-4983-6ca98d578e37	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-4e37-8ba2151e77f8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-c7f9-628c54dd9980	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-6ee3-fea38bb2ecc8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-c7e1-4461a003a408	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-6c8d-4d4db62bacaa	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-1bfa-4a2b98f8cc0f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-fdc7-9fa783ae0574	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-d334-ede3fc45176a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-eb18-a00e8aa28f4c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-2e0a-4e5d5388a7af	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-7a0c-27d0226971aa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-e5b8-cb87fbb4c526	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-ce88-563750f78fd3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-771c-c249fcd783f3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-00af-e539f3cf4de2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-e2a2-6a3655785217	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-39a0-ec84924b9854	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-0e96-9dea55a9e783	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-c704-b92d7991cbc6	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-3678-42e221f640ed	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-d504-a59c2bc8cbb0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-4fce-8db581c64faa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-5b63-e9372b0cf161	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-deb7-4ee2aeee0867	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-474f-4cb70aab2f18	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-415c-4ef18aceb924	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-1672-4c38db0871fd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-c3d7-5adbbcd0474a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-e9a2-a5a224ceacce	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-f19e-1cf623ded307	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-8896-8e10eee17567	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-a14e-a81fecf6a0f4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-e018-c56c433e23f2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-a123-fa3e7e737af6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-782d-6544548119d3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-0171-aedc3949da86	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-fbb6-e78c35a3d5d9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-ed83-74a55aed393e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-2ba6-a950e0e76e68	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-6452-4d941e920669	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-0df4-885b0b502c2f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-ddaf-c69e73c35246	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-fda7-b06b17ee3319	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-631c-eb848cdca0ca	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-c9de-51d0377ffb4c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-8b08-2704e98b7e0a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-2436-9f958283554c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-6239-899715691188	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-8540-b268a2293074	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-e3f8-fadc0752ceb3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-5aeb-8b8975f19de4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-f784-8b7aaad97a70	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-ca9a-4fcb0626b6ab	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-5404-6a6260d11cfe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-505e-7f21f38df497	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-1e86-8d1efd083ded	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-c6cb-3bd96dba8ca8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-03bb-5f4e8d4798fa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-ebd6-fccb5a03d70e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-5946-fdfc2ab8de38	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-4007-77b5529e405f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-627d-0310a8a5c3ce	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-2189-91bcef22caac	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-4dad-82655b277ae8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-75b7-67805c78fd8b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-dbae-ec6389406e83	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-0a8a-a6a6a2fef395	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-479c-3dc3bf465b4a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-5658-e52d2d4d4dca	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-4ec1-d511356b9fca	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-3b93-0df5f6e57364	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-6f8a-425e3112290c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-3926-3fdc3c4bac1d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-8fb2-615e0537c103	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-9efa-6e7093a95943	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-1d2f-8eb9adb4cfaf	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-7118-035d03b6be83	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-334d-4fc822e291e5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-bcad-12b81ac40106	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-a3e2-73ec2d3ca742	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-4a3a-fd6b11169b40	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-53a5-36a3e408ea1e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-46f6-3d80c058bc48	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8470-143a669c94a8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-8b25-49d25e9cfb31	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-ff06-103fe07e3806	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-b9e3-b113b6571dbc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-acfd-c574a877ec47	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-88d3-a7ee074606d4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-f105-3d2e4e6ec87c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-8db2-fdb660b79773	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-91c0-ee5339590275	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-d057-02fd017193d0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-e3a6-abb48dafe84d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-15cf-127c90e17137	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-01e0-b81924654f15	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-7973-869b63f43100	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-e081-de86d0bcd783	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-88a7-9a5d737899e3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-03b4-9405f6a94d70	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-e955-39448b16047e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-b136-e468c33ae206	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-8209-646cbe7a99be	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-b270-b4c62c2bcb71	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-61f9-63e0a3d4f317	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-946c-6b1e02fdd222	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-26f7-e9032ab30345	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-ac40-aee635ec7a4a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-6093-b72960668b91	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-9c76-96dad73cad8e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-956a-4bc1ae68e5fc	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-f830-13008c53a91c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-893d-0696eac075d5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-3ebe-bb1945b920fc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-dd4e-0d1ff9fc89fd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-bb03-772a54abf88e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-bd90-1ed9831f775d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-1e0e-876877ed00c1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-5c16-25846d3b2173	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-b0e0-70afbd8f8199	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-1bff-aac32164d69f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-9809-fb13810a395c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-2375-adb6aef7cb9f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-96de-bde5cf949e42	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-deda-211303ea5e79	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-18f6-7efa956ca1ad	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-643d-80ca263b50fd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-6578-1e88b7f3f96d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-f327-f723e58fdd5d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-571e-5fed39f1d329	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-dc25-ac2ff76f8c83	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-883a-3288ce65e323	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-d27e-2ccc554df329	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-0d5b-12f3a2b894dc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-5e70-1a796ffb5d54	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-cec9-0c5579a31e33	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-9559-13e5497f0c0e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-8f3b-5f47c2a44866	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-df92-a915891b4a6b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-031d-fc3656c25dc1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-7659-c1bb89c7244d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-da03-596cc33dda63	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-0143-125eff90fba6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-d743-6f7caa0ecd57	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-9c32-15279bf40034	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-b075-756f0a37b33b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-0880-f38c45740419	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-e714-2e48ec5631b3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-9796-998a8f3d4b30	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-ca09-5cd50358b926	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-ac70-79c7e4975fe8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-e455-6b460e94c1ca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-19ee-4f0a1307109c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-97bb-63f25f5f47f5	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-e219-3c3c81557149	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-d28c-b5632424e64d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-7603-cbe41d01322c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-78b3-b4dec3da4bfa	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-cd5d-699ed6119152	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-7b92-bb0880a8a7d4	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-a084-279e87ce77ce	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-fe1a-6deb199ecdec	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-f5e7-01387218a824	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-0ec7-68b844eed2cf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-3649-50c279e11949	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-408b-9c482f003912	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-1b89-467e60e833b1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-a8a1-26b12616a0d4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-5ab9-cf7d52196620	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-1508-256cc3de0c3d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-33a7-bde86e97f8c2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-4d63-3de39bcbceae	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-a920-5e7cd911e602	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-d728-a646a4090cf1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-f7f8-3a2cdcaca767	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-6c08-8deb4451fb0e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-e40f-c92354730f62	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-1b2a-e5bf573a294f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-2900-bf6da777dcc7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-b742-bde698a2aa5d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-80a2-188c13e13a5d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-cc93-9db0485c83cd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-8230-909198d99c3e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-6682-7f9f7ff19e43	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-c5d9-86bd98bf4e9d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-ce9a-c81fb9bcc56a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-a1dd-42143865df7b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-8d7c-7be9137b38be	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-2c16-9ad80b49178f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-00c0-e50f835c09a8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-7528-dce21eb158b7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-406e-890d007650a5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-2bef-eaceaa522136	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-76fb-4484bb446ad4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-6d53-52ddc594e9eb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-e529-5cc0e6b94f12	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-2336-81a2aa052989	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-42d2-c366ddf0ad9f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-5605-920af5f4d029	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-904c-f28ca75b81ef	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-d253-1f5a8a9fda8c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-56ea-8913ae9f2536	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-4b50-9426a571e193	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-0ca8-1e662156686d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-2ab9-74566d5f7fdd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-4ae6-3efcb612dcb8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-de40-5e1f9528bb93	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-5158-ebcdeaa20afc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-fc49-da0dd125c385	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-757a-c61de9b50369	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-44d4-6503dfa945f6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-9054-2ab4df627273	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-2a87-3ecbb810bf2c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-0638-9556ccfdbe0e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-860c-350953117bac	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-5c9d-18286ccba830	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-b8f0-bd9d76d1f8aa	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-c6ab-d17d29a593ac	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-7054-2de20781cadd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-0c43-ad7a91586634	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-869c-6323a9b2c03f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-cce7-73984350f745	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-63dd-cf6609232615	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-06ff-484156556c78	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-bb66-17c36b6c2e26	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-1741-d1b60ddea31a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-4c0e-8fc8d3c69daa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-3242-8de8c1d81f71	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-6d14-111a88472beb	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-8929-3b4d53c7a4e9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-1649-4e95c6fe7d95	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-99f6-d71e531923a6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-7e96-937c22f42d2a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-2f93-6d057fa81cfe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-3117-1f8bb4f13c1e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-1328-e2f26bf998d9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-3b9b-5377d39c73e8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-2843-251dc76e8fa2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-7a50-72c13cc06e9a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-89bf-6e34f68e39c5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-97fa-903c779ac9e2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-b956-5bfc0c408284	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-49c5-8c9480d7de4b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-02df-0a24fb707579	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-4de6-6dcd1bb74772	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-b1a1-9cc2fa9db700	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-6831-a157fa65d963	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-2b29-7c648cbf0c03	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-6509-b9a79b3c9c3c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-a67a-72700564a7fd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-7a65-349b7fb5b9b5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-1eb2-1b455a1ec973	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-8c96-33f0d7d67936	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-be9b-931b38938aa4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-c614-0931893cd26c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-c1ec-0a57e550a315	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-957b-06e9e71dd4f7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-3781-ff096c9048a1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-7176-d9e1be26eead	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-8126-8e48b0a95178	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-5b38-6a619f074b0a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-5eec-c1adcf5ca495	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-8bc2-ccf1f8130777	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-626a-c7f7be933fb0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-73d4-ee254883abd0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-deb6-eb94b7514ee1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-8990-36d085529dd1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-3e42-9a2c6a09c87a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-2f9a-05e8c56cb117	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-4236-8a153864cb29	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-4d82-65ca098ff9be	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-4e3a-b8c65d6cf612	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-4d06-6816d599320b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-bf08-c150ff50a123	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-6f23-571e2813683a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-8f36-d32ab84e5173	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-12e9-d936511ecfff	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-29cc-f90e498e93cc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-29b1-a297ea092f5d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-34c7-9723186fc7c9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-cfbf-8f7ec27ee95d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-12b2-2921aaf04012	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-a463-eb3d92d4ef4e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-f0ec-00467e126fb6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-5240-7ee5681ee45c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-a175-1bb74ac4e583	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-9b12-e8a40fc2b12c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-22a8-581b7e255cf1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-6cbf-086428f07c26	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-031e-0b3edef64a8c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-2f8d-397f6f7f0b51	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-0e85-54601072462e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-76fa-d3579a1deb04	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8a0a-083f97313d36	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-1a33-888d81e981a7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-b08c-a8740bcf32e3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-2fd2-7f5fc1ab43e9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-f51d-b498004a7dcc	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-51f5-10e8d5f84d2e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-9c6c-3818ccf4bd53	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-0969-d14b55241267	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-ab53-e5969805c36f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-3cb5-ba56b8701689	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-738b-5185125dde84	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-f8c5-71d5dc0f2ef2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-e11f-7d86c1f8f9e7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-81ea-21fafc446d27	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8907-d4b2f14dc487	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-417b-9700c8690981	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-2633-b9d0afe9cac6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-b4ce-239b7f096901	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-a2cf-5dd18bff95c1	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-44d0-96335c7eeec1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-2f44-9897644aed85	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-4fd9-8bf10bd3d107	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-1c20-aeba48e6a06a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-da16-f4eef017296a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-61bc-9a09215fe752	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-b76f-d2ad70555ea3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-01ca-c6267edb1acb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-74a6-958f776a257b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8e4e-50590ad52d3e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-8415-0d4b4145125c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-adac-3e11b3def2c1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-5497-83dde7c1bc38	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-554c-90d84b6d8101	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-9792-3a239380c2ed	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-81cd-9b035f0e8a8d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-6965-f84f91a57692	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-405d-ccc892c24456	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-4cf3-07bf6ac458e5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-b7e8-e2adc435e107	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-5f43-4a915351624a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-2f6e-8f200f6bb3b9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-f710-ccb801f7ed81	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-772e-e8b7677725b3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-b033-c48c8eeca359	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-7378-e77fa4335340	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-7dc0-e26d89dc58a0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-7174-4ec654a210e6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-9053-d3a5c7b5982f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-de19-c9de42a896b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-200d-770ea56e908a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-af41-e0d0405069f2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-b8c6-3b40694e5d9d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-d83c-8ec6d1579661	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-e1f7-8eaf2ebaca73	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-b7ed-0afba6c727ef	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-5878-c20915b2146e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-b890-41be2e01c08f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-916e-25df4d9d93d5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-ac93-0f280460876b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-3a88-ad0f51c4e0ed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-f6b0-04196fb1c749	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-76b8-97e0c8a42922	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-45fb-f2f04592d12f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-a186-4dbd6a8fdab4	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-81d3-67a08eb8ed65	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-3bf9-f11caac19535	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-2876-9b1c972a6e90	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-4dd7-ce7e889df269	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-cb18-339338fdeba0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-6906-76ebedf50acc	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-dc6e-07e555958538	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-1afe-0eed31c1054b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-0437-cb3a6b3a958d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-f50b-d59a88d755fa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-0881-3a9e315c5f64	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-3636-a38b1bf04327	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-43fe-20dc2efa0ee6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-cb6d-ac45db19fb3f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-3b64-52fdc7feee1d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-44d7-06f247b345f9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-167e-2a6085dab458	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-6bdb-6fc2dca0cdd9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-a781-64aefc591c8d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-3b50-04ea7085d72b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-c20b-30d8cb4902ed	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-de1f-435b1d58a497	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-4afc-043ca7ea4540	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-dad1-2f11521f7c63	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-19be-75a405f69c96	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-6758-8bbeeb947bb4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-7743-e44d79d372fa	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-997c-ef480d19f0ea	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-cf20-4d2175d6a8cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-d5f6-2b1a2ea3717d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-ae25-2af837c7c31a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-93a5-df2c6393c3c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-ad57-eb00bd658a12	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-7f62-b2a7922f63a1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-5c19-27bce4eb9b18	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-7b0c-db769c9c23d4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-997e-4694c06e0a20	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-0439-d6b09d097637	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-3d8c-041355c3a082	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-c735-effed1d8db19	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-7bef-027f971ba602	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-7112-c5fb9c592005	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-e008-34fbc8f8d935	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-9f22-8af4fdcda82d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-245d-976f65676023	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-08a8-b82055101652	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-c077-74b154dcb9d9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-99f6-c5e71029b905	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-682f-3f0d213aa439	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-7dd8-0b168fe2c8cf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-d648-7b1d86df4d88	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-d1fb-68ef34bacf91	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-d5fe-7d12a44b8a77	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-6805-99503daeb233	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-a80b-ec4af95fbbc3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-e199-d11d2f372ccf	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-0ab1-12da28823c05	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-ae8a-a503aa2976af	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-e042-ddb9b9c78f0b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-5dc8-e4f33bf1a84f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-af6a-72d18f3dbebc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-fa73-2cf4e5cfafd8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-7c5c-7a56817761c0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-8b33-24b1ca410a41	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-55c3-5bc4415f662d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-d526-4b1cd1454d57	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-b712-bef5b4230f27	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-9587-cb1db8ec91d4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-9a75-10f1a2731b40	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-36d9-09e509132c83	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-9913-62a783590ef7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-61e7-fbad08662d30	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-7ef9-10682b9bd03b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-ae35-2e78ce9bae13	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-195f-827f8ab3bccb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-c58c-1cae96a37133	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-0682-65c58699623c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-8710-959fc6fa5567	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-7106-2005490e98b6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-bef6-a7f183d05845	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-7c4c-9211bede7f0c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-779b-1624bf88bdc7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-dcb4-eae65cdc2971	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-cc8e-554ec323a21e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-cd5e-5aa4dc45291b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-8591-7375ae2c6c95	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-f08e-4e167e960977	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-15df-fe35f781b02d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-79b7-2e9ba982dfbf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-2462-314094fb9713	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-6d76-ffaf9c6ea8fc	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-5512-501e3a94e62d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-ab2c-b3f3b63679ca	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-6d41-909b37f53b12	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-1eaf-c34140ebf005	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-51c3-cbbd1ba43fc1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-23e1-7a72e231dcfb	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-d469-17e5a78fcb2a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-7ace-08a6d4ac2fb3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-c5e4-a3eab32cc382	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-d412-57d4f5d2abfc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-4ee8-2dbf91fe89d2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-00ca-7fa9a374c315	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-defd-658414a23d53	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-e528-9823d8ac7ac0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-25af-76e669026a7b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-c8ca-49da8b588e2a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-d4ed-46735f9de525	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-4999-8b551a7a40e7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-79b9-aac374d12441	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-bd65-859142e6e6e4	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-d923-18541f7753a0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-3476-ab9c164828c0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-17f0-aa747df256b7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-4c16-306af6708c78	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-99e5-2a94de61763f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-a1c0-c32e05913d98	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-81ff-28688240a6c6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8307-e5bfd3c77a11	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-0a23-7534621fbf94	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-84c1-c48d0508c435	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-986b-ec068fbd6339	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-b84b-8653f6649b8c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-6cf5-70ab5ccca7d0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-9f8d-03f4632cfca0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-d314-abe8d77088f1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-ea3b-64d3acf18aa9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-eb31-4b67743f7998	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-3186-bf72c525a9b3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-4450-8f5bc162cd83	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-6757-2ed14d2d61d2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-325c-5e147029486d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8d37-86ecd6d89989	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-4860-20cae1d7adf5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-ea6c-0758ebb700d0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-79d5-9af4a0e9ea64	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-f4a0-6d1104c0ffdf	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-94d5-5be796de2985	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-3408-c20e931c466a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-3bfd-03677c14faf6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-d41a-c3b38ac3a7d8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-198a-6df88be1bb9b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-fe88-9c51566d41c5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-ca8d-6c421cabc43d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-dfb2-1a09be837c48	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-6c4b-7a59abd1f0f2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-d05b-a30e5a9519a3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-f866-3c632b08355b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-66f5-384f3f1de89a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-aa7c-4c59f8294432	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-0a02-021f070a9bc7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-a994-028e484043b5	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-ee17-90f4098772e8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-400a-3833c5995db4	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-6f58-c8d819cc30b0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-8184-9c1d4ddce219	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-01d5-27be184b54a2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-724f-47659458487b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-2a88-0f6feb7bbf97	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-1709-5e7679e7576a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-d4e7-e811fb1239fc	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-4c11-234bf65d3346	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-0543-473618854f96	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-2f09-a719082eb049	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-caf5-ae8c4bcb17e7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-d0bd-2206b4dcf518	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-f660-6ba4acfe00b3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-5609-02a8975e62d0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-db5b-6f9ed7359164	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-0224-c2a83722f63c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-53ac-76c197c82aa5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-b687-a550993e8c50	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-00cf-a0d928ff5d36	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-756f-73db6de2ff3a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-1a3e-7fa72f9ae71b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-01d1-2d73981a3e07	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-4986-7c20849a44db	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-bbaa-be5d6b783c86	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-0806-a1b00e4640e5	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-8577-b17fb7555c7f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-2b94-a546112b0b5e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-a2ff-22d57bcd7a03	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-98cc-498a8ed1fdec	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-7405-20c7bf365a27	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-4231-73767df11b83	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-ec4f-f13053a1ea33	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-3744-0c7d33923181	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-12fe-f7d96f465812	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-d09d-a9afccc67cce	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-4e8a-8c1c9508b39c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-3d90-a73161667790	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-51d2-f94694fadce1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-fd61-8c3d8672d464	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-2286-128a4c4e7d73	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-a394-8108427ff3e3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-b6e7-1a8ee8e7fb0e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-e951-f0cba21b0545	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-fd7d-915388d91da6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-31ed-1bc49172f520	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-7de5-c622de855665	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-a55a-da03aab01f44	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-e67a-deb26daaf731	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-b557-51474fa032d7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-2114-d6339412b02c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-f8c2-371743425932	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-ba87-ffaf54592272	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-5da6-9b0466941228	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-7d47-af809e54ec5d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-0947-252eb18ac87b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-be82-919c4cf640a7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-3260-d558922db5ae	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-8a8b-1ea46b55d76f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-60d6-7ebed6bcd18a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-dacb-3ead2fccf0d6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-b2ee-4ab344f40c2e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-b673-3a7e3665e9ee	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-98af-31aa593cb022	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-ce68-55656d874a8b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-e9f0-17e89acf8eeb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-329e-0847c8098a0e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-c7d7-d80922ad9c5a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-87e8-2af047bbd067	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-4dc1-efb99a4bd8c4	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-2a47-0c0c5f632c84	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-0aa2-3e9e8bec47db	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-5950-4da94962888c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-178c-8e526e6904f9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-a9fa-6b7905bbd6ef	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-c348-bca6ad7bb320	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-7266-b7e5100bc32c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-af5b-6950ca628825	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-f4c1-ff33e0b41ad5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-9a95-db755b9e3b9e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-260e-3a2e455daa1b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-9957-ba28ea0154fa	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-bc59-54e4377461ed	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-f552-2a699beefaa6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-6070-5c9891c1a969	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-5494-63c785307422	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-4f38-a0b08c6963b7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-85a5-60a5778ad56a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-2110-f88e68cea3e1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-c1dc-20c3bc54f6af	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-23dd-30c602338f77	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-a8aa-0379eabafb6b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-2d22-e2d9c6401187	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-207d-9256ab1f4dbb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-d59b-34becf2edec9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-5db6-170504c07006	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-bcf9-03dc9378a0dd	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-d104-72f0f972f9bf	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-34bf-11dadf66ff6f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-8a2f-c8888ebc6fd5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-c7ce-914cd4bd51c3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-849f-bad72aadfb5a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-743e-1fd92af0da8c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-86a0-01cc8ddac50a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-fa35-37518ace0ec9	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-1756-b2767e78239d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-affc-61a5b0e1db26	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-fbd3-c9b0c8c52507	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-ab37-50cb20d70c4d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-74d9-64e3bdb4edb9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-fa20-5f2df481934f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-faa9-3b045d665f81	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-9a19-32c4da0308ef	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-9922-b6ca92cfd563	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-1b48-f139cc648a33	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-1d32-46209b13aedb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-2002-3d825d24b8f6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-641b-22f1fedf9272	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-ae12-51b9b224ba8c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-a1fa-0b4b017a70e3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-2200-bff67a518bd2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-01b3-f183c45050e2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-0ed6-e86ea6ac0695	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-ff00-bd84d3bcfea6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-ce05-356793f716c4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-0f3a-73b588a80144	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-8b30-bd50956e949d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-4f19-267a5a9ec7d9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-b9ed-dbed9cbfacd5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-b1fe-eef9dae84cad	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-befb-6386e7ef7686	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-40c8-ca696fb35f07	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-7d8d-7c362193ccb5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-0341-cc452f594712	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-a273-469f6ca54031	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-96a6-c6a6b8737202	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-02ac-17a1b08e5877	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-b7c1-87aa64abf85c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-e7ca-e89d3d70b1af	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-f50e-01c46262f7e2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-2acd-e8d892f021ed	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-338f-d780c3deb86f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-267e-c2785ce5a7dc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-714a-a929b88a033c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-fe88-692e17629629	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-a02c-756b5607e3a9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-49c2-bfd80e7cae37	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-cfe5-4d35cb5d635f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-69b9-0b3934ce3e45	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-aebd-b7064acfa5c3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-f189-dc8651d0c09a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-c69e-60bfd7134a58	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-3177-feed4e94f4af	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-8b4c-7eb48d26bb08	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-3fc2-ed27891df589	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-b38e-120f2c2103d6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-3a65-f953cc7cffaf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-46b1-b99aa8875bae	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-1ba0-32de08d83364	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-b357-bc2270ac8133	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-9163-d2237584fc83	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-26a4-362ce2f766a9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-b61c-2c18117f8b67	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-ba59-c246a4eaec12	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-3003-d2489031dfaf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-dd17-f85160bbabc8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-5064-db0ab92b496f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-ff10-a7cca200ffc7	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-e76d-246c998110d7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-7f0c-185fc62f804b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-6f91-08d62957cb37	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-ce62-a14211f67d3a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-3e1c-da24f9b1b3a4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-123b-565f2d0fdcc4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-b034-313b1d389458	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8036-b0a4242c0943	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-eb5e-3b8ad6017690	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-7c42-252a058f88f6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-9898-663e45c49ae2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-dac6-b05afc8b2e6d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-95bd-4e713d20ae2b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-4fa4-5448a4e7809a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-8a63-f711fc08ad2e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-4d09-4908dcf02f87	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-6974-d10f1288ab2b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-558c-624a5d53b8d9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-f495-b8f9cf547810	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-c9f4-57a989516968	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-5bd1-479f361af46f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-496d-60233d3abefc	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-db45-70e4690cc1f0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-c40d-d8e0935a9aa3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-1c83-047f71a60906	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-323e-208c84facc47	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-e924-8e64e5a674d9	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-e496-e357a346eab5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-dd89-b88a4a151f2d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-1905-e02a4defb4b2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-7a9c-1bc90b3c2d55	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-741d-92fa429e6dea	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-5cc5-db7c9d812fea	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-6bda-8950bec9990f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-4365-f056d3eb7831	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-739a-294a9570be22	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-7134-86eab2b0a7cf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-610f-408206f6c9ae	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-806a-f5b9a3e4287d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-8710-c964fe3998ec	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-84d8-8392a6829592	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-85a2-3bfe7d92fed5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-c5ea-49eb0b9e8ddb	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-b86c-746919165aae	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-59d4-2a726ed0c8fa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-97b1-e55a4fa7c2cb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-4bda-78855455191e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-bcbb-07929957cdc1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-ac6a-138916dee1c7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-b5da-f6a091cdef58	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-3f5f-8b772e795e9f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-a9dd-b8bbee8504fd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-6d61-3f90a37a0fcc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-035d-95ba37cc5dee	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-4e4f-bb22f4d67b16	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-f324-64b50416b7f4	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-5cbd-eb11dd7b1f71	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-0f11-d0913e789fdc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-6d9a-c610e47c82c9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-a843-66867146484c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-f907-d8acd959e112	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-50ce-0e99ff267eb9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-fb44-521d000c17df	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-673e-ff858a4722ea	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-b48e-d0e0907456f5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-21f7-4e45dc1e1645	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-e706-065f9b89cf4d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-a714-1b2f51aeed25	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-5706-c848112b0308	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-4849-af4c422a807a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-1514-0ab13f26825f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-eb9c-97f85bc1295e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-ff48-248b718ab81c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-b600-23c7f253398b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-5e1f-7235319e664a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-6f2f-36a205e34ec3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-c4b9-fcc474df8ced	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-2015-9436e90c1983	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-697e-cb242fe5928f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-ce46-635ed6424918	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-c5df-1eed821338ad	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-b36b-c3f38122eab4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-c2b8-7b4690d68f4d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-42fb-135cd75fb6a5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-75bd-807d0fd21a19	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-b06f-3fa2a8e8a4c0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-93d9-6bcae9c40be9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-eab0-28646de04ecd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-d5c9-fea697f7f803	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-3d22-b4876493c461	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-6c66-ec7955676427	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-3196-339353fda236	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-0343-34c8c639b848	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-7c83-5759ad1db291	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-4087-debdece35183	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-7dc3-e92c029c4303	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-776a-e87e5928fce8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-56f2-8bd348a95052	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-420a-6314ba0f1c9a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-5497-03585b300244	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-35b7-aa2eb3149642	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-2d0f-d6c7e84a3bd2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-8623-63d71f38db6b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-c965-f08efd8c9d5f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-48a9-cf5c81911e33	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-8e46-3becae1fa273	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-09d1-522f13183ad7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-c61a-d174cee3e195	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-0f46-54083cb3b1b5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-7183-28c00c917aa9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-61c9-79ba40e9a500	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-9518-ce4567a00123	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-ed6f-7166af27aa55	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-4018-2d66971677bb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-7fe0-83a53f6afff0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-cbaa-cbeb15a0abe5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-be71-32a048191d02	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-5201-d9be3014f414	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-7ee6-2fc247c06d75	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-b2d9-d1291451651d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-a206-017e75093a09	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-b168-8a7f2c2bd6fa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-5ccf-f3368d05766a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-a1a1-ba1419d28540	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-50f3-332ed5857f4c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-c3a2-d842f7222244	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-2bb4-f83aafb62133	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-19f2-d720e57e3c61	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-0711-76c32e54d553	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-effe-ae42d65a0db2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-ff21-ded24e9e0ab0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-13ee-03741539e37f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-3403-dd436983ca1e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-ee15-c6b695826ede	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-bf0c-f407843a21ea	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-ab2f-22d184843b45	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-dd34-d0acdcd880a9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-0a4e-886807ae4222	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-e887-57a4edd0879f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-0466-8fd5593f8c4f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-e94b-5b456b023c6a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-a6a1-cc9c00c6b334	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-d56d-6b67a912f9bf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-377e-6e3f17696e93	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-d83d-e4e8340bbe20	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-c496-066f56f480a4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-7112-2242f3034e86	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-bbe4-3c22723ba0dd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-efbc-6a162bbfb6f9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-9203-385a4aa11f54	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-2245-55849a5a2b87	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-1f78-056de9bad4a0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-fe2b-dd059a478793	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-01a4-1a8144e2800d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-e6ab-56a49cf4a23a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-71a3-26eb47c7ff3c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-bb02-abae224b543e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-103b-94bc9102a58d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-d246-f3db1da777ed	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-075f-e74ca1602a2f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-f6c8-1b2200e10cd4	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-316a-8d9362065d89	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-ae00-e24d5aea3e6f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-8e4c-2cb6ddebdfed	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-4397-dcccaa5b3e42	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-62a9-ad7ff4720697	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-8bc9-fdf360112ab3	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-5064-767f86687365	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-b87e-1fa086026e37	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-8cc5-bdad39d62151	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-0c60-c44c145cab3c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-6817-ebd9e737f916	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-03ca-e41c76fca30f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-6bb5-7dbc8140a72c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-9aeb-6d4f5083a6dd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-fbf9-130109ff2a77	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-e3c7-40a9c4e793de	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-7625-97d74246c211	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-d85e-b77eb2bde305	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-08f2-6a8a5858d194	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-407d-7f302e716521	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-83d5-51a5a2e79b97	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-36eb-d6a511cad139	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-de71-6798bd7e3046	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-e90a-4261f3d36759	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-16f9-1d831b912c95	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-da6f-831266169798	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-8a3a-dcc1fcca45f1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-3733-f06bd4e8b34a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-d1aa-a50e0fb742d7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-2901-e7d1c6231c29	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-2c1a-99250cabc0d9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-d664-761eecb27eac	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-dc3c-3572556a684c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-f03f-5af8a4fe3f11	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-22c9-e62342a5fcd1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-a412-f1ec20d0cee0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-ac71-da7dd89880a3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-410f-b131a2656bb9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-2839-92ab46c9f8e5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-1419-42fd25d1103f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-8b6b-7e937e5dc334	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-1723-229176a89758	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-f014-31c330764a66	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-3ee6-4be8118bc35d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-5574-051ce5f12316	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-d52d-d709db635972	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-fddc-bebc4f9fac1e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-591d-5a348e734e00	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-95d0-a5ed22900d7e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-3075-12f7a5bad7e4	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-9e37-921b87697d59	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-b636-85a4dec4b2c9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-8899-01ab53aad5dc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-2597-8e03fd01c79c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-c577-edd3dd57a273	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-795d-30bb6800db90	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-31a3-a7c0cffb1cea	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-c3f4-708fadc3d185	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-ed8d-9bf174d63576	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-bd83-b879de15fc5b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-a5d7-7c8541092ac2	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-8a2d-4e6876c3b216	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-4788-f8d0ef2a6f05	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-ce53-b11728270d56	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-1a20-d74cf2c0bdf1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-1ddf-8805fe7e0d99	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-b656-0edbe2afa781	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-015c-7dc3ac21446a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-eb9e-46477970bde0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-0d97-3cbdf81a7490	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-f97b-86954dfc7c58	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-7139-e6fac698df85	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-b871-b9769658e89e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-0a9f-792cc8c64b37	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-05a5-db3a6e581956	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-d172-7cb4ef2121a7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-5f4a-802eac835c2b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-8240-a3b5f6824676	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-eab7-c35fc37867cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-4489-bf5a7b92b078	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-a6ed-4264ea752dd5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-ead2-308a25274738	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-9055-dd8115d69d5b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-e60f-89350c589ed6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-5b1d-a2c900d94030	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-eb32-ef90eb1d7757	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-c347-b589f28dc71f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-3135-3d9a99ed1a3c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-c6d4-c08e60584716	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-780c-31a66efb44bd	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-4185-b9a840267f33	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-fa0f-12b618efc8e8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-ba2e-d2ee9bfea0b3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-0520-75928f86e75d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-ee31-309d546afa56	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-67ad-7409c2b3cfc6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-9f95-23e095065b4e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-d309-565c631a897b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-6e6c-480f64a733f4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-00aa-6424730ad5e0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-9a30-a0dc0a6cb588	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-ffac-5df09deb16e2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-3c0e-7cee14df639e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-eda3-ea4a42a219c7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-528a-8ff5b2b122cc	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-1165-75d1efa5e95c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-25c6-7011ead92949	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-4e14-5bc8a5c3386c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-9b10-1eb9ffe3148d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e5-3bf9-2b819270f2ae	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e5-8ff7-cb3ca4153576	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e5-de29-0bab2fd0a234	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e5-b7a4-279b9ce0b810	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e5-219f-9d2b102013af	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e5-eaa0-b15bb0ada9a9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e5-087d-ad84b3f32f14	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e5-1fd0-a5315440cce6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e5-d351-20d9a89127cc	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e5-a9bb-4b70ed45e93b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e5-ed13-b68b75927889	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e5-580d-7c6ee94fe402	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e5-5777-6c46995ff98f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e5-e846-66624ab3a392	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e6-f258-dce1273ba74c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e6-c27b-e90269ea3c23	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e6-033c-5e01ff08e6bd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-30e6-1ac2-2e94226364e7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-30e6-b5c1-28ce37361314	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-30e6-bc97-4cc13bdf4a67	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-30e6-8222-88b326c934fb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-30e6-5818-4d9a0156c2bc	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-30e6-b992-64b245f45d9b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-30e6-2935-9a3ee76adb1f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-30e6-d9bf-a930b49adca0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-30e6-7b7c-68b36713e570	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-30e6-66ca-20427af263a0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-30e6-632b-fac570a9ee4f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-30e6-d3fc-e32ee8b929a6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-30e6-0e6a-906a7c9aff32	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-30e6-1c2e-b04029ff630c	Drzava-read	Seznam držav	f
00020000-553a-30e6-fa5b-3f4b96f0369b	Drzava-write	Urejanje držav	f
00020000-553a-30e6-4b1c-6f2df577d55c	Popa-delete	Poslovni partner - Briši	f
00020000-553a-30e6-a5d9-79ad513cfc8e	Popa-list	Poslovni partner - Beri	f
00020000-553a-30e6-5f08-c7ca211515c1	Popa-update	Poslovni partner - Posodobi	f
00020000-553a-30e6-0669-748dbb8a5526	Popa-create	Poslovni partner - Ustvari	f
00020000-553a-30e6-6938-3aaf85b67492	Posta-delete	Pošta - Briši	f
00020000-553a-30e6-bee2-f3882ef45e92	Posta-list	Pošta - Beri	f
00020000-553a-30e6-0883-1664cffeb21b	Posta-update	Pošta - Posodobi	f
00020000-553a-30e6-2fc1-471163760e30	Posta-create	Pošta - Ustvari	f
00020000-553a-30e6-3469-e829692b1557	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-553a-30e6-331b-021fcfa0358f	PostniNaslov-list	Poštni naslov - Beri	f
00020000-553a-30e6-5f12-b85c2aa7306b	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-553a-30e6-44ea-4d4349f2ae8d	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2635 (class 0 OID 1301412)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-553a-30e6-f376-2224e8ef466b	00020000-553a-30e6-1c2e-b04029ff630c
00000000-553a-30e6-f376-2224e8ef466b	00020000-553a-30e4-890d-ff738b328d2d
00000000-553a-30e6-224e-dccd479b3234	00020000-553a-30e6-fa5b-3f4b96f0369b
00000000-553a-30e6-224e-dccd479b3234	00020000-553a-30e6-1c2e-b04029ff630c
\.


--
-- TOC entry 2663 (class 0 OID 1301701)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 1301731)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1301843)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1301471)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1301513)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-553a-30e4-be5a-ad54d13f1952	8341	Adlešiči
00050000-553a-30e4-95c5-6ebde5e4c251	5270	Ajdovščina
00050000-553a-30e4-b8f7-948e6f542c3c	6280	Ankaran/Ancarano
00050000-553a-30e4-265c-ed6209215ad3	9253	Apače
00050000-553a-30e4-ea8a-d820b362cd44	8253	Artiče
00050000-553a-30e4-86bf-0993f6c72e3a	4275	Begunje na Gorenjskem
00050000-553a-30e4-5aa8-a80222898faf	1382	Begunje pri Cerknici
00050000-553a-30e4-acd0-de9ca78a219d	9231	Beltinci
00050000-553a-30e4-a1f8-8f44fd180434	2234	Benedikt
00050000-553a-30e4-da42-f0df75a51b82	2345	Bistrica ob Dravi
00050000-553a-30e4-74eb-a0866cc6f794	3256	Bistrica ob Sotli
00050000-553a-30e4-f83e-8466801cf870	8259	Bizeljsko
00050000-553a-30e4-17bc-e35e1da60214	1223	Blagovica
00050000-553a-30e4-437d-de319143f19a	8283	Blanca
00050000-553a-30e4-f950-56df89d3b6c7	4260	Bled
00050000-553a-30e4-ca96-69bdb10eaf7b	4273	Blejska Dobrava
00050000-553a-30e4-349c-821ecd217b67	9265	Bodonci
00050000-553a-30e4-7d38-8ad44a15faa6	9222	Bogojina
00050000-553a-30e4-2b00-d53a59ceee34	4263	Bohinjska Bela
00050000-553a-30e4-0bd0-93ee7b50f1e0	4264	Bohinjska Bistrica
00050000-553a-30e4-1f50-8d6ba018cb8e	4265	Bohinjsko jezero
00050000-553a-30e4-2f40-4e26f4048443	1353	Borovnica
00050000-553a-30e4-a1b6-e44c84e98dc0	8294	Boštanj
00050000-553a-30e4-0202-a4029334e799	5230	Bovec
00050000-553a-30e4-6576-c95ad33462c3	5295	Branik
00050000-553a-30e4-68c2-a7cf19b4fb41	3314	Braslovče
00050000-553a-30e4-913b-97c01c2ff525	5223	Breginj
00050000-553a-30e4-de11-f3d3d8a3b812	8280	Brestanica
00050000-553a-30e4-50b5-a52476b4c0a1	2354	Bresternica
00050000-553a-30e4-fe91-7b2c154f42d9	4243	Brezje
00050000-553a-30e4-ddbd-89eddfbf6b45	1351	Brezovica pri Ljubljani
00050000-553a-30e4-ef76-843824f2cd32	8250	Brežice
00050000-553a-30e4-0983-bf116f8fa039	4210	Brnik - Aerodrom
00050000-553a-30e4-8d8c-f961bde810e3	8321	Brusnice
00050000-553a-30e4-2221-597145b4dc2a	3255	Buče
00050000-553a-30e4-f128-f9fbeee5a462	8276	Bučka 
00050000-553a-30e4-219d-afe0d29e428d	9261	Cankova
00050000-553a-30e4-e128-65a2ef8be4f0	3000	Celje 
00050000-553a-30e4-f0cf-978f57c5a031	3001	Celje - poštni predali
00050000-553a-30e4-0278-3c684d6113b6	4207	Cerklje na Gorenjskem
00050000-553a-30e4-0a17-422c4fa896de	8263	Cerklje ob Krki
00050000-553a-30e4-507b-b5f93a61865c	1380	Cerknica
00050000-553a-30e4-0df4-6ac215d1db3f	5282	Cerkno
00050000-553a-30e4-178a-8065e10d2cb8	2236	Cerkvenjak
00050000-553a-30e4-ef16-5f0e378f7021	2215	Ceršak
00050000-553a-30e4-00c7-89081d850b76	2326	Cirkovce
00050000-553a-30e4-4fc2-6903afcfcd39	2282	Cirkulane
00050000-553a-30e4-9c85-92d26553d822	5273	Col
00050000-553a-30e4-8e14-a12ba4e83605	8251	Čatež ob Savi
00050000-553a-30e4-5166-69c39c5172ac	1413	Čemšenik
00050000-553a-30e4-ae68-c8fd9a1a8b3f	5253	Čepovan
00050000-553a-30e4-b5be-e8ed27f571f5	9232	Črenšovci
00050000-553a-30e4-c562-fbe6540348eb	2393	Črna na Koroškem
00050000-553a-30e4-7a36-20434a358152	6275	Črni Kal
00050000-553a-30e4-67d8-ef7998f88304	5274	Črni Vrh nad Idrijo
00050000-553a-30e4-ca53-07ab9192e640	5262	Črniče
00050000-553a-30e4-a067-c89846f5ef13	8340	Črnomelj
00050000-553a-30e4-c623-d9ff31a26ccf	6271	Dekani
00050000-553a-30e4-b7c3-a5ced4664d0c	5210	Deskle
00050000-553a-30e4-8d05-671913119ce8	2253	Destrnik
00050000-553a-30e4-dbfa-b1fb16346d3d	6215	Divača
00050000-553a-30e4-25c9-b11b07abff71	1233	Dob
00050000-553a-30e4-b86c-edcdf6a3548b	3224	Dobje pri Planini
00050000-553a-30e4-91ae-e61cf90c0e07	8257	Dobova
00050000-553a-30e4-d291-875e279003da	1423	Dobovec
00050000-553a-30e4-6804-7ff66709b3af	5263	Dobravlje
00050000-553a-30e4-2647-a0b3180903fc	3204	Dobrna
00050000-553a-30e4-7e59-d70b9bb77cbd	8211	Dobrnič
00050000-553a-30e4-c778-eb099ad0f7d1	1356	Dobrova
00050000-553a-30e4-fbcc-ddc63d45a47c	9223	Dobrovnik/Dobronak 
00050000-553a-30e4-e7f8-963a7432f684	5212	Dobrovo v Brdih
00050000-553a-30e4-ccb2-06aa2385a12a	1431	Dol pri Hrastniku
00050000-553a-30e4-077d-2e683081062f	1262	Dol pri Ljubljani
00050000-553a-30e4-0f6a-32cbdeaff319	1273	Dole pri Litiji
00050000-553a-30e4-36e8-56e075690cc1	1331	Dolenja vas
00050000-553a-30e4-b8f3-e9e445a431f6	8350	Dolenjske Toplice
00050000-553a-30e4-7d2c-f78ffb3fd13d	1230	Domžale
00050000-553a-30e4-421d-588e17aac493	2252	Dornava
00050000-553a-30e4-b5b9-cc50a247a051	5294	Dornberk
00050000-553a-30e4-16b9-3df8b35486d2	1319	Draga
00050000-553a-30e4-ac0b-8391dba7230e	8343	Dragatuš
00050000-553a-30e4-9836-8859375b3a90	3222	Dramlje
00050000-553a-30e4-1cde-0a7a58ddfab9	2370	Dravograd
00050000-553a-30e4-a8a6-9097a90f4d95	4203	Duplje
00050000-553a-30e4-e9aa-d6f736777580	6221	Dutovlje
00050000-553a-30e4-2627-b7a5db74b052	8361	Dvor
00050000-553a-30e4-13dd-2c33603fc33f	2343	Fala
00050000-553a-30e4-26c4-2da64d127cd8	9208	Fokovci
00050000-553a-30e4-30d6-016af185e18d	2313	Fram
00050000-553a-30e4-03d8-b0c04a85dded	3213	Frankolovo
00050000-553a-30e4-6b06-bc81dc7c7c23	1274	Gabrovka
00050000-553a-30e4-7e33-b486f00a4231	8254	Globoko
00050000-553a-30e4-a9c6-85111399a198	5275	Godovič
00050000-553a-30e4-db8e-709de6d325b7	4204	Golnik
00050000-553a-30e4-9ebf-8d9ffcc7c04e	3303	Gomilsko
00050000-553a-30e4-2a5e-c10de7e2ad2f	4224	Gorenja vas
00050000-553a-30e4-412f-678d34dc70f1	3263	Gorica pri Slivnici
00050000-553a-30e4-ce60-edc95cc5ed0c	2272	Gorišnica
00050000-553a-30e4-7c4b-6932d744e464	9250	Gornja Radgona
00050000-553a-30e4-9fe3-8116adc3b175	3342	Gornji Grad
00050000-553a-30e4-5b3d-ea2136d54112	4282	Gozd Martuljek
00050000-553a-30e4-6fcb-afb57dc2d16a	6272	Gračišče
00050000-553a-30e4-6b0d-898668f55f1e	9264	Grad
00050000-553a-30e4-d18d-961cd35e1bdd	8332	Gradac
00050000-553a-30e4-645c-87b587b4d736	1384	Grahovo
00050000-553a-30e4-ac4f-0b9db9e8352c	5242	Grahovo ob Bači
00050000-553a-30e4-5fa3-e5b56f99079d	5251	Grgar
00050000-553a-30e4-5ebb-8198edda37eb	3302	Griže
00050000-553a-30e4-5caa-74b33fac29bc	3231	Grobelno
00050000-553a-30e4-a605-a2bb218798d3	1290	Grosuplje
00050000-553a-30e4-fb91-19d9114a957b	2288	Hajdina
00050000-553a-30e4-daf9-2e17c2f6bb05	8362	Hinje
00050000-553a-30e4-7c31-2e97a8e07a2d	2311	Hoče
00050000-553a-30e4-0b7d-eb2891bc37f0	9205	Hodoš/Hodos
00050000-553a-30e4-8458-690bbcc41f7e	1354	Horjul
00050000-553a-30e4-c766-68b78214bf67	1372	Hotedršica
00050000-553a-30e4-0a57-0e6d23f581fa	1430	Hrastnik
00050000-553a-30e4-d70f-63dc21465ed8	6225	Hruševje
00050000-553a-30e4-156a-b9abfc2b8ea7	4276	Hrušica
00050000-553a-30e4-4f20-89d6c8c45c3d	5280	Idrija
00050000-553a-30e4-68d6-f38f5210be70	1292	Ig
00050000-553a-30e4-b8c3-46f1b034c9fb	6250	Ilirska Bistrica
00050000-553a-30e4-4d9d-6688e329cc10	6251	Ilirska Bistrica-Trnovo
00050000-553a-30e4-e7bb-fe30e587c424	1295	Ivančna Gorica
00050000-553a-30e4-2d78-958e22b00ecb	2259	Ivanjkovci
00050000-553a-30e4-159f-737ce616fa99	1411	Izlake
00050000-553a-30e4-a2f7-64b4e5d8e256	6310	Izola/Isola
00050000-553a-30e4-ac3f-a36be35e4460	2222	Jakobski Dol
00050000-553a-30e4-2574-e7abeccd6577	2221	Jarenina
00050000-553a-30e4-f90e-2b734a02fd51	6254	Jelšane
00050000-553a-30e4-a949-1728ed80c6e0	4270	Jesenice
00050000-553a-30e4-a2d8-5d75a38474e9	8261	Jesenice na Dolenjskem
00050000-553a-30e4-8d87-428987faed6f	3273	Jurklošter
00050000-553a-30e4-c515-abf9eea795df	2223	Jurovski Dol
00050000-553a-30e4-4ef0-58c6595566cc	2256	Juršinci
00050000-553a-30e4-cb3f-5368000806d1	5214	Kal nad Kanalom
00050000-553a-30e4-4216-d14b7b24fcda	3233	Kalobje
00050000-553a-30e4-14c8-665e4f8c82bd	4246	Kamna Gorica
00050000-553a-30e4-fb3a-9fb3ceb24ba9	2351	Kamnica
00050000-553a-30e4-2cd0-6ae907880056	1241	Kamnik
00050000-553a-30e4-569d-53d4e9ce8ab7	5213	Kanal
00050000-553a-30e4-1786-822796dd262b	8258	Kapele
00050000-553a-30e4-9fb9-2bda64494edf	2362	Kapla
00050000-553a-30e4-2107-fdc6538fdcd7	2325	Kidričevo
00050000-553a-30e4-8499-5b9ba7835320	1412	Kisovec
00050000-553a-30e4-b95d-cc700add75e1	6253	Knežak
00050000-553a-30e4-2862-b73399172c82	5222	Kobarid
00050000-553a-30e4-82e7-85cb8cc2ba78	9227	Kobilje
00050000-553a-30e4-6108-0f2b3ca0f38f	1330	Kočevje
00050000-553a-30e4-c0db-e5eeaf50a803	1338	Kočevska Reka
00050000-553a-30e4-7d23-1dd1ec7148b4	2276	Kog
00050000-553a-30e4-8543-5c739e3e28d4	5211	Kojsko
00050000-553a-30e4-69cd-0bb3d135775a	6223	Komen
00050000-553a-30e4-ea63-814af64d65be	1218	Komenda
00050000-553a-30e4-f1e7-587acb912d50	6000	Koper/Capodistria 
00050000-553a-30e4-d584-e61eb726ce05	6001	Koper/Capodistria - poštni predali
00050000-553a-30e4-0eca-46e0f993e88a	8282	Koprivnica
00050000-553a-30e4-4f74-7e2310f36b71	5296	Kostanjevica na Krasu
00050000-553a-30e4-90b7-a0d4fa3c99d9	8311	Kostanjevica na Krki
00050000-553a-30e4-7965-cbfeb16c710e	1336	Kostel
00050000-553a-30e4-387c-d9ad8025c24b	6256	Košana
00050000-553a-30e4-c759-c194417844a2	2394	Kotlje
00050000-553a-30e4-32be-82ecec797062	6240	Kozina
00050000-553a-30e4-101c-3052acf8d2b2	3260	Kozje
00050000-553a-30e4-ce61-fba802f6fae0	4000	Kranj 
00050000-553a-30e4-515b-9533e9b4057a	4001	Kranj - poštni predali
00050000-553a-30e4-995d-f0282b0753cf	4280	Kranjska Gora
00050000-553a-30e4-4d52-3f6dbd858d33	1281	Kresnice
00050000-553a-30e4-02ff-87b3aa5f1bce	4294	Križe
00050000-553a-30e4-cefb-37b198f5446d	9206	Križevci
00050000-553a-30e4-4902-bd718d804108	9242	Križevci pri Ljutomeru
00050000-553a-30e4-5a5f-ebcd7adced18	1301	Krka
00050000-553a-30e4-bbb7-6f096d37b7be	8296	Krmelj
00050000-553a-30e4-1803-f69c37563c59	4245	Kropa
00050000-553a-30e4-17a3-572f07cf5b67	8262	Krška vas
00050000-553a-30e4-c9eb-054a30c21e5b	8270	Krško
00050000-553a-30e4-1dd4-6717f1675150	9263	Kuzma
00050000-553a-30e4-722e-88fee84f8b9b	2318	Laporje
00050000-553a-30e4-d98a-151162799cce	3270	Laško
00050000-553a-30e4-d2e9-cf21ee8a2b6b	1219	Laze v Tuhinju
00050000-553a-30e4-8885-aa1ffbe8a6ec	2230	Lenart v Slovenskih goricah
00050000-553a-30e4-7fc4-e6757476c886	9220	Lendava/Lendva
00050000-553a-30e4-2a26-f91d8903a550	4248	Lesce
00050000-553a-30e4-7601-e2e81aec10e2	3261	Lesično
00050000-553a-30e4-de44-60c654dd59c4	8273	Leskovec pri Krškem
00050000-553a-30e4-0e88-ee4bd12683b0	2372	Libeliče
00050000-553a-30e4-cd4e-a1f76d31acc1	2341	Limbuš
00050000-553a-30e4-a49b-c269bf21dbe9	1270	Litija
00050000-553a-30e4-4a53-382f0b023ac2	3202	Ljubečna
00050000-553a-30e4-1a97-3c5dbe1dc881	1000	Ljubljana 
00050000-553a-30e4-1721-14e1796cf8f0	1001	Ljubljana - poštni predali
00050000-553a-30e4-f712-6f743c25c29e	1231	Ljubljana - Črnuče
00050000-553a-30e4-ee6f-c088e5b1ee9e	1261	Ljubljana - Dobrunje
00050000-553a-30e4-654f-d7164867e757	1260	Ljubljana - Polje
00050000-553a-30e4-0b4d-67717895f0b5	1210	Ljubljana - Šentvid
00050000-553a-30e4-2d9b-e6f12f5d444d	1211	Ljubljana - Šmartno
00050000-553a-30e4-5d79-64a57db8c096	3333	Ljubno ob Savinji
00050000-553a-30e4-8fc7-a6adb83e36d4	9240	Ljutomer
00050000-553a-30e4-d31e-43dc5a46878f	3215	Loče
00050000-553a-30e4-1b2f-c9ebbc9cae64	5231	Log pod Mangartom
00050000-553a-30e4-9436-b1a82d23533f	1358	Log pri Brezovici
00050000-553a-30e4-a88e-82635cce87ba	1370	Logatec
00050000-553a-30e4-b6c0-1529305ae7bf	1371	Logatec
00050000-553a-30e4-3c8d-c7f657d83491	1434	Loka pri Zidanem Mostu
00050000-553a-30e4-ee70-99f3f0ede211	3223	Loka pri Žusmu
00050000-553a-30e4-bc95-e43948067775	6219	Lokev
00050000-553a-30e4-6701-310000ade180	1318	Loški Potok
00050000-553a-30e4-dbba-f60bc3545657	2324	Lovrenc na Dravskem polju
00050000-553a-30e4-12e1-df430c8e0118	2344	Lovrenc na Pohorju
00050000-553a-30e4-e825-aef4912476e2	3334	Luče
00050000-553a-30e4-740b-a3be1cd0323e	1225	Lukovica
00050000-553a-30e4-7d58-1b0f7cfd2de1	9202	Mačkovci
00050000-553a-30e4-0416-6be43ed6cae3	2322	Majšperk
00050000-553a-30e4-6fbc-079d82eccea6	2321	Makole
00050000-553a-30e4-abea-42e6443d1f6f	9243	Mala Nedelja
00050000-553a-30e4-81fb-6ccd40b0af18	2229	Malečnik
00050000-553a-30e4-4d5e-1da406493587	6273	Marezige
00050000-553a-30e4-9986-e821f4651a60	2000	Maribor 
00050000-553a-30e4-7d10-19459c2c18c1	2001	Maribor - poštni predali
00050000-553a-30e4-8e53-b31ea692564c	2206	Marjeta na Dravskem polju
00050000-553a-30e4-b3e8-f66c3a167d6c	2281	Markovci
00050000-553a-30e4-2912-753e7423d810	9221	Martjanci
00050000-553a-30e4-e8d2-ca4256303239	6242	Materija
00050000-553a-30e4-6ed6-a65590ede472	4211	Mavčiče
00050000-553a-30e4-63aa-d16de8d3b6b7	1215	Medvode
00050000-553a-30e4-6692-d9b197bc9301	1234	Mengeš
00050000-553a-30e4-389f-1c3fdffdd336	8330	Metlika
00050000-553a-30e4-ef1e-8b64868ac597	2392	Mežica
00050000-553a-30e4-69cb-317e44c4b293	2204	Miklavž na Dravskem polju
00050000-553a-30e4-6480-030e00303cea	2275	Miklavž pri Ormožu
00050000-553a-30e4-6d7a-52318dd0eea6	5291	Miren
00050000-553a-30e4-d3eb-2c2a826b5093	8233	Mirna
00050000-553a-30e4-ff4e-e29746536ab7	8216	Mirna Peč
00050000-553a-30e4-aed1-98d86c204dd4	2382	Mislinja
00050000-553a-30e4-ca48-20a1442b391f	4281	Mojstrana
00050000-553a-30e4-aacf-4d8d4d55e6b2	8230	Mokronog
00050000-553a-30e4-320d-67a6c4dbe466	1251	Moravče
00050000-553a-30e4-faa6-f9cdc53bd829	9226	Moravske Toplice
00050000-553a-30e4-40d9-39168bb359ef	5216	Most na Soči
00050000-553a-30e4-d003-ee8c68583340	1221	Motnik
00050000-553a-30e4-01ba-cb69e4860bd6	3330	Mozirje
00050000-553a-30e4-dfa7-d3b8fd8111df	9000	Murska Sobota 
00050000-553a-30e4-e8cb-70b3eb4fec7d	9001	Murska Sobota - poštni predali
00050000-553a-30e4-5caf-4c33913a45e6	2366	Muta
00050000-553a-30e4-e78d-55bfeae25913	4202	Naklo
00050000-553a-30e4-88e6-2d2b2fb0d785	3331	Nazarje
00050000-553a-30e4-4f58-98c84660a22f	1357	Notranje Gorice
00050000-553a-30e4-a322-faac330db565	3203	Nova Cerkev
00050000-553a-30e4-9efd-0629fac46add	5000	Nova Gorica 
00050000-553a-30e4-8a6c-f391fe1ccff3	5001	Nova Gorica - poštni predali
00050000-553a-30e4-110e-cd987f7bfa52	1385	Nova vas
00050000-553a-30e4-6a88-643f1a819057	8000	Novo mesto
00050000-553a-30e4-21da-0b2d2f8611de	8001	Novo mesto - poštni predali
00050000-553a-30e4-a8a7-50c543124e3c	6243	Obrov
00050000-553a-30e4-bc8b-587b74bd9f20	9233	Odranci
00050000-553a-30e4-54fd-230f4437641d	2317	Oplotnica
00050000-553a-30e4-5f3f-ebe718312649	2312	Orehova vas
00050000-553a-30e4-70ae-b12dbacbc3b8	2270	Ormož
00050000-553a-30e4-4800-494111238f30	1316	Ortnek
00050000-553a-30e4-11c0-66598f2ba218	1337	Osilnica
00050000-553a-30e4-3685-3f413f896acd	8222	Otočec
00050000-553a-30e4-7778-cfe674d7e510	2361	Ožbalt
00050000-553a-30e4-db82-e53099eeb266	2231	Pernica
00050000-553a-30e4-0959-17f09236741a	2211	Pesnica pri Mariboru
00050000-553a-30e4-4b5c-db2745133f55	9203	Petrovci
00050000-553a-30e4-73b3-38f227088a6e	3301	Petrovče
00050000-553a-30e4-6b5c-ab7ad0066348	6330	Piran/Pirano
00050000-553a-30e4-4fb6-44529cb32f08	8255	Pišece
00050000-553a-30e4-f119-ed96b1777bb4	6257	Pivka
00050000-553a-30e4-dc55-c2bde7a134b3	6232	Planina
00050000-553a-30e4-5c2b-100f19801afa	3225	Planina pri Sevnici
00050000-553a-30e4-039e-01a2cbd05ca6	6276	Pobegi
00050000-553a-30e4-d3eb-bc0ffa2878e2	8312	Podbočje
00050000-553a-30e4-4746-de8bec50ea5a	5243	Podbrdo
00050000-553a-30e4-770d-10ecaa1d969d	3254	Podčetrtek
00050000-553a-30e4-aa6b-2b27694352c1	2273	Podgorci
00050000-553a-30e4-d489-93c200219480	6216	Podgorje
00050000-553a-30e4-3bcd-7c14dc875fe8	2381	Podgorje pri Slovenj Gradcu
00050000-553a-30e4-d342-98372281958d	6244	Podgrad
00050000-553a-30e4-8e07-b78f9ab29c06	1414	Podkum
00050000-553a-30e4-c573-ecd411bf4974	2286	Podlehnik
00050000-553a-30e4-7fac-3d57d7c3c7e6	5272	Podnanos
00050000-553a-30e4-1418-a5f8cf5ceffa	4244	Podnart
00050000-553a-30e4-0232-d682237362f8	3241	Podplat
00050000-553a-30e4-80d0-a6d921d4c898	3257	Podsreda
00050000-553a-30e4-ad15-bbbe1dbf6443	2363	Podvelka
00050000-553a-30e4-d4e8-69541fce7ccc	2208	Pohorje
00050000-553a-30e4-8f3b-24273caa6794	2257	Polenšak
00050000-553a-30e4-0748-774778360f7e	1355	Polhov Gradec
00050000-553a-30e4-0af7-451a7d1fbc40	4223	Poljane nad Škofjo Loko
00050000-553a-30e4-1240-5746625400a0	2319	Poljčane
00050000-553a-30e4-3c78-2767bcdd1a37	1272	Polšnik
00050000-553a-30e4-d0fa-8085283b41a5	3313	Polzela
00050000-553a-30e4-acea-240b092ec541	3232	Ponikva
00050000-553a-30e4-b284-d310666b0c53	6320	Portorož/Portorose
00050000-553a-30e4-d76f-185533b51f77	6230	Postojna
00050000-553a-30e4-3bf4-7c84135df6e6	2331	Pragersko
00050000-553a-30e4-3ddb-77b0f55bfaa3	3312	Prebold
00050000-553a-30e4-5ef3-bee99c9554c9	4205	Preddvor
00050000-553a-30e4-30b4-621e2671ae9c	6255	Prem
00050000-553a-30e4-f0ec-dff49c64c0bd	1352	Preserje
00050000-553a-30e4-2d1d-8011066f9afa	6258	Prestranek
00050000-553a-30e4-4042-5066f319bb62	2391	Prevalje
00050000-553a-30e4-eacb-ad5b3f2bf26d	3262	Prevorje
00050000-553a-30e4-09e1-d776a7e39851	1276	Primskovo 
00050000-553a-30e4-3f03-1dd776c37305	3253	Pristava pri Mestinju
00050000-553a-30e4-eb9a-60fec5780f7e	9207	Prosenjakovci/Partosfalva
00050000-553a-30e4-0eee-b967a587d473	5297	Prvačina
00050000-553a-30e4-da81-5a9c8305d37a	2250	Ptuj
00050000-553a-30e4-0fbb-eabb81b849e8	2323	Ptujska Gora
00050000-553a-30e4-ddf6-689b5093e8d9	9201	Puconci
00050000-553a-30e4-7bda-7f9d6e1cb58e	2327	Rače
00050000-553a-30e4-b96d-44cd93160421	1433	Radeče
00050000-553a-30e4-d2d1-d0b1c4a219bc	9252	Radenci
00050000-553a-30e4-33cb-f48dc12ddb67	2360	Radlje ob Dravi
00050000-553a-30e4-dacc-4730392d9727	1235	Radomlje
00050000-553a-30e4-f8d0-2c464f6112bb	4240	Radovljica
00050000-553a-30e4-96e0-13825400879b	8274	Raka
00050000-553a-30e4-e6d4-d31c1bc2c4d2	1381	Rakek
00050000-553a-30e4-06ac-0748e824228c	4283	Rateče - Planica
00050000-553a-30e4-4acb-4b77bfbf3592	2390	Ravne na Koroškem
00050000-553a-30e4-4d5f-06b5fba9264c	9246	Razkrižje
00050000-553a-30e4-5ed9-497be4a89322	3332	Rečica ob Savinji
00050000-553a-30e4-b541-b5f81e7be66d	5292	Renče
00050000-553a-30e4-54e0-cead79f5fda7	1310	Ribnica
00050000-553a-30e4-c2c9-128240e8917c	2364	Ribnica na Pohorju
00050000-553a-30e4-93ef-e548af31db5b	3272	Rimske Toplice
00050000-553a-30e4-51f0-306a68760ff2	1314	Rob
00050000-553a-30e4-841c-d5280bf3cd6a	5215	Ročinj
00050000-553a-30e4-6ee3-ac27c239be26	3250	Rogaška Slatina
00050000-553a-30e4-33e8-e5fda2373574	9262	Rogašovci
00050000-553a-30e4-b0f0-c9d01e9c67b7	3252	Rogatec
00050000-553a-30e4-29dd-1d2a4aa2a677	1373	Rovte
00050000-553a-30e4-aa37-1422bba8d09e	2342	Ruše
00050000-553a-30e4-effd-18ae1bd496c2	1282	Sava
00050000-553a-30e4-d0c0-4c4e6fa9a0de	6333	Sečovlje/Sicciole
00050000-553a-30e4-0cc2-23af33d6d023	4227	Selca
00050000-553a-30e4-c5c1-2f510403500e	2352	Selnica ob Dravi
00050000-553a-30e4-46a3-f3c29ec7669f	8333	Semič
00050000-553a-30e4-0799-67bd9145380d	8281	Senovo
00050000-553a-30e4-4eef-a0d43e04cef2	6224	Senožeče
00050000-553a-30e4-7363-0459269089c2	8290	Sevnica
00050000-553a-30e4-a3c6-f8df99630d7e	6210	Sežana
00050000-553a-30e4-c166-c170e3c73cd3	2214	Sladki Vrh
00050000-553a-30e4-4d6e-2f77baf0b16c	5283	Slap ob Idrijci
00050000-553a-30e4-3d6a-d88906eb5070	2380	Slovenj Gradec
00050000-553a-30e4-b23d-68756119269d	2310	Slovenska Bistrica
00050000-553a-30e4-35e6-9098c34e7aae	3210	Slovenske Konjice
00050000-553a-30e4-51a1-4e1a3787f9f7	1216	Smlednik
00050000-553a-30e4-f796-d64e3e42bf94	5232	Soča
00050000-553a-30e4-08c8-94fb8ce9affd	1317	Sodražica
00050000-553a-30e4-c017-1f6937139c99	3335	Solčava
00050000-553a-30e4-f285-c86603c8dc1b	5250	Solkan
00050000-553a-30e4-b0b9-4930327b2b37	4229	Sorica
00050000-553a-30e4-818f-cd74da4486f1	4225	Sovodenj
00050000-553a-30e4-566b-f91715eb7e60	5281	Spodnja Idrija
00050000-553a-30e4-d6e2-cdc5a1b03285	2241	Spodnji Duplek
00050000-553a-30e4-1c46-ba3a07a6b7c0	9245	Spodnji Ivanjci
00050000-553a-30e4-6bb8-e910d632ca01	2277	Središče ob Dravi
00050000-553a-30e4-dca5-099393e52741	4267	Srednja vas v Bohinju
00050000-553a-30e4-4e83-24d8c102c9fe	8256	Sromlje 
00050000-553a-30e4-1a72-d611275f96ca	5224	Srpenica
00050000-553a-30e4-0bce-a20d10cb26e0	1242	Stahovica
00050000-553a-30e4-1f47-df877364c752	1332	Stara Cerkev
00050000-553a-30e4-67a5-b5c70d5e6128	8342	Stari trg ob Kolpi
00050000-553a-30e4-a0f9-4ba97bd9e386	1386	Stari trg pri Ložu
00050000-553a-30e4-82f2-3e20f6fe8228	2205	Starše
00050000-553a-30e4-7ce3-24545f59dbd6	2289	Stoperce
00050000-553a-30e4-1590-481dd5bb43ce	8322	Stopiče
00050000-553a-30e4-d5ed-150fb6704349	3206	Stranice
00050000-553a-30e4-b440-c5818f57888d	8351	Straža
00050000-553a-30e4-8ce4-b943101b4e1e	1313	Struge
00050000-553a-30e4-ac92-58839dcf19fd	8293	Studenec
00050000-553a-30e4-0e40-646377d7ac13	8331	Suhor
00050000-553a-30e4-5bf7-61f445750004	2233	Sv. Ana v Slovenskih goricah
00050000-553a-30e4-987e-0a29333621f6	2235	Sv. Trojica v Slovenskih goricah
00050000-553a-30e4-4783-cab512920a3c	2353	Sveti Duh na Ostrem Vrhu
00050000-553a-30e4-0c59-67076a2741c2	9244	Sveti Jurij ob Ščavnici
00050000-553a-30e4-d311-7c32820bbd32	3264	Sveti Štefan
00050000-553a-30e4-89db-c0c03f105b64	2258	Sveti Tomaž
00050000-553a-30e4-8a91-0092ccc6ad6e	9204	Šalovci
00050000-553a-30e4-d075-4b15e3432818	5261	Šempas
00050000-553a-30e4-8046-a8a64ed75759	5290	Šempeter pri Gorici
00050000-553a-30e4-b6fa-d76a60585901	3311	Šempeter v Savinjski dolini
00050000-553a-30e4-6301-29ff34546074	4208	Šenčur
00050000-553a-30e4-770f-06cc83b5929d	2212	Šentilj v Slovenskih goricah
00050000-553a-30e4-1999-319f66b281cb	8297	Šentjanž
00050000-553a-30e4-466a-75b707701f22	2373	Šentjanž pri Dravogradu
00050000-553a-30e4-9881-a5d06b86a136	8310	Šentjernej
00050000-553a-30e4-4ecf-53c8aaec3763	3230	Šentjur
00050000-553a-30e4-6598-a2326e286bc6	3271	Šentrupert
00050000-553a-30e4-8df2-b09a4712a14d	8232	Šentrupert
00050000-553a-30e4-7975-286a8ae756ea	1296	Šentvid pri Stični
00050000-553a-30e4-b98f-bbd274be326c	8275	Škocjan
00050000-553a-30e4-6e89-9d8e73e4e8f4	6281	Škofije
00050000-553a-30e4-e5d9-5c9b338912f1	4220	Škofja Loka
00050000-553a-30e4-1f29-5b89899341b8	3211	Škofja vas
00050000-553a-30e4-bec4-c995fc48b16e	1291	Škofljica
00050000-553a-30e4-472d-f8b38c4b8865	6274	Šmarje
00050000-553a-30e4-d26b-6aa25b247f37	1293	Šmarje - Sap
00050000-553a-30e4-b487-05c8ecd4186e	3240	Šmarje pri Jelšah
00050000-553a-30e4-8ae1-b37993b35b21	8220	Šmarješke Toplice
00050000-553a-30e4-016b-882a3ecc4c57	2315	Šmartno na Pohorju
00050000-553a-30e4-d4b8-190c01fa7a56	3341	Šmartno ob Dreti
00050000-553a-30e4-6822-a1fe57a4a3db	3327	Šmartno ob Paki
00050000-553a-30e4-ffe5-8b63c35814c5	1275	Šmartno pri Litiji
00050000-553a-30e4-625c-f990bc93ad92	2383	Šmartno pri Slovenj Gradcu
00050000-553a-30e4-10e4-b2158a7ccf39	3201	Šmartno v Rožni dolini
00050000-553a-30e4-fae6-088a4d9da82d	3325	Šoštanj
00050000-553a-30e4-996e-6a05c1b707ed	6222	Štanjel
00050000-553a-30e4-15d8-15119f148137	3220	Štore
00050000-553a-30e4-fc7f-bedfad1fa768	3304	Tabor
00050000-553a-30e4-17dd-d95c11a2d241	3221	Teharje
00050000-553a-30e4-60af-d8d31697454e	9251	Tišina
00050000-553a-30e4-f108-d095024398c0	5220	Tolmin
00050000-553a-30e4-85c4-9e9b07335341	3326	Topolšica
00050000-553a-30e4-369d-a09aef3e70e8	2371	Trbonje
00050000-553a-30e4-4025-3fadd75a0af4	1420	Trbovlje
00050000-553a-30e4-0aa4-1afc28ebb6ca	8231	Trebelno 
00050000-553a-30e4-775a-bceb193ba6a0	8210	Trebnje
00050000-553a-30e4-014d-c398a8f604c5	5252	Trnovo pri Gorici
00050000-553a-30e4-84f3-9ec77e1b2341	2254	Trnovska vas
00050000-553a-30e4-8bf3-5c275c5e253e	1222	Trojane
00050000-553a-30e4-4b29-c87c9679e82f	1236	Trzin
00050000-553a-30e4-7af2-90d202882c07	4290	Tržič
00050000-553a-30e4-7302-52dde0b73018	8295	Tržišče
00050000-553a-30e4-d668-13e2b988328e	1311	Turjak
00050000-553a-30e4-4ffb-d1991e320f99	9224	Turnišče
00050000-553a-30e4-8690-c09e4f2f88ff	8323	Uršna sela
00050000-553a-30e4-c76f-ecfb81248002	1252	Vače
00050000-553a-30e4-8d1f-165698745c56	3320	Velenje 
00050000-553a-30e4-f0e4-613678dbed9c	3322	Velenje - poštni predali
00050000-553a-30e4-694a-fa1c280af22c	8212	Velika Loka
00050000-553a-30e4-3ab6-3d17c09094d5	2274	Velika Nedelja
00050000-553a-30e4-0bc3-725cde498859	9225	Velika Polana
00050000-553a-30e4-97ab-078fc03a7c3a	1315	Velike Lašče
00050000-553a-30e4-1ae5-124322a0506c	8213	Veliki Gaber
00050000-553a-30e4-2cc9-386e435d13e8	9241	Veržej
00050000-553a-30e4-9e8c-5edfadaa1ea5	1312	Videm - Dobrepolje
00050000-553a-30e4-06d8-83b553378636	2284	Videm pri Ptuju
00050000-553a-30e4-3deb-9ce50af1b254	8344	Vinica
00050000-553a-30e4-b8f2-eb0e6d373af7	5271	Vipava
00050000-553a-30e4-0111-7b49364187f6	4212	Visoko
00050000-553a-30e4-5f31-fd99c54e6cef	1294	Višnja Gora
00050000-553a-30e4-b5f9-14cc7b8f4233	3205	Vitanje
00050000-553a-30e4-0d69-296f148995b7	2255	Vitomarci
00050000-553a-30e4-dfc4-9c59f365eb90	1217	Vodice
00050000-553a-30e4-931b-4f8db5e4923c	3212	Vojnik\t
00050000-553a-30e4-4bab-f692aed7e974	5293	Volčja Draga
00050000-553a-30e4-5355-bf6248d948bc	2232	Voličina
00050000-553a-30e4-209d-4162086a4a81	3305	Vransko
00050000-553a-30e4-3d73-eabde7889f94	6217	Vremski Britof
00050000-553a-30e4-489a-2968ff45a5b1	1360	Vrhnika
00050000-553a-30e4-0e51-bbd35f005b7f	2365	Vuhred
00050000-553a-30e4-4406-4ad5d1380448	2367	Vuzenica
00050000-553a-30e4-95b7-31f3112e6edc	8292	Zabukovje 
00050000-553a-30e4-e9bf-c91a263714f7	1410	Zagorje ob Savi
00050000-553a-30e4-9cba-26b0ecfa38e1	1303	Zagradec
00050000-553a-30e4-d935-67767b4582b6	2283	Zavrč
00050000-553a-30e4-3f38-da77308a2166	8272	Zdole 
00050000-553a-30e4-7854-c8f8314f4a70	4201	Zgornja Besnica
00050000-553a-30e4-70fc-c7802095b38d	2242	Zgornja Korena
00050000-553a-30e4-9c81-7d3002fa2cd5	2201	Zgornja Kungota
00050000-553a-30e4-09c5-6ce9f1c5b115	2316	Zgornja Ložnica
00050000-553a-30e4-457b-7985f62c753b	2314	Zgornja Polskava
00050000-553a-30e4-744e-75d4bf8c311a	2213	Zgornja Velka
00050000-553a-30e4-5dd1-c21853fd3d6f	4247	Zgornje Gorje
00050000-553a-30e4-17a3-0d95e3ccee72	4206	Zgornje Jezersko
00050000-553a-30e4-7eb1-858bdc998334	2285	Zgornji Leskovec
00050000-553a-30e4-63eb-aadf44ce50ed	1432	Zidani Most
00050000-553a-30e4-3384-de97d748bab9	3214	Zreče
00050000-553a-30e4-e0b2-6949a37798b1	4209	Žabnica
00050000-553a-30e4-abed-3be075dc3f3e	3310	Žalec
00050000-553a-30e4-d46c-2325095e95d0	4228	Železniki
00050000-553a-30e4-6be9-6beb25e169b6	2287	Žetale
00050000-553a-30e4-d871-b6cbcba8a51c	4226	Žiri
00050000-553a-30e4-4cb9-dfa0a33fca60	4274	Žirovnica
00050000-553a-30e4-3ca8-3a8a350b6019	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 1301675)
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
-- TOC entry 2642 (class 0 OID 1301498)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1301564)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1301687)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1301792)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1301836)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1301716)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1301660)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1301650)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1301826)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1301782)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 1301364)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-553a-30e6-d3ba-f37771d19e89	00010000-553a-30e6-ccd6-43e8618e727e	2015-04-24 14:02:47	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO8udaprkC89JbjBTJJNCQHQvs.DgsRUG";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 1301725)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1301402)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-553a-30e6-dd77-d79b5fe29075	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-553a-30e6-cf9a-e12b37179d2a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-553a-30e6-f376-2224e8ef466b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-553a-30e6-181b-fe87d9bc678b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-553a-30e6-7d5c-6136ae439767	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-553a-30e6-224e-dccd479b3234	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 1301386)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-553a-30e6-d3ba-f37771d19e89	00000000-553a-30e6-181b-fe87d9bc678b
00010000-553a-30e6-ccd6-43e8618e727e	00000000-553a-30e6-181b-fe87d9bc678b
\.


--
-- TOC entry 2668 (class 0 OID 1301739)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 1301681)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1301631)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 1301463)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1301637)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1301817)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1301533)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1301373)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-553a-30e6-ccd6-43e8618e727e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROlOF/av/gUW3C9lm7uZGoP6QUf8J3AIa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-553a-30e6-d3ba-f37771d19e89	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 1301867)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1301579)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 1301708)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1301774)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1301607)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1301857)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 1301764)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 1301427)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 1301906)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 1301899)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 1301816)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 1301597)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 1301630)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 1301559)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 1301760)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 1301577)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 1301624)
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
-- TOC entry 2365 (class 2606 OID 1301673)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 1301700)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 1301531)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 1301436)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 1301495)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 1301461)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 1301416)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 1301401)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 1301706)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 1301738)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 1301853)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 1301488)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 1301519)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 1301679)
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
-- TOC entry 2299 (class 2606 OID 1301509)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 1301568)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 1301691)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 1301798)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 1301841)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 1301723)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 1301664)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 1301655)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 1301835)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 1301789)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 1301372)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 1301729)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 1301390)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 1301410)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 1301747)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 1301686)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 1301636)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 1301468)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 1301646)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 1301825)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 1301544)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 1301385)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 1301881)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 1301583)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 1301714)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 1301780)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 1301619)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 1301866)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 1301773)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 1301604)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 1301490)
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
-- TOC entry 2378 (class 1259 OID 1301707)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 1301693)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 1301692)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 1301584)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 1301763)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 1301761)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 1301762)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 1301854)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 1301855)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 1301856)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 1301884)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 1301883)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 1301882)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 1301546)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 1301545)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 1301497)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 1301496)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 1301730)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 1301625)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 1301417)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 1301418)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 1301750)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 1301749)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 1301748)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 1301569)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 1301571)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 1301570)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 1301659)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 1301657)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 1301656)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 1301658)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 1301391)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 1301392)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 1301715)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 1301680)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 1301790)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 1301791)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 1301511)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 1301510)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 1301512)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 1301799)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 1301800)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 1301909)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 1301908)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 1301911)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 1301907)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 1301910)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 1301781)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 1301668)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 1301667)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 1301665)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 1301666)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 1301901)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 1301900)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 1301578)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 1301438)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 1301437)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 1301469)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 1301470)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 1301649)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 1301648)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 1301647)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 1301606)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 1301602)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 1301599)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 1301600)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 1301598)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 1301603)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 1301601)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 1301489)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 1301560)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1301562)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 1301561)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 1301563)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 1301674)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 1301462)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 1301532)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2386 (class 1259 OID 1301724)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 1301520)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 1301842)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 1301411)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 1301605)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 1302042)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 1302027)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 1302032)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 1302052)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 1302022)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 1302047)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 1302037)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 1301957)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 1302137)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 1302132)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 1302127)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 1302017)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 1302177)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 1302167)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1302172)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 1302117)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 1302212)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 1302217)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 1302222)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 1302237)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 1302232)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 1302227)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 1301992)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 1301987)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 1301967)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 1301962)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 1301942)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 1302147)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 1302057)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 1301922)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 1301927)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 1302162)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 1302157)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 1302152)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 1301997)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 1302007)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 1302002)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 1302092)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 1302082)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 1302077)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 1302087)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 1301912)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 1301917)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 1302142)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 1302122)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 1302187)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 1302192)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 1301977)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 1301972)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 1301982)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 1302197)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 1302202)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 1302262)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 1302257)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 1302272)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 1302252)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 1302267)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 1302182)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 1302112)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 1302107)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 1302097)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 1302102)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 1302247)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 1302242)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 1302012)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1302207)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 1301937)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 1301932)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 1301947)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 1301952)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 1302072)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 1302067)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 1302062)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-24 14:02:47 CEST

--
-- PostgreSQL database dump complete
--

