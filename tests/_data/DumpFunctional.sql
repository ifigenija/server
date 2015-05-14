--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-14 10:28:58 CEST

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
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 3369740)
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
-- TOC entry 225 (class 1259 OID 3370229)
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
-- TOC entry 224 (class 1259 OID 3370212)
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
-- TOC entry 217 (class 1259 OID 3370123)
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
-- TOC entry 193 (class 1259 OID 3369905)
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
-- TOC entry 196 (class 1259 OID 3369948)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3369867)
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
-- TOC entry 212 (class 1259 OID 3370073)
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
-- TOC entry 191 (class 1259 OID 3369892)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3369942)
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
-- TOC entry 201 (class 1259 OID 3369991)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3370016)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3369841)
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
-- TOC entry 180 (class 1259 OID 3369749)
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
-- TOC entry 181 (class 1259 OID 3369760)
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
-- TOC entry 184 (class 1259 OID 3369811)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3369714)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3369733)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3370023)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3370053)
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
-- TOC entry 221 (class 1259 OID 3370168)
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
-- TOC entry 183 (class 1259 OID 3369791)
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
-- TOC entry 186 (class 1259 OID 3369833)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3369997)
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
-- TOC entry 185 (class 1259 OID 3369818)
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
-- TOC entry 190 (class 1259 OID 3369884)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3370009)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3370114)
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
-- TOC entry 220 (class 1259 OID 3370161)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3370038)
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
-- TOC entry 200 (class 1259 OID 3369982)
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
-- TOC entry 199 (class 1259 OID 3369972)
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
-- TOC entry 219 (class 1259 OID 3370151)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3370104)
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
-- TOC entry 173 (class 1259 OID 3369685)
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
-- TOC entry 172 (class 1259 OID 3369683)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2696 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 3370047)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3369723)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3369707)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3370061)
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
-- TOC entry 203 (class 1259 OID 3370003)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3369953)
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
-- TOC entry 182 (class 1259 OID 3369783)
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
-- TOC entry 198 (class 1259 OID 3369959)
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
-- TOC entry 218 (class 1259 OID 3370139)
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
-- TOC entry 188 (class 1259 OID 3369853)
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
-- TOC entry 174 (class 1259 OID 3369694)
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
-- TOC entry 223 (class 1259 OID 3370193)
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
-- TOC entry 192 (class 1259 OID 3369899)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3370030)
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
-- TOC entry 214 (class 1259 OID 3370096)
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
-- TOC entry 194 (class 1259 OID 3369928)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status integer,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 3370183)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3370086)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3369688)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2642 (class 0 OID 3369740)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2688 (class 0 OID 3370229)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2687 (class 0 OID 3370212)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3370123)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3369905)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3369948)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3369867)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5554-5cc9-81fd-a28ed674443b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5554-5cc9-3026-149e9837def2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5554-5cc9-5742-1021ded5dd62	AL	ALB	008	Albania 	Albanija	\N
00040000-5554-5cc9-5ba3-b3eef9dab016	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5554-5cc9-a41f-0a675c986e04	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5554-5cc9-8366-26622f08d4f7	AD	AND	020	Andorra 	Andora	\N
00040000-5554-5cc9-feb2-157c626ee6e5	AO	AGO	024	Angola 	Angola	\N
00040000-5554-5cc9-e774-91cf162c727f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5554-5cc9-096b-3c69f60b7539	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5554-5cc9-048d-e9926c0550b8	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5554-5cc9-3a66-36f1e116dd91	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5554-5cc9-3003-d059c88b4324	AM	ARM	051	Armenia 	Armenija	\N
00040000-5554-5cc9-a817-4f7c6b9151ae	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5554-5cc9-5aa6-7866d68405de	AU	AUS	036	Australia 	Avstralija	\N
00040000-5554-5cc9-aea0-62d1812a91d2	AT	AUT	040	Austria 	Avstrija	\N
00040000-5554-5cc9-2d50-7d6079eccb35	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5554-5cc9-3dca-5bd1cb431365	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5554-5cc9-f97a-81edd982e811	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5554-5cc9-e7c3-dc6951751f87	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5554-5cc9-83ff-2f93b6bd11dd	BB	BRB	052	Barbados 	Barbados	\N
00040000-5554-5cc9-616b-140ab3450612	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5554-5cc9-86e6-53ccd9571580	BE	BEL	056	Belgium 	Belgija	\N
00040000-5554-5cc9-c22c-86a34771336c	BZ	BLZ	084	Belize 	Belize	\N
00040000-5554-5cc9-5977-5a2ae3799212	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5554-5cc9-747d-6941e3ab468d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5554-5cc9-8afb-3ec62fc7861b	BT	BTN	064	Bhutan 	Butan	\N
00040000-5554-5cc9-d544-685d8ffe4df4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5554-5cc9-4b13-7fa19fab7b1b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5554-5cc9-88f0-83609dac1263	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5554-5cc9-6206-1f4eccf2a9f8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5554-5cc9-dfa3-1bf8f4974c84	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5554-5cc9-3d17-5192b3a9fc1c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5554-5cc9-700f-ceff2a00c0f3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5554-5cc9-3de3-38ab8f196ace	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5554-5cc9-f83d-35c334b6f714	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5554-5cc9-4090-764e90532739	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5554-5cc9-8c28-bedfae1ff624	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5554-5cc9-2bdc-d5350cf6d6c5	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5554-5cc9-0d24-cb6ebf920dc0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5554-5cc9-8d95-119e94173c55	CA	CAN	124	Canada 	Kanada	\N
00040000-5554-5cc9-7783-3231b310b5e0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5554-5cc9-b7a1-ba6f66b22c04	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5554-5cc9-7087-31183e7386da	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5554-5cc9-522d-b366346a4931	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5554-5cc9-9114-911bd17da8b1	CL	CHL	152	Chile 	Čile	\N
00040000-5554-5cc9-3538-c526f130dd31	CN	CHN	156	China 	Kitajska	\N
00040000-5554-5cc9-42b4-d62a01039f71	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5554-5cc9-8fc3-17dd24e4b3d9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5554-5cc9-4370-6939e8cd8419	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5554-5cc9-6a99-122bb98c438f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5554-5cc9-6322-8ba316bf6891	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5554-5cc9-f143-65ca3553f5da	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5554-5cc9-5b8d-6c4649227e76	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5554-5cc9-4ee4-e935961df144	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5554-5cc9-a71f-3960202a4f9f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5554-5cc9-06b1-83a37e720e9a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5554-5cc9-b9b7-86769392795c	CU	CUB	192	Cuba 	Kuba	\N
00040000-5554-5cc9-ca72-a6c54df453d0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5554-5cc9-110d-c13f0a071053	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5554-5cc9-4591-4eb678ebe562	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5554-5cc9-9ae6-2b97bdda00e9	DK	DNK	208	Denmark 	Danska	\N
00040000-5554-5cc9-2911-5641716bc3a1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5554-5cc9-2a9c-c8886efc94dd	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5554-5cc9-0712-7c23b99e5af6	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5554-5cc9-7279-7f7628b7de5a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5554-5cc9-7dfb-35063ec73c2e	EG	EGY	818	Egypt 	Egipt	\N
00040000-5554-5cc9-0677-734fb6007751	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5554-5cc9-aa1f-c6b30c3155e2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5554-5cc9-992a-62f0a3d1d633	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5554-5cc9-bbb9-bc6899266a29	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5554-5cc9-fa0d-4f98941df7db	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5554-5cc9-3284-521f83a6f227	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5554-5cc9-2392-e611e2c4662c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5554-5cc9-be3e-025dfa62ad4c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5554-5cc9-3c36-9f4fa0087bb4	FI	FIN	246	Finland 	Finska	\N
00040000-5554-5cc9-b0f0-4d9c793e5e02	FR	FRA	250	France 	Francija	\N
00040000-5554-5cc9-3796-7ebd83702a60	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5554-5cc9-a2b8-eab08eb386f3	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5554-5cc9-25d2-22c25259d41b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5554-5cc9-5663-758ebb2a8efb	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5554-5cc9-f4df-44278e8689d5	GA	GAB	266	Gabon 	Gabon	\N
00040000-5554-5cc9-8b92-2cc30f11ea67	GM	GMB	270	Gambia 	Gambija	\N
00040000-5554-5cc9-8232-07097d1088da	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5554-5cc9-9d6c-49f28e15cffa	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5554-5cc9-ec47-781089b01195	GH	GHA	288	Ghana 	Gana	\N
00040000-5554-5cc9-5713-0c75f5f65ee1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5554-5cc9-6a59-e45cfacc8de8	GR	GRC	300	Greece 	Grčija	\N
00040000-5554-5cc9-0c54-9d889fd37e57	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5554-5cc9-29b1-a4b8991c767e	GD	GRD	308	Grenada 	Grenada	\N
00040000-5554-5cc9-fee7-89b6b0adc4cb	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5554-5cc9-83d8-fba9d482ffa3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5554-5cc9-9e70-187b40843391	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5554-5cc9-d42b-0050719dea8a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5554-5cc9-3079-9c48c9123289	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5554-5cc9-60a7-65fc023b41d1	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5554-5cc9-173b-f9e227c0e5b8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5554-5cc9-5b93-8e24055079bb	HT	HTI	332	Haiti 	Haiti	\N
00040000-5554-5cc9-cd9a-1a62ea5eb267	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5554-5cc9-f3e1-3511f8b7db69	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5554-5cc9-5cb6-e164be0ebbe7	HN	HND	340	Honduras 	Honduras	\N
00040000-5554-5cc9-92a3-22bd50fc97f4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5554-5cc9-99b4-89c3e6776974	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5554-5cc9-9edd-4e5454785910	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5554-5cc9-20ee-96cc367d594d	IN	IND	356	India 	Indija	\N
00040000-5554-5cc9-aeb5-b786020ab054	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5554-5cc9-f872-76bf6872a5be	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5554-5cc9-b9b2-79849c31e5b2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5554-5cc9-c389-e81cae686f35	IE	IRL	372	Ireland 	Irska	\N
00040000-5554-5cc9-e322-1fd0eec835f6	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5554-5cc9-0ffa-dedda3bee46f	IL	ISR	376	Israel 	Izrael	\N
00040000-5554-5cc9-4362-10d8685a600d	IT	ITA	380	Italy 	Italija	\N
00040000-5554-5cc9-1e53-6269665c8f56	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5554-5cc9-09dd-9383c3178356	JP	JPN	392	Japan 	Japonska	\N
00040000-5554-5cc9-2951-31a5e561eef8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5554-5cc9-6f2e-f6c764f7483c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5554-5cc9-0a7c-a77e6b6fbded	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5554-5cc9-b95c-e03bda6137dc	KE	KEN	404	Kenya 	Kenija	\N
00040000-5554-5cc9-6352-64831a7f4e1b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5554-5cc9-9618-7e6893e38d37	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5554-5cc9-6abe-2582f71c46e6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5554-5cc9-cf33-a55282331f1f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5554-5cc9-ba5d-e88d2f282af4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5554-5cc9-95ab-e1297c13bee0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5554-5cc9-3996-fd02afa79afe	LV	LVA	428	Latvia 	Latvija	\N
00040000-5554-5cc9-1896-f8fde7536d12	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5554-5cc9-92af-b4c196e9286f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5554-5cc9-8d84-70c865c29ef2	LR	LBR	430	Liberia 	Liberija	\N
00040000-5554-5cc9-2f5a-c1a30e3abe8c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5554-5cc9-6d4c-45fd228cc949	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5554-5cc9-a49c-572f1b0c1a27	LT	LTU	440	Lithuania 	Litva	\N
00040000-5554-5cc9-1b67-abb51e44aa3f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5554-5cc9-c012-8ad216b25252	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5554-5cc9-9e1c-fb005cdfef83	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5554-5cc9-2030-e38c1ff213d1	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5554-5cc9-abcd-e53ef3420da7	MW	MWI	454	Malawi 	Malavi	\N
00040000-5554-5cc9-f14e-fd455c3c25b6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5554-5cc9-26bf-c6fdb74df96c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5554-5cc9-331c-f286d920d3f0	ML	MLI	466	Mali 	Mali	\N
00040000-5554-5cc9-2946-3d0bf3e0c0fe	MT	MLT	470	Malta 	Malta	\N
00040000-5554-5cc9-59a0-ec63d1532432	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5554-5cc9-c743-4ba22e54d454	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5554-5cc9-8254-0924e5249838	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5554-5cc9-9924-36511efcaffb	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5554-5cc9-a741-228c3abdcd92	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5554-5cc9-dcbe-f1ba9d1c28d0	MX	MEX	484	Mexico 	Mehika	\N
00040000-5554-5cc9-1812-538113a6e282	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5554-5cc9-ce82-cbc64f988ffc	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5554-5cc9-b420-859fead239c8	MC	MCO	492	Monaco 	Monako	\N
00040000-5554-5cc9-8e9a-49c232b20c1b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5554-5cc9-85dc-0eb3fecdc29e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5554-5cc9-e3d6-e06000737b21	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5554-5cc9-f6b7-b572ed7c73a8	MA	MAR	504	Morocco 	Maroko	\N
00040000-5554-5cc9-5b27-f58142ab5e98	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5554-5cc9-3b71-b92639be07f3	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5554-5cc9-3861-f1502689ee71	NA	NAM	516	Namibia 	Namibija	\N
00040000-5554-5cc9-5fef-3e07dbfacf5e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5554-5cc9-487d-4e35950f7ceb	NP	NPL	524	Nepal 	Nepal	\N
00040000-5554-5cc9-9764-2db1fd35d340	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5554-5cc9-c888-a3ca342e5509	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5554-5cc9-1009-d604f4867ae1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5554-5cc9-5fb6-f102d3229eee	NE	NER	562	Niger 	Niger 	\N
00040000-5554-5cc9-bdba-6a76221aa648	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5554-5cc9-1d91-a35b555515c5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5554-5cc9-d0ab-de9a49e3a058	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5554-5cc9-b840-c10322e7c4a1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5554-5cc9-8645-ee6bc55f3599	NO	NOR	578	Norway 	Norveška	\N
00040000-5554-5cc9-8bb5-a9923c2ea90d	OM	OMN	512	Oman 	Oman	\N
00040000-5554-5cc9-9429-3848b4b45450	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5554-5cc9-5cd9-5cc909ef1d72	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5554-5cc9-3fc9-5adad57c0b26	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5554-5cc9-59d9-b20167229b97	PA	PAN	591	Panama 	Panama	\N
00040000-5554-5cc9-08ba-eb91014d149c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5554-5cc9-6bad-6e8a9a8b6df8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5554-5cc9-7dab-e947163074cc	PE	PER	604	Peru 	Peru	\N
00040000-5554-5cc9-330c-1eb6bb129c96	PH	PHL	608	Philippines 	Filipini	\N
00040000-5554-5cc9-9bcb-af9d5e15c7eb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5554-5cc9-9657-ba97168cdf91	PL	POL	616	Poland 	Poljska	\N
00040000-5554-5cc9-66c4-acf19fbe1b21	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5554-5cc9-0468-16ad10e10356	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5554-5cc9-241a-318f561b156f	QA	QAT	634	Qatar 	Katar	\N
00040000-5554-5cc9-0473-d83a97be7c8b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5554-5cc9-3087-617562167792	RO	ROU	642	Romania 	Romunija	\N
00040000-5554-5cc9-b97f-52d88aa9cc78	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5554-5cc9-7881-18b9c7c19d42	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5554-5cc9-d53c-48faf957ad64	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5554-5cc9-9b56-639e7d00f2a7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5554-5cc9-7cc3-14b0cfe299c5	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5554-5cc9-ef2b-757af278882c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5554-5cc9-4f65-2da385282618	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5554-5cc9-6b7f-6a3de7248b61	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5554-5cc9-2c9a-526d9856804d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5554-5cc9-8e10-6918a1145ac5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5554-5cc9-773c-172fa71f2e6a	SM	SMR	674	San Marino 	San Marino	\N
00040000-5554-5cc9-067f-9fb22f7fcc15	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5554-5cc9-16ae-954b45ea335a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5554-5cc9-3efb-529c903c7c6a	SN	SEN	686	Senegal 	Senegal	\N
00040000-5554-5cc9-2d92-dd8935b4e995	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5554-5cc9-6c03-7118e1e4ff30	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5554-5cc9-1bf1-e9a441bc5c5a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5554-5cc9-db7e-df1a4b1a986a	SG	SGP	702	Singapore 	Singapur	\N
00040000-5554-5cc9-20e0-5bbfa7a8cf2f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5554-5cc9-17b7-8cdccbe68dc1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5554-5cc9-22f4-757172c8db8f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5554-5cc9-7046-808dd4139b47	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5554-5cc9-d57f-2fd17d705d4a	SO	SOM	706	Somalia 	Somalija	\N
00040000-5554-5cc9-14ff-b6ea5aa9b538	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5554-5cc9-5d4d-f2c5367959ed	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5554-5cc9-24e2-c374f9462a37	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5554-5cc9-3990-a3ca0fcbf5e4	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5554-5cc9-9f2d-1a4e85893b1e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5554-5cc9-8e19-eef7d34e3af3	SD	SDN	729	Sudan 	Sudan	\N
00040000-5554-5cc9-c67c-313be4125d81	SR	SUR	740	Suriname 	Surinam	\N
00040000-5554-5cc9-6398-9b5d4c689ed2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5554-5cc9-a6f0-9f9d1a2beea5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5554-5cc9-29d4-fa11ffade2e3	SE	SWE	752	Sweden 	Švedska	\N
00040000-5554-5cc9-f010-db907846986f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5554-5cc9-69da-065d6c3c1fde	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5554-5cc9-2d5b-07c2455e3c53	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5554-5cc9-1a03-a3afbe07d23a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5554-5cc9-107a-f3b2e5b30765	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5554-5cc9-8dde-882da5775c65	TH	THA	764	Thailand 	Tajska	\N
00040000-5554-5cc9-8df0-e020ac125649	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5554-5cc9-a195-b2c33385f595	TG	TGO	768	Togo 	Togo	\N
00040000-5554-5cc9-8ad6-34a6ad155c5e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5554-5cc9-7bce-d78303260a9d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5554-5cc9-e7ac-6528fe76eb12	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5554-5cc9-24ac-e81bd9c5b96e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5554-5cc9-1cb5-6a80c9fc8588	TR	TUR	792	Turkey 	Turčija	\N
00040000-5554-5cc9-65df-ff7277bcdb5e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5554-5cc9-434b-f9d4cf66663c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5554-5cc9-b45d-52601036050b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5554-5cc9-09ac-5f536a5beb24	UG	UGA	800	Uganda 	Uganda	\N
00040000-5554-5cc9-12aa-d3a18aabc6de	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5554-5cc9-bf4f-436da4aa60f8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5554-5cc9-c04b-e2da9f165441	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5554-5cc9-7788-0f9013c95ff3	US	USA	840	United States 	Združene države Amerike	\N
00040000-5554-5cc9-e5c0-73399672e2fa	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5554-5cc9-88e8-7cabc7b3918e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5554-5cc9-07dc-fff04ac6df49	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5554-5cc9-c992-906cf3c56157	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5554-5cc9-9efb-2ab539acc43e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5554-5cc9-fc92-1b700048ad7c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5554-5cc9-e27b-fd60893cd4f5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5554-5cc9-bacc-e6a697ecdcf3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5554-5cc9-91ef-ff3ab4c292f4	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5554-5cc9-9bd3-268ca3f85c74	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5554-5cc9-a08e-7287c3e327ba	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5554-5cc9-b2c2-286b38d6368d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5554-5cc9-2be4-d84d2adcc5d8	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2675 (class 0 OID 3370073)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3369892)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3369942)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3369991)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3370016)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3369841)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5554-5cca-0d70-7e96c6b9d631	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5554-5cca-a9c7-716a43f4615c	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5554-5cca-56a6-4fe61763fd8e	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5554-5cca-292f-ebb5c53b4215	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5554-5cca-0021-d87ee954f4c7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5554-5cca-35a7-edc36722f41c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5554-5cca-f8ec-70a71a1e4fed	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5554-5cca-0165-79795d4af771	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5554-5cca-9cbc-e66656693b41	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5554-5cca-1e3f-b2991d59da76	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2643 (class 0 OID 3369749)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5554-5cca-db01-5282d93e0db2	00000000-5554-5cca-0021-d87ee954f4c7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5554-5cca-e64a-b8a4fb792022	00000000-5554-5cca-0021-d87ee954f4c7	00010000-5554-5cca-1bfe-46975d00dfcc	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5554-5cca-9496-f9e964f15c49	00000000-5554-5cca-35a7-edc36722f41c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2644 (class 0 OID 3369760)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3369811)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3369714)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5554-5cca-fd39-e7a75fe43f20	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5554-5cca-e723-b83abcbe2d75	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5554-5cca-e58a-56d5c7f03c2b	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5554-5cca-2c4b-c98f3b849e87	Abonma-read	Abonma - branje	f
00030000-5554-5cca-bc60-34baaed9d21c	Abonma-write	Abonma - spreminjanje	f
00030000-5554-5cca-54a6-ede28f500738	Alternacija-read	Alternacija - branje	f
00030000-5554-5cca-f7b0-54e28e6b9aa6	Alternacija-write	Alternacija - spreminjanje	f
00030000-5554-5cca-54fb-dfdc662a6ea0	Arhivalija-read	Arhivalija - branje	f
00030000-5554-5cca-f25a-7a3909b97d74	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5554-5cca-f725-9fd46be26a72	Besedilo-read	Besedilo - branje	f
00030000-5554-5cca-72e7-3d2f1911645c	Besedilo-write	Besedilo - spreminjanje	f
00030000-5554-5cca-279e-dc5e4592fe16	DogodekIzven-read	DogodekIzven - branje	f
00030000-5554-5cca-1e36-8bc53cc3f1e3	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5554-5cca-84f2-e6ca67c7fe29	Dogodek-read	Dogodek - branje	f
00030000-5554-5cca-b5db-b203243424ee	Dogodek-write	Dogodek - spreminjanje	f
00030000-5554-5cca-d6cb-ca125f9f9a2d	Drzava-read	Drzava - branje	f
00030000-5554-5cca-99a7-31224175fd82	Drzava-write	Drzava - spreminjanje	f
00030000-5554-5cca-1739-7dd2a017d793	Funkcija-read	Funkcija - branje	f
00030000-5554-5cca-17f7-24e43f399dbe	Funkcija-write	Funkcija - spreminjanje	f
00030000-5554-5cca-b5c3-01b5c457b62b	Gostovanje-read	Gostovanje - branje	f
00030000-5554-5cca-4e34-44358448f227	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5554-5cca-d828-132318e37295	Gostujoca-read	Gostujoca - branje	f
00030000-5554-5cca-53a7-0b7764b840b0	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5554-5cca-4a45-a1eac1f68b29	Kupec-read	Kupec - branje	f
00030000-5554-5cca-49d4-9a40b086827a	Kupec-write	Kupec - spreminjanje	f
00030000-5554-5cca-7e21-788eb80794bc	NacinPlacina-read	NacinPlacina - branje	f
00030000-5554-5cca-9da9-3e10a7ef0df6	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5554-5cca-2aec-2df7591312f9	Option-read	Option - branje	f
00030000-5554-5cca-fe05-edd12251b21f	Option-write	Option - spreminjanje	f
00030000-5554-5cca-f741-be0c94ffe0f9	OptionValue-read	OptionValue - branje	f
00030000-5554-5cca-c519-dbb0c0977b17	OptionValue-write	OptionValue - spreminjanje	f
00030000-5554-5cca-891f-871fd9a80ade	Oseba-read	Oseba - branje	f
00030000-5554-5cca-e26c-cd2ff94d6169	Oseba-write	Oseba - spreminjanje	f
00030000-5554-5cca-1ec0-2fd0a76a96f9	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5554-5cca-1096-547d2edf3924	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5554-5cca-6639-284a77ab4857	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5554-5cca-26ae-aab695521f0e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5554-5cca-8545-16b0f42f7f9e	Pogodba-read	Pogodba - branje	f
00030000-5554-5cca-9535-bb54a4ecf9ee	Pogodba-write	Pogodba - spreminjanje	f
00030000-5554-5cca-9310-4a67ab262d16	Popa-read	Popa - branje	f
00030000-5554-5cca-9392-028248f87a96	Popa-write	Popa - spreminjanje	f
00030000-5554-5cca-1347-8faca0665815	Posta-read	Posta - branje	f
00030000-5554-5cca-5987-2086d2a29073	Posta-write	Posta - spreminjanje	f
00030000-5554-5cca-5295-0e639fe49942	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5554-5cca-349b-bb38c5abfb16	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5554-5cca-b09e-00929a9613f3	PostniNaslov-read	PostniNaslov - branje	f
00030000-5554-5cca-2ad4-53bae5c5f353	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5554-5cca-2a02-2cbc58cc2ad0	Predstava-read	Predstava - branje	f
00030000-5554-5cca-a177-000bc30ea417	Predstava-write	Predstava - spreminjanje	f
00030000-5554-5cca-3dfe-8cc42824fcd9	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5554-5cca-d142-b33a52eac5cd	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5554-5cca-1243-a39faf284014	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5554-5cca-9f07-36fb476252f6	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5554-5cca-f635-eebe15dc7be1	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5554-5cca-a147-3d9f0d697170	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5554-5cca-82ef-5c59d69d07ad	Prostor-read	Prostor - branje	f
00030000-5554-5cca-2a1e-ae0a32dc445d	Prostor-write	Prostor - spreminjanje	f
00030000-5554-5cca-8801-f85f37f34c0f	Racun-read	Racun - branje	f
00030000-5554-5cca-5f2c-723a18318d84	Racun-write	Racun - spreminjanje	f
00030000-5554-5cca-8449-1ad237d9d89e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5554-5cca-c2d4-a4ffceebdcfa	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5554-5cca-cbc1-f8edf55a4ebf	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5554-5cca-c9b8-45b6908e274b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5554-5cca-d53e-170046389e71	Rekvizit-read	Rekvizit - branje	f
00030000-5554-5cca-10a6-9ba74ad8d40b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5554-5cca-bc32-317848aa3cee	Rezervacija-read	Rezervacija - branje	f
00030000-5554-5cca-b04d-8933bdd7e5f6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5554-5cca-54e6-ed9f55287ecb	SedezniRed-read	SedezniRed - branje	f
00030000-5554-5cca-55cc-1f61d873e8fe	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5554-5cca-dee4-718cac1c70c0	Sedez-read	Sedez - branje	f
00030000-5554-5cca-2e0b-110caca1405d	Sedez-write	Sedez - spreminjanje	f
00030000-5554-5cca-6892-45e24a3829b2	Sezona-read	Sezona - branje	f
00030000-5554-5cca-bd1b-59924b6f2f85	Sezona-write	Sezona - spreminjanje	f
00030000-5554-5cca-112f-444fea335174	Telefonska-read	Telefonska - branje	f
00030000-5554-5cca-3bba-21cb47fc040d	Telefonska-write	Telefonska - spreminjanje	f
00030000-5554-5cca-3630-f3e86498de18	TerminStoritve-read	TerminStoritve - branje	f
00030000-5554-5cca-417f-8e4d889f2c4b	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5554-5cca-74b3-1b1e21643944	TipFunkcije-read	TipFunkcije - branje	f
00030000-5554-5cca-14e7-145b2f02d5ec	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5554-5cca-6f8a-8161c3603644	Trr-read	Trr - branje	f
00030000-5554-5cca-2aa9-ba3c0b0dedce	Trr-write	Trr - spreminjanje	f
00030000-5554-5cca-a3a0-d7643a3456f7	Uprizoritev-read	Uprizoritev - branje	f
00030000-5554-5cca-b700-41485dd98243	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5554-5cca-534a-117cea67b6b0	Vaja-read	Vaja - branje	f
00030000-5554-5cca-97be-8cbc9affb9ca	Vaja-write	Vaja - spreminjanje	f
00030000-5554-5cca-0111-ebdcc9930f95	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5554-5cca-a1d7-7d106f5b13bc	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5554-5cca-b098-70953467a09f	Zaposlitev-read	Zaposlitev - branje	f
00030000-5554-5cca-917b-e622f9808558	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5554-5cca-5b76-a995595534f4	Zasedenost-read	Zasedenost - branje	f
00030000-5554-5cca-2265-d7be21202812	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5554-5cca-a09b-a279d80da097	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5554-5cca-6856-9315d49faf11	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5554-5cca-6307-d72f9de285ef	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5554-5cca-7c17-3429e7c96f32	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2641 (class 0 OID 3369733)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5554-5cca-9cfd-83e33bad36b8	00030000-5554-5cca-d6cb-ca125f9f9a2d
00020000-5554-5cca-a661-0b3166e28739	00030000-5554-5cca-99a7-31224175fd82
00020000-5554-5cca-a661-0b3166e28739	00030000-5554-5cca-d6cb-ca125f9f9a2d
\.


--
-- TOC entry 2669 (class 0 OID 3370023)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3370053)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2684 (class 0 OID 3370168)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3369791)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3369833)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5554-5cc9-e93c-61266034bf77	8341	Adlešiči
00050000-5554-5cc9-f432-58dd1bf9fe8a	5270	Ajdovščina
00050000-5554-5cc9-e39e-cd9d649ccb19	6280	Ankaran/Ancarano
00050000-5554-5cc9-14fa-e4183da231c7	9253	Apače
00050000-5554-5cc9-27ba-1fcdbed4d2fe	8253	Artiče
00050000-5554-5cc9-4b00-c91b1e81a4e2	4275	Begunje na Gorenjskem
00050000-5554-5cc9-8f37-8edb5a2a17e5	1382	Begunje pri Cerknici
00050000-5554-5cc9-95d5-1b7a3bd6ad38	9231	Beltinci
00050000-5554-5cc9-4e4c-3f4016cd6e67	2234	Benedikt
00050000-5554-5cc9-aef6-894a7f61fdaa	2345	Bistrica ob Dravi
00050000-5554-5cc9-2175-f4f51910c63f	3256	Bistrica ob Sotli
00050000-5554-5cc9-2250-c61a660808d0	8259	Bizeljsko
00050000-5554-5cc9-d46b-e757bf0c9d93	1223	Blagovica
00050000-5554-5cc9-e7a5-b9c2849c350d	8283	Blanca
00050000-5554-5cc9-6537-a041d270fb8f	4260	Bled
00050000-5554-5cc9-9c4d-c9bd50216e73	4273	Blejska Dobrava
00050000-5554-5cc9-f7e9-9cf8db3b96e6	9265	Bodonci
00050000-5554-5cc9-6316-7755f4f76f29	9222	Bogojina
00050000-5554-5cc9-5c2f-5ccb72e7c222	4263	Bohinjska Bela
00050000-5554-5cc9-82b6-5b008a4587db	4264	Bohinjska Bistrica
00050000-5554-5cc9-2a1f-7b67a146eb08	4265	Bohinjsko jezero
00050000-5554-5cc9-d142-201b1105b371	1353	Borovnica
00050000-5554-5cc9-0542-590baafb241f	8294	Boštanj
00050000-5554-5cc9-21f1-77e7bb48b6a2	5230	Bovec
00050000-5554-5cc9-21b8-334b8be0cc02	5295	Branik
00050000-5554-5cc9-92e6-b298249a39fd	3314	Braslovče
00050000-5554-5cc9-bbc1-0d628e3db7fd	5223	Breginj
00050000-5554-5cc9-7959-a6cf7ecf8c02	8280	Brestanica
00050000-5554-5cc9-510e-dcaf0c6eb87f	2354	Bresternica
00050000-5554-5cc9-ee35-a094322f7ae5	4243	Brezje
00050000-5554-5cc9-3dcc-e438b05b72e8	1351	Brezovica pri Ljubljani
00050000-5554-5cc9-f9c4-22e571d12f64	8250	Brežice
00050000-5554-5cc9-d392-2bf5080ca5e7	4210	Brnik - Aerodrom
00050000-5554-5cc9-5b04-e0d2039655ee	8321	Brusnice
00050000-5554-5cc9-5f4a-69ba7b260595	3255	Buče
00050000-5554-5cc9-7ad4-3971ed7f3591	8276	Bučka 
00050000-5554-5cc9-c9e9-a4c369914737	9261	Cankova
00050000-5554-5cc9-def4-db3c058b9b59	3000	Celje 
00050000-5554-5cc9-e475-25d45cfb833f	3001	Celje - poštni predali
00050000-5554-5cc9-14d0-60339c90b14d	4207	Cerklje na Gorenjskem
00050000-5554-5cc9-0ed7-5c0d38ef2ec8	8263	Cerklje ob Krki
00050000-5554-5cc9-7859-f66f9f3b11e2	1380	Cerknica
00050000-5554-5cc9-be41-7720bdafbe58	5282	Cerkno
00050000-5554-5cc9-1a6c-1d7be82d78e6	2236	Cerkvenjak
00050000-5554-5cc9-a850-438323ea0e53	2215	Ceršak
00050000-5554-5cc9-c819-ac8248681620	2326	Cirkovce
00050000-5554-5cc9-dd39-0272dd5c98c1	2282	Cirkulane
00050000-5554-5cc9-c22b-378adf3b1ea1	5273	Col
00050000-5554-5cc9-0228-77959b72fae4	8251	Čatež ob Savi
00050000-5554-5cc9-174b-8925b42274ea	1413	Čemšenik
00050000-5554-5cc9-5ef3-96a4d78af715	5253	Čepovan
00050000-5554-5cc9-1b30-009d3335bae5	9232	Črenšovci
00050000-5554-5cc9-96df-57aa08d3ff8f	2393	Črna na Koroškem
00050000-5554-5cc9-1b16-6c77ae330d18	6275	Črni Kal
00050000-5554-5cc9-c542-8769b8b020e2	5274	Črni Vrh nad Idrijo
00050000-5554-5cc9-d01b-64dcf266951f	5262	Črniče
00050000-5554-5cc9-91b1-6d4a2e94ce99	8340	Črnomelj
00050000-5554-5cc9-a966-b33fb781cfde	6271	Dekani
00050000-5554-5cc9-315f-2d598d87b60e	5210	Deskle
00050000-5554-5cc9-6b12-9b94f9654bde	2253	Destrnik
00050000-5554-5cc9-78bb-7a5681b84177	6215	Divača
00050000-5554-5cc9-82d6-4b4a1df9a4c6	1233	Dob
00050000-5554-5cc9-b8b5-90f5b8a173c6	3224	Dobje pri Planini
00050000-5554-5cc9-6832-75cf024213a9	8257	Dobova
00050000-5554-5cc9-deba-2d2e4423df6e	1423	Dobovec
00050000-5554-5cc9-2041-6beaa249f409	5263	Dobravlje
00050000-5554-5cc9-9042-19d63880e4d1	3204	Dobrna
00050000-5554-5cc9-6a05-25044514ca64	8211	Dobrnič
00050000-5554-5cc9-8c05-1e5333b34bb5	1356	Dobrova
00050000-5554-5cc9-82ea-901455476e59	9223	Dobrovnik/Dobronak 
00050000-5554-5cc9-5748-74637814e65d	5212	Dobrovo v Brdih
00050000-5554-5cc9-e926-6077963c22d7	1431	Dol pri Hrastniku
00050000-5554-5cc9-bce6-c5ed0effa6f1	1262	Dol pri Ljubljani
00050000-5554-5cc9-b0f3-ecba4d7f8484	1273	Dole pri Litiji
00050000-5554-5cc9-adda-29d7b9d66bbf	1331	Dolenja vas
00050000-5554-5cc9-5505-f3c766b1ed85	8350	Dolenjske Toplice
00050000-5554-5cc9-2d85-ecda4a5b31bd	1230	Domžale
00050000-5554-5cc9-8913-da35ef1f5c48	2252	Dornava
00050000-5554-5cc9-8946-023b06032cb5	5294	Dornberk
00050000-5554-5cc9-7593-6b7e693d649e	1319	Draga
00050000-5554-5cc9-3f39-3c3dfb8181df	8343	Dragatuš
00050000-5554-5cc9-90ae-3cfb40c1a2e5	3222	Dramlje
00050000-5554-5cc9-6f1c-6820d411d380	2370	Dravograd
00050000-5554-5cc9-b86e-3b2c043223a3	4203	Duplje
00050000-5554-5cc9-75da-5aeea3d831f3	6221	Dutovlje
00050000-5554-5cc9-15ae-7570bfb47ffa	8361	Dvor
00050000-5554-5cc9-8f15-c3f7c874fbcc	2343	Fala
00050000-5554-5cc9-11c1-675797bbfc6c	9208	Fokovci
00050000-5554-5cc9-e030-73ec4eb1ace7	2313	Fram
00050000-5554-5cc9-0705-ae1184972e91	3213	Frankolovo
00050000-5554-5cc9-b055-21f8b6cf559f	1274	Gabrovka
00050000-5554-5cc9-a2fb-61514374501f	8254	Globoko
00050000-5554-5cc9-84f3-7964819dfa4c	5275	Godovič
00050000-5554-5cc9-dd7d-04bf26f46eef	4204	Golnik
00050000-5554-5cc9-7959-5a9c5b834c54	3303	Gomilsko
00050000-5554-5cc9-a274-21b0367ed7f5	4224	Gorenja vas
00050000-5554-5cc9-010a-c096776f7c25	3263	Gorica pri Slivnici
00050000-5554-5cc9-4fb5-2571585c3d0b	2272	Gorišnica
00050000-5554-5cc9-b5eb-47b17e0396ed	9250	Gornja Radgona
00050000-5554-5cc9-98a8-c944fb8ef920	3342	Gornji Grad
00050000-5554-5cc9-aaec-1f856ff8eff8	4282	Gozd Martuljek
00050000-5554-5cc9-a07f-683c337b3e19	6272	Gračišče
00050000-5554-5cc9-7ae8-8d04d55dfe7a	9264	Grad
00050000-5554-5cc9-2d14-af8374934f06	8332	Gradac
00050000-5554-5cc9-cb7c-a8908773c9a4	1384	Grahovo
00050000-5554-5cc9-9f7d-bce69e12c8e7	5242	Grahovo ob Bači
00050000-5554-5cc9-be16-a04b6728d5e6	5251	Grgar
00050000-5554-5cc9-78ce-ad8759d56f77	3302	Griže
00050000-5554-5cc9-0358-d945a4e63442	3231	Grobelno
00050000-5554-5cc9-3920-d700bc82800a	1290	Grosuplje
00050000-5554-5cc9-b8c0-4bb6becfa3ba	2288	Hajdina
00050000-5554-5cc9-f142-6c8f53f93c11	8362	Hinje
00050000-5554-5cc9-6bd2-cebde2373555	2311	Hoče
00050000-5554-5cc9-49e6-f74f41b5d93d	9205	Hodoš/Hodos
00050000-5554-5cc9-9074-4a455ecdc54f	1354	Horjul
00050000-5554-5cc9-0178-770c6871d6bf	1372	Hotedršica
00050000-5554-5cc9-24db-554064a1f063	1430	Hrastnik
00050000-5554-5cc9-7b7e-4250486e82a5	6225	Hruševje
00050000-5554-5cc9-e1e9-48a1fa94f99c	4276	Hrušica
00050000-5554-5cc9-b0db-c6a61bb1ccc4	5280	Idrija
00050000-5554-5cc9-a4ca-b86f9935d0dc	1292	Ig
00050000-5554-5cc9-8af9-37c410d2d203	6250	Ilirska Bistrica
00050000-5554-5cc9-bd1d-1de4fd95ac6e	6251	Ilirska Bistrica-Trnovo
00050000-5554-5cc9-5c04-053013b2c1da	1295	Ivančna Gorica
00050000-5554-5cc9-7e30-821fcf3a7c6c	2259	Ivanjkovci
00050000-5554-5cc9-77d0-9d04a1e92284	1411	Izlake
00050000-5554-5cc9-662a-81934f763d23	6310	Izola/Isola
00050000-5554-5cc9-7d89-1f39c647696e	2222	Jakobski Dol
00050000-5554-5cc9-8b53-b530d53e9398	2221	Jarenina
00050000-5554-5cc9-ad50-73401767efb9	6254	Jelšane
00050000-5554-5cc9-23d9-e3b4acbec9e1	4270	Jesenice
00050000-5554-5cc9-fa29-00193624a665	8261	Jesenice na Dolenjskem
00050000-5554-5cc9-517e-8647bb31c8a9	3273	Jurklošter
00050000-5554-5cc9-b478-59ecb30d555b	2223	Jurovski Dol
00050000-5554-5cc9-0ada-68d5246143c0	2256	Juršinci
00050000-5554-5cc9-cd71-a6803701617d	5214	Kal nad Kanalom
00050000-5554-5cc9-1674-f40947e1e90b	3233	Kalobje
00050000-5554-5cc9-fcda-b2afa3a75ab4	4246	Kamna Gorica
00050000-5554-5cc9-6766-09e6a02bc166	2351	Kamnica
00050000-5554-5cc9-d5b7-fd97bc1db576	1241	Kamnik
00050000-5554-5cc9-138f-2def1638bdd3	5213	Kanal
00050000-5554-5cc9-c20a-839b54733af0	8258	Kapele
00050000-5554-5cc9-895a-4cbeb1ca449a	2362	Kapla
00050000-5554-5cc9-ed4f-2d5f3eb2cb03	2325	Kidričevo
00050000-5554-5cc9-f566-ea49d8d1bf3b	1412	Kisovec
00050000-5554-5cc9-962f-2031bda75c43	6253	Knežak
00050000-5554-5cc9-50ce-40bf4c783b9e	5222	Kobarid
00050000-5554-5cc9-f292-c6dd21a33f9e	9227	Kobilje
00050000-5554-5cc9-9683-8c510bd1f4aa	1330	Kočevje
00050000-5554-5cc9-c306-310bb4723d77	1338	Kočevska Reka
00050000-5554-5cc9-f5dc-60c28512a344	2276	Kog
00050000-5554-5cc9-f447-176b88cbcae2	5211	Kojsko
00050000-5554-5cc9-fb8a-1360715af35a	6223	Komen
00050000-5554-5cc9-60e4-5fc3ad8115c1	1218	Komenda
00050000-5554-5cc9-e7a9-6f28d4167488	6000	Koper/Capodistria 
00050000-5554-5cc9-cae4-2d5c911b5d05	6001	Koper/Capodistria - poštni predali
00050000-5554-5cc9-6dc5-357d39d036a1	8282	Koprivnica
00050000-5554-5cc9-c42f-88b5a5440cd4	5296	Kostanjevica na Krasu
00050000-5554-5cc9-a2b2-4370de65506e	8311	Kostanjevica na Krki
00050000-5554-5cc9-11ec-db844505347a	1336	Kostel
00050000-5554-5cc9-44cc-28a95f393d1e	6256	Košana
00050000-5554-5cc9-21de-4f9b7275626c	2394	Kotlje
00050000-5554-5cc9-998d-bb73c6ac0dd2	6240	Kozina
00050000-5554-5cc9-e17d-d118b5fae440	3260	Kozje
00050000-5554-5cc9-e070-7b7beedc142c	4000	Kranj 
00050000-5554-5cc9-d47e-9618b412a486	4001	Kranj - poštni predali
00050000-5554-5cc9-3bc3-3dcfe949ce49	4280	Kranjska Gora
00050000-5554-5cc9-b7a5-2fe74a915631	1281	Kresnice
00050000-5554-5cc9-31ef-fdd388f855b1	4294	Križe
00050000-5554-5cc9-f6da-5cfc33fb9ead	9206	Križevci
00050000-5554-5cc9-9b2e-f426b0381384	9242	Križevci pri Ljutomeru
00050000-5554-5cc9-89b0-a1df9ccb574b	1301	Krka
00050000-5554-5cc9-15b9-6f1486d60c05	8296	Krmelj
00050000-5554-5cc9-ef03-8f80b428a133	4245	Kropa
00050000-5554-5cc9-e3ca-5a631834a981	8262	Krška vas
00050000-5554-5cc9-3570-f14b45ad81f2	8270	Krško
00050000-5554-5cc9-9b84-23d89b2849f8	9263	Kuzma
00050000-5554-5cc9-f503-bc15516e4544	2318	Laporje
00050000-5554-5cc9-083f-16cecf9026ec	3270	Laško
00050000-5554-5cc9-b39d-8d425620af07	1219	Laze v Tuhinju
00050000-5554-5cc9-4c34-535893fcf8ea	2230	Lenart v Slovenskih goricah
00050000-5554-5cc9-57c9-249278e8f412	9220	Lendava/Lendva
00050000-5554-5cc9-28de-bd2dcc2af6b4	4248	Lesce
00050000-5554-5cc9-dcaa-58deb2c87978	3261	Lesično
00050000-5554-5cc9-8948-b508524da590	8273	Leskovec pri Krškem
00050000-5554-5cc9-41b0-7c5d4be6d855	2372	Libeliče
00050000-5554-5cc9-186d-ceeed3b3482e	2341	Limbuš
00050000-5554-5cc9-30ea-99fac911fabc	1270	Litija
00050000-5554-5cc9-a549-ee81c71e33bf	3202	Ljubečna
00050000-5554-5cc9-a99a-08acd1075e6e	1000	Ljubljana 
00050000-5554-5cc9-c868-23ea929472d7	1001	Ljubljana - poštni predali
00050000-5554-5cc9-f212-b3f8b83dbc46	1231	Ljubljana - Črnuče
00050000-5554-5cc9-eedb-0b4f8e61aaa1	1261	Ljubljana - Dobrunje
00050000-5554-5cc9-c226-ddc61b05c646	1260	Ljubljana - Polje
00050000-5554-5cc9-6292-3b11015b9ab4	1210	Ljubljana - Šentvid
00050000-5554-5cc9-ee1d-9fc2606be4fd	1211	Ljubljana - Šmartno
00050000-5554-5cc9-0991-eb0c07016068	3333	Ljubno ob Savinji
00050000-5554-5cc9-b91b-dbf2005b859e	9240	Ljutomer
00050000-5554-5cc9-b765-c2323b24d9c3	3215	Loče
00050000-5554-5cc9-7de2-817450d2c3f2	5231	Log pod Mangartom
00050000-5554-5cc9-8bd0-b6752e38c6ec	1358	Log pri Brezovici
00050000-5554-5cc9-d05b-cfaefd7b70ba	1370	Logatec
00050000-5554-5cc9-e262-2ee588073508	1371	Logatec
00050000-5554-5cc9-ab40-ccbf88cc2ed4	1434	Loka pri Zidanem Mostu
00050000-5554-5cc9-5073-f5ba497edd8e	3223	Loka pri Žusmu
00050000-5554-5cc9-e1d6-85386237a521	6219	Lokev
00050000-5554-5cc9-bf5b-4c2a4bfb4a26	1318	Loški Potok
00050000-5554-5cc9-ade6-662dd6acadc8	2324	Lovrenc na Dravskem polju
00050000-5554-5cc9-3f4b-6a1b7495ffaa	2344	Lovrenc na Pohorju
00050000-5554-5cc9-afb5-73ce198ddeda	3334	Luče
00050000-5554-5cc9-eec1-3507bc3da7d3	1225	Lukovica
00050000-5554-5cc9-b4d1-6eb922445791	9202	Mačkovci
00050000-5554-5cc9-17a4-ce1039df9371	2322	Majšperk
00050000-5554-5cc9-8e7b-76022925efe1	2321	Makole
00050000-5554-5cc9-5d48-c29d01f861ca	9243	Mala Nedelja
00050000-5554-5cc9-41f1-41068061294f	2229	Malečnik
00050000-5554-5cc9-6e9f-603f61312352	6273	Marezige
00050000-5554-5cc9-7e9e-7273eb4cebe8	2000	Maribor 
00050000-5554-5cc9-cc33-272872369a7d	2001	Maribor - poštni predali
00050000-5554-5cc9-db44-8f6b17eee9c2	2206	Marjeta na Dravskem polju
00050000-5554-5cc9-ec4d-528ae1822371	2281	Markovci
00050000-5554-5cc9-8f97-3b01953bb84d	9221	Martjanci
00050000-5554-5cc9-f5dd-ea2a6a6331d1	6242	Materija
00050000-5554-5cc9-23f7-02393ead4a9a	4211	Mavčiče
00050000-5554-5cc9-385d-937410138dc2	1215	Medvode
00050000-5554-5cc9-70de-074739ae8f41	1234	Mengeš
00050000-5554-5cc9-1497-3be17d15371b	8330	Metlika
00050000-5554-5cc9-3063-4358184a5ae0	2392	Mežica
00050000-5554-5cc9-8762-2e96fd52950f	2204	Miklavž na Dravskem polju
00050000-5554-5cc9-de87-5e88becfa578	2275	Miklavž pri Ormožu
00050000-5554-5cc9-cef3-2f056bc7896d	5291	Miren
00050000-5554-5cc9-bbba-6f56b02d97c8	8233	Mirna
00050000-5554-5cc9-216a-0a39f4cf2e64	8216	Mirna Peč
00050000-5554-5cc9-3830-cb8e7622f075	2382	Mislinja
00050000-5554-5cc9-e5a5-3a163577b476	4281	Mojstrana
00050000-5554-5cc9-fa7e-b24b31cde09d	8230	Mokronog
00050000-5554-5cc9-da89-5c69ca2d09db	1251	Moravče
00050000-5554-5cc9-69f9-51424e1f1578	9226	Moravske Toplice
00050000-5554-5cc9-f5c8-265dd7626390	5216	Most na Soči
00050000-5554-5cc9-ca82-cec312711861	1221	Motnik
00050000-5554-5cc9-3b47-ea54bb9b67a0	3330	Mozirje
00050000-5554-5cc9-e847-1fe7fa23f29d	9000	Murska Sobota 
00050000-5554-5cc9-15b0-f2772131f5a2	9001	Murska Sobota - poštni predali
00050000-5554-5cc9-2c48-7b46f509b337	2366	Muta
00050000-5554-5cc9-df12-8dcf459b019c	4202	Naklo
00050000-5554-5cc9-0070-5c8e611e62f5	3331	Nazarje
00050000-5554-5cc9-827c-b64f4b3e1d8e	1357	Notranje Gorice
00050000-5554-5cc9-5180-5d76bb3016eb	3203	Nova Cerkev
00050000-5554-5cc9-08ec-c84828e2bf95	5000	Nova Gorica 
00050000-5554-5cc9-41dd-7b8707e4a284	5001	Nova Gorica - poštni predali
00050000-5554-5cc9-360c-502d4f5c7d5a	1385	Nova vas
00050000-5554-5cc9-41e9-a035d67fcf7f	8000	Novo mesto
00050000-5554-5cc9-ee9a-7921918d2d99	8001	Novo mesto - poštni predali
00050000-5554-5cc9-4a1e-cba33ff9135d	6243	Obrov
00050000-5554-5cc9-9f1d-325c7099e582	9233	Odranci
00050000-5554-5cc9-69c6-da5ab9abf741	2317	Oplotnica
00050000-5554-5cc9-586f-b0b6eb653d8a	2312	Orehova vas
00050000-5554-5cc9-5711-5e24c187e0c3	2270	Ormož
00050000-5554-5cc9-32b2-46e2239d02dd	1316	Ortnek
00050000-5554-5cc9-bc80-085e27bfa65c	1337	Osilnica
00050000-5554-5cc9-7575-387ade5073d1	8222	Otočec
00050000-5554-5cc9-acdd-a91b304c0b27	2361	Ožbalt
00050000-5554-5cc9-98d3-660f22575833	2231	Pernica
00050000-5554-5cc9-28e5-4cf266252ca6	2211	Pesnica pri Mariboru
00050000-5554-5cc9-0d89-18d1ba2e654b	9203	Petrovci
00050000-5554-5cc9-7609-65729b1f3662	3301	Petrovče
00050000-5554-5cc9-c539-b12ea5163c67	6330	Piran/Pirano
00050000-5554-5cc9-42f7-7378567a2da4	8255	Pišece
00050000-5554-5cc9-fc2d-aa7b716e8e7d	6257	Pivka
00050000-5554-5cc9-66ff-c75252395a26	6232	Planina
00050000-5554-5cc9-dbd8-a64dcec1387f	3225	Planina pri Sevnici
00050000-5554-5cc9-3a8b-01782ce76776	6276	Pobegi
00050000-5554-5cc9-e866-6dbd838d6f71	8312	Podbočje
00050000-5554-5cc9-2643-14462be74c21	5243	Podbrdo
00050000-5554-5cc9-9470-0d9e8e467bca	3254	Podčetrtek
00050000-5554-5cc9-20b8-1cb21d74c927	2273	Podgorci
00050000-5554-5cc9-8c6c-9fb783882adb	6216	Podgorje
00050000-5554-5cc9-e0be-dbb996711f4c	2381	Podgorje pri Slovenj Gradcu
00050000-5554-5cc9-b9a0-936be9c92cef	6244	Podgrad
00050000-5554-5cc9-afb8-f27fdfd25079	1414	Podkum
00050000-5554-5cc9-968a-48242bf3df2d	2286	Podlehnik
00050000-5554-5cc9-7523-c14d4285eb1d	5272	Podnanos
00050000-5554-5cc9-76f4-2809aad6b1bb	4244	Podnart
00050000-5554-5cc9-b7fa-903b66d8124b	3241	Podplat
00050000-5554-5cc9-6800-f1d8d6ec61d6	3257	Podsreda
00050000-5554-5cc9-3132-0c83a2b8974e	2363	Podvelka
00050000-5554-5cc9-f33e-77265c78e25e	2208	Pohorje
00050000-5554-5cc9-9acc-89f8d801ee28	2257	Polenšak
00050000-5554-5cc9-25f2-143391f5c13d	1355	Polhov Gradec
00050000-5554-5cc9-effc-80cbe9aeefe6	4223	Poljane nad Škofjo Loko
00050000-5554-5cc9-95fd-6cc4b7ca0f45	2319	Poljčane
00050000-5554-5cc9-58bb-849dd9c79ddf	1272	Polšnik
00050000-5554-5cc9-867c-95295cf09661	3313	Polzela
00050000-5554-5cc9-6bb0-031035cacfd3	3232	Ponikva
00050000-5554-5cc9-a507-99733dbe2a98	6320	Portorož/Portorose
00050000-5554-5cc9-e62a-9b670af152a9	6230	Postojna
00050000-5554-5cc9-96f9-94eb868e0c5b	2331	Pragersko
00050000-5554-5cc9-fa9f-ef10f96de8b2	3312	Prebold
00050000-5554-5cc9-8ce1-88f9167c7bb7	4205	Preddvor
00050000-5554-5cc9-a87d-e544d46d44c4	6255	Prem
00050000-5554-5cc9-519c-3652042a8991	1352	Preserje
00050000-5554-5cc9-9482-b82df115aeee	6258	Prestranek
00050000-5554-5cc9-0868-fc9a9658c304	2391	Prevalje
00050000-5554-5cc9-78b2-8cd21fa68ed2	3262	Prevorje
00050000-5554-5cc9-e812-5148b35ca9db	1276	Primskovo 
00050000-5554-5cc9-649a-839ab99a9df6	3253	Pristava pri Mestinju
00050000-5554-5cc9-1aaf-ffa7a0a63f3a	9207	Prosenjakovci/Partosfalva
00050000-5554-5cc9-0467-30e09d0a2a34	5297	Prvačina
00050000-5554-5cc9-c818-595263c65e57	2250	Ptuj
00050000-5554-5cc9-119d-fdb7d244a56f	2323	Ptujska Gora
00050000-5554-5cc9-e7bf-cd32f34cb91b	9201	Puconci
00050000-5554-5cc9-d461-3024efc8362f	2327	Rače
00050000-5554-5cc9-8dd3-5226ff95505a	1433	Radeče
00050000-5554-5cc9-f861-94ebc4704799	9252	Radenci
00050000-5554-5cc9-fcce-8c1b93df6589	2360	Radlje ob Dravi
00050000-5554-5cc9-8ccd-370655182357	1235	Radomlje
00050000-5554-5cc9-872f-3953619aa8f6	4240	Radovljica
00050000-5554-5cc9-d949-3b05bde991dd	8274	Raka
00050000-5554-5cc9-3838-3a8941b8cfe7	1381	Rakek
00050000-5554-5cc9-04e3-905a8a76b4a3	4283	Rateče - Planica
00050000-5554-5cc9-90c8-71640d5fe934	2390	Ravne na Koroškem
00050000-5554-5cc9-d841-2f92e6a1f757	9246	Razkrižje
00050000-5554-5cc9-4519-41d9b9cbf104	3332	Rečica ob Savinji
00050000-5554-5cc9-1bb0-b28f5c2e0c4a	5292	Renče
00050000-5554-5cc9-e45e-607f47c697b6	1310	Ribnica
00050000-5554-5cc9-ae16-966dba2a9a40	2364	Ribnica na Pohorju
00050000-5554-5cc9-ff92-21ed564c1022	3272	Rimske Toplice
00050000-5554-5cc9-bd0a-81ecdb73bd4f	1314	Rob
00050000-5554-5cc9-917e-14a42a3d52be	5215	Ročinj
00050000-5554-5cc9-f132-8bdda74d5ca7	3250	Rogaška Slatina
00050000-5554-5cc9-f6cc-d9a650a28278	9262	Rogašovci
00050000-5554-5cc9-5ea8-0354b5f683ff	3252	Rogatec
00050000-5554-5cc9-4481-049bff0119db	1373	Rovte
00050000-5554-5cc9-4322-ed3128c9a327	2342	Ruše
00050000-5554-5cc9-9194-110e079bfa18	1282	Sava
00050000-5554-5cc9-110d-5e52285c86c6	6333	Sečovlje/Sicciole
00050000-5554-5cc9-b619-55f77754940c	4227	Selca
00050000-5554-5cc9-d830-0c45d88ca80a	2352	Selnica ob Dravi
00050000-5554-5cc9-9fa2-14a0dc1e5b80	8333	Semič
00050000-5554-5cc9-0d91-82978b25a984	8281	Senovo
00050000-5554-5cc9-4661-54ce19875fd6	6224	Senožeče
00050000-5554-5cc9-4788-15413a67dbc0	8290	Sevnica
00050000-5554-5cc9-5430-20b23db4bd11	6210	Sežana
00050000-5554-5cc9-7b98-fe3b91e3cff0	2214	Sladki Vrh
00050000-5554-5cc9-f59e-ead98f3e80b1	5283	Slap ob Idrijci
00050000-5554-5cc9-8529-bc1d0c306076	2380	Slovenj Gradec
00050000-5554-5cc9-db6b-42fef551f8b3	2310	Slovenska Bistrica
00050000-5554-5cc9-e82d-904b412a694e	3210	Slovenske Konjice
00050000-5554-5cc9-48be-4692ec97444e	1216	Smlednik
00050000-5554-5cc9-2c55-a6d8ca3fb8d1	5232	Soča
00050000-5554-5cc9-2f8b-3163d8743da2	1317	Sodražica
00050000-5554-5cc9-17cb-01e098f7af64	3335	Solčava
00050000-5554-5cc9-84b8-26cef4677143	5250	Solkan
00050000-5554-5cc9-261a-d4b59b79c414	4229	Sorica
00050000-5554-5cc9-a314-9ca0a590f230	4225	Sovodenj
00050000-5554-5cc9-e08a-fa1b14cf217a	5281	Spodnja Idrija
00050000-5554-5cc9-2d95-7cfd6d62e64c	2241	Spodnji Duplek
00050000-5554-5cc9-a5ed-8a2ae8bda192	9245	Spodnji Ivanjci
00050000-5554-5cc9-ade7-f294884c0d9f	2277	Središče ob Dravi
00050000-5554-5cc9-961f-21d19ae118ae	4267	Srednja vas v Bohinju
00050000-5554-5cc9-9327-b3a0cc3ce8f8	8256	Sromlje 
00050000-5554-5cc9-6278-35304c24fbee	5224	Srpenica
00050000-5554-5cc9-d216-b9e49b24a791	1242	Stahovica
00050000-5554-5cc9-9e68-96b625425c56	1332	Stara Cerkev
00050000-5554-5cc9-31e9-c0586dbcdc5f	8342	Stari trg ob Kolpi
00050000-5554-5cc9-bcd5-6048acdda3fd	1386	Stari trg pri Ložu
00050000-5554-5cc9-c038-969f970cd56b	2205	Starše
00050000-5554-5cc9-8e2a-003cb4897001	2289	Stoperce
00050000-5554-5cc9-0b72-7104aab5e69b	8322	Stopiče
00050000-5554-5cc9-7e7c-10070a35310d	3206	Stranice
00050000-5554-5cc9-e252-e815afff7094	8351	Straža
00050000-5554-5cc9-4d0a-8add536e2aa3	1313	Struge
00050000-5554-5cc9-c0dd-465fbf82187e	8293	Studenec
00050000-5554-5cc9-7552-8d72e6648ef0	8331	Suhor
00050000-5554-5cc9-1f02-eb148862361a	2233	Sv. Ana v Slovenskih goricah
00050000-5554-5cc9-6d18-3b6d8100e737	2235	Sv. Trojica v Slovenskih goricah
00050000-5554-5cc9-13ff-68d7c2891809	2353	Sveti Duh na Ostrem Vrhu
00050000-5554-5cc9-46d8-21e93fefcfd8	9244	Sveti Jurij ob Ščavnici
00050000-5554-5cc9-7400-fdadde016c33	3264	Sveti Štefan
00050000-5554-5cc9-68d3-27e5c372628d	2258	Sveti Tomaž
00050000-5554-5cc9-668b-5491e6b7d0b1	9204	Šalovci
00050000-5554-5cc9-70f9-144f943b8133	5261	Šempas
00050000-5554-5cc9-fb45-f65f75eb5e9c	5290	Šempeter pri Gorici
00050000-5554-5cc9-521e-5d3496f375ce	3311	Šempeter v Savinjski dolini
00050000-5554-5cc9-e53e-e98df3802b90	4208	Šenčur
00050000-5554-5cc9-efae-d2f760ca473f	2212	Šentilj v Slovenskih goricah
00050000-5554-5cc9-2cad-cf0f3aff2e44	8297	Šentjanž
00050000-5554-5cc9-aa70-244571832f4a	2373	Šentjanž pri Dravogradu
00050000-5554-5cc9-52d8-d7e5c8644021	8310	Šentjernej
00050000-5554-5cc9-0a29-4dac05b20c1b	3230	Šentjur
00050000-5554-5cc9-120d-173993a846f5	3271	Šentrupert
00050000-5554-5cc9-9740-870b23c6371f	8232	Šentrupert
00050000-5554-5cc9-1970-990589569203	1296	Šentvid pri Stični
00050000-5554-5cc9-88f2-bf98b6b7b89a	8275	Škocjan
00050000-5554-5cc9-49b2-23d60f21ade8	6281	Škofije
00050000-5554-5cc9-6b5a-68a6a6e8717c	4220	Škofja Loka
00050000-5554-5cc9-d634-31a773bf0e19	3211	Škofja vas
00050000-5554-5cc9-13aa-34d1261ece49	1291	Škofljica
00050000-5554-5cc9-ca38-b32fa80f48f4	6274	Šmarje
00050000-5554-5cc9-e319-001908d40275	1293	Šmarje - Sap
00050000-5554-5cc9-1e51-502e36d3ecac	3240	Šmarje pri Jelšah
00050000-5554-5cc9-0b88-8f7c9e9de9da	8220	Šmarješke Toplice
00050000-5554-5cc9-0950-2bc6bb63a238	2315	Šmartno na Pohorju
00050000-5554-5cc9-3fcc-e3301c04bd99	3341	Šmartno ob Dreti
00050000-5554-5cc9-2df7-9bfeadf9ee0d	3327	Šmartno ob Paki
00050000-5554-5cc9-57cc-3a081507981e	1275	Šmartno pri Litiji
00050000-5554-5cc9-9a1a-2b56513fe546	2383	Šmartno pri Slovenj Gradcu
00050000-5554-5cc9-d072-5c70daf1afd7	3201	Šmartno v Rožni dolini
00050000-5554-5cc9-2b6b-dba4d76016a6	3325	Šoštanj
00050000-5554-5cc9-f348-3692db1d90c7	6222	Štanjel
00050000-5554-5cc9-e86e-d3aa72e36a5c	3220	Štore
00050000-5554-5cc9-018e-d6fbd5847565	3304	Tabor
00050000-5554-5cc9-0189-8c8787f66f42	3221	Teharje
00050000-5554-5cc9-7634-80b08833d0bc	9251	Tišina
00050000-5554-5cc9-d404-e4fc382890ab	5220	Tolmin
00050000-5554-5cc9-ba72-d6d1dc89bc82	3326	Topolšica
00050000-5554-5cc9-409a-62e7ba7d2c2f	2371	Trbonje
00050000-5554-5cc9-ed4b-6cd7c7f09439	1420	Trbovlje
00050000-5554-5cc9-45a1-499e8dbb0525	8231	Trebelno 
00050000-5554-5cc9-2524-045577f95acf	8210	Trebnje
00050000-5554-5cc9-7ccb-5f278638bb99	5252	Trnovo pri Gorici
00050000-5554-5cc9-2b71-94c73f68d8f4	2254	Trnovska vas
00050000-5554-5cc9-bbaa-fc8ce06241bd	1222	Trojane
00050000-5554-5cc9-ce78-00b57623968d	1236	Trzin
00050000-5554-5cc9-d888-9393506e959e	4290	Tržič
00050000-5554-5cc9-9259-bbf38a976813	8295	Tržišče
00050000-5554-5cc9-c7ae-ccad70de6535	1311	Turjak
00050000-5554-5cc9-a065-32f929b521cd	9224	Turnišče
00050000-5554-5cc9-cb59-dbac80a022ae	8323	Uršna sela
00050000-5554-5cc9-a754-b217453a6389	1252	Vače
00050000-5554-5cc9-9bbf-688bdc39cc0e	3320	Velenje 
00050000-5554-5cc9-fa05-a49b3a4ec66c	3322	Velenje - poštni predali
00050000-5554-5cc9-f599-52dea06de006	8212	Velika Loka
00050000-5554-5cc9-8cb9-d00e24761648	2274	Velika Nedelja
00050000-5554-5cc9-203e-bea34f6634c9	9225	Velika Polana
00050000-5554-5cc9-334f-d2720b9790b7	1315	Velike Lašče
00050000-5554-5cc9-65d7-43d3a84172a1	8213	Veliki Gaber
00050000-5554-5cc9-f2e9-2d30ceb51e4b	9241	Veržej
00050000-5554-5cc9-0566-e327a75b1adb	1312	Videm - Dobrepolje
00050000-5554-5cc9-a886-b9749bd91211	2284	Videm pri Ptuju
00050000-5554-5cc9-140e-34c937e1980e	8344	Vinica
00050000-5554-5cc9-e06b-66cc946d494b	5271	Vipava
00050000-5554-5cc9-1c41-fc624f525682	4212	Visoko
00050000-5554-5cc9-17bc-600903236b08	1294	Višnja Gora
00050000-5554-5cc9-1fe9-201e43c565fd	3205	Vitanje
00050000-5554-5cc9-a1a6-c9a310af2efe	2255	Vitomarci
00050000-5554-5cc9-ad3f-84c520c9dbe2	1217	Vodice
00050000-5554-5cc9-f993-b21de6794677	3212	Vojnik\t
00050000-5554-5cc9-37d4-6aab9d0b553b	5293	Volčja Draga
00050000-5554-5cc9-bb47-383887c40eef	2232	Voličina
00050000-5554-5cc9-9d7d-b34a2fd5e4e3	3305	Vransko
00050000-5554-5cc9-15ea-c3a11ca4be6e	6217	Vremski Britof
00050000-5554-5cc9-0811-c70de91a3d0f	1360	Vrhnika
00050000-5554-5cc9-ea64-64ee98ff11ca	2365	Vuhred
00050000-5554-5cc9-c048-372bbc28e336	2367	Vuzenica
00050000-5554-5cc9-5a19-1e6a3873530c	8292	Zabukovje 
00050000-5554-5cc9-b1cb-9a0e9b71b5d6	1410	Zagorje ob Savi
00050000-5554-5cc9-8399-060dababf061	1303	Zagradec
00050000-5554-5cc9-d813-6e3efba41361	2283	Zavrč
00050000-5554-5cc9-1775-ea9cde6ac4f2	8272	Zdole 
00050000-5554-5cc9-e923-1f43092d5f09	4201	Zgornja Besnica
00050000-5554-5cc9-029a-45ee70be922e	2242	Zgornja Korena
00050000-5554-5cc9-472d-961b9acc9cac	2201	Zgornja Kungota
00050000-5554-5cc9-dc98-cc7e6fb3e2c4	2316	Zgornja Ložnica
00050000-5554-5cc9-fecb-a42116ba47ae	2314	Zgornja Polskava
00050000-5554-5cc9-7718-2fc92ab6331b	2213	Zgornja Velka
00050000-5554-5cc9-7fbb-67b263368990	4247	Zgornje Gorje
00050000-5554-5cc9-8544-d55e08b9ce1d	4206	Zgornje Jezersko
00050000-5554-5cc9-7407-18b9a74ebd5d	2285	Zgornji Leskovec
00050000-5554-5cc9-e8a2-a07c1537fa36	1432	Zidani Most
00050000-5554-5cc9-7bed-e44910cbdf27	3214	Zreče
00050000-5554-5cc9-37a0-d24feca79bd0	4209	Žabnica
00050000-5554-5cc9-8115-f25c9d3731df	3310	Žalec
00050000-5554-5cc9-038e-218138d7f113	4228	Železniki
00050000-5554-5cc9-0974-aed64e3d2ded	2287	Žetale
00050000-5554-5cc9-79bb-af9a1b3ddabe	4226	Žiri
00050000-5554-5cc9-a567-777bdfa9a4b0	4274	Žirovnica
00050000-5554-5cc9-994e-6d67d43e3efe	8360	Žužemberk
\.


--
-- TOC entry 2665 (class 0 OID 3369997)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3369818)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3369884)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3370009)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3370114)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3370161)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3370038)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 3369982)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3369972)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3370151)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3370104)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 3369685)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5554-5cca-1bfe-46975d00dfcc	00010000-5554-5cca-bb49-151804cbc9eb	2015-05-14 10:28:58	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROE.3Lb5cu3PCWKi.PvDRcbTQma6TsDGu";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2697 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2672 (class 0 OID 3370047)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3369723)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5554-5cca-191d-95466467149b	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5554-5cca-61ce-b541929375f8	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5554-5cca-9cfd-83e33bad36b8	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5554-5cca-cf36-820f187268bf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5554-5cca-5907-8b2377f9a8b6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5554-5cca-a661-0b3166e28739	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2638 (class 0 OID 3369707)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5554-5cca-1bfe-46975d00dfcc	00020000-5554-5cca-cf36-820f187268bf
00010000-5554-5cca-bb49-151804cbc9eb	00020000-5554-5cca-cf36-820f187268bf
\.


--
-- TOC entry 2674 (class 0 OID 3370061)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3370003)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3369953)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3369783)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3369959)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3370139)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3369853)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 3369694)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5554-5cca-bb49-151804cbc9eb	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROMDtdqq6aOEHH0o8pQqiq4y/qh5163GO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5554-5cca-1bfe-46975d00dfcc	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2686 (class 0 OID 3370193)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3369899)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3370030)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3370096)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3369928)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 3370183)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3370086)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2280 (class 2606 OID 3369748)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 3370233)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 3370226)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3370138)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2333 (class 2606 OID 3369918)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 3369952)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2316 (class 2606 OID 3369879)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 3370082)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 3369897)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 3369946)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 3369995)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 3370022)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 3369851)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 3369757)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 3369815)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2286 (class 2606 OID 3369781)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 3369737)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2271 (class 2606 OID 3369722)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 3370028)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 3370060)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 3370178)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 3369808)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 3369839)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3370001)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3369829)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3369888)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3370013)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3370120)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 3370166)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 3370045)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3369986)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 3369977)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 3370160)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 3370111)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3369693)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 3370051)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2269 (class 2606 OID 3369711)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2273 (class 2606 OID 3369731)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 3370069)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 3370008)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 3369958)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2291 (class 2606 OID 3369788)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 3369968)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 3370150)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 3369864)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 3369706)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3370208)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 3369903)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3370036)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 3370102)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3369941)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 3370192)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 3370095)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 1259 OID 3369925)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2292 (class 1259 OID 3369810)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2257 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2258 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2259 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2383 (class 1259 OID 3370029)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2377 (class 1259 OID 3370015)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2378 (class 1259 OID 3370014)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2329 (class 1259 OID 3369904)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2404 (class 1259 OID 3370085)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2405 (class 1259 OID 3370083)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2406 (class 1259 OID 3370084)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2429 (class 1259 OID 3370180)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2430 (class 1259 OID 3370181)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2431 (class 1259 OID 3370182)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2437 (class 1259 OID 3370211)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2438 (class 1259 OID 3370210)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2439 (class 1259 OID 3370209)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2311 (class 1259 OID 3369866)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2312 (class 1259 OID 3369865)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 3369817)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2297 (class 1259 OID 3369816)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2392 (class 1259 OID 3370052)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2347 (class 1259 OID 3369947)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2275 (class 1259 OID 3369738)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2276 (class 1259 OID 3369739)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2397 (class 1259 OID 3370072)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2398 (class 1259 OID 3370071)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2399 (class 1259 OID 3370070)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2321 (class 1259 OID 3369889)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2322 (class 1259 OID 3369891)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2323 (class 1259 OID 3369890)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2357 (class 1259 OID 3369981)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2358 (class 1259 OID 3369979)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2359 (class 1259 OID 3369978)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2360 (class 1259 OID 3369980)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2266 (class 1259 OID 3369712)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2267 (class 1259 OID 3369713)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2386 (class 1259 OID 3370037)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2372 (class 1259 OID 3370002)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2412 (class 1259 OID 3370112)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2413 (class 1259 OID 3370113)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2300 (class 1259 OID 3369831)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2301 (class 1259 OID 3369830)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2302 (class 1259 OID 3369832)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2416 (class 1259 OID 3370121)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2417 (class 1259 OID 3370122)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2448 (class 1259 OID 3370236)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 3370235)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2450 (class 1259 OID 3370238)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2451 (class 1259 OID 3370234)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2452 (class 1259 OID 3370237)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2409 (class 1259 OID 3370103)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2363 (class 1259 OID 3369990)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2364 (class 1259 OID 3369989)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2365 (class 1259 OID 3369987)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2366 (class 1259 OID 3369988)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2253 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2444 (class 1259 OID 3370228)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2445 (class 1259 OID 3370227)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2328 (class 1259 OID 3369898)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2281 (class 1259 OID 3369759)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2282 (class 1259 OID 3369758)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2288 (class 1259 OID 3369789)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2289 (class 1259 OID 3369790)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2352 (class 1259 OID 3369971)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 3369970)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 3369969)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2335 (class 1259 OID 3369927)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2336 (class 1259 OID 3369923)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2337 (class 1259 OID 3369920)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2338 (class 1259 OID 3369921)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2339 (class 1259 OID 3369919)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2340 (class 1259 OID 3369924)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2341 (class 1259 OID 3369922)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2295 (class 1259 OID 3369809)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2317 (class 1259 OID 3369880)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2318 (class 1259 OID 3369882)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2319 (class 1259 OID 3369881)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2320 (class 1259 OID 3369883)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2371 (class 1259 OID 3369996)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2434 (class 1259 OID 3370179)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 3369782)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2310 (class 1259 OID 3369852)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2391 (class 1259 OID 3370046)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2256 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2307 (class 1259 OID 3369840)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2428 (class 1259 OID 3370167)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2274 (class 1259 OID 3369732)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2342 (class 1259 OID 3369926)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2477 (class 2606 OID 3370369)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2480 (class 2606 OID 3370354)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2479 (class 2606 OID 3370359)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2475 (class 2606 OID 3370379)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2481 (class 2606 OID 3370349)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2476 (class 2606 OID 3370374)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2478 (class 2606 OID 3370364)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2462 (class 2606 OID 3370284)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2498 (class 2606 OID 3370464)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2496 (class 2606 OID 3370459)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2497 (class 2606 OID 3370454)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2474 (class 2606 OID 3370344)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 3370504)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2506 (class 2606 OID 3370494)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 3370499)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2494 (class 2606 OID 3370444)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 3370539)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 3370544)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 3370549)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2516 (class 2606 OID 3370564)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2517 (class 2606 OID 3370559)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2518 (class 2606 OID 3370554)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2468 (class 2606 OID 3370319)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2469 (class 2606 OID 3370314)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2463 (class 2606 OID 3370294)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2464 (class 2606 OID 3370289)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 3370269)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2500 (class 2606 OID 3370474)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2482 (class 2606 OID 3370384)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 3370249)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2455 (class 2606 OID 3370254)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2501 (class 2606 OID 3370489)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2502 (class 2606 OID 3370484)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2503 (class 2606 OID 3370479)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2472 (class 2606 OID 3370324)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2470 (class 2606 OID 3370334)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2471 (class 2606 OID 3370329)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2486 (class 2606 OID 3370419)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2488 (class 2606 OID 3370409)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2489 (class 2606 OID 3370404)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2487 (class 2606 OID 3370414)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2454 (class 2606 OID 3370239)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2453 (class 2606 OID 3370244)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2499 (class 2606 OID 3370469)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2495 (class 2606 OID 3370449)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2509 (class 2606 OID 3370514)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2508 (class 2606 OID 3370519)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2466 (class 2606 OID 3370304)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2467 (class 2606 OID 3370299)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2465 (class 2606 OID 3370309)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2511 (class 2606 OID 3370524)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 3370529)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2523 (class 2606 OID 3370589)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2524 (class 2606 OID 3370584)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2521 (class 2606 OID 3370599)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2525 (class 2606 OID 3370579)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2522 (class 2606 OID 3370594)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2507 (class 2606 OID 3370509)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2490 (class 2606 OID 3370439)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2491 (class 2606 OID 3370434)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2493 (class 2606 OID 3370424)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2492 (class 2606 OID 3370429)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2519 (class 2606 OID 3370574)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2520 (class 2606 OID 3370569)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2473 (class 2606 OID 3370339)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2512 (class 2606 OID 3370534)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3370264)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2458 (class 2606 OID 3370259)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2461 (class 2606 OID 3370274)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2460 (class 2606 OID 3370279)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2483 (class 2606 OID 3370399)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 3370394)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2485 (class 2606 OID 3370389)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-14 10:28:58 CEST

--
-- PostgreSQL database dump complete
--

