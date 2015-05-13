--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-13 12:22:48 CEST

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
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 3291286)
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
-- TOC entry 225 (class 1259 OID 3291773)
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
-- TOC entry 224 (class 1259 OID 3291756)
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
-- TOC entry 217 (class 1259 OID 3291667)
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
-- TOC entry 193 (class 1259 OID 3291451)
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
-- TOC entry 196 (class 1259 OID 3291492)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3291413)
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
-- TOC entry 212 (class 1259 OID 3291617)
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
-- TOC entry 191 (class 1259 OID 3291438)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3291486)
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
-- TOC entry 201 (class 1259 OID 3291535)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3291560)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3291387)
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
-- TOC entry 180 (class 1259 OID 3291295)
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
-- TOC entry 181 (class 1259 OID 3291306)
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
-- TOC entry 184 (class 1259 OID 3291357)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3291260)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3291279)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3291567)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3291597)
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
-- TOC entry 221 (class 1259 OID 3291712)
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
-- TOC entry 183 (class 1259 OID 3291337)
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
-- TOC entry 186 (class 1259 OID 3291379)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3291541)
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
-- TOC entry 185 (class 1259 OID 3291364)
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
-- TOC entry 190 (class 1259 OID 3291430)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3291553)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3291658)
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
-- TOC entry 220 (class 1259 OID 3291705)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3291582)
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
-- TOC entry 200 (class 1259 OID 3291526)
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
-- TOC entry 199 (class 1259 OID 3291516)
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
-- TOC entry 219 (class 1259 OID 3291695)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3291648)
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
-- TOC entry 173 (class 1259 OID 3291231)
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
-- TOC entry 172 (class 1259 OID 3291229)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2694 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 3291591)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3291269)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3291253)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3291605)
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
-- TOC entry 203 (class 1259 OID 3291547)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3291497)
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
-- TOC entry 182 (class 1259 OID 3291329)
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
-- TOC entry 198 (class 1259 OID 3291503)
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
-- TOC entry 218 (class 1259 OID 3291683)
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
-- TOC entry 188 (class 1259 OID 3291399)
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
-- TOC entry 174 (class 1259 OID 3291240)
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
-- TOC entry 223 (class 1259 OID 3291737)
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
-- TOC entry 192 (class 1259 OID 3291445)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3291574)
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
-- TOC entry 214 (class 1259 OID 3291640)
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
-- TOC entry 194 (class 1259 OID 3291473)
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
-- TOC entry 222 (class 1259 OID 3291727)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3291630)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3291234)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2640 (class 0 OID 3291286)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2686 (class 0 OID 3291773)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 3291756)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3291667)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3291451)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3291492)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3291413)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5553-25f7-2ad5-21ad90ca5c1e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5553-25f7-502e-1419aabffb32	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5553-25f7-029e-1ab1d1604528	AL	ALB	008	Albania 	Albanija	\N
00040000-5553-25f7-13b7-a6a09ac02e0a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5553-25f7-0f0e-36eb28d10c35	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5553-25f7-0248-25f0d877bb25	AD	AND	020	Andorra 	Andora	\N
00040000-5553-25f7-9986-99017f2a3f98	AO	AGO	024	Angola 	Angola	\N
00040000-5553-25f7-5714-b112d7764bf7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5553-25f7-58e5-3d3bd3f1152d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5553-25f7-11a3-f6091b9a9cec	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5553-25f7-a202-eb436502e2ee	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5553-25f7-8c56-fb1b9562d7d2	AM	ARM	051	Armenia 	Armenija	\N
00040000-5553-25f7-0932-36cc83bd04af	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5553-25f7-b43c-50f5662a7b75	AU	AUS	036	Australia 	Avstralija	\N
00040000-5553-25f7-f832-ec8dac134d57	AT	AUT	040	Austria 	Avstrija	\N
00040000-5553-25f7-d4ca-c1c70a47f9b3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5553-25f7-2684-cb2c478ac077	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5553-25f7-03b1-df7afbf18aa9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5553-25f7-4ced-b641d308beda	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5553-25f7-ff95-8ddb2613d1a0	BB	BRB	052	Barbados 	Barbados	\N
00040000-5553-25f7-6a75-541db89d47a8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5553-25f7-70a9-6570785220d7	BE	BEL	056	Belgium 	Belgija	\N
00040000-5553-25f7-5685-8c89ec424fd8	BZ	BLZ	084	Belize 	Belize	\N
00040000-5553-25f7-294c-26bfdd2712e2	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5553-25f7-5f89-4b1af85661ba	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5553-25f7-0f05-4ef9dc9bcd2c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5553-25f7-9e9b-dbca68d74dbc	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5553-25f7-adc5-7e827560f7e5	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5553-25f7-fd39-a400d99490e5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5553-25f7-ebed-a8e7a45e4ecd	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5553-25f7-9143-0b1de8718a0a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5553-25f7-d609-78f3d0f40617	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5553-25f7-fccb-e1a5540a72f2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5553-25f7-41d3-ee28bd641ada	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5553-25f7-abbe-c11a56642534	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5553-25f7-f507-b04f7c4d59a6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5553-25f7-745f-447538111da9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5553-25f7-b72d-7cbffe667e45	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5553-25f7-d45b-6a9e341017e1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5553-25f7-3723-1408f6fac8d0	CA	CAN	124	Canada 	Kanada	\N
00040000-5553-25f7-4479-fd0b3fe8f79a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5553-25f7-5ac8-c09ca35b53ed	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5553-25f7-63ed-334bd9a61835	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5553-25f7-a6e0-c22a59425b33	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5553-25f7-2696-532c5c0a6f5b	CL	CHL	152	Chile 	Čile	\N
00040000-5553-25f7-c76d-d4015323de06	CN	CHN	156	China 	Kitajska	\N
00040000-5553-25f7-696a-09b30c332ef7	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5553-25f7-8bb3-449124c32643	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5553-25f7-b1a2-2f79b1b20bd2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5553-25f7-bc14-50404adce52d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5553-25f7-b339-b24fc3816a07	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5553-25f7-cad4-18ee933282e7	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5553-25f7-99ea-d560345bd87b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5553-25f7-53ec-370a0903a8c1	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5553-25f7-2620-f4d29209b342	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5553-25f7-6c71-439449ac66de	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5553-25f7-5dfc-06a3513d66b3	CU	CUB	192	Cuba 	Kuba	\N
00040000-5553-25f7-7cfa-defdcffdfcd1	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5553-25f7-01b4-c0a11f96a106	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5553-25f7-d7ed-500373c339a8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5553-25f7-b4f1-398583f3e534	DK	DNK	208	Denmark 	Danska	\N
00040000-5553-25f7-c3a8-937bec996668	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5553-25f7-6f50-c8ca41efc59a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5553-25f7-8568-24cbe32e7572	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5553-25f7-9b38-2c37135feb5d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5553-25f7-45e5-6dbd77bdde45	EG	EGY	818	Egypt 	Egipt	\N
00040000-5553-25f7-2b01-9490a6765927	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5553-25f7-3c86-badae080bcd0	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5553-25f7-f5de-2ef5143fdf46	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5553-25f7-db4f-df826b856d1c	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5553-25f7-4009-49edb92f1866	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5553-25f7-ae1d-bcaa0fd0df02	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5553-25f7-7a45-f1452da0a130	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5553-25f7-eebc-5c30bdd077ae	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5553-25f7-c286-6605b6ef4d29	FI	FIN	246	Finland 	Finska	\N
00040000-5553-25f7-a0c3-3e627755b3f1	FR	FRA	250	France 	Francija	\N
00040000-5553-25f7-8da6-c2a8098a70a6	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5553-25f7-54b6-733a51b49038	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5553-25f7-4c7e-6d2942d74771	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5553-25f7-8073-d1c43ebba0ee	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5553-25f7-de61-c878e2786761	GA	GAB	266	Gabon 	Gabon	\N
00040000-5553-25f7-b552-67f0ce5d8eb2	GM	GMB	270	Gambia 	Gambija	\N
00040000-5553-25f7-991a-4dc8b8afd2f1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5553-25f7-6673-30280f1a90a0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5553-25f7-266f-add8e146f03c	GH	GHA	288	Ghana 	Gana	\N
00040000-5553-25f7-7082-39bbe38eaf0d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5553-25f7-328f-8427fe55440e	GR	GRC	300	Greece 	Grčija	\N
00040000-5553-25f7-adce-e7e61570a3df	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5553-25f7-f5b6-d94465eb05eb	GD	GRD	308	Grenada 	Grenada	\N
00040000-5553-25f7-2290-ab58351f86e7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5553-25f7-5cb5-aae3a234475b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5553-25f7-c185-edbe17632850	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5553-25f7-8430-0ad0275b0e7f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5553-25f7-a1ee-c1720e97c04e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5553-25f7-1223-4f8b2303ec0f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5553-25f7-ce7a-71d88ac882a7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5553-25f7-9dd8-b390e59276e1	HT	HTI	332	Haiti 	Haiti	\N
00040000-5553-25f7-6af9-8930695bb358	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5553-25f7-66d8-d3b427466fbb	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5553-25f7-a239-bbcc69967df9	HN	HND	340	Honduras 	Honduras	\N
00040000-5553-25f7-b233-63e22bb910e4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5553-25f7-52f0-ad9c0c5ab896	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5553-25f7-6191-a7f7007d14bc	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5553-25f7-b9eb-de2fe2553dc8	IN	IND	356	India 	Indija	\N
00040000-5553-25f7-4c95-8d9bd4b95347	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5553-25f7-5da5-9fc703684fb5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5553-25f7-8be9-8d5ebf023f14	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5553-25f7-89cc-b676635d8ffa	IE	IRL	372	Ireland 	Irska	\N
00040000-5553-25f7-dc62-081ea05b412a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5553-25f7-f9b5-54a56f4dd87f	IL	ISR	376	Israel 	Izrael	\N
00040000-5553-25f7-0659-918dc5d3d7f0	IT	ITA	380	Italy 	Italija	\N
00040000-5553-25f7-f9ae-07c3c6c9444e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5553-25f7-6bc1-055e40df87eb	JP	JPN	392	Japan 	Japonska	\N
00040000-5553-25f7-9bfc-8a19bef5ccff	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5553-25f7-513e-a54c4ad43865	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5553-25f7-31ce-2c9e24ad4c1d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5553-25f7-e879-5f9a05f93599	KE	KEN	404	Kenya 	Kenija	\N
00040000-5553-25f7-2393-e65afdfd03f0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5553-25f7-113a-99f9231a4f53	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5553-25f7-0788-da193c919092	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5553-25f7-ebf6-cca1105885e4	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5553-25f7-44da-95e9b08b7688	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5553-25f7-af09-8560543fb7b8	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5553-25f7-b88d-00664aed07db	LV	LVA	428	Latvia 	Latvija	\N
00040000-5553-25f7-a9aa-1805b0671cd1	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5553-25f7-5c35-f77d1e878f4a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5553-25f7-2351-5da4a04589c9	LR	LBR	430	Liberia 	Liberija	\N
00040000-5553-25f7-2c87-7d35d12fe9ef	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5553-25f7-f918-51e29b1a0018	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5553-25f7-ce6c-8e0163c7436f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5553-25f7-9d66-1c074826454a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5553-25f7-f2e3-1706546cb225	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5553-25f7-d627-e320ad2a1f42	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5553-25f7-6500-e2bf69051f2b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5553-25f7-582e-d42c9c67826b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5553-25f7-c151-9f8b5df8cd89	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5553-25f7-ad37-65aa6974b61e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5553-25f7-2e41-d71ce07ebaba	ML	MLI	466	Mali 	Mali	\N
00040000-5553-25f7-8b3a-db3b437ce660	MT	MLT	470	Malta 	Malta	\N
00040000-5553-25f7-9140-09ff911ddd3b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5553-25f7-9e6c-358eee067026	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5553-25f7-b106-2f120eb86c5c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5553-25f7-16c0-4140e2476ea4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5553-25f7-ad23-bf4ab13a4a20	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5553-25f7-aae2-90373fc125e6	MX	MEX	484	Mexico 	Mehika	\N
00040000-5553-25f7-3c64-9c04b7f63065	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5553-25f7-e802-f44e62272ea4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5553-25f7-8978-3b0f301d918e	MC	MCO	492	Monaco 	Monako	\N
00040000-5553-25f7-be6e-18af268e3d31	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5553-25f7-61d7-414876b421af	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5553-25f7-aebc-501a1c32ab49	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5553-25f7-6708-523ab455017d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5553-25f7-15f8-0d6c6716dc77	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5553-25f7-bb9c-f67d36120b8b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5553-25f7-6e65-1ae9a9ab1b6e	NA	NAM	516	Namibia 	Namibija	\N
00040000-5553-25f7-7471-72b2be485476	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5553-25f7-dc07-6eaf4933c9fd	NP	NPL	524	Nepal 	Nepal	\N
00040000-5553-25f7-c217-93c66689901b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5553-25f7-2649-9c0d77a1c657	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5553-25f7-2830-f0fe53e8978c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5553-25f7-e999-12e493e752b3	NE	NER	562	Niger 	Niger 	\N
00040000-5553-25f7-6611-d45d4d227e25	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5553-25f7-d175-b34a09a5834a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5553-25f7-da52-acedeac6aece	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5553-25f7-055e-5d2a7fd975b3	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5553-25f7-24d7-c3db73e9a896	NO	NOR	578	Norway 	Norveška	\N
00040000-5553-25f7-7d80-f880faa9f16b	OM	OMN	512	Oman 	Oman	\N
00040000-5553-25f7-4cdd-0cd15f530e9d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5553-25f7-9aff-d0aad171bb53	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5553-25f7-415e-c7cdfd744433	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5553-25f7-f7ac-49fb807f073b	PA	PAN	591	Panama 	Panama	\N
00040000-5553-25f7-193b-6a6982ff5f30	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5553-25f7-d1a4-a563d4a681e8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5553-25f7-5857-b8fead800d79	PE	PER	604	Peru 	Peru	\N
00040000-5553-25f7-c29d-aaab4c7ae5d4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5553-25f7-53bd-903e486949df	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5553-25f7-4995-c9087672812b	PL	POL	616	Poland 	Poljska	\N
00040000-5553-25f7-c571-384fcdae3764	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5553-25f7-7348-8930245bf099	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5553-25f7-6ffc-69968aafc49e	QA	QAT	634	Qatar 	Katar	\N
00040000-5553-25f7-a7e1-c810670e1b83	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5553-25f7-09d8-ed15270a7f83	RO	ROU	642	Romania 	Romunija	\N
00040000-5553-25f7-9b05-11787ceb14ba	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5553-25f7-39f3-dd4f3166f6e2	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5553-25f7-94ae-a7c4baf983f9	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5553-25f7-b402-f6f30fb39837	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5553-25f7-1a7d-889243e86225	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5553-25f7-2d68-d91cdd7a65b1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5553-25f7-8124-0b6d0bc13121	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5553-25f7-65b7-93caf11a51be	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5553-25f7-62e9-0c9d4aa05d21	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5553-25f7-05d6-3c29838e1fd2	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5553-25f7-339f-0bbaeef9938c	SM	SMR	674	San Marino 	San Marino	\N
00040000-5553-25f7-3ac0-0c223103c9de	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5553-25f7-8de4-aad8223ffe42	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5553-25f7-403f-0279e5dd0809	SN	SEN	686	Senegal 	Senegal	\N
00040000-5553-25f7-49b7-aa1fcbfa031f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5553-25f7-a453-a5662e2b03c0	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5553-25f7-b798-0bf850735c67	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5553-25f7-f4ef-795a78d10b0f	SG	SGP	702	Singapore 	Singapur	\N
00040000-5553-25f7-dacd-1dab08d8b529	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5553-25f7-04b8-a70d67c4e30d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5553-25f7-5faf-757392a03ef9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5553-25f7-fc29-e3f6d1000fc3	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5553-25f7-2912-2e414595fee7	SO	SOM	706	Somalia 	Somalija	\N
00040000-5553-25f7-db3a-bfb588dc68b2	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5553-25f7-6077-aa3ec40170a9	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5553-25f7-8cd3-7729d41c9c15	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5553-25f7-fc47-8196710a919f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5553-25f7-eb56-6ed7b02f71ab	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5553-25f7-77f8-46bd2937c3bf	SD	SDN	729	Sudan 	Sudan	\N
00040000-5553-25f7-8056-d753a33d8394	SR	SUR	740	Suriname 	Surinam	\N
00040000-5553-25f7-5d5c-3805881f0bea	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5553-25f7-03a3-4ee03437bb57	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5553-25f7-4be7-a22dc50dd239	SE	SWE	752	Sweden 	Švedska	\N
00040000-5553-25f7-b532-37865bb63a73	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5553-25f7-fc39-b9d02e772748	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5553-25f7-029d-79ad369775f6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5553-25f7-da4e-d13565dcc314	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5553-25f7-93de-8e0665a0e164	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5553-25f7-09d9-f0584ac03725	TH	THA	764	Thailand 	Tajska	\N
00040000-5553-25f7-433e-b25130bce85d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5553-25f7-fdd7-4a7e8621835a	TG	TGO	768	Togo 	Togo	\N
00040000-5553-25f7-340c-01be9f1602b8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5553-25f7-fd4c-b99de94811f7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5553-25f7-a611-f1288ae3dfff	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5553-25f7-2d30-92e976f9a5fa	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5553-25f7-7f69-8a14ebcbce58	TR	TUR	792	Turkey 	Turčija	\N
00040000-5553-25f7-2867-852ad0543022	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5553-25f7-423e-3fcf426c9d63	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5553-25f7-77b8-4997c791ae6e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5553-25f7-1961-88eead42c237	UG	UGA	800	Uganda 	Uganda	\N
00040000-5553-25f7-ca83-e4239ef924d5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5553-25f7-1814-5024d783e7d4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5553-25f7-0839-d6bc0a19513d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5553-25f7-de4d-ae57b69308d9	US	USA	840	United States 	Združene države Amerike	\N
00040000-5553-25f7-a0c9-4e0374db6af1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5553-25f7-a7fa-e36f8cbbfd89	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5553-25f7-eb3d-431bbd1f8cd2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5553-25f7-67ec-b7a8ac6c410e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5553-25f7-f220-5118503afb23	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5553-25f7-e280-9b8d46a8a3bd	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5553-25f7-194e-a623e8a7ef26	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5553-25f7-a09a-9bec931dffc7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5553-25f7-142b-701f84405f31	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5553-25f7-cb0b-4e95e6bd2915	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5553-25f7-40cb-15247712c14d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5553-25f7-e519-97c0da7c4e39	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5553-25f7-0ac2-e6818640f604	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2673 (class 0 OID 3291617)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3291438)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3291486)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3291535)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3291560)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3291387)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5553-25f8-0da6-ada8f8973efc	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5553-25f8-5cbc-4dbca3d546c5	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5553-25f8-8989-24770e025377	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5553-25f8-8a5f-f39703840fdc	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5553-25f8-a4b5-e0cb6d017fe7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5553-25f8-0bf8-5f21294338a6	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5553-25f8-4d3b-d494ec30fac9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5553-25f8-958d-9caf703894bb	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5553-25f8-cca5-7006cd663327	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5553-25f8-326e-03618f67c466	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2641 (class 0 OID 3291295)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5553-25f8-551e-c82b3c87d232	00000000-5553-25f8-a4b5-e0cb6d017fe7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5553-25f8-9263-bf079d2b14a8	00000000-5553-25f8-a4b5-e0cb6d017fe7	00010000-5553-25f7-5269-0cf400292d7a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5553-25f8-da38-98151890a766	00000000-5553-25f8-0bf8-5f21294338a6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2642 (class 0 OID 3291306)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3291357)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 3291260)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5553-25f7-40f7-33dde37b5e58	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5553-25f7-a151-3e35aae5150a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5553-25f7-02d5-02ffe2b76514	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5553-25f7-fb8f-3b88f2dc8df8	Abonma-read	Abonma - branje	f
00030000-5553-25f7-831f-5c5bc88bd6dd	Abonma-write	Abonma - spreminjanje	f
00030000-5553-25f7-ad4c-f0beb14aa55b	Alternacija-read	Alternacija - branje	f
00030000-5553-25f7-5751-99fa75cf5ae2	Alternacija-write	Alternacija - spreminjanje	f
00030000-5553-25f7-c7f7-0201ef86ce6d	Arhivalija-read	Arhivalija - branje	f
00030000-5553-25f7-e2de-000b41d1ff32	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5553-25f7-9438-b8b2e09ad5d6	Besedilo-read	Besedilo - branje	f
00030000-5553-25f7-6e50-48dd503bc9d0	Besedilo-write	Besedilo - spreminjanje	f
00030000-5553-25f7-c90f-9d514649f322	DogodekIzven-read	DogodekIzven - branje	f
00030000-5553-25f7-950e-50229e6140bd	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5553-25f7-7bfc-b0b9c1d38a1f	Dogodek-read	Dogodek - branje	f
00030000-5553-25f7-b825-70c6bf1100a2	Dogodek-write	Dogodek - spreminjanje	f
00030000-5553-25f7-75e7-5c7aa2a53f1f	Drzava-read	Drzava - branje	f
00030000-5553-25f7-63b1-b3fe894f65f9	Drzava-write	Drzava - spreminjanje	f
00030000-5553-25f7-e922-74df4d6f8f05	Funkcija-read	Funkcija - branje	f
00030000-5553-25f7-3b04-b2aa469a2041	Funkcija-write	Funkcija - spreminjanje	f
00030000-5553-25f7-8744-265039bddecb	Gostovanje-read	Gostovanje - branje	f
00030000-5553-25f7-140a-874b6eb71115	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5553-25f7-5023-9cc8e5c5ca65	Gostujoca-read	Gostujoca - branje	f
00030000-5553-25f7-5312-b998db93341c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5553-25f7-bf79-6b82a4c9b9b1	Kupec-read	Kupec - branje	f
00030000-5553-25f7-ab9c-ca785f0abe32	Kupec-write	Kupec - spreminjanje	f
00030000-5553-25f7-e93a-37f9e2ba6612	NacinPlacina-read	NacinPlacina - branje	f
00030000-5553-25f7-7be9-96b5a503db7f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5553-25f7-2116-32f1d4c138e5	Option-read	Option - branje	f
00030000-5553-25f7-5c6a-87f198112df2	Option-write	Option - spreminjanje	f
00030000-5553-25f7-c7f3-4156b7c9bdad	OptionValue-read	OptionValue - branje	f
00030000-5553-25f7-6e3f-cddf3cb510de	OptionValue-write	OptionValue - spreminjanje	f
00030000-5553-25f7-0ea7-e04b9e04506d	Oseba-read	Oseba - branje	f
00030000-5553-25f7-5252-5105724ae451	Oseba-write	Oseba - spreminjanje	f
00030000-5553-25f7-cc1b-82964f1d74c3	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5553-25f7-4744-5ae560ea567b	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5553-25f7-cfa6-ee4e4b132b3f	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5553-25f7-3197-57afdb8f469e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5553-25f7-494e-c11c8eaf3e06	Pogodba-read	Pogodba - branje	f
00030000-5553-25f7-6b60-afcce3037ec0	Pogodba-write	Pogodba - spreminjanje	f
00030000-5553-25f7-642c-76c7635d2354	Popa-read	Popa - branje	f
00030000-5553-25f7-e301-b3175afe32b0	Popa-write	Popa - spreminjanje	f
00030000-5553-25f7-a23e-61ce95a6bafc	Posta-read	Posta - branje	f
00030000-5553-25f7-8401-3ad83c276b93	Posta-write	Posta - spreminjanje	f
00030000-5553-25f7-34aa-136dbd1117aa	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5553-25f7-da6f-c0b0c7f7d3e6	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5553-25f7-6ade-50ccf8760219	PostniNaslov-read	PostniNaslov - branje	f
00030000-5553-25f7-221d-a28194933ef3	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5553-25f7-1e36-015040365e24	Predstava-read	Predstava - branje	f
00030000-5553-25f7-2462-28ef8bff552f	Predstava-write	Predstava - spreminjanje	f
00030000-5553-25f7-703a-f015042e9b8b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5553-25f7-ba93-f7410e19fbe8	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5553-25f7-c3a1-651659b54933	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5553-25f7-0218-eaf6203bd831	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5553-25f7-e702-15d5bdf3a93e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5553-25f7-295c-feeeccb4a020	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5553-25f7-e9ea-511831face2d	Prostor-read	Prostor - branje	f
00030000-5553-25f7-9fed-4c5cc14b1041	Prostor-write	Prostor - spreminjanje	f
00030000-5553-25f7-2515-242c7495f416	Racun-read	Racun - branje	f
00030000-5553-25f7-97a6-7073c5c736db	Racun-write	Racun - spreminjanje	f
00030000-5553-25f7-6579-7626297beb16	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5553-25f7-6117-9ad16feba334	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5553-25f7-bb2e-36a3863a4b68	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5553-25f7-cb2a-6d542834d31e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5553-25f7-659f-d0d1f74ec189	Rekvizit-read	Rekvizit - branje	f
00030000-5553-25f7-c2d0-7eb0a35aca25	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5553-25f7-922a-b0ad21d8715b	Rezervacija-read	Rezervacija - branje	f
00030000-5553-25f7-a936-c7b223b0f5cd	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5553-25f7-abea-79517aa455ad	SedezniRed-read	SedezniRed - branje	f
00030000-5553-25f7-90ce-5ef7bed66a6b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5553-25f7-0bf2-e061a34830d5	Sedez-read	Sedez - branje	f
00030000-5553-25f7-b325-fff505fffecd	Sedez-write	Sedez - spreminjanje	f
00030000-5553-25f7-9e98-b6aabd1b1909	Sezona-read	Sezona - branje	f
00030000-5553-25f7-c4d8-cb11e5acfeb3	Sezona-write	Sezona - spreminjanje	f
00030000-5553-25f7-ea8e-e876158f8016	Telefonska-read	Telefonska - branje	f
00030000-5553-25f7-d3e0-3b3b7e0540cf	Telefonska-write	Telefonska - spreminjanje	f
00030000-5553-25f7-2323-973bc3a9a6b7	TerminStoritve-read	TerminStoritve - branje	f
00030000-5553-25f7-23a2-5d3318a4fa38	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5553-25f7-b867-9c832850af60	TipFunkcije-read	TipFunkcije - branje	f
00030000-5553-25f7-919f-592b98bca4c7	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5553-25f7-eb70-07daed07dc10	Trr-read	Trr - branje	f
00030000-5553-25f7-751c-33c7ec5063f7	Trr-write	Trr - spreminjanje	f
00030000-5553-25f7-dfd3-853a66c5ac63	Uprizoritev-read	Uprizoritev - branje	f
00030000-5553-25f7-985c-4bed12251821	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5553-25f7-06ca-04fb30a1dd74	Vaja-read	Vaja - branje	f
00030000-5553-25f7-d494-94d15725c67c	Vaja-write	Vaja - spreminjanje	f
00030000-5553-25f7-7225-69bee16f1ef2	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5553-25f7-b512-bb738608a6a5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5553-25f7-e57f-1d7898f79e61	Zaposlitev-read	Zaposlitev - branje	f
00030000-5553-25f7-0188-3ce729c7568b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5553-25f7-5c94-8f0676aded24	Zasedenost-read	Zasedenost - branje	f
00030000-5553-25f7-838c-005b317d827e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5553-25f7-159a-d9851f5e74fb	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5553-25f7-b851-8d72b4dee64b	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5553-25f7-0541-67a9892fd648	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5553-25f7-e66a-ff264222365f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2639 (class 0 OID 3291279)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5553-25f7-bddc-f5c49946cac4	00030000-5553-25f7-75e7-5c7aa2a53f1f
00020000-5553-25f7-da1e-e193b542ec57	00030000-5553-25f7-63b1-b3fe894f65f9
00020000-5553-25f7-da1e-e193b542ec57	00030000-5553-25f7-75e7-5c7aa2a53f1f
\.


--
-- TOC entry 2667 (class 0 OID 3291567)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3291597)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3291712)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3291337)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3291379)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5553-25f7-bf3b-b38cef558b69	8341	Adlešiči
00050000-5553-25f7-75d8-6aeb030bbd8b	5270	Ajdovščina
00050000-5553-25f7-8c91-1a83013c2b30	6280	Ankaran/Ancarano
00050000-5553-25f7-6c0d-2c9aa0459112	9253	Apače
00050000-5553-25f7-403f-c37edb4e1d38	8253	Artiče
00050000-5553-25f7-3ffd-fb92ebe60344	4275	Begunje na Gorenjskem
00050000-5553-25f7-05b3-9685c26d2a03	1382	Begunje pri Cerknici
00050000-5553-25f7-101e-518c5ee775bf	9231	Beltinci
00050000-5553-25f7-8f5c-a1a0e4bab4fa	2234	Benedikt
00050000-5553-25f7-cf28-4822dcc22bc6	2345	Bistrica ob Dravi
00050000-5553-25f7-08af-1f12ed77a3d6	3256	Bistrica ob Sotli
00050000-5553-25f7-147b-efe53dd79208	8259	Bizeljsko
00050000-5553-25f7-2872-842540dbf132	1223	Blagovica
00050000-5553-25f7-f7c9-ce988d410245	8283	Blanca
00050000-5553-25f7-4a9b-6074ad82fe69	4260	Bled
00050000-5553-25f7-2d0e-154204b757a2	4273	Blejska Dobrava
00050000-5553-25f7-ce8f-ca4dd9410e15	9265	Bodonci
00050000-5553-25f7-3242-c10356b14fe9	9222	Bogojina
00050000-5553-25f7-6dd4-dacb6ef30977	4263	Bohinjska Bela
00050000-5553-25f7-e2e2-01b7e74e2b1e	4264	Bohinjska Bistrica
00050000-5553-25f7-6ba4-b5c192817d9a	4265	Bohinjsko jezero
00050000-5553-25f7-9a56-c3db5d78f45b	1353	Borovnica
00050000-5553-25f7-a268-a03261f1bf76	8294	Boštanj
00050000-5553-25f7-016b-b3aac59288c4	5230	Bovec
00050000-5553-25f7-c269-d611ee7f3765	5295	Branik
00050000-5553-25f7-8e62-7c96c78f84cd	3314	Braslovče
00050000-5553-25f7-ac91-7ac0fb8766d5	5223	Breginj
00050000-5553-25f7-8a68-ec454ad33bd0	8280	Brestanica
00050000-5553-25f7-974f-19e805a56a98	2354	Bresternica
00050000-5553-25f7-b7d8-1cb836f9429a	4243	Brezje
00050000-5553-25f7-6dfb-ce84052b1356	1351	Brezovica pri Ljubljani
00050000-5553-25f7-46df-b6414ec5a601	8250	Brežice
00050000-5553-25f7-2fa0-c7948d75d686	4210	Brnik - Aerodrom
00050000-5553-25f7-f30b-30502bd673f7	8321	Brusnice
00050000-5553-25f7-099f-ce90da235d4b	3255	Buče
00050000-5553-25f7-f363-b4db9efb90e6	8276	Bučka 
00050000-5553-25f7-959d-eab943be26e3	9261	Cankova
00050000-5553-25f7-5c41-7b3798c89602	3000	Celje 
00050000-5553-25f7-bea0-b2b872dfc096	3001	Celje - poštni predali
00050000-5553-25f7-7c16-382c765e48f2	4207	Cerklje na Gorenjskem
00050000-5553-25f7-bdc9-ea70f681c65a	8263	Cerklje ob Krki
00050000-5553-25f7-5d4c-83b0a2cd62a3	1380	Cerknica
00050000-5553-25f7-6f5f-fbbd66253221	5282	Cerkno
00050000-5553-25f7-a16c-eb794167db81	2236	Cerkvenjak
00050000-5553-25f7-66a2-8922a5ba2718	2215	Ceršak
00050000-5553-25f7-440d-9084f50213d6	2326	Cirkovce
00050000-5553-25f7-109f-38d3486d89e1	2282	Cirkulane
00050000-5553-25f7-039b-d6afe6d8c216	5273	Col
00050000-5553-25f7-a63a-dfc44ac2dd5c	8251	Čatež ob Savi
00050000-5553-25f7-ee6b-6b76e9f69b06	1413	Čemšenik
00050000-5553-25f7-08d3-f4197b4419bd	5253	Čepovan
00050000-5553-25f7-dc79-3be063cf251d	9232	Črenšovci
00050000-5553-25f7-b1df-ed9a93795c7a	2393	Črna na Koroškem
00050000-5553-25f7-f43b-14e1ea4959b4	6275	Črni Kal
00050000-5553-25f7-8961-f4a55b4f7b72	5274	Črni Vrh nad Idrijo
00050000-5553-25f7-0043-d220e68679ad	5262	Črniče
00050000-5553-25f7-18bd-cb21d2c3e7db	8340	Črnomelj
00050000-5553-25f7-3409-8fb24179e3e6	6271	Dekani
00050000-5553-25f7-498e-475f5a3c1bf0	5210	Deskle
00050000-5553-25f7-e881-eddad3bc634e	2253	Destrnik
00050000-5553-25f7-ddb5-ec4a7f8c072c	6215	Divača
00050000-5553-25f7-1d43-2b82d039e29f	1233	Dob
00050000-5553-25f7-3dd0-de539e4fec43	3224	Dobje pri Planini
00050000-5553-25f7-f4a3-9e11f5d8383d	8257	Dobova
00050000-5553-25f7-2b80-6627c257f8df	1423	Dobovec
00050000-5553-25f7-b67a-ba66045a0637	5263	Dobravlje
00050000-5553-25f7-c080-0e9e6d64ea04	3204	Dobrna
00050000-5553-25f7-d598-ff77bbeb96d6	8211	Dobrnič
00050000-5553-25f7-083a-d9620f3c6ef3	1356	Dobrova
00050000-5553-25f7-9db8-ee980fe26bac	9223	Dobrovnik/Dobronak 
00050000-5553-25f7-11ac-f4753dfb363b	5212	Dobrovo v Brdih
00050000-5553-25f7-6cca-606b09251223	1431	Dol pri Hrastniku
00050000-5553-25f7-ae5b-15f5ae084cfc	1262	Dol pri Ljubljani
00050000-5553-25f7-db88-c6ad9ec72e91	1273	Dole pri Litiji
00050000-5553-25f7-8704-599ed4d0f08d	1331	Dolenja vas
00050000-5553-25f7-9774-746e789817c8	8350	Dolenjske Toplice
00050000-5553-25f7-63c6-d7edb2c2b9e1	1230	Domžale
00050000-5553-25f7-2add-bd6dfad523b7	2252	Dornava
00050000-5553-25f7-eb9a-0fb0f23820fb	5294	Dornberk
00050000-5553-25f7-2c96-3ce814a94f26	1319	Draga
00050000-5553-25f7-6f84-b12d7aff3f4f	8343	Dragatuš
00050000-5553-25f7-cc13-76a4e32fe9d0	3222	Dramlje
00050000-5553-25f7-bfc1-4fd15f9f6369	2370	Dravograd
00050000-5553-25f7-7f4a-c7629e480072	4203	Duplje
00050000-5553-25f7-d58a-19012c38ce58	6221	Dutovlje
00050000-5553-25f7-4be0-e1378aec06cc	8361	Dvor
00050000-5553-25f7-dcc9-5e0d04aa885f	2343	Fala
00050000-5553-25f7-7e56-e0e5269bbf23	9208	Fokovci
00050000-5553-25f7-4788-093fe0befe9b	2313	Fram
00050000-5553-25f7-d42e-aef582717860	3213	Frankolovo
00050000-5553-25f7-8b7c-f58d934d0907	1274	Gabrovka
00050000-5553-25f7-5f15-0ce9e32e4c2f	8254	Globoko
00050000-5553-25f7-7c06-56d0263881ac	5275	Godovič
00050000-5553-25f7-cf2f-8c57848f1c3c	4204	Golnik
00050000-5553-25f7-f1d7-d614238b559e	3303	Gomilsko
00050000-5553-25f7-df03-b2ca1f443772	4224	Gorenja vas
00050000-5553-25f7-02c2-8421542a6019	3263	Gorica pri Slivnici
00050000-5553-25f7-3e23-0f5b9200cec4	2272	Gorišnica
00050000-5553-25f7-476e-c9d14fb86cb2	9250	Gornja Radgona
00050000-5553-25f7-4a72-f03e538736e0	3342	Gornji Grad
00050000-5553-25f7-c419-67cc10b0d03f	4282	Gozd Martuljek
00050000-5553-25f7-cd38-b772bf9107e8	6272	Gračišče
00050000-5553-25f7-ff30-1eed2ec652be	9264	Grad
00050000-5553-25f7-babb-129b78e8d71e	8332	Gradac
00050000-5553-25f7-ca46-e58ef3249846	1384	Grahovo
00050000-5553-25f7-cada-936055a5e079	5242	Grahovo ob Bači
00050000-5553-25f7-7c3a-dfd240c3d550	5251	Grgar
00050000-5553-25f7-9318-51553a42401a	3302	Griže
00050000-5553-25f7-e591-5d0e05de86c8	3231	Grobelno
00050000-5553-25f7-bef2-c061ee0e71c2	1290	Grosuplje
00050000-5553-25f7-d539-6302fd5503ba	2288	Hajdina
00050000-5553-25f7-7728-21f5f3274ff8	8362	Hinje
00050000-5553-25f7-640c-cc18f72f7ead	2311	Hoče
00050000-5553-25f7-cb47-d349aec82e8f	9205	Hodoš/Hodos
00050000-5553-25f7-04b3-ab94002277a7	1354	Horjul
00050000-5553-25f7-5561-4d2c84a68a26	1372	Hotedršica
00050000-5553-25f7-91fe-792aec926ffc	1430	Hrastnik
00050000-5553-25f7-648f-f928533f8311	6225	Hruševje
00050000-5553-25f7-1763-ec90651b9519	4276	Hrušica
00050000-5553-25f7-6987-891dbf12be43	5280	Idrija
00050000-5553-25f7-f953-e4a4779dd0ec	1292	Ig
00050000-5553-25f7-2d9d-2fa9d3607a4e	6250	Ilirska Bistrica
00050000-5553-25f7-3614-d69890ba3f25	6251	Ilirska Bistrica-Trnovo
00050000-5553-25f7-dfc8-f8f7d35ca613	1295	Ivančna Gorica
00050000-5553-25f7-c69e-60aa7a2759c8	2259	Ivanjkovci
00050000-5553-25f7-9383-e1b402fc028c	1411	Izlake
00050000-5553-25f7-e5ed-5bfe8d592bb9	6310	Izola/Isola
00050000-5553-25f7-8195-399e5be03de4	2222	Jakobski Dol
00050000-5553-25f7-4e47-dfa18b30202b	2221	Jarenina
00050000-5553-25f7-c549-a6ff4168e3b4	6254	Jelšane
00050000-5553-25f7-5205-38b68f4d3d63	4270	Jesenice
00050000-5553-25f7-5ef8-8dd7e3de4c1e	8261	Jesenice na Dolenjskem
00050000-5553-25f7-b5c4-0cd1b4a9fbc8	3273	Jurklošter
00050000-5553-25f7-a08a-8b485a1c44b5	2223	Jurovski Dol
00050000-5553-25f7-8dc6-0270ce664ffa	2256	Juršinci
00050000-5553-25f7-bc7a-659278bde923	5214	Kal nad Kanalom
00050000-5553-25f7-42f0-63aa46d4e619	3233	Kalobje
00050000-5553-25f7-45cf-f08899372b26	4246	Kamna Gorica
00050000-5553-25f7-767d-e7c824397625	2351	Kamnica
00050000-5553-25f7-7708-d99e9246aa7e	1241	Kamnik
00050000-5553-25f7-3a10-f01752f24e3f	5213	Kanal
00050000-5553-25f7-77c5-08b4d41ce607	8258	Kapele
00050000-5553-25f7-2b05-ac7bfe440be5	2362	Kapla
00050000-5553-25f7-f1d9-6b3874fa851c	2325	Kidričevo
00050000-5553-25f7-f677-744267ed6b80	1412	Kisovec
00050000-5553-25f7-dbc2-6776bf7e7ee5	6253	Knežak
00050000-5553-25f7-db6d-eb459eb5b397	5222	Kobarid
00050000-5553-25f7-e0ad-c5c70d57dc2f	9227	Kobilje
00050000-5553-25f7-ba66-c761e7d9110c	1330	Kočevje
00050000-5553-25f7-736c-3775a7d2273d	1338	Kočevska Reka
00050000-5553-25f7-367c-071ead0c4a74	2276	Kog
00050000-5553-25f7-ee87-faf000c8c757	5211	Kojsko
00050000-5553-25f7-5ad2-29979a5c23d5	6223	Komen
00050000-5553-25f7-7e36-81181b4b24fa	1218	Komenda
00050000-5553-25f7-9743-ed392af669ab	6000	Koper/Capodistria 
00050000-5553-25f7-10da-ea3a9aa3e897	6001	Koper/Capodistria - poštni predali
00050000-5553-25f7-5f9e-6c39af6a86d5	8282	Koprivnica
00050000-5553-25f7-7c68-0483d6843ca8	5296	Kostanjevica na Krasu
00050000-5553-25f7-33e9-13d83266b598	8311	Kostanjevica na Krki
00050000-5553-25f7-a6f1-b67e73bf7c62	1336	Kostel
00050000-5553-25f7-8184-61eba1d51085	6256	Košana
00050000-5553-25f7-1779-c8e186b3e4d4	2394	Kotlje
00050000-5553-25f7-1cbe-35d0f2719aa7	6240	Kozina
00050000-5553-25f7-44a0-807e72756251	3260	Kozje
00050000-5553-25f7-c4d2-34584f792cf5	4000	Kranj 
00050000-5553-25f7-ad45-9f9d33422da8	4001	Kranj - poštni predali
00050000-5553-25f7-0e1b-861fc6e42ca7	4280	Kranjska Gora
00050000-5553-25f7-a219-b61b00e6fbfa	1281	Kresnice
00050000-5553-25f7-60f6-665094b40611	4294	Križe
00050000-5553-25f7-83e7-4ccf23b7fb0c	9206	Križevci
00050000-5553-25f7-a5a0-592b3e703404	9242	Križevci pri Ljutomeru
00050000-5553-25f7-5a70-58e50f3f0be2	1301	Krka
00050000-5553-25f7-0530-7110e6882ac7	8296	Krmelj
00050000-5553-25f7-5f37-d036733189c7	4245	Kropa
00050000-5553-25f7-fbe8-16b761141f62	8262	Krška vas
00050000-5553-25f7-d000-9c1ee2e52854	8270	Krško
00050000-5553-25f7-f940-8dcdeb238449	9263	Kuzma
00050000-5553-25f7-b77d-c9c0eafbc165	2318	Laporje
00050000-5553-25f7-2a69-a60ba749438a	3270	Laško
00050000-5553-25f7-1fc7-97b3d0be80b0	1219	Laze v Tuhinju
00050000-5553-25f7-be38-a09e3b5ef394	2230	Lenart v Slovenskih goricah
00050000-5553-25f7-ce74-cec17c77e12f	9220	Lendava/Lendva
00050000-5553-25f7-ccdf-6e6ba4ffb5a6	4248	Lesce
00050000-5553-25f7-8963-2734b37c4f5c	3261	Lesično
00050000-5553-25f7-090b-6c48b3d0697d	8273	Leskovec pri Krškem
00050000-5553-25f7-b1e8-8097a74f50f7	2372	Libeliče
00050000-5553-25f7-daaa-35b417468652	2341	Limbuš
00050000-5553-25f7-e806-fbfec8850839	1270	Litija
00050000-5553-25f7-2f06-283a7b1b743a	3202	Ljubečna
00050000-5553-25f7-1112-15040a5c820c	1000	Ljubljana 
00050000-5553-25f7-30ee-43d7615ac817	1001	Ljubljana - poštni predali
00050000-5553-25f7-29a9-8376f81e82f2	1231	Ljubljana - Črnuče
00050000-5553-25f7-a14b-b19e4d77389f	1261	Ljubljana - Dobrunje
00050000-5553-25f7-8e46-612891eea77d	1260	Ljubljana - Polje
00050000-5553-25f7-f1f1-f536567558c9	1210	Ljubljana - Šentvid
00050000-5553-25f7-4775-669ed0e32e4a	1211	Ljubljana - Šmartno
00050000-5553-25f7-7df4-7added27ed7c	3333	Ljubno ob Savinji
00050000-5553-25f7-204f-09cc8946a9f7	9240	Ljutomer
00050000-5553-25f7-3e31-eb4ca9975279	3215	Loče
00050000-5553-25f7-aaa3-173f1f6ee915	5231	Log pod Mangartom
00050000-5553-25f7-6b4c-13a8ddf7f30b	1358	Log pri Brezovici
00050000-5553-25f7-afc7-4c3df45ea238	1370	Logatec
00050000-5553-25f7-65a8-082705053e2f	1371	Logatec
00050000-5553-25f7-281a-ae0252f689de	1434	Loka pri Zidanem Mostu
00050000-5553-25f7-0ea7-7809ee1ac1b8	3223	Loka pri Žusmu
00050000-5553-25f7-e053-9ef1c7cb61f6	6219	Lokev
00050000-5553-25f7-75a1-f90b36ab44d9	1318	Loški Potok
00050000-5553-25f7-3831-0c0a7942e9d8	2324	Lovrenc na Dravskem polju
00050000-5553-25f7-7d63-d7ec998b5988	2344	Lovrenc na Pohorju
00050000-5553-25f7-b1b9-6a19b9f295a4	3334	Luče
00050000-5553-25f7-426d-dc2d97886d20	1225	Lukovica
00050000-5553-25f7-1f96-4bb8d91dbe77	9202	Mačkovci
00050000-5553-25f7-7cf9-67dd49500b8e	2322	Majšperk
00050000-5553-25f7-f8bc-7a026875bde6	2321	Makole
00050000-5553-25f7-1c24-6e099d5bc383	9243	Mala Nedelja
00050000-5553-25f7-0f86-4ccbccde06eb	2229	Malečnik
00050000-5553-25f7-8439-07e89e2691cd	6273	Marezige
00050000-5553-25f7-feb2-5b68fd59a547	2000	Maribor 
00050000-5553-25f7-e2d7-4f3b244aff98	2001	Maribor - poštni predali
00050000-5553-25f7-994d-fd4bc165031f	2206	Marjeta na Dravskem polju
00050000-5553-25f7-be13-9d57021fa5ca	2281	Markovci
00050000-5553-25f7-4ef2-4c110cfc63d0	9221	Martjanci
00050000-5553-25f7-831c-456bb2589ca2	6242	Materija
00050000-5553-25f7-a268-56d94bb4d5e3	4211	Mavčiče
00050000-5553-25f7-783f-02f655f333bc	1215	Medvode
00050000-5553-25f7-0536-6b7cf94dbc1f	1234	Mengeš
00050000-5553-25f7-56f7-05c90ec0a6d7	8330	Metlika
00050000-5553-25f7-3566-02e6bc1ca6a3	2392	Mežica
00050000-5553-25f7-5675-a3a6a0e803f0	2204	Miklavž na Dravskem polju
00050000-5553-25f7-3160-366e4a6a80b4	2275	Miklavž pri Ormožu
00050000-5553-25f7-e190-ebfea5c59065	5291	Miren
00050000-5553-25f7-7f02-b6ea1723819f	8233	Mirna
00050000-5553-25f7-f113-a06f4f1c7f7a	8216	Mirna Peč
00050000-5553-25f7-e3cf-ad4442d468ce	2382	Mislinja
00050000-5553-25f7-d5d2-90d1582038d7	4281	Mojstrana
00050000-5553-25f7-f4df-0fb73e0f3b71	8230	Mokronog
00050000-5553-25f7-f9a7-cdf2f340beb8	1251	Moravče
00050000-5553-25f7-5699-cf2b1ff4c94c	9226	Moravske Toplice
00050000-5553-25f7-0e40-03d4919120de	5216	Most na Soči
00050000-5553-25f7-1804-9693a757d5f4	1221	Motnik
00050000-5553-25f7-b5a8-73ab92feb73c	3330	Mozirje
00050000-5553-25f7-51c2-166672462f22	9000	Murska Sobota 
00050000-5553-25f7-17c1-24c2fa03c198	9001	Murska Sobota - poštni predali
00050000-5553-25f7-9793-8004c99d4e33	2366	Muta
00050000-5553-25f7-74f8-6ae469da59a2	4202	Naklo
00050000-5553-25f7-7436-46fd83ea5f27	3331	Nazarje
00050000-5553-25f7-244d-d98c6c4299ef	1357	Notranje Gorice
00050000-5553-25f7-1248-ac081e7117fa	3203	Nova Cerkev
00050000-5553-25f7-4887-4315c4893e9b	5000	Nova Gorica 
00050000-5553-25f7-4bea-ca2ed2c34ade	5001	Nova Gorica - poštni predali
00050000-5553-25f7-9242-731a97144846	1385	Nova vas
00050000-5553-25f7-f79a-cc8ce1a9f3f0	8000	Novo mesto
00050000-5553-25f7-ec1c-70d7c03c4a51	8001	Novo mesto - poštni predali
00050000-5553-25f7-577b-43464c41503e	6243	Obrov
00050000-5553-25f7-e504-eb06bebab854	9233	Odranci
00050000-5553-25f7-56f4-31ba4d964694	2317	Oplotnica
00050000-5553-25f7-60a5-7ea68329a8d6	2312	Orehova vas
00050000-5553-25f7-a37e-c21242324eaa	2270	Ormož
00050000-5553-25f7-d46c-96ca6214506e	1316	Ortnek
00050000-5553-25f7-aa3c-ed60149853d9	1337	Osilnica
00050000-5553-25f7-5e78-a7d85fe63089	8222	Otočec
00050000-5553-25f7-9c51-49ea6c70ba05	2361	Ožbalt
00050000-5553-25f7-bd90-4476cf4f0a48	2231	Pernica
00050000-5553-25f7-478d-c8e1e07f5d70	2211	Pesnica pri Mariboru
00050000-5553-25f7-059b-b095ae95468e	9203	Petrovci
00050000-5553-25f7-079c-3377c6daeafd	3301	Petrovče
00050000-5553-25f7-5497-2ea0ea4b3bd5	6330	Piran/Pirano
00050000-5553-25f7-10ba-33b1fb702fae	8255	Pišece
00050000-5553-25f7-fb15-a4bc3f2749a4	6257	Pivka
00050000-5553-25f7-1b2d-b99c1ae7a8ba	6232	Planina
00050000-5553-25f7-b8f3-740454404a0a	3225	Planina pri Sevnici
00050000-5553-25f7-aa1e-707096fd189b	6276	Pobegi
00050000-5553-25f7-7706-a2d72733079c	8312	Podbočje
00050000-5553-25f7-2137-fb806043ce7b	5243	Podbrdo
00050000-5553-25f7-f834-2cc9f864bd8c	3254	Podčetrtek
00050000-5553-25f7-cd86-0c6c854715a6	2273	Podgorci
00050000-5553-25f7-e452-6c5303cdb29d	6216	Podgorje
00050000-5553-25f7-9fa8-ebead52e11bb	2381	Podgorje pri Slovenj Gradcu
00050000-5553-25f7-8e5b-bd4250aa7f5a	6244	Podgrad
00050000-5553-25f7-8308-e47295df7a9e	1414	Podkum
00050000-5553-25f7-14aa-f5211e97cbee	2286	Podlehnik
00050000-5553-25f7-0f9d-65769bed92d3	5272	Podnanos
00050000-5553-25f7-dcd5-eb4afba32e95	4244	Podnart
00050000-5553-25f7-ac57-296d96d66237	3241	Podplat
00050000-5553-25f7-115c-020686664501	3257	Podsreda
00050000-5553-25f7-58c6-1f6705071c5d	2363	Podvelka
00050000-5553-25f7-5a2b-205b08e29b7e	2208	Pohorje
00050000-5553-25f7-39e3-aaccd615815f	2257	Polenšak
00050000-5553-25f7-c3a4-a3b842331448	1355	Polhov Gradec
00050000-5553-25f7-f64a-2db2b5bd824d	4223	Poljane nad Škofjo Loko
00050000-5553-25f7-8795-74b2d867e27d	2319	Poljčane
00050000-5553-25f7-bfb0-b55626e1d513	1272	Polšnik
00050000-5553-25f7-857b-f2a04e2b085f	3313	Polzela
00050000-5553-25f7-2dd9-5ac74142d1cc	3232	Ponikva
00050000-5553-25f7-cc8d-c5c327d2ef62	6320	Portorož/Portorose
00050000-5553-25f7-ca93-45914d6ab58c	6230	Postojna
00050000-5553-25f7-eff0-2b851bcb64da	2331	Pragersko
00050000-5553-25f7-2ce1-017f50197285	3312	Prebold
00050000-5553-25f7-0a21-259bda573946	4205	Preddvor
00050000-5553-25f7-b954-6f8c8ab3d347	6255	Prem
00050000-5553-25f7-2b8c-e504fccd6589	1352	Preserje
00050000-5553-25f7-4f1a-d60c144071b3	6258	Prestranek
00050000-5553-25f7-1e6e-817859c2eaf4	2391	Prevalje
00050000-5553-25f7-56ea-b35e625e93c9	3262	Prevorje
00050000-5553-25f7-0f25-54cd16ae719c	1276	Primskovo 
00050000-5553-25f7-197b-1200e7ffa8bf	3253	Pristava pri Mestinju
00050000-5553-25f7-6355-6f94823f5d62	9207	Prosenjakovci/Partosfalva
00050000-5553-25f7-bef8-f4ad0949da32	5297	Prvačina
00050000-5553-25f7-05ce-66f4b4a0f0ca	2250	Ptuj
00050000-5553-25f7-c14c-042a8b8902f0	2323	Ptujska Gora
00050000-5553-25f7-e1c0-4493f7744287	9201	Puconci
00050000-5553-25f7-a8ca-534d1b21e811	2327	Rače
00050000-5553-25f7-a1f3-ab8615e74306	1433	Radeče
00050000-5553-25f7-1458-2f8082f63d75	9252	Radenci
00050000-5553-25f7-82ce-b27b21c2f3b1	2360	Radlje ob Dravi
00050000-5553-25f7-e2e0-14916065149e	1235	Radomlje
00050000-5553-25f7-38b2-0800c8871d33	4240	Radovljica
00050000-5553-25f7-37c6-66424ecc580c	8274	Raka
00050000-5553-25f7-d26b-c38a34bee934	1381	Rakek
00050000-5553-25f7-bb3b-60e8cb91a6ad	4283	Rateče - Planica
00050000-5553-25f7-42b1-802a995592db	2390	Ravne na Koroškem
00050000-5553-25f7-9c0c-8f8544f62225	9246	Razkrižje
00050000-5553-25f7-8222-80495c25e7b5	3332	Rečica ob Savinji
00050000-5553-25f7-61bb-2d320862c3d1	5292	Renče
00050000-5553-25f7-236b-78507a82bc72	1310	Ribnica
00050000-5553-25f7-4443-ba578d3d9f1d	2364	Ribnica na Pohorju
00050000-5553-25f7-fe4c-004cdb03cc6b	3272	Rimske Toplice
00050000-5553-25f7-c2a7-d21b6c4aae8f	1314	Rob
00050000-5553-25f7-262e-2d9655ea59e5	5215	Ročinj
00050000-5553-25f7-f2c0-91c899dfe8d3	3250	Rogaška Slatina
00050000-5553-25f7-410f-60c7f47d4b8a	9262	Rogašovci
00050000-5553-25f7-8250-81b0dcd3b31c	3252	Rogatec
00050000-5553-25f7-35a4-8f475fef3c67	1373	Rovte
00050000-5553-25f7-baf7-14e221b06bc6	2342	Ruše
00050000-5553-25f7-9684-ef4f4abed431	1282	Sava
00050000-5553-25f7-676d-f315ce8ae93c	6333	Sečovlje/Sicciole
00050000-5553-25f7-0cfb-268ea3c82665	4227	Selca
00050000-5553-25f7-f266-ae1ed691b89e	2352	Selnica ob Dravi
00050000-5553-25f7-ccf0-cef6047857ba	8333	Semič
00050000-5553-25f7-5c03-5ba11ac7fd5e	8281	Senovo
00050000-5553-25f7-873d-68575da4d831	6224	Senožeče
00050000-5553-25f7-c355-8ebb3703fb5a	8290	Sevnica
00050000-5553-25f7-6724-e90c8a9adf40	6210	Sežana
00050000-5553-25f7-2b23-0228e2a5d248	2214	Sladki Vrh
00050000-5553-25f7-6bbb-448475cc5635	5283	Slap ob Idrijci
00050000-5553-25f7-fc29-fa5efb6ba6c1	2380	Slovenj Gradec
00050000-5553-25f7-13cf-085c3dc927a9	2310	Slovenska Bistrica
00050000-5553-25f7-e65f-e3da4ba2072e	3210	Slovenske Konjice
00050000-5553-25f7-ff24-e67a56330a4e	1216	Smlednik
00050000-5553-25f7-4095-9f19b0a8bc85	5232	Soča
00050000-5553-25f7-ca83-34c06002f3c1	1317	Sodražica
00050000-5553-25f7-0419-48e242815345	3335	Solčava
00050000-5553-25f7-2ad0-c8a4e7fcae64	5250	Solkan
00050000-5553-25f7-8dda-0d1fb7f24537	4229	Sorica
00050000-5553-25f7-8b52-e914cba101b2	4225	Sovodenj
00050000-5553-25f7-74e8-a714cd49b38a	5281	Spodnja Idrija
00050000-5553-25f7-d44e-230fbe04c1e6	2241	Spodnji Duplek
00050000-5553-25f7-a051-d7cfdd46d766	9245	Spodnji Ivanjci
00050000-5553-25f7-fcb6-535da9c18794	2277	Središče ob Dravi
00050000-5553-25f7-6a87-d5fac0bd74d2	4267	Srednja vas v Bohinju
00050000-5553-25f7-3b6f-b0f2b7ff0446	8256	Sromlje 
00050000-5553-25f7-fc0b-c478da8a1e97	5224	Srpenica
00050000-5553-25f7-8c21-70415c049bba	1242	Stahovica
00050000-5553-25f7-5c08-af09a849f999	1332	Stara Cerkev
00050000-5553-25f7-af60-95762b11ac0e	8342	Stari trg ob Kolpi
00050000-5553-25f7-3fc8-be6fc4cc1c3e	1386	Stari trg pri Ložu
00050000-5553-25f7-b0f9-7e0b1ba89003	2205	Starše
00050000-5553-25f7-b06e-e87963ec9312	2289	Stoperce
00050000-5553-25f7-652c-035b4449ab03	8322	Stopiče
00050000-5553-25f7-1646-aaf65c7ed92c	3206	Stranice
00050000-5553-25f7-59fe-e24505eeb957	8351	Straža
00050000-5553-25f7-8c09-72eee5a74390	1313	Struge
00050000-5553-25f7-c1aa-7789778517c2	8293	Studenec
00050000-5553-25f7-c6f7-b955cea9f370	8331	Suhor
00050000-5553-25f7-e7db-fc8852deab23	2233	Sv. Ana v Slovenskih goricah
00050000-5553-25f7-c8ab-99b032ba1c1e	2235	Sv. Trojica v Slovenskih goricah
00050000-5553-25f7-0574-8856b13a9e52	2353	Sveti Duh na Ostrem Vrhu
00050000-5553-25f7-7eeb-84a520d0e679	9244	Sveti Jurij ob Ščavnici
00050000-5553-25f7-131f-1435df03a54b	3264	Sveti Štefan
00050000-5553-25f7-f640-fb3fcf27ff4d	2258	Sveti Tomaž
00050000-5553-25f7-1c80-1e8574da881e	9204	Šalovci
00050000-5553-25f7-74a9-554d54456527	5261	Šempas
00050000-5553-25f7-e048-acbde06d6f6e	5290	Šempeter pri Gorici
00050000-5553-25f7-c923-00821c2ca1cf	3311	Šempeter v Savinjski dolini
00050000-5553-25f7-0636-8e2b3d5d36dc	4208	Šenčur
00050000-5553-25f7-52f9-ae6a0c9d3aa7	2212	Šentilj v Slovenskih goricah
00050000-5553-25f7-fb6f-f600ef8bb24f	8297	Šentjanž
00050000-5553-25f7-d845-d2415539b94e	2373	Šentjanž pri Dravogradu
00050000-5553-25f7-24cb-59f1fe9ed832	8310	Šentjernej
00050000-5553-25f7-ea2f-7aac795915a5	3230	Šentjur
00050000-5553-25f7-aac9-bad6f3008244	3271	Šentrupert
00050000-5553-25f7-089d-173ccca4950d	8232	Šentrupert
00050000-5553-25f7-7a88-5b04c206148b	1296	Šentvid pri Stični
00050000-5553-25f7-0365-76fb35f4600a	8275	Škocjan
00050000-5553-25f7-7a96-870faf09db6c	6281	Škofije
00050000-5553-25f7-b8cc-821e1d524ea3	4220	Škofja Loka
00050000-5553-25f7-2668-8c39b7e5fb1d	3211	Škofja vas
00050000-5553-25f7-d4d7-625b97f9e50a	1291	Škofljica
00050000-5553-25f7-3108-bf90e9f7f836	6274	Šmarje
00050000-5553-25f7-9712-44fb7f039eaf	1293	Šmarje - Sap
00050000-5553-25f7-e389-a33400fbec54	3240	Šmarje pri Jelšah
00050000-5553-25f7-e11c-2d5e43a23f32	8220	Šmarješke Toplice
00050000-5553-25f7-83d9-1b9e2bfdd063	2315	Šmartno na Pohorju
00050000-5553-25f7-58d9-21c0eedb05f8	3341	Šmartno ob Dreti
00050000-5553-25f7-5e13-49456d71415b	3327	Šmartno ob Paki
00050000-5553-25f7-e4ae-7aa4cd99ef3b	1275	Šmartno pri Litiji
00050000-5553-25f7-84ce-02615bfa16e8	2383	Šmartno pri Slovenj Gradcu
00050000-5553-25f7-b243-24b14b4fd06a	3201	Šmartno v Rožni dolini
00050000-5553-25f7-6ac1-99d87ec8c8c6	3325	Šoštanj
00050000-5553-25f7-9392-01ed13ef2bc1	6222	Štanjel
00050000-5553-25f7-6d20-2e9d4f04f6ea	3220	Štore
00050000-5553-25f7-892c-8eec8dcb35ef	3304	Tabor
00050000-5553-25f7-70cb-6b65fd3523e5	3221	Teharje
00050000-5553-25f7-9e2b-13c88f1f91c4	9251	Tišina
00050000-5553-25f7-eadc-6f95bf2e636d	5220	Tolmin
00050000-5553-25f7-0e24-023776b7199a	3326	Topolšica
00050000-5553-25f7-d89f-766c50c3533e	2371	Trbonje
00050000-5553-25f7-b79f-5ee28c1323e2	1420	Trbovlje
00050000-5553-25f7-29da-6c0f46c9e365	8231	Trebelno 
00050000-5553-25f7-554d-90a05a50d93a	8210	Trebnje
00050000-5553-25f7-3d05-2e09e2303a32	5252	Trnovo pri Gorici
00050000-5553-25f7-9e58-6271e895edb9	2254	Trnovska vas
00050000-5553-25f7-e9ec-d2c9098e2135	1222	Trojane
00050000-5553-25f7-0527-9aa895dad353	1236	Trzin
00050000-5553-25f7-d7c7-e6b605fd5628	4290	Tržič
00050000-5553-25f7-42a0-eecac37423a9	8295	Tržišče
00050000-5553-25f7-6dbe-75d6d4991827	1311	Turjak
00050000-5553-25f7-e537-fe741469c4e1	9224	Turnišče
00050000-5553-25f7-423c-a3472f05720b	8323	Uršna sela
00050000-5553-25f7-a89f-a555f9b8262a	1252	Vače
00050000-5553-25f7-ce51-a70def6aecf3	3320	Velenje 
00050000-5553-25f7-e62b-fc5ac07dfa4d	3322	Velenje - poštni predali
00050000-5553-25f7-3bf9-08b1dee58f61	8212	Velika Loka
00050000-5553-25f7-1609-88a81561742c	2274	Velika Nedelja
00050000-5553-25f7-9748-2996f3f6d1e1	9225	Velika Polana
00050000-5553-25f7-798f-90da832a4592	1315	Velike Lašče
00050000-5553-25f7-bdd5-d177f5104da1	8213	Veliki Gaber
00050000-5553-25f7-2632-629ceac66768	9241	Veržej
00050000-5553-25f7-95bc-8a275ab65e0f	1312	Videm - Dobrepolje
00050000-5553-25f7-868f-7806d1915f3c	2284	Videm pri Ptuju
00050000-5553-25f7-bd6e-cc3f01e0c22d	8344	Vinica
00050000-5553-25f7-dc49-5d145bda9658	5271	Vipava
00050000-5553-25f7-bd75-c99091eb25c0	4212	Visoko
00050000-5553-25f7-9cca-4cf6dd025a7f	1294	Višnja Gora
00050000-5553-25f7-a896-b954b99387be	3205	Vitanje
00050000-5553-25f7-a859-8ded006d9531	2255	Vitomarci
00050000-5553-25f7-6fec-1c45d5155357	1217	Vodice
00050000-5553-25f7-7b3a-d00cfbba8309	3212	Vojnik\t
00050000-5553-25f7-5c70-6898fbbff2ed	5293	Volčja Draga
00050000-5553-25f7-b792-0f4bc1bcc949	2232	Voličina
00050000-5553-25f7-d824-6c4a48aad890	3305	Vransko
00050000-5553-25f7-1802-703ed8419219	6217	Vremski Britof
00050000-5553-25f7-b07e-36723d7ce901	1360	Vrhnika
00050000-5553-25f7-6823-bb244eb1e9a0	2365	Vuhred
00050000-5553-25f7-21ce-01030f583ac3	2367	Vuzenica
00050000-5553-25f7-4848-dfddb133f48d	8292	Zabukovje 
00050000-5553-25f7-5a85-1e3497349867	1410	Zagorje ob Savi
00050000-5553-25f7-e947-77f82bb89611	1303	Zagradec
00050000-5553-25f7-aad3-4d3ba3c92227	2283	Zavrč
00050000-5553-25f7-0519-1ebbc51344e5	8272	Zdole 
00050000-5553-25f7-a837-136d534e2d3e	4201	Zgornja Besnica
00050000-5553-25f7-589a-f4d92247fecf	2242	Zgornja Korena
00050000-5553-25f7-5f96-363a3b3c9d8b	2201	Zgornja Kungota
00050000-5553-25f7-2972-029b18a0b095	2316	Zgornja Ložnica
00050000-5553-25f7-de57-1f8168ba83d7	2314	Zgornja Polskava
00050000-5553-25f7-86e3-8f6ddbf753c3	2213	Zgornja Velka
00050000-5553-25f7-81c2-63a8ca99a1b1	4247	Zgornje Gorje
00050000-5553-25f7-e09a-ca76e8f97d46	4206	Zgornje Jezersko
00050000-5553-25f7-ab5b-3c61e8236bac	2285	Zgornji Leskovec
00050000-5553-25f7-76bc-0f09675313e1	1432	Zidani Most
00050000-5553-25f7-ce7c-133a9eb457fa	3214	Zreče
00050000-5553-25f7-4344-5ca5f2ebc225	4209	Žabnica
00050000-5553-25f7-6f99-0e83623940dd	3310	Žalec
00050000-5553-25f7-5617-5835de0471cc	4228	Železniki
00050000-5553-25f7-add4-3e959297bc09	2287	Žetale
00050000-5553-25f7-f9fd-3c4a4f8fe4da	4226	Žiri
00050000-5553-25f7-63bd-757ffbf8f5b5	4274	Žirovnica
00050000-5553-25f7-90ad-3963d13d4aa1	8360	Žužemberk
\.


--
-- TOC entry 2663 (class 0 OID 3291541)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3291364)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3291430)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3291553)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3291658)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3291705)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 3291582)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3291526)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3291516)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3291695)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3291648)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3291231)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5553-25f7-5269-0cf400292d7a	00010000-5553-25f7-533e-62b7446d57aa	2015-05-13 12:22:48	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO6ygF28UczUcLvwVDk85SKuwCG6RdAei";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2670 (class 0 OID 3291591)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 3291269)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5553-25f7-c25c-88bba1d27cd1	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5553-25f7-3569-f9e2a3625e38	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5553-25f7-bddc-f5c49946cac4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5553-25f7-bbee-ec46b9ca24f4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5553-25f7-bb8a-ceafdd549bc8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5553-25f7-da1e-e193b542ec57	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2636 (class 0 OID 3291253)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5553-25f7-5269-0cf400292d7a	00020000-5553-25f7-bbee-ec46b9ca24f4
00010000-5553-25f7-533e-62b7446d57aa	00020000-5553-25f7-bbee-ec46b9ca24f4
\.


--
-- TOC entry 2672 (class 0 OID 3291605)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3291547)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3291497)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3291329)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3291503)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3291683)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3291399)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 3291240)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5553-25f7-533e-62b7446d57aa	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROB8lJoW7RSAbbJiadg.lBf8NVWke3X9q	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5553-25f7-5269-0cf400292d7a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2684 (class 0 OID 3291737)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3291445)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3291574)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3291640)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3291473)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3291727)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3291630)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2278 (class 2606 OID 3291294)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 3291777)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3291770)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3291682)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 3291463)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 3291496)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 3291425)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 3291626)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3291443)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3291490)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3291539)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3291566)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 3291397)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2282 (class 2606 OID 3291303)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 3291361)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2284 (class 2606 OID 3291327)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 3291283)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2269 (class 2606 OID 3291268)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3291572)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 3291604)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 3291722)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 3291354)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3291385)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 3291545)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 3291375)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 3291434)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 3291557)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3291664)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 3291710)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3291589)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 3291530)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 3291521)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 3291704)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3291655)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 3291239)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 3291595)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 3291257)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2271 (class 2606 OID 3291277)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 3291613)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3291552)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 3291502)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 3291334)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 3291512)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3291694)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 3291410)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3291252)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 3291752)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 3291449)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 3291580)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3291646)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 3291485)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 3291736)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 3291639)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 1259 OID 3291470)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2290 (class 1259 OID 3291356)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2255 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2256 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2257 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2381 (class 1259 OID 3291573)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2375 (class 1259 OID 3291559)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2376 (class 1259 OID 3291558)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2327 (class 1259 OID 3291450)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 3291629)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2403 (class 1259 OID 3291627)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2404 (class 1259 OID 3291628)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2427 (class 1259 OID 3291724)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2428 (class 1259 OID 3291725)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 3291726)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2435 (class 1259 OID 3291755)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2436 (class 1259 OID 3291754)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2437 (class 1259 OID 3291753)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2309 (class 1259 OID 3291412)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2310 (class 1259 OID 3291411)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2294 (class 1259 OID 3291363)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3291362)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2390 (class 1259 OID 3291596)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2345 (class 1259 OID 3291491)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2273 (class 1259 OID 3291284)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2274 (class 1259 OID 3291285)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2395 (class 1259 OID 3291616)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2396 (class 1259 OID 3291615)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2397 (class 1259 OID 3291614)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2319 (class 1259 OID 3291435)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2320 (class 1259 OID 3291437)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2321 (class 1259 OID 3291436)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2355 (class 1259 OID 3291525)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2356 (class 1259 OID 3291523)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2357 (class 1259 OID 3291522)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2358 (class 1259 OID 3291524)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2264 (class 1259 OID 3291258)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2265 (class 1259 OID 3291259)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2384 (class 1259 OID 3291581)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2370 (class 1259 OID 3291546)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2410 (class 1259 OID 3291656)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2411 (class 1259 OID 3291657)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2298 (class 1259 OID 3291377)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2299 (class 1259 OID 3291376)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2300 (class 1259 OID 3291378)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 3291665)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2415 (class 1259 OID 3291666)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2446 (class 1259 OID 3291780)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 3291779)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2448 (class 1259 OID 3291782)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2449 (class 1259 OID 3291778)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2450 (class 1259 OID 3291781)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2407 (class 1259 OID 3291647)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2361 (class 1259 OID 3291534)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2362 (class 1259 OID 3291533)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2363 (class 1259 OID 3291531)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2364 (class 1259 OID 3291532)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2251 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2442 (class 1259 OID 3291772)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 3291771)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2326 (class 1259 OID 3291444)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2279 (class 1259 OID 3291305)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2280 (class 1259 OID 3291304)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2286 (class 1259 OID 3291335)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 3291336)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2350 (class 1259 OID 3291515)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2351 (class 1259 OID 3291514)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 3291513)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2333 (class 1259 OID 3291472)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2334 (class 1259 OID 3291468)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2335 (class 1259 OID 3291465)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2336 (class 1259 OID 3291466)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2337 (class 1259 OID 3291464)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2338 (class 1259 OID 3291469)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2339 (class 1259 OID 3291467)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2293 (class 1259 OID 3291355)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2315 (class 1259 OID 3291426)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2316 (class 1259 OID 3291428)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2317 (class 1259 OID 3291427)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2318 (class 1259 OID 3291429)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2369 (class 1259 OID 3291540)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2432 (class 1259 OID 3291723)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2285 (class 1259 OID 3291328)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2308 (class 1259 OID 3291398)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2389 (class 1259 OID 3291590)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2254 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 3291386)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2426 (class 1259 OID 3291711)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2272 (class 1259 OID 3291278)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2340 (class 1259 OID 3291471)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2475 (class 2606 OID 3291913)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2478 (class 2606 OID 3291898)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2477 (class 2606 OID 3291903)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2473 (class 2606 OID 3291923)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2479 (class 2606 OID 3291893)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2474 (class 2606 OID 3291918)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2476 (class 2606 OID 3291908)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2460 (class 2606 OID 3291828)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2496 (class 2606 OID 3292008)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2494 (class 2606 OID 3292003)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2495 (class 2606 OID 3291998)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2472 (class 2606 OID 3291888)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2502 (class 2606 OID 3292048)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2504 (class 2606 OID 3292038)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2503 (class 2606 OID 3292043)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2492 (class 2606 OID 3291988)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 3292083)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 3292088)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 3292093)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2514 (class 2606 OID 3292108)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2515 (class 2606 OID 3292103)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2516 (class 2606 OID 3292098)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2466 (class 2606 OID 3291863)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2467 (class 2606 OID 3291858)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 3291838)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 3291833)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3291813)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2498 (class 2606 OID 3292018)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2480 (class 2606 OID 3291928)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2454 (class 2606 OID 3291793)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2453 (class 2606 OID 3291798)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2499 (class 2606 OID 3292033)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2500 (class 2606 OID 3292028)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2501 (class 2606 OID 3292023)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2470 (class 2606 OID 3291868)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2468 (class 2606 OID 3291878)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2469 (class 2606 OID 3291873)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2484 (class 2606 OID 3291963)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2486 (class 2606 OID 3291953)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2487 (class 2606 OID 3291948)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2485 (class 2606 OID 3291958)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2452 (class 2606 OID 3291783)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2451 (class 2606 OID 3291788)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2497 (class 2606 OID 3292013)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2493 (class 2606 OID 3291993)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2507 (class 2606 OID 3292058)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2506 (class 2606 OID 3292063)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3291848)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2465 (class 2606 OID 3291843)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2463 (class 2606 OID 3291853)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2509 (class 2606 OID 3292068)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 3292073)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2521 (class 2606 OID 3292133)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 3292128)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2519 (class 2606 OID 3292143)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2523 (class 2606 OID 3292123)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2520 (class 2606 OID 3292138)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2505 (class 2606 OID 3292053)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2488 (class 2606 OID 3291983)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2489 (class 2606 OID 3291978)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 3291968)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2490 (class 2606 OID 3291973)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2517 (class 2606 OID 3292118)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2518 (class 2606 OID 3292113)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2471 (class 2606 OID 3291883)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2510 (class 2606 OID 3292078)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 3291808)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2456 (class 2606 OID 3291803)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2459 (class 2606 OID 3291818)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3291823)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2481 (class 2606 OID 3291943)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2482 (class 2606 OID 3291938)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2483 (class 2606 OID 3291933)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-13 12:22:49 CEST

--
-- PostgreSQL database dump complete
--

