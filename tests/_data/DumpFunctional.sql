--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-19 13:45:32 CEST

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
-- TOC entry 179 (class 1259 OID 3917913)
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
-- TOC entry 225 (class 1259 OID 3918396)
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
-- TOC entry 224 (class 1259 OID 3918379)
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
-- TOC entry 217 (class 1259 OID 3918290)
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
-- TOC entry 193 (class 1259 OID 3918081)
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
-- TOC entry 196 (class 1259 OID 3918115)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3918040)
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
-- TOC entry 212 (class 1259 OID 3918240)
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
-- TOC entry 191 (class 1259 OID 3918065)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3918109)
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
-- TOC entry 201 (class 1259 OID 3918158)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3918183)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3918014)
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
-- TOC entry 180 (class 1259 OID 3917922)
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
-- TOC entry 181 (class 1259 OID 3917933)
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
-- TOC entry 184 (class 1259 OID 3917984)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3917887)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3917906)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3918190)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3918220)
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
-- TOC entry 221 (class 1259 OID 3918335)
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
-- TOC entry 183 (class 1259 OID 3917964)
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
-- TOC entry 186 (class 1259 OID 3918006)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3918164)
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
-- TOC entry 185 (class 1259 OID 3917991)
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
-- TOC entry 190 (class 1259 OID 3918057)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3918176)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3918281)
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
-- TOC entry 220 (class 1259 OID 3918328)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3918205)
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
-- TOC entry 200 (class 1259 OID 3918149)
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
-- TOC entry 199 (class 1259 OID 3918139)
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
-- TOC entry 219 (class 1259 OID 3918318)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3918271)
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
-- TOC entry 173 (class 1259 OID 3917858)
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
-- TOC entry 172 (class 1259 OID 3917856)
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
-- TOC entry 209 (class 1259 OID 3918214)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3917896)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3917880)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3918228)
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
-- TOC entry 203 (class 1259 OID 3918170)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3918120)
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
-- TOC entry 182 (class 1259 OID 3917956)
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
-- TOC entry 198 (class 1259 OID 3918126)
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
-- TOC entry 218 (class 1259 OID 3918306)
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
-- TOC entry 188 (class 1259 OID 3918026)
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
-- TOC entry 174 (class 1259 OID 3917867)
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
-- TOC entry 223 (class 1259 OID 3918360)
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
-- TOC entry 192 (class 1259 OID 3918072)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 3918197)
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
-- TOC entry 214 (class 1259 OID 3918263)
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
-- TOC entry 194 (class 1259 OID 3918104)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 3918350)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3918253)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3917861)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 3917913)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3918396)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3918379)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3918290)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3918081)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3918115)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3918040)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555b-225b-ea84-7bcc0e3be986	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555b-225b-5041-bc1ce66651b2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555b-225b-fd95-f79faeb4adb7	AL	ALB	008	Albania 	Albanija	\N
00040000-555b-225b-d7ff-594cdda22c1a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555b-225b-0600-d555048e5890	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555b-225b-124e-0f5f92a066e3	AD	AND	020	Andorra 	Andora	\N
00040000-555b-225b-5256-9c7991d6f9c5	AO	AGO	024	Angola 	Angola	\N
00040000-555b-225b-3198-fcb460dffabb	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555b-225b-16b4-aba0181711a8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555b-225b-751a-3e0b2b1dd80c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555b-225b-6929-8a55e7360c48	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555b-225b-57eb-fca3a43e865d	AM	ARM	051	Armenia 	Armenija	\N
00040000-555b-225b-61f7-09f74c8532cd	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555b-225b-68b6-ce9602c8ade6	AU	AUS	036	Australia 	Avstralija	\N
00040000-555b-225b-3dd6-4ea4564c71aa	AT	AUT	040	Austria 	Avstrija	\N
00040000-555b-225b-1fce-bf81b9d2246b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555b-225b-4d31-5ed1c4c1a0c1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555b-225b-a52d-42a3ce7cd685	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555b-225b-d02e-ff0d2bd7d66a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555b-225b-39ef-b7a2b311ef4c	BB	BRB	052	Barbados 	Barbados	\N
00040000-555b-225b-1c57-25c939f205b9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555b-225b-f689-0df9bf2b3a23	BE	BEL	056	Belgium 	Belgija	\N
00040000-555b-225b-ae0b-add313c889a0	BZ	BLZ	084	Belize 	Belize	\N
00040000-555b-225b-32b4-9dbcdc6631f7	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555b-225b-d9b9-78302f09be93	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555b-225b-03bd-3adcef642163	BT	BTN	064	Bhutan 	Butan	\N
00040000-555b-225b-8e8b-6487e037d2df	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555b-225b-1b56-5ffd1391c469	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555b-225b-6258-a26194e4c129	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555b-225b-7b61-7a37631b8f11	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555b-225b-1d76-0d32c656aecd	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555b-225b-16b5-25a43e470cf0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555b-225b-f267-a47830b4e243	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555b-225b-7ed3-feb91bdcd6bd	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555b-225b-3c9c-5b1b00186810	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555b-225b-1e24-e6b085b32641	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555b-225b-3d44-e1fadc0caae0	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555b-225b-cbdc-48376f03acd6	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555b-225b-5ae7-7c66a4ff3c4d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555b-225b-b80c-020d2e337b54	CA	CAN	124	Canada 	Kanada	\N
00040000-555b-225b-5fce-bed7f37a4e5c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555b-225b-f407-bf4ab9464963	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555b-225b-d1b1-95e78f3e9d11	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555b-225b-2135-458e2b8e2b4d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555b-225b-780d-12bda76e022b	CL	CHL	152	Chile 	Čile	\N
00040000-555b-225b-628e-74d58e7a31b7	CN	CHN	156	China 	Kitajska	\N
00040000-555b-225b-4997-9ec419c0a68e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555b-225b-a84f-1212bf652da5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555b-225b-b66c-81e6f94131f6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555b-225b-3dee-5e14243feeb7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555b-225b-ed69-faeb7281f591	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555b-225b-3361-b0b1780a92d3	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555b-225b-d422-4f495d627569	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555b-225c-e071-e4a81404458b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555b-225c-02a7-0e5a8a339832	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555b-225c-793d-1062bb17a07a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555b-225c-dfec-f1fc2994ff38	CU	CUB	192	Cuba 	Kuba	\N
00040000-555b-225c-1ebc-e56a851d852c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555b-225c-9b5b-e1f1edb5d7d8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555b-225c-20bd-ac99e3374b04	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555b-225c-2f7e-e450e632e406	DK	DNK	208	Denmark 	Danska	\N
00040000-555b-225c-3e57-15a2dbf85876	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555b-225c-b1e7-f04cc45a6604	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555b-225c-4475-a82458f8c456	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555b-225c-2749-40d5ae893e5e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555b-225c-40e0-fb6c18e3c874	EG	EGY	818	Egypt 	Egipt	\N
00040000-555b-225c-764c-3cfe40f28482	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555b-225c-3d79-a964e423d9d5	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555b-225c-c108-2a06193a9113	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555b-225c-bd49-2d35903f7d1d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555b-225c-2bb9-0f173124d0bf	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555b-225c-1e34-e2d9a4189f6b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555b-225c-a33b-c60b17e9e9dd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555b-225c-1943-0cf31b9471a1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555b-225c-f39d-f34b9414f968	FI	FIN	246	Finland 	Finska	\N
00040000-555b-225c-e386-ba8b5e5d2852	FR	FRA	250	France 	Francija	\N
00040000-555b-225c-cef5-27e8da0a7242	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555b-225c-080b-5ff25b73186d	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555b-225c-ffe5-fbc193da5bd3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555b-225c-62a4-059172ab4d85	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555b-225c-ec2d-7c5da58c68df	GA	GAB	266	Gabon 	Gabon	\N
00040000-555b-225c-754b-67bb40e6ffed	GM	GMB	270	Gambia 	Gambija	\N
00040000-555b-225c-fa7d-334b861808bb	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555b-225c-87ed-7bc4a3826419	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555b-225c-48ce-8bace143a0fa	GH	GHA	288	Ghana 	Gana	\N
00040000-555b-225c-4233-e143858867cd	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555b-225c-21e0-d9d24adcc739	GR	GRC	300	Greece 	Grčija	\N
00040000-555b-225c-a3a1-05940441cd6c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555b-225c-2bcd-341c7f663aaf	GD	GRD	308	Grenada 	Grenada	\N
00040000-555b-225c-5eb7-b0addc4699f0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555b-225c-8691-ed93bbcc7620	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555b-225c-fdcf-983d88defd49	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555b-225c-d716-377a9d4c4da6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555b-225c-e975-ed1f0269f756	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555b-225c-717c-e41c9009baef	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555b-225c-4e37-83b4e1fbed17	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555b-225c-12a4-39cf210e757a	HT	HTI	332	Haiti 	Haiti	\N
00040000-555b-225c-8e73-b4afe7033a5b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555b-225c-c93a-f3f345103c13	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555b-225c-6e29-8ca08dc163d6	HN	HND	340	Honduras 	Honduras	\N
00040000-555b-225c-c65f-a9f58ba15985	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555b-225c-05e9-6e7650b3bb4e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555b-225c-f3e1-1cd5d3d7ad92	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555b-225c-f73f-5dbbdc35969d	IN	IND	356	India 	Indija	\N
00040000-555b-225c-5271-9580d3c8e6d1	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555b-225c-779e-b4ee9b2b9a53	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555b-225c-aaad-fdd3d4dc5747	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555b-225c-de25-00f36c1a961a	IE	IRL	372	Ireland 	Irska	\N
00040000-555b-225c-a85e-afc72b479a7a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555b-225c-2015-2de0078b1aa9	IL	ISR	376	Israel 	Izrael	\N
00040000-555b-225c-2df5-c4ce5cbfb009	IT	ITA	380	Italy 	Italija	\N
00040000-555b-225c-080f-1c25d1d1fb37	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555b-225c-36db-06352347c09b	JP	JPN	392	Japan 	Japonska	\N
00040000-555b-225c-956c-2afe6ba1a89e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555b-225c-2369-cdd7c20e25ef	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555b-225c-3f30-32c69043640e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555b-225c-585c-9543d78d0eb8	KE	KEN	404	Kenya 	Kenija	\N
00040000-555b-225c-9f14-105366ef4e01	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555b-225c-aaac-2ca1cc3f259b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555b-225c-c06b-b22ca39bc2a5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555b-225c-84ef-6c5d8344a390	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555b-225c-d120-216e7dd60b3b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555b-225c-ac38-62196a487a90	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555b-225c-c23f-a375fbb92cbb	LV	LVA	428	Latvia 	Latvija	\N
00040000-555b-225c-0b1b-ac0d2b2fd221	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555b-225c-9eb7-f502d21e89cb	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555b-225c-dc7e-0499d425bf26	LR	LBR	430	Liberia 	Liberija	\N
00040000-555b-225c-5b93-31d0f59ba29a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555b-225c-8ce5-472cdf3a4eab	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555b-225c-90af-82b5acc10d9b	LT	LTU	440	Lithuania 	Litva	\N
00040000-555b-225c-dac9-4fd81b329fe4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555b-225c-ac82-3df6b33879c4	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555b-225c-d015-b28d84f099ff	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555b-225c-8180-2f484e9f1115	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555b-225c-4905-93851595c84f	MW	MWI	454	Malawi 	Malavi	\N
00040000-555b-225c-e65f-270b8d8c76dc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555b-225c-ca06-29abcd6a92ec	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555b-225c-47a3-fd9a62db813c	ML	MLI	466	Mali 	Mali	\N
00040000-555b-225c-3d5e-2889f6712a74	MT	MLT	470	Malta 	Malta	\N
00040000-555b-225c-5942-8a6a69d01645	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555b-225c-ef29-32fd7394e4e9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555b-225c-0062-d7775301fc3f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555b-225c-a0ac-0182133ba974	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555b-225c-7e32-300af0888fbb	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555b-225c-7857-e73c63ca6ec2	MX	MEX	484	Mexico 	Mehika	\N
00040000-555b-225c-ad7c-d0b5dff69073	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555b-225c-fc8f-ddf55414347f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555b-225c-f9d8-1055a8b07115	MC	MCO	492	Monaco 	Monako	\N
00040000-555b-225c-5677-ec4cc0322def	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555b-225c-4e0b-ec0c4571dbef	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555b-225c-a8af-f6d9ad8032f3	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555b-225c-0d96-9a053c1f8e01	MA	MAR	504	Morocco 	Maroko	\N
00040000-555b-225c-a69c-5c29504c00a9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555b-225c-101f-41e795ec9ee0	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555b-225c-91a0-4576b91efd4a	NA	NAM	516	Namibia 	Namibija	\N
00040000-555b-225c-463d-2cb5bac49cc6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555b-225c-2fa6-3dbfdf36dd2c	NP	NPL	524	Nepal 	Nepal	\N
00040000-555b-225c-4e11-d1baa6a09d57	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555b-225c-ec0d-909bfb987097	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555b-225c-732b-3a54ddaec703	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555b-225c-1d6a-997c9807dd4d	NE	NER	562	Niger 	Niger 	\N
00040000-555b-225c-fb34-d59d68bad575	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555b-225c-5941-b61540b8eb27	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555b-225c-4737-903822619538	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555b-225c-ac58-74304186c651	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555b-225c-5792-21ca6b4a5a66	NO	NOR	578	Norway 	Norveška	\N
00040000-555b-225c-0fe8-4e898833fdeb	OM	OMN	512	Oman 	Oman	\N
00040000-555b-225c-defe-aa5e095c7246	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555b-225c-87f6-1ba664302f74	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555b-225c-79db-1fbb3d311127	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555b-225c-6c76-78f5d4f5b893	PA	PAN	591	Panama 	Panama	\N
00040000-555b-225c-bcd5-a1a4dd7c3f2e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555b-225c-a1b1-a50cc7c5c206	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555b-225c-7b0a-d3e62c5d9463	PE	PER	604	Peru 	Peru	\N
00040000-555b-225c-6f4d-63045e2fc4da	PH	PHL	608	Philippines 	Filipini	\N
00040000-555b-225c-a580-4bf715cd96e4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555b-225c-7c27-e004561a2f6b	PL	POL	616	Poland 	Poljska	\N
00040000-555b-225c-7c36-8957bd99808d	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555b-225c-5777-880c97adb7bc	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555b-225c-bfc2-a8adcd52843a	QA	QAT	634	Qatar 	Katar	\N
00040000-555b-225c-b01a-280fefe5f17b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555b-225c-7131-8b23cd5e3b8e	RO	ROU	642	Romania 	Romunija	\N
00040000-555b-225c-1ee1-eb88ef3c3556	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555b-225c-14ad-7b48d51f3b6f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555b-225c-2415-585e9af68800	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555b-225c-fdf7-0976b7bbf323	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555b-225c-c244-deb7ee2e17db	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555b-225c-0c59-84b47bd00b78	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555b-225c-8757-56beeee9559f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555b-225c-4fa9-3649ddd08173	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555b-225c-e9ae-43fe23badcdd	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555b-225c-d245-e6d8e540dba9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555b-225c-9ad3-231d1da4cd12	SM	SMR	674	San Marino 	San Marino	\N
00040000-555b-225c-d004-3a4fb48c0e17	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555b-225c-2b1b-13791d238c8f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555b-225c-809a-bfa31182a011	SN	SEN	686	Senegal 	Senegal	\N
00040000-555b-225c-73ba-4d4e8c060ef9	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555b-225c-bc53-aef16c61b142	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555b-225c-db3d-ad56d51f3bdd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555b-225c-d2b4-913e72354445	SG	SGP	702	Singapore 	Singapur	\N
00040000-555b-225c-345c-5d2027e8b6fc	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555b-225c-8359-f066f2656cd4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555b-225c-937b-534c3c832451	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555b-225c-c9ff-45aafcd33f8e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555b-225c-16e9-b34f707a38b0	SO	SOM	706	Somalia 	Somalija	\N
00040000-555b-225c-ebb4-f817791f4330	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555b-225c-4f6f-197f62d3360a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555b-225c-59e9-45dbd5b8c4bc	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555b-225c-4597-ee8f3d00f812	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555b-225c-99b4-392f0ae1c7f7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555b-225c-e9e6-53b2438960a6	SD	SDN	729	Sudan 	Sudan	\N
00040000-555b-225c-4e1c-8a92ba977047	SR	SUR	740	Suriname 	Surinam	\N
00040000-555b-225c-2f71-484bc713e0c9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555b-225c-044a-8d88dcdafa19	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555b-225c-a5b3-e294b11c6265	SE	SWE	752	Sweden 	Švedska	\N
00040000-555b-225c-198c-269ad869399e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555b-225c-59a7-d80312fecbff	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555b-225c-641e-d28ccffbd238	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555b-225c-1a12-1e7da1db2e2d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555b-225c-c73b-6cec2f9bdfe5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555b-225c-09f7-46512986570f	TH	THA	764	Thailand 	Tajska	\N
00040000-555b-225c-cbca-71933b3ea0dc	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555b-225c-0ae6-aa0933a39b3b	TG	TGO	768	Togo 	Togo	\N
00040000-555b-225c-d33a-3b33a7ed8a04	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555b-225c-b3e0-7ecf8c69556f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555b-225c-1006-2ba8a78eab66	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555b-225c-1518-f0e8dbfc8232	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555b-225c-5b3a-eb5b5ee18788	TR	TUR	792	Turkey 	Turčija	\N
00040000-555b-225c-b441-b5f176ecb719	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555b-225c-3e4d-1905ab92e547	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555b-225c-897d-ceba5aa31edc	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555b-225c-3928-a185707e50f9	UG	UGA	800	Uganda 	Uganda	\N
00040000-555b-225c-b26a-68778af8c5a2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555b-225c-7d34-75c15ff79b9e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555b-225c-65de-e72cb64bd68b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555b-225c-3411-be34e86a7911	US	USA	840	United States 	Združene države Amerike	\N
00040000-555b-225c-6e74-35fd864698e4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555b-225c-29b4-7c97dde46516	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555b-225c-22cd-a446aea5df5a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555b-225c-b3c1-fb15f3ff7f6a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555b-225c-1c6c-4c6f044b16b9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555b-225c-e548-99e572607934	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555b-225c-a66e-521bf9798854	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555b-225c-6269-14598d905763	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555b-225c-bfa2-c3580ebe0522	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555b-225c-e527-dac722e06320	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555b-225c-b967-81b8e51d73b3	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555b-225c-9b95-318b34058450	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555b-225c-8d0b-d333695e626c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 3918240)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3918065)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3918109)
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
-- TOC entry 2658 (class 0 OID 3918158)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3918183)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3918014)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555b-225c-1ff0-6e90c09e9672	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555b-225c-e91f-24ba6596fe65	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555b-225c-7bfd-01b93cee0414	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555b-225c-daae-3f6c05daf595	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555b-225c-4595-d561bbe736ed	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555b-225c-31bb-2177270bfe2c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555b-225c-1594-795190a18fbc	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555b-225c-7a09-2513f7193f6f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555b-225c-3221-fc437e5fc3a9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555b-225c-592e-81799847ffb3	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 3917922)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555b-225c-3bb7-9e0a2d815dec	00000000-555b-225c-4595-d561bbe736ed	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555b-225c-aad7-541df05174d3	00000000-555b-225c-4595-d561bbe736ed	00010000-555b-225c-fa6f-bfb9b5f31dbd	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555b-225c-a020-02845797aab1	00000000-555b-225c-31bb-2177270bfe2c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 3917933)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3917984)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 3917887)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555b-225c-8adf-6662123f3a85	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555b-225c-31c1-28f3f8247749	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555b-225c-a1a8-79ee85f39843	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555b-225c-fad2-c3c9dcab2335	Abonma-read	Abonma - branje	f
00030000-555b-225c-3eaf-8433bade65f0	Abonma-write	Abonma - spreminjanje	f
00030000-555b-225c-4b8a-03980242e296	Alternacija-read	Alternacija - branje	f
00030000-555b-225c-83ec-fd2e8c6ce85f	Alternacija-write	Alternacija - spreminjanje	f
00030000-555b-225c-fee7-5f1a6672e665	Arhivalija-read	Arhivalija - branje	f
00030000-555b-225c-1543-372e99875f08	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555b-225c-4fe7-bff5afc844a9	Besedilo-read	Besedilo - branje	f
00030000-555b-225c-4b65-a6844ac7d224	Besedilo-write	Besedilo - spreminjanje	f
00030000-555b-225c-7a53-464038727718	DogodekIzven-read	DogodekIzven - branje	f
00030000-555b-225c-a2d0-4baa34d447b9	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555b-225c-9b10-c36a15865807	Dogodek-read	Dogodek - branje	f
00030000-555b-225c-ecec-31eaa4c0cb0d	Dogodek-write	Dogodek - spreminjanje	f
00030000-555b-225c-745a-e521de63a4dd	Drzava-read	Drzava - branje	f
00030000-555b-225c-3755-b71324d4de75	Drzava-write	Drzava - spreminjanje	f
00030000-555b-225c-cb6e-e2f682bc3da2	Funkcija-read	Funkcija - branje	f
00030000-555b-225c-b784-47d5575a937b	Funkcija-write	Funkcija - spreminjanje	f
00030000-555b-225c-115e-daacd5692ad8	Gostovanje-read	Gostovanje - branje	f
00030000-555b-225c-30c5-c47555ccd161	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555b-225c-bcb7-c82eb040f978	Gostujoca-read	Gostujoca - branje	f
00030000-555b-225c-9f26-5ed935b3e26b	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555b-225c-d7a1-743b89022f84	Kupec-read	Kupec - branje	f
00030000-555b-225c-9201-1ac03d3fb344	Kupec-write	Kupec - spreminjanje	f
00030000-555b-225c-4e47-18061cd8effc	NacinPlacina-read	NacinPlacina - branje	f
00030000-555b-225c-153d-417fd752ee65	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555b-225c-d615-c32e36b77566	Option-read	Option - branje	f
00030000-555b-225c-d97b-0a8816ab94a3	Option-write	Option - spreminjanje	f
00030000-555b-225c-0fd8-c8f1e2e187c4	OptionValue-read	OptionValue - branje	f
00030000-555b-225c-16c6-68b2ef8588ef	OptionValue-write	OptionValue - spreminjanje	f
00030000-555b-225c-f51f-670aa97bb9ed	Oseba-read	Oseba - branje	f
00030000-555b-225c-1b92-87a1b7369a51	Oseba-write	Oseba - spreminjanje	f
00030000-555b-225c-267e-a4b861f6b8ef	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555b-225c-96fc-bd3cba2b500e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555b-225c-5507-19d66a02e7b7	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555b-225c-5e8e-81978196edf9	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555b-225c-0099-910dfc38f70f	Pogodba-read	Pogodba - branje	f
00030000-555b-225c-ec3c-0b21ca81a062	Pogodba-write	Pogodba - spreminjanje	f
00030000-555b-225c-1e75-347dbd6969ad	Popa-read	Popa - branje	f
00030000-555b-225c-6386-7e695c900c4e	Popa-write	Popa - spreminjanje	f
00030000-555b-225c-a9aa-73a083feaf22	Posta-read	Posta - branje	f
00030000-555b-225c-5ab3-6187643c33de	Posta-write	Posta - spreminjanje	f
00030000-555b-225c-e2a9-ad45722b56c0	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555b-225c-8e2b-93e27a423526	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555b-225c-8de0-ae4f039308ed	PostniNaslov-read	PostniNaslov - branje	f
00030000-555b-225c-9b4e-facdf2829384	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555b-225c-1373-a0684ed11567	Predstava-read	Predstava - branje	f
00030000-555b-225c-24e4-a2d8db5d029c	Predstava-write	Predstava - spreminjanje	f
00030000-555b-225c-8963-36e4fc2d8556	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555b-225c-41c6-d98fd9aebd4b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555b-225c-44ea-43279357594e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555b-225c-7239-3f02db565210	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555b-225c-b907-fa1838bddbeb	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555b-225c-dd44-27c3ffffa300	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555b-225c-18de-3cd827a064a8	Prostor-read	Prostor - branje	f
00030000-555b-225c-58ab-5dda7fa263df	Prostor-write	Prostor - spreminjanje	f
00030000-555b-225c-55b8-3f2b3b70e2e9	Racun-read	Racun - branje	f
00030000-555b-225c-30bf-4b5ab919c063	Racun-write	Racun - spreminjanje	f
00030000-555b-225c-42a5-339e0c66f5da	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555b-225c-040c-568902b80a4b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555b-225c-14ad-75bd5fc327b0	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555b-225c-67da-4e9293f44da5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555b-225c-21f1-60129b2c98d4	Rekvizit-read	Rekvizit - branje	f
00030000-555b-225c-afde-b305aa1705e5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555b-225c-e75c-0f3035b4c1af	Rezervacija-read	Rezervacija - branje	f
00030000-555b-225c-dfde-fe037a615c9a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555b-225c-df20-4b61ba978f58	SedezniRed-read	SedezniRed - branje	f
00030000-555b-225c-73e6-22cfe2e893c0	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555b-225c-7e65-51186ce05610	Sedez-read	Sedez - branje	f
00030000-555b-225c-5015-caf067fefa41	Sedez-write	Sedez - spreminjanje	f
00030000-555b-225c-9ba5-b46a3c3a5f5f	Sezona-read	Sezona - branje	f
00030000-555b-225c-fcb6-09639c333d2e	Sezona-write	Sezona - spreminjanje	f
00030000-555b-225c-83e9-c2a4b87bfc5c	Telefonska-read	Telefonska - branje	f
00030000-555b-225c-6d98-19269edfd3b2	Telefonska-write	Telefonska - spreminjanje	f
00030000-555b-225c-3a55-494ef0b8d8d8	TerminStoritve-read	TerminStoritve - branje	f
00030000-555b-225c-630e-ccee43bd7537	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555b-225c-ad4c-d33b6e7b3a10	TipFunkcije-read	TipFunkcije - branje	f
00030000-555b-225c-55d6-dc8c96547d89	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555b-225c-3845-6fac01e654da	Trr-read	Trr - branje	f
00030000-555b-225c-ecaf-e70c896d1950	Trr-write	Trr - spreminjanje	f
00030000-555b-225c-2c5f-7263f990b679	Uprizoritev-read	Uprizoritev - branje	f
00030000-555b-225c-5630-e646abff42b2	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555b-225c-d108-6ac18bfeb2b1	Vaja-read	Vaja - branje	f
00030000-555b-225c-059d-3566c2b43cb5	Vaja-write	Vaja - spreminjanje	f
00030000-555b-225c-05d0-548fd58b8aa6	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555b-225c-1182-8e789f40a7e9	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555b-225c-3d46-7395f1d072d2	Zaposlitev-read	Zaposlitev - branje	f
00030000-555b-225c-cd46-d5a61bdf7ffa	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555b-225c-9b9a-6edbebbfb63f	Zasedenost-read	Zasedenost - branje	f
00030000-555b-225c-f786-d29e1894a6b9	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555b-225c-db55-d63f1a2c7f60	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555b-225c-dcd8-14439bb007b4	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555b-225c-6c12-f7a9e73a591e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555b-225c-cb85-d56fa631388c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 3917906)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555b-225c-9bb9-3c64d813c170	00030000-555b-225c-745a-e521de63a4dd
00020000-555b-225c-28bb-de0d04ab62cc	00030000-555b-225c-3755-b71324d4de75
00020000-555b-225c-28bb-de0d04ab62cc	00030000-555b-225c-745a-e521de63a4dd
\.


--
-- TOC entry 2663 (class 0 OID 3918190)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3918220)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3918335)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3917964)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3918006)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555b-225b-819e-cdb7d3058213	8341	Adlešiči
00050000-555b-225b-151f-3659bfab343c	5270	Ajdovščina
00050000-555b-225b-1e29-217784a1c067	6280	Ankaran/Ancarano
00050000-555b-225b-342e-2e1586406a86	9253	Apače
00050000-555b-225b-00a5-3f8ec7ac22d7	8253	Artiče
00050000-555b-225b-0f5a-72a660bd30ed	4275	Begunje na Gorenjskem
00050000-555b-225b-399b-b5dea92b3049	1382	Begunje pri Cerknici
00050000-555b-225b-a4f1-0ae90006e2f4	9231	Beltinci
00050000-555b-225b-54bc-17bf4d1c6c65	2234	Benedikt
00050000-555b-225b-b51d-b98362df3a1a	2345	Bistrica ob Dravi
00050000-555b-225b-3760-6c1dbc9c3f08	3256	Bistrica ob Sotli
00050000-555b-225b-b361-ae5690af3e8d	8259	Bizeljsko
00050000-555b-225b-f643-5e24f739c323	1223	Blagovica
00050000-555b-225b-5c90-833a606ddc51	8283	Blanca
00050000-555b-225b-d62c-02279f93b7c9	4260	Bled
00050000-555b-225b-1715-88dcc5463e80	4273	Blejska Dobrava
00050000-555b-225b-8327-408aaf2fd258	9265	Bodonci
00050000-555b-225b-14bf-ca2391218ecf	9222	Bogojina
00050000-555b-225b-d142-ea30da6620c8	4263	Bohinjska Bela
00050000-555b-225b-a7af-2646952b6bc1	4264	Bohinjska Bistrica
00050000-555b-225b-8fea-f6390af5bc51	4265	Bohinjsko jezero
00050000-555b-225b-cbe5-f199ae82dd8d	1353	Borovnica
00050000-555b-225b-0186-117008e88c2e	8294	Boštanj
00050000-555b-225b-3fe5-a18e9849b8c0	5230	Bovec
00050000-555b-225b-1431-e0eebf980d74	5295	Branik
00050000-555b-225b-d998-82cc8cf042d5	3314	Braslovče
00050000-555b-225b-3184-7265896f889a	5223	Breginj
00050000-555b-225b-7b25-b8d640a9e4a6	8280	Brestanica
00050000-555b-225b-fd40-cbdc6dc71aa4	2354	Bresternica
00050000-555b-225b-b62b-aba0cc1eaa7c	4243	Brezje
00050000-555b-225b-2769-4f95f5399b89	1351	Brezovica pri Ljubljani
00050000-555b-225b-6fbb-1442295b7e94	8250	Brežice
00050000-555b-225b-21e2-9f27a6a3a604	4210	Brnik - Aerodrom
00050000-555b-225b-799c-536e4d4f62c6	8321	Brusnice
00050000-555b-225b-4166-6319a1af7c8b	3255	Buče
00050000-555b-225b-d66c-967e1f841ee1	8276	Bučka 
00050000-555b-225b-007c-bb63254165fc	9261	Cankova
00050000-555b-225b-284a-1f9975335c94	3000	Celje 
00050000-555b-225b-e31d-f04dac7c19df	3001	Celje - poštni predali
00050000-555b-225b-f92a-ebc0fa4f6d24	4207	Cerklje na Gorenjskem
00050000-555b-225b-3daf-2ac560b31fbc	8263	Cerklje ob Krki
00050000-555b-225b-fcac-12c52c492202	1380	Cerknica
00050000-555b-225b-69a3-c82832cd4111	5282	Cerkno
00050000-555b-225b-4a7d-d971e54aa658	2236	Cerkvenjak
00050000-555b-225b-8bb4-d06a5799d259	2215	Ceršak
00050000-555b-225b-02c1-9acd4d0008e2	2326	Cirkovce
00050000-555b-225b-b551-e33bc7fae37e	2282	Cirkulane
00050000-555b-225b-ccd7-6e8fdd6b876d	5273	Col
00050000-555b-225b-ecb5-f245d6e1a8de	8251	Čatež ob Savi
00050000-555b-225b-25bb-8b894750b200	1413	Čemšenik
00050000-555b-225b-1a30-96988b360c94	5253	Čepovan
00050000-555b-225b-16c4-8cfdff4a7a51	9232	Črenšovci
00050000-555b-225b-730b-b458995fd63e	2393	Črna na Koroškem
00050000-555b-225b-8639-bafffd1453d5	6275	Črni Kal
00050000-555b-225b-708e-85377a7eade8	5274	Črni Vrh nad Idrijo
00050000-555b-225b-c310-c916a4987ab9	5262	Črniče
00050000-555b-225b-9433-4ffb6bbdb6fc	8340	Črnomelj
00050000-555b-225b-a0bf-2e85beebded8	6271	Dekani
00050000-555b-225b-2c95-8881717e3cef	5210	Deskle
00050000-555b-225b-b62b-869d6013f04e	2253	Destrnik
00050000-555b-225b-5de0-616da44c8e39	6215	Divača
00050000-555b-225b-c0f7-22cca667fe68	1233	Dob
00050000-555b-225b-cc8c-fdd484ef02b3	3224	Dobje pri Planini
00050000-555b-225b-40e1-59e1fed4d7d9	8257	Dobova
00050000-555b-225b-f31c-e49d61b7730b	1423	Dobovec
00050000-555b-225b-5b8b-6c827bcc4ac9	5263	Dobravlje
00050000-555b-225b-cf98-fdf27417ed2d	3204	Dobrna
00050000-555b-225b-eb65-952ce51ff402	8211	Dobrnič
00050000-555b-225b-3451-279650527f1b	1356	Dobrova
00050000-555b-225b-5524-6edb3750c8b2	9223	Dobrovnik/Dobronak 
00050000-555b-225b-597e-a66425ae4ae8	5212	Dobrovo v Brdih
00050000-555b-225b-e747-c14e14de9cf2	1431	Dol pri Hrastniku
00050000-555b-225b-e390-1ebd3ec1cb16	1262	Dol pri Ljubljani
00050000-555b-225b-4c31-4fc0743f0386	1273	Dole pri Litiji
00050000-555b-225b-821e-905be6305d99	1331	Dolenja vas
00050000-555b-225b-6522-5c616ebe5bba	8350	Dolenjske Toplice
00050000-555b-225b-d8b1-8cc6cba5df52	1230	Domžale
00050000-555b-225b-9257-c450dba65493	2252	Dornava
00050000-555b-225b-3b67-704eb52c7abc	5294	Dornberk
00050000-555b-225b-0314-d80edc07aea3	1319	Draga
00050000-555b-225b-1caa-ffc0e4425215	8343	Dragatuš
00050000-555b-225b-1b42-48c814c4f2f3	3222	Dramlje
00050000-555b-225b-76ce-d43ef69b648d	2370	Dravograd
00050000-555b-225b-249d-9bcfabbfab76	4203	Duplje
00050000-555b-225b-c096-e78853d38001	6221	Dutovlje
00050000-555b-225b-024f-1dcc2c9b060f	8361	Dvor
00050000-555b-225b-8449-efed9600d6eb	2343	Fala
00050000-555b-225b-eec3-4a0eb06d9944	9208	Fokovci
00050000-555b-225b-1133-4c08c9b70c92	2313	Fram
00050000-555b-225b-e84c-d912187aab79	3213	Frankolovo
00050000-555b-225b-59c6-ffd1e5365c09	1274	Gabrovka
00050000-555b-225b-fe3a-f5bdd840e241	8254	Globoko
00050000-555b-225b-ee7b-a47399306bb7	5275	Godovič
00050000-555b-225b-1c77-3d1a710297bc	4204	Golnik
00050000-555b-225b-30c5-e604d91d6e20	3303	Gomilsko
00050000-555b-225b-6393-48b65ff27be0	4224	Gorenja vas
00050000-555b-225b-6a73-687ae3678bf2	3263	Gorica pri Slivnici
00050000-555b-225b-a054-8909437b451f	2272	Gorišnica
00050000-555b-225b-4905-c86b08feb526	9250	Gornja Radgona
00050000-555b-225b-2fb7-c62fa830874b	3342	Gornji Grad
00050000-555b-225b-6068-d44e9a4bf937	4282	Gozd Martuljek
00050000-555b-225b-734c-85f0bd3c53ee	6272	Gračišče
00050000-555b-225b-7743-983c0fb449b2	9264	Grad
00050000-555b-225b-38cc-90e023f73b85	8332	Gradac
00050000-555b-225b-bb7d-40a9f6be1c38	1384	Grahovo
00050000-555b-225b-6109-a2c84819f5e9	5242	Grahovo ob Bači
00050000-555b-225b-1ae5-cca86aec6a04	5251	Grgar
00050000-555b-225b-f03d-d90cfe1e2da7	3302	Griže
00050000-555b-225b-ca29-5aad2de391fd	3231	Grobelno
00050000-555b-225b-4948-639928b3f47b	1290	Grosuplje
00050000-555b-225b-a4fc-81242ff402da	2288	Hajdina
00050000-555b-225b-f3c2-bb954ccb7603	8362	Hinje
00050000-555b-225b-a129-d14a7e265319	2311	Hoče
00050000-555b-225b-1ed9-ed75051ad647	9205	Hodoš/Hodos
00050000-555b-225b-970c-80695d1c8fa7	1354	Horjul
00050000-555b-225b-59e8-93b17a214447	1372	Hotedršica
00050000-555b-225b-85fa-93872fc29408	1430	Hrastnik
00050000-555b-225b-e0eb-3637117b9227	6225	Hruševje
00050000-555b-225b-f99b-77210028583d	4276	Hrušica
00050000-555b-225b-1531-acf0aeedbc66	5280	Idrija
00050000-555b-225b-f1e1-bf5bb6fe03e2	1292	Ig
00050000-555b-225b-0256-6498facae1eb	6250	Ilirska Bistrica
00050000-555b-225b-d27a-f7034d77b30e	6251	Ilirska Bistrica-Trnovo
00050000-555b-225b-c7b1-b1f146981572	1295	Ivančna Gorica
00050000-555b-225b-f650-a25d70520207	2259	Ivanjkovci
00050000-555b-225b-6d2f-9ae2c2206bd2	1411	Izlake
00050000-555b-225b-6502-541f83fa0bc2	6310	Izola/Isola
00050000-555b-225b-5056-51bbca0da3b4	2222	Jakobski Dol
00050000-555b-225b-f745-7b6b1592de69	2221	Jarenina
00050000-555b-225b-e8b6-23c256b90033	6254	Jelšane
00050000-555b-225b-8519-cd9d9763dbd3	4270	Jesenice
00050000-555b-225b-8a2e-70dd1e43ab97	8261	Jesenice na Dolenjskem
00050000-555b-225b-b987-33fd8ea3e7ed	3273	Jurklošter
00050000-555b-225b-a69b-bd52adb20a13	2223	Jurovski Dol
00050000-555b-225b-d640-f543a837eb32	2256	Juršinci
00050000-555b-225b-4b8a-559bc494dab9	5214	Kal nad Kanalom
00050000-555b-225b-068b-1480464281be	3233	Kalobje
00050000-555b-225b-70bb-cd9b0b7b013c	4246	Kamna Gorica
00050000-555b-225b-3214-391bb8b7e32b	2351	Kamnica
00050000-555b-225b-d2a0-4c4476aa4a85	1241	Kamnik
00050000-555b-225b-3d75-7cb4b8dfd18c	5213	Kanal
00050000-555b-225b-706b-cb464968fd66	8258	Kapele
00050000-555b-225b-5057-5a069df731e2	2362	Kapla
00050000-555b-225b-a53f-812568a362de	2325	Kidričevo
00050000-555b-225b-0af1-bdc92033a0ce	1412	Kisovec
00050000-555b-225b-347f-c4b0db3a3a7c	6253	Knežak
00050000-555b-225b-29c7-00e1f7eefe90	5222	Kobarid
00050000-555b-225b-9237-002659465b65	9227	Kobilje
00050000-555b-225b-4e1c-1773970e2032	1330	Kočevje
00050000-555b-225b-bf83-046e3e9a8f4a	1338	Kočevska Reka
00050000-555b-225b-735e-373be3695a53	2276	Kog
00050000-555b-225b-d28f-e7e49c516ff1	5211	Kojsko
00050000-555b-225b-50f8-dfb970698a07	6223	Komen
00050000-555b-225b-9a0e-cb3f25960a8c	1218	Komenda
00050000-555b-225b-64ec-cfe34a9f014c	6000	Koper/Capodistria 
00050000-555b-225b-6731-2e275a1d2b94	6001	Koper/Capodistria - poštni predali
00050000-555b-225b-dd87-99bddc00fda8	8282	Koprivnica
00050000-555b-225b-8661-200b8ccc68c3	5296	Kostanjevica na Krasu
00050000-555b-225b-7d2b-f5e2fabdf795	8311	Kostanjevica na Krki
00050000-555b-225b-dc4e-951dc4b95c5b	1336	Kostel
00050000-555b-225b-9137-39d8ef46b464	6256	Košana
00050000-555b-225b-a2cb-2f19b07d19df	2394	Kotlje
00050000-555b-225b-1724-cddb077b21a4	6240	Kozina
00050000-555b-225b-5ec3-c631565913d4	3260	Kozje
00050000-555b-225b-18ca-092284ca36fd	4000	Kranj 
00050000-555b-225b-122f-2fcd811d2526	4001	Kranj - poštni predali
00050000-555b-225b-5f27-6531e4723e2d	4280	Kranjska Gora
00050000-555b-225b-4e9f-d2a3d88f4fa6	1281	Kresnice
00050000-555b-225b-650c-c7c7c69b9b29	4294	Križe
00050000-555b-225b-0e9f-22e0d43c87f6	9206	Križevci
00050000-555b-225b-108f-00c4e809e381	9242	Križevci pri Ljutomeru
00050000-555b-225b-c546-ccd0cfb08f69	1301	Krka
00050000-555b-225b-ac40-d62425363ef3	8296	Krmelj
00050000-555b-225b-ea48-5e64c09f95c7	4245	Kropa
00050000-555b-225b-1827-0f20422a3ea3	8262	Krška vas
00050000-555b-225b-1a28-c1df2fe71f4b	8270	Krško
00050000-555b-225b-80c3-70aa600526a3	9263	Kuzma
00050000-555b-225b-d273-cffba811b8ce	2318	Laporje
00050000-555b-225b-77d9-3a0ac0d6ee46	3270	Laško
00050000-555b-225b-7153-17ae4010e478	1219	Laze v Tuhinju
00050000-555b-225b-b8ae-3101e3ce991a	2230	Lenart v Slovenskih goricah
00050000-555b-225b-f47e-61498f4244ce	9220	Lendava/Lendva
00050000-555b-225b-6e16-8e679075885b	4248	Lesce
00050000-555b-225b-0dd0-1ce1740fbbee	3261	Lesično
00050000-555b-225b-d640-aa02f576e76f	8273	Leskovec pri Krškem
00050000-555b-225b-0e16-6e6103ebbef8	2372	Libeliče
00050000-555b-225b-7030-a6971b840a40	2341	Limbuš
00050000-555b-225b-83f2-fc4ac2b06da2	1270	Litija
00050000-555b-225b-dda8-bdb5e12bf049	3202	Ljubečna
00050000-555b-225b-9fad-76a69c52ceac	1000	Ljubljana 
00050000-555b-225b-c9e8-5736943c59ad	1001	Ljubljana - poštni predali
00050000-555b-225b-8bb9-34a71d341107	1231	Ljubljana - Črnuče
00050000-555b-225b-14b0-a1b184d36d8a	1261	Ljubljana - Dobrunje
00050000-555b-225b-7428-f67a85ac5b56	1260	Ljubljana - Polje
00050000-555b-225b-2846-7ca03768b092	1210	Ljubljana - Šentvid
00050000-555b-225b-1e50-991171ced6d3	1211	Ljubljana - Šmartno
00050000-555b-225b-d96b-341bf78e2362	3333	Ljubno ob Savinji
00050000-555b-225b-366b-5329f69cbe05	9240	Ljutomer
00050000-555b-225b-daa7-dafe48a796ef	3215	Loče
00050000-555b-225b-b1a5-c33c657965da	5231	Log pod Mangartom
00050000-555b-225b-b4f4-3f1ff31a96b7	1358	Log pri Brezovici
00050000-555b-225b-d12e-e39d28102576	1370	Logatec
00050000-555b-225b-e875-22db4d49652b	1371	Logatec
00050000-555b-225b-d243-cc0f9b68bcdd	1434	Loka pri Zidanem Mostu
00050000-555b-225b-e12c-dde0f6a340e9	3223	Loka pri Žusmu
00050000-555b-225b-6195-1b249999fe03	6219	Lokev
00050000-555b-225b-e473-3c9f0ce7f534	1318	Loški Potok
00050000-555b-225b-da8d-4f1853481795	2324	Lovrenc na Dravskem polju
00050000-555b-225b-c94a-2f3e63723b31	2344	Lovrenc na Pohorju
00050000-555b-225b-8619-cc7a48a98d0d	3334	Luče
00050000-555b-225b-b63a-6a8550a499b5	1225	Lukovica
00050000-555b-225b-ec0e-ebac7c73aec8	9202	Mačkovci
00050000-555b-225b-a634-2ff44b934093	2322	Majšperk
00050000-555b-225b-e96e-ddd50faa14f0	2321	Makole
00050000-555b-225b-283f-6c9538cfc4b5	9243	Mala Nedelja
00050000-555b-225b-062d-6ceec06b9425	2229	Malečnik
00050000-555b-225b-cf71-1cdfc5a395b2	6273	Marezige
00050000-555b-225b-4a42-973346a9571f	2000	Maribor 
00050000-555b-225b-8874-5a6ddbf37278	2001	Maribor - poštni predali
00050000-555b-225b-4f39-24301d10c0a0	2206	Marjeta na Dravskem polju
00050000-555b-225b-7bc3-ce3971ca9275	2281	Markovci
00050000-555b-225b-fe01-898908bc88fb	9221	Martjanci
00050000-555b-225b-1877-fb19166249be	6242	Materija
00050000-555b-225b-394f-913c579f1bd3	4211	Mavčiče
00050000-555b-225b-954b-2c698eca9282	1215	Medvode
00050000-555b-225b-adee-5f31a0bb88f0	1234	Mengeš
00050000-555b-225b-20a8-73ae6193b601	8330	Metlika
00050000-555b-225b-4a16-81b078f8083c	2392	Mežica
00050000-555b-225b-874e-9b1098dbde77	2204	Miklavž na Dravskem polju
00050000-555b-225b-f6f1-2848578b5ba8	2275	Miklavž pri Ormožu
00050000-555b-225b-5a6d-f26fa0c61b7b	5291	Miren
00050000-555b-225b-3517-d6535cecb2d4	8233	Mirna
00050000-555b-225b-eadd-d1ea4ceb4bf9	8216	Mirna Peč
00050000-555b-225b-f45a-2799869bad6d	2382	Mislinja
00050000-555b-225b-b93a-317f086b1e67	4281	Mojstrana
00050000-555b-225b-8632-8c9a815be8a6	8230	Mokronog
00050000-555b-225b-620d-deeaea23e225	1251	Moravče
00050000-555b-225b-00fa-cbd5b6283ad4	9226	Moravske Toplice
00050000-555b-225b-4bba-0156a68c4f61	5216	Most na Soči
00050000-555b-225b-4f02-9ce2a8974042	1221	Motnik
00050000-555b-225b-793f-373b97cee8ae	3330	Mozirje
00050000-555b-225b-0e81-82d860c00eb1	9000	Murska Sobota 
00050000-555b-225b-e0a3-d614c1332aef	9001	Murska Sobota - poštni predali
00050000-555b-225b-2df8-d279ee1ecbc4	2366	Muta
00050000-555b-225b-23fe-f492c3f546ce	4202	Naklo
00050000-555b-225b-586f-fe054a01f44e	3331	Nazarje
00050000-555b-225b-d976-203f64eb525e	1357	Notranje Gorice
00050000-555b-225b-63a8-38ae17ad3b49	3203	Nova Cerkev
00050000-555b-225b-d839-bbe3bb057ea2	5000	Nova Gorica 
00050000-555b-225b-6bff-6f96e8e394c8	5001	Nova Gorica - poštni predali
00050000-555b-225b-01ce-a7090b84ad08	1385	Nova vas
00050000-555b-225b-056b-ac429c8eeb6b	8000	Novo mesto
00050000-555b-225b-44f8-f2456814bfb1	8001	Novo mesto - poštni predali
00050000-555b-225b-c18d-353a7de4062a	6243	Obrov
00050000-555b-225b-8d49-c88ac069b331	9233	Odranci
00050000-555b-225b-c93d-6637ec8e5dd8	2317	Oplotnica
00050000-555b-225b-4f40-391bdd927056	2312	Orehova vas
00050000-555b-225b-4491-09860c6285ec	2270	Ormož
00050000-555b-225b-89a9-e9e71cd1058f	1316	Ortnek
00050000-555b-225b-441b-4a88f96a16b0	1337	Osilnica
00050000-555b-225b-b400-324d21082e5d	8222	Otočec
00050000-555b-225b-e0e9-3faa9cddc796	2361	Ožbalt
00050000-555b-225b-a523-7d69d98f6905	2231	Pernica
00050000-555b-225b-7a08-548137fd4b59	2211	Pesnica pri Mariboru
00050000-555b-225b-4b9e-985931273ec8	9203	Petrovci
00050000-555b-225b-d006-496ce87001e7	3301	Petrovče
00050000-555b-225b-d26a-16e92c6e219e	6330	Piran/Pirano
00050000-555b-225b-e7c5-24bc9b073a39	8255	Pišece
00050000-555b-225b-3055-7d3af4d58e22	6257	Pivka
00050000-555b-225b-2a9c-2bd39c52786f	6232	Planina
00050000-555b-225b-f9d7-eac6ca83d565	3225	Planina pri Sevnici
00050000-555b-225b-f48d-cf7626f65d7c	6276	Pobegi
00050000-555b-225b-868a-ceee7520c567	8312	Podbočje
00050000-555b-225b-99e9-311dbde6a7e9	5243	Podbrdo
00050000-555b-225b-765a-f10db57904d1	3254	Podčetrtek
00050000-555b-225b-d87b-a32405b808e6	2273	Podgorci
00050000-555b-225b-3385-986eba5fb1c4	6216	Podgorje
00050000-555b-225b-67d7-21b75c35df02	2381	Podgorje pri Slovenj Gradcu
00050000-555b-225b-4046-c9238f6555ba	6244	Podgrad
00050000-555b-225b-0740-92bb2a5b59cc	1414	Podkum
00050000-555b-225b-e7fa-aa979b5f2bd1	2286	Podlehnik
00050000-555b-225b-5069-43b24e6f72c4	5272	Podnanos
00050000-555b-225b-97a2-f8bd194c3e70	4244	Podnart
00050000-555b-225b-afb7-d1fdc1716d1b	3241	Podplat
00050000-555b-225b-d171-499f9d441cf7	3257	Podsreda
00050000-555b-225b-fa32-c34d9958d031	2363	Podvelka
00050000-555b-225b-b104-234079323a24	2208	Pohorje
00050000-555b-225b-b0ed-defab19ba76b	2257	Polenšak
00050000-555b-225b-4263-77cc721ba147	1355	Polhov Gradec
00050000-555b-225b-b177-f78695ae08f2	4223	Poljane nad Škofjo Loko
00050000-555b-225b-0c51-9d71729be995	2319	Poljčane
00050000-555b-225b-36de-142524815283	1272	Polšnik
00050000-555b-225b-2c87-b40d67b5ad87	3313	Polzela
00050000-555b-225b-6292-f82ff8da78af	3232	Ponikva
00050000-555b-225b-87a2-55fa09eca9da	6320	Portorož/Portorose
00050000-555b-225b-17e4-727ea6961477	6230	Postojna
00050000-555b-225b-d7da-ac723eae0980	2331	Pragersko
00050000-555b-225b-e2de-70bbe73ed76e	3312	Prebold
00050000-555b-225b-b62d-aa87d7e9a921	4205	Preddvor
00050000-555b-225b-b706-638558d8f9dc	6255	Prem
00050000-555b-225b-e544-e30429ade382	1352	Preserje
00050000-555b-225b-e326-f3da1559d565	6258	Prestranek
00050000-555b-225b-9de4-c3559af8ad88	2391	Prevalje
00050000-555b-225b-5ecf-b3d7a434d44a	3262	Prevorje
00050000-555b-225b-2b6d-4af2cdb86908	1276	Primskovo 
00050000-555b-225b-7e92-97011e9e79ce	3253	Pristava pri Mestinju
00050000-555b-225b-d524-1d7b7d81822f	9207	Prosenjakovci/Partosfalva
00050000-555b-225b-db0f-05e577298a8b	5297	Prvačina
00050000-555b-225b-9750-9b5444285bec	2250	Ptuj
00050000-555b-225b-ee0b-1602bba1f287	2323	Ptujska Gora
00050000-555b-225b-937b-b2ebaacd8ed3	9201	Puconci
00050000-555b-225b-7eae-3135db844f16	2327	Rače
00050000-555b-225b-bb8c-1e1f7f5f7cd5	1433	Radeče
00050000-555b-225b-1187-3bb46112d719	9252	Radenci
00050000-555b-225b-af8d-ec445e2bbcbd	2360	Radlje ob Dravi
00050000-555b-225b-4d50-172f830329f0	1235	Radomlje
00050000-555b-225b-9e4a-c7f67440c4a5	4240	Radovljica
00050000-555b-225b-010c-2ca9875a6cbd	8274	Raka
00050000-555b-225b-35d3-77f14a7478eb	1381	Rakek
00050000-555b-225b-ecf9-f3ed869fb95b	4283	Rateče - Planica
00050000-555b-225b-23bc-a5448348c5dd	2390	Ravne na Koroškem
00050000-555b-225b-35f2-8c1f8f336a85	9246	Razkrižje
00050000-555b-225b-3348-e3b868bd153e	3332	Rečica ob Savinji
00050000-555b-225b-b8c5-f0c7b2080372	5292	Renče
00050000-555b-225b-75f2-79d529222133	1310	Ribnica
00050000-555b-225b-c675-d882d75af56b	2364	Ribnica na Pohorju
00050000-555b-225b-6fd0-7bf881f6c327	3272	Rimske Toplice
00050000-555b-225b-45df-8e1ffc1103e9	1314	Rob
00050000-555b-225b-5bd4-e5f68e529909	5215	Ročinj
00050000-555b-225b-5d32-7bf2cab4fa47	3250	Rogaška Slatina
00050000-555b-225b-71ce-4f5d000d46c0	9262	Rogašovci
00050000-555b-225b-438b-dbd68a996a11	3252	Rogatec
00050000-555b-225b-e8bf-4919d546ad7f	1373	Rovte
00050000-555b-225b-bfcf-ac3a8907c4ab	2342	Ruše
00050000-555b-225b-92ef-4310f6e4ae74	1282	Sava
00050000-555b-225b-7bdb-c3f49d3c6b49	6333	Sečovlje/Sicciole
00050000-555b-225b-f869-3341082910d7	4227	Selca
00050000-555b-225b-e477-96a42b498d55	2352	Selnica ob Dravi
00050000-555b-225b-8c6e-5ed5a1c0a0df	8333	Semič
00050000-555b-225b-f5d0-c419177d32a8	8281	Senovo
00050000-555b-225b-4996-b0af86b4c8b2	6224	Senožeče
00050000-555b-225b-3a36-6fa25aae4668	8290	Sevnica
00050000-555b-225b-1f20-c4698a59d09d	6210	Sežana
00050000-555b-225b-da00-0afe1d30366a	2214	Sladki Vrh
00050000-555b-225b-04fa-ede80fddbd89	5283	Slap ob Idrijci
00050000-555b-225b-4d49-cfb21741b888	2380	Slovenj Gradec
00050000-555b-225b-5080-b693d1bf3fab	2310	Slovenska Bistrica
00050000-555b-225b-a9e8-4d43f361b34b	3210	Slovenske Konjice
00050000-555b-225b-54ed-9e3531c8d8f5	1216	Smlednik
00050000-555b-225b-aa31-3ba730bb6c9d	5232	Soča
00050000-555b-225b-6247-be5f26012f69	1317	Sodražica
00050000-555b-225b-d800-1a6b63b7f206	3335	Solčava
00050000-555b-225b-9275-877ec8d65d20	5250	Solkan
00050000-555b-225b-8908-6e6a96dd70d7	4229	Sorica
00050000-555b-225b-63d5-5a03cd0806ff	4225	Sovodenj
00050000-555b-225b-62f2-947bbb1583d9	5281	Spodnja Idrija
00050000-555b-225b-8054-247e06e2349d	2241	Spodnji Duplek
00050000-555b-225b-5ef4-e47ce44ca025	9245	Spodnji Ivanjci
00050000-555b-225b-4556-484c58494cb0	2277	Središče ob Dravi
00050000-555b-225b-423e-520b9678ba94	4267	Srednja vas v Bohinju
00050000-555b-225b-d041-7cd04236d251	8256	Sromlje 
00050000-555b-225b-344b-bb34562b24b8	5224	Srpenica
00050000-555b-225b-1c89-0a42f4c5102b	1242	Stahovica
00050000-555b-225b-006b-7c8cd21d663b	1332	Stara Cerkev
00050000-555b-225b-0f8b-cbe343a6c5c2	8342	Stari trg ob Kolpi
00050000-555b-225b-f10d-d2176b3940c2	1386	Stari trg pri Ložu
00050000-555b-225b-efec-e5d4e304da27	2205	Starše
00050000-555b-225b-2128-c27680353821	2289	Stoperce
00050000-555b-225b-9de1-82690536074a	8322	Stopiče
00050000-555b-225b-09df-a7ee3e15c607	3206	Stranice
00050000-555b-225b-7c09-25ce99973864	8351	Straža
00050000-555b-225b-d02e-2f60b8a57f33	1313	Struge
00050000-555b-225b-455f-7fb3737b738f	8293	Studenec
00050000-555b-225b-4128-39f4ffbadc62	8331	Suhor
00050000-555b-225b-f52d-03cc9d7c2550	2233	Sv. Ana v Slovenskih goricah
00050000-555b-225b-ab2e-aa464a85cdf0	2235	Sv. Trojica v Slovenskih goricah
00050000-555b-225b-37eb-f1e2a8ae396e	2353	Sveti Duh na Ostrem Vrhu
00050000-555b-225b-84e0-e81662cfcba6	9244	Sveti Jurij ob Ščavnici
00050000-555b-225b-e31e-33ab661548a3	3264	Sveti Štefan
00050000-555b-225b-cd88-ce67225ecf8f	2258	Sveti Tomaž
00050000-555b-225b-8961-00484f9c0e7b	9204	Šalovci
00050000-555b-225b-6049-40811a6cec23	5261	Šempas
00050000-555b-225b-920a-5ac278ef9cbf	5290	Šempeter pri Gorici
00050000-555b-225b-d00a-0987e5192bc3	3311	Šempeter v Savinjski dolini
00050000-555b-225b-f70a-f78974694bd6	4208	Šenčur
00050000-555b-225b-536b-a9b4993a259f	2212	Šentilj v Slovenskih goricah
00050000-555b-225b-2a20-0f7e938f0966	8297	Šentjanž
00050000-555b-225b-bb3b-e5c909c4be15	2373	Šentjanž pri Dravogradu
00050000-555b-225b-64f8-c53ce4c71a9c	8310	Šentjernej
00050000-555b-225b-04fc-957aae4083af	3230	Šentjur
00050000-555b-225b-2b05-5b237e2c2aa6	3271	Šentrupert
00050000-555b-225b-122e-e1e7dfb5cc92	8232	Šentrupert
00050000-555b-225b-5046-377d1745d354	1296	Šentvid pri Stični
00050000-555b-225b-c912-77c3d1e00ed8	8275	Škocjan
00050000-555b-225b-76f8-5b4d5599bd26	6281	Škofije
00050000-555b-225b-9ef7-7927a328b75c	4220	Škofja Loka
00050000-555b-225b-c03d-e0e351a72f6f	3211	Škofja vas
00050000-555b-225b-4440-a46ff215b37a	1291	Škofljica
00050000-555b-225b-fd03-66207e40dbbd	6274	Šmarje
00050000-555b-225b-89ac-0fc81873e267	1293	Šmarje - Sap
00050000-555b-225b-91e0-0c623055debe	3240	Šmarje pri Jelšah
00050000-555b-225b-8b0a-6a2d9ada8610	8220	Šmarješke Toplice
00050000-555b-225b-c282-3420944fe05c	2315	Šmartno na Pohorju
00050000-555b-225b-172f-40f93c6a9feb	3341	Šmartno ob Dreti
00050000-555b-225b-61b2-fd4a69c0a37a	3327	Šmartno ob Paki
00050000-555b-225b-f902-fabbd8be7490	1275	Šmartno pri Litiji
00050000-555b-225b-b908-9229c36dc2d5	2383	Šmartno pri Slovenj Gradcu
00050000-555b-225b-3f11-bd50dd44540b	3201	Šmartno v Rožni dolini
00050000-555b-225b-c9f3-bc58f94bfea4	3325	Šoštanj
00050000-555b-225b-b8c8-053d55f70df2	6222	Štanjel
00050000-555b-225b-28ae-03678022927c	3220	Štore
00050000-555b-225b-6f15-5763e27533b0	3304	Tabor
00050000-555b-225b-1445-afd674749f5f	3221	Teharje
00050000-555b-225b-45b0-25c2a49e61a5	9251	Tišina
00050000-555b-225b-2b04-e4294aa903d9	5220	Tolmin
00050000-555b-225b-e14d-ff697ed2dd0a	3326	Topolšica
00050000-555b-225b-b790-205e31c6fc98	2371	Trbonje
00050000-555b-225b-2776-37b6f31d291a	1420	Trbovlje
00050000-555b-225b-8417-440498878b30	8231	Trebelno 
00050000-555b-225b-4daf-4edf45222148	8210	Trebnje
00050000-555b-225b-4600-89d1e84ceca1	5252	Trnovo pri Gorici
00050000-555b-225b-501d-ead8e874eb13	2254	Trnovska vas
00050000-555b-225b-6fcf-8636abd4005c	1222	Trojane
00050000-555b-225b-b73d-f59919532b55	1236	Trzin
00050000-555b-225b-f3ad-5a5ee192fa7c	4290	Tržič
00050000-555b-225b-d37d-d0c2098cb108	8295	Tržišče
00050000-555b-225b-b40a-a5c344683b77	1311	Turjak
00050000-555b-225b-fff1-8c63c7bf03b4	9224	Turnišče
00050000-555b-225b-8c1f-cfd5a3783b8f	8323	Uršna sela
00050000-555b-225b-6dd2-d4e0c9d5fa55	1252	Vače
00050000-555b-225b-1cf6-c28031a1b401	3320	Velenje 
00050000-555b-225b-8227-8b086cf8ba50	3322	Velenje - poštni predali
00050000-555b-225b-cbc0-9fee632398c3	8212	Velika Loka
00050000-555b-225b-fe54-1eae8676994f	2274	Velika Nedelja
00050000-555b-225b-8f5e-fb118754ca22	9225	Velika Polana
00050000-555b-225b-b569-02b6de054bb1	1315	Velike Lašče
00050000-555b-225b-a635-d01748bb06c7	8213	Veliki Gaber
00050000-555b-225b-002b-7e766e185994	9241	Veržej
00050000-555b-225b-07db-6c455ac8cd29	1312	Videm - Dobrepolje
00050000-555b-225b-ab68-e3b021fea27b	2284	Videm pri Ptuju
00050000-555b-225b-33f9-55ad4f97165f	8344	Vinica
00050000-555b-225b-01ab-3c9f358cc014	5271	Vipava
00050000-555b-225b-8fd0-8f4004c5345d	4212	Visoko
00050000-555b-225b-00a8-2e395c070a82	1294	Višnja Gora
00050000-555b-225b-c7ac-39e0d98f37f1	3205	Vitanje
00050000-555b-225b-ec8b-dd74e326e672	2255	Vitomarci
00050000-555b-225b-53f6-1800ad432282	1217	Vodice
00050000-555b-225b-811a-6421483759c5	3212	Vojnik\t
00050000-555b-225b-1464-e3c4867373b2	5293	Volčja Draga
00050000-555b-225b-a143-a5d3f99b0d66	2232	Voličina
00050000-555b-225b-3c12-c3ae2ecb1501	3305	Vransko
00050000-555b-225b-3d59-a893b8de9754	6217	Vremski Britof
00050000-555b-225b-8f07-94b9fbbb413b	1360	Vrhnika
00050000-555b-225b-e378-13df844cb169	2365	Vuhred
00050000-555b-225b-d23c-505ffacf4d61	2367	Vuzenica
00050000-555b-225b-67ab-309e5e21715e	8292	Zabukovje 
00050000-555b-225b-f47d-65c2d7a422ed	1410	Zagorje ob Savi
00050000-555b-225b-3db1-34b2c6a79112	1303	Zagradec
00050000-555b-225b-0888-952dcc4b110b	2283	Zavrč
00050000-555b-225b-e221-6ce53c996335	8272	Zdole 
00050000-555b-225b-0a22-2f520cdd898d	4201	Zgornja Besnica
00050000-555b-225b-0e6f-8ab3f15984f9	2242	Zgornja Korena
00050000-555b-225b-32bb-bc10f148e1ce	2201	Zgornja Kungota
00050000-555b-225b-85d3-ef226f569489	2316	Zgornja Ložnica
00050000-555b-225b-6317-73b57418feae	2314	Zgornja Polskava
00050000-555b-225b-aff0-61273a5cfc67	2213	Zgornja Velka
00050000-555b-225b-ea36-bb0f60c7b2e1	4247	Zgornje Gorje
00050000-555b-225b-7a61-95c2a475e199	4206	Zgornje Jezersko
00050000-555b-225b-3259-0d5bc0bcec77	2285	Zgornji Leskovec
00050000-555b-225b-2c91-b069a007f749	1432	Zidani Most
00050000-555b-225b-be6f-ac3ebff5c7f6	3214	Zreče
00050000-555b-225b-8df7-bfbeb35a2db4	4209	Žabnica
00050000-555b-225b-b48a-cb02de573e8a	3310	Žalec
00050000-555b-225b-058c-3eb9640b826b	4228	Železniki
00050000-555b-225b-c1fa-7a3ce16a5628	2287	Žetale
00050000-555b-225b-1082-40795fefb5f1	4226	Žiri
00050000-555b-225b-5626-ca602f12fab6	4274	Žirovnica
00050000-555b-225b-7dcd-258ad6b89582	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 3918164)
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
-- TOC entry 2642 (class 0 OID 3917991)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3918057)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3918176)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3918281)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3918328)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3918205)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3918149)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3918139)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3918318)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3918271)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 3917858)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555b-225c-fa6f-bfb9b5f31dbd	00010000-555b-225c-5004-92afa0099292	2015-05-19 13:45:32	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROaEJdzaD8E0OTVb3jl69LlMsjTcQDrgG";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 3918214)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3917896)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555b-225c-ff92-717889d26b40	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555b-225c-94b3-d514dbc0f747	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555b-225c-9bb9-3c64d813c170	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555b-225c-1f99-61b8bd5260d7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555b-225c-6d9f-70354d029709	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555b-225c-28bb-de0d04ab62cc	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 3917880)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555b-225c-fa6f-bfb9b5f31dbd	00020000-555b-225c-1f99-61b8bd5260d7
00010000-555b-225c-5004-92afa0099292	00020000-555b-225c-1f99-61b8bd5260d7
\.


--
-- TOC entry 2668 (class 0 OID 3918228)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3918170)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3918120)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3917956)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3918126)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3918306)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3918026)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3917867)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555b-225c-5004-92afa0099292	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROL/u/ijmoLXig84X0MjfL3A4FVw2iS6u	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555b-225c-fa6f-bfb9b5f31dbd	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 3918360)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3918072)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3918197)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3918263)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3918104)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3918350)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3918253)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 3917921)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3918400)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 3918393)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 3918305)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 3918094)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 3918119)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 3918052)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 3918249)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 3918070)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 3918113)
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
-- TOC entry 2364 (class 2606 OID 3918162)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 3918189)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 3918024)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 3917930)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 3917988)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 3917954)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 3917910)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 3917895)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 3918195)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 3918227)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 3918345)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 3917981)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 3918012)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3918168)
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
-- TOC entry 2298 (class 2606 OID 3918002)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 3918061)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3918180)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3918287)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3918333)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 3918212)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 3918153)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 3918144)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3918327)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3918278)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 3917866)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3918218)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3917884)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 3917904)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 3918236)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 3918175)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 3918125)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 3917961)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 3918135)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3918317)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 3918037)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 3917879)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 3918375)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3918079)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 3918203)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 3918269)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 3918108)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 3918359)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 3918262)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 3918101)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 3917983)
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
-- TOC entry 2377 (class 1259 OID 3918196)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 3918182)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 3918181)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 3918080)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 3918252)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 3918250)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 3918251)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 3918347)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 3918348)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 3918349)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 3918378)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 3918377)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 3918376)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 3918039)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 3918038)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 3917990)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 3917989)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 3918219)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 3918114)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 3917911)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 3917912)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 3918239)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 3918238)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 3918237)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 3918062)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 3918064)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 3918063)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 3918148)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 3918146)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 3918145)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 3918147)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 3917885)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 3917886)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 3918204)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 3918169)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 3918279)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 3918280)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 3918004)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3918003)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 3918005)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 3918288)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 3918289)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 3918403)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 3918402)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 3918405)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 3918401)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 3918404)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 3918270)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 3918157)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 3918156)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 3918154)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 3918155)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 3918395)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 3918394)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 3918071)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 3917932)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 3917931)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 3917962)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 3917963)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 3918138)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 3918137)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 3918136)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 3918103)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 3918099)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 3918096)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 3918097)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 3918095)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 3918100)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 3918098)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 3917982)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 3918053)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3918055)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 3918054)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 3918056)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 3918163)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 3918346)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 3917955)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 3918025)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 3918213)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 3918013)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 3918334)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 3917905)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 3918102)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 3918536)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 3918521)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 3918526)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 3918546)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 3918516)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 3918541)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 3918531)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 3918451)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 3918631)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 3918626)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 3918621)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 3918511)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 3918671)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 3918661)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3918666)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 3918611)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 3918706)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 3918711)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 3918716)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 3918731)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 3918726)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 3918721)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 3918486)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 3918481)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3918461)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3918456)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 3918436)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 3918641)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 3918551)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 3918416)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 3918421)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 3918656)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 3918651)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 3918646)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 3918491)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3918501)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 3918496)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 3918586)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 3918576)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 3918571)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 3918581)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 3918406)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 3918411)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 3918636)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 3918616)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 3918681)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 3918686)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 3918471)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 3918466)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 3918476)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 3918691)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 3918696)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 3918756)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 3918751)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 3918766)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 3918746)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 3918761)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 3918676)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 3918606)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 3918601)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 3918591)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 3918596)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 3918741)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 3918736)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 3918506)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3918701)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 3918431)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 3918426)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 3918441)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 3918446)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 3918566)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 3918561)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 3918556)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-19 13:45:33 CEST

--
-- PostgreSQL database dump complete
--

