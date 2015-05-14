--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-14 13:38:01 CEST

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
-- TOC entry 179 (class 1259 OID 3392501)
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
-- TOC entry 225 (class 1259 OID 3392984)
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
-- TOC entry 224 (class 1259 OID 3392967)
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
-- TOC entry 217 (class 1259 OID 3392878)
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
-- TOC entry 193 (class 1259 OID 3392669)
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
-- TOC entry 196 (class 1259 OID 3392703)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3392628)
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
-- TOC entry 212 (class 1259 OID 3392828)
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
-- TOC entry 191 (class 1259 OID 3392653)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3392697)
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
-- TOC entry 201 (class 1259 OID 3392746)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3392771)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3392602)
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
-- TOC entry 180 (class 1259 OID 3392510)
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
-- TOC entry 181 (class 1259 OID 3392521)
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
-- TOC entry 184 (class 1259 OID 3392572)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3392475)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3392494)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3392778)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3392808)
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
-- TOC entry 221 (class 1259 OID 3392923)
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
-- TOC entry 183 (class 1259 OID 3392552)
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
-- TOC entry 186 (class 1259 OID 3392594)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3392752)
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
-- TOC entry 185 (class 1259 OID 3392579)
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
-- TOC entry 190 (class 1259 OID 3392645)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3392764)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3392869)
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
-- TOC entry 220 (class 1259 OID 3392916)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3392793)
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
-- TOC entry 200 (class 1259 OID 3392737)
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
-- TOC entry 199 (class 1259 OID 3392727)
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
-- TOC entry 219 (class 1259 OID 3392906)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3392859)
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
-- TOC entry 173 (class 1259 OID 3392446)
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
-- TOC entry 172 (class 1259 OID 3392444)
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
-- TOC entry 209 (class 1259 OID 3392802)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3392484)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3392468)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3392816)
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
-- TOC entry 203 (class 1259 OID 3392758)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3392708)
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
-- TOC entry 182 (class 1259 OID 3392544)
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
-- TOC entry 198 (class 1259 OID 3392714)
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
-- TOC entry 218 (class 1259 OID 3392894)
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
-- TOC entry 188 (class 1259 OID 3392614)
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
-- TOC entry 174 (class 1259 OID 3392455)
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
-- TOC entry 223 (class 1259 OID 3392948)
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
-- TOC entry 192 (class 1259 OID 3392660)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 3392785)
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
-- TOC entry 214 (class 1259 OID 3392851)
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
-- TOC entry 194 (class 1259 OID 3392692)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 3392938)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3392841)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3392449)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 3392501)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3392984)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3392967)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3392878)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3392669)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3392703)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3392628)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5554-8918-15fc-eba4ae36e8ee	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5554-8918-7b19-d4a7c046ddf6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5554-8918-3bf6-d2a3cb400b6b	AL	ALB	008	Albania 	Albanija	\N
00040000-5554-8918-ca2c-8bf84c7ac7ac	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5554-8918-468d-2a6c1bb281ba	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5554-8918-968b-709a31f0cf2a	AD	AND	020	Andorra 	Andora	\N
00040000-5554-8918-1434-499bdb6be835	AO	AGO	024	Angola 	Angola	\N
00040000-5554-8918-808e-3040c06c4720	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5554-8918-e6d7-a3f4ade2ccc4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5554-8918-0ae9-966e8c8afa04	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5554-8918-85a4-2e4b4d67d9b7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5554-8918-1f95-85c4052f3d98	AM	ARM	051	Armenia 	Armenija	\N
00040000-5554-8918-049b-cc0bc991fd56	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5554-8918-523a-deb3021cc578	AU	AUS	036	Australia 	Avstralija	\N
00040000-5554-8918-ef16-0d3df8449f72	AT	AUT	040	Austria 	Avstrija	\N
00040000-5554-8918-1a85-c9307901aac0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5554-8918-6fb0-953043f1cf40	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5554-8918-11c6-b04ed4ea3e73	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5554-8918-af3b-1dbd8ae2c577	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5554-8918-6173-c5ab51deed2e	BB	BRB	052	Barbados 	Barbados	\N
00040000-5554-8918-a65a-42afbc6be560	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5554-8918-84ed-8213bbdf298d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5554-8918-28ee-90a343096460	BZ	BLZ	084	Belize 	Belize	\N
00040000-5554-8918-2405-4e3d42564eef	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5554-8918-9454-b03895ffd6fd	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5554-8918-6ec7-9185b7db3429	BT	BTN	064	Bhutan 	Butan	\N
00040000-5554-8918-2867-832561033124	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5554-8918-96d2-04949dd1ec62	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5554-8918-caad-2fc183a5c03b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5554-8918-f251-69733e6b13c7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5554-8918-b323-747058131eae	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5554-8918-9efb-64f2e761deec	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5554-8918-9afa-3c6270ef1603	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5554-8918-12e6-5aa034689032	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5554-8918-0eab-f2afae68cf24	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5554-8918-1862-b42cec39742a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5554-8918-29ef-cd0006ea2cf6	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5554-8918-1b96-9515563e4976	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5554-8918-2b1c-cd58defa62df	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5554-8918-01da-88f5518239a5	CA	CAN	124	Canada 	Kanada	\N
00040000-5554-8918-9145-20e311934907	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5554-8918-36dd-43bef095a20a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5554-8918-3d93-c753a1734249	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5554-8918-6c79-587c8eaacc79	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5554-8918-7080-50e1d2fb5809	CL	CHL	152	Chile 	Čile	\N
00040000-5554-8918-5d59-dd549ef885c2	CN	CHN	156	China 	Kitajska	\N
00040000-5554-8918-d1cc-70c734b2046f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5554-8918-e6cc-4a22be796bd1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5554-8918-9bd5-1276e10f9fe1	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5554-8918-111c-e573ca54e0bc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5554-8918-168a-95af5e29423c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5554-8918-899c-58cf52455cec	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5554-8918-fa84-d0e35bfb040d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5554-8918-9da4-f9d89ded9fad	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5554-8918-49a6-7b562cf8c398	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5554-8918-955e-101406a3e21f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5554-8918-4ecd-90168fafb8ab	CU	CUB	192	Cuba 	Kuba	\N
00040000-5554-8918-28ff-1f370fb9054b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5554-8918-8c33-a0f859e7543d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5554-8918-7952-2f72f9ba109e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5554-8918-14a1-8af7f9721e1c	DK	DNK	208	Denmark 	Danska	\N
00040000-5554-8918-6f10-7da64f113f9f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5554-8918-199d-6b464ee1bc64	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5554-8918-60b6-4d3d92d2f504	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5554-8918-53fe-8dee94ba6dde	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5554-8918-c766-e319cac5faf1	EG	EGY	818	Egypt 	Egipt	\N
00040000-5554-8918-07f9-ae2ad155762f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5554-8918-9cf2-239403c55f39	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5554-8918-9c88-c9d50ed747fb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5554-8918-7720-80447000f1b0	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5554-8918-5a43-1148e00075c3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5554-8918-cde0-b093a4dbf35a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5554-8918-a0ee-6158dc652a26	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5554-8918-02cc-28fd3f90dcd6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5554-8918-677b-2dcdbac2a9b7	FI	FIN	246	Finland 	Finska	\N
00040000-5554-8918-ece6-fe3684666cce	FR	FRA	250	France 	Francija	\N
00040000-5554-8918-3031-74c3b9e50537	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5554-8918-38af-66fddadc02ee	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5554-8918-cdfc-02b3583ffa7c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5554-8918-f256-b9d4e892593a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5554-8918-d800-087f9b5a75db	GA	GAB	266	Gabon 	Gabon	\N
00040000-5554-8918-6014-7f41477e4c02	GM	GMB	270	Gambia 	Gambija	\N
00040000-5554-8918-5bb3-184ac43bdd1d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5554-8918-1080-b02f3fc010f1	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5554-8918-42a7-4639680a180e	GH	GHA	288	Ghana 	Gana	\N
00040000-5554-8918-cf23-d6d67e12c5d9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5554-8918-e592-0dc3b3bb1b4e	GR	GRC	300	Greece 	Grčija	\N
00040000-5554-8918-3937-018eae158153	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5554-8918-79ec-246cf144c376	GD	GRD	308	Grenada 	Grenada	\N
00040000-5554-8918-1198-59d217377269	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5554-8918-5fd3-dc5bf9f993cb	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5554-8918-9c2e-5f026f6f7922	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5554-8918-8201-9873dc43d744	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5554-8918-c049-dee7bae8b3a2	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5554-8918-3faa-b06348a49293	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5554-8918-5f1a-c6fe2fd5dcc5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5554-8918-b069-9d6eb74d677f	HT	HTI	332	Haiti 	Haiti	\N
00040000-5554-8918-9ffb-7ae8094bfdf4	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5554-8918-6eda-274492b0c38a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5554-8918-bd3e-75e452b8b2d8	HN	HND	340	Honduras 	Honduras	\N
00040000-5554-8918-17f7-73933e188543	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5554-8918-5021-c2c29d090501	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5554-8918-335f-36688b7c8a9f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5554-8918-530b-57ed463d1fe4	IN	IND	356	India 	Indija	\N
00040000-5554-8918-0c53-c86d88e18276	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5554-8918-d5ee-d34296a2ce5f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5554-8918-0a54-b860215f1ba9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5554-8918-d439-09aec96576da	IE	IRL	372	Ireland 	Irska	\N
00040000-5554-8918-00a5-830d5d35fcf3	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5554-8918-35f9-488b9d120add	IL	ISR	376	Israel 	Izrael	\N
00040000-5554-8918-19dd-2deded4488ad	IT	ITA	380	Italy 	Italija	\N
00040000-5554-8918-8bc6-e49713d8f052	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5554-8918-fd57-401e5af0437b	JP	JPN	392	Japan 	Japonska	\N
00040000-5554-8918-55e9-c4b02044f010	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5554-8918-47b3-c4baf8397461	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5554-8918-1822-495074f97bbd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5554-8918-8cdf-22019fa49626	KE	KEN	404	Kenya 	Kenija	\N
00040000-5554-8918-a66f-897781e866ea	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5554-8918-8c1a-92fafa7e2a59	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5554-8918-83d9-6f62248f54e2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5554-8918-cdde-1ca1f32227e7	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5554-8918-e211-b790990ad18d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5554-8918-255d-bd92e4679058	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5554-8918-21de-2a4fc981ec9e	LV	LVA	428	Latvia 	Latvija	\N
00040000-5554-8918-5f34-87beb0e90b10	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5554-8918-3693-44873c491fbb	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5554-8918-4f25-8ec4e3999041	LR	LBR	430	Liberia 	Liberija	\N
00040000-5554-8918-dbcb-0c31e19c1220	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5554-8918-e03e-7e45adec7f36	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5554-8918-ba53-e3eb93a10426	LT	LTU	440	Lithuania 	Litva	\N
00040000-5554-8918-32c6-1bfb412f6c2e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5554-8918-534c-06a9ceafba66	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5554-8918-708e-0376a0836189	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5554-8918-acd0-a0a09a7b1500	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5554-8918-1560-7ed318458635	MW	MWI	454	Malawi 	Malavi	\N
00040000-5554-8918-cfa2-41293e0fb165	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5554-8918-218f-bcbe919c304e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5554-8918-476a-7207da8476e8	ML	MLI	466	Mali 	Mali	\N
00040000-5554-8918-8f33-e18ae4b3cf83	MT	MLT	470	Malta 	Malta	\N
00040000-5554-8918-f92b-b20cc6be5dcf	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5554-8918-3838-fbfd928e4300	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5554-8918-8422-3b69fd45d153	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5554-8918-5619-8e18c142bcb7	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5554-8918-8184-f99defb6573d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5554-8918-e737-8f33b18d2824	MX	MEX	484	Mexico 	Mehika	\N
00040000-5554-8918-48f0-ad7e70d17288	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5554-8918-fc1f-8e08349da8ed	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5554-8918-b6f0-6c834fc10ceb	MC	MCO	492	Monaco 	Monako	\N
00040000-5554-8918-2519-2c502bcbf4b2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5554-8918-ff6e-7a12732135c7	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5554-8918-596e-f029849294ea	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5554-8918-de9f-a1c5c55a7409	MA	MAR	504	Morocco 	Maroko	\N
00040000-5554-8918-9959-84485bdf2311	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5554-8918-7b40-9b51d6f3c862	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5554-8918-1f54-cc67e82fd7af	NA	NAM	516	Namibia 	Namibija	\N
00040000-5554-8918-9f52-f0f0b947bf5d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5554-8918-714a-fe6f156fd5bc	NP	NPL	524	Nepal 	Nepal	\N
00040000-5554-8918-3b8f-dbc190a8917e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5554-8918-c502-d82c7b32823c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5554-8918-661d-1ca96c555863	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5554-8918-06f2-208b4dbf0463	NE	NER	562	Niger 	Niger 	\N
00040000-5554-8918-89a9-4856a89f6cfd	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5554-8918-70ca-a39a6f099a16	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5554-8918-6f00-4de3cc2e0028	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5554-8918-7c45-8debb8bf2726	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5554-8918-aa9d-75a1b080a1f9	NO	NOR	578	Norway 	Norveška	\N
00040000-5554-8918-fd0e-8464bbef3428	OM	OMN	512	Oman 	Oman	\N
00040000-5554-8918-2839-01ef58f72cbc	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5554-8918-0194-637ab6fff71b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5554-8918-2ddd-5ea9f75409e2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5554-8918-ddbf-f196f6f2ac3b	PA	PAN	591	Panama 	Panama	\N
00040000-5554-8918-29d5-a22039806b13	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5554-8918-3395-06063dba19c7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5554-8918-5188-9c4a2583c6fa	PE	PER	604	Peru 	Peru	\N
00040000-5554-8918-06d6-e3e3b373af40	PH	PHL	608	Philippines 	Filipini	\N
00040000-5554-8918-2588-b309b4e7b8a7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5554-8918-8c6d-44529aa2f53e	PL	POL	616	Poland 	Poljska	\N
00040000-5554-8918-997e-f98a7e6d36c5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5554-8918-bd1d-8514a41933ab	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5554-8918-bb49-b532a012999b	QA	QAT	634	Qatar 	Katar	\N
00040000-5554-8918-0ca0-0955f129857b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5554-8918-6ef0-16ad81e899d2	RO	ROU	642	Romania 	Romunija	\N
00040000-5554-8918-3f67-cab7ab5f5209	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5554-8918-345c-7ba0439cac85	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5554-8918-99ad-e9aba8b35ff4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5554-8918-e824-b5bf4ca3c8cb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5554-8918-6104-2c6bbeff7ad0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5554-8918-d165-e22fb61fa05e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5554-8918-a1c6-4cabc8885733	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5554-8918-beca-c891d7a11830	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5554-8918-2ea2-21b72fda7cd9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5554-8918-d0ee-16b91a4ae700	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5554-8918-8e0d-8aca9405c5cf	SM	SMR	674	San Marino 	San Marino	\N
00040000-5554-8918-ce89-b3d575f96099	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5554-8918-e351-d045758b4a74	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5554-8918-3435-dac6b97797f5	SN	SEN	686	Senegal 	Senegal	\N
00040000-5554-8918-bc10-3b6e9e02f82e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5554-8918-b217-ed1145e4edbe	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5554-8918-150d-9a954879560a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5554-8918-9829-4ff7567abf62	SG	SGP	702	Singapore 	Singapur	\N
00040000-5554-8918-374f-b8bd0ff79558	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5554-8918-dc29-80b042d948c2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5554-8918-85b9-4d71616f7553	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5554-8918-c87c-8da8f82909e7	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5554-8918-882b-8bb55232b3b9	SO	SOM	706	Somalia 	Somalija	\N
00040000-5554-8918-5721-b1aab00b2824	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5554-8918-436a-fc254982bc51	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5554-8918-71f6-83c7daffc12e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5554-8918-a8c0-50a541874635	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5554-8918-6360-6c23c49bf60d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5554-8918-0e6c-af80a4d9e1ca	SD	SDN	729	Sudan 	Sudan	\N
00040000-5554-8918-04d6-e758405acd61	SR	SUR	740	Suriname 	Surinam	\N
00040000-5554-8918-14f9-9990c761dc4f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5554-8918-1f9d-0b5fe2f9a4ee	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5554-8918-16b1-ee9d2c75cc83	SE	SWE	752	Sweden 	Švedska	\N
00040000-5554-8918-6bfe-2328cc0b342e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5554-8918-68c7-753d962307f2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5554-8918-df5b-dfb992b7fecb	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5554-8918-9a2b-4085c6f62772	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5554-8918-8236-2c8b196fdd0f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5554-8918-36c1-91dc41f2684f	TH	THA	764	Thailand 	Tajska	\N
00040000-5554-8918-9608-b0ff35900029	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5554-8918-1848-0dd866522eaa	TG	TGO	768	Togo 	Togo	\N
00040000-5554-8918-c51e-3a124a091473	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5554-8918-c5a2-776441c68b6b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5554-8918-22ea-6c1473c13fe6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5554-8918-b7a0-d2db354e0763	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5554-8918-e6ee-27fa276a843c	TR	TUR	792	Turkey 	Turčija	\N
00040000-5554-8918-3f7b-12cc98296f3b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5554-8918-04c3-0ba4f2ebff8a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5554-8918-ff54-ec927d902a3c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5554-8918-620a-4700163baddf	UG	UGA	800	Uganda 	Uganda	\N
00040000-5554-8918-936a-b345e38b1f4c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5554-8918-90dc-a49af44d5110	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5554-8918-804a-b9d4ebdca15a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5554-8918-966d-82c324cc752e	US	USA	840	United States 	Združene države Amerike	\N
00040000-5554-8918-b5ef-65d3c2f7aad0	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5554-8918-49b9-f13a8da50955	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5554-8918-8c6e-c65a4f28c139	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5554-8918-1863-61cb30973bb7	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5554-8918-5a63-766aae4e1e4a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5554-8918-b107-2de09502e766	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5554-8918-c89c-ff1078170e83	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5554-8918-df79-260000e68e6e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5554-8918-0674-57ff3e98e7e6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5554-8918-45f8-018dcf66c135	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5554-8918-fd8c-f397be539d51	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5554-8918-7392-2733db87d867	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5554-8918-d075-87dbad6fa036	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 3392828)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3392653)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3392697)
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
-- TOC entry 2658 (class 0 OID 3392746)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3392771)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3392602)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5554-8918-2b4b-1f60e9d7b914	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5554-8918-d124-85f5c8d054e2	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5554-8918-d160-b86150135d64	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5554-8918-7dd7-20a60dccac9f	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5554-8918-f3aa-eb6ab7a64206	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5554-8918-2b1f-37670eeefbec	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5554-8918-69e2-8af766fdc17d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5554-8918-e295-ef86101267d6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5554-8918-00d5-991f54a1ca99	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5554-8918-9245-c556929205fb	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 3392510)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5554-8918-f622-09eb1cc7bb1c	00000000-5554-8918-f3aa-eb6ab7a64206	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5554-8918-3c03-dfdddb3a44cf	00000000-5554-8918-f3aa-eb6ab7a64206	00010000-5554-8918-d35c-77551525b570	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5554-8918-d6bf-9a38f7916c18	00000000-5554-8918-2b1f-37670eeefbec	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 3392521)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3392572)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 3392475)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5554-8918-88c0-8827f31ca42d	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5554-8918-677c-34060f3fa254	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5554-8918-3410-b4c6c8ec2c26	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5554-8918-3612-304023a20b16	Abonma-read	Abonma - branje	f
00030000-5554-8918-2e7f-144612e6efeb	Abonma-write	Abonma - spreminjanje	f
00030000-5554-8918-d564-fd0a5e91280f	Alternacija-read	Alternacija - branje	f
00030000-5554-8918-bf52-5d6106b10e09	Alternacija-write	Alternacija - spreminjanje	f
00030000-5554-8918-a1df-177687c3a220	Arhivalija-read	Arhivalija - branje	f
00030000-5554-8918-1db6-5df6e566d7b0	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5554-8918-aa1a-f3556c043be4	Besedilo-read	Besedilo - branje	f
00030000-5554-8918-3e32-0a049f0429b7	Besedilo-write	Besedilo - spreminjanje	f
00030000-5554-8918-e277-aedb92f8895f	DogodekIzven-read	DogodekIzven - branje	f
00030000-5554-8918-f781-77a5351ba26e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5554-8918-a1bc-5c0660ff3b46	Dogodek-read	Dogodek - branje	f
00030000-5554-8918-e418-0a363828493a	Dogodek-write	Dogodek - spreminjanje	f
00030000-5554-8918-79ad-89db00ea7dcd	Drzava-read	Drzava - branje	f
00030000-5554-8918-a8aa-3de80a3e14a5	Drzava-write	Drzava - spreminjanje	f
00030000-5554-8918-0229-bc77c6d32d97	Funkcija-read	Funkcija - branje	f
00030000-5554-8918-1c2a-de06501b8be0	Funkcija-write	Funkcija - spreminjanje	f
00030000-5554-8918-4522-cbc56e56a3de	Gostovanje-read	Gostovanje - branje	f
00030000-5554-8918-5612-e973e4bd08dc	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5554-8918-a488-9cdda75446aa	Gostujoca-read	Gostujoca - branje	f
00030000-5554-8918-768a-768a5b6570a2	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5554-8918-d68f-a28f43e9c55f	Kupec-read	Kupec - branje	f
00030000-5554-8918-70f0-91574f081a27	Kupec-write	Kupec - spreminjanje	f
00030000-5554-8918-fe0d-21e919b9c337	NacinPlacina-read	NacinPlacina - branje	f
00030000-5554-8918-bdfa-35acf585daa4	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5554-8918-bd6c-b58adf2295ed	Option-read	Option - branje	f
00030000-5554-8918-8846-9c4ed1092d5a	Option-write	Option - spreminjanje	f
00030000-5554-8918-0771-6355b0d151b3	OptionValue-read	OptionValue - branje	f
00030000-5554-8918-96d4-ff94fa0ecd13	OptionValue-write	OptionValue - spreminjanje	f
00030000-5554-8918-8e0b-2e03c0acdca7	Oseba-read	Oseba - branje	f
00030000-5554-8918-63de-f4141359ddbb	Oseba-write	Oseba - spreminjanje	f
00030000-5554-8918-b5b0-137fd515f170	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5554-8918-72d1-8142649da731	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5554-8918-6dac-568463783ee5	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5554-8918-1915-ba331f3662ca	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5554-8918-4987-f2d224a4626a	Pogodba-read	Pogodba - branje	f
00030000-5554-8918-8ac1-38aefc2715ba	Pogodba-write	Pogodba - spreminjanje	f
00030000-5554-8918-4f06-885b4ad90065	Popa-read	Popa - branje	f
00030000-5554-8918-2b73-d7c83b70706f	Popa-write	Popa - spreminjanje	f
00030000-5554-8918-fb5a-d673c313e638	Posta-read	Posta - branje	f
00030000-5554-8918-a18f-3c15071c1151	Posta-write	Posta - spreminjanje	f
00030000-5554-8918-ea88-ff268d926cdc	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5554-8918-f169-60cfaf5ac584	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5554-8918-558d-89ef373e3fab	PostniNaslov-read	PostniNaslov - branje	f
00030000-5554-8918-18be-97bec5a71a21	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5554-8918-bba8-1c37ba264993	Predstava-read	Predstava - branje	f
00030000-5554-8918-1fc1-465ecb1eb47f	Predstava-write	Predstava - spreminjanje	f
00030000-5554-8918-413f-133e0d1aef48	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5554-8918-8e6a-295f3491e6eb	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5554-8918-c51a-3df2e7759b7b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5554-8918-0fa4-d17db9432b04	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5554-8918-2649-a024b29d6139	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5554-8918-3212-31303a727a41	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5554-8918-889f-8ce4739e625a	Prostor-read	Prostor - branje	f
00030000-5554-8918-a17c-629d683944c8	Prostor-write	Prostor - spreminjanje	f
00030000-5554-8918-c07f-4003b421237f	Racun-read	Racun - branje	f
00030000-5554-8918-3884-4489d9abfbae	Racun-write	Racun - spreminjanje	f
00030000-5554-8918-c95e-03a5c2768da6	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5554-8918-908e-0d3c69a75b98	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5554-8918-8776-ba38d88c8cf2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5554-8918-9fb1-a15e73a483d1	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5554-8918-2ea9-cac6ae399f3d	Rekvizit-read	Rekvizit - branje	f
00030000-5554-8918-f0d7-086b975c84a2	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5554-8918-e508-794ad6593178	Rezervacija-read	Rezervacija - branje	f
00030000-5554-8918-e7f5-bc6e059e0bab	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5554-8918-29be-96fde1a67a7e	SedezniRed-read	SedezniRed - branje	f
00030000-5554-8918-09d4-4d2c41dd1cdb	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5554-8918-baa3-6f98c7ce5011	Sedez-read	Sedez - branje	f
00030000-5554-8918-0629-f071bd09006d	Sedez-write	Sedez - spreminjanje	f
00030000-5554-8918-e1e6-0cdcaf2818f0	Sezona-read	Sezona - branje	f
00030000-5554-8918-e835-8679721c10dd	Sezona-write	Sezona - spreminjanje	f
00030000-5554-8918-7e7c-98ed4f140e46	Telefonska-read	Telefonska - branje	f
00030000-5554-8918-2927-698c12bc1597	Telefonska-write	Telefonska - spreminjanje	f
00030000-5554-8918-988c-511c47511f83	TerminStoritve-read	TerminStoritve - branje	f
00030000-5554-8918-0ca7-86916743d02e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5554-8918-e80d-71df01e01cd0	TipFunkcije-read	TipFunkcije - branje	f
00030000-5554-8918-ca7c-ad0a1a59d042	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5554-8918-ae19-18c015af1be0	Trr-read	Trr - branje	f
00030000-5554-8918-7410-c1d35a347ae9	Trr-write	Trr - spreminjanje	f
00030000-5554-8918-21c7-6e2eb1722f58	Uprizoritev-read	Uprizoritev - branje	f
00030000-5554-8918-cced-9b5e7cd8ea33	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5554-8918-9af9-33e045f0d19f	Vaja-read	Vaja - branje	f
00030000-5554-8918-a00f-7877d3f92697	Vaja-write	Vaja - spreminjanje	f
00030000-5554-8918-f254-af9a4e68b5f1	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5554-8918-11d6-3706801a0158	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5554-8918-41b8-de6cc68a9932	Zaposlitev-read	Zaposlitev - branje	f
00030000-5554-8918-1971-5e147ccbc9fb	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5554-8918-2a24-e0820b572642	Zasedenost-read	Zasedenost - branje	f
00030000-5554-8918-4380-9bd202cbebb4	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5554-8918-50c2-39b05f0cc46b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5554-8918-f4fe-39247ceb1696	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5554-8918-e595-5d5ee7ee4fba	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5554-8918-a907-c75634ea813d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 3392494)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5554-8918-a1bc-47dd8435df5f	00030000-5554-8918-79ad-89db00ea7dcd
00020000-5554-8918-b894-d18da09dbd63	00030000-5554-8918-a8aa-3de80a3e14a5
00020000-5554-8918-b894-d18da09dbd63	00030000-5554-8918-79ad-89db00ea7dcd
\.


--
-- TOC entry 2663 (class 0 OID 3392778)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3392808)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3392923)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3392552)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3392594)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5554-8917-a4cd-bb7b90d0b397	8341	Adlešiči
00050000-5554-8917-64ad-ede5201ffecc	5270	Ajdovščina
00050000-5554-8917-1ef0-212c218efdc6	6280	Ankaran/Ancarano
00050000-5554-8917-d5fe-a6acd817993d	9253	Apače
00050000-5554-8917-a4ff-93e847580dd2	8253	Artiče
00050000-5554-8917-1e5f-86a558ffe6f3	4275	Begunje na Gorenjskem
00050000-5554-8917-82b4-4072a4e51b38	1382	Begunje pri Cerknici
00050000-5554-8917-93fb-d7f0324c20c2	9231	Beltinci
00050000-5554-8917-2314-90feac58d88b	2234	Benedikt
00050000-5554-8917-56b5-79f51b3459e1	2345	Bistrica ob Dravi
00050000-5554-8917-ff28-3163bf155838	3256	Bistrica ob Sotli
00050000-5554-8917-d6cd-9487e2c1cc7b	8259	Bizeljsko
00050000-5554-8917-2e91-6f663253b7f5	1223	Blagovica
00050000-5554-8917-8803-e1b6572325b4	8283	Blanca
00050000-5554-8917-f817-c5592a1fbfe3	4260	Bled
00050000-5554-8917-355b-0fd8fa1d9bd4	4273	Blejska Dobrava
00050000-5554-8917-6617-6ef2b0ee1c9d	9265	Bodonci
00050000-5554-8917-8340-d11f888d855d	9222	Bogojina
00050000-5554-8917-4b51-bb9d45f04a16	4263	Bohinjska Bela
00050000-5554-8917-d58f-5bb478018ecf	4264	Bohinjska Bistrica
00050000-5554-8917-3924-4928476d8505	4265	Bohinjsko jezero
00050000-5554-8917-e805-21077e465991	1353	Borovnica
00050000-5554-8917-d244-f813bd4a385f	8294	Boštanj
00050000-5554-8917-514a-0ec067aca476	5230	Bovec
00050000-5554-8917-5b3c-c05033c8b476	5295	Branik
00050000-5554-8917-be0b-b09dd674a717	3314	Braslovče
00050000-5554-8917-4ac2-e1386c4528cc	5223	Breginj
00050000-5554-8917-10f2-b0ff41b45399	8280	Brestanica
00050000-5554-8917-aca9-141f38e02d54	2354	Bresternica
00050000-5554-8917-714a-1778b5461b9e	4243	Brezje
00050000-5554-8917-654b-2613e316c0ee	1351	Brezovica pri Ljubljani
00050000-5554-8917-c67c-b0f5f00605c5	8250	Brežice
00050000-5554-8917-ad2f-dd357135a1cf	4210	Brnik - Aerodrom
00050000-5554-8917-b812-1241b9ef1ad1	8321	Brusnice
00050000-5554-8917-d955-cdb3aba54f8c	3255	Buče
00050000-5554-8917-4386-8ecb0feb444f	8276	Bučka 
00050000-5554-8917-986d-f1f6ef6700ff	9261	Cankova
00050000-5554-8917-3d39-107064164436	3000	Celje 
00050000-5554-8917-bfc0-6dea4dcf0571	3001	Celje - poštni predali
00050000-5554-8917-c563-efed2c999898	4207	Cerklje na Gorenjskem
00050000-5554-8917-05e2-f021f0143c6a	8263	Cerklje ob Krki
00050000-5554-8917-96f4-6b59062c8821	1380	Cerknica
00050000-5554-8917-a410-073b044eeb45	5282	Cerkno
00050000-5554-8917-c0b8-19fbd719bed8	2236	Cerkvenjak
00050000-5554-8917-0c50-284aa2f37787	2215	Ceršak
00050000-5554-8917-4d0c-77357bf61644	2326	Cirkovce
00050000-5554-8917-43c5-f2112d61cbf1	2282	Cirkulane
00050000-5554-8917-8b05-fe88d1d67a74	5273	Col
00050000-5554-8917-db16-88a5b4b87677	8251	Čatež ob Savi
00050000-5554-8917-8800-33b73eb20961	1413	Čemšenik
00050000-5554-8917-2fcd-f86f3d4c50a3	5253	Čepovan
00050000-5554-8917-305c-a5b786c15cfa	9232	Črenšovci
00050000-5554-8917-1b14-9c4c620f93d7	2393	Črna na Koroškem
00050000-5554-8917-9d21-3b335153320c	6275	Črni Kal
00050000-5554-8917-d4df-c53f0f01ae6c	5274	Črni Vrh nad Idrijo
00050000-5554-8917-82c0-cdfa1cb0faca	5262	Črniče
00050000-5554-8917-ec6c-7a15d6118343	8340	Črnomelj
00050000-5554-8917-9d85-e7c01040eb08	6271	Dekani
00050000-5554-8917-5ff3-e8b0a87d8c99	5210	Deskle
00050000-5554-8917-4d68-1840070af85d	2253	Destrnik
00050000-5554-8917-668e-2fe3a4dcb235	6215	Divača
00050000-5554-8917-e5e8-c01a2977b96e	1233	Dob
00050000-5554-8917-32f3-8e66309f1b39	3224	Dobje pri Planini
00050000-5554-8917-e918-efc304d14d74	8257	Dobova
00050000-5554-8917-a7bd-779e429d0940	1423	Dobovec
00050000-5554-8917-6cd1-c6edf6a5e502	5263	Dobravlje
00050000-5554-8917-755e-9b1a5156e702	3204	Dobrna
00050000-5554-8917-e170-34a4dfa423fb	8211	Dobrnič
00050000-5554-8917-0038-fa1fdbe0bcb3	1356	Dobrova
00050000-5554-8917-f9f7-3748dd844a45	9223	Dobrovnik/Dobronak 
00050000-5554-8917-51db-8055f5488ba7	5212	Dobrovo v Brdih
00050000-5554-8917-6e16-b9caa8246911	1431	Dol pri Hrastniku
00050000-5554-8917-3363-cd50934689fe	1262	Dol pri Ljubljani
00050000-5554-8917-6d83-3d8e1d15dbf8	1273	Dole pri Litiji
00050000-5554-8917-1a52-b35cc2bd915e	1331	Dolenja vas
00050000-5554-8917-7e2d-a7173bd95132	8350	Dolenjske Toplice
00050000-5554-8917-5af6-e09afb94e3e8	1230	Domžale
00050000-5554-8917-b906-05f96528db9f	2252	Dornava
00050000-5554-8917-700c-db461c66b174	5294	Dornberk
00050000-5554-8917-2545-a45a7984d176	1319	Draga
00050000-5554-8917-5680-4b73e2ff4769	8343	Dragatuš
00050000-5554-8917-079c-2095c0c0f9f3	3222	Dramlje
00050000-5554-8917-b42a-98c37dda00f8	2370	Dravograd
00050000-5554-8917-a602-60c23084ba08	4203	Duplje
00050000-5554-8917-7743-757f0e58152d	6221	Dutovlje
00050000-5554-8917-0d9e-40a9dbc6dfbb	8361	Dvor
00050000-5554-8917-3470-d355279be9bc	2343	Fala
00050000-5554-8917-7715-e1e05ad4c4af	9208	Fokovci
00050000-5554-8917-fcba-ee26149e917d	2313	Fram
00050000-5554-8917-7502-e38cd3005746	3213	Frankolovo
00050000-5554-8917-ca7c-7a409dea8d70	1274	Gabrovka
00050000-5554-8917-3e7e-d220a674a3bb	8254	Globoko
00050000-5554-8917-9b13-901069032772	5275	Godovič
00050000-5554-8917-0c9f-5e1e7fbf1c30	4204	Golnik
00050000-5554-8917-9c52-13ad7cafef59	3303	Gomilsko
00050000-5554-8917-4843-2930a441cddf	4224	Gorenja vas
00050000-5554-8917-b0d4-b289ad5a5589	3263	Gorica pri Slivnici
00050000-5554-8917-3135-fedc48822cbf	2272	Gorišnica
00050000-5554-8917-b174-d152f1eb5e43	9250	Gornja Radgona
00050000-5554-8917-9bae-285353160b3e	3342	Gornji Grad
00050000-5554-8917-c1e7-4d73ac189959	4282	Gozd Martuljek
00050000-5554-8917-94cd-fad8b37deebc	6272	Gračišče
00050000-5554-8917-05be-4292c4a5297b	9264	Grad
00050000-5554-8917-cab0-2ab68a692af2	8332	Gradac
00050000-5554-8917-8b96-918b5c13c3cf	1384	Grahovo
00050000-5554-8917-6383-976dd610c1cd	5242	Grahovo ob Bači
00050000-5554-8917-dc1f-3c80c0baa951	5251	Grgar
00050000-5554-8917-067b-ac3d51d73dad	3302	Griže
00050000-5554-8917-4025-af2d96cbe97f	3231	Grobelno
00050000-5554-8917-143f-7587a4a75f70	1290	Grosuplje
00050000-5554-8917-241e-17c1590ba3e4	2288	Hajdina
00050000-5554-8917-5910-518f3aa527f6	8362	Hinje
00050000-5554-8917-07cc-8f98f4cc1723	2311	Hoče
00050000-5554-8917-c4ba-e71310e56b2b	9205	Hodoš/Hodos
00050000-5554-8917-2cfe-dece066b5f74	1354	Horjul
00050000-5554-8917-a39c-b346e712c8dd	1372	Hotedršica
00050000-5554-8917-9daa-a7803ad9c199	1430	Hrastnik
00050000-5554-8917-02fd-dbcb06af3d65	6225	Hruševje
00050000-5554-8917-0586-6972422ec864	4276	Hrušica
00050000-5554-8917-29e8-5c41fffeb9d3	5280	Idrija
00050000-5554-8917-4966-ff34ab22964a	1292	Ig
00050000-5554-8917-f5b8-1a0d56f7a9d8	6250	Ilirska Bistrica
00050000-5554-8917-98aa-ad3a0ccf1cae	6251	Ilirska Bistrica-Trnovo
00050000-5554-8917-8b1f-b2e3a289e873	1295	Ivančna Gorica
00050000-5554-8917-9a8f-3a60f9f3dae0	2259	Ivanjkovci
00050000-5554-8917-249a-beb91a9881bf	1411	Izlake
00050000-5554-8917-c78c-6b988d9d4ce1	6310	Izola/Isola
00050000-5554-8917-b5ec-9c24d6fd3d78	2222	Jakobski Dol
00050000-5554-8917-2003-dee10c796081	2221	Jarenina
00050000-5554-8917-604a-efd05c2c2fa6	6254	Jelšane
00050000-5554-8917-74e3-daea7711083e	4270	Jesenice
00050000-5554-8917-459b-fb6f9f5bb251	8261	Jesenice na Dolenjskem
00050000-5554-8917-2309-c8d9a7042870	3273	Jurklošter
00050000-5554-8917-fb02-61d812695b27	2223	Jurovski Dol
00050000-5554-8917-a751-2d0ce6137cea	2256	Juršinci
00050000-5554-8917-94dc-4c0224cb919e	5214	Kal nad Kanalom
00050000-5554-8917-6066-7d12f7845b52	3233	Kalobje
00050000-5554-8917-57cf-90cc0dc21ce7	4246	Kamna Gorica
00050000-5554-8917-577f-a2602dbe3d40	2351	Kamnica
00050000-5554-8917-71b7-cdda781c36e8	1241	Kamnik
00050000-5554-8917-7160-e349a5d9c86a	5213	Kanal
00050000-5554-8917-cbd7-f52a83c58549	8258	Kapele
00050000-5554-8917-8fa1-b20b57241fe0	2362	Kapla
00050000-5554-8917-0d67-086e9b812a4b	2325	Kidričevo
00050000-5554-8917-5802-edd488e3949f	1412	Kisovec
00050000-5554-8917-29fd-24a11b789641	6253	Knežak
00050000-5554-8917-65cc-9c3497f68ca7	5222	Kobarid
00050000-5554-8917-ab00-a66a982143b1	9227	Kobilje
00050000-5554-8917-279f-1e0f4c174e4b	1330	Kočevje
00050000-5554-8917-4ad3-a1caadbff1d0	1338	Kočevska Reka
00050000-5554-8917-251b-c23cbdfaa8b5	2276	Kog
00050000-5554-8917-9ec4-e3a58b2488ea	5211	Kojsko
00050000-5554-8917-c048-98518377c3c4	6223	Komen
00050000-5554-8917-5497-0c60ddedcfcb	1218	Komenda
00050000-5554-8917-5b6f-e5ea1204d369	6000	Koper/Capodistria 
00050000-5554-8917-205f-3f643f4ded05	6001	Koper/Capodistria - poštni predali
00050000-5554-8917-e775-642a5b40b7e3	8282	Koprivnica
00050000-5554-8917-6115-4c319703ca44	5296	Kostanjevica na Krasu
00050000-5554-8917-3906-004de914c45a	8311	Kostanjevica na Krki
00050000-5554-8917-89c2-d3855d407fdc	1336	Kostel
00050000-5554-8917-25b8-5b9530891afd	6256	Košana
00050000-5554-8917-839e-ac87f5c1d26d	2394	Kotlje
00050000-5554-8917-cabe-052a79b7896c	6240	Kozina
00050000-5554-8917-256a-1ebb9ddf8915	3260	Kozje
00050000-5554-8917-c49c-d375708fee3c	4000	Kranj 
00050000-5554-8917-4d56-09da9156d832	4001	Kranj - poštni predali
00050000-5554-8917-e2a8-ab595dfc702c	4280	Kranjska Gora
00050000-5554-8917-b358-d56e0add3835	1281	Kresnice
00050000-5554-8917-82cf-b49376d1c881	4294	Križe
00050000-5554-8917-76d6-5eb951d8ca98	9206	Križevci
00050000-5554-8917-821b-8e5ec37e7971	9242	Križevci pri Ljutomeru
00050000-5554-8917-258f-5184479b770d	1301	Krka
00050000-5554-8917-0b37-64ca18b285d8	8296	Krmelj
00050000-5554-8917-2b2e-13123dcf1008	4245	Kropa
00050000-5554-8917-bac0-387e351af1fa	8262	Krška vas
00050000-5554-8917-3a24-4d34386ec5ec	8270	Krško
00050000-5554-8917-0965-fe78f4d7ebbe	9263	Kuzma
00050000-5554-8917-da64-2d879232c484	2318	Laporje
00050000-5554-8917-2303-8b58d68be902	3270	Laško
00050000-5554-8917-f882-134f551328f9	1219	Laze v Tuhinju
00050000-5554-8917-679a-1ae19f014b3b	2230	Lenart v Slovenskih goricah
00050000-5554-8917-c6b4-964c793b2783	9220	Lendava/Lendva
00050000-5554-8917-8295-d0147208f88d	4248	Lesce
00050000-5554-8917-8e1f-5d911f4fe9ad	3261	Lesično
00050000-5554-8917-8bc0-3207057f75c1	8273	Leskovec pri Krškem
00050000-5554-8917-09bf-9021bbc0573d	2372	Libeliče
00050000-5554-8917-7542-4bede9131416	2341	Limbuš
00050000-5554-8917-0262-998e8644f473	1270	Litija
00050000-5554-8917-8969-93b72ae8ee4a	3202	Ljubečna
00050000-5554-8917-a03d-c86144f1d425	1000	Ljubljana 
00050000-5554-8917-7b63-46217d3667df	1001	Ljubljana - poštni predali
00050000-5554-8917-eedd-cc74062ff4a7	1231	Ljubljana - Črnuče
00050000-5554-8917-0ad1-9d0fefcbbf58	1261	Ljubljana - Dobrunje
00050000-5554-8917-9879-7ff65e64150a	1260	Ljubljana - Polje
00050000-5554-8917-35e4-d31f52399d99	1210	Ljubljana - Šentvid
00050000-5554-8917-55ff-6af003b87080	1211	Ljubljana - Šmartno
00050000-5554-8917-0b38-852d13b0a196	3333	Ljubno ob Savinji
00050000-5554-8917-a475-cd8617ec0ae0	9240	Ljutomer
00050000-5554-8917-c6db-903f18b24e76	3215	Loče
00050000-5554-8917-65b9-3bd544505572	5231	Log pod Mangartom
00050000-5554-8917-d577-b4c69f27bdf9	1358	Log pri Brezovici
00050000-5554-8917-f0c5-feed7b93e58f	1370	Logatec
00050000-5554-8917-f526-c1c54600666a	1371	Logatec
00050000-5554-8917-35cc-0fc9baebb4e0	1434	Loka pri Zidanem Mostu
00050000-5554-8917-23eb-62249a64b32e	3223	Loka pri Žusmu
00050000-5554-8917-cd73-313084d7dac3	6219	Lokev
00050000-5554-8917-2f69-b1cd7e129397	1318	Loški Potok
00050000-5554-8917-4134-375073915bc3	2324	Lovrenc na Dravskem polju
00050000-5554-8917-4616-c3405c626ceb	2344	Lovrenc na Pohorju
00050000-5554-8917-b343-3a1a5fc1e991	3334	Luče
00050000-5554-8917-d9f6-ad1fcc782c40	1225	Lukovica
00050000-5554-8917-e0ea-87f041abe067	9202	Mačkovci
00050000-5554-8917-a5f0-366891af61a2	2322	Majšperk
00050000-5554-8917-a73d-ddd154177774	2321	Makole
00050000-5554-8917-239c-0aa817a810cb	9243	Mala Nedelja
00050000-5554-8917-93c8-1862055f681d	2229	Malečnik
00050000-5554-8917-4314-baca4fbc7987	6273	Marezige
00050000-5554-8917-0e2e-64fd87f51f9f	2000	Maribor 
00050000-5554-8917-67e0-e951992a6de3	2001	Maribor - poštni predali
00050000-5554-8917-3b07-b34621caeb53	2206	Marjeta na Dravskem polju
00050000-5554-8917-d5ab-53bc562c8328	2281	Markovci
00050000-5554-8917-9b50-54e1bed798ef	9221	Martjanci
00050000-5554-8917-c349-922440ec0b33	6242	Materija
00050000-5554-8917-4458-1528b1b7ff7c	4211	Mavčiče
00050000-5554-8917-e96a-523de5744be9	1215	Medvode
00050000-5554-8917-e53c-bbe671544160	1234	Mengeš
00050000-5554-8917-36e1-8a0579e3a1a0	8330	Metlika
00050000-5554-8917-80d9-3c92e04bd091	2392	Mežica
00050000-5554-8917-555e-637f6675d38e	2204	Miklavž na Dravskem polju
00050000-5554-8917-fc59-9c5babc103b7	2275	Miklavž pri Ormožu
00050000-5554-8917-d78a-171338d863e2	5291	Miren
00050000-5554-8917-9c07-24fa9ae94fb0	8233	Mirna
00050000-5554-8917-a4c7-762ef3e01d39	8216	Mirna Peč
00050000-5554-8917-5f18-7162cf579744	2382	Mislinja
00050000-5554-8917-f646-247d906a91a3	4281	Mojstrana
00050000-5554-8917-06a2-1e443db585cc	8230	Mokronog
00050000-5554-8917-6d9a-b49f035f49e3	1251	Moravče
00050000-5554-8917-6196-94f6a315a6f4	9226	Moravske Toplice
00050000-5554-8917-5d82-32762aeb18d4	5216	Most na Soči
00050000-5554-8917-5ed8-ce2bbada2877	1221	Motnik
00050000-5554-8917-01e1-8d1b0b37130f	3330	Mozirje
00050000-5554-8917-3a47-a14378c9f399	9000	Murska Sobota 
00050000-5554-8917-0a9e-811e58815c4a	9001	Murska Sobota - poštni predali
00050000-5554-8917-3aa7-d60e46a3b4a8	2366	Muta
00050000-5554-8917-ae2b-7c5388246e97	4202	Naklo
00050000-5554-8917-fd2b-fc7a9d0dbe7e	3331	Nazarje
00050000-5554-8917-0cc8-e4d50a9398af	1357	Notranje Gorice
00050000-5554-8917-5e7b-206e1099e262	3203	Nova Cerkev
00050000-5554-8917-d8c0-837af2bfc8df	5000	Nova Gorica 
00050000-5554-8917-d895-21a89684bca1	5001	Nova Gorica - poštni predali
00050000-5554-8917-d2b0-e4ee854aea3c	1385	Nova vas
00050000-5554-8917-9231-3845cfc5fb99	8000	Novo mesto
00050000-5554-8917-da5d-21b8d8bdf7e1	8001	Novo mesto - poštni predali
00050000-5554-8917-941c-99b85df824c3	6243	Obrov
00050000-5554-8917-9607-39e79957a1a1	9233	Odranci
00050000-5554-8917-cb7c-32d404b41d34	2317	Oplotnica
00050000-5554-8917-09b7-109295a455ec	2312	Orehova vas
00050000-5554-8917-f796-dd9510a6663e	2270	Ormož
00050000-5554-8917-e106-75d0bb1031e4	1316	Ortnek
00050000-5554-8917-9fee-e042bd45ee57	1337	Osilnica
00050000-5554-8917-2393-df5073c54ddd	8222	Otočec
00050000-5554-8917-5443-3d4619c1b632	2361	Ožbalt
00050000-5554-8917-9e41-b942dbe1cd19	2231	Pernica
00050000-5554-8917-d38f-73474f19c2fd	2211	Pesnica pri Mariboru
00050000-5554-8917-e810-d2f8a3457165	9203	Petrovci
00050000-5554-8917-5d04-66dac1325137	3301	Petrovče
00050000-5554-8917-252c-85a50befa580	6330	Piran/Pirano
00050000-5554-8917-9b50-0013ad0b9b4f	8255	Pišece
00050000-5554-8917-9a36-95daab8e7ca4	6257	Pivka
00050000-5554-8917-7fe7-9f74e952e044	6232	Planina
00050000-5554-8917-8d6a-1f9840cc50d9	3225	Planina pri Sevnici
00050000-5554-8917-8753-1218a57d32ab	6276	Pobegi
00050000-5554-8917-6bfd-088dc93ebf65	8312	Podbočje
00050000-5554-8917-0806-63ae39b395c7	5243	Podbrdo
00050000-5554-8917-d662-3098c3f57b99	3254	Podčetrtek
00050000-5554-8917-0ea1-aff7aee365bd	2273	Podgorci
00050000-5554-8917-1580-d6d10b056ee8	6216	Podgorje
00050000-5554-8917-fc62-ebf20b0cbf6c	2381	Podgorje pri Slovenj Gradcu
00050000-5554-8917-5d62-e2d7487e525a	6244	Podgrad
00050000-5554-8917-375d-a0836fde07dd	1414	Podkum
00050000-5554-8917-2c9f-ae22ef976028	2286	Podlehnik
00050000-5554-8917-68a8-cb8041edceb9	5272	Podnanos
00050000-5554-8917-a61a-44256973baab	4244	Podnart
00050000-5554-8917-70a4-47f589ca7a68	3241	Podplat
00050000-5554-8917-01f2-bf8023591ead	3257	Podsreda
00050000-5554-8917-4100-e9b3bdf08b10	2363	Podvelka
00050000-5554-8917-390f-ded98f4b6d76	2208	Pohorje
00050000-5554-8917-fc13-0a047e8b4a95	2257	Polenšak
00050000-5554-8917-fd64-c2ffdf5b049f	1355	Polhov Gradec
00050000-5554-8917-d94b-9c4d62975637	4223	Poljane nad Škofjo Loko
00050000-5554-8917-155a-af7c97c08d85	2319	Poljčane
00050000-5554-8917-37b6-9c3d687bb70a	1272	Polšnik
00050000-5554-8917-5448-2418718b994a	3313	Polzela
00050000-5554-8917-d8b7-1e4d1d039aec	3232	Ponikva
00050000-5554-8917-a4f8-d14322cf0943	6320	Portorož/Portorose
00050000-5554-8917-ab83-c261b502acff	6230	Postojna
00050000-5554-8917-071f-5a66f0ac23b4	2331	Pragersko
00050000-5554-8917-6b7a-73a204afba13	3312	Prebold
00050000-5554-8917-cc5e-1508778cfa13	4205	Preddvor
00050000-5554-8917-7b10-de13a8eeffd7	6255	Prem
00050000-5554-8917-00b0-bf7b49bc8072	1352	Preserje
00050000-5554-8917-b7a5-f0c44f0879c0	6258	Prestranek
00050000-5554-8917-166a-8a21cfad8324	2391	Prevalje
00050000-5554-8917-f045-85bb7c6e78a1	3262	Prevorje
00050000-5554-8917-881a-84e25a27344e	1276	Primskovo 
00050000-5554-8917-0433-2a8a660b43c7	3253	Pristava pri Mestinju
00050000-5554-8917-ae78-5661122c2c7d	9207	Prosenjakovci/Partosfalva
00050000-5554-8917-198f-1df1fedda7d8	5297	Prvačina
00050000-5554-8917-a959-3ca70e876862	2250	Ptuj
00050000-5554-8917-725f-eb68de09096f	2323	Ptujska Gora
00050000-5554-8917-9ce1-99700e7e7392	9201	Puconci
00050000-5554-8917-fda1-7028ca3212ca	2327	Rače
00050000-5554-8917-b721-873474a57399	1433	Radeče
00050000-5554-8917-b99a-5568b41be095	9252	Radenci
00050000-5554-8917-4467-3a2d5d903e59	2360	Radlje ob Dravi
00050000-5554-8917-2186-481a780385a2	1235	Radomlje
00050000-5554-8917-0dfa-3fda13281f8c	4240	Radovljica
00050000-5554-8917-e470-6cef226d82c2	8274	Raka
00050000-5554-8917-936d-3ad6f2676ced	1381	Rakek
00050000-5554-8917-1303-35c0042e581a	4283	Rateče - Planica
00050000-5554-8917-3414-40bb3ce2dbdf	2390	Ravne na Koroškem
00050000-5554-8917-4716-bf45e52038e4	9246	Razkrižje
00050000-5554-8917-5816-dcc0116ffb78	3332	Rečica ob Savinji
00050000-5554-8917-0ab0-47e8839b7c60	5292	Renče
00050000-5554-8917-c3de-b2476b100e12	1310	Ribnica
00050000-5554-8917-8582-2fcbeff47086	2364	Ribnica na Pohorju
00050000-5554-8917-cac7-e90adc1fc95c	3272	Rimske Toplice
00050000-5554-8917-c048-76dd70cfc3c6	1314	Rob
00050000-5554-8917-521f-710d499f8438	5215	Ročinj
00050000-5554-8917-1237-2bd6f21b43eb	3250	Rogaška Slatina
00050000-5554-8917-2e1b-c2f005f39f25	9262	Rogašovci
00050000-5554-8917-49fa-2d3d149533a1	3252	Rogatec
00050000-5554-8917-e478-3f82752cd39f	1373	Rovte
00050000-5554-8917-5fab-df32a837381f	2342	Ruše
00050000-5554-8917-a3b5-0a62300f074a	1282	Sava
00050000-5554-8917-9880-80a35f139e52	6333	Sečovlje/Sicciole
00050000-5554-8917-55b8-54133bf28b0d	4227	Selca
00050000-5554-8917-6575-8ae64ba51468	2352	Selnica ob Dravi
00050000-5554-8917-fdfa-61a7096d3583	8333	Semič
00050000-5554-8917-521d-230e0e2805b4	8281	Senovo
00050000-5554-8917-cf7e-351fa7264fd7	6224	Senožeče
00050000-5554-8917-3115-0137846bd4ce	8290	Sevnica
00050000-5554-8917-18d6-154b518488cd	6210	Sežana
00050000-5554-8917-8a1f-b672f7dfb575	2214	Sladki Vrh
00050000-5554-8918-990b-f864a44faf65	5283	Slap ob Idrijci
00050000-5554-8918-e2c9-a3c0d76e678f	2380	Slovenj Gradec
00050000-5554-8918-4737-f18606c043aa	2310	Slovenska Bistrica
00050000-5554-8918-de79-00a3158ecef6	3210	Slovenske Konjice
00050000-5554-8918-3c0a-4547efc2e2b2	1216	Smlednik
00050000-5554-8918-1212-01692d248e74	5232	Soča
00050000-5554-8918-86fd-6d80e55ff975	1317	Sodražica
00050000-5554-8918-f893-bfe31b221efd	3335	Solčava
00050000-5554-8918-e2a1-167af2eddc77	5250	Solkan
00050000-5554-8918-cdba-1b599faedb96	4229	Sorica
00050000-5554-8918-c72e-8f88601f2e96	4225	Sovodenj
00050000-5554-8918-8071-f72caed4fede	5281	Spodnja Idrija
00050000-5554-8918-fff6-189086330981	2241	Spodnji Duplek
00050000-5554-8918-8f44-3c181ecb671a	9245	Spodnji Ivanjci
00050000-5554-8918-9600-5428b2556ac9	2277	Središče ob Dravi
00050000-5554-8918-2691-8775f6bc0092	4267	Srednja vas v Bohinju
00050000-5554-8918-99c7-ce71002aeba8	8256	Sromlje 
00050000-5554-8918-9e51-7f975686662f	5224	Srpenica
00050000-5554-8918-4468-20e8303504fe	1242	Stahovica
00050000-5554-8918-2304-d13143b92817	1332	Stara Cerkev
00050000-5554-8918-e946-76e711b3200b	8342	Stari trg ob Kolpi
00050000-5554-8918-ac64-b7dc93ccf6fe	1386	Stari trg pri Ložu
00050000-5554-8918-65e1-7b2f19426ff0	2205	Starše
00050000-5554-8918-6952-a5df72be1cf1	2289	Stoperce
00050000-5554-8918-c91a-6bf20367ded5	8322	Stopiče
00050000-5554-8918-8cef-2d6d920df978	3206	Stranice
00050000-5554-8918-9cc0-84628696ecd0	8351	Straža
00050000-5554-8918-e9d8-32efb074585d	1313	Struge
00050000-5554-8918-879f-9d667e75b5a8	8293	Studenec
00050000-5554-8918-5eba-459ac9dbe505	8331	Suhor
00050000-5554-8918-14d9-3df6be4e79dc	2233	Sv. Ana v Slovenskih goricah
00050000-5554-8918-0c07-9477dc5d5b9e	2235	Sv. Trojica v Slovenskih goricah
00050000-5554-8918-fa81-6918d1b06a30	2353	Sveti Duh na Ostrem Vrhu
00050000-5554-8918-b511-c9d98439ff62	9244	Sveti Jurij ob Ščavnici
00050000-5554-8918-37ad-2b005b11b307	3264	Sveti Štefan
00050000-5554-8918-a9ea-1a3e532c5712	2258	Sveti Tomaž
00050000-5554-8918-373d-484aca21c501	9204	Šalovci
00050000-5554-8918-e31d-6231446c5fc2	5261	Šempas
00050000-5554-8918-e22b-480d5424cdc7	5290	Šempeter pri Gorici
00050000-5554-8918-92f0-94182ebdba7a	3311	Šempeter v Savinjski dolini
00050000-5554-8918-372f-6fab3ef398b3	4208	Šenčur
00050000-5554-8918-eac4-c3850107454f	2212	Šentilj v Slovenskih goricah
00050000-5554-8918-4720-029bee1410bd	8297	Šentjanž
00050000-5554-8918-76f0-a14b114d356a	2373	Šentjanž pri Dravogradu
00050000-5554-8918-9120-e17c79fd9109	8310	Šentjernej
00050000-5554-8918-edd3-5a2e0eae62f1	3230	Šentjur
00050000-5554-8918-d373-4bbff126ab62	3271	Šentrupert
00050000-5554-8918-d488-9e460158e57a	8232	Šentrupert
00050000-5554-8918-5c69-8da597da1fec	1296	Šentvid pri Stični
00050000-5554-8918-3a9c-660d463723ba	8275	Škocjan
00050000-5554-8918-6885-a102f36f4c1d	6281	Škofije
00050000-5554-8918-392d-c6f975e8a0fc	4220	Škofja Loka
00050000-5554-8918-8af1-b673cf945056	3211	Škofja vas
00050000-5554-8918-06bb-2801934a4c03	1291	Škofljica
00050000-5554-8918-5e3e-34ed10744f44	6274	Šmarje
00050000-5554-8918-c289-ca78b5a3f296	1293	Šmarje - Sap
00050000-5554-8918-a61d-4ff37accda7f	3240	Šmarje pri Jelšah
00050000-5554-8918-e27c-3a91188fee18	8220	Šmarješke Toplice
00050000-5554-8918-768e-76d03e706673	2315	Šmartno na Pohorju
00050000-5554-8918-ed19-6049d4feaef2	3341	Šmartno ob Dreti
00050000-5554-8918-42da-444f8e23be90	3327	Šmartno ob Paki
00050000-5554-8918-9cc6-8fb01d76cae2	1275	Šmartno pri Litiji
00050000-5554-8918-c598-850844af4996	2383	Šmartno pri Slovenj Gradcu
00050000-5554-8918-9388-551b79f92133	3201	Šmartno v Rožni dolini
00050000-5554-8918-42b3-96d709938ea3	3325	Šoštanj
00050000-5554-8918-1305-e558c0cfea43	6222	Štanjel
00050000-5554-8918-5d2e-2b6740244d43	3220	Štore
00050000-5554-8918-db74-ed5ae54f966f	3304	Tabor
00050000-5554-8918-b59c-3effa7c7611e	3221	Teharje
00050000-5554-8918-cd92-4c2a888e43a2	9251	Tišina
00050000-5554-8918-46c7-fcddd721e822	5220	Tolmin
00050000-5554-8918-e218-66288e51355a	3326	Topolšica
00050000-5554-8918-aaca-1d151715d033	2371	Trbonje
00050000-5554-8918-d9e1-ac270a7961bc	1420	Trbovlje
00050000-5554-8918-9cca-faadd233760a	8231	Trebelno 
00050000-5554-8918-89ba-869e5eb65217	8210	Trebnje
00050000-5554-8918-5444-9e0f755cdd8d	5252	Trnovo pri Gorici
00050000-5554-8918-2172-2cc18e6c2a69	2254	Trnovska vas
00050000-5554-8918-225e-e5a8239653f6	1222	Trojane
00050000-5554-8918-ea53-90c2d1752816	1236	Trzin
00050000-5554-8918-9caf-70b8fca46a27	4290	Tržič
00050000-5554-8918-a872-459aafc5437c	8295	Tržišče
00050000-5554-8918-09d9-a8c2db096175	1311	Turjak
00050000-5554-8918-0563-00992cf334aa	9224	Turnišče
00050000-5554-8918-5495-43c2b2e37a5c	8323	Uršna sela
00050000-5554-8918-d632-f7d19c524cca	1252	Vače
00050000-5554-8918-23ef-93bf0349c1d4	3320	Velenje 
00050000-5554-8918-59ce-e61df301c213	3322	Velenje - poštni predali
00050000-5554-8918-a84d-555f29232958	8212	Velika Loka
00050000-5554-8918-fe3c-baec8c82e0a9	2274	Velika Nedelja
00050000-5554-8918-a47a-172e60b1efb8	9225	Velika Polana
00050000-5554-8918-ddcd-170f2ad4a7ad	1315	Velike Lašče
00050000-5554-8918-80dd-332bc49a5e8c	8213	Veliki Gaber
00050000-5554-8918-c795-2a269a6e6414	9241	Veržej
00050000-5554-8918-7525-6f53cfee38ae	1312	Videm - Dobrepolje
00050000-5554-8918-6ef6-8eeaa40ede80	2284	Videm pri Ptuju
00050000-5554-8918-8c77-7751e533c0ee	8344	Vinica
00050000-5554-8918-23eb-e794d544c52f	5271	Vipava
00050000-5554-8918-0674-8eab8966c820	4212	Visoko
00050000-5554-8918-0dcc-bb80c57f3847	1294	Višnja Gora
00050000-5554-8918-6529-37e47530bd08	3205	Vitanje
00050000-5554-8918-7ec5-be51f24379fd	2255	Vitomarci
00050000-5554-8918-56d2-560e4b68644b	1217	Vodice
00050000-5554-8918-41f4-3540f7243a16	3212	Vojnik\t
00050000-5554-8918-449d-285c14d2d1af	5293	Volčja Draga
00050000-5554-8918-b2e7-c7cf53d42b3d	2232	Voličina
00050000-5554-8918-ae2e-9e1915c30778	3305	Vransko
00050000-5554-8918-be3c-f17f7869096e	6217	Vremski Britof
00050000-5554-8918-6a17-94ec2f0a9591	1360	Vrhnika
00050000-5554-8918-159a-a945e930df55	2365	Vuhred
00050000-5554-8918-0eb0-31e917163903	2367	Vuzenica
00050000-5554-8918-8c33-80589a767d83	8292	Zabukovje 
00050000-5554-8918-eb39-a77bf5bf0cf1	1410	Zagorje ob Savi
00050000-5554-8918-b6be-d536eb120bcb	1303	Zagradec
00050000-5554-8918-fc30-8a8d1b88694c	2283	Zavrč
00050000-5554-8918-2742-7f152344828c	8272	Zdole 
00050000-5554-8918-230b-0247c5630397	4201	Zgornja Besnica
00050000-5554-8918-e090-f984d4ec306f	2242	Zgornja Korena
00050000-5554-8918-3466-b956e6d94f6b	2201	Zgornja Kungota
00050000-5554-8918-5922-691815beceaa	2316	Zgornja Ložnica
00050000-5554-8918-bd82-8a9724cd7b20	2314	Zgornja Polskava
00050000-5554-8918-bca3-9c3e55a572e1	2213	Zgornja Velka
00050000-5554-8918-387a-e444ab6f1983	4247	Zgornje Gorje
00050000-5554-8918-7a32-c4bb417490e0	4206	Zgornje Jezersko
00050000-5554-8918-e2fd-5339e78a228f	2285	Zgornji Leskovec
00050000-5554-8918-4425-af10edede723	1432	Zidani Most
00050000-5554-8918-fc3e-48071ee4e36b	3214	Zreče
00050000-5554-8918-2314-5204196dbcf4	4209	Žabnica
00050000-5554-8918-fa96-7aad229714c5	3310	Žalec
00050000-5554-8918-f143-17b64a072edd	4228	Železniki
00050000-5554-8918-13b6-39a54730cbf7	2287	Žetale
00050000-5554-8918-deba-c5881933b6eb	4226	Žiri
00050000-5554-8918-3f9d-65231d97a15d	4274	Žirovnica
00050000-5554-8918-81f1-dd7ec664e82b	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 3392752)
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
-- TOC entry 2642 (class 0 OID 3392579)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3392645)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3392764)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3392869)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3392916)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3392793)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3392737)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3392727)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3392906)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3392859)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 3392446)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5554-8918-d35c-77551525b570	00010000-5554-8918-7372-973d077e2b91	2015-05-14 13:38:00	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROhbbZuVPbQ2FDX9R7ZFB9aq5MrQ7xh26";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 3392802)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3392484)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5554-8918-8e0e-37e7ee5c3b18	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5554-8918-4421-e10eeb763231	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5554-8918-a1bc-47dd8435df5f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5554-8918-d77d-f440d05a9a5c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5554-8918-d2e1-84897dd0740d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5554-8918-b894-d18da09dbd63	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 3392468)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5554-8918-d35c-77551525b570	00020000-5554-8918-d77d-f440d05a9a5c
00010000-5554-8918-7372-973d077e2b91	00020000-5554-8918-d77d-f440d05a9a5c
\.


--
-- TOC entry 2668 (class 0 OID 3392816)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3392758)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3392708)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3392544)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3392714)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3392894)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3392614)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3392455)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5554-8918-7372-973d077e2b91	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROkxvF60/sKQ.1F5HIDSG7G3FymNqLScK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5554-8918-d35c-77551525b570	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 3392948)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3392660)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3392785)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3392851)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3392692)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3392938)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3392841)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 3392509)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3392988)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 3392981)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 3392893)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 3392682)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 3392707)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 3392640)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 3392837)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 3392658)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 3392701)
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
-- TOC entry 2364 (class 2606 OID 3392750)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 3392777)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 3392612)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 3392518)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 3392576)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 3392542)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 3392498)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 3392483)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 3392783)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 3392815)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 3392933)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 3392569)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 3392600)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3392756)
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
-- TOC entry 2298 (class 2606 OID 3392590)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 3392649)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3392768)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3392875)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3392921)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 3392800)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 3392741)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 3392732)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3392915)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3392866)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 3392454)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3392806)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3392472)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 3392492)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 3392824)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 3392763)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 3392713)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 3392549)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 3392723)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3392905)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 3392625)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 3392467)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 3392963)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3392667)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 3392791)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 3392857)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 3392696)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 3392947)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 3392850)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 3392689)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 3392571)
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
-- TOC entry 2377 (class 1259 OID 3392784)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 3392770)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 3392769)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 3392668)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 3392840)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 3392838)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 3392839)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 3392935)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 3392936)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 3392937)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 3392966)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 3392965)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 3392964)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 3392627)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 3392626)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 3392578)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 3392577)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 3392807)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 3392702)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 3392499)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 3392500)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 3392827)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 3392826)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 3392825)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 3392650)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 3392652)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 3392651)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 3392736)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 3392734)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 3392733)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 3392735)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 3392473)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 3392474)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 3392792)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 3392757)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 3392867)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 3392868)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 3392592)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3392591)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2296 (class 1259 OID 3392593)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 3392876)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 3392877)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 3392991)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 3392990)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 3392993)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 3392989)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 3392992)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 3392858)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 3392745)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 3392744)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 3392742)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 3392743)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 3392983)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 3392982)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 3392659)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 3392520)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 3392519)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 3392550)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 3392551)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 3392726)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 3392725)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 3392724)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 3392691)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 3392687)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 3392684)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 3392685)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 3392683)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 3392688)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 3392686)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 3392570)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 3392641)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3392643)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 3392642)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 3392644)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 3392751)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 3392934)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 3392543)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 3392613)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 3392801)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 3392601)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 3392922)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 3392493)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 3392690)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 3393124)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 3393109)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 3393114)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 3393134)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 3393104)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 3393129)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 3393119)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 3393039)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 3393219)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 3393214)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 3393209)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 3393099)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 3393259)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 3393249)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3393254)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 3393199)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 3393294)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 3393299)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 3393304)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 3393319)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 3393314)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 3393309)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 3393074)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 3393069)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3393049)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3393044)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 3393024)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 3393229)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 3393139)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 3393004)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 3393009)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 3393244)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 3393239)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 3393234)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 3393079)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3393089)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 3393084)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 3393174)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 3393164)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 3393159)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 3393169)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 3392994)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 3392999)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 3393224)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 3393204)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 3393269)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 3393274)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 3393059)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 3393054)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 3393064)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 3393279)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 3393284)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 3393344)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 3393339)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 3393354)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 3393334)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 3393349)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 3393264)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 3393194)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 3393189)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 3393179)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 3393184)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 3393329)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 3393324)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 3393094)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3393289)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 3393019)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 3393014)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 3393029)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 3393034)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 3393154)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 3393149)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 3393144)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-14 13:38:01 CEST

--
-- PostgreSQL database dump complete
--

