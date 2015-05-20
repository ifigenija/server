--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-20 15:53:30 CEST

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
-- TOC entry 179 (class 1259 OID 4176125)
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
-- TOC entry 225 (class 1259 OID 4176608)
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
-- TOC entry 224 (class 1259 OID 4176591)
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
-- TOC entry 217 (class 1259 OID 4176502)
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
-- TOC entry 193 (class 1259 OID 4176293)
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
-- TOC entry 196 (class 1259 OID 4176327)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4176252)
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
-- TOC entry 212 (class 1259 OID 4176452)
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
-- TOC entry 191 (class 1259 OID 4176277)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4176321)
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
-- TOC entry 201 (class 1259 OID 4176370)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4176395)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4176226)
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
-- TOC entry 180 (class 1259 OID 4176134)
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
-- TOC entry 181 (class 1259 OID 4176145)
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
-- TOC entry 184 (class 1259 OID 4176196)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4176099)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4176118)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4176402)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4176432)
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
-- TOC entry 221 (class 1259 OID 4176547)
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
-- TOC entry 183 (class 1259 OID 4176176)
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
-- TOC entry 186 (class 1259 OID 4176218)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4176376)
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
-- TOC entry 185 (class 1259 OID 4176203)
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
-- TOC entry 190 (class 1259 OID 4176269)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4176388)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4176493)
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
-- TOC entry 220 (class 1259 OID 4176540)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4176417)
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
-- TOC entry 200 (class 1259 OID 4176361)
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
-- TOC entry 199 (class 1259 OID 4176351)
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
-- TOC entry 219 (class 1259 OID 4176530)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4176483)
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
-- TOC entry 173 (class 1259 OID 4176070)
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
-- TOC entry 172 (class 1259 OID 4176068)
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
-- TOC entry 209 (class 1259 OID 4176426)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4176108)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4176092)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4176440)
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
-- TOC entry 203 (class 1259 OID 4176382)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4176332)
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
-- TOC entry 182 (class 1259 OID 4176168)
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
-- TOC entry 198 (class 1259 OID 4176338)
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
-- TOC entry 218 (class 1259 OID 4176518)
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
-- TOC entry 188 (class 1259 OID 4176238)
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
-- TOC entry 174 (class 1259 OID 4176079)
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
-- TOC entry 223 (class 1259 OID 4176572)
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
-- TOC entry 192 (class 1259 OID 4176284)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4176409)
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
-- TOC entry 214 (class 1259 OID 4176475)
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
-- TOC entry 194 (class 1259 OID 4176316)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4176562)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4176465)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4176073)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 4176125)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 4176608)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 4176591)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4176502)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4176293)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4176327)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4176252)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555c-91da-bc27-09aebcda1291	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555c-91da-054a-6b038e7381a8	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555c-91da-3fbf-0ee18ace5cdf	AL	ALB	008	Albania 	Albanija	\N
00040000-555c-91da-42e8-2884cc8ca19e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555c-91da-0822-51f81febffb9	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555c-91da-448f-904fe9df72f9	AD	AND	020	Andorra 	Andora	\N
00040000-555c-91da-e8fc-31a5d305a9fb	AO	AGO	024	Angola 	Angola	\N
00040000-555c-91da-7834-cbb93722419a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555c-91da-332b-13fab118d7e4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555c-91da-ccba-2fe759aba07d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555c-91da-42ff-dfe6236b604e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555c-91da-7ce8-334e69027920	AM	ARM	051	Armenia 	Armenija	\N
00040000-555c-91da-c49b-4e972158683e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555c-91da-e9f1-0a6760b23ac5	AU	AUS	036	Australia 	Avstralija	\N
00040000-555c-91da-07f5-ee8234d6000a	AT	AUT	040	Austria 	Avstrija	\N
00040000-555c-91da-e80f-112f156f81bc	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555c-91da-754f-9787cbb38a79	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555c-91da-2940-1a17c1fc8876	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555c-91da-048c-458f6dd7ce70	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555c-91da-c273-0c92d495a1db	BB	BRB	052	Barbados 	Barbados	\N
00040000-555c-91da-3411-300f9d766d65	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555c-91da-a9ce-40ed51f6eae4	BE	BEL	056	Belgium 	Belgija	\N
00040000-555c-91da-6a91-f7474a9c2c94	BZ	BLZ	084	Belize 	Belize	\N
00040000-555c-91da-a37c-4ed96e058742	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555c-91da-92c3-cbc3b1c630f6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555c-91da-3433-7c2768eacd15	BT	BTN	064	Bhutan 	Butan	\N
00040000-555c-91da-3b96-eca614d6acd5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555c-91da-17d7-3e0b93993896	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555c-91da-5b14-dad1ded60977	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555c-91da-b85d-f7775400a275	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555c-91da-e580-4cd23fc670df	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555c-91da-b6cd-6ddaac083f3f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555c-91da-298f-c7f78c8f59c4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555c-91da-6369-8010d02d6ffd	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555c-91da-ae00-163104b09dcd	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555c-91da-c442-5e7d5ef6cb5e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555c-91da-d981-76024cc6150f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555c-91da-3d6b-e44752e5034b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555c-91da-dec6-be31e4922678	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555c-91da-2307-29dfa2ec92fb	CA	CAN	124	Canada 	Kanada	\N
00040000-555c-91da-c28d-e7b4e56c8530	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555c-91da-3d8c-6ad06feb78e7	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555c-91da-bfe6-e1737afee20f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555c-91da-368d-541b1243f2f8	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555c-91da-1488-ef7fe536c4eb	CL	CHL	152	Chile 	Čile	\N
00040000-555c-91da-5e76-c2421e3ec9c8	CN	CHN	156	China 	Kitajska	\N
00040000-555c-91da-15c5-160db59b3bee	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555c-91da-cbe9-4c1ffd098835	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555c-91da-77bf-c222d203c522	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555c-91da-d300-eb28abef8ffc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555c-91da-6473-7555aef23c7d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555c-91da-0e50-3ed9cdcb7f92	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555c-91da-d831-108558cb2d77	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555c-91da-dabd-98bc97fd0a89	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555c-91da-0ba4-b922bb41d95d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555c-91da-8115-ac4647eeba63	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555c-91da-e6a1-36ce26edbcbf	CU	CUB	192	Cuba 	Kuba	\N
00040000-555c-91da-428c-c41cb2c1d2f7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555c-91da-3c7d-3bfc5e483dd9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555c-91da-d357-806321f94a07	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555c-91da-47b4-ed4eb066ca9d	DK	DNK	208	Denmark 	Danska	\N
00040000-555c-91da-2d3c-ad33af14ad3f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555c-91da-669f-ad722fbd2f56	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555c-91da-28a3-faf63705db9e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555c-91da-4494-179c17c6f7d6	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555c-91da-7be1-45423c3ed85c	EG	EGY	818	Egypt 	Egipt	\N
00040000-555c-91da-c743-4d5edb3861e7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555c-91da-9330-48d2d2537537	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555c-91da-c2c3-955d1fe2fecb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555c-91da-85b6-2e28155706ea	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555c-91da-9621-3adee1729aa8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555c-91da-e70a-f49b1cb2beb4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555c-91da-bdc2-a0ec023657e6	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555c-91da-45d9-06ba9622ab47	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555c-91da-69e2-051a36b5bbd8	FI	FIN	246	Finland 	Finska	\N
00040000-555c-91da-1847-055c5ac5ae98	FR	FRA	250	France 	Francija	\N
00040000-555c-91da-55d4-606332bf22c0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555c-91da-94a1-e3151f3127f5	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555c-91da-69da-14d8cadace02	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555c-91da-6dea-a6c52813b7b7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555c-91da-ed43-bb41c08a6f5a	GA	GAB	266	Gabon 	Gabon	\N
00040000-555c-91da-a359-46329f13e30b	GM	GMB	270	Gambia 	Gambija	\N
00040000-555c-91da-ffec-75b85e542bd9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555c-91da-9245-0b1d30f58440	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555c-91da-52d3-0d48a8ea64a0	GH	GHA	288	Ghana 	Gana	\N
00040000-555c-91da-8eeb-a40df52b3bcd	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555c-91da-1ba9-eb33f84a57e1	GR	GRC	300	Greece 	Grčija	\N
00040000-555c-91da-b76b-116bf302fe04	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555c-91da-0cab-8cf36bf83c0b	GD	GRD	308	Grenada 	Grenada	\N
00040000-555c-91da-bf03-ba9f2fac1506	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555c-91da-f01e-34e86b4caaf4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555c-91da-5ff4-723259963f3e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555c-91da-bd0d-d775bf2c30f7	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555c-91da-6b0a-147675aef6d5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555c-91da-6a48-f63ef81e0bad	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555c-91da-0941-2e987231863b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555c-91da-9789-db2d7e6da39d	HT	HTI	332	Haiti 	Haiti	\N
00040000-555c-91da-386b-f13f85e55983	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555c-91da-4fc5-2550d44653e5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555c-91da-a8ac-4be5afdb4094	HN	HND	340	Honduras 	Honduras	\N
00040000-555c-91da-7a60-eec0043ae61b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555c-91da-9fde-52011b096bb4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555c-91da-5a10-75802d72c6a2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555c-91da-1ecb-e1fe5bc3b03c	IN	IND	356	India 	Indija	\N
00040000-555c-91da-2980-10dd4fc5019f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555c-91da-687a-ebb0e011e14a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555c-91da-d3cf-014fa4500435	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555c-91da-1571-da03919c4c38	IE	IRL	372	Ireland 	Irska	\N
00040000-555c-91da-3793-ca16a16b7bb9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555c-91da-83b1-0b248262a7b5	IL	ISR	376	Israel 	Izrael	\N
00040000-555c-91da-7885-32d174c257be	IT	ITA	380	Italy 	Italija	\N
00040000-555c-91da-5327-84676ed14fb6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555c-91da-5ba8-f5661f743cb1	JP	JPN	392	Japan 	Japonska	\N
00040000-555c-91da-eaea-b8cdb63098ba	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555c-91da-3a2d-e2989f3831f0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555c-91da-62b1-6e26b620add9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555c-91da-df05-7f4e5d4f1cea	KE	KEN	404	Kenya 	Kenija	\N
00040000-555c-91da-7554-fd9465334340	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555c-91da-a408-826ad076fb88	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555c-91da-49a4-bf4bf10c2923	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555c-91da-2a4b-fcb7b48a4cc5	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555c-91da-f724-03aa9c2ba682	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555c-91da-f2a2-52cdaa11f1a7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555c-91da-59a8-42781d706390	LV	LVA	428	Latvia 	Latvija	\N
00040000-555c-91da-8ecf-e5db8216b748	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555c-91da-0450-596f8f76f986	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555c-91da-397d-7ee8db76773d	LR	LBR	430	Liberia 	Liberija	\N
00040000-555c-91da-b591-cd4331994a47	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555c-91da-0bcc-c0f63d1b0af6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555c-91da-ceff-d799e041a220	LT	LTU	440	Lithuania 	Litva	\N
00040000-555c-91da-8ee0-365e33235331	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555c-91da-4338-20db27b8dbe1	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555c-91da-ab5f-70c1bcea5391	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555c-91da-e9ad-409e71275a5d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555c-91da-0e48-6e7e31a2d09e	MW	MWI	454	Malawi 	Malavi	\N
00040000-555c-91da-d396-f69fa2fceea9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555c-91da-3fd5-3670aef2c12e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555c-91da-821c-d109894cd39c	ML	MLI	466	Mali 	Mali	\N
00040000-555c-91da-36cd-67f1a563897d	MT	MLT	470	Malta 	Malta	\N
00040000-555c-91da-2ae0-b030d2ed2078	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555c-91da-e0cd-876d30e50156	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555c-91da-4354-540d6f9fd69b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555c-91da-f98f-44ddb4619863	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555c-91da-c812-fb4511a90e34	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555c-91da-dfd3-217723249ddf	MX	MEX	484	Mexico 	Mehika	\N
00040000-555c-91da-3c8e-72d56b9f65c6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555c-91da-b96e-0160f86be46a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555c-91da-3ab5-dd29ba04b31e	MC	MCO	492	Monaco 	Monako	\N
00040000-555c-91da-dc31-250bb7af4dc2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555c-91da-3296-dc1fc831ddcc	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555c-91da-fb3c-6ec07e752f8c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555c-91da-7b88-c4e712d065a2	MA	MAR	504	Morocco 	Maroko	\N
00040000-555c-91da-b456-043264b0bda4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555c-91da-9e69-82ea727a8f04	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555c-91da-493e-1a39d01c3dc7	NA	NAM	516	Namibia 	Namibija	\N
00040000-555c-91da-bae5-a6d603ce6b9e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555c-91da-66c7-aa0ad1266d08	NP	NPL	524	Nepal 	Nepal	\N
00040000-555c-91da-0309-5b5814778193	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555c-91da-40de-b6692e172830	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555c-91da-0770-d12c41f3f5e7	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555c-91da-2879-c7744d070cbc	NE	NER	562	Niger 	Niger 	\N
00040000-555c-91da-1621-68966caeb3ca	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555c-91da-3672-bfdcc17d7d34	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555c-91da-3873-162f595e407e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555c-91da-6d26-e04054deefee	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555c-91da-7e84-4b997f50f9ca	NO	NOR	578	Norway 	Norveška	\N
00040000-555c-91da-a1e3-00d80859f91c	OM	OMN	512	Oman 	Oman	\N
00040000-555c-91da-7a14-e8d8561d66ce	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555c-91da-0839-5ecb7da9aa33	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555c-91da-862f-1032a8e14918	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555c-91da-7b0d-40cc7032b1ef	PA	PAN	591	Panama 	Panama	\N
00040000-555c-91da-ec4e-a622951f9423	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555c-91da-69b1-ee4d1c94f5d8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555c-91da-eab9-940bddd6f4ab	PE	PER	604	Peru 	Peru	\N
00040000-555c-91da-c38a-c8724bf83b3f	PH	PHL	608	Philippines 	Filipini	\N
00040000-555c-91da-8a47-e56406dd6e5e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555c-91da-4a87-1034e1748031	PL	POL	616	Poland 	Poljska	\N
00040000-555c-91da-accf-88a94148d712	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555c-91da-2842-67cbc4da40db	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555c-91da-c4b0-116ea4a835cb	QA	QAT	634	Qatar 	Katar	\N
00040000-555c-91da-e937-cbcb796a8d60	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555c-91da-0b4a-12b2dd16d2fe	RO	ROU	642	Romania 	Romunija	\N
00040000-555c-91da-a43b-1bc6832f8e56	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555c-91da-8b3d-18700ef1231e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555c-91da-c5f3-8b11bd4190c2	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555c-91da-a82f-d18404a97191	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555c-91da-8df1-138cb78bc932	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555c-91da-2cb3-73d5d62ccbe6	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555c-91da-38ec-d9aacf950fec	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555c-91da-7ecf-5ccafe8b9cf5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555c-91da-cf8e-c59e80d48290	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555c-91da-9f38-eea0129b8146	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555c-91da-b9a5-aa4c64e4d1e9	SM	SMR	674	San Marino 	San Marino	\N
00040000-555c-91da-f19b-ea8ed0546298	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555c-91da-08c7-9ba113ee2313	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555c-91da-9287-c4e1f19ad036	SN	SEN	686	Senegal 	Senegal	\N
00040000-555c-91da-d8e6-fdd2d83438dd	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555c-91da-feea-b3cd10c140a3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555c-91da-4245-48d3f7500380	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555c-91da-2137-f7c55da5068c	SG	SGP	702	Singapore 	Singapur	\N
00040000-555c-91da-e688-fad9560bfc95	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555c-91da-6a69-4035b0386e29	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555c-91da-e815-26d0eaf85798	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555c-91da-0c1f-175715bf4abd	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555c-91da-cef2-512049a83556	SO	SOM	706	Somalia 	Somalija	\N
00040000-555c-91da-e4ad-717a8902edea	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555c-91da-4876-c6da4a2f571d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555c-91da-ca01-6044b42beab3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555c-91da-756c-8d6625eb1b97	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555c-91da-c0ab-79fbfaa5cf17	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555c-91da-8763-f2b9dac720a9	SD	SDN	729	Sudan 	Sudan	\N
00040000-555c-91da-8be8-ae35ea8ceb7e	SR	SUR	740	Suriname 	Surinam	\N
00040000-555c-91da-34fc-739a3a0ebd6f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555c-91da-88fc-14cdfac4610d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555c-91da-ab4e-a8244792cd5e	SE	SWE	752	Sweden 	Švedska	\N
00040000-555c-91da-d1be-c579b9c13e86	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555c-91da-a1b9-635b41f36fb1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555c-91da-fe26-1bc6eab18903	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555c-91da-017c-4d48fe337def	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555c-91da-baf5-5bcb89dd4e82	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555c-91da-5906-c29089885773	TH	THA	764	Thailand 	Tajska	\N
00040000-555c-91da-beeb-0d26aa855e6a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555c-91da-485b-82daebfe1678	TG	TGO	768	Togo 	Togo	\N
00040000-555c-91da-bb73-19cdc34f4576	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555c-91da-6e51-1b42e97fad48	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555c-91da-c4d9-c2d2bbe39fcc	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555c-91da-7405-5f2e361394d0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555c-91da-8269-2dd4727924ef	TR	TUR	792	Turkey 	Turčija	\N
00040000-555c-91da-9da6-6cc961b2466c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555c-91da-52db-93c03d95ccc4	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555c-91da-112a-c75a9ac1d2d1	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555c-91da-0b99-3d2d2c382dbd	UG	UGA	800	Uganda 	Uganda	\N
00040000-555c-91da-f535-ec7b6b8d5413	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555c-91da-30f8-834b37bdc07d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555c-91da-cf60-fc89217972d4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555c-91da-48ed-955c102598f4	US	USA	840	United States 	Združene države Amerike	\N
00040000-555c-91da-0b7a-028c05364c07	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555c-91da-af56-a39af9386d00	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555c-91da-38d3-aaf3d44a5090	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555c-91da-bbd2-e9e9a692b274	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555c-91da-7252-a31f1c7125e0	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555c-91da-9580-c7d2fe5d8fbf	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555c-91da-e14f-deef83ce65ba	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555c-91da-b2ba-d405f5c2527d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555c-91da-1aa5-408cf0acf9fe	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555c-91da-da2b-5ecf1bfa7491	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555c-91da-722f-15af9b045586	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555c-91da-3904-cf39c7ccc424	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555c-91da-70e3-883f5fba7442	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 4176452)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4176277)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4176321)
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
-- TOC entry 2658 (class 0 OID 4176370)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 4176395)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4176226)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555c-91da-e3f7-c945955b7e98	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555c-91da-baf2-da5cf207dbd3	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555c-91da-61d0-7c83231a394f	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555c-91da-3747-847cf420ed75	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555c-91da-d3fb-301bb9c39d38	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555c-91da-7753-44d6855fb16d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555c-91da-28e4-4ddb20f86058	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555c-91da-5de2-ca8b905e492b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555c-91da-7528-0c10f2ea5c49	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555c-91da-5e5b-64b91a4fa984	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 4176134)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555c-91da-edfe-b2bf3c26fd52	00000000-555c-91da-d3fb-301bb9c39d38	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555c-91da-0e29-3218263d6556	00000000-555c-91da-d3fb-301bb9c39d38	00010000-555c-91da-2e96-c858a37bd5a6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555c-91da-d2f7-e06c43758677	00000000-555c-91da-7753-44d6855fb16d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 4176145)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4176196)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 4176099)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555c-91da-b434-5624be75df0c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555c-91da-ebb9-1964badd9007	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555c-91da-ece5-e2756ccf3f58	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555c-91da-7d99-b7b1c845d190	Abonma-read	Abonma - branje	f
00030000-555c-91da-e526-660f0f04c932	Abonma-write	Abonma - spreminjanje	f
00030000-555c-91da-bace-092f0ed497f4	Alternacija-read	Alternacija - branje	f
00030000-555c-91da-1370-da16eff1e55e	Alternacija-write	Alternacija - spreminjanje	f
00030000-555c-91da-9249-464b677bbc37	Arhivalija-read	Arhivalija - branje	f
00030000-555c-91da-886a-1bda874a5fa1	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555c-91da-c338-8d2c587aa53d	Besedilo-read	Besedilo - branje	f
00030000-555c-91da-afc1-4a2cfa148201	Besedilo-write	Besedilo - spreminjanje	f
00030000-555c-91da-f484-4138c8a45a49	DogodekIzven-read	DogodekIzven - branje	f
00030000-555c-91da-4014-6099fcfafedc	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555c-91da-fcc6-39ed551a44a1	Dogodek-read	Dogodek - branje	f
00030000-555c-91da-53cf-dc28f9255e85	Dogodek-write	Dogodek - spreminjanje	f
00030000-555c-91da-fbe4-1976aa9f3182	Drzava-read	Drzava - branje	f
00030000-555c-91da-fffa-0060bea33574	Drzava-write	Drzava - spreminjanje	f
00030000-555c-91da-fd08-e4ef8aa015c9	Funkcija-read	Funkcija - branje	f
00030000-555c-91da-5614-e4daa78d175f	Funkcija-write	Funkcija - spreminjanje	f
00030000-555c-91da-bdbf-19d2629d9ed3	Gostovanje-read	Gostovanje - branje	f
00030000-555c-91da-0c18-55a6fe1954bd	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555c-91da-94a3-0dcc275b2a3d	Gostujoca-read	Gostujoca - branje	f
00030000-555c-91da-7b24-5714392f8b2e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555c-91da-1d6b-828b1a218211	Kupec-read	Kupec - branje	f
00030000-555c-91da-c02e-2f0ca9bf670b	Kupec-write	Kupec - spreminjanje	f
00030000-555c-91da-2ded-018667e0a6b7	NacinPlacina-read	NacinPlacina - branje	f
00030000-555c-91da-6ad1-6df3be365066	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555c-91da-51be-37161d2c48a2	Option-read	Option - branje	f
00030000-555c-91da-754c-473112ea074f	Option-write	Option - spreminjanje	f
00030000-555c-91da-0978-6a8dc946d144	OptionValue-read	OptionValue - branje	f
00030000-555c-91da-8481-f4a583b7765d	OptionValue-write	OptionValue - spreminjanje	f
00030000-555c-91da-06c0-af7d6e9a6480	Oseba-read	Oseba - branje	f
00030000-555c-91da-095b-24d326433717	Oseba-write	Oseba - spreminjanje	f
00030000-555c-91da-c1b6-33ad2a67f8ac	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555c-91da-ee1c-dc7868a893b4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555c-91da-54ec-089b3521e2ce	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555c-91da-fada-027e12dc6ef6	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555c-91da-6ad1-8f8da44330bd	Pogodba-read	Pogodba - branje	f
00030000-555c-91da-ed16-736af7dbd1df	Pogodba-write	Pogodba - spreminjanje	f
00030000-555c-91da-1012-ed4f1bc8e9b4	Popa-read	Popa - branje	f
00030000-555c-91da-d712-4c54d11cb0dd	Popa-write	Popa - spreminjanje	f
00030000-555c-91da-693e-9a730b83e81d	Posta-read	Posta - branje	f
00030000-555c-91da-5293-06fbf06d8cb7	Posta-write	Posta - spreminjanje	f
00030000-555c-91da-a536-36ca03875ad8	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555c-91da-cfc3-985a58c71b21	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555c-91da-d56f-710963540db7	PostniNaslov-read	PostniNaslov - branje	f
00030000-555c-91da-fb89-8b2e950b4609	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555c-91da-c6de-846adf170961	Predstava-read	Predstava - branje	f
00030000-555c-91da-a2bf-5928cbf1866a	Predstava-write	Predstava - spreminjanje	f
00030000-555c-91da-c33c-16e520938e67	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555c-91da-f87d-b949f77a9255	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555c-91da-a117-33d97916ae98	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555c-91da-8d5a-4ffc781395b7	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555c-91da-2baa-467a62eb110d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555c-91da-ee4a-5fee37623603	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555c-91da-c569-53ee4b16c2ee	Prostor-read	Prostor - branje	f
00030000-555c-91da-7cfd-556c9306e67f	Prostor-write	Prostor - spreminjanje	f
00030000-555c-91da-4193-e938348e2e96	Racun-read	Racun - branje	f
00030000-555c-91da-bd2e-4795930304ef	Racun-write	Racun - spreminjanje	f
00030000-555c-91da-2f73-3ba09da6e44e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555c-91da-fd00-2585bdaccc29	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555c-91da-3daf-628fefcca647	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555c-91da-0eb7-49204f660546	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555c-91da-c487-d1ac8316c511	Rekvizit-read	Rekvizit - branje	f
00030000-555c-91da-7658-038b5016b8ff	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555c-91da-3568-9348139327aa	Rezervacija-read	Rezervacija - branje	f
00030000-555c-91da-d966-2eb6314750b0	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555c-91da-4265-e9782d992415	SedezniRed-read	SedezniRed - branje	f
00030000-555c-91da-8789-3018a415e21d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555c-91da-56f5-ce184376f430	Sedez-read	Sedez - branje	f
00030000-555c-91da-bc17-93b34a6a911c	Sedez-write	Sedez - spreminjanje	f
00030000-555c-91da-a12b-733863f64924	Sezona-read	Sezona - branje	f
00030000-555c-91da-3b1f-7cc24b1d90b5	Sezona-write	Sezona - spreminjanje	f
00030000-555c-91da-62b1-a17326579058	Telefonska-read	Telefonska - branje	f
00030000-555c-91da-d204-ad2e5af2a075	Telefonska-write	Telefonska - spreminjanje	f
00030000-555c-91da-2649-7f824d5b8cbe	TerminStoritve-read	TerminStoritve - branje	f
00030000-555c-91da-2ab0-8310f655d140	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555c-91da-f62c-1c6e686dc1ab	TipFunkcije-read	TipFunkcije - branje	f
00030000-555c-91da-423a-9952508864b4	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555c-91da-3fc4-276466eede0d	Trr-read	Trr - branje	f
00030000-555c-91da-7e21-67144d4a4922	Trr-write	Trr - spreminjanje	f
00030000-555c-91da-c30e-342908cdd5d3	Uprizoritev-read	Uprizoritev - branje	f
00030000-555c-91da-cb18-c5e29702d44f	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555c-91da-0ed0-b4cbb6f17593	Vaja-read	Vaja - branje	f
00030000-555c-91da-4997-5226358f522c	Vaja-write	Vaja - spreminjanje	f
00030000-555c-91da-b216-f7a84df2139d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555c-91da-e00a-29295dfc1735	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555c-91da-b8c1-f0cb9656710f	Zaposlitev-read	Zaposlitev - branje	f
00030000-555c-91da-19ca-12976cc18486	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555c-91da-7649-666db2f8d3ed	Zasedenost-read	Zasedenost - branje	f
00030000-555c-91da-284f-126806435059	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555c-91da-07b7-1dc660940fad	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555c-91da-b034-743e900e8233	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555c-91da-e9b7-7f67ce5a3f82	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555c-91da-8050-d3ecc094bbee	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 4176118)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555c-91da-4318-0c47d8c24cbb	00030000-555c-91da-fbe4-1976aa9f3182
00020000-555c-91da-5eb9-d10f9124ee8c	00030000-555c-91da-fffa-0060bea33574
00020000-555c-91da-5eb9-d10f9124ee8c	00030000-555c-91da-fbe4-1976aa9f3182
\.


--
-- TOC entry 2663 (class 0 OID 4176402)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4176432)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4176547)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4176176)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4176218)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555c-91d9-ba2d-d4a237cad0ff	8341	Adlešiči
00050000-555c-91d9-b49a-9999b386a9bf	5270	Ajdovščina
00050000-555c-91d9-acec-c220b7eaf3e8	6280	Ankaran/Ancarano
00050000-555c-91d9-bb73-d33b029bda09	9253	Apače
00050000-555c-91d9-ff4c-02569f1c0c6b	8253	Artiče
00050000-555c-91d9-2aef-c0752cff230f	4275	Begunje na Gorenjskem
00050000-555c-91d9-29d4-1eadcde03f3f	1382	Begunje pri Cerknici
00050000-555c-91d9-e96b-2c88d5bf0fc3	9231	Beltinci
00050000-555c-91d9-4f1e-8e11fce5f280	2234	Benedikt
00050000-555c-91d9-577f-9be5aa0b9a53	2345	Bistrica ob Dravi
00050000-555c-91d9-a0e5-6f7acd3d3dee	3256	Bistrica ob Sotli
00050000-555c-91d9-645f-b5a836963a58	8259	Bizeljsko
00050000-555c-91d9-6ba8-f27e49a66243	1223	Blagovica
00050000-555c-91d9-fb5e-36e56b06a69d	8283	Blanca
00050000-555c-91d9-e1e5-bbe5e47a84f2	4260	Bled
00050000-555c-91d9-cdea-2be1cea36254	4273	Blejska Dobrava
00050000-555c-91d9-c3ed-2ca797fab7a3	9265	Bodonci
00050000-555c-91d9-f6e1-c890ce3e0ac8	9222	Bogojina
00050000-555c-91d9-da94-962d59cc89c9	4263	Bohinjska Bela
00050000-555c-91d9-53f7-d40ea594fa94	4264	Bohinjska Bistrica
00050000-555c-91d9-a88c-e24dd1c39d60	4265	Bohinjsko jezero
00050000-555c-91d9-49e8-fa584407ea1b	1353	Borovnica
00050000-555c-91d9-ed80-034db1b89a1b	8294	Boštanj
00050000-555c-91d9-e2da-52a9bb5546fd	5230	Bovec
00050000-555c-91d9-7f42-f90e97225fb6	5295	Branik
00050000-555c-91d9-e1fc-f2facdb6d354	3314	Braslovče
00050000-555c-91d9-75f8-b519ed199d06	5223	Breginj
00050000-555c-91d9-fa37-86460d20860e	8280	Brestanica
00050000-555c-91d9-8ff8-5d0393b03f45	2354	Bresternica
00050000-555c-91d9-0e2c-e001ecb5f31a	4243	Brezje
00050000-555c-91d9-9b9f-d2037d17263f	1351	Brezovica pri Ljubljani
00050000-555c-91d9-f161-01c59f0e3dd1	8250	Brežice
00050000-555c-91d9-c846-74ded5576720	4210	Brnik - Aerodrom
00050000-555c-91d9-d420-5c7d2205507b	8321	Brusnice
00050000-555c-91d9-d446-275e1ddbc6bc	3255	Buče
00050000-555c-91d9-1011-6a3b7213850f	8276	Bučka 
00050000-555c-91d9-8f53-4d1c0ddac457	9261	Cankova
00050000-555c-91d9-71e5-344ef1d38293	3000	Celje 
00050000-555c-91d9-4bb8-38e555439989	3001	Celje - poštni predali
00050000-555c-91d9-5d18-dd70ccff0dc5	4207	Cerklje na Gorenjskem
00050000-555c-91d9-aadc-a15a9dcc4186	8263	Cerklje ob Krki
00050000-555c-91d9-f87a-c37041c69f57	1380	Cerknica
00050000-555c-91d9-1753-ea70da21d26f	5282	Cerkno
00050000-555c-91d9-4314-521723096e1d	2236	Cerkvenjak
00050000-555c-91d9-6e04-eedf0e122ff3	2215	Ceršak
00050000-555c-91d9-2d2b-2a2845d1c912	2326	Cirkovce
00050000-555c-91d9-a430-ca5c8f7e87ef	2282	Cirkulane
00050000-555c-91d9-d17e-a61e49359500	5273	Col
00050000-555c-91d9-1fa4-552637132913	8251	Čatež ob Savi
00050000-555c-91d9-30d4-cc06de817924	1413	Čemšenik
00050000-555c-91d9-503e-c5ba44fbfcb6	5253	Čepovan
00050000-555c-91d9-06ae-b55050d19f42	9232	Črenšovci
00050000-555c-91d9-b574-b6975d387e4b	2393	Črna na Koroškem
00050000-555c-91d9-6ce7-db0bbcf767f9	6275	Črni Kal
00050000-555c-91d9-97b2-6ae0b3f2cf67	5274	Črni Vrh nad Idrijo
00050000-555c-91d9-6148-6f1996639693	5262	Črniče
00050000-555c-91d9-407c-ddea1980ca5e	8340	Črnomelj
00050000-555c-91d9-5d1f-f6d172b4c68e	6271	Dekani
00050000-555c-91d9-952c-08b8eafabb0d	5210	Deskle
00050000-555c-91d9-d62b-14e818c49dac	2253	Destrnik
00050000-555c-91d9-35d1-d8298ea86da9	6215	Divača
00050000-555c-91d9-5eff-cf0b72337a62	1233	Dob
00050000-555c-91d9-c755-601e3b5a1edf	3224	Dobje pri Planini
00050000-555c-91d9-7ec3-25ebb029cdd8	8257	Dobova
00050000-555c-91d9-2205-633f7be0c4b0	1423	Dobovec
00050000-555c-91d9-f3c1-c48f3df7dd22	5263	Dobravlje
00050000-555c-91d9-7bf0-c13aa47d8fd6	3204	Dobrna
00050000-555c-91d9-fd1e-a99461cdf9ef	8211	Dobrnič
00050000-555c-91d9-cc64-e93c1390a4f8	1356	Dobrova
00050000-555c-91d9-34ce-d51e3efceca7	9223	Dobrovnik/Dobronak 
00050000-555c-91d9-0b91-ab463418ae38	5212	Dobrovo v Brdih
00050000-555c-91d9-ee1a-004732cce1b1	1431	Dol pri Hrastniku
00050000-555c-91d9-ee32-62f5e63f28d4	1262	Dol pri Ljubljani
00050000-555c-91d9-5242-be93adc93f75	1273	Dole pri Litiji
00050000-555c-91d9-88f4-453fa65c2e03	1331	Dolenja vas
00050000-555c-91d9-91ff-e4cd26c18919	8350	Dolenjske Toplice
00050000-555c-91d9-e0bb-776a85b05cc0	1230	Domžale
00050000-555c-91d9-00da-917a532f3778	2252	Dornava
00050000-555c-91d9-f665-428015ca0b20	5294	Dornberk
00050000-555c-91d9-b317-5810be096625	1319	Draga
00050000-555c-91d9-9aaf-4786460a0cf7	8343	Dragatuš
00050000-555c-91d9-5e23-d3c4e34b865d	3222	Dramlje
00050000-555c-91d9-9b18-db86dff0630d	2370	Dravograd
00050000-555c-91d9-4b82-9ac1c0d2e6ea	4203	Duplje
00050000-555c-91d9-a56c-27133ba4a581	6221	Dutovlje
00050000-555c-91d9-cddf-0126c2189bdc	8361	Dvor
00050000-555c-91d9-b92d-0ba492e3d8cf	2343	Fala
00050000-555c-91d9-83fd-8304f6418255	9208	Fokovci
00050000-555c-91d9-3e9e-8aaccb6ebc23	2313	Fram
00050000-555c-91d9-2834-74065715b5a9	3213	Frankolovo
00050000-555c-91d9-16f0-fe1bf67e204a	1274	Gabrovka
00050000-555c-91d9-0d28-be4856fc25bf	8254	Globoko
00050000-555c-91d9-f71c-7c7071045185	5275	Godovič
00050000-555c-91d9-a12b-82e2dd508b38	4204	Golnik
00050000-555c-91d9-e9de-cfda9a1dba24	3303	Gomilsko
00050000-555c-91d9-6a7c-8c22b11426e5	4224	Gorenja vas
00050000-555c-91d9-bde0-6741f7302e11	3263	Gorica pri Slivnici
00050000-555c-91d9-ce2f-87adfffd598c	2272	Gorišnica
00050000-555c-91d9-ad71-fe84255b420f	9250	Gornja Radgona
00050000-555c-91d9-942b-879f10ed4ea7	3342	Gornji Grad
00050000-555c-91d9-9a68-2ff9b2869535	4282	Gozd Martuljek
00050000-555c-91d9-26b4-119d92193e34	6272	Gračišče
00050000-555c-91d9-3f27-ad746872f814	9264	Grad
00050000-555c-91d9-10ee-458fcd90d6d9	8332	Gradac
00050000-555c-91d9-1f6c-dfdea78f82b3	1384	Grahovo
00050000-555c-91d9-c025-def119660d09	5242	Grahovo ob Bači
00050000-555c-91d9-a436-07fb6cf9f7c9	5251	Grgar
00050000-555c-91d9-33bb-aa367691f2a4	3302	Griže
00050000-555c-91d9-7fc7-b25d9f5f1821	3231	Grobelno
00050000-555c-91d9-6c59-82cb741fb38c	1290	Grosuplje
00050000-555c-91d9-f342-7fc8baccafeb	2288	Hajdina
00050000-555c-91d9-8f09-12927cc76ed2	8362	Hinje
00050000-555c-91d9-e9a0-6439b509065f	2311	Hoče
00050000-555c-91d9-c2f4-2d9a5e14a0dd	9205	Hodoš/Hodos
00050000-555c-91d9-9dd1-22a6f125817e	1354	Horjul
00050000-555c-91d9-c108-0bb53bd1a79d	1372	Hotedršica
00050000-555c-91d9-3aa8-b0440d5f20c0	1430	Hrastnik
00050000-555c-91d9-5230-0bc4e58c6714	6225	Hruševje
00050000-555c-91d9-dcf8-5f7cf6f74aab	4276	Hrušica
00050000-555c-91d9-2f55-639afa5a6759	5280	Idrija
00050000-555c-91d9-432f-7a5e29908180	1292	Ig
00050000-555c-91d9-3302-1606ebe039c6	6250	Ilirska Bistrica
00050000-555c-91d9-0f5c-1de3b8b9226f	6251	Ilirska Bistrica-Trnovo
00050000-555c-91d9-525c-b6f90b31378f	1295	Ivančna Gorica
00050000-555c-91d9-0b15-2d9e1fb3fd89	2259	Ivanjkovci
00050000-555c-91d9-eb1f-eaf61fe9ae4d	1411	Izlake
00050000-555c-91d9-df8b-0af3d07f32d9	6310	Izola/Isola
00050000-555c-91d9-d1b9-f2bf26c121a7	2222	Jakobski Dol
00050000-555c-91d9-592f-a506a93f3917	2221	Jarenina
00050000-555c-91d9-e0ac-4622c4ccb67d	6254	Jelšane
00050000-555c-91d9-d186-20e4c228c6e0	4270	Jesenice
00050000-555c-91d9-215e-2e17d1c8efa5	8261	Jesenice na Dolenjskem
00050000-555c-91d9-f614-6a128f47918b	3273	Jurklošter
00050000-555c-91d9-bb73-23630a4dd4bc	2223	Jurovski Dol
00050000-555c-91d9-9df2-7dc8ddbe73d6	2256	Juršinci
00050000-555c-91d9-059b-6a4a9308c974	5214	Kal nad Kanalom
00050000-555c-91d9-afb0-c3874300cc0f	3233	Kalobje
00050000-555c-91d9-4ad4-e7fa86b6a370	4246	Kamna Gorica
00050000-555c-91d9-adeb-dde86e114fe2	2351	Kamnica
00050000-555c-91d9-8757-ca916aa1808a	1241	Kamnik
00050000-555c-91d9-9398-a78415ff962b	5213	Kanal
00050000-555c-91d9-fea4-3b9c2c73aecb	8258	Kapele
00050000-555c-91d9-23b2-c7805c7ea29d	2362	Kapla
00050000-555c-91d9-869b-0c9ff09fb036	2325	Kidričevo
00050000-555c-91d9-70eb-c7c05b4855e6	1412	Kisovec
00050000-555c-91d9-8041-11afe841326a	6253	Knežak
00050000-555c-91d9-d385-5f38e6f65d7b	5222	Kobarid
00050000-555c-91d9-9a56-0faf649b1ebb	9227	Kobilje
00050000-555c-91d9-1fd6-900f72759ca4	1330	Kočevje
00050000-555c-91d9-aa66-846d3db2c05f	1338	Kočevska Reka
00050000-555c-91d9-d7d0-9556bfd6f139	2276	Kog
00050000-555c-91d9-bf6c-476588d0cdc7	5211	Kojsko
00050000-555c-91d9-c1a0-7661054c1c53	6223	Komen
00050000-555c-91d9-cddc-a5abaa48b346	1218	Komenda
00050000-555c-91d9-52ae-6dea74af7317	6000	Koper/Capodistria 
00050000-555c-91d9-e83b-ca24afcdedb7	6001	Koper/Capodistria - poštni predali
00050000-555c-91d9-afe8-14a3726b4bfb	8282	Koprivnica
00050000-555c-91d9-5744-ff6fb36329d9	5296	Kostanjevica na Krasu
00050000-555c-91d9-3764-efc86b2d7699	8311	Kostanjevica na Krki
00050000-555c-91d9-e5b2-9d552ab4df5f	1336	Kostel
00050000-555c-91d9-b653-d108e67d4583	6256	Košana
00050000-555c-91d9-d8cf-b6776889dfa3	2394	Kotlje
00050000-555c-91d9-6942-487a1fa683ea	6240	Kozina
00050000-555c-91d9-c12d-3a34c36ac762	3260	Kozje
00050000-555c-91d9-13c0-723addde3c8b	4000	Kranj 
00050000-555c-91d9-6676-5fa5b9aca881	4001	Kranj - poštni predali
00050000-555c-91d9-47ba-b3f8af9e42f7	4280	Kranjska Gora
00050000-555c-91d9-b432-4d6ee1f5dd1c	1281	Kresnice
00050000-555c-91d9-0fe7-d6e4daf8609f	4294	Križe
00050000-555c-91d9-dc02-06f4af675fa2	9206	Križevci
00050000-555c-91d9-22cf-607b57cafb3b	9242	Križevci pri Ljutomeru
00050000-555c-91d9-f3ff-46c65f97c5d4	1301	Krka
00050000-555c-91d9-018d-853d35a3b71c	8296	Krmelj
00050000-555c-91d9-37c7-8f887acb12c5	4245	Kropa
00050000-555c-91d9-f2ba-85e8f63f3f27	8262	Krška vas
00050000-555c-91d9-abf4-81f562c6c949	8270	Krško
00050000-555c-91d9-9ae7-34ebc78081fc	9263	Kuzma
00050000-555c-91d9-4bdf-59b6827ac369	2318	Laporje
00050000-555c-91d9-fd0d-28f761107720	3270	Laško
00050000-555c-91d9-6d74-f72e6cbe10ca	1219	Laze v Tuhinju
00050000-555c-91d9-582f-121daff88e7c	2230	Lenart v Slovenskih goricah
00050000-555c-91d9-38ea-9dbfad708178	9220	Lendava/Lendva
00050000-555c-91d9-e921-dcbaca6dec26	4248	Lesce
00050000-555c-91d9-99ea-fccede3a8ef8	3261	Lesično
00050000-555c-91d9-6082-d5e4ef699ad2	8273	Leskovec pri Krškem
00050000-555c-91d9-63e9-ecdb8d10b318	2372	Libeliče
00050000-555c-91d9-0dce-7bc33706702e	2341	Limbuš
00050000-555c-91d9-b32c-023c3513b8a3	1270	Litija
00050000-555c-91d9-4289-630cc0c259ea	3202	Ljubečna
00050000-555c-91d9-249c-f8b19c66c999	1000	Ljubljana 
00050000-555c-91d9-040b-deace2c1d33c	1001	Ljubljana - poštni predali
00050000-555c-91d9-daa5-af73c2af5a80	1231	Ljubljana - Črnuče
00050000-555c-91d9-a646-3740544bafc9	1261	Ljubljana - Dobrunje
00050000-555c-91d9-34dd-34c990b22dcc	1260	Ljubljana - Polje
00050000-555c-91d9-fcd6-de14ecf085f2	1210	Ljubljana - Šentvid
00050000-555c-91d9-2f27-c66f5a28b35f	1211	Ljubljana - Šmartno
00050000-555c-91d9-88a4-316a1eaf5c9a	3333	Ljubno ob Savinji
00050000-555c-91d9-b254-ce546583cf92	9240	Ljutomer
00050000-555c-91d9-fb79-ba1d4d29147e	3215	Loče
00050000-555c-91d9-d9b3-bc8dfda1b7a9	5231	Log pod Mangartom
00050000-555c-91d9-0b83-8f6c8d0c9eb0	1358	Log pri Brezovici
00050000-555c-91d9-90f7-a39695aa42c9	1370	Logatec
00050000-555c-91d9-872f-d6de44fe110b	1371	Logatec
00050000-555c-91d9-7474-ce3309e7ce3a	1434	Loka pri Zidanem Mostu
00050000-555c-91d9-55f0-72cfa9bdd4cc	3223	Loka pri Žusmu
00050000-555c-91d9-ca67-f654bab5078f	6219	Lokev
00050000-555c-91d9-c62b-9ef39036f5f7	1318	Loški Potok
00050000-555c-91d9-524d-87249d572e03	2324	Lovrenc na Dravskem polju
00050000-555c-91d9-5e50-9fbacdf94eee	2344	Lovrenc na Pohorju
00050000-555c-91d9-542c-ad1184d99f12	3334	Luče
00050000-555c-91d9-4eb2-204a91f76d32	1225	Lukovica
00050000-555c-91d9-1599-c30018577139	9202	Mačkovci
00050000-555c-91d9-a2a3-ec83a5441cd9	2322	Majšperk
00050000-555c-91d9-73e6-549c99845784	2321	Makole
00050000-555c-91d9-f6cf-bd54b077e600	9243	Mala Nedelja
00050000-555c-91d9-985e-f97f4c022517	2229	Malečnik
00050000-555c-91d9-3d25-d82849cfa89c	6273	Marezige
00050000-555c-91d9-3113-59f8558f4277	2000	Maribor 
00050000-555c-91d9-93ee-e2ad07b84228	2001	Maribor - poštni predali
00050000-555c-91d9-6c4c-ba016ee9b1ff	2206	Marjeta na Dravskem polju
00050000-555c-91d9-e6b4-a682d43a6af8	2281	Markovci
00050000-555c-91d9-4be3-8ddd03b39186	9221	Martjanci
00050000-555c-91d9-8d76-333c3b1df66d	6242	Materija
00050000-555c-91d9-e6b4-36e3dd044f5f	4211	Mavčiče
00050000-555c-91d9-6289-fdd568afe143	1215	Medvode
00050000-555c-91d9-b645-884b3bd3d888	1234	Mengeš
00050000-555c-91d9-e485-eab5f06f6490	8330	Metlika
00050000-555c-91d9-3745-fa0c9c36d78f	2392	Mežica
00050000-555c-91d9-d889-b9487b896cf0	2204	Miklavž na Dravskem polju
00050000-555c-91d9-adb9-535a59df0433	2275	Miklavž pri Ormožu
00050000-555c-91d9-106d-546bef2cada4	5291	Miren
00050000-555c-91d9-d8c4-7bf10bf05b9b	8233	Mirna
00050000-555c-91d9-6c3e-974eec12c214	8216	Mirna Peč
00050000-555c-91d9-fa90-e2fe738a1056	2382	Mislinja
00050000-555c-91d9-0980-74056759baeb	4281	Mojstrana
00050000-555c-91d9-465d-9ca1f061eda8	8230	Mokronog
00050000-555c-91d9-8a75-f153efbe815f	1251	Moravče
00050000-555c-91d9-5eea-ac41cc8c0975	9226	Moravske Toplice
00050000-555c-91d9-ed2a-958ad2d78795	5216	Most na Soči
00050000-555c-91d9-0baf-53221833da64	1221	Motnik
00050000-555c-91d9-80a4-390b4add4e26	3330	Mozirje
00050000-555c-91d9-a89a-3abb877b8a48	9000	Murska Sobota 
00050000-555c-91d9-9f61-3dfd68f1e2f3	9001	Murska Sobota - poštni predali
00050000-555c-91d9-336d-86e2a7ec2969	2366	Muta
00050000-555c-91d9-7d0f-f3a1fc339995	4202	Naklo
00050000-555c-91d9-2b97-2eccb9becb2f	3331	Nazarje
00050000-555c-91d9-ee70-d31a2337995e	1357	Notranje Gorice
00050000-555c-91d9-38a7-e2c8510c9316	3203	Nova Cerkev
00050000-555c-91d9-bc01-3796e930e0da	5000	Nova Gorica 
00050000-555c-91d9-6e63-842103ea22ed	5001	Nova Gorica - poštni predali
00050000-555c-91d9-ef97-d7343421651c	1385	Nova vas
00050000-555c-91d9-2e4f-859ad1ccc9df	8000	Novo mesto
00050000-555c-91d9-de69-fb7760be13a3	8001	Novo mesto - poštni predali
00050000-555c-91d9-9430-063925d57bfc	6243	Obrov
00050000-555c-91d9-3863-911444884993	9233	Odranci
00050000-555c-91d9-c98c-b41481355246	2317	Oplotnica
00050000-555c-91d9-7422-336de6d25af6	2312	Orehova vas
00050000-555c-91d9-9a0e-4c6f1987dc90	2270	Ormož
00050000-555c-91d9-c029-1164e430fb3a	1316	Ortnek
00050000-555c-91d9-a98f-3ed21ee9adee	1337	Osilnica
00050000-555c-91d9-0b2c-7240934c15ab	8222	Otočec
00050000-555c-91d9-4304-1cdc13b08104	2361	Ožbalt
00050000-555c-91d9-4832-76deb2f31958	2231	Pernica
00050000-555c-91d9-9865-7a68963eccc9	2211	Pesnica pri Mariboru
00050000-555c-91d9-ee3f-bbcea5ae13d1	9203	Petrovci
00050000-555c-91d9-57f1-e10a2da5f790	3301	Petrovče
00050000-555c-91d9-9d97-115f31ba3ebd	6330	Piran/Pirano
00050000-555c-91d9-9bed-9474f4f0c9ba	8255	Pišece
00050000-555c-91d9-6ac6-35b40375921c	6257	Pivka
00050000-555c-91d9-58f6-866306ac4282	6232	Planina
00050000-555c-91d9-4ef5-712996857d08	3225	Planina pri Sevnici
00050000-555c-91d9-d5a0-8ad1a1aeb95c	6276	Pobegi
00050000-555c-91d9-e485-349712eb92fd	8312	Podbočje
00050000-555c-91d9-468d-dd2c5951d25b	5243	Podbrdo
00050000-555c-91d9-e812-447fb77ea2ea	3254	Podčetrtek
00050000-555c-91d9-ac88-8573cbba1d83	2273	Podgorci
00050000-555c-91d9-0ed2-f39009dc3944	6216	Podgorje
00050000-555c-91d9-fec0-ed333334b208	2381	Podgorje pri Slovenj Gradcu
00050000-555c-91d9-3ccb-5bd75606f242	6244	Podgrad
00050000-555c-91d9-f9a3-3a7fe6ab8143	1414	Podkum
00050000-555c-91d9-64cf-5db4e9fc0054	2286	Podlehnik
00050000-555c-91d9-86ef-e978608bfbde	5272	Podnanos
00050000-555c-91d9-a6af-1e2a1a0cd04d	4244	Podnart
00050000-555c-91d9-61fe-249bae47bdb7	3241	Podplat
00050000-555c-91d9-8f39-5d7906076add	3257	Podsreda
00050000-555c-91d9-c0be-28af22c42781	2363	Podvelka
00050000-555c-91d9-40bb-24cc156a4517	2208	Pohorje
00050000-555c-91d9-3d32-84f7dd567d40	2257	Polenšak
00050000-555c-91d9-c3bd-ab4a4bea342e	1355	Polhov Gradec
00050000-555c-91d9-96e7-8d801737cc4a	4223	Poljane nad Škofjo Loko
00050000-555c-91d9-19d8-3aabe902ad41	2319	Poljčane
00050000-555c-91d9-3538-61e7ef5adfa6	1272	Polšnik
00050000-555c-91d9-b50d-633fd5d57325	3313	Polzela
00050000-555c-91d9-fa72-5fe8090a1e59	3232	Ponikva
00050000-555c-91d9-f80a-f9bd3ccded09	6320	Portorož/Portorose
00050000-555c-91d9-2487-9ced31ac1815	6230	Postojna
00050000-555c-91d9-4eae-e708b6ea2420	2331	Pragersko
00050000-555c-91d9-85f5-f4c0e2c9dc8a	3312	Prebold
00050000-555c-91d9-ba08-24bfb9ce6fea	4205	Preddvor
00050000-555c-91d9-6511-155b1ad8bb76	6255	Prem
00050000-555c-91d9-a755-25bc21bf573c	1352	Preserje
00050000-555c-91d9-0a07-fa5671159cb9	6258	Prestranek
00050000-555c-91d9-01eb-887db6ae1d0b	2391	Prevalje
00050000-555c-91d9-4c34-b2662d1ee616	3262	Prevorje
00050000-555c-91d9-1269-30507c8cd05b	1276	Primskovo 
00050000-555c-91d9-75e0-5c8a7c1bd4b3	3253	Pristava pri Mestinju
00050000-555c-91d9-81ac-0a5a864f47c5	9207	Prosenjakovci/Partosfalva
00050000-555c-91d9-f7c6-d5f685232223	5297	Prvačina
00050000-555c-91d9-9b64-e97e5569bf87	2250	Ptuj
00050000-555c-91d9-4a85-7f0e09c28575	2323	Ptujska Gora
00050000-555c-91d9-0fcf-44bf9ba34d39	9201	Puconci
00050000-555c-91d9-85e5-457f49e49efe	2327	Rače
00050000-555c-91d9-d241-6ce127d40e2a	1433	Radeče
00050000-555c-91d9-3910-9dc8d87adf26	9252	Radenci
00050000-555c-91d9-2d9f-d1b61f152bc5	2360	Radlje ob Dravi
00050000-555c-91d9-c954-a1c31d87bfeb	1235	Radomlje
00050000-555c-91d9-fcad-f086c02cd66b	4240	Radovljica
00050000-555c-91d9-8568-43fde8932cb2	8274	Raka
00050000-555c-91d9-15ec-3bef5e127b7a	1381	Rakek
00050000-555c-91d9-a584-e6a65a31f6e8	4283	Rateče - Planica
00050000-555c-91d9-afd5-91cd71858f3f	2390	Ravne na Koroškem
00050000-555c-91d9-7aea-0554f25ddd8b	9246	Razkrižje
00050000-555c-91d9-7e77-1287dd48a57c	3332	Rečica ob Savinji
00050000-555c-91d9-c14a-d11600bc6c28	5292	Renče
00050000-555c-91d9-f9c6-b71111a51aef	1310	Ribnica
00050000-555c-91d9-dfc0-d504b3dba587	2364	Ribnica na Pohorju
00050000-555c-91d9-7802-1689ad13808e	3272	Rimske Toplice
00050000-555c-91d9-5457-5f61642d58ca	1314	Rob
00050000-555c-91d9-d333-5056fe6683a2	5215	Ročinj
00050000-555c-91d9-69e3-a8672ae243b9	3250	Rogaška Slatina
00050000-555c-91d9-efae-07842210cf71	9262	Rogašovci
00050000-555c-91d9-ac48-218d81fcd4da	3252	Rogatec
00050000-555c-91d9-cf8f-691e7945b547	1373	Rovte
00050000-555c-91d9-9a46-48f1eb90bb9d	2342	Ruše
00050000-555c-91d9-420c-2e55e5c7a10d	1282	Sava
00050000-555c-91d9-d40a-f3ead79ec1e3	6333	Sečovlje/Sicciole
00050000-555c-91d9-314c-92e63d384c66	4227	Selca
00050000-555c-91d9-f3d7-256e353072fc	2352	Selnica ob Dravi
00050000-555c-91d9-34af-1a3963bfe19e	8333	Semič
00050000-555c-91d9-38f5-a47b7abb3e3e	8281	Senovo
00050000-555c-91d9-abf0-6cfa4c9c53c3	6224	Senožeče
00050000-555c-91d9-4094-cd0632d9c8c2	8290	Sevnica
00050000-555c-91d9-9bb8-5c08794cff8d	6210	Sežana
00050000-555c-91d9-5a9c-e506e388a15a	2214	Sladki Vrh
00050000-555c-91d9-715d-09b5b4d0aa70	5283	Slap ob Idrijci
00050000-555c-91d9-56fb-e95a3729c73d	2380	Slovenj Gradec
00050000-555c-91d9-0001-49615123b89a	2310	Slovenska Bistrica
00050000-555c-91d9-1276-36528e23c566	3210	Slovenske Konjice
00050000-555c-91d9-5d80-1e2a1cfb5489	1216	Smlednik
00050000-555c-91d9-eeeb-f2f1791d4047	5232	Soča
00050000-555c-91d9-4e7d-6e80447afe42	1317	Sodražica
00050000-555c-91d9-e907-20a9602b8d0f	3335	Solčava
00050000-555c-91d9-24f2-a014f40609d6	5250	Solkan
00050000-555c-91d9-6835-aba9046d8ef0	4229	Sorica
00050000-555c-91d9-ffd9-4b0c0348befe	4225	Sovodenj
00050000-555c-91d9-32e2-93cc9467f6df	5281	Spodnja Idrija
00050000-555c-91d9-5189-5f99c9e5e0bc	2241	Spodnji Duplek
00050000-555c-91d9-a12e-4a8a1c959a9f	9245	Spodnji Ivanjci
00050000-555c-91d9-d993-50e1fd7087e2	2277	Središče ob Dravi
00050000-555c-91d9-760d-7779781e3139	4267	Srednja vas v Bohinju
00050000-555c-91d9-4fd5-9c0dfc13276e	8256	Sromlje 
00050000-555c-91d9-ea77-c10dc553c2dd	5224	Srpenica
00050000-555c-91d9-e16b-a30e89241f2d	1242	Stahovica
00050000-555c-91d9-f973-228585991368	1332	Stara Cerkev
00050000-555c-91d9-6855-0a921efc7132	8342	Stari trg ob Kolpi
00050000-555c-91d9-5730-133cdc855591	1386	Stari trg pri Ložu
00050000-555c-91d9-3cd2-060cd0efe28b	2205	Starše
00050000-555c-91d9-b985-d44d7b428038	2289	Stoperce
00050000-555c-91d9-07e2-a6e9b53de2c4	8322	Stopiče
00050000-555c-91d9-76cb-a509f6e33ed5	3206	Stranice
00050000-555c-91d9-7e14-e21945129d6f	8351	Straža
00050000-555c-91d9-d339-8608f0b88a5c	1313	Struge
00050000-555c-91d9-09af-855a1ee112e2	8293	Studenec
00050000-555c-91d9-9b90-8ed2f8656f06	8331	Suhor
00050000-555c-91d9-b71f-4d79f69a1ba9	2233	Sv. Ana v Slovenskih goricah
00050000-555c-91d9-897f-352e6239b58e	2235	Sv. Trojica v Slovenskih goricah
00050000-555c-91d9-0e94-f04688b4c6b3	2353	Sveti Duh na Ostrem Vrhu
00050000-555c-91d9-cfb0-2d8772d14c61	9244	Sveti Jurij ob Ščavnici
00050000-555c-91d9-9d08-f73c3878ca65	3264	Sveti Štefan
00050000-555c-91d9-0d1d-962565c56140	2258	Sveti Tomaž
00050000-555c-91d9-655d-8cefc6e5fe63	9204	Šalovci
00050000-555c-91d9-aa93-9b0ef88ce387	5261	Šempas
00050000-555c-91d9-5bf4-1bf9079d81ca	5290	Šempeter pri Gorici
00050000-555c-91d9-5ea5-239397f3cace	3311	Šempeter v Savinjski dolini
00050000-555c-91d9-d57c-b44e1871faea	4208	Šenčur
00050000-555c-91d9-190d-e4d1fd1b8b03	2212	Šentilj v Slovenskih goricah
00050000-555c-91d9-b250-47a48e51e89f	8297	Šentjanž
00050000-555c-91d9-8fc5-bc44f848746c	2373	Šentjanž pri Dravogradu
00050000-555c-91d9-54b9-dd99cb688c6e	8310	Šentjernej
00050000-555c-91d9-f7c6-826bcd84d09e	3230	Šentjur
00050000-555c-91d9-404c-75bf53287f3b	3271	Šentrupert
00050000-555c-91d9-776c-a7dc36d23af1	8232	Šentrupert
00050000-555c-91d9-07e0-cefe64b7f971	1296	Šentvid pri Stični
00050000-555c-91d9-49ab-c76b0a70aa94	8275	Škocjan
00050000-555c-91d9-5e98-e442fb1efeb6	6281	Škofije
00050000-555c-91d9-9fdf-bc2fd3feeb7e	4220	Škofja Loka
00050000-555c-91d9-ae10-70523ca7bf69	3211	Škofja vas
00050000-555c-91d9-67f1-a40b7ca00db4	1291	Škofljica
00050000-555c-91d9-6b7e-f3ad6496bbe1	6274	Šmarje
00050000-555c-91d9-5ce0-2b3dedd3378a	1293	Šmarje - Sap
00050000-555c-91d9-b684-3221d23ef501	3240	Šmarje pri Jelšah
00050000-555c-91d9-7bb2-e6a4f8e8e580	8220	Šmarješke Toplice
00050000-555c-91d9-6043-a2179bfe71ee	2315	Šmartno na Pohorju
00050000-555c-91d9-03fb-4202e7febb96	3341	Šmartno ob Dreti
00050000-555c-91d9-ad92-5d8a4bd4f582	3327	Šmartno ob Paki
00050000-555c-91d9-12a1-8c819ec44a6f	1275	Šmartno pri Litiji
00050000-555c-91d9-9b65-5ce00353dc0f	2383	Šmartno pri Slovenj Gradcu
00050000-555c-91d9-2df5-6ace5f52657f	3201	Šmartno v Rožni dolini
00050000-555c-91d9-c859-be734d51709e	3325	Šoštanj
00050000-555c-91d9-36d8-14a6af59e77e	6222	Štanjel
00050000-555c-91d9-bbea-8fb841712661	3220	Štore
00050000-555c-91d9-08bb-9fe5c258d3af	3304	Tabor
00050000-555c-91d9-b8fd-56574bf7d88c	3221	Teharje
00050000-555c-91d9-cb37-05b9236d3706	9251	Tišina
00050000-555c-91d9-3407-e9fcba46fedb	5220	Tolmin
00050000-555c-91d9-97f7-a813e7a91bfc	3326	Topolšica
00050000-555c-91d9-a11c-721e74e05f39	2371	Trbonje
00050000-555c-91d9-13ab-fde225393926	1420	Trbovlje
00050000-555c-91d9-d2e5-3f1b1c61c911	8231	Trebelno 
00050000-555c-91d9-729e-b448d3d0b116	8210	Trebnje
00050000-555c-91d9-04c8-02a0ef084c2e	5252	Trnovo pri Gorici
00050000-555c-91d9-e94e-47343c3cbe85	2254	Trnovska vas
00050000-555c-91d9-4758-97648b8812d7	1222	Trojane
00050000-555c-91d9-2c32-20632bd5d50a	1236	Trzin
00050000-555c-91d9-f52b-08be6086baf2	4290	Tržič
00050000-555c-91d9-2da4-2a2f0830e897	8295	Tržišče
00050000-555c-91d9-16e4-2b20e12314b1	1311	Turjak
00050000-555c-91d9-3b0e-b2e1f8008725	9224	Turnišče
00050000-555c-91d9-6089-1cdc37c79ef8	8323	Uršna sela
00050000-555c-91d9-f105-23ea8297964f	1252	Vače
00050000-555c-91d9-5396-fb31d1b78b71	3320	Velenje 
00050000-555c-91d9-67f3-e4776dd13a32	3322	Velenje - poštni predali
00050000-555c-91d9-4035-25648bc82b3c	8212	Velika Loka
00050000-555c-91d9-6490-05100bffd521	2274	Velika Nedelja
00050000-555c-91d9-bf0e-02959eebd688	9225	Velika Polana
00050000-555c-91d9-ecab-f2c29dfe3fe3	1315	Velike Lašče
00050000-555c-91d9-8e81-d9731578c7a2	8213	Veliki Gaber
00050000-555c-91d9-7139-900cc7fd4632	9241	Veržej
00050000-555c-91d9-ce5c-f66e209440fc	1312	Videm - Dobrepolje
00050000-555c-91d9-1146-6a83f94260b5	2284	Videm pri Ptuju
00050000-555c-91d9-87b9-b86e046181fc	8344	Vinica
00050000-555c-91d9-9fbf-fbf731f688b8	5271	Vipava
00050000-555c-91d9-ef26-d2689425bf37	4212	Visoko
00050000-555c-91d9-ed4e-e462c52d4e8c	1294	Višnja Gora
00050000-555c-91d9-edca-4a7dfab25130	3205	Vitanje
00050000-555c-91d9-5ee5-141ac652be62	2255	Vitomarci
00050000-555c-91d9-2355-9aa34c659c8b	1217	Vodice
00050000-555c-91d9-1b5f-d32075b13780	3212	Vojnik\t
00050000-555c-91d9-d62f-1666ce3547f1	5293	Volčja Draga
00050000-555c-91d9-2797-dae733db56e6	2232	Voličina
00050000-555c-91d9-ca45-ad0aa6fb062d	3305	Vransko
00050000-555c-91d9-791c-0bafefd1e05c	6217	Vremski Britof
00050000-555c-91d9-b596-32965c485cb6	1360	Vrhnika
00050000-555c-91d9-c861-3dc101b9d3ee	2365	Vuhred
00050000-555c-91d9-fd11-f5f438ec6c04	2367	Vuzenica
00050000-555c-91d9-cb5f-8e3b48ce92b1	8292	Zabukovje 
00050000-555c-91d9-ce2e-c1dd7e56797a	1410	Zagorje ob Savi
00050000-555c-91d9-dcc2-b877b29900a4	1303	Zagradec
00050000-555c-91d9-7d31-d6ca1c07e89d	2283	Zavrč
00050000-555c-91d9-bf48-4d8c73aa4829	8272	Zdole 
00050000-555c-91d9-b018-8b923e51e7f6	4201	Zgornja Besnica
00050000-555c-91d9-8369-fa3e7ae5163b	2242	Zgornja Korena
00050000-555c-91d9-f900-e5faf811cd81	2201	Zgornja Kungota
00050000-555c-91d9-8c5d-304ee724c483	2316	Zgornja Ložnica
00050000-555c-91d9-6213-cee05c604a44	2314	Zgornja Polskava
00050000-555c-91d9-cd27-f787d82f19d1	2213	Zgornja Velka
00050000-555c-91d9-a410-2e6ff90d6b4a	4247	Zgornje Gorje
00050000-555c-91d9-1373-b8cd41b0b9ee	4206	Zgornje Jezersko
00050000-555c-91d9-b96f-97a7f3ae10d9	2285	Zgornji Leskovec
00050000-555c-91d9-76ba-7289c4527fe0	1432	Zidani Most
00050000-555c-91d9-22ed-add26bcaabe5	3214	Zreče
00050000-555c-91d9-c673-e934f13c4c5a	4209	Žabnica
00050000-555c-91d9-f695-8eb0f461ca7b	3310	Žalec
00050000-555c-91d9-3de4-b8688e00d9a9	4228	Železniki
00050000-555c-91d9-2003-3304cb99090f	2287	Žetale
00050000-555c-91d9-257e-c9e618783b61	4226	Žiri
00050000-555c-91d9-5d24-e08736f092e5	4274	Žirovnica
00050000-555c-91d9-80ca-08c80a94f039	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 4176376)
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
-- TOC entry 2642 (class 0 OID 4176203)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4176269)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4176388)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4176493)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4176540)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 4176417)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4176361)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4176351)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 4176530)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4176483)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4176070)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555c-91da-2e96-c858a37bd5a6	00010000-555c-91da-e79c-76189f90ef60	2015-05-20 15:53:30	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROTYPlc4R61HXDfFqfQN6zgaXaEL7rcZ2";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 4176426)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 4176108)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555c-91da-eee0-571b82bf9753	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555c-91da-9e57-dc6ed9f2797f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555c-91da-4318-0c47d8c24cbb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555c-91da-ebab-b9a4b5f66efa	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555c-91da-6178-a801bddac8f6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555c-91da-5eb9-d10f9124ee8c	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 4176092)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555c-91da-2e96-c858a37bd5a6	00020000-555c-91da-ebab-b9a4b5f66efa
00010000-555c-91da-e79c-76189f90ef60	00020000-555c-91da-ebab-b9a4b5f66efa
\.


--
-- TOC entry 2668 (class 0 OID 4176440)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4176382)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 4176332)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4176168)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 4176338)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4176518)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4176238)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 4176079)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555c-91da-e79c-76189f90ef60	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROk39E4qNqJhxT0bgGpewC4BcE2tBaeYm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555c-91da-2e96-c858a37bd5a6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 4176572)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4176284)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 4176409)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4176475)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4176316)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 4176562)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4176465)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 4176133)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 4176612)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4176605)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4176517)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 4176306)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 4176331)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 4176264)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 4176461)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4176282)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 4176325)
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
-- TOC entry 2364 (class 2606 OID 4176374)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 4176401)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 4176236)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 4176142)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 4176200)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 4176166)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 4176122)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 4176107)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 4176407)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 4176439)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 4176557)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 4176193)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 4176224)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 4176380)
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
-- TOC entry 2298 (class 2606 OID 4176214)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 4176273)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 4176392)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4176499)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 4176545)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4176424)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 4176365)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 4176356)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 4176539)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4176490)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 4176078)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4176430)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 4176096)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 4176116)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 4176448)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4176387)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 4176337)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 4176173)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 4176347)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4176529)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 4176249)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4176091)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 4176587)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 4176291)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 4176415)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4176481)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 4176320)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 4176571)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 4176474)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 4176313)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 4176195)
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
-- TOC entry 2377 (class 1259 OID 4176408)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 4176394)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 4176393)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 4176292)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 4176464)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 4176462)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 4176463)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 4176559)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 4176560)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 4176561)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 4176590)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 4176589)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 4176588)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 4176251)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 4176250)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 4176202)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4176201)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 4176431)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 4176326)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 4176123)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 4176124)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 4176451)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 4176450)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 4176449)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 4176274)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 4176276)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 4176275)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 4176360)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 4176358)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 4176357)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 4176359)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 4176097)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 4176098)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 4176416)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 4176381)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 4176491)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 4176492)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 4176216)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 4176215)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 4176217)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 4176500)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 4176501)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 4176615)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 4176614)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 4176617)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 4176613)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 4176616)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 4176482)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 4176369)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 4176368)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 4176366)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 4176367)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 4176607)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 4176606)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 4176283)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 4176144)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 4176143)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 4176174)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 4176175)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 4176350)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 4176349)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 4176348)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 4176315)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 4176311)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 4176308)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 4176309)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 4176307)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 4176312)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 4176310)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 4176194)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 4176265)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 4176267)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 4176266)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 4176268)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 4176375)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 4176558)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 4176167)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 4176237)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 4176425)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 4176225)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 4176546)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 4176117)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 4176314)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 4176748)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 4176733)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 4176738)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 4176758)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 4176728)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 4176753)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 4176743)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 4176663)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 4176843)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 4176838)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 4176833)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 4176723)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 4176883)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 4176873)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 4176878)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 4176823)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 4176918)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 4176923)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 4176928)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 4176943)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 4176938)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 4176933)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 4176698)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 4176693)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 4176673)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 4176668)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4176648)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 4176853)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 4176763)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 4176628)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 4176633)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 4176868)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 4176863)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 4176858)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 4176703)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 4176713)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 4176708)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 4176798)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 4176788)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 4176783)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 4176793)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 4176618)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 4176623)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 4176848)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 4176828)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 4176893)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 4176898)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4176683)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 4176678)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 4176688)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 4176903)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 4176908)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 4176968)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 4176963)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 4176978)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 4176958)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 4176973)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 4176888)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 4176818)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 4176813)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 4176803)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 4176808)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 4176953)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 4176948)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 4176718)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 4176913)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 4176643)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 4176638)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 4176653)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4176658)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 4176778)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 4176773)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 4176768)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-20 15:53:31 CEST

--
-- PostgreSQL database dump complete
--

