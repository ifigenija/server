--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-15 17:07:30 CEST

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
-- TOC entry 179 (class 1259 OID 3595229)
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
-- TOC entry 225 (class 1259 OID 3595712)
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
-- TOC entry 224 (class 1259 OID 3595695)
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
-- TOC entry 217 (class 1259 OID 3595606)
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
-- TOC entry 193 (class 1259 OID 3595397)
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
-- TOC entry 196 (class 1259 OID 3595431)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3595356)
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
-- TOC entry 212 (class 1259 OID 3595556)
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
-- TOC entry 191 (class 1259 OID 3595381)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3595425)
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
-- TOC entry 201 (class 1259 OID 3595474)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3595499)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3595330)
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
-- TOC entry 180 (class 1259 OID 3595238)
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
-- TOC entry 181 (class 1259 OID 3595249)
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
-- TOC entry 184 (class 1259 OID 3595300)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3595203)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3595222)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3595506)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3595536)
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
-- TOC entry 221 (class 1259 OID 3595651)
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
-- TOC entry 183 (class 1259 OID 3595280)
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
-- TOC entry 186 (class 1259 OID 3595322)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3595480)
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
-- TOC entry 185 (class 1259 OID 3595307)
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
-- TOC entry 190 (class 1259 OID 3595373)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3595492)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3595597)
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
-- TOC entry 220 (class 1259 OID 3595644)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3595521)
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
-- TOC entry 200 (class 1259 OID 3595465)
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
-- TOC entry 199 (class 1259 OID 3595455)
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
-- TOC entry 219 (class 1259 OID 3595634)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3595587)
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
-- TOC entry 173 (class 1259 OID 3595174)
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
-- TOC entry 172 (class 1259 OID 3595172)
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
-- TOC entry 209 (class 1259 OID 3595530)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3595212)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3595196)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3595544)
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
-- TOC entry 203 (class 1259 OID 3595486)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3595436)
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
-- TOC entry 182 (class 1259 OID 3595272)
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
-- TOC entry 198 (class 1259 OID 3595442)
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
-- TOC entry 218 (class 1259 OID 3595622)
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
-- TOC entry 188 (class 1259 OID 3595342)
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
-- TOC entry 174 (class 1259 OID 3595183)
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
-- TOC entry 223 (class 1259 OID 3595676)
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
-- TOC entry 192 (class 1259 OID 3595388)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 3595513)
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
-- TOC entry 214 (class 1259 OID 3595579)
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
-- TOC entry 194 (class 1259 OID 3595420)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 3595666)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3595569)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3595177)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 3595229)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3595712)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3595695)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3595606)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3595397)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3595431)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3595356)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5556-0bb1-6487-230801f13af6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5556-0bb1-bfcf-8ff1d5820655	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5556-0bb1-5dee-4d6957fc69c7	AL	ALB	008	Albania 	Albanija	\N
00040000-5556-0bb1-9ef7-736325f1851e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5556-0bb1-1432-66e6662023dd	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5556-0bb1-3e4f-e0b103a81c71	AD	AND	020	Andorra 	Andora	\N
00040000-5556-0bb1-ba8d-3f596c7ba28e	AO	AGO	024	Angola 	Angola	\N
00040000-5556-0bb1-e179-b6e411561eb2	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5556-0bb1-668b-efa072be2213	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5556-0bb1-9857-2f5d151320ea	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5556-0bb1-bfa9-bd984fbadaa1	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5556-0bb1-5778-386456aa4e4f	AM	ARM	051	Armenia 	Armenija	\N
00040000-5556-0bb1-28f3-82a8fb72806d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5556-0bb1-fd0b-c84a0e727b48	AU	AUS	036	Australia 	Avstralija	\N
00040000-5556-0bb1-4c04-e899ed1c2fcc	AT	AUT	040	Austria 	Avstrija	\N
00040000-5556-0bb1-aab3-6aaf4f801236	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5556-0bb1-ef72-e9e49fe657e9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5556-0bb1-994c-ba2034620653	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5556-0bb1-e220-8e79bbbd8324	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5556-0bb1-a5e0-fb1511d1d96b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5556-0bb1-cedc-ebe345001e56	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5556-0bb1-d0f2-48f1aa25994b	BE	BEL	056	Belgium 	Belgija	\N
00040000-5556-0bb1-538f-844a7947bcbf	BZ	BLZ	084	Belize 	Belize	\N
00040000-5556-0bb1-a4bc-c4ab2a7c9a20	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5556-0bb1-f8ec-4a82fff12bb2	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5556-0bb1-f3c2-ce2288d24119	BT	BTN	064	Bhutan 	Butan	\N
00040000-5556-0bb1-29cc-c0c253290da0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5556-0bb1-f589-76770e028b9c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5556-0bb1-cc5b-314ddf365fa1	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5556-0bb1-7593-7ceb65b2ad14	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5556-0bb1-b167-b81280837387	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5556-0bb1-76af-5adb06e18dfb	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5556-0bb1-6d2d-02833953c96a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5556-0bb1-3b1d-86ce670e43e5	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5556-0bb1-699f-8c6f80609e7c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5556-0bb1-10b9-771262a20ced	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5556-0bb1-e598-095c79185070	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5556-0bb1-bc56-1017b1b1881a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5556-0bb1-d4fc-45d11ff385ce	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5556-0bb1-3b1a-1606cab62b40	CA	CAN	124	Canada 	Kanada	\N
00040000-5556-0bb1-6e6f-851a4ebffc91	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5556-0bb1-7b92-498c7c6f0964	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5556-0bb1-27b4-a66b9a11e50f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5556-0bb1-286e-93ddc837f268	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5556-0bb1-9e8d-3de32fbfd4ef	CL	CHL	152	Chile 	Čile	\N
00040000-5556-0bb1-faf5-ce7c00681b32	CN	CHN	156	China 	Kitajska	\N
00040000-5556-0bb1-1245-f6cdefa5a214	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5556-0bb1-0c1f-6d7c48bbc7a3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5556-0bb1-c5e4-0405a9f3780f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5556-0bb1-d462-60c667f05c0c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5556-0bb1-3ff3-232bcc1ce39c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5556-0bb1-1c27-825dd9e3e50b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5556-0bb1-dbcc-5090bee1a19d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5556-0bb1-2cde-199d772f1b16	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5556-0bb1-4587-8d9881a90609	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5556-0bb1-55e7-1eddf626f8b6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5556-0bb1-1649-6e038c16e0b6	CU	CUB	192	Cuba 	Kuba	\N
00040000-5556-0bb1-0526-2c1b09fc2dae	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5556-0bb1-a28e-51b96005cdec	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5556-0bb1-22e1-1a5b8abffe4d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5556-0bb1-ce7e-fd650920fb24	DK	DNK	208	Denmark 	Danska	\N
00040000-5556-0bb1-dc57-c4e1267c7700	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5556-0bb1-0a35-9233bcba144b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5556-0bb1-766b-94b88803584b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5556-0bb1-b330-80a788c8de25	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5556-0bb1-3d34-c72983fac760	EG	EGY	818	Egypt 	Egipt	\N
00040000-5556-0bb1-091e-c1017b9fc53d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5556-0bb1-d25c-634e0c611b4f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5556-0bb1-075f-fdef5eda5043	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5556-0bb1-c479-52f015e1f16f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5556-0bb1-f18f-b341d7e1ff84	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5556-0bb1-4680-ddc226a2334c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5556-0bb1-62b7-28ec79f312f2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5556-0bb1-700b-124c08379943	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5556-0bb1-92fc-7312e2b63004	FI	FIN	246	Finland 	Finska	\N
00040000-5556-0bb1-bca0-baf8c6a8359f	FR	FRA	250	France 	Francija	\N
00040000-5556-0bb1-e005-04fea11bc95a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5556-0bb1-77da-f3bbd13bf9c1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5556-0bb1-323d-2fe1e1288de5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5556-0bb1-d8c0-f509ed0c0414	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5556-0bb1-a4be-706071006da8	GA	GAB	266	Gabon 	Gabon	\N
00040000-5556-0bb1-7d3a-b9ff21c9becf	GM	GMB	270	Gambia 	Gambija	\N
00040000-5556-0bb1-a0ea-55ca3053a146	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5556-0bb1-8629-3c039bb00943	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5556-0bb1-08f1-0eba56758bba	GH	GHA	288	Ghana 	Gana	\N
00040000-5556-0bb1-d85f-f0e968c0a6c9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5556-0bb1-61a9-868a73a7345e	GR	GRC	300	Greece 	Grčija	\N
00040000-5556-0bb1-c8dd-92d857e9f66d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5556-0bb1-626c-be554ce6a0d1	GD	GRD	308	Grenada 	Grenada	\N
00040000-5556-0bb1-6262-81bbf50d28f0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5556-0bb1-c1c9-9e0e53015b39	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5556-0bb1-ab97-239e34e4eb52	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5556-0bb1-020a-6b6a7443fc74	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5556-0bb1-b48b-5097570bba51	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5556-0bb1-3624-d9e5c46b7329	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5556-0bb1-1510-36c807841d12	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5556-0bb1-8c97-31264755e967	HT	HTI	332	Haiti 	Haiti	\N
00040000-5556-0bb1-0ed7-e45d0f332829	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5556-0bb1-ffaa-490ad4b29e1c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5556-0bb1-2ee8-fe5f3b1fe2e1	HN	HND	340	Honduras 	Honduras	\N
00040000-5556-0bb1-c039-729fd182029d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5556-0bb1-a2c7-a6bac0f3fb44	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5556-0bb1-bf1d-4bdd6547c2aa	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5556-0bb1-41ab-c8edc9874af3	IN	IND	356	India 	Indija	\N
00040000-5556-0bb1-7b35-7907fc26e599	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5556-0bb1-e36a-2561b70cb8e6	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5556-0bb1-0b41-53edd5e768c1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5556-0bb1-48d2-b7303f5e08dc	IE	IRL	372	Ireland 	Irska	\N
00040000-5556-0bb1-3b2f-021da6f79d70	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5556-0bb1-2df2-cb326fe3ac2b	IL	ISR	376	Israel 	Izrael	\N
00040000-5556-0bb1-a21d-ed41f1dac3cc	IT	ITA	380	Italy 	Italija	\N
00040000-5556-0bb1-3f64-2499a409db44	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5556-0bb1-540e-f5e773c3ca63	JP	JPN	392	Japan 	Japonska	\N
00040000-5556-0bb1-96ee-53ad62045719	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5556-0bb1-68c8-a838625f67d8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5556-0bb1-7563-7d8ddd1bf4cd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5556-0bb1-c446-b6042a826d3f	KE	KEN	404	Kenya 	Kenija	\N
00040000-5556-0bb1-479d-50efd5c73c60	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5556-0bb1-d9b5-93e6bbba5edd	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5556-0bb1-27bd-60388eb35915	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5556-0bb1-318c-7aac6c75742b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5556-0bb1-4c5c-307cea9b5174	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5556-0bb1-e62e-7957e16387b9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5556-0bb1-3a07-e5c14e06c7d0	LV	LVA	428	Latvia 	Latvija	\N
00040000-5556-0bb1-2ece-32c68f738e4e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5556-0bb1-7808-270b3a5ddea5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5556-0bb1-de05-aaad552e4289	LR	LBR	430	Liberia 	Liberija	\N
00040000-5556-0bb1-75f0-8225de3f8909	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5556-0bb1-42a1-43ee0c56faa9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5556-0bb1-4426-386b5430f91e	LT	LTU	440	Lithuania 	Litva	\N
00040000-5556-0bb1-9df3-a7ea0cf1d26d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5556-0bb1-4f05-b422f3df7488	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5556-0bb1-45c1-fbb22aaa3a9c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5556-0bb1-dd39-507ce145e2db	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5556-0bb1-387c-e0af1ae2e277	MW	MWI	454	Malawi 	Malavi	\N
00040000-5556-0bb1-a86a-86eaa69ebe17	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5556-0bb1-ec1b-adafdaac8048	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5556-0bb1-ec63-7b44dd6ecafb	ML	MLI	466	Mali 	Mali	\N
00040000-5556-0bb1-4059-19a9f274d741	MT	MLT	470	Malta 	Malta	\N
00040000-5556-0bb1-ddd5-991af8196599	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5556-0bb1-6762-5d49d7c92203	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5556-0bb1-3ed7-3dd7cbce9dd7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5556-0bb1-6052-d5dca1d89b66	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5556-0bb1-67b4-d2b2ff796d4e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5556-0bb1-41ee-ae0de985d25d	MX	MEX	484	Mexico 	Mehika	\N
00040000-5556-0bb1-7a04-7c5a2fcdd99e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5556-0bb1-830b-358ca081fed4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5556-0bb1-ba10-30c2e24fe5c7	MC	MCO	492	Monaco 	Monako	\N
00040000-5556-0bb1-0641-fd5576f4dcb9	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5556-0bb1-20d0-c8b790739dd8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5556-0bb1-9b74-d024bc8a08e0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5556-0bb1-bab9-a4b69586ee53	MA	MAR	504	Morocco 	Maroko	\N
00040000-5556-0bb1-b8db-c9d40171a597	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5556-0bb1-9178-c27b7b5003ad	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5556-0bb1-bbe6-cd61f5d9deea	NA	NAM	516	Namibia 	Namibija	\N
00040000-5556-0bb1-3b66-159cbf23d01b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5556-0bb1-bf41-62621547c92b	NP	NPL	524	Nepal 	Nepal	\N
00040000-5556-0bb1-f804-5d029b8d700a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5556-0bb1-e511-56d6d436f3f4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5556-0bb1-69a3-9a1de5fff13b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5556-0bb1-c11f-9a5e2bd473ac	NE	NER	562	Niger 	Niger 	\N
00040000-5556-0bb1-b772-ff24e37e499f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5556-0bb1-dbc1-43fefc2b5e33	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5556-0bb1-77ac-e53665de0d66	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5556-0bb1-9c08-cd2b62af270f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5556-0bb1-79fa-bedb6b60c6b8	NO	NOR	578	Norway 	Norveška	\N
00040000-5556-0bb1-18e6-f196ab099c6b	OM	OMN	512	Oman 	Oman	\N
00040000-5556-0bb1-2c6e-30998c842b64	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5556-0bb1-d26b-c7e22d24684e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5556-0bb1-2d7d-e7712da8bd8b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5556-0bb1-4e82-136696defbfe	PA	PAN	591	Panama 	Panama	\N
00040000-5556-0bb1-17af-9bc911f80fa4	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5556-0bb1-707f-0d1c8e7dfe8a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5556-0bb1-b3c4-09e1dfeeddb3	PE	PER	604	Peru 	Peru	\N
00040000-5556-0bb1-41b8-6c730f3b8833	PH	PHL	608	Philippines 	Filipini	\N
00040000-5556-0bb1-4797-e38116e95f69	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5556-0bb1-b6f2-96d6b2d50fcd	PL	POL	616	Poland 	Poljska	\N
00040000-5556-0bb1-d725-d4c8c92d2ce4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5556-0bb1-a458-7655cfc7917f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5556-0bb1-a973-465ee22f44c6	QA	QAT	634	Qatar 	Katar	\N
00040000-5556-0bb1-7d72-3e93300153f6	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5556-0bb1-0d84-7d4a32d4a001	RO	ROU	642	Romania 	Romunija	\N
00040000-5556-0bb1-e189-d867f84cead0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5556-0bb1-ce7a-e728f538df68	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5556-0bb1-bae8-9b7ec297b386	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5556-0bb1-f0ef-ed93675dd7e8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5556-0bb1-b364-df4a42ef0de9	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5556-0bb1-76bd-d1f1243a7597	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5556-0bb1-ab17-c93a919a0714	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5556-0bb1-09d3-9d04a18132fc	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5556-0bb1-66b6-b400a18dfd19	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5556-0bb1-52b9-25cf30e4a53c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5556-0bb1-556f-fac771898cf8	SM	SMR	674	San Marino 	San Marino	\N
00040000-5556-0bb1-8e3f-28fe2b621a18	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5556-0bb1-4c21-3e2e93c81eb1	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5556-0bb1-3155-5fbb7365247a	SN	SEN	686	Senegal 	Senegal	\N
00040000-5556-0bb1-cd76-1514f2fe8140	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5556-0bb1-5ddc-3b0834724f3f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5556-0bb1-6e4f-a43afdd2e74a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5556-0bb1-0167-48845c3c329c	SG	SGP	702	Singapore 	Singapur	\N
00040000-5556-0bb1-a34f-bce22b2f913b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5556-0bb1-fdab-4f2622ec03e7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5556-0bb1-d50a-a8cbde7ddc95	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5556-0bb1-7407-0ba1f721af18	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5556-0bb1-f859-197cb208d4fc	SO	SOM	706	Somalia 	Somalija	\N
00040000-5556-0bb1-50a1-2d45892c683f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5556-0bb1-4b7f-14c2183ce8e2	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5556-0bb1-2ae9-9dbefa310d4b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5556-0bb1-f6a3-44e2ad42c33f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5556-0bb1-82a4-42f1dcff41d8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5556-0bb1-7ad5-1cbcb94a1bdb	SD	SDN	729	Sudan 	Sudan	\N
00040000-5556-0bb1-0bed-6fabf4234310	SR	SUR	740	Suriname 	Surinam	\N
00040000-5556-0bb1-ed4b-bae7fdf0813d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5556-0bb1-ac04-248be0eef304	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5556-0bb1-8bc2-4c008dbd727c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5556-0bb1-a967-aa5593655f0a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5556-0bb1-48b9-250a41113958	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5556-0bb1-e86d-690e32eab08d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5556-0bb1-8e1d-4821db71bd4d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5556-0bb1-0658-59cc57f3fa47	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5556-0bb1-8d1c-d7e6b65de50f	TH	THA	764	Thailand 	Tajska	\N
00040000-5556-0bb1-a781-014df5ec33f7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5556-0bb2-51f0-88eafb764fa8	TG	TGO	768	Togo 	Togo	\N
00040000-5556-0bb2-ba09-b144294aebe3	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5556-0bb2-bba0-f000a5045c85	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5556-0bb2-a55b-a2fcdf576809	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5556-0bb2-4e16-5c8a1434aadf	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5556-0bb2-6c76-b49460730bf6	TR	TUR	792	Turkey 	Turčija	\N
00040000-5556-0bb2-e0e1-cf6266a8a00f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5556-0bb2-6512-f3b6388826f2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5556-0bb2-7d54-20e49653535b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5556-0bb2-a4b9-2dac22e0bec5	UG	UGA	800	Uganda 	Uganda	\N
00040000-5556-0bb2-1ef6-8d303737f872	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5556-0bb2-8513-bb7974e01ae8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5556-0bb2-a2fa-28ef4f9d231e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5556-0bb2-835c-195fd1718a4d	US	USA	840	United States 	Združene države Amerike	\N
00040000-5556-0bb2-761a-d23dd26171b7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5556-0bb2-980c-b41cb02c80ff	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5556-0bb2-add3-19c883c232c0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5556-0bb2-6c05-0c3878363239	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5556-0bb2-83d9-94b5dc16c412	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5556-0bb2-757e-5e4fccd39e8b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5556-0bb2-fb65-971553684ea9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5556-0bb2-4e27-0e785af3507f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5556-0bb2-4e84-fcfcc0d59b28	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5556-0bb2-3673-57e8bbc7f577	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5556-0bb2-9e39-378c7d602b59	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5556-0bb2-54ff-4822f882bf79	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5556-0bb2-1f46-2ec6ec7eeaf4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 3595556)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3595381)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3595425)
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
-- TOC entry 2658 (class 0 OID 3595474)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3595499)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3595330)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5556-0bb2-56af-2820d52ea785	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5556-0bb2-0390-0b076954ca76	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5556-0bb2-beb0-63e8f16928c9	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5556-0bb2-57af-4d1417d2ac5a	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5556-0bb2-3a66-88244b714e97	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5556-0bb2-93de-f98f691cf727	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5556-0bb2-92e1-58522a72dffc	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5556-0bb2-c46c-cca5baa63adb	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5556-0bb2-1655-e32ae0688af8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5556-0bb2-261f-b0dcaafeead4	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 3595238)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5556-0bb2-9181-280d15372176	00000000-5556-0bb2-3a66-88244b714e97	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5556-0bb2-2f37-67c3c5b89ec6	00000000-5556-0bb2-3a66-88244b714e97	00010000-5556-0bb2-dfbe-2984ba55167d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5556-0bb2-618e-80330673a5af	00000000-5556-0bb2-93de-f98f691cf727	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 3595249)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3595300)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 3595203)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5556-0bb2-b7dc-e2a7d2ba196f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5556-0bb2-191f-fd9b37c7f047	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5556-0bb2-471f-da5c18563ae1	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5556-0bb2-5a9c-1baab7cd65a3	Abonma-read	Abonma - branje	f
00030000-5556-0bb2-ac18-634b2e606bdc	Abonma-write	Abonma - spreminjanje	f
00030000-5556-0bb2-288e-4533c2b76585	Alternacija-read	Alternacija - branje	f
00030000-5556-0bb2-af25-dcd508ae528f	Alternacija-write	Alternacija - spreminjanje	f
00030000-5556-0bb2-9c39-100b2ffc21f5	Arhivalija-read	Arhivalija - branje	f
00030000-5556-0bb2-bcda-52998a5969ca	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5556-0bb2-af71-9153382b674b	Besedilo-read	Besedilo - branje	f
00030000-5556-0bb2-f3f3-ac83024938ce	Besedilo-write	Besedilo - spreminjanje	f
00030000-5556-0bb2-6731-9fb7463cae7c	DogodekIzven-read	DogodekIzven - branje	f
00030000-5556-0bb2-c00f-c640474c2f4d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5556-0bb2-5ab7-02c4fb231eed	Dogodek-read	Dogodek - branje	f
00030000-5556-0bb2-e606-e2774574ebb5	Dogodek-write	Dogodek - spreminjanje	f
00030000-5556-0bb2-26e7-a01188d8e229	Drzava-read	Drzava - branje	f
00030000-5556-0bb2-337c-aa3f64b4942a	Drzava-write	Drzava - spreminjanje	f
00030000-5556-0bb2-30a7-6d093c3240b7	Funkcija-read	Funkcija - branje	f
00030000-5556-0bb2-7459-fb1f863b6ef3	Funkcija-write	Funkcija - spreminjanje	f
00030000-5556-0bb2-af0e-b9e13c5e1912	Gostovanje-read	Gostovanje - branje	f
00030000-5556-0bb2-5071-d4387a515668	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5556-0bb2-9775-4893a16516b4	Gostujoca-read	Gostujoca - branje	f
00030000-5556-0bb2-98ee-b71dfbc5deed	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5556-0bb2-4717-df2e41ce8f50	Kupec-read	Kupec - branje	f
00030000-5556-0bb2-4924-c40c04a0b0bd	Kupec-write	Kupec - spreminjanje	f
00030000-5556-0bb2-dd04-13316973233e	NacinPlacina-read	NacinPlacina - branje	f
00030000-5556-0bb2-0f8b-ffd37b84cf72	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5556-0bb2-52b8-721c1dbd6648	Option-read	Option - branje	f
00030000-5556-0bb2-e69b-cc9b8413b159	Option-write	Option - spreminjanje	f
00030000-5556-0bb2-cd04-66a071643d16	OptionValue-read	OptionValue - branje	f
00030000-5556-0bb2-e5e0-17766274ddc0	OptionValue-write	OptionValue - spreminjanje	f
00030000-5556-0bb2-7548-2afeb3959184	Oseba-read	Oseba - branje	f
00030000-5556-0bb2-d958-3aafc79d54ff	Oseba-write	Oseba - spreminjanje	f
00030000-5556-0bb2-300a-01a204f53219	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5556-0bb2-47f6-e7259ccf8003	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5556-0bb2-5f88-001eddb50dfc	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5556-0bb2-2614-c124f439b400	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5556-0bb2-a21d-c2fb03d0deb1	Pogodba-read	Pogodba - branje	f
00030000-5556-0bb2-e69a-4723999188f6	Pogodba-write	Pogodba - spreminjanje	f
00030000-5556-0bb2-fc1c-764a1b070e6e	Popa-read	Popa - branje	f
00030000-5556-0bb2-a1e2-289ad33b624b	Popa-write	Popa - spreminjanje	f
00030000-5556-0bb2-1253-53ac20b6820c	Posta-read	Posta - branje	f
00030000-5556-0bb2-46ee-55c5e8b1dcb9	Posta-write	Posta - spreminjanje	f
00030000-5556-0bb2-ade0-3e24f5967ff0	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5556-0bb2-a2e8-53798eaac953	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5556-0bb2-8eaf-8cce3a08bc9b	PostniNaslov-read	PostniNaslov - branje	f
00030000-5556-0bb2-0f73-1962962bad89	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5556-0bb2-e363-9735e9c65309	Predstava-read	Predstava - branje	f
00030000-5556-0bb2-b9c4-c56feb14fc97	Predstava-write	Predstava - spreminjanje	f
00030000-5556-0bb2-2a06-3b098c46dab8	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5556-0bb2-a80a-ee3f8cf82e2c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5556-0bb2-5df1-00b25397f974	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5556-0bb2-5cec-e5e5b18722b1	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5556-0bb2-114b-a66d5cc220a0	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5556-0bb2-908f-7c56a35b8bf7	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5556-0bb2-e138-0a5a3e0289ee	Prostor-read	Prostor - branje	f
00030000-5556-0bb2-14ed-00197e2e4f76	Prostor-write	Prostor - spreminjanje	f
00030000-5556-0bb2-6023-0966e4c69226	Racun-read	Racun - branje	f
00030000-5556-0bb2-b238-4c3477df1c33	Racun-write	Racun - spreminjanje	f
00030000-5556-0bb2-2620-9477bb8ac79d	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5556-0bb2-000e-35355361b569	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5556-0bb2-9f73-652276f0fb73	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5556-0bb2-4ec5-fb5d1dfaa4a7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5556-0bb2-7ff5-ae68a63392da	Rekvizit-read	Rekvizit - branje	f
00030000-5556-0bb2-5729-d35156c92f8a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5556-0bb2-c987-0648afccc8d1	Rezervacija-read	Rezervacija - branje	f
00030000-5556-0bb2-99a1-94026383376e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5556-0bb2-69eb-c804792fafd8	SedezniRed-read	SedezniRed - branje	f
00030000-5556-0bb2-fe5d-febcb2d30e85	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5556-0bb2-8e49-47c6cd2c5ffc	Sedez-read	Sedez - branje	f
00030000-5556-0bb2-ff66-d930d7377c41	Sedez-write	Sedez - spreminjanje	f
00030000-5556-0bb2-569e-c933e79b7f6c	Sezona-read	Sezona - branje	f
00030000-5556-0bb2-75c6-86a24984df62	Sezona-write	Sezona - spreminjanje	f
00030000-5556-0bb2-e69a-ac67b9b50bb3	Telefonska-read	Telefonska - branje	f
00030000-5556-0bb2-b4e8-c75ccaef36a8	Telefonska-write	Telefonska - spreminjanje	f
00030000-5556-0bb2-ebdc-57802d9838a1	TerminStoritve-read	TerminStoritve - branje	f
00030000-5556-0bb2-10ec-1688d0bfd1e7	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5556-0bb2-9fe9-24e5cfd49711	TipFunkcije-read	TipFunkcije - branje	f
00030000-5556-0bb2-d5a4-98fde2a3f287	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5556-0bb2-1d7b-9a29d5d8a033	Trr-read	Trr - branje	f
00030000-5556-0bb2-bfee-a906f9049cb3	Trr-write	Trr - spreminjanje	f
00030000-5556-0bb2-b89b-8c14c0202428	Uprizoritev-read	Uprizoritev - branje	f
00030000-5556-0bb2-089a-14cc37618fd0	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5556-0bb2-4466-09c868872517	Vaja-read	Vaja - branje	f
00030000-5556-0bb2-2d38-e7f0d66d1c3b	Vaja-write	Vaja - spreminjanje	f
00030000-5556-0bb2-7506-2213279319f3	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5556-0bb2-58e1-be0940454def	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5556-0bb2-382b-3a332f7e4502	Zaposlitev-read	Zaposlitev - branje	f
00030000-5556-0bb2-aeaf-64de3b78c309	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5556-0bb2-ee16-6291e32866ad	Zasedenost-read	Zasedenost - branje	f
00030000-5556-0bb2-c528-3396ac5e2a5d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5556-0bb2-65d0-d2821faaebb6	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5556-0bb2-d1ca-50f8b2d02461	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5556-0bb2-5c78-ca6c6eb0c5d6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5556-0bb2-d2b2-2e2df430df3e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 3595222)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5556-0bb2-7f80-66e0d8c51659	00030000-5556-0bb2-26e7-a01188d8e229
00020000-5556-0bb2-3b90-3d2b5ec161de	00030000-5556-0bb2-337c-aa3f64b4942a
00020000-5556-0bb2-3b90-3d2b5ec161de	00030000-5556-0bb2-26e7-a01188d8e229
\.


--
-- TOC entry 2663 (class 0 OID 3595506)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3595536)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3595651)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3595280)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3595322)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5556-0bb1-8902-56b37eec8f9e	8341	Adlešiči
00050000-5556-0bb1-58d6-3999754201de	5270	Ajdovščina
00050000-5556-0bb1-a935-c5b2453564ad	6280	Ankaran/Ancarano
00050000-5556-0bb1-0731-c86783cecc83	9253	Apače
00050000-5556-0bb1-fbcd-55bc19bcff02	8253	Artiče
00050000-5556-0bb1-0f28-7e4d53b3f6b1	4275	Begunje na Gorenjskem
00050000-5556-0bb1-02b0-0141b35c24e2	1382	Begunje pri Cerknici
00050000-5556-0bb1-4c30-28c7a188eb6f	9231	Beltinci
00050000-5556-0bb1-77fa-8c825908e708	2234	Benedikt
00050000-5556-0bb1-a54b-7b7d14cfb43b	2345	Bistrica ob Dravi
00050000-5556-0bb1-fd4a-9bd5e9adbbbd	3256	Bistrica ob Sotli
00050000-5556-0bb1-c7f6-155b12adbee0	8259	Bizeljsko
00050000-5556-0bb1-6315-f6fe413dcad2	1223	Blagovica
00050000-5556-0bb1-d485-3b0b2387a9d0	8283	Blanca
00050000-5556-0bb1-ab46-81364630daaf	4260	Bled
00050000-5556-0bb1-3eb3-0e96e44ca351	4273	Blejska Dobrava
00050000-5556-0bb1-e960-3e06428a7690	9265	Bodonci
00050000-5556-0bb1-9dde-509b0435462e	9222	Bogojina
00050000-5556-0bb1-c51c-b61e1ac5d2ac	4263	Bohinjska Bela
00050000-5556-0bb1-70ec-7286a24bf7a1	4264	Bohinjska Bistrica
00050000-5556-0bb1-b088-53722e15a910	4265	Bohinjsko jezero
00050000-5556-0bb1-139d-d03df1233f47	1353	Borovnica
00050000-5556-0bb1-479c-88b2295d21cd	8294	Boštanj
00050000-5556-0bb1-2c1b-8baf67c99446	5230	Bovec
00050000-5556-0bb1-245c-8e8acd141927	5295	Branik
00050000-5556-0bb1-c0f7-95f2a8ab2d8a	3314	Braslovče
00050000-5556-0bb1-2efe-ef0db1b13c94	5223	Breginj
00050000-5556-0bb1-2a4b-3fd8b3a5cc22	8280	Brestanica
00050000-5556-0bb1-a63c-9bb74c9fd636	2354	Bresternica
00050000-5556-0bb1-b6b7-6ba307969b24	4243	Brezje
00050000-5556-0bb1-e025-c0ac65212c4b	1351	Brezovica pri Ljubljani
00050000-5556-0bb1-1250-7e8f7d122a6a	8250	Brežice
00050000-5556-0bb1-79b6-218f8c44f72a	4210	Brnik - Aerodrom
00050000-5556-0bb1-21da-64d50e2e7e63	8321	Brusnice
00050000-5556-0bb1-d964-1a61d74efe5a	3255	Buče
00050000-5556-0bb1-b8ed-9d117f7609fa	8276	Bučka 
00050000-5556-0bb1-13cd-9fe5a4ce81b3	9261	Cankova
00050000-5556-0bb1-06ec-61e8f2eb699a	3000	Celje 
00050000-5556-0bb1-f80c-dab6f35c4b54	3001	Celje - poštni predali
00050000-5556-0bb1-5e08-91ee66511ef1	4207	Cerklje na Gorenjskem
00050000-5556-0bb1-7004-fdeff853e323	8263	Cerklje ob Krki
00050000-5556-0bb1-e223-727de6c45e04	1380	Cerknica
00050000-5556-0bb1-f17a-6e797a35d465	5282	Cerkno
00050000-5556-0bb1-0c06-e8e97cf3cc50	2236	Cerkvenjak
00050000-5556-0bb1-1420-408dca04c7be	2215	Ceršak
00050000-5556-0bb1-2f6d-8e396f2a5f48	2326	Cirkovce
00050000-5556-0bb1-fce3-b00ef8ab54fc	2282	Cirkulane
00050000-5556-0bb1-efa6-e0ba3d75f7d5	5273	Col
00050000-5556-0bb1-ed3f-c2c04830805f	8251	Čatež ob Savi
00050000-5556-0bb1-2bcc-d4109c4dbf0b	1413	Čemšenik
00050000-5556-0bb1-683b-328a2eb8c6db	5253	Čepovan
00050000-5556-0bb1-d3d5-59e4abdac14c	9232	Črenšovci
00050000-5556-0bb1-e37e-99c173e60793	2393	Črna na Koroškem
00050000-5556-0bb1-47db-33ee3737e878	6275	Črni Kal
00050000-5556-0bb1-0293-33485a77d764	5274	Črni Vrh nad Idrijo
00050000-5556-0bb1-06dd-0931a1fa327d	5262	Črniče
00050000-5556-0bb1-96a4-e8c1332c900d	8340	Črnomelj
00050000-5556-0bb1-7a2c-a249fa96d0a0	6271	Dekani
00050000-5556-0bb1-6a60-4e76b10e75af	5210	Deskle
00050000-5556-0bb1-a0f8-4a809d15eb1b	2253	Destrnik
00050000-5556-0bb1-7f01-606589504b61	6215	Divača
00050000-5556-0bb1-9145-bcb1e99b84f1	1233	Dob
00050000-5556-0bb1-d8e6-c986be40563f	3224	Dobje pri Planini
00050000-5556-0bb1-7e4c-d118996e357e	8257	Dobova
00050000-5556-0bb1-966c-8b736431c9fd	1423	Dobovec
00050000-5556-0bb1-58d3-bb86b510db13	5263	Dobravlje
00050000-5556-0bb1-4b1b-f5b898b3bedb	3204	Dobrna
00050000-5556-0bb1-c280-6e8ca52d20cc	8211	Dobrnič
00050000-5556-0bb1-55ff-b5f7300aefc5	1356	Dobrova
00050000-5556-0bb1-ec22-aa7668ce3ec0	9223	Dobrovnik/Dobronak 
00050000-5556-0bb1-a279-a0402464f21b	5212	Dobrovo v Brdih
00050000-5556-0bb1-35e2-d580d6f98e8d	1431	Dol pri Hrastniku
00050000-5556-0bb1-96bf-5e97b217d3ff	1262	Dol pri Ljubljani
00050000-5556-0bb1-35a3-b85bdc9263a7	1273	Dole pri Litiji
00050000-5556-0bb1-bc3c-4bb1c3dac835	1331	Dolenja vas
00050000-5556-0bb1-f543-3a620a16d1b2	8350	Dolenjske Toplice
00050000-5556-0bb1-8068-94bd758212ee	1230	Domžale
00050000-5556-0bb1-cc0f-9de9ef8c0010	2252	Dornava
00050000-5556-0bb1-0c6a-ab4b03f7b233	5294	Dornberk
00050000-5556-0bb1-dbb8-a8dcadb0c9ae	1319	Draga
00050000-5556-0bb1-34fc-ccb9b9826e6e	8343	Dragatuš
00050000-5556-0bb1-3458-dc600d04ceb3	3222	Dramlje
00050000-5556-0bb1-8855-2fd61c532fce	2370	Dravograd
00050000-5556-0bb1-e905-1befd0bf9f54	4203	Duplje
00050000-5556-0bb1-c345-d7732c1dfd82	6221	Dutovlje
00050000-5556-0bb1-2b43-586f63752087	8361	Dvor
00050000-5556-0bb1-5640-f0b441e51813	2343	Fala
00050000-5556-0bb1-a62a-38525684177b	9208	Fokovci
00050000-5556-0bb1-ece5-e3527c24e570	2313	Fram
00050000-5556-0bb1-b631-9541310421df	3213	Frankolovo
00050000-5556-0bb1-554b-526e6758c99c	1274	Gabrovka
00050000-5556-0bb1-7eef-ea5dfa7b5e29	8254	Globoko
00050000-5556-0bb1-667c-256d04079a04	5275	Godovič
00050000-5556-0bb1-2bf7-6315e9e13bf3	4204	Golnik
00050000-5556-0bb1-1c62-460363be92bb	3303	Gomilsko
00050000-5556-0bb1-42ad-2636c727b51a	4224	Gorenja vas
00050000-5556-0bb1-7c50-e6b97b0e5be3	3263	Gorica pri Slivnici
00050000-5556-0bb1-91bb-e39e8edce8d3	2272	Gorišnica
00050000-5556-0bb1-42ce-d83990fc00fe	9250	Gornja Radgona
00050000-5556-0bb1-92b3-313a00f6ecbc	3342	Gornji Grad
00050000-5556-0bb1-0e56-77d9db3d43bc	4282	Gozd Martuljek
00050000-5556-0bb1-2f7b-ea3140e51e4b	6272	Gračišče
00050000-5556-0bb1-a53f-aee6fc640e56	9264	Grad
00050000-5556-0bb1-1e1e-1cecbb4e6e4a	8332	Gradac
00050000-5556-0bb1-5b22-08a8726b64a0	1384	Grahovo
00050000-5556-0bb1-6c47-1bd2d045a59f	5242	Grahovo ob Bači
00050000-5556-0bb1-6dd4-e0c66bd7500d	5251	Grgar
00050000-5556-0bb1-77f1-3f3dad5c8c4b	3302	Griže
00050000-5556-0bb1-6349-8d7362bfe9ef	3231	Grobelno
00050000-5556-0bb1-8706-ff942a0e1261	1290	Grosuplje
00050000-5556-0bb1-4954-e661c24af505	2288	Hajdina
00050000-5556-0bb1-b636-3ad347e69cd0	8362	Hinje
00050000-5556-0bb1-3b1c-c04a39b3b51a	2311	Hoče
00050000-5556-0bb1-c8b0-723edbdf5b91	9205	Hodoš/Hodos
00050000-5556-0bb1-e9f2-992bc474faf8	1354	Horjul
00050000-5556-0bb1-764b-dc1b3d00fdaa	1372	Hotedršica
00050000-5556-0bb1-a505-205fe4cd6061	1430	Hrastnik
00050000-5556-0bb1-d4ae-b2e0c861d1d1	6225	Hruševje
00050000-5556-0bb1-10d6-8a5c39c641ea	4276	Hrušica
00050000-5556-0bb1-9238-482e0592b367	5280	Idrija
00050000-5556-0bb1-0627-6e4936f00642	1292	Ig
00050000-5556-0bb1-f75a-c8a0de3c5a7d	6250	Ilirska Bistrica
00050000-5556-0bb1-ee8f-5ea74cca7ead	6251	Ilirska Bistrica-Trnovo
00050000-5556-0bb1-845c-9a0c3fce9aee	1295	Ivančna Gorica
00050000-5556-0bb1-b8fd-d2f8caf3b76c	2259	Ivanjkovci
00050000-5556-0bb1-fe0e-f64e56eabd86	1411	Izlake
00050000-5556-0bb1-45c3-2ccaeccfcc4c	6310	Izola/Isola
00050000-5556-0bb1-aa67-8da64d257092	2222	Jakobski Dol
00050000-5556-0bb1-484b-ebbc885df172	2221	Jarenina
00050000-5556-0bb1-2a77-8d27136cc9be	6254	Jelšane
00050000-5556-0bb1-5d72-ba16c988b32e	4270	Jesenice
00050000-5556-0bb1-6f62-65cfd7b734a8	8261	Jesenice na Dolenjskem
00050000-5556-0bb1-30aa-94f9842d061d	3273	Jurklošter
00050000-5556-0bb1-05c2-45c86bd416ee	2223	Jurovski Dol
00050000-5556-0bb1-9154-9b0eeaf4578a	2256	Juršinci
00050000-5556-0bb1-6f08-ba31a0725ca8	5214	Kal nad Kanalom
00050000-5556-0bb1-3835-08488c9b69c1	3233	Kalobje
00050000-5556-0bb1-c6e8-a96519545252	4246	Kamna Gorica
00050000-5556-0bb1-4e1f-6766dd28d74a	2351	Kamnica
00050000-5556-0bb1-1237-c88cab017c6b	1241	Kamnik
00050000-5556-0bb1-bc13-c3d9a6e2f3b3	5213	Kanal
00050000-5556-0bb1-fb7e-af66765d675a	8258	Kapele
00050000-5556-0bb1-f302-f8a2fd1e9b64	2362	Kapla
00050000-5556-0bb1-1cb4-861e6040ffa2	2325	Kidričevo
00050000-5556-0bb1-66ce-a9c24fc15973	1412	Kisovec
00050000-5556-0bb1-dd5e-dcb21d586b33	6253	Knežak
00050000-5556-0bb1-b6df-8d52a76e8346	5222	Kobarid
00050000-5556-0bb1-095c-5604bcf1218c	9227	Kobilje
00050000-5556-0bb1-e878-4b04038be2ab	1330	Kočevje
00050000-5556-0bb1-45b7-7c1a4f1a68cc	1338	Kočevska Reka
00050000-5556-0bb1-c723-869119f773b4	2276	Kog
00050000-5556-0bb1-dfee-3b5294debb42	5211	Kojsko
00050000-5556-0bb1-ad91-2a3ea4550a6c	6223	Komen
00050000-5556-0bb1-83dc-bd38f0ac97a5	1218	Komenda
00050000-5556-0bb1-9d6f-fd7176eefb71	6000	Koper/Capodistria 
00050000-5556-0bb1-eb2d-e3ea95b3b727	6001	Koper/Capodistria - poštni predali
00050000-5556-0bb1-ceec-bccf20677ab8	8282	Koprivnica
00050000-5556-0bb1-380c-c1616a4b54cb	5296	Kostanjevica na Krasu
00050000-5556-0bb1-a087-a33a23f80d56	8311	Kostanjevica na Krki
00050000-5556-0bb1-9c57-0cd8db696f83	1336	Kostel
00050000-5556-0bb1-6fd2-6167d02ded3b	6256	Košana
00050000-5556-0bb1-e61b-ac5c242cb54d	2394	Kotlje
00050000-5556-0bb1-dc05-fdfbc4f62c37	6240	Kozina
00050000-5556-0bb1-7996-e82cfc5ce99f	3260	Kozje
00050000-5556-0bb1-516e-1b160c4b772e	4000	Kranj 
00050000-5556-0bb1-ca64-15edd1b5940a	4001	Kranj - poštni predali
00050000-5556-0bb1-7d68-b1c4a015d91a	4280	Kranjska Gora
00050000-5556-0bb1-c163-59b0d89caba1	1281	Kresnice
00050000-5556-0bb1-5824-a3f274fb4a6a	4294	Križe
00050000-5556-0bb1-8422-8bd090dda3c8	9206	Križevci
00050000-5556-0bb1-d622-8c10e0505489	9242	Križevci pri Ljutomeru
00050000-5556-0bb1-f5eb-565ece87190f	1301	Krka
00050000-5556-0bb1-3127-3487b44e4253	8296	Krmelj
00050000-5556-0bb1-fb1c-84c128981907	4245	Kropa
00050000-5556-0bb1-b8c3-f99141e8c0a3	8262	Krška vas
00050000-5556-0bb1-5256-de80c0c9c958	8270	Krško
00050000-5556-0bb1-f01f-a08298227454	9263	Kuzma
00050000-5556-0bb1-7e0b-05a801198987	2318	Laporje
00050000-5556-0bb1-5a85-7845a24d1760	3270	Laško
00050000-5556-0bb1-1e8f-cee79d7af552	1219	Laze v Tuhinju
00050000-5556-0bb1-ecda-2bcf628c0c13	2230	Lenart v Slovenskih goricah
00050000-5556-0bb1-e95a-9bdef7ba4137	9220	Lendava/Lendva
00050000-5556-0bb1-4a84-c221dacc449d	4248	Lesce
00050000-5556-0bb1-d4ee-45c8eddde557	3261	Lesično
00050000-5556-0bb1-2563-88538c507929	8273	Leskovec pri Krškem
00050000-5556-0bb1-aa27-cd290d6c40b1	2372	Libeliče
00050000-5556-0bb1-97cf-5ad049d7b03f	2341	Limbuš
00050000-5556-0bb1-ad18-c63288404ca3	1270	Litija
00050000-5556-0bb1-cc40-59dd0fc15e1c	3202	Ljubečna
00050000-5556-0bb1-5691-b6b6ba577739	1000	Ljubljana 
00050000-5556-0bb1-8518-e77fa34a2a4d	1001	Ljubljana - poštni predali
00050000-5556-0bb1-c0e7-a3249added0a	1231	Ljubljana - Črnuče
00050000-5556-0bb1-527d-9ba65cf87a16	1261	Ljubljana - Dobrunje
00050000-5556-0bb1-49ee-a8fbd404e264	1260	Ljubljana - Polje
00050000-5556-0bb1-941c-a5ffceac199f	1210	Ljubljana - Šentvid
00050000-5556-0bb1-8c8a-2445729b9ffe	1211	Ljubljana - Šmartno
00050000-5556-0bb1-ea4a-7d5c0e8dac71	3333	Ljubno ob Savinji
00050000-5556-0bb1-670c-3e2b402bd66c	9240	Ljutomer
00050000-5556-0bb1-dc55-f84d6812e3ca	3215	Loče
00050000-5556-0bb1-0ffc-5ac19a170f19	5231	Log pod Mangartom
00050000-5556-0bb1-abf4-f2d4432bed22	1358	Log pri Brezovici
00050000-5556-0bb1-9950-9bab3dba9e3e	1370	Logatec
00050000-5556-0bb1-7924-7e715661d111	1371	Logatec
00050000-5556-0bb1-6734-d48cef64f462	1434	Loka pri Zidanem Mostu
00050000-5556-0bb1-34e7-e2d8a512e797	3223	Loka pri Žusmu
00050000-5556-0bb1-55e0-70a69f7f5fc2	6219	Lokev
00050000-5556-0bb1-c85d-c33c3b0a5dd7	1318	Loški Potok
00050000-5556-0bb1-dbf4-7c738044c651	2324	Lovrenc na Dravskem polju
00050000-5556-0bb1-3a9b-6a793e0b4130	2344	Lovrenc na Pohorju
00050000-5556-0bb1-3b10-9961106da18d	3334	Luče
00050000-5556-0bb1-da5e-f36e805b53a1	1225	Lukovica
00050000-5556-0bb1-ce49-6338f15becb8	9202	Mačkovci
00050000-5556-0bb1-d2ae-43714e57b18c	2322	Majšperk
00050000-5556-0bb1-82d6-8b1d4ebf352f	2321	Makole
00050000-5556-0bb1-0eae-a0f5a3686eb9	9243	Mala Nedelja
00050000-5556-0bb1-debd-ff3da126d735	2229	Malečnik
00050000-5556-0bb1-99a1-ec6a2892bb07	6273	Marezige
00050000-5556-0bb1-7271-3d0025a28812	2000	Maribor 
00050000-5556-0bb1-64c6-64240263933c	2001	Maribor - poštni predali
00050000-5556-0bb1-af91-8952dd88e814	2206	Marjeta na Dravskem polju
00050000-5556-0bb1-6453-400cb02c1b8a	2281	Markovci
00050000-5556-0bb1-cd5d-31d12b572139	9221	Martjanci
00050000-5556-0bb1-f2dc-8294f6c87294	6242	Materija
00050000-5556-0bb1-a8c6-8973acec412e	4211	Mavčiče
00050000-5556-0bb1-0702-bfcb69d8dfdf	1215	Medvode
00050000-5556-0bb1-9233-0ca0f7e6d5f0	1234	Mengeš
00050000-5556-0bb1-a2ed-c13872c3d729	8330	Metlika
00050000-5556-0bb1-f466-d794d8445c11	2392	Mežica
00050000-5556-0bb1-6201-396a4f1a3453	2204	Miklavž na Dravskem polju
00050000-5556-0bb1-0ebb-54a0bcb158ef	2275	Miklavž pri Ormožu
00050000-5556-0bb1-d1ee-ac506d77ebc8	5291	Miren
00050000-5556-0bb1-ed9f-668f52f790fa	8233	Mirna
00050000-5556-0bb1-3ae5-a0896fd1b38e	8216	Mirna Peč
00050000-5556-0bb1-54b9-ff52a5c1fdb0	2382	Mislinja
00050000-5556-0bb1-dca7-041de54eb37a	4281	Mojstrana
00050000-5556-0bb1-ec4e-f6def6471f45	8230	Mokronog
00050000-5556-0bb1-68d4-c83dc85a4236	1251	Moravče
00050000-5556-0bb1-480b-b1436ce3f3c9	9226	Moravske Toplice
00050000-5556-0bb1-9c6b-5202d1dde06b	5216	Most na Soči
00050000-5556-0bb1-2344-61a0a47831a1	1221	Motnik
00050000-5556-0bb1-8d53-249b0afbcf0f	3330	Mozirje
00050000-5556-0bb1-d976-58cb2c633a9b	9000	Murska Sobota 
00050000-5556-0bb1-8797-89ca0bd99477	9001	Murska Sobota - poštni predali
00050000-5556-0bb1-a854-89d7250e69f7	2366	Muta
00050000-5556-0bb1-47ea-43c30f9b9725	4202	Naklo
00050000-5556-0bb1-0627-9584d3b925e4	3331	Nazarje
00050000-5556-0bb1-9440-f870f7c7ab6d	1357	Notranje Gorice
00050000-5556-0bb1-d42a-398f7689c19a	3203	Nova Cerkev
00050000-5556-0bb1-4580-04af75d333d0	5000	Nova Gorica 
00050000-5556-0bb1-1467-bc695b3c4e5a	5001	Nova Gorica - poštni predali
00050000-5556-0bb1-4ee6-8d37780203fb	1385	Nova vas
00050000-5556-0bb1-bce9-67195b955534	8000	Novo mesto
00050000-5556-0bb1-e076-6a35138f9c9a	8001	Novo mesto - poštni predali
00050000-5556-0bb1-41aa-7be517aee3af	6243	Obrov
00050000-5556-0bb1-1344-0eb6c2c8e110	9233	Odranci
00050000-5556-0bb1-45da-d33ee7040291	2317	Oplotnica
00050000-5556-0bb1-ca7f-088273e5e1cb	2312	Orehova vas
00050000-5556-0bb1-02f6-db995d6b943c	2270	Ormož
00050000-5556-0bb1-59a5-e3d439d3ad2f	1316	Ortnek
00050000-5556-0bb1-aaf7-5320310a6ba0	1337	Osilnica
00050000-5556-0bb1-dd15-2e1bd2785d29	8222	Otočec
00050000-5556-0bb1-126b-f6b7e9a6f404	2361	Ožbalt
00050000-5556-0bb1-2678-55fff9c589b8	2231	Pernica
00050000-5556-0bb1-e592-a6bc419cc708	2211	Pesnica pri Mariboru
00050000-5556-0bb1-457e-b4d857d7a671	9203	Petrovci
00050000-5556-0bb1-7002-6dcf77ace8bd	3301	Petrovče
00050000-5556-0bb1-457b-bd9c19578cfd	6330	Piran/Pirano
00050000-5556-0bb1-5617-59bf4b354c0f	8255	Pišece
00050000-5556-0bb1-40f8-8c2ffb919df3	6257	Pivka
00050000-5556-0bb1-5599-a9662f42276b	6232	Planina
00050000-5556-0bb1-4870-8dfe726117b9	3225	Planina pri Sevnici
00050000-5556-0bb1-4770-c0dfcce31ac0	6276	Pobegi
00050000-5556-0bb1-d143-2a38639523f1	8312	Podbočje
00050000-5556-0bb1-a3d0-c13cf29edd62	5243	Podbrdo
00050000-5556-0bb1-8265-445f32998dd0	3254	Podčetrtek
00050000-5556-0bb1-7c36-9e1a25f8f8aa	2273	Podgorci
00050000-5556-0bb1-5506-18820e718cf4	6216	Podgorje
00050000-5556-0bb1-07b0-27404bebecd4	2381	Podgorje pri Slovenj Gradcu
00050000-5556-0bb1-5694-f40229dad729	6244	Podgrad
00050000-5556-0bb1-de05-e30d81c49305	1414	Podkum
00050000-5556-0bb1-feb7-7ffbbe3e69fc	2286	Podlehnik
00050000-5556-0bb1-2e0b-996fd137ffac	5272	Podnanos
00050000-5556-0bb1-4bf4-af9ac692bef8	4244	Podnart
00050000-5556-0bb1-d19d-bd493f8c6b97	3241	Podplat
00050000-5556-0bb1-f52b-5e4c65dd8f2e	3257	Podsreda
00050000-5556-0bb1-a67a-69015f91e367	2363	Podvelka
00050000-5556-0bb1-fae4-891ece523639	2208	Pohorje
00050000-5556-0bb1-fbbd-fa9e2ad38fd2	2257	Polenšak
00050000-5556-0bb1-0a48-1480c8a02de2	1355	Polhov Gradec
00050000-5556-0bb1-2844-b47dc73d4ce8	4223	Poljane nad Škofjo Loko
00050000-5556-0bb1-2bc2-ef417b14b826	2319	Poljčane
00050000-5556-0bb1-f01b-987c36d44e93	1272	Polšnik
00050000-5556-0bb1-89db-8de069ae1025	3313	Polzela
00050000-5556-0bb1-b66e-98efd8e6e195	3232	Ponikva
00050000-5556-0bb1-381d-af659a4e937b	6320	Portorož/Portorose
00050000-5556-0bb1-a6b9-7f572a3224cc	6230	Postojna
00050000-5556-0bb1-d8e9-7d888ff89897	2331	Pragersko
00050000-5556-0bb1-5282-3743ca0ff56f	3312	Prebold
00050000-5556-0bb1-b288-4f54d562e193	4205	Preddvor
00050000-5556-0bb1-8262-34cfe7c66833	6255	Prem
00050000-5556-0bb1-2939-d67020a61f1f	1352	Preserje
00050000-5556-0bb1-9ae7-1e89f18a9be7	6258	Prestranek
00050000-5556-0bb1-7d35-9d894aa968d6	2391	Prevalje
00050000-5556-0bb1-0406-059bbffb5b7f	3262	Prevorje
00050000-5556-0bb1-52f0-f06b59dc4ed2	1276	Primskovo 
00050000-5556-0bb1-0305-0a6c0d0c9d2f	3253	Pristava pri Mestinju
00050000-5556-0bb1-e605-4acf1a30a499	9207	Prosenjakovci/Partosfalva
00050000-5556-0bb1-7c2d-b7d29835321e	5297	Prvačina
00050000-5556-0bb1-3696-b8eae2400754	2250	Ptuj
00050000-5556-0bb1-a1c1-064ce9b23157	2323	Ptujska Gora
00050000-5556-0bb1-79b1-3a9eed781546	9201	Puconci
00050000-5556-0bb1-a0bd-5d769fbd1e49	2327	Rače
00050000-5556-0bb1-aa6d-59fbda542242	1433	Radeče
00050000-5556-0bb1-50f0-0b9e9da44419	9252	Radenci
00050000-5556-0bb1-ed1e-a568f4c1475e	2360	Radlje ob Dravi
00050000-5556-0bb1-c369-2850093bbf9e	1235	Radomlje
00050000-5556-0bb1-19d1-210b990c94f3	4240	Radovljica
00050000-5556-0bb1-d4d7-3ccf20409bef	8274	Raka
00050000-5556-0bb1-55e5-124daa15e0b9	1381	Rakek
00050000-5556-0bb1-54d3-98ffb9034a6a	4283	Rateče - Planica
00050000-5556-0bb1-dcc1-01b97e4a7aeb	2390	Ravne na Koroškem
00050000-5556-0bb1-b2ef-8cd297f1772a	9246	Razkrižje
00050000-5556-0bb1-7bf3-37cd71c3b730	3332	Rečica ob Savinji
00050000-5556-0bb1-c3e5-865e6942b097	5292	Renče
00050000-5556-0bb1-1a26-b1cabe42bade	1310	Ribnica
00050000-5556-0bb1-736b-e33a26df8e8e	2364	Ribnica na Pohorju
00050000-5556-0bb1-b83e-e8d94bb92895	3272	Rimske Toplice
00050000-5556-0bb1-8c8c-082c27ef20c9	1314	Rob
00050000-5556-0bb1-e9b7-d03aa3e45ed8	5215	Ročinj
00050000-5556-0bb1-2db3-c5ddb5951aba	3250	Rogaška Slatina
00050000-5556-0bb1-f22b-3a467cba4f13	9262	Rogašovci
00050000-5556-0bb1-ab2a-3531a9698229	3252	Rogatec
00050000-5556-0bb1-9fe1-468e102f9045	1373	Rovte
00050000-5556-0bb1-e567-3b2079e53163	2342	Ruše
00050000-5556-0bb1-2923-ac7406918e88	1282	Sava
00050000-5556-0bb1-6a63-b1508f7cff82	6333	Sečovlje/Sicciole
00050000-5556-0bb1-e16c-14543b4e2a3f	4227	Selca
00050000-5556-0bb1-f4ab-4c464d441bb3	2352	Selnica ob Dravi
00050000-5556-0bb1-b750-08492c16f9fa	8333	Semič
00050000-5556-0bb1-8844-6633dee21414	8281	Senovo
00050000-5556-0bb1-7d7a-3cbac35dbb36	6224	Senožeče
00050000-5556-0bb1-5829-9d7a0fa612fa	8290	Sevnica
00050000-5556-0bb1-c94a-18b7b9572512	6210	Sežana
00050000-5556-0bb1-6dc9-c44f71583478	2214	Sladki Vrh
00050000-5556-0bb1-86eb-7dd305dbcf24	5283	Slap ob Idrijci
00050000-5556-0bb1-a41e-61c3a4772eb1	2380	Slovenj Gradec
00050000-5556-0bb1-91ec-c2101b56aaf3	2310	Slovenska Bistrica
00050000-5556-0bb1-e6b9-2f12457508e8	3210	Slovenske Konjice
00050000-5556-0bb1-14d3-7ba5d230e283	1216	Smlednik
00050000-5556-0bb1-c75b-797e86dd8a5f	5232	Soča
00050000-5556-0bb1-2554-73d3b829ab16	1317	Sodražica
00050000-5556-0bb1-e20d-60a55a1495d7	3335	Solčava
00050000-5556-0bb1-c896-b989915753d4	5250	Solkan
00050000-5556-0bb1-8d32-acbf6a06ccf3	4229	Sorica
00050000-5556-0bb1-82f0-52927e74d2c0	4225	Sovodenj
00050000-5556-0bb1-82ad-6bf89dcc1255	5281	Spodnja Idrija
00050000-5556-0bb1-9a74-dcc611371149	2241	Spodnji Duplek
00050000-5556-0bb1-ffe9-e5677c46a7fa	9245	Spodnji Ivanjci
00050000-5556-0bb1-f841-3785384edf23	2277	Središče ob Dravi
00050000-5556-0bb1-7c7f-92329fa02482	4267	Srednja vas v Bohinju
00050000-5556-0bb1-63a1-8dc9f88fc13d	8256	Sromlje 
00050000-5556-0bb1-0bd3-d249c9c71863	5224	Srpenica
00050000-5556-0bb1-daf7-18e4d5874be5	1242	Stahovica
00050000-5556-0bb1-e172-138124cf3fba	1332	Stara Cerkev
00050000-5556-0bb1-772b-0c61deeff1ee	8342	Stari trg ob Kolpi
00050000-5556-0bb1-93d8-dedd8e00c8cd	1386	Stari trg pri Ložu
00050000-5556-0bb1-d38d-4e7180ad3337	2205	Starše
00050000-5556-0bb1-65de-3808093a87bc	2289	Stoperce
00050000-5556-0bb1-5313-7885ca50366d	8322	Stopiče
00050000-5556-0bb1-5737-3b65ca84aa6d	3206	Stranice
00050000-5556-0bb1-01b5-69cb485090ec	8351	Straža
00050000-5556-0bb1-83d2-5fda9063e305	1313	Struge
00050000-5556-0bb1-e5e5-3fac8fdf5739	8293	Studenec
00050000-5556-0bb1-131c-ca682df19645	8331	Suhor
00050000-5556-0bb1-fff0-28874e048fc3	2233	Sv. Ana v Slovenskih goricah
00050000-5556-0bb1-6de5-ada528e81ecd	2235	Sv. Trojica v Slovenskih goricah
00050000-5556-0bb1-c2ef-cc950637f81f	2353	Sveti Duh na Ostrem Vrhu
00050000-5556-0bb1-5eff-330d95dcbcf3	9244	Sveti Jurij ob Ščavnici
00050000-5556-0bb1-7f01-304f6181abd1	3264	Sveti Štefan
00050000-5556-0bb1-eee2-18a128ca3a41	2258	Sveti Tomaž
00050000-5556-0bb1-8d29-2bc5cd728553	9204	Šalovci
00050000-5556-0bb1-90d4-7403f95e5b55	5261	Šempas
00050000-5556-0bb1-0f4b-5c29ae394b06	5290	Šempeter pri Gorici
00050000-5556-0bb1-3e44-202558d51fbb	3311	Šempeter v Savinjski dolini
00050000-5556-0bb1-1f2c-d982912c9e5b	4208	Šenčur
00050000-5556-0bb1-62de-f48d75330709	2212	Šentilj v Slovenskih goricah
00050000-5556-0bb1-20dd-c3d188569c33	8297	Šentjanž
00050000-5556-0bb1-0172-aa203e7ed73d	2373	Šentjanž pri Dravogradu
00050000-5556-0bb1-03ef-f48b02e71e32	8310	Šentjernej
00050000-5556-0bb1-f305-0de199d0d2a6	3230	Šentjur
00050000-5556-0bb1-db3e-882eef8ce2b0	3271	Šentrupert
00050000-5556-0bb1-8e51-e06ea6295cd2	8232	Šentrupert
00050000-5556-0bb1-d6fb-e1b2dfbbc30e	1296	Šentvid pri Stični
00050000-5556-0bb1-1fd9-1e1a364001d1	8275	Škocjan
00050000-5556-0bb1-b936-771a19b5b154	6281	Škofije
00050000-5556-0bb1-8d2e-9d0496c1a00c	4220	Škofja Loka
00050000-5556-0bb1-0fbd-ea8fd855e795	3211	Škofja vas
00050000-5556-0bb1-b509-39047382ff5c	1291	Škofljica
00050000-5556-0bb1-66be-979cc2ea4837	6274	Šmarje
00050000-5556-0bb1-ac15-29d9e288cbe3	1293	Šmarje - Sap
00050000-5556-0bb1-d532-9f5e23da57eb	3240	Šmarje pri Jelšah
00050000-5556-0bb1-1557-6bcded66300b	8220	Šmarješke Toplice
00050000-5556-0bb1-d993-692a1d9b9483	2315	Šmartno na Pohorju
00050000-5556-0bb1-69f5-e7f2ac34de1d	3341	Šmartno ob Dreti
00050000-5556-0bb1-feb1-68ed1b3996f6	3327	Šmartno ob Paki
00050000-5556-0bb1-a64b-f6ffe5c19713	1275	Šmartno pri Litiji
00050000-5556-0bb1-202d-642cf89e46ec	2383	Šmartno pri Slovenj Gradcu
00050000-5556-0bb1-c845-374db43bc701	3201	Šmartno v Rožni dolini
00050000-5556-0bb1-08ba-115a8dc26b28	3325	Šoštanj
00050000-5556-0bb1-46ac-af0c7bafdb66	6222	Štanjel
00050000-5556-0bb1-f187-62a35bf8dfe4	3220	Štore
00050000-5556-0bb1-ad8d-667b8e53c23c	3304	Tabor
00050000-5556-0bb1-ebfa-096943dbfee5	3221	Teharje
00050000-5556-0bb1-f76b-8cfe8c49824f	9251	Tišina
00050000-5556-0bb1-8491-197c08a2a3b9	5220	Tolmin
00050000-5556-0bb1-da02-afb2d0c69e6d	3326	Topolšica
00050000-5556-0bb1-c2ec-dfe122359f88	2371	Trbonje
00050000-5556-0bb1-60a2-33f0d2030b6e	1420	Trbovlje
00050000-5556-0bb1-d5be-fa38d5bb03a5	8231	Trebelno 
00050000-5556-0bb1-885f-efc81e4cdcc3	8210	Trebnje
00050000-5556-0bb1-eaaa-d46285f3ae5e	5252	Trnovo pri Gorici
00050000-5556-0bb1-d2bf-7193c1be6bf6	2254	Trnovska vas
00050000-5556-0bb1-0780-f835de0872bd	1222	Trojane
00050000-5556-0bb1-9971-cd6c217f0992	1236	Trzin
00050000-5556-0bb1-f491-31547576625d	4290	Tržič
00050000-5556-0bb1-acbc-cd29ffd1addb	8295	Tržišče
00050000-5556-0bb1-db3a-2258adb7c4e4	1311	Turjak
00050000-5556-0bb1-3102-d2e563ba8174	9224	Turnišče
00050000-5556-0bb1-a9e8-7b73374896f4	8323	Uršna sela
00050000-5556-0bb1-208c-efb0a91001e1	1252	Vače
00050000-5556-0bb1-768c-e3d7dc60ab62	3320	Velenje 
00050000-5556-0bb1-c1ed-8ab1d084f942	3322	Velenje - poštni predali
00050000-5556-0bb1-092b-f65e8dda736d	8212	Velika Loka
00050000-5556-0bb1-2e20-41b48a132de7	2274	Velika Nedelja
00050000-5556-0bb1-4196-ba9a4386038a	9225	Velika Polana
00050000-5556-0bb1-385a-422e380603ed	1315	Velike Lašče
00050000-5556-0bb1-3223-bd5256fbaef8	8213	Veliki Gaber
00050000-5556-0bb1-e23e-8bf648abe272	9241	Veržej
00050000-5556-0bb1-4169-54e38c030f8a	1312	Videm - Dobrepolje
00050000-5556-0bb1-798e-9369897e72f1	2284	Videm pri Ptuju
00050000-5556-0bb1-f28f-f9ca31cdf7dd	8344	Vinica
00050000-5556-0bb1-fa55-c9bb95615f97	5271	Vipava
00050000-5556-0bb1-8ddd-74559fa27875	4212	Visoko
00050000-5556-0bb1-5ca3-bac9d0f3a9a1	1294	Višnja Gora
00050000-5556-0bb1-c95e-4db4e31f82b4	3205	Vitanje
00050000-5556-0bb1-00ab-106169e05345	2255	Vitomarci
00050000-5556-0bb1-dc29-d91de778642e	1217	Vodice
00050000-5556-0bb1-43c9-bcf262e79e9b	3212	Vojnik\t
00050000-5556-0bb1-2d63-e81e2e093fd7	5293	Volčja Draga
00050000-5556-0bb1-60e3-1f2212cdbc3e	2232	Voličina
00050000-5556-0bb1-8037-cf389a182d2c	3305	Vransko
00050000-5556-0bb1-8f9b-79eedaf9e7dc	6217	Vremski Britof
00050000-5556-0bb1-8733-8fe130a91f95	1360	Vrhnika
00050000-5556-0bb1-3ed2-206d9d6b4655	2365	Vuhred
00050000-5556-0bb1-ee50-070f02b217ee	2367	Vuzenica
00050000-5556-0bb1-16a1-fd5350806b6a	8292	Zabukovje 
00050000-5556-0bb1-9999-a1978ceab4c9	1410	Zagorje ob Savi
00050000-5556-0bb1-7b85-d74de47134e4	1303	Zagradec
00050000-5556-0bb1-618e-3a8688ee4140	2283	Zavrč
00050000-5556-0bb1-6ed8-f0d21b80ad07	8272	Zdole 
00050000-5556-0bb1-a81b-da436f4b0b27	4201	Zgornja Besnica
00050000-5556-0bb1-d6f7-ac54b7962737	2242	Zgornja Korena
00050000-5556-0bb1-0238-c2d4e8eafd0e	2201	Zgornja Kungota
00050000-5556-0bb1-6aef-d79f4b5b278f	2316	Zgornja Ložnica
00050000-5556-0bb1-b4eb-572bc14a3d60	2314	Zgornja Polskava
00050000-5556-0bb1-2f4c-48204385c1cc	2213	Zgornja Velka
00050000-5556-0bb1-0763-84c40eec9d0c	4247	Zgornje Gorje
00050000-5556-0bb1-86d9-2a6480b5ae7f	4206	Zgornje Jezersko
00050000-5556-0bb1-8d25-3e8cf252f325	2285	Zgornji Leskovec
00050000-5556-0bb1-3e30-6d09492de8ff	1432	Zidani Most
00050000-5556-0bb1-4c34-dff56e0542a7	3214	Zreče
00050000-5556-0bb1-81d5-772a95c3811d	4209	Žabnica
00050000-5556-0bb1-e799-bcdd41f2bb17	3310	Žalec
00050000-5556-0bb1-c0c2-9c084bb8070b	4228	Železniki
00050000-5556-0bb1-5575-7ed31fcc6a6b	2287	Žetale
00050000-5556-0bb1-c1c0-3365972119cf	4226	Žiri
00050000-5556-0bb1-92e0-b7a33ea99e14	4274	Žirovnica
00050000-5556-0bb1-f9fa-b582c5d30b9d	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 3595480)
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
-- TOC entry 2642 (class 0 OID 3595307)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3595373)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3595492)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3595597)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3595644)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3595521)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3595465)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3595455)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3595634)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3595587)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 3595174)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5556-0bb2-dfbe-2984ba55167d	00010000-5556-0bb2-781e-fd3bc9cd48c1	2015-05-15 17:07:30	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROOfRgY6eX8O/j5/b6CIFs6MlAojr6.Y2";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 3595530)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3595212)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5556-0bb2-4402-8118489f2cc2	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5556-0bb2-fae7-26ba290a3b55	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5556-0bb2-7f80-66e0d8c51659	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5556-0bb2-5eac-eaaa7b77a714	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5556-0bb2-161c-7f496421d30f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5556-0bb2-3b90-3d2b5ec161de	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 3595196)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5556-0bb2-dfbe-2984ba55167d	00020000-5556-0bb2-5eac-eaaa7b77a714
00010000-5556-0bb2-781e-fd3bc9cd48c1	00020000-5556-0bb2-5eac-eaaa7b77a714
\.


--
-- TOC entry 2668 (class 0 OID 3595544)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3595486)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3595436)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3595272)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3595442)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3595622)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3595342)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3595183)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5556-0bb2-781e-fd3bc9cd48c1	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROCkZFmNBKG0AYle5yeQvU6u45Mpfp72e	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5556-0bb2-dfbe-2984ba55167d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 3595676)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3595388)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3595513)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3595579)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3595420)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3595666)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3595569)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 3595237)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3595716)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 3595709)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 3595621)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 3595410)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 3595435)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 3595368)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 3595565)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 3595386)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 3595429)
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
-- TOC entry 2364 (class 2606 OID 3595478)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 3595505)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 3595340)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 3595246)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 3595304)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 3595270)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 3595226)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 3595211)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 3595511)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 3595543)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 3595661)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 3595297)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 3595328)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3595484)
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
-- TOC entry 2298 (class 2606 OID 3595318)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 3595377)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3595496)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3595603)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3595649)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 3595528)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 3595469)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 3595460)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3595643)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3595594)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 3595182)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3595534)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3595200)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 3595220)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 3595552)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 3595491)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 3595441)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 3595277)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 3595451)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3595633)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 3595353)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 3595195)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 3595691)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3595395)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 3595519)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 3595585)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 3595424)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 3595675)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 3595578)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 3595417)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 3595299)
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
-- TOC entry 2377 (class 1259 OID 3595512)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 3595498)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 3595497)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 3595396)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 3595568)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 3595566)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 3595567)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 3595663)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 3595664)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 3595665)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 3595694)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 3595693)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 3595692)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 3595355)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 3595354)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 3595306)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 3595305)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 3595535)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 3595430)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 3595227)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 3595228)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 3595555)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 3595554)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 3595553)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 3595378)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 3595380)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 3595379)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 3595464)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 3595462)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 3595461)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 3595463)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 3595201)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 3595202)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 3595520)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 3595485)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 3595595)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 3595596)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 3595320)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3595319)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2296 (class 1259 OID 3595321)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 3595604)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 3595605)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 3595719)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 3595718)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 3595721)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 3595717)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 3595720)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 3595586)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 3595473)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 3595472)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 3595470)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 3595471)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 3595711)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 3595710)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 3595387)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 3595248)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 3595247)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 3595278)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 3595279)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 3595454)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 3595453)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 3595452)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 3595419)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 3595415)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 3595412)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 3595413)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 3595411)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 3595416)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 3595414)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 3595298)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 3595369)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3595371)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 3595370)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 3595372)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 3595479)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 3595662)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 3595271)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 3595341)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 3595529)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 3595329)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 3595650)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 3595221)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 3595418)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 3595852)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 3595837)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 3595842)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 3595862)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 3595832)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 3595857)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 3595847)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 3595767)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 3595947)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 3595942)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 3595937)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 3595827)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 3595987)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 3595977)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3595982)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 3595927)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 3596022)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 3596027)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 3596032)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 3596047)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 3596042)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 3596037)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 3595802)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 3595797)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3595777)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3595772)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 3595752)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 3595957)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 3595867)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 3595732)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 3595737)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 3595972)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 3595967)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 3595962)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 3595807)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3595817)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 3595812)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 3595902)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 3595892)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 3595887)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 3595897)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 3595722)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 3595727)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 3595952)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 3595932)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 3595997)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 3596002)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 3595787)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 3595782)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 3595792)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 3596007)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 3596012)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 3596072)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 3596067)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 3596082)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 3596062)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 3596077)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 3595992)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 3595922)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 3595917)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 3595907)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 3595912)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 3596057)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 3596052)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 3595822)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3596017)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 3595747)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 3595742)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 3595757)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 3595762)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 3595882)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 3595877)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 3595872)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-15 17:07:30 CEST

--
-- PostgreSQL database dump complete
--

