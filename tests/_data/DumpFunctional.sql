--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-12 14:57:21 CEST

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
-- TOC entry 179 (class 1259 OID 3191601)
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
-- TOC entry 225 (class 1259 OID 3192088)
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
-- TOC entry 224 (class 1259 OID 3192071)
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
-- TOC entry 217 (class 1259 OID 3191982)
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
-- TOC entry 193 (class 1259 OID 3191766)
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
-- TOC entry 196 (class 1259 OID 3191807)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3191728)
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
-- TOC entry 212 (class 1259 OID 3191932)
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
-- TOC entry 191 (class 1259 OID 3191753)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3191801)
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
-- TOC entry 201 (class 1259 OID 3191850)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3191875)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3191702)
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
-- TOC entry 180 (class 1259 OID 3191610)
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
-- TOC entry 181 (class 1259 OID 3191621)
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
-- TOC entry 184 (class 1259 OID 3191672)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3191575)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3191594)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3191882)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3191912)
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
-- TOC entry 221 (class 1259 OID 3192027)
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
-- TOC entry 183 (class 1259 OID 3191652)
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
-- TOC entry 186 (class 1259 OID 3191694)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3191856)
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
-- TOC entry 185 (class 1259 OID 3191679)
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
-- TOC entry 190 (class 1259 OID 3191745)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3191868)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3191973)
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
-- TOC entry 220 (class 1259 OID 3192020)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3191897)
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
-- TOC entry 200 (class 1259 OID 3191841)
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
-- TOC entry 199 (class 1259 OID 3191831)
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
-- TOC entry 219 (class 1259 OID 3192010)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3191963)
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
-- TOC entry 173 (class 1259 OID 3191546)
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
-- TOC entry 172 (class 1259 OID 3191544)
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
-- TOC entry 209 (class 1259 OID 3191906)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3191584)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3191568)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3191920)
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
-- TOC entry 203 (class 1259 OID 3191862)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3191812)
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
-- TOC entry 182 (class 1259 OID 3191644)
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
-- TOC entry 198 (class 1259 OID 3191818)
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
-- TOC entry 218 (class 1259 OID 3191998)
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
-- TOC entry 188 (class 1259 OID 3191714)
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
-- TOC entry 174 (class 1259 OID 3191555)
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
-- TOC entry 223 (class 1259 OID 3192052)
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
-- TOC entry 192 (class 1259 OID 3191760)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3191889)
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
-- TOC entry 214 (class 1259 OID 3191955)
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
-- TOC entry 194 (class 1259 OID 3191788)
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
-- TOC entry 222 (class 1259 OID 3192042)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3191945)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3191549)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2640 (class 0 OID 3191601)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2686 (class 0 OID 3192088)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 3192071)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3191982)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3191766)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3191807)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3191728)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5551-f8b0-e7b9-70f3137502a9	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5551-f8b0-7249-ca714a8aeba9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5551-f8b0-1a7f-3f7f153f6a6d	AL	ALB	008	Albania 	Albanija	\N
00040000-5551-f8b0-531a-41c4f13f4aec	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5551-f8b0-3004-b1b2fb383ad7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5551-f8b0-9cc8-321d48cae069	AD	AND	020	Andorra 	Andora	\N
00040000-5551-f8b0-d7e6-3fdeb538a910	AO	AGO	024	Angola 	Angola	\N
00040000-5551-f8b0-bacd-779b61ffe021	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5551-f8b0-93c7-18cbf6f2e8a7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5551-f8b0-a706-c946c6056975	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-f8b0-014b-f3290dd01752	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5551-f8b0-4578-45d83c7f0b1a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5551-f8b0-873d-64fd5b727966	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5551-f8b0-9bef-38d573d952ea	AU	AUS	036	Australia 	Avstralija	\N
00040000-5551-f8b0-5015-3adca955b94d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5551-f8b0-749d-ef3ab84758ec	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5551-f8b0-8538-3b5d9c40b3a5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5551-f8b0-71b6-3acc94e5b27b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5551-f8b0-30bc-d6ddffb36e73	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5551-f8b0-0b5b-87b7af116856	BB	BRB	052	Barbados 	Barbados	\N
00040000-5551-f8b0-36c3-d95e054d78c7	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5551-f8b0-1011-32074df0bc0b	BE	BEL	056	Belgium 	Belgija	\N
00040000-5551-f8b0-48b3-9c71e65b359a	BZ	BLZ	084	Belize 	Belize	\N
00040000-5551-f8b0-a30c-68852e3167ea	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5551-f8b0-8ee4-48402ed23ca2	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5551-f8b0-90d0-46d834375765	BT	BTN	064	Bhutan 	Butan	\N
00040000-5551-f8b0-b1d7-0a74c25205da	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5551-f8b0-f204-33b654b2f610	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5551-f8b0-71fe-4062b14bc0f6	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5551-f8b0-f854-ee04220360f5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5551-f8b0-d36a-07e9800f15c6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5551-f8b0-fd44-fb26c09760ea	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5551-f8b0-6dc6-0c409da6a12d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5551-f8b0-8ce8-a54b9b8d992b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5551-f8b0-8017-107790bcf1ea	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5551-f8b0-59a5-259c2b3d5c7a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5551-f8b0-ca28-4e096d5c919e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5551-f8b0-ecf3-e00b5a356345	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5551-f8b0-9443-ad81cbd3342b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5551-f8b0-11ae-27895e26e259	CA	CAN	124	Canada 	Kanada	\N
00040000-5551-f8b0-b920-14cccec1991b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5551-f8b0-7ee6-357631dcb6ba	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5551-f8b0-353a-512c73d6b911	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5551-f8b0-56c3-f58879f83e55	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5551-f8b0-d1c2-dcae89f42bce	CL	CHL	152	Chile 	Čile	\N
00040000-5551-f8b0-7013-4c7ac0c3a274	CN	CHN	156	China 	Kitajska	\N
00040000-5551-f8b0-374b-93d25a8e9d3d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5551-f8b0-4181-f15a992c6ab2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5551-f8b0-230c-be5a1466b413	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5551-f8b0-4992-b280512a7de3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5551-f8b0-bb30-13dab5164956	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5551-f8b0-b85d-a1655b03aa35	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5551-f8b0-4aca-f663d1021120	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5551-f8b0-f993-63368f120e32	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5551-f8b0-cbc6-0f18553c9f8b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5551-f8b0-111e-0746674151cd	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5551-f8b0-8dd6-fbb911a5fc5b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5551-f8b0-74cc-ecfcb5329448	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5551-f8b0-3a88-fad0d9b6eec0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5551-f8b0-198a-fe1c7f799d04	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5551-f8b0-9abb-7e1478c905b6	DK	DNK	208	Denmark 	Danska	\N
00040000-5551-f8b0-b2c6-22225137515e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5551-f8b0-8bff-7afc531755d8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-f8b0-1335-da7670c92cc4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5551-f8b0-6938-a8e2bce56451	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5551-f8b0-1eae-877e97455bac	EG	EGY	818	Egypt 	Egipt	\N
00040000-5551-f8b0-fd4a-b8cadff0fe27	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5551-f8b0-9b85-452c9bf3df0c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5551-f8b0-51ef-c6cca94c6b22	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5551-f8b0-0f50-7607f74e9ff9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5551-f8b0-1165-c5fcdb40e00b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5551-f8b0-b201-31666c96a7f3	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5551-f8b0-c99b-62abebfbeb2b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5551-f8b0-6482-2936a3f1ddf6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5551-f8b0-2f3c-0804ef547dad	FI	FIN	246	Finland 	Finska	\N
00040000-5551-f8b0-0a05-d199ccec17e2	FR	FRA	250	France 	Francija	\N
00040000-5551-f8b0-94f7-29220241ae27	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5551-f8b0-795f-9ef28988d5ab	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5551-f8b0-f028-07965d2d0f36	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5551-f8b0-2051-f555e369bdf8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5551-f8b0-1879-1da5477c7f2d	GA	GAB	266	Gabon 	Gabon	\N
00040000-5551-f8b0-7b31-bdcf6d3744fd	GM	GMB	270	Gambia 	Gambija	\N
00040000-5551-f8b0-228a-a1ba15d279db	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5551-f8b0-6f86-87fb20704164	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5551-f8b0-6ec1-0703fb05b9ad	GH	GHA	288	Ghana 	Gana	\N
00040000-5551-f8b0-57e0-94f70ba830f6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5551-f8b0-5b26-04fcf7c695fe	GR	GRC	300	Greece 	Grčija	\N
00040000-5551-f8b0-e9cc-7c5078c7d203	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5551-f8b0-dce6-edbaad94e38b	GD	GRD	308	Grenada 	Grenada	\N
00040000-5551-f8b0-fa56-6abded5d889a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5551-f8b0-3128-1f7b5ae9b555	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5551-f8b0-e502-30ea35f523b3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5551-f8b0-0712-39825c03ad1a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5551-f8b0-29be-3a4f59be0b15	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5551-f8b0-c476-7d95f6e5b93e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5551-f8b0-c905-136961c6e5b9	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5551-f8b0-ee46-4ea04b17e4d9	HT	HTI	332	Haiti 	Haiti	\N
00040000-5551-f8b0-240d-099049e4cfee	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5551-f8b0-ba1e-b31770e71c0f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5551-f8b0-0213-a57e26727997	HN	HND	340	Honduras 	Honduras	\N
00040000-5551-f8b0-913d-bb7ae5eac7c0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5551-f8b0-873a-8a7bef90cc61	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5551-f8b0-c549-a369e2719f29	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5551-f8b0-7cd9-efd8bee4caf7	IN	IND	356	India 	Indija	\N
00040000-5551-f8b0-b5fc-1f30fd544edb	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5551-f8b0-ed3f-018dad69d1bb	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5551-f8b0-0b89-5a1b311363a4	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5551-f8b0-0449-3d716f7cbd26	IE	IRL	372	Ireland 	Irska	\N
00040000-5551-f8b0-92ad-f64ef1ee103f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5551-f8b0-7ffd-870956604618	IL	ISR	376	Israel 	Izrael	\N
00040000-5551-f8b0-3538-7d32778313ba	IT	ITA	380	Italy 	Italija	\N
00040000-5551-f8b0-396e-51417bd47d27	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5551-f8b0-de85-46fc69dbdb22	JP	JPN	392	Japan 	Japonska	\N
00040000-5551-f8b0-2483-c7fc8e791ca2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5551-f8b0-8b7c-dbe6ccc215cf	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5551-f8b0-e7d9-408ce857060c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5551-f8b0-9e5a-bc9f5eb34755	KE	KEN	404	Kenya 	Kenija	\N
00040000-5551-f8b0-5a1b-e1c94b34cbfd	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5551-f8b0-baac-2e90419f831f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5551-f8b0-4216-4385c8be70c6	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5551-f8b0-c058-360659a48871	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5551-f8b0-0597-5e777f83e627	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5551-f8b0-0717-7b6c43ce9a7f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5551-f8b0-e126-2dfe601174fb	LV	LVA	428	Latvia 	Latvija	\N
00040000-5551-f8b0-1e58-e8d906380326	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5551-f8b0-8c84-6e36e2a51623	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5551-f8b0-84a4-2bc4f14db2b5	LR	LBR	430	Liberia 	Liberija	\N
00040000-5551-f8b0-20fd-02a84bc470bb	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5551-f8b0-e9d6-f8632d5cd278	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5551-f8b0-b59f-2ba80e1a48fb	LT	LTU	440	Lithuania 	Litva	\N
00040000-5551-f8b0-af81-aeeff65722b8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5551-f8b0-a7ed-4cf672ba3b5c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5551-f8b0-96bb-dfd6f8639ecd	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5551-f8b0-1c86-45bc79bfea94	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5551-f8b0-9fda-ce5566853874	MW	MWI	454	Malawi 	Malavi	\N
00040000-5551-f8b0-4bf9-86a93f9db3f1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5551-f8b0-88b5-0885dabcfc2e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5551-f8b0-2ff9-0346341316e6	ML	MLI	466	Mali 	Mali	\N
00040000-5551-f8b0-96b9-4d10a4ce057b	MT	MLT	470	Malta 	Malta	\N
00040000-5551-f8b0-2721-ce47f85a5239	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5551-f8b0-1965-f1d393497d17	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5551-f8b0-26a5-36641d0c3176	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5551-f8b0-c8d9-445ceb26b60f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5551-f8b0-e108-64a1d59d2f5c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5551-f8b0-9bd7-34add2b0f75b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5551-f8b0-52d5-c01075c6d496	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5551-f8b0-1d3f-0fb16da21435	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5551-f8b0-5faf-e1d18fa91cec	MC	MCO	492	Monaco 	Monako	\N
00040000-5551-f8b0-8a68-fd41301ccdb2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5551-f8b0-673d-57844f072831	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5551-f8b0-120e-b10753dbb19e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5551-f8b0-2cda-b83a6e1eeef8	MA	MAR	504	Morocco 	Maroko	\N
00040000-5551-f8b0-5ade-7fdaa6ec95a4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5551-f8b0-bbb7-3c2c5335166f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5551-f8b0-38a3-88ed35ef85d0	NA	NAM	516	Namibia 	Namibija	\N
00040000-5551-f8b0-cf79-f414f332266c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5551-f8b0-6349-72f3be2e671f	NP	NPL	524	Nepal 	Nepal	\N
00040000-5551-f8b0-598e-e3360385c977	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5551-f8b0-4d45-e4af586bebdc	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5551-f8b0-c9f8-b292f276b349	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5551-f8b0-8c44-d859d9561af3	NE	NER	562	Niger 	Niger 	\N
00040000-5551-f8b0-5b0d-ae78d995df82	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5551-f8b0-6225-1d0aa8f7f381	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5551-f8b0-49cd-3e9c8c7f12cd	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5551-f8b0-a5bb-b6794fd343dc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5551-f8b0-9a1f-dbd1863576f4	NO	NOR	578	Norway 	Norveška	\N
00040000-5551-f8b0-e0e2-17b4c0c98c2f	OM	OMN	512	Oman 	Oman	\N
00040000-5551-f8b0-c89b-c6a821d6d6a4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5551-f8b0-47bc-47685cfd01f9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5551-f8b0-4ce0-2cdb822ebb9e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5551-f8b0-8684-3f3c96df490d	PA	PAN	591	Panama 	Panama	\N
00040000-5551-f8b0-87e9-28cbdeba891f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5551-f8b0-4758-166da9799e6f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5551-f8b0-b215-d3cf378e7083	PE	PER	604	Peru 	Peru	\N
00040000-5551-f8b0-3270-8693880b7925	PH	PHL	608	Philippines 	Filipini	\N
00040000-5551-f8b0-a2bf-87db143974a8	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5551-f8b0-b93f-6da6bae487b4	PL	POL	616	Poland 	Poljska	\N
00040000-5551-f8b0-ad30-d32077aeff92	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5551-f8b0-ffcd-d1e566bdbf80	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5551-f8b0-a169-6176e52b717d	QA	QAT	634	Qatar 	Katar	\N
00040000-5551-f8b0-8376-a74ab45e0e04	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5551-f8b0-ba3d-4663d2413311	RO	ROU	642	Romania 	Romunija	\N
00040000-5551-f8b0-c6d3-af987d564ced	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5551-f8b0-a3f9-4679d7b18d3e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5551-f8b0-d4fb-dc768c3b97e8	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5551-f8b0-5940-ff0685171adb	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5551-f8b0-a0c8-34c9c30c141d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5551-f8b0-bb5c-0859c44d8fa1	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5551-f8b0-937d-d0ec085b89bf	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5551-f8b0-047d-901893ebdc4d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5551-f8b0-3fc0-d6c487d7d904	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5551-f8b0-ee4c-82f5741c7098	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5551-f8b0-1efc-169341e00434	SM	SMR	674	San Marino 	San Marino	\N
00040000-5551-f8b0-77ab-a34bc1281860	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5551-f8b0-d477-73ff0bc8ba2e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5551-f8b0-1d4f-6d4ad14f2c39	SN	SEN	686	Senegal 	Senegal	\N
00040000-5551-f8b0-a32e-de16b6c7e2a2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5551-f8b0-e020-5e0c413be143	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5551-f8b0-f7dc-8eb96da64c2b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5551-f8b0-ab7d-58f30086ec6b	SG	SGP	702	Singapore 	Singapur	\N
00040000-5551-f8b0-27b6-0a68463b9851	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5551-f8b0-51b3-fe118c61f371	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5551-f8b0-010a-7ebf977906b8	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5551-f8b0-41ec-801fa188808a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5551-f8b0-5ef0-16bdcca30849	SO	SOM	706	Somalia 	Somalija	\N
00040000-5551-f8b0-f66f-f3f4a4b14ddf	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5551-f8b0-758d-4c5170220d4c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5551-f8b0-0189-c89546be4c79	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5551-f8b0-fb11-b6ee31f451ac	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5551-f8b0-09bc-129b9952afb9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5551-f8b0-fe08-2fb140357e98	SD	SDN	729	Sudan 	Sudan	\N
00040000-5551-f8b0-2400-bb8ae5aa3d6c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5551-f8b0-381c-2feec4ffa09f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5551-f8b0-2292-94d9e7c4a7da	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5551-f8b0-7870-aedb19a3ec04	SE	SWE	752	Sweden 	Švedska	\N
00040000-5551-f8b0-d97c-65076abe54f5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5551-f8b0-ef50-37942f3360e3	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5551-f8b0-d03a-ed2bee3c3b11	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5551-f8b0-2203-66ce2e190e2e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5551-f8b0-3ecc-47760758e921	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5551-f8b0-0951-e53ea0385960	TH	THA	764	Thailand 	Tajska	\N
00040000-5551-f8b0-98a9-d30be70d5ab3	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5551-f8b0-c69b-dc1f6452a100	TG	TGO	768	Togo 	Togo	\N
00040000-5551-f8b0-f850-ef5b471ae251	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5551-f8b0-2f28-41459c3e5576	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5551-f8b0-7d03-c2f37de3aaf6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5551-f8b0-b97f-5a25e91ab9a7	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5551-f8b0-7c4d-856d9535f776	TR	TUR	792	Turkey 	Turčija	\N
00040000-5551-f8b0-01f7-4e8299351dca	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5551-f8b0-b794-2fb313141065	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-f8b0-c20e-18f22a5ce87f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5551-f8b0-c699-b875c303460c	UG	UGA	800	Uganda 	Uganda	\N
00040000-5551-f8b0-a9a6-a0494992cb9e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5551-f8b0-6918-0f403851d5fb	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5551-f8b0-547c-d4f1118289e8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5551-f8b0-c257-9692c97a52b5	US	USA	840	United States 	Združene države Amerike	\N
00040000-5551-f8b0-a8c7-86e46d3b668b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5551-f8b0-3ab6-d6b5195c7b29	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5551-f8b0-f7ea-ae8ee0896ea4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5551-f8b0-09be-eebe2d6019a1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5551-f8b0-a690-2ad8b39dda95	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5551-f8b0-0840-dc6702c2f5c3	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5551-f8b0-9f86-f98172f37f0e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-f8b0-95b9-9c3986b12026	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5551-f8b0-eade-06439f2b2d90	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5551-f8b0-059c-011f21257371	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5551-f8b0-8530-a5da8d4d5bda	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5551-f8b0-28d5-583af84333a0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5551-f8b0-e5c3-74a094cfe101	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2673 (class 0 OID 3191932)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3191753)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3191801)
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
-- TOC entry 2662 (class 0 OID 3191850)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3191875)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3191702)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5551-f8b0-f6e3-e352077cfa69	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5551-f8b0-1e96-406050e65b1b	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5551-f8b0-922f-24b92f806729	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5551-f8b0-e419-da4d467c7fc5	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5551-f8b0-6410-9a5da6abb2c5	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5551-f8b0-f5ed-fad860ebf52e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5551-f8b0-cdc6-a2545555d740	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5551-f8b0-cb87-3cfdf830a844	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5551-f8b0-2458-7ae3a89ec56f	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5551-f8b0-1028-9ebd03875ace	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2641 (class 0 OID 3191610)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5551-f8b0-f3d6-4fea13131662	00000000-5551-f8b0-6410-9a5da6abb2c5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5551-f8b0-7b67-26e784b43303	00000000-5551-f8b0-6410-9a5da6abb2c5	00010000-5551-f8b0-0f12-be63d68b04e3	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5551-f8b0-16b6-42bf07a94eec	00000000-5551-f8b0-f5ed-fad860ebf52e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2642 (class 0 OID 3191621)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3191672)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 3191575)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5551-f8b0-303c-00413c69d9f5	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5551-f8b0-88de-5637764b7857	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5551-f8b0-0f09-1684328b60bc	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5551-f8b0-5130-f188f830bd5b	Abonma-read	Abonma - branje	f
00030000-5551-f8b0-3934-cda1e03f21c8	Abonma-write	Abonma - spreminjanje	f
00030000-5551-f8b0-f50a-39b9a193f76e	Alternacija-read	Alternacija - branje	f
00030000-5551-f8b0-dba9-056249b92348	Alternacija-write	Alternacija - spreminjanje	f
00030000-5551-f8b0-7d0b-9a81ca2e5451	Arhivalija-read	Arhivalija - branje	f
00030000-5551-f8b0-aeff-8923e62e1955	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5551-f8b0-6ae0-542396816c25	Besedilo-read	Besedilo - branje	f
00030000-5551-f8b0-247d-7c4041dd62a8	Besedilo-write	Besedilo - spreminjanje	f
00030000-5551-f8b0-52f0-e5b6942a3eb1	DogodekIzven-read	DogodekIzven - branje	f
00030000-5551-f8b0-bee5-5090d7cdc6dc	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5551-f8b0-82ce-846039d282e8	Dogodek-read	Dogodek - branje	f
00030000-5551-f8b0-80d8-3422e0931f25	Dogodek-write	Dogodek - spreminjanje	f
00030000-5551-f8b0-231a-5bf1366a7a01	Drzava-read	Drzava - branje	f
00030000-5551-f8b0-e683-bf2c74ce854b	Drzava-write	Drzava - spreminjanje	f
00030000-5551-f8b0-a5f8-0a69a533527c	Funkcija-read	Funkcija - branje	f
00030000-5551-f8b0-6cdb-a2ea11e14a3c	Funkcija-write	Funkcija - spreminjanje	f
00030000-5551-f8b0-6808-90f4ad96e2ca	Gostovanje-read	Gostovanje - branje	f
00030000-5551-f8b0-a171-c75958e3b55e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5551-f8b0-22a6-dc193ece21dc	Gostujoca-read	Gostujoca - branje	f
00030000-5551-f8b0-0087-ca2a5aa8950f	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5551-f8b0-a59a-ab6f3fa50d21	Kupec-read	Kupec - branje	f
00030000-5551-f8b0-7c97-fc61280bfc30	Kupec-write	Kupec - spreminjanje	f
00030000-5551-f8b0-e9a4-7cf3d9b2fad2	NacinPlacina-read	NacinPlacina - branje	f
00030000-5551-f8b0-3081-ca1c7acf8251	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5551-f8b0-367d-0f8b083bc0a3	Option-read	Option - branje	f
00030000-5551-f8b0-0f40-f49b7dc71c72	Option-write	Option - spreminjanje	f
00030000-5551-f8b0-f0ab-9d5ae108f1b2	OptionValue-read	OptionValue - branje	f
00030000-5551-f8b0-0c85-d1070d393146	OptionValue-write	OptionValue - spreminjanje	f
00030000-5551-f8b0-675c-b08ce04adbfb	Oseba-read	Oseba - branje	f
00030000-5551-f8b0-b491-5577436c1f81	Oseba-write	Oseba - spreminjanje	f
00030000-5551-f8b0-5c7d-9d0c98b334f0	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5551-f8b0-4162-400b182bc9f0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5551-f8b0-bb97-d1aae8888b23	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5551-f8b0-933a-a4aa427dbc67	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5551-f8b0-4b42-c88c88d664e0	Pogodba-read	Pogodba - branje	f
00030000-5551-f8b0-a5e2-83049170131e	Pogodba-write	Pogodba - spreminjanje	f
00030000-5551-f8b0-0890-0759246a92e2	Popa-read	Popa - branje	f
00030000-5551-f8b0-d6ba-a40ce2641eb7	Popa-write	Popa - spreminjanje	f
00030000-5551-f8b0-8c74-80933ec72d1f	Posta-read	Posta - branje	f
00030000-5551-f8b0-3224-33b00072d722	Posta-write	Posta - spreminjanje	f
00030000-5551-f8b0-4d6c-767e2a08e258	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5551-f8b0-aa81-794d767130d2	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5551-f8b0-d333-2e6544e30d52	PostniNaslov-read	PostniNaslov - branje	f
00030000-5551-f8b0-a857-f4ccf4eb31cf	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5551-f8b0-323e-662cbfc69a69	Predstava-read	Predstava - branje	f
00030000-5551-f8b0-af22-578c40d19dc1	Predstava-write	Predstava - spreminjanje	f
00030000-5551-f8b0-2e5b-439b289247d0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5551-f8b0-fbdb-d5fd229b20d3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5551-f8b0-38f7-0ce5a42c1dca	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5551-f8b0-a129-f6d96036a58a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5551-f8b0-d68b-ee3f009ffc52	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5551-f8b0-ff8e-6a0011f71bbf	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5551-f8b0-6187-439365099bec	Prostor-read	Prostor - branje	f
00030000-5551-f8b0-6927-15799f97c5e9	Prostor-write	Prostor - spreminjanje	f
00030000-5551-f8b0-d901-9a4d97e02f98	Racun-read	Racun - branje	f
00030000-5551-f8b0-2409-e8242404df8b	Racun-write	Racun - spreminjanje	f
00030000-5551-f8b0-277e-ab8f03d49a31	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5551-f8b0-a8ef-b6686d80f9f5	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5551-f8b0-c45d-523ec0b69f4f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5551-f8b0-1f05-f367438ba9ce	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5551-f8b0-d5f6-b92c763b4524	Rekvizit-read	Rekvizit - branje	f
00030000-5551-f8b0-7e1f-7e91831e25aa	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5551-f8b0-c9c6-cf43498638f5	Rezervacija-read	Rezervacija - branje	f
00030000-5551-f8b0-0c32-de8eac45ad48	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5551-f8b0-3d77-7df5566839b6	SedezniRed-read	SedezniRed - branje	f
00030000-5551-f8b0-e0c5-780e936fb76a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5551-f8b0-c00f-ac5709c4de3d	Sedez-read	Sedez - branje	f
00030000-5551-f8b0-7f55-f53a8b5fe815	Sedez-write	Sedez - spreminjanje	f
00030000-5551-f8b0-68ed-02e370beebf4	Sezona-read	Sezona - branje	f
00030000-5551-f8b0-8379-617cabfbbda9	Sezona-write	Sezona - spreminjanje	f
00030000-5551-f8b0-7173-a023b5a5fcc4	Telefonska-read	Telefonska - branje	f
00030000-5551-f8b0-5a4f-aeb5bead1395	Telefonska-write	Telefonska - spreminjanje	f
00030000-5551-f8b0-6e2c-073dcb74a609	TerminStoritve-read	TerminStoritve - branje	f
00030000-5551-f8b0-e27d-f3f0f02a2045	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5551-f8b0-ab3b-bf7da708097d	TipFunkcije-read	TipFunkcije - branje	f
00030000-5551-f8b0-0a63-6bc057e412d5	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5551-f8b0-1730-5ff554bb8927	Trr-read	Trr - branje	f
00030000-5551-f8b0-85ee-d32559a285b6	Trr-write	Trr - spreminjanje	f
00030000-5551-f8b0-b150-607e7530e251	Uprizoritev-read	Uprizoritev - branje	f
00030000-5551-f8b0-a299-8ecdbb20edfe	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5551-f8b0-b2ce-bd706c2ee8b2	Vaja-read	Vaja - branje	f
00030000-5551-f8b0-8aee-79510a9a7ac6	Vaja-write	Vaja - spreminjanje	f
00030000-5551-f8b0-5067-dd3806e524fa	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5551-f8b0-ff6b-2cebaac8af5d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5551-f8b0-8d59-30171e7f9f17	Zaposlitev-read	Zaposlitev - branje	f
00030000-5551-f8b0-e584-639fda1136a2	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5551-f8b0-7f5d-3f42c78d087b	Zasedenost-read	Zasedenost - branje	f
00030000-5551-f8b0-1b28-7371ae02cca2	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5551-f8b0-584f-81fbaf14f8ea	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5551-f8b0-9a3b-14c68a20419d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5551-f8b0-a70c-990c82ce6b6f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5551-f8b0-7f49-e98fffc2fb35	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2639 (class 0 OID 3191594)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5551-f8b0-0ede-a6b430adcc56	00030000-5551-f8b0-231a-5bf1366a7a01
00020000-5551-f8b0-e9f0-bd7455b3a271	00030000-5551-f8b0-e683-bf2c74ce854b
00020000-5551-f8b0-e9f0-bd7455b3a271	00030000-5551-f8b0-231a-5bf1366a7a01
\.


--
-- TOC entry 2667 (class 0 OID 3191882)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3191912)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3192027)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3191652)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3191694)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5551-f8b0-079e-c6abc4bdbe77	8341	Adlešiči
00050000-5551-f8b0-4105-f214481cad32	5270	Ajdovščina
00050000-5551-f8b0-e805-f2258236d37d	6280	Ankaran/Ancarano
00050000-5551-f8b0-7853-5a4658dcfa19	9253	Apače
00050000-5551-f8b0-c53f-195c88120fad	8253	Artiče
00050000-5551-f8b0-83e4-47ea3716909d	4275	Begunje na Gorenjskem
00050000-5551-f8b0-d5f9-c406c8176aac	1382	Begunje pri Cerknici
00050000-5551-f8b0-8627-eb4c683532f2	9231	Beltinci
00050000-5551-f8b0-677e-a8ea31184d42	2234	Benedikt
00050000-5551-f8b0-6a0f-3cf91905ad71	2345	Bistrica ob Dravi
00050000-5551-f8b0-79b2-3c96312fd347	3256	Bistrica ob Sotli
00050000-5551-f8b0-6ea8-3a156716fecf	8259	Bizeljsko
00050000-5551-f8b0-bb00-62b1fc515ae4	1223	Blagovica
00050000-5551-f8b0-4dd8-3127c2804f71	8283	Blanca
00050000-5551-f8b0-9217-9bfafd817320	4260	Bled
00050000-5551-f8b0-0e33-127cd26e7124	4273	Blejska Dobrava
00050000-5551-f8b0-d0db-f827ee9d5d8a	9265	Bodonci
00050000-5551-f8b0-16af-42825ad2272f	9222	Bogojina
00050000-5551-f8b0-2700-d9b7c8616e4f	4263	Bohinjska Bela
00050000-5551-f8b0-ee0e-d2f9483656ad	4264	Bohinjska Bistrica
00050000-5551-f8b0-2c2e-541db2ed48f8	4265	Bohinjsko jezero
00050000-5551-f8b0-acf6-0c8e6d9bca5f	1353	Borovnica
00050000-5551-f8b0-e659-a7cd516a20eb	8294	Boštanj
00050000-5551-f8b0-6f3c-fe0b5a7343f5	5230	Bovec
00050000-5551-f8b0-6cea-b9176f3db199	5295	Branik
00050000-5551-f8b0-c35c-7a2f0b2482ff	3314	Braslovče
00050000-5551-f8b0-f9ba-d97e9d259a5e	5223	Breginj
00050000-5551-f8b0-625a-a6d90c0a431a	8280	Brestanica
00050000-5551-f8b0-67b7-ee101e25966e	2354	Bresternica
00050000-5551-f8b0-68b3-d61f6b15ba2c	4243	Brezje
00050000-5551-f8b0-835e-e431f51638d0	1351	Brezovica pri Ljubljani
00050000-5551-f8b0-467f-99701e61c494	8250	Brežice
00050000-5551-f8b0-58d8-9deac92d5ce3	4210	Brnik - Aerodrom
00050000-5551-f8b0-48c6-7a5ba28670f6	8321	Brusnice
00050000-5551-f8b0-28b1-0d6005043146	3255	Buče
00050000-5551-f8b0-f8cc-124ef72bdad6	8276	Bučka 
00050000-5551-f8b0-1acc-600a37539bdf	9261	Cankova
00050000-5551-f8b0-c546-e38f67788b87	3000	Celje 
00050000-5551-f8b0-60a4-a4722f96899e	3001	Celje - poštni predali
00050000-5551-f8b0-4946-012335f2908b	4207	Cerklje na Gorenjskem
00050000-5551-f8b0-c00a-cacfd33fd0d0	8263	Cerklje ob Krki
00050000-5551-f8b0-1d3f-1cc24802f606	1380	Cerknica
00050000-5551-f8b0-adeb-da145b6adc91	5282	Cerkno
00050000-5551-f8b0-60e6-7a8f6a3fc909	2236	Cerkvenjak
00050000-5551-f8b0-3ec7-c419555069a8	2215	Ceršak
00050000-5551-f8b0-cbe4-3448dad6511f	2326	Cirkovce
00050000-5551-f8b0-dca5-2c8bdf717d73	2282	Cirkulane
00050000-5551-f8b0-490a-0598d13775c4	5273	Col
00050000-5551-f8b0-8896-aeb58f137b43	8251	Čatež ob Savi
00050000-5551-f8b0-807c-1add28031a54	1413	Čemšenik
00050000-5551-f8b0-1bd3-c6a284632363	5253	Čepovan
00050000-5551-f8b0-c483-f950040f6c9b	9232	Črenšovci
00050000-5551-f8b0-d710-a58989d22ebf	2393	Črna na Koroškem
00050000-5551-f8b0-74a8-a08c6699b2f6	6275	Črni Kal
00050000-5551-f8b0-e821-2c0a914e6775	5274	Črni Vrh nad Idrijo
00050000-5551-f8b0-5386-2692327ca291	5262	Črniče
00050000-5551-f8b0-a96a-b53ca06b594f	8340	Črnomelj
00050000-5551-f8b0-1824-b923edae7507	6271	Dekani
00050000-5551-f8b0-e4b4-49f1a19a3cbe	5210	Deskle
00050000-5551-f8b0-1fc3-2ecf853e9fcd	2253	Destrnik
00050000-5551-f8b0-f91c-8b3ea9eac9d6	6215	Divača
00050000-5551-f8b0-4fdd-d1de1ba84c1a	1233	Dob
00050000-5551-f8b0-c0a6-105f5146fad6	3224	Dobje pri Planini
00050000-5551-f8b0-bde9-0bdbbe4b6a20	8257	Dobova
00050000-5551-f8b0-5ff1-fbea131c2e3c	1423	Dobovec
00050000-5551-f8b0-3c6b-e91a4e4f843f	5263	Dobravlje
00050000-5551-f8b0-c17b-2e2963673013	3204	Dobrna
00050000-5551-f8b0-b78b-d6c2c24ace3b	8211	Dobrnič
00050000-5551-f8b0-b5a9-459a86cfa924	1356	Dobrova
00050000-5551-f8b0-e2d2-f2e83d8a6c3f	9223	Dobrovnik/Dobronak 
00050000-5551-f8b0-4850-d84a9c3dd7c6	5212	Dobrovo v Brdih
00050000-5551-f8b0-ee3d-c83fe3281710	1431	Dol pri Hrastniku
00050000-5551-f8b0-2c49-a1c89c648459	1262	Dol pri Ljubljani
00050000-5551-f8b0-bdcd-cec60b736fda	1273	Dole pri Litiji
00050000-5551-f8b0-03d9-868d83b73e31	1331	Dolenja vas
00050000-5551-f8b0-2efe-25b3abe0dc06	8350	Dolenjske Toplice
00050000-5551-f8b0-f800-4504d6effc5e	1230	Domžale
00050000-5551-f8b0-b55b-c8823371b09a	2252	Dornava
00050000-5551-f8b0-1fb9-3f7a2e26eb59	5294	Dornberk
00050000-5551-f8b0-0886-2e9bcb3ec2f9	1319	Draga
00050000-5551-f8b0-098b-30746e0232a8	8343	Dragatuš
00050000-5551-f8b0-c274-3cb4cde657f7	3222	Dramlje
00050000-5551-f8b0-9a30-377e1b35bb0d	2370	Dravograd
00050000-5551-f8b0-3af7-de6b1838b957	4203	Duplje
00050000-5551-f8b0-3e59-c8bea02ad609	6221	Dutovlje
00050000-5551-f8b0-5418-c998af172909	8361	Dvor
00050000-5551-f8b0-62ff-3bba18444545	2343	Fala
00050000-5551-f8b0-686a-87c41126669a	9208	Fokovci
00050000-5551-f8b0-8b39-ea9a095e3268	2313	Fram
00050000-5551-f8b0-44d4-5cc098d848ae	3213	Frankolovo
00050000-5551-f8b0-5d7f-bbb98f2d1fdd	1274	Gabrovka
00050000-5551-f8b0-eb74-a5366bfba6e3	8254	Globoko
00050000-5551-f8b0-53df-2f0e3b6cd3a6	5275	Godovič
00050000-5551-f8b0-c66d-ad7902c42204	4204	Golnik
00050000-5551-f8b0-3f87-9a5f38a23238	3303	Gomilsko
00050000-5551-f8b0-2894-ced2f31dbaf9	4224	Gorenja vas
00050000-5551-f8b0-d184-86986e08d5d2	3263	Gorica pri Slivnici
00050000-5551-f8b0-60a5-790459ef0138	2272	Gorišnica
00050000-5551-f8b0-8eb4-9dad0915e106	9250	Gornja Radgona
00050000-5551-f8b0-57ee-70e61af16691	3342	Gornji Grad
00050000-5551-f8b0-f0fc-429e6564c522	4282	Gozd Martuljek
00050000-5551-f8b0-e928-3227eed83d78	6272	Gračišče
00050000-5551-f8b0-8a0a-a6e10ee5cf8f	9264	Grad
00050000-5551-f8b0-81d0-572220f856ee	8332	Gradac
00050000-5551-f8b0-7985-4a94e7ca4389	1384	Grahovo
00050000-5551-f8b0-8c40-aea7b72ea623	5242	Grahovo ob Bači
00050000-5551-f8b0-7f84-81d862ecd07a	5251	Grgar
00050000-5551-f8b0-6606-c34d5810e31a	3302	Griže
00050000-5551-f8b0-c61a-b9118515a771	3231	Grobelno
00050000-5551-f8b0-0b41-56a6bfa872ca	1290	Grosuplje
00050000-5551-f8b0-5cec-ed377c830c70	2288	Hajdina
00050000-5551-f8b0-3824-27febe7cf3d4	8362	Hinje
00050000-5551-f8b0-2d2c-42b1397db803	2311	Hoče
00050000-5551-f8b0-89b2-08e7bd6ddbd0	9205	Hodoš/Hodos
00050000-5551-f8b0-1da2-481dbe82ce55	1354	Horjul
00050000-5551-f8b0-1b7b-653e77b021b3	1372	Hotedršica
00050000-5551-f8b0-7b9f-7b4a99af9c65	1430	Hrastnik
00050000-5551-f8b0-a2e3-e247500ef514	6225	Hruševje
00050000-5551-f8b0-730c-3374c81ba3f9	4276	Hrušica
00050000-5551-f8b0-70ba-e11023dc9428	5280	Idrija
00050000-5551-f8b0-6ef6-063ae74b0e6e	1292	Ig
00050000-5551-f8b0-5453-830efe883855	6250	Ilirska Bistrica
00050000-5551-f8b0-456b-ea8f95f48ef9	6251	Ilirska Bistrica-Trnovo
00050000-5551-f8b0-f88c-3caaaba5811a	1295	Ivančna Gorica
00050000-5551-f8b0-ea09-a5f4373c2b3a	2259	Ivanjkovci
00050000-5551-f8b0-371d-e22ffbf544a9	1411	Izlake
00050000-5551-f8b0-1214-e909ff79b523	6310	Izola/Isola
00050000-5551-f8b0-086a-64bff3b2492f	2222	Jakobski Dol
00050000-5551-f8b0-5635-df1001d063d1	2221	Jarenina
00050000-5551-f8b0-737b-cdab39acd4ab	6254	Jelšane
00050000-5551-f8b0-3036-353adaf4a6af	4270	Jesenice
00050000-5551-f8b0-3759-e1bb8d9209ca	8261	Jesenice na Dolenjskem
00050000-5551-f8b0-7e5a-a0467873c1f2	3273	Jurklošter
00050000-5551-f8b0-e9a6-8aa527c39b35	2223	Jurovski Dol
00050000-5551-f8b0-0c9a-fed6375b33b2	2256	Juršinci
00050000-5551-f8b0-b706-c784363e3dc4	5214	Kal nad Kanalom
00050000-5551-f8b0-4728-083e2572b708	3233	Kalobje
00050000-5551-f8b0-0b9b-f4c2ea830cb0	4246	Kamna Gorica
00050000-5551-f8b0-3e72-b23a973d2e6c	2351	Kamnica
00050000-5551-f8b0-fe97-288c1ffa3bbd	1241	Kamnik
00050000-5551-f8b0-0008-1dda51f1486b	5213	Kanal
00050000-5551-f8b0-cb62-b063b88b7e99	8258	Kapele
00050000-5551-f8b0-17dc-b3f76b79c541	2362	Kapla
00050000-5551-f8b0-c96e-8b8e08e3b27c	2325	Kidričevo
00050000-5551-f8b0-2559-125c625830e8	1412	Kisovec
00050000-5551-f8b0-fb00-cb2a19f15255	6253	Knežak
00050000-5551-f8b0-560b-d34f2e427719	5222	Kobarid
00050000-5551-f8b0-4719-7d14f3e32038	9227	Kobilje
00050000-5551-f8b0-356a-cc12766d5bd4	1330	Kočevje
00050000-5551-f8b0-8924-1d41352b91a1	1338	Kočevska Reka
00050000-5551-f8b0-ff6d-6c3d20f3136b	2276	Kog
00050000-5551-f8b0-a882-d60f320e8248	5211	Kojsko
00050000-5551-f8b0-542d-0f94a9d890a3	6223	Komen
00050000-5551-f8b0-ce94-062430d4945c	1218	Komenda
00050000-5551-f8b0-e21c-ebb4c79498c0	6000	Koper/Capodistria 
00050000-5551-f8b0-3cc5-7003b810d1bd	6001	Koper/Capodistria - poštni predali
00050000-5551-f8b0-d26a-2956bafdf99b	8282	Koprivnica
00050000-5551-f8b0-1de3-db71d992f345	5296	Kostanjevica na Krasu
00050000-5551-f8b0-6d6c-7b3695afd818	8311	Kostanjevica na Krki
00050000-5551-f8b0-1577-7b618d29b566	1336	Kostel
00050000-5551-f8b0-1fda-6e53b9d4e215	6256	Košana
00050000-5551-f8b0-5a31-d18422a7d499	2394	Kotlje
00050000-5551-f8b0-3b78-20ac64c488a3	6240	Kozina
00050000-5551-f8b0-d48d-8632c92fa387	3260	Kozje
00050000-5551-f8b0-3b03-b1913099c242	4000	Kranj 
00050000-5551-f8b0-cbeb-1d05376a1a80	4001	Kranj - poštni predali
00050000-5551-f8b0-6216-806a8f52f0e9	4280	Kranjska Gora
00050000-5551-f8b0-6391-4b4deeddbab9	1281	Kresnice
00050000-5551-f8b0-87fa-a4fa7dc55e9d	4294	Križe
00050000-5551-f8b0-e64d-4271ee6e428d	9206	Križevci
00050000-5551-f8b0-8561-5f676d2b5393	9242	Križevci pri Ljutomeru
00050000-5551-f8b0-b63e-80c65ae195a0	1301	Krka
00050000-5551-f8b0-13e6-21000f7fc550	8296	Krmelj
00050000-5551-f8b0-4652-9b08a98d8350	4245	Kropa
00050000-5551-f8b0-69bf-003f0e469ba9	8262	Krška vas
00050000-5551-f8b0-4359-a10b826b6aeb	8270	Krško
00050000-5551-f8b0-a854-de469dddda81	9263	Kuzma
00050000-5551-f8b0-62cc-c15de06b3878	2318	Laporje
00050000-5551-f8b0-234c-e6a1330516cb	3270	Laško
00050000-5551-f8b0-4782-58efdb8308cb	1219	Laze v Tuhinju
00050000-5551-f8b0-678e-4df1919bc7c5	2230	Lenart v Slovenskih goricah
00050000-5551-f8b0-f875-5c0277f7f691	9220	Lendava/Lendva
00050000-5551-f8b0-c352-06958ee7bf5b	4248	Lesce
00050000-5551-f8b0-6429-2b8dc7066c14	3261	Lesično
00050000-5551-f8b0-1a66-c89b4153a30d	8273	Leskovec pri Krškem
00050000-5551-f8b0-d7f6-eae7c4e95c0c	2372	Libeliče
00050000-5551-f8b0-2a35-cd791f8bb42f	2341	Limbuš
00050000-5551-f8b0-90a2-925bfde9cfad	1270	Litija
00050000-5551-f8b0-b7e8-db1f172accca	3202	Ljubečna
00050000-5551-f8b0-f23f-82c4f0951516	1000	Ljubljana 
00050000-5551-f8b0-d1b2-2d19acf81928	1001	Ljubljana - poštni predali
00050000-5551-f8b0-6bb9-35efe3c39c7e	1231	Ljubljana - Črnuče
00050000-5551-f8b0-578a-9f02bb4267f5	1261	Ljubljana - Dobrunje
00050000-5551-f8b0-4770-53a617620c93	1260	Ljubljana - Polje
00050000-5551-f8b0-1272-44c1902ec937	1210	Ljubljana - Šentvid
00050000-5551-f8b0-9aea-0f9389d00c15	1211	Ljubljana - Šmartno
00050000-5551-f8b0-c041-fe5834ca6bd9	3333	Ljubno ob Savinji
00050000-5551-f8b0-9138-4c79fd604641	9240	Ljutomer
00050000-5551-f8b0-6ab6-99a12941853f	3215	Loče
00050000-5551-f8b0-3c19-c0c1ff31d04b	5231	Log pod Mangartom
00050000-5551-f8b0-fa3b-3483c713674e	1358	Log pri Brezovici
00050000-5551-f8b0-5a82-e1e7a0fa047d	1370	Logatec
00050000-5551-f8b0-2c25-62f13fadbf9a	1371	Logatec
00050000-5551-f8b0-01de-24612d60df66	1434	Loka pri Zidanem Mostu
00050000-5551-f8b0-96d8-086af5dd5d94	3223	Loka pri Žusmu
00050000-5551-f8b0-a0c6-1e25d76fd2ff	6219	Lokev
00050000-5551-f8b0-cf0b-bb62de7d1781	1318	Loški Potok
00050000-5551-f8b0-ce06-06fcf2c6005d	2324	Lovrenc na Dravskem polju
00050000-5551-f8b0-31f4-b618f10ed944	2344	Lovrenc na Pohorju
00050000-5551-f8b0-f213-6961cc478c96	3334	Luče
00050000-5551-f8b0-f690-5a5691574e63	1225	Lukovica
00050000-5551-f8b0-63ac-96ad4e256106	9202	Mačkovci
00050000-5551-f8b0-2340-b3a82aa261aa	2322	Majšperk
00050000-5551-f8b0-6794-cb8ca415da27	2321	Makole
00050000-5551-f8b0-b52a-8cb4237c8eb3	9243	Mala Nedelja
00050000-5551-f8b0-6cb9-a8a4a10731ec	2229	Malečnik
00050000-5551-f8b0-b8df-070d6331a9c7	6273	Marezige
00050000-5551-f8b0-92a2-9015cda2d53a	2000	Maribor 
00050000-5551-f8b0-c26a-5062a36bc04c	2001	Maribor - poštni predali
00050000-5551-f8b0-3f37-11ec4a2c1c9c	2206	Marjeta na Dravskem polju
00050000-5551-f8b0-ba32-e857bfb028da	2281	Markovci
00050000-5551-f8b0-846f-b66ec51a5cf3	9221	Martjanci
00050000-5551-f8b0-5769-f97de03a6f1d	6242	Materija
00050000-5551-f8b0-d4eb-e833f11199ee	4211	Mavčiče
00050000-5551-f8b0-83dc-2b415047436c	1215	Medvode
00050000-5551-f8b0-7b3b-045a2fc0e242	1234	Mengeš
00050000-5551-f8b0-eb7d-43287ab978a2	8330	Metlika
00050000-5551-f8b0-9a25-19c7251dc0e8	2392	Mežica
00050000-5551-f8b0-dfcc-972b89dbcf42	2204	Miklavž na Dravskem polju
00050000-5551-f8b0-ed93-abae681c7e5b	2275	Miklavž pri Ormožu
00050000-5551-f8b0-db0a-2b77da3d41be	5291	Miren
00050000-5551-f8b0-8fb3-648fe9530a47	8233	Mirna
00050000-5551-f8b0-b55e-97864fbfac59	8216	Mirna Peč
00050000-5551-f8b0-9e84-0ac4653fe7b2	2382	Mislinja
00050000-5551-f8b0-a3f6-e51de8488969	4281	Mojstrana
00050000-5551-f8b0-5b58-4680bb38a5ae	8230	Mokronog
00050000-5551-f8b0-dae2-08147214dba8	1251	Moravče
00050000-5551-f8b0-cf55-c60d09739691	9226	Moravske Toplice
00050000-5551-f8b0-71e8-975e64c10c89	5216	Most na Soči
00050000-5551-f8b0-b6cf-4ebd90a34496	1221	Motnik
00050000-5551-f8b0-cce5-00f6f64bd34a	3330	Mozirje
00050000-5551-f8b0-bb1c-6cb7232e1e3f	9000	Murska Sobota 
00050000-5551-f8b0-124a-5025f6d121b3	9001	Murska Sobota - poštni predali
00050000-5551-f8b0-3e8e-4ed3f5b9c4d5	2366	Muta
00050000-5551-f8b0-7750-10819460e584	4202	Naklo
00050000-5551-f8b0-ea50-c1244d7bcdc5	3331	Nazarje
00050000-5551-f8b0-6c36-1fbf5458ca80	1357	Notranje Gorice
00050000-5551-f8b0-10bf-b6c777e2dab8	3203	Nova Cerkev
00050000-5551-f8b0-bb6e-bddd11fb6218	5000	Nova Gorica 
00050000-5551-f8b0-67ba-0ebbe159bf20	5001	Nova Gorica - poštni predali
00050000-5551-f8b0-a7b3-bd362e3c4f41	1385	Nova vas
00050000-5551-f8b0-b8f3-4b8d0c8eedaf	8000	Novo mesto
00050000-5551-f8b0-9cb0-391aa88c5e4f	8001	Novo mesto - poštni predali
00050000-5551-f8b0-65f0-d94765b681c1	6243	Obrov
00050000-5551-f8b0-261c-0553a6222098	9233	Odranci
00050000-5551-f8b0-4968-4ed3cc1f8ce7	2317	Oplotnica
00050000-5551-f8b0-8fb9-da6a9009add3	2312	Orehova vas
00050000-5551-f8b0-50a0-e49df3b922c7	2270	Ormož
00050000-5551-f8b0-1137-0aa169e3a833	1316	Ortnek
00050000-5551-f8b0-eab2-9b6f7ce26853	1337	Osilnica
00050000-5551-f8b0-6c93-9cf2c968e0b0	8222	Otočec
00050000-5551-f8b0-3da1-d52004eb5951	2361	Ožbalt
00050000-5551-f8b0-63cf-d07f9aa769b8	2231	Pernica
00050000-5551-f8b0-b0d4-a3e07c17ac02	2211	Pesnica pri Mariboru
00050000-5551-f8b0-6cc6-04b670163291	9203	Petrovci
00050000-5551-f8b0-8bb8-ff59a2517c60	3301	Petrovče
00050000-5551-f8b0-3b24-cbeb4bc6f2af	6330	Piran/Pirano
00050000-5551-f8b0-228f-94e0217b8b99	8255	Pišece
00050000-5551-f8b0-f2f9-30efe0e4e7fa	6257	Pivka
00050000-5551-f8b0-1580-7952b9437757	6232	Planina
00050000-5551-f8b0-58a7-8028eb4d8462	3225	Planina pri Sevnici
00050000-5551-f8b0-8c48-92dce2c37205	6276	Pobegi
00050000-5551-f8b0-406e-2664b1388cd6	8312	Podbočje
00050000-5551-f8b0-a31d-a01c8cac44d1	5243	Podbrdo
00050000-5551-f8b0-ecf1-5e840cf299f0	3254	Podčetrtek
00050000-5551-f8b0-65b1-15fda9d6a279	2273	Podgorci
00050000-5551-f8b0-887e-348ec5238014	6216	Podgorje
00050000-5551-f8b0-6f35-910affea1c80	2381	Podgorje pri Slovenj Gradcu
00050000-5551-f8b0-8c33-8c72b9ffaa33	6244	Podgrad
00050000-5551-f8b0-d633-9828af586a6d	1414	Podkum
00050000-5551-f8b0-ce78-7ff3dfbdd797	2286	Podlehnik
00050000-5551-f8b0-8857-537dabb76c69	5272	Podnanos
00050000-5551-f8b0-1334-3eeda1d5b958	4244	Podnart
00050000-5551-f8b0-e425-811ddee3341f	3241	Podplat
00050000-5551-f8b0-2981-cce5ec758a9f	3257	Podsreda
00050000-5551-f8b0-7564-376b1dca5f7b	2363	Podvelka
00050000-5551-f8b0-fb73-59b795f000a2	2208	Pohorje
00050000-5551-f8b0-4eba-b50f41eb7f93	2257	Polenšak
00050000-5551-f8b0-d869-eac620cf38b0	1355	Polhov Gradec
00050000-5551-f8b0-abb4-195fde3b5053	4223	Poljane nad Škofjo Loko
00050000-5551-f8b0-eb73-5a21e66673ab	2319	Poljčane
00050000-5551-f8b0-29ec-f1154199fd4c	1272	Polšnik
00050000-5551-f8b0-31f0-c1542cc5b6fb	3313	Polzela
00050000-5551-f8b0-123a-2663f67ea895	3232	Ponikva
00050000-5551-f8b0-f0ec-262637efde11	6320	Portorož/Portorose
00050000-5551-f8b0-34f0-1978c8e7d2f4	6230	Postojna
00050000-5551-f8b0-9dca-e135be2f5baa	2331	Pragersko
00050000-5551-f8b0-de2a-7595b62eb4fe	3312	Prebold
00050000-5551-f8b0-9ef2-cac8623cbbdd	4205	Preddvor
00050000-5551-f8b0-cefe-f9ee5d738091	6255	Prem
00050000-5551-f8b0-c1db-193552f97981	1352	Preserje
00050000-5551-f8b0-b033-6cf905e38388	6258	Prestranek
00050000-5551-f8b0-88e1-bc343b1e28f0	2391	Prevalje
00050000-5551-f8b0-bc50-a9e4acbb10d0	3262	Prevorje
00050000-5551-f8b0-ae21-9673c06c1e85	1276	Primskovo 
00050000-5551-f8b0-20be-c1fa90d53056	3253	Pristava pri Mestinju
00050000-5551-f8b0-3675-daccf642ac59	9207	Prosenjakovci/Partosfalva
00050000-5551-f8b0-3139-da60bb43170f	5297	Prvačina
00050000-5551-f8b0-82de-0c6e893eaec9	2250	Ptuj
00050000-5551-f8b0-f284-e2595b91aebd	2323	Ptujska Gora
00050000-5551-f8b0-b39e-2dab2403fad7	9201	Puconci
00050000-5551-f8b0-b796-0e8c3a98463f	2327	Rače
00050000-5551-f8b0-949e-8f9edb96a1b8	1433	Radeče
00050000-5551-f8b0-8f77-e51483f2c4d9	9252	Radenci
00050000-5551-f8b0-8e88-b5e7460592e9	2360	Radlje ob Dravi
00050000-5551-f8b0-8c4a-326485550ba9	1235	Radomlje
00050000-5551-f8b0-91fc-5b708faf2ffc	4240	Radovljica
00050000-5551-f8b0-091e-97d440f6969a	8274	Raka
00050000-5551-f8b0-d5da-235a9083bc9c	1381	Rakek
00050000-5551-f8b0-fc49-410ed5a845e3	4283	Rateče - Planica
00050000-5551-f8b0-3b47-2226f78dea5d	2390	Ravne na Koroškem
00050000-5551-f8b0-18bf-b9fe67e75302	9246	Razkrižje
00050000-5551-f8b0-4050-ff2a6560dcd3	3332	Rečica ob Savinji
00050000-5551-f8b0-be1e-0bcfe700694b	5292	Renče
00050000-5551-f8b0-cf51-f824b30db3f4	1310	Ribnica
00050000-5551-f8b0-d11c-991ec6ac4fdd	2364	Ribnica na Pohorju
00050000-5551-f8b0-b7ec-e92d1ae84c6b	3272	Rimske Toplice
00050000-5551-f8b0-1c0b-61c05edc4c09	1314	Rob
00050000-5551-f8b0-1f58-bf5d51485e82	5215	Ročinj
00050000-5551-f8b0-9cd8-cba4eb62b3e3	3250	Rogaška Slatina
00050000-5551-f8b0-97f6-6561477e6658	9262	Rogašovci
00050000-5551-f8b0-0fad-2139a6b8cd7a	3252	Rogatec
00050000-5551-f8b0-0256-b60b49677e76	1373	Rovte
00050000-5551-f8b0-47ec-1a7914d91636	2342	Ruše
00050000-5551-f8b0-d403-43d7409f3f0e	1282	Sava
00050000-5551-f8b0-755b-f005e88a5e01	6333	Sečovlje/Sicciole
00050000-5551-f8b0-5546-d411462b9feb	4227	Selca
00050000-5551-f8b0-20f9-6928370037d4	2352	Selnica ob Dravi
00050000-5551-f8b0-7b9d-d1612be1eed4	8333	Semič
00050000-5551-f8b0-e255-66c2f1b6f0fb	8281	Senovo
00050000-5551-f8b0-83ee-873f9022d65c	6224	Senožeče
00050000-5551-f8b0-642a-2f4e05fe9903	8290	Sevnica
00050000-5551-f8b0-6553-416ef95a5f4f	6210	Sežana
00050000-5551-f8b0-5465-a85601b8a5c3	2214	Sladki Vrh
00050000-5551-f8b0-5eb0-241591816f4e	5283	Slap ob Idrijci
00050000-5551-f8b0-8a0f-9fbcd97f5f11	2380	Slovenj Gradec
00050000-5551-f8b0-74e0-1b68e588f41a	2310	Slovenska Bistrica
00050000-5551-f8b0-146b-ebea5078a72b	3210	Slovenske Konjice
00050000-5551-f8b0-0682-6b2c5f577c69	1216	Smlednik
00050000-5551-f8b0-9c65-374b7a7da33c	5232	Soča
00050000-5551-f8b0-a546-e359024d1cd3	1317	Sodražica
00050000-5551-f8b0-5390-da2a3af9139c	3335	Solčava
00050000-5551-f8b0-f3a8-0fc2d243ad17	5250	Solkan
00050000-5551-f8b0-1202-eb56a0658f03	4229	Sorica
00050000-5551-f8b0-950f-cafe33da2016	4225	Sovodenj
00050000-5551-f8b0-b690-f3cb0c85e3cb	5281	Spodnja Idrija
00050000-5551-f8b0-a59e-0b93a11c75df	2241	Spodnji Duplek
00050000-5551-f8b0-2e60-9d86c71eefe1	9245	Spodnji Ivanjci
00050000-5551-f8b0-4991-1862c9dcf30c	2277	Središče ob Dravi
00050000-5551-f8b0-9bf5-88d0f9dbfb0a	4267	Srednja vas v Bohinju
00050000-5551-f8b0-1752-838ea49d046c	8256	Sromlje 
00050000-5551-f8b0-fb68-5a709f65644d	5224	Srpenica
00050000-5551-f8b0-a49a-f97c753788af	1242	Stahovica
00050000-5551-f8b0-a613-1afb71340790	1332	Stara Cerkev
00050000-5551-f8b0-3fd8-28fb52b7695e	8342	Stari trg ob Kolpi
00050000-5551-f8b0-0af4-1e9e8a2a3638	1386	Stari trg pri Ložu
00050000-5551-f8b0-6bec-6148545d6a75	2205	Starše
00050000-5551-f8b0-98f5-5a877f9f41c4	2289	Stoperce
00050000-5551-f8b0-a516-a828d7d2caa3	8322	Stopiče
00050000-5551-f8b0-72b8-b0a527ba086e	3206	Stranice
00050000-5551-f8b0-de60-133f381a9d52	8351	Straža
00050000-5551-f8b0-4311-55e46e3cb2fe	1313	Struge
00050000-5551-f8b0-bb91-f9b51bb25ac1	8293	Studenec
00050000-5551-f8b0-39e1-b106d64ad2c9	8331	Suhor
00050000-5551-f8b0-d6fc-da1d0e5d742f	2233	Sv. Ana v Slovenskih goricah
00050000-5551-f8b0-18e3-7ea31c7e870a	2235	Sv. Trojica v Slovenskih goricah
00050000-5551-f8b0-9152-d47f5a3d7d27	2353	Sveti Duh na Ostrem Vrhu
00050000-5551-f8b0-77ca-643d51961b9f	9244	Sveti Jurij ob Ščavnici
00050000-5551-f8b0-b999-c684f3bae89d	3264	Sveti Štefan
00050000-5551-f8b0-d796-b0f2b00eb773	2258	Sveti Tomaž
00050000-5551-f8b0-a658-e555811ef92b	9204	Šalovci
00050000-5551-f8b0-e4e6-7cec3596b26b	5261	Šempas
00050000-5551-f8b0-d764-6f8de1ff2856	5290	Šempeter pri Gorici
00050000-5551-f8b0-6912-59a66f3637d1	3311	Šempeter v Savinjski dolini
00050000-5551-f8b0-decc-968c270e7d0b	4208	Šenčur
00050000-5551-f8b0-26cf-27fbd5c9b468	2212	Šentilj v Slovenskih goricah
00050000-5551-f8b0-6575-303085c452cc	8297	Šentjanž
00050000-5551-f8b0-6028-39c6b9472ea7	2373	Šentjanž pri Dravogradu
00050000-5551-f8b0-9100-8866b00ca37d	8310	Šentjernej
00050000-5551-f8b0-5779-9ef5dbb2f6b9	3230	Šentjur
00050000-5551-f8b0-cda3-37cb36e9f777	3271	Šentrupert
00050000-5551-f8b0-fde0-d946a0ce99af	8232	Šentrupert
00050000-5551-f8b0-6f8f-72f991b2c282	1296	Šentvid pri Stični
00050000-5551-f8b0-938f-8099074a8190	8275	Škocjan
00050000-5551-f8b0-193b-2e722801f5d7	6281	Škofije
00050000-5551-f8b0-ce33-2e3cf46db9cc	4220	Škofja Loka
00050000-5551-f8b0-6442-408d8d1587b9	3211	Škofja vas
00050000-5551-f8b0-e224-03a60e753cfd	1291	Škofljica
00050000-5551-f8b0-bb7c-06a7fb4f81ec	6274	Šmarje
00050000-5551-f8b0-e390-1eee654c78ca	1293	Šmarje - Sap
00050000-5551-f8b0-6c09-e47d4a35b5ef	3240	Šmarje pri Jelšah
00050000-5551-f8b0-b7ce-9c5eaa8675a6	8220	Šmarješke Toplice
00050000-5551-f8b0-d001-bf788550633d	2315	Šmartno na Pohorju
00050000-5551-f8b0-880b-0769a8f32421	3341	Šmartno ob Dreti
00050000-5551-f8b0-a4b0-762ed5dfe7c4	3327	Šmartno ob Paki
00050000-5551-f8b0-855c-8856468b7f87	1275	Šmartno pri Litiji
00050000-5551-f8b0-4fd6-2c1940c03bd5	2383	Šmartno pri Slovenj Gradcu
00050000-5551-f8b0-2bf7-7158f95646cd	3201	Šmartno v Rožni dolini
00050000-5551-f8b0-a179-f52eafd17908	3325	Šoštanj
00050000-5551-f8b0-827f-0ae4563be214	6222	Štanjel
00050000-5551-f8b0-6821-91a521708dd9	3220	Štore
00050000-5551-f8b0-9a15-db508c4f1943	3304	Tabor
00050000-5551-f8b0-2dbd-5e3faf86fbb1	3221	Teharje
00050000-5551-f8b0-facd-db94c1381a84	9251	Tišina
00050000-5551-f8b0-af8f-56d2d7deafd9	5220	Tolmin
00050000-5551-f8b0-c0f9-6f193f78ea37	3326	Topolšica
00050000-5551-f8b0-7b65-0a9da1ebe68a	2371	Trbonje
00050000-5551-f8b0-2b06-18b3e2883926	1420	Trbovlje
00050000-5551-f8b0-59e2-89ac29776dac	8231	Trebelno 
00050000-5551-f8b0-2b82-bc9e517d6484	8210	Trebnje
00050000-5551-f8b0-bd1b-9fcfe805f155	5252	Trnovo pri Gorici
00050000-5551-f8b0-ae7c-b7f0980ec466	2254	Trnovska vas
00050000-5551-f8b0-c51c-9754d7dfe2c0	1222	Trojane
00050000-5551-f8b0-ac45-f452ea3a9039	1236	Trzin
00050000-5551-f8b0-3dc9-2671e1f86caf	4290	Tržič
00050000-5551-f8b0-4479-64b953351ad5	8295	Tržišče
00050000-5551-f8b0-89c4-3a051abf526b	1311	Turjak
00050000-5551-f8b0-e400-242212eaa0b8	9224	Turnišče
00050000-5551-f8b0-3f95-a4c2eab980db	8323	Uršna sela
00050000-5551-f8b0-1dab-52241c526e86	1252	Vače
00050000-5551-f8b0-ed2a-2aabf492c9d1	3320	Velenje 
00050000-5551-f8b0-88b6-f43305cd7d4c	3322	Velenje - poštni predali
00050000-5551-f8b0-4ee4-b3ca4eecf6c3	8212	Velika Loka
00050000-5551-f8b0-db0c-9948005bb868	2274	Velika Nedelja
00050000-5551-f8b0-5af8-abffcd0de471	9225	Velika Polana
00050000-5551-f8b0-5f80-b389d6e244ab	1315	Velike Lašče
00050000-5551-f8b0-bfa1-77dfe4bcdff8	8213	Veliki Gaber
00050000-5551-f8b0-1b63-5d8c114f6e76	9241	Veržej
00050000-5551-f8b0-9e8e-514391d83eca	1312	Videm - Dobrepolje
00050000-5551-f8b0-73d8-d8ffa85571ff	2284	Videm pri Ptuju
00050000-5551-f8b0-12b2-1b7ea9900648	8344	Vinica
00050000-5551-f8b0-f986-5c25d7f13ac5	5271	Vipava
00050000-5551-f8b0-abbe-46e678af2938	4212	Visoko
00050000-5551-f8b0-3e2f-0740aff46a4e	1294	Višnja Gora
00050000-5551-f8b0-4836-2aa4926a290f	3205	Vitanje
00050000-5551-f8b0-597f-7f3fcd29767d	2255	Vitomarci
00050000-5551-f8b0-5627-f59bebe3bdf9	1217	Vodice
00050000-5551-f8b0-1585-1bdfd14ff0f2	3212	Vojnik\t
00050000-5551-f8b0-e87c-b58e54729613	5293	Volčja Draga
00050000-5551-f8b0-7766-709094f21f7e	2232	Voličina
00050000-5551-f8b0-fb35-0e5a7d3da5ad	3305	Vransko
00050000-5551-f8b0-6d10-d7047a75cad7	6217	Vremski Britof
00050000-5551-f8b0-90b8-7729fbec53fc	1360	Vrhnika
00050000-5551-f8b0-a936-0ffe470d0a93	2365	Vuhred
00050000-5551-f8b0-005a-0fef24ad5677	2367	Vuzenica
00050000-5551-f8b0-36bc-6e334ade9af4	8292	Zabukovje 
00050000-5551-f8b0-95d9-6dfa2652c10d	1410	Zagorje ob Savi
00050000-5551-f8b0-2198-00a5ca12f494	1303	Zagradec
00050000-5551-f8b0-5d69-55e74b4f57b9	2283	Zavrč
00050000-5551-f8b0-70b2-0a60ad6ecd4d	8272	Zdole 
00050000-5551-f8b0-8d63-7fc2d2468ccc	4201	Zgornja Besnica
00050000-5551-f8b0-c04a-18921d4eb810	2242	Zgornja Korena
00050000-5551-f8b0-3637-8f86f4c1e68d	2201	Zgornja Kungota
00050000-5551-f8b0-d4d2-8c02d26dc272	2316	Zgornja Ložnica
00050000-5551-f8b0-cb21-a6285c6630b4	2314	Zgornja Polskava
00050000-5551-f8b0-6f05-061523d1fbfd	2213	Zgornja Velka
00050000-5551-f8b0-3445-218c1dc9ca2c	4247	Zgornje Gorje
00050000-5551-f8b0-4753-74709d7c5fe4	4206	Zgornje Jezersko
00050000-5551-f8b0-1892-4f3e973fc0c5	2285	Zgornji Leskovec
00050000-5551-f8b0-113c-fd6a693acc07	1432	Zidani Most
00050000-5551-f8b0-08c4-4c4a26930705	3214	Zreče
00050000-5551-f8b0-e2b4-010d1583d1a3	4209	Žabnica
00050000-5551-f8b0-1b0c-6caff4200911	3310	Žalec
00050000-5551-f8b0-1653-58880cfa423f	4228	Železniki
00050000-5551-f8b0-ebf6-4a79cd8ed4ca	2287	Žetale
00050000-5551-f8b0-4274-2c2431098ee8	4226	Žiri
00050000-5551-f8b0-fcf2-975a3f2eadd0	4274	Žirovnica
00050000-5551-f8b0-6764-5ca8857d1382	8360	Žužemberk
\.


--
-- TOC entry 2663 (class 0 OID 3191856)
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
-- TOC entry 2646 (class 0 OID 3191679)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3191745)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3191868)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3191973)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3192020)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 3191897)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3191841)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3191831)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3192010)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3191963)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3191546)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5551-f8b0-0f12-be63d68b04e3	00010000-5551-f8b0-f2eb-1933d8065d60	2015-05-12 14:57:21	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROL.s8VbdwcSVr684ranoPZQXPDXhQPVW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2670 (class 0 OID 3191906)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 3191584)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5551-f8b0-624c-fe0a9c620250	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5551-f8b0-d12f-240588424b90	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5551-f8b0-0ede-a6b430adcc56	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5551-f8b0-3d8c-e41e4ca2c037	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5551-f8b0-5c25-85338c15fef6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5551-f8b0-e9f0-bd7455b3a271	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2636 (class 0 OID 3191568)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5551-f8b0-0f12-be63d68b04e3	00020000-5551-f8b0-3d8c-e41e4ca2c037
00010000-5551-f8b0-f2eb-1933d8065d60	00020000-5551-f8b0-3d8c-e41e4ca2c037
\.


--
-- TOC entry 2672 (class 0 OID 3191920)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3191862)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3191812)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3191644)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3191818)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3191998)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3191714)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 3191555)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5551-f8b0-f2eb-1933d8065d60	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROBxQBe0FbnLiPMfrnm2YA2cCBmRkJ/6K	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5551-f8b0-0f12-be63d68b04e3	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2684 (class 0 OID 3192052)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3191760)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3191889)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3191955)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3191788)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3192042)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3191945)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2278 (class 2606 OID 3191609)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 3192092)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3192085)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3191997)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 3191778)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 3191811)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 3191740)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 3191941)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3191758)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3191805)
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
-- TOC entry 2368 (class 2606 OID 3191854)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3191881)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 3191712)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2282 (class 2606 OID 3191618)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 3191676)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2284 (class 2606 OID 3191642)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 3191598)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2269 (class 2606 OID 3191583)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3191887)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 3191919)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 3192037)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 3191669)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3191700)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 3191860)
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
-- TOC entry 2302 (class 2606 OID 3191690)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 3191749)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 3191872)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3191979)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 3192025)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3191904)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 3191845)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 3191836)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 3192019)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3191970)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 3191554)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 3191910)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 3191572)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2271 (class 2606 OID 3191592)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 3191928)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3191867)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 3191817)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 3191649)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 3191827)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3192009)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 3191725)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3191567)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 3192067)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 3191764)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 3191895)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3191961)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 3191800)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 3192051)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 3191954)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 1259 OID 3191785)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2290 (class 1259 OID 3191671)
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
-- TOC entry 2381 (class 1259 OID 3191888)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2375 (class 1259 OID 3191874)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2376 (class 1259 OID 3191873)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2327 (class 1259 OID 3191765)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 3191944)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2403 (class 1259 OID 3191942)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2404 (class 1259 OID 3191943)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2427 (class 1259 OID 3192039)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2428 (class 1259 OID 3192040)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 3192041)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2435 (class 1259 OID 3192070)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2436 (class 1259 OID 3192069)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2437 (class 1259 OID 3192068)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2309 (class 1259 OID 3191727)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2310 (class 1259 OID 3191726)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2294 (class 1259 OID 3191678)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3191677)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2390 (class 1259 OID 3191911)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2345 (class 1259 OID 3191806)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2273 (class 1259 OID 3191599)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2274 (class 1259 OID 3191600)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2395 (class 1259 OID 3191931)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2396 (class 1259 OID 3191930)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2397 (class 1259 OID 3191929)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2319 (class 1259 OID 3191750)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2320 (class 1259 OID 3191752)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2321 (class 1259 OID 3191751)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2355 (class 1259 OID 3191840)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2356 (class 1259 OID 3191838)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2357 (class 1259 OID 3191837)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2358 (class 1259 OID 3191839)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2264 (class 1259 OID 3191573)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2265 (class 1259 OID 3191574)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2384 (class 1259 OID 3191896)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2370 (class 1259 OID 3191861)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2410 (class 1259 OID 3191971)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2411 (class 1259 OID 3191972)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2298 (class 1259 OID 3191692)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2299 (class 1259 OID 3191691)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2300 (class 1259 OID 3191693)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 3191980)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2415 (class 1259 OID 3191981)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2446 (class 1259 OID 3192095)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 3192094)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2448 (class 1259 OID 3192097)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2449 (class 1259 OID 3192093)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2450 (class 1259 OID 3192096)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2407 (class 1259 OID 3191962)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2361 (class 1259 OID 3191849)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2362 (class 1259 OID 3191848)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2363 (class 1259 OID 3191846)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2364 (class 1259 OID 3191847)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2251 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2442 (class 1259 OID 3192087)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 3192086)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2326 (class 1259 OID 3191759)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2279 (class 1259 OID 3191620)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2280 (class 1259 OID 3191619)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2286 (class 1259 OID 3191650)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 3191651)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2350 (class 1259 OID 3191830)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2351 (class 1259 OID 3191829)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 3191828)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2333 (class 1259 OID 3191787)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2334 (class 1259 OID 3191783)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2335 (class 1259 OID 3191780)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2336 (class 1259 OID 3191781)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2337 (class 1259 OID 3191779)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2338 (class 1259 OID 3191784)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2339 (class 1259 OID 3191782)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2293 (class 1259 OID 3191670)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2315 (class 1259 OID 3191741)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2316 (class 1259 OID 3191743)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2317 (class 1259 OID 3191742)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2318 (class 1259 OID 3191744)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2369 (class 1259 OID 3191855)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2432 (class 1259 OID 3192038)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2285 (class 1259 OID 3191643)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2308 (class 1259 OID 3191713)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2389 (class 1259 OID 3191905)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2254 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 3191701)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2426 (class 1259 OID 3192026)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2272 (class 1259 OID 3191593)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2340 (class 1259 OID 3191786)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2475 (class 2606 OID 3192228)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2478 (class 2606 OID 3192213)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2477 (class 2606 OID 3192218)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2473 (class 2606 OID 3192238)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2479 (class 2606 OID 3192208)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2474 (class 2606 OID 3192233)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2476 (class 2606 OID 3192223)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2460 (class 2606 OID 3192143)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2496 (class 2606 OID 3192323)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2494 (class 2606 OID 3192318)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2495 (class 2606 OID 3192313)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2472 (class 2606 OID 3192203)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2502 (class 2606 OID 3192363)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2504 (class 2606 OID 3192353)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2503 (class 2606 OID 3192358)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2492 (class 2606 OID 3192303)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 3192398)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 3192403)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 3192408)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2514 (class 2606 OID 3192423)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2515 (class 2606 OID 3192418)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2516 (class 2606 OID 3192413)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2466 (class 2606 OID 3192178)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2467 (class 2606 OID 3192173)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 3192153)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 3192148)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3192128)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2498 (class 2606 OID 3192333)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2480 (class 2606 OID 3192243)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2454 (class 2606 OID 3192108)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2453 (class 2606 OID 3192113)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2499 (class 2606 OID 3192348)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2500 (class 2606 OID 3192343)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2501 (class 2606 OID 3192338)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2470 (class 2606 OID 3192183)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2468 (class 2606 OID 3192193)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2469 (class 2606 OID 3192188)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2484 (class 2606 OID 3192278)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2486 (class 2606 OID 3192268)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2487 (class 2606 OID 3192263)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2485 (class 2606 OID 3192273)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2452 (class 2606 OID 3192098)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2451 (class 2606 OID 3192103)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2497 (class 2606 OID 3192328)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2493 (class 2606 OID 3192308)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2507 (class 2606 OID 3192373)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2506 (class 2606 OID 3192378)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3192163)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2465 (class 2606 OID 3192158)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2463 (class 2606 OID 3192168)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2509 (class 2606 OID 3192383)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 3192388)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2521 (class 2606 OID 3192448)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 3192443)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2519 (class 2606 OID 3192458)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2523 (class 2606 OID 3192438)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2520 (class 2606 OID 3192453)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2505 (class 2606 OID 3192368)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2488 (class 2606 OID 3192298)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2489 (class 2606 OID 3192293)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 3192283)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2490 (class 2606 OID 3192288)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2517 (class 2606 OID 3192433)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2518 (class 2606 OID 3192428)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2471 (class 2606 OID 3192198)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2510 (class 2606 OID 3192393)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 3192123)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2456 (class 2606 OID 3192118)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2459 (class 2606 OID 3192133)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3192138)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2481 (class 2606 OID 3192258)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2482 (class 2606 OID 3192253)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2483 (class 2606 OID 3192248)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-12 14:57:21 CEST

--
-- PostgreSQL database dump complete
--

