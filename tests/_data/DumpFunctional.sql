--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-24 19:34:52 CEST

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
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 1413923)
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
-- TOC entry 225 (class 1259 OID 1414406)
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
-- TOC entry 224 (class 1259 OID 1414389)
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
-- TOC entry 217 (class 1259 OID 1414305)
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
-- TOC entry 193 (class 1259 OID 1414089)
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
-- TOC entry 196 (class 1259 OID 1414130)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1414051)
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
-- TOC entry 212 (class 1259 OID 1414255)
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
-- TOC entry 191 (class 1259 OID 1414076)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1414124)
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
-- TOC entry 201 (class 1259 OID 1414173)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1414198)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1414025)
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
-- TOC entry 180 (class 1259 OID 1413932)
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
-- TOC entry 181 (class 1259 OID 1413943)
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
-- TOC entry 184 (class 1259 OID 1413995)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1413897)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1413916)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1414205)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1414235)
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
-- TOC entry 221 (class 1259 OID 1414347)
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
-- TOC entry 183 (class 1259 OID 1413975)
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
-- TOC entry 186 (class 1259 OID 1414017)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1414179)
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
-- TOC entry 185 (class 1259 OID 1414002)
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
-- TOC entry 190 (class 1259 OID 1414068)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1414191)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1414296)
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
-- TOC entry 220 (class 1259 OID 1414340)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1414220)
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
-- TOC entry 200 (class 1259 OID 1414164)
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
-- TOC entry 199 (class 1259 OID 1414154)
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
-- TOC entry 219 (class 1259 OID 1414330)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1414286)
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
-- TOC entry 173 (class 1259 OID 1413867)
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
-- TOC entry 172 (class 1259 OID 1413865)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 1414229)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1413906)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1413890)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1414243)
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
-- TOC entry 203 (class 1259 OID 1414185)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1414135)
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
-- TOC entry 182 (class 1259 OID 1413967)
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
-- TOC entry 198 (class 1259 OID 1414141)
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
-- TOC entry 218 (class 1259 OID 1414321)
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
-- TOC entry 188 (class 1259 OID 1414037)
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
-- TOC entry 174 (class 1259 OID 1413876)
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
-- TOC entry 223 (class 1259 OID 1414371)
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
-- TOC entry 192 (class 1259 OID 1414083)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1414212)
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
-- TOC entry 214 (class 1259 OID 1414278)
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
-- TOC entry 194 (class 1259 OID 1414111)
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
-- TOC entry 222 (class 1259 OID 1414361)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1414268)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1413870)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2637 (class 0 OID 1413923)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 1414406)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1414389)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1414305)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1414089)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1414130)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1414051)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-553a-7eba-f23b-ec015a9b96d5	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-553a-7eba-8faa-e458b7993308	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-553a-7eba-f294-0d5b79b1aa5e	AL	ALB	008	Albania 	Albanija	\N
00040000-553a-7eba-5495-739731aeb5c4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-553a-7eba-e46c-8d631c8487a2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-553a-7eba-d879-2a39f345eb95	AD	AND	020	Andorra 	Andora	\N
00040000-553a-7eba-93a1-fee86e775945	AO	AGO	024	Angola 	Angola	\N
00040000-553a-7eba-301c-cd8e50307c8e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-553a-7eba-63e0-41940c3ddc78	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-553a-7eba-3ebd-6effd6a41005	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-7eba-381e-063ad09224c7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-553a-7eba-c767-810ea3a5afd4	AM	ARM	051	Armenia 	Armenija	\N
00040000-553a-7eba-de0a-a7269a387ab8	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-553a-7eba-6ace-efa277856f5d	AU	AUS	036	Australia 	Avstralija	\N
00040000-553a-7eba-eb31-1b1e1cdf3786	AT	AUT	040	Austria 	Avstrija	\N
00040000-553a-7eba-3f67-64c7fcf9d69a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-553a-7eba-831a-2e4a67c64300	BS	BHS	044	Bahamas 	Bahami	\N
00040000-553a-7eba-376d-055a19a3142e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-553a-7eba-9c78-29647056f053	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-553a-7eba-156a-92b1f9c17b38	BB	BRB	052	Barbados 	Barbados	\N
00040000-553a-7eba-8ea3-07bce356b11b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-553a-7eba-734d-04dc78b2252a	BE	BEL	056	Belgium 	Belgija	\N
00040000-553a-7eba-06f0-68326bd46a69	BZ	BLZ	084	Belize 	Belize	\N
00040000-553a-7eba-24a1-ad7a55ecde63	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-553a-7eba-805f-a4d50cfc4742	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-553a-7eba-e5c1-72b3afacc3bc	BT	BTN	064	Bhutan 	Butan	\N
00040000-553a-7eba-5970-c6f43e715c8d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-553a-7eba-1bd6-85c24e6c8094	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-553a-7eba-900f-e5231cd551a8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-553a-7eba-c093-429857dfff51	BW	BWA	072	Botswana 	Bocvana	\N
00040000-553a-7eba-ca12-0e3c9719e330	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-553a-7eba-7fac-3f4cf6ab8d7b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-553a-7eba-bcbe-8ffba32b4a63	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-553a-7eba-5656-d4777ed2f437	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-553a-7eba-2688-645bc09f5505	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-553a-7eba-fd03-0cb85c487a8e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-553a-7eba-8da9-cee92af713b8	BI	BDI	108	Burundi 	Burundi 	\N
00040000-553a-7eba-602f-d9f00f2fac4b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-553a-7eba-c12e-5f8162d82127	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-553a-7eba-d16a-25c1e4af8f4e	CA	CAN	124	Canada 	Kanada	\N
00040000-553a-7eba-86f1-2c36a721970d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-553a-7eba-fde6-21f9b044df08	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-553a-7eba-680c-d14a0125672c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-553a-7eba-f9db-079515bf5801	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-553a-7eba-dde6-02729a8e000a	CL	CHL	152	Chile 	Čile	\N
00040000-553a-7eba-1d6d-6907cbc64df5	CN	CHN	156	China 	Kitajska	\N
00040000-553a-7eba-5045-46227491b7ee	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-553a-7eba-c5d6-d67600e811b8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-553a-7eba-0176-17effa158415	CO	COL	170	Colombia 	Kolumbija	\N
00040000-553a-7eba-da4b-f7d5b81ccfcb	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-553a-7eba-5867-e12123cd2e63	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-553a-7eba-491d-98e7e0a350db	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-553a-7eba-d8c6-0656b63b7846	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-553a-7eba-0e98-2ea0f985c46a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-553a-7eba-3f22-953425e5f7b9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-553a-7eba-64a8-faae91ba7869	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-553a-7eba-3725-82447946e3ee	CU	CUB	192	Cuba 	Kuba	\N
00040000-553a-7eba-5488-46cff648def6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-553a-7eba-f199-dc8d83dbf380	CY	CYP	196	Cyprus 	Ciper	\N
00040000-553a-7eba-fe13-922bf5961483	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-553a-7eba-e525-b15ab5523ec5	DK	DNK	208	Denmark 	Danska	\N
00040000-553a-7eba-a1ef-78211e1dfbdd	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-553a-7eba-5a5d-6fecedf275c4	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-7eba-39fa-60c964f81b43	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-553a-7eba-ef14-b34f09b70e83	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-553a-7eba-a351-9acdc189b382	EG	EGY	818	Egypt 	Egipt	\N
00040000-553a-7eba-2f8b-97d86d007a80	SV	SLV	222	El Salvador 	Salvador	\N
00040000-553a-7eba-04f2-dff610c3276b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-553a-7eba-d6ce-8ce2d2b07903	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-553a-7eba-0d43-b157d6bb7da0	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-553a-7eba-61c6-3353a33a1aa3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-553a-7eba-bfc2-a844774e8961	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-553a-7eba-ac77-176fad924345	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-553a-7eba-f873-6158cbad36e8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-553a-7eba-cdf3-1ba0cf3c5f68	FI	FIN	246	Finland 	Finska	\N
00040000-553a-7eba-fa43-da691044f215	FR	FRA	250	France 	Francija	\N
00040000-553a-7eba-2f59-0259cfebd1f0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-553a-7eba-59cd-0e6508e909d2	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-553a-7eba-dd7e-f1b192fa89a0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-553a-7eba-0406-2e336138a3da	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-553a-7eba-f70c-e146e42bcd7b	GA	GAB	266	Gabon 	Gabon	\N
00040000-553a-7eba-7308-7b7922c990b6	GM	GMB	270	Gambia 	Gambija	\N
00040000-553a-7eba-61c3-cab46f870207	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-553a-7eba-36a9-dc19e4792d98	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-553a-7eba-b27f-b2528051116b	GH	GHA	288	Ghana 	Gana	\N
00040000-553a-7eba-458a-654550622db1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-553a-7eba-d0a7-4d198d8574fa	GR	GRC	300	Greece 	Grčija	\N
00040000-553a-7eba-05fa-685552ab607f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-553a-7eba-5a77-c8d3492436c1	GD	GRD	308	Grenada 	Grenada	\N
00040000-553a-7eba-684d-d8812f891bd2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-553a-7eba-ad7f-be01d654cdfd	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-553a-7eba-29a3-4a018a21af7c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-553a-7eba-79a4-af07e2ee20d2	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-553a-7eba-7161-b578c984af46	GN	GIN	324	Guinea 	Gvineja	\N
00040000-553a-7eba-a064-d799cdd9d334	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-553a-7eba-6997-cea530caa25a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-553a-7eba-d489-a8bbe032df51	HT	HTI	332	Haiti 	Haiti	\N
00040000-553a-7eba-f262-913aaf62c54d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-553a-7eba-85ea-8e88c168635b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-553a-7eba-2e1a-63ce4fe147b5	HN	HND	340	Honduras 	Honduras	\N
00040000-553a-7eba-9e95-3f87ddef0c24	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-553a-7eba-7823-a2779ef2dfbc	HU	HUN	348	Hungary 	Madžarska	\N
00040000-553a-7eba-bcc5-936888e50d24	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-553a-7eba-86e1-65d38b3b5fcc	IN	IND	356	India 	Indija	\N
00040000-553a-7eba-409f-654c11a7e968	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-553a-7eba-860e-520bbe2d2f13	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-553a-7eba-a28a-a2c6e6f3d0c1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-553a-7eba-0e07-6f701bca110c	IE	IRL	372	Ireland 	Irska	\N
00040000-553a-7eba-d8d9-4f02b671ea39	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-553a-7eba-6d7f-b66ff5e0ad27	IL	ISR	376	Israel 	Izrael	\N
00040000-553a-7eba-dbbc-433bca22a72e	IT	ITA	380	Italy 	Italija	\N
00040000-553a-7eba-0494-3f78b20aaae0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-553a-7eba-5eba-cce1dd0c1bca	JP	JPN	392	Japan 	Japonska	\N
00040000-553a-7eba-ad0c-31b3c505c016	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-553a-7eba-598e-1db6bda2eede	JO	JOR	400	Jordan 	Jordanija	\N
00040000-553a-7eba-76a9-4fd62904af37	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-553a-7eba-bf3a-1eae2f10db4e	KE	KEN	404	Kenya 	Kenija	\N
00040000-553a-7eba-17ad-23643f6b1bfa	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-553a-7eba-dbb3-85983cb77173	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-553a-7eba-c37b-b38a2f4d6e2b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-553a-7eba-d3ef-2cd461a8b5ee	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-553a-7eba-912a-d3406fbf0339	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-553a-7eba-2dc5-e7e64516757c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-553a-7eba-906e-ebf37ca34f02	LV	LVA	428	Latvia 	Latvija	\N
00040000-553a-7eba-0b3e-817986134c39	LB	LBN	422	Lebanon 	Libanon	\N
00040000-553a-7eba-c806-a2f247e680fb	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-553a-7eba-0d55-d46a5c618dbc	LR	LBR	430	Liberia 	Liberija	\N
00040000-553a-7eba-0cce-9ba3c55ecc81	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-553a-7eba-f8e5-85f51ea28cda	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-553a-7eba-c15e-672583f15dc5	LT	LTU	440	Lithuania 	Litva	\N
00040000-553a-7eba-85b6-cfdf17f8393f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-553a-7eba-fd19-377f914ca026	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-553a-7eba-770e-87a309b40351	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-553a-7eba-5c68-c41f73b73bfc	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-553a-7eba-df99-f378d9f53284	MW	MWI	454	Malawi 	Malavi	\N
00040000-553a-7eba-81d4-78712776e704	MY	MYS	458	Malaysia 	Malezija	\N
00040000-553a-7eba-59f6-be55aafaff95	MV	MDV	462	Maldives 	Maldivi	\N
00040000-553a-7eba-0902-bf2d80e86350	ML	MLI	466	Mali 	Mali	\N
00040000-553a-7eba-303b-0b66e976345b	MT	MLT	470	Malta 	Malta	\N
00040000-553a-7eba-d29a-e21dd4d0943b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-553a-7eba-4634-b5fa2e06bbfb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-553a-7eba-8a9a-b6b30f9ab85f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-553a-7eba-2988-967d78dd3192	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-553a-7eba-f208-4738c14ac379	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-553a-7eba-65ff-caf08f9d6025	MX	MEX	484	Mexico 	Mehika	\N
00040000-553a-7eba-7551-c61dfd5dfd1d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-553a-7eba-f793-84cf7923b35d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-553a-7eba-72f6-b5aca12d3c77	MC	MCO	492	Monaco 	Monako	\N
00040000-553a-7eba-21e9-7b089f2fb16b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-553a-7eba-f255-b1b53ad8632c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-553a-7eba-f759-4345efd1c73c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-553a-7eba-87a3-607829c7abbc	MA	MAR	504	Morocco 	Maroko	\N
00040000-553a-7eba-7f48-935706b0ef24	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-553a-7eba-3cfa-6f43df3d08b3	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-553a-7eba-46b0-267ad86aab30	NA	NAM	516	Namibia 	Namibija	\N
00040000-553a-7eba-1d05-cd15f6b8dccf	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-553a-7eba-17a6-bc031a9192f0	NP	NPL	524	Nepal 	Nepal	\N
00040000-553a-7eba-6f7c-f21bef1eaa48	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-553a-7eba-c90a-9b59acb77737	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-553a-7eba-fe81-c8f499e51dba	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-553a-7eba-2a82-757c930a52fe	NE	NER	562	Niger 	Niger 	\N
00040000-553a-7eba-976b-f48b3db12971	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-553a-7eba-fb3a-c1cc014e61c7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-553a-7eba-3e1c-c7b4c383dd0a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-553a-7eba-fb92-7db499962931	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-553a-7eba-3f53-049cd5041a9c	NO	NOR	578	Norway 	Norveška	\N
00040000-553a-7eba-4eab-56e2923f3f72	OM	OMN	512	Oman 	Oman	\N
00040000-553a-7eba-4f7b-5bfb83dd2a88	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-553a-7eba-46c7-7076af060e7a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-553a-7eba-15b8-86c9b5b604c2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-553a-7eba-ee71-53a15f8c5eec	PA	PAN	591	Panama 	Panama	\N
00040000-553a-7eba-2f62-128e1e1a5fa6	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-553a-7eba-be54-c6160a275b1b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-553a-7eba-239c-7b91c45f5071	PE	PER	604	Peru 	Peru	\N
00040000-553a-7eba-c2d9-1d6e4369d954	PH	PHL	608	Philippines 	Filipini	\N
00040000-553a-7eba-bc01-f6458a18edb1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-553a-7eba-ed54-72e4cf1f6f09	PL	POL	616	Poland 	Poljska	\N
00040000-553a-7eba-dc04-b289348557c0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-553a-7eba-f8b0-35cc95556816	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-553a-7eba-98ae-06b1e794304e	QA	QAT	634	Qatar 	Katar	\N
00040000-553a-7eba-9b00-69dc12834e4b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-553a-7eba-6d82-f7ff8939831d	RO	ROU	642	Romania 	Romunija	\N
00040000-553a-7eba-49db-aa31f9d36bca	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-553a-7eba-cc08-59a1c2b1ed71	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-553a-7eba-d3c4-ff9e4a75669a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-553a-7eba-ea07-23c3d2c0ec1b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-553a-7eba-83c5-339dd5495655	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-553a-7eba-33af-5029abeddf86	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-553a-7eba-5e62-5213cb7f3698	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-553a-7eba-7a32-f3d3d121d326	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-553a-7eba-40d0-ddddb013eaec	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-553a-7eba-3bed-ee4b92f14f0f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-553a-7eba-3882-c11fa2b80e0d	SM	SMR	674	San Marino 	San Marino	\N
00040000-553a-7eba-92f1-97109dc8e49d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-553a-7eba-aa08-b1797095652d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-553a-7eba-8e17-baf35ddee3e3	SN	SEN	686	Senegal 	Senegal	\N
00040000-553a-7eba-94df-965c29cd1630	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-553a-7eba-c7d5-f31c0708f266	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-553a-7eba-2e41-21e10b7bdcf0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-553a-7eba-b1b4-c5d53cd0ed85	SG	SGP	702	Singapore 	Singapur	\N
00040000-553a-7eba-add0-601d7ec2be1f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-553a-7eba-b13d-0d85abeada6c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-553a-7eba-456f-36776909ae12	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-553a-7eba-8d69-8d33722bd88a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-553a-7eba-1832-ef2d0714feb2	SO	SOM	706	Somalia 	Somalija	\N
00040000-553a-7eba-80fa-bd4298181345	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-553a-7eba-8ef0-f561510b94be	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-553a-7eba-bddf-9bc88edf2d4e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-553a-7eba-1935-dccb2c2bf31f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-553a-7eba-6d8e-9eb7f56c9d4f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-553a-7eba-1f5a-a9eb8e87b73c	SD	SDN	729	Sudan 	Sudan	\N
00040000-553a-7eba-a57f-9bb30754c443	SR	SUR	740	Suriname 	Surinam	\N
00040000-553a-7eba-4f5b-b4f101ecc849	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-553a-7eba-2a6d-5b694b95d7bf	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-553a-7eba-ac83-a20990849f43	SE	SWE	752	Sweden 	Švedska	\N
00040000-553a-7eba-4c6a-f4bf7c0a4b2e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-553a-7eba-de7a-dfcaa5a13770	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-553a-7eba-3d6d-4406bcc10bae	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-553a-7eba-de40-388f589eea98	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-553a-7eba-4390-6273def260cf	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-553a-7eba-5f58-fdd16d5bfeea	TH	THA	764	Thailand 	Tajska	\N
00040000-553a-7eba-4334-2f77d56bb385	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-553a-7eba-d85e-bfcfe384c852	TG	TGO	768	Togo 	Togo	\N
00040000-553a-7eba-960e-636d60f92bc3	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-553a-7eba-5d6f-8293a12a2371	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-553a-7eba-3fb5-896b248c69de	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-553a-7eba-4f2b-8829eadd0dd2	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-553a-7eba-a2d2-73c4dd009c6c	TR	TUR	792	Turkey 	Turčija	\N
00040000-553a-7eba-61e7-9fd1072721cb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-553a-7eba-5b7d-a454d8693877	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-7eba-3298-7a036abb05d9	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-553a-7eba-91f4-9589cecae440	UG	UGA	800	Uganda 	Uganda	\N
00040000-553a-7eba-84c3-37d32fdc97c8	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-553a-7eba-9692-37e5e72e323e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-553a-7eba-5d0b-3c207f39ea1d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-553a-7eba-a539-c59d0705678a	US	USA	840	United States 	Združene države Amerike	\N
00040000-553a-7eba-816a-7f62681153cd	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-553a-7eba-f4ae-48dcbe16feb6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-553a-7eba-8e34-9de87f1ff669	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-553a-7eba-4596-fcd8fd21c895	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-553a-7eba-3044-538314effdf4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-553a-7eba-eea6-eeef33024f44	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-553a-7eba-6064-a679965549ab	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-7eba-f177-fec346f94c0f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-553a-7eba-aad0-180a86138b2c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-553a-7eba-d7db-fedf476b7ce8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-553a-7eba-caf0-124782c712e9	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-553a-7eba-d9b1-2f1621525fb5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-553a-7eba-dbba-c251e4acc4cb	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2670 (class 0 OID 1414255)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1414076)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1414124)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2628 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 1414173)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 1414198)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1414025)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-553a-7ebb-758f-b79978439082	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-553a-7ebb-1304-f73fb358e70f	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-553a-7ebb-81d9-0e7df5fb1524	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-553a-7ebb-eddb-b898f801d57b	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-553a-7ebb-a372-d0969aefa846	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-553a-7ebb-2908-b9e787fd4466	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-553a-7ebb-7335-bab7ddf4508c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-553a-7ebb-b4eb-f0f680b68b99	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-553a-7ebb-9131-f0bb5e58cccf	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-553a-7ebb-a9d0-c628c4029b06	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2638 (class 0 OID 1413932)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-553a-7ebb-c68d-4fbb744a6ea0	00000000-553a-7ebb-a372-d0969aefa846	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-553a-7ebb-e556-c6a13228ea04	00000000-553a-7ebb-a372-d0969aefa846	00010000-553a-7ebb-1f73-151134aea41e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-553a-7ebb-ac80-809d89cda398	00000000-553a-7ebb-2908-b9e787fd4466	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2639 (class 0 OID 1413943)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 1413995)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1413897)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-553a-7eba-9013-33b3a5d8f047	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-abe8-12979ef8176b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-1201-465d3f868f36	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-a012-a1199357d0c1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-1f9a-349167ba110f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-f1ba-c7ab3115dbbe	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-9930-cbed7b0e1ce4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-2933-1f5413ab5159	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-54a4-35284c619410	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-a4bc-14bf90d5f145	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-989c-8154b59b6cdf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-9c80-bc50aeeb429b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-5202-9995450082df	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-e38d-c5114c3b6e8c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-9ee5-71a8c80b22e7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-685f-813464df47bb	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-eb8e-991a5a814a3f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-314b-5b2d3da2cae0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-d6d6-07e4d646ed13	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-db21-18ebc2ebaaa9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-0fe8-c4256c4f5868	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-ca3d-60f97c27dd1e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-9347-ffe5611a2001	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-1a26-9f8699a5ffac	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-c3b5-9b30316f3da2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-9a39-a42979b35666	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-7c8a-77984f84fd53	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-aba9-067f2322dea8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-17d7-66ee34bc6fb3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-b98c-4769d9a31716	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-cc29-f0fc34a728db	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-fa6b-9595d1e73e6d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-d211-147dc8634443	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-c47f-ba05804bd702	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-c022-f0a8a0d25995	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-1f5f-7099c5175567	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-861b-ba77d4a14514	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-0374-ed47b5d7a5cb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-1a36-fd56715beb0e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-863b-328506f1e0c2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-abd9-96a563d1f2ec	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-f1ae-3060ef405359	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-6113-63728e506f1b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-7a94-f00a070f38c8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-6ea0-e71e8d9ddc19	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-bf62-fcf6f20e2393	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-575c-e909f1be7469	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-1c83-3fd90c44c988	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-9cf5-f7e74bb27a54	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-bb17-fbbe7663d338	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-b2b5-2344dce06f73	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-37d1-6899fb65691c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-cd5a-61f673378784	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-028f-c85b2e330a63	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-c384-c9c561569293	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-b079-38ecd6ed75ed	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-8945-5cdbd7cc978d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-8454-643b759d0c3e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-85f4-c7c31f0a8dd9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-9387-ee2204df94bf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-512e-c502f325375b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-c481-09f79d555715	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-23ee-474ab811a4da	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-58de-3ab6cda4a93d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-7ae3-9af718057272	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-09ba-b9e845bc097c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-1d57-1dd27888c29c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-5ac6-a54410705493	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-357b-2afa7c38ccb2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-2365-3f3cb74c201e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-8fb0-32166eec7701	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-a0e7-3dea82dff8f4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-20ea-971956323e4d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-c0b8-92ed3def170b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-ef47-f1cc3343abbd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-7138-33046f505693	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-4127-2a221411f259	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-1105-43802ef17b7b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-4b8d-e8404aeb6ca6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-da65-fbe2899976fc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-aacb-047c2cf187cb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-877c-c744ce6ef8da	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-b0ae-48bdb0f490fe	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-31fb-898f20a95759	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-5bea-213bdd19c0ff	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-a5b6-57047a1e8c4d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-2305-5d36f3cc4a10	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-4c5b-f72944b07b49	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-206c-dc87e904ebc3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-e43b-4ca37cf4becc	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-9b7a-2ff4890d8fb2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-bcfd-93cfffc6b643	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-0d40-066ae42f5ddd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-2ab2-de0f009c720b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-a182-0c53a0098698	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-469c-e65d52f99977	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-7043-4230d925fd7a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-18fd-75c3a5630a5d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-8e52-32493f03394b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-2058-9cb07bf87aef	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-99fc-db015f143d29	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-905b-ce205cbca923	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-96d3-593d66c4191e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-d05a-6d16c4c2aaa8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-d60b-f78c627a13cb	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-7384-33763d729096	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-5089-7daaf931d251	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-69cb-057900983028	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-961a-8a28393751bc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-38b2-f4c6e198689c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-2564-e6938a521a3b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-e0f1-70294df33396	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-1adb-72ea3a101d57	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-e9eb-50b0da0ace65	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-8684-570f32f0979c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-569b-5692597ff02d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-ddfb-00eea89cd2fb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-82e0-2fcb43f60329	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-223c-88c26d1ed709	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-d9d0-db64de35c574	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-e524-5aa7d82c67e6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-4720-1abdf773ac5b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-6dbc-40d452083268	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-324d-f825a1d46d97	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-72bc-e2de88ccf076	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-c427-c42b35fd59ab	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-1eed-23da74bfd165	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-a8dd-6379368fd815	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-c515-3632479db15c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-1b5f-8f9808e6efd7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-2aad-d21ad974af82	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-ec29-9e311888e35d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-d502-33f342c58a9e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-8a49-a15ffe72b0db	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-c818-f397a4b6d869	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-2915-c503388fce52	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-fe8c-e821159d8537	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-60f1-b57987a16cb0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-97e3-7ab944945ab3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-b527-456521dbdede	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-9c01-8afea49399f8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-9f89-91acaefe2bcf	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-1a3d-fd1d395bca6b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-27a0-a8e37914767b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-ce02-330cd56cab60	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-73b4-9c318507c70b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-6881-a1e8e174cc3d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-7ef4-c5f622ae56e5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-fb2c-5b0afd547f58	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-2ac5-ffcca51efedd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-1c7d-9f955cdaad8f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-aeff-9afd11d60476	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-a2d4-1d8eb4e490ed	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-91db-66dff5d274da	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-d58d-7b44e5d7fc44	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-8b83-4eff27e45885	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-f4e9-dc9dadc4b70c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-8f65-f835e2fb6eb0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-b518-2d9c15080162	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-5ca8-c2fdfaa6523a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-dfcd-dd87681ee59c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-f170-3ea5189ac8c9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-ced6-72e7af2456bc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-9068-f2d4cf5d1a71	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-307d-399279a45599	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-e968-2f199048497e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-d49c-92bc1bbd7f98	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-3259-9df116f3fa17	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-4627-c8024c82f2ce	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-c7ca-4dbb1fca5e1a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-3299-27d9fc955ff4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-8080-6f842ba4f7ea	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-ab40-fcaad2ccc545	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-2f3a-416cebbb0fdb	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-5380-ba806fc221b5	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-2958-4537248a204c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-8928-4160498fecf3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-d646-c4f889d73763	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-85ac-5d6d6914ff5c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-f265-08daaa958a7d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-b36f-d785f2ddf778	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-b603-23ef2b0d7698	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-e056-8575385905c7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-c276-543b5ae09aff	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-f2db-90f45684c540	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-2bfd-58be7bb70942	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-f197-f5b98d616357	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-8b8a-77a370984ff9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-c12c-fd76c4b6464f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-7bf2-9eceef47973e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-40f6-a2d7070a7ca8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-92ce-6eda7a4d282b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-7eab-db74aa702d36	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-db7e-3269feff7457	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-abd9-4f99cf62cfde	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-4364-81d5e0a851da	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-6ae3-5e3454b95bda	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-e862-db3e97389ada	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-f276-be7229eb5f0e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-24ca-0ddb6e8b95ec	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-8478-b2b298318f8d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-97b9-b17b34a407e6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-d50b-3953aae0c9da	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-560f-6937ef287a5f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-9c9e-dee7094d4129	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-2530-187224021b76	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-2e13-f19810f33c05	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-80e9-70f02dec364e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-3baf-57838bdb5899	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-f99c-d610cb481100	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-db4d-3964007096d9	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-9bc9-a92f25fefb92	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-750a-70fdfc09e075	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-2773-410c7c2f2927	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-846a-ac90b26d8bf0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-4bf9-377ff0b962db	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-1224-74fc275c16e2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-2d20-0c0fb40859c7	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-6395-d084fa5e069d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-2afe-586b33f41541	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-9250-fcd1531c0a23	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-8bf4-1ae72f16c2b8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-1e37-1299941be430	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-6f8f-e6692748c066	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-8351-cc2e758b8147	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-7581-15013a86d5ef	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-2994-b321a68d60a6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-fe86-aa3055b97e92	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-e2b9-ee6d5ced151f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-7b53-19cc0d9a73a4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-f8db-e1a64528d4c9	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-8603-ad721ec877d2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-288a-fc9242b86906	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-9f9e-971c9f467e20	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-fde2-2ff09c4af527	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-83db-0dba3e618141	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-f0c7-0b3008fcb9e8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-32fd-c2cbd7eeda14	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-8273-e5aee4740e6f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-2bef-816a6b690b13	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-ab70-10e15ec15389	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-13c5-c7771acc3c09	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-a58e-f66b7d5951b7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-6373-25217df2bc95	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-a484-f2be25718133	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-ea7e-d1e1854c8ce7	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-d996-161fc297c04c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-2f98-f22f41360dbd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-bd6c-c8df585b5985	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-315b-65c1debc42ff	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-25ee-9e644cc57dc8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-23eb-5960f6503153	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-6094-8bbabffc9d1c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-7f70-921a59b06ecd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-8e43-8f1fb5aca460	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-2dc4-092538f83dfc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-86ac-09f3386b58f6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-62fe-11eac1f564fd	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-bfd6-f648aba6e8d8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-4cc4-acf553197ea0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-1713-6433dcc4e7ec	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-1c79-f06731a7b90a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-2e2b-a6d6ea9b250f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-4047-8e8d67d24021	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-ccc5-04f56db7e45a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-6cde-56c518415f0e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-4b6e-b93be21927a7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-77dd-57c84bfa6b77	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-0d27-15f640bf0986	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-95a8-b7fe38e9160e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-cfe6-fa6e0985be9b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-52cb-1ee35b70346c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-5923-bbf88d2981af	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-843d-fb962fb2f5b0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-3487-9c69dccaabb7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-9818-c632e37091a5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-4b03-682e003d4ebd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-a366-fb589035aaa9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-170e-e5f8bc21e6a7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-dacd-fe87c20c6315	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-a908-f52decab2d04	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-ff02-4e6f65c06c79	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-3a8e-4139406cd298	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-e648-7f8f6ac7bdd4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-d1a2-adcc962ed047	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-fd73-6dbfa0b6d34d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-1a8d-0c4906a6feb4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-5ac6-68448907cc42	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-51a6-bbfe89529860	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-309a-e1ea7cbb9f21	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-cfe9-5b33b7b46477	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-2eb5-40fc7d301f72	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-bc3f-439efa690ba3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-c9ae-7a3dccbc1207	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-b13e-09791cf5f880	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-0387-171b241c5d33	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-7dc4-06fd86319105	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-0164-011b7a75dcc9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-fbbd-2c2a2b94b0f1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-986b-ff0605a6c4d4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-19d5-0f3fad89f32c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-3fb1-46d512c5e1d0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-20eb-4c72cea96ca9	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-d51e-37c083c29814	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-327a-8802f6dceb83	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-07b3-e53907a8a253	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-a480-05c55c8c4ad8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-9e79-1c8b1bb2cfe6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-a27a-d3335857ef28	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-508e-9a415372c05c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-af3b-c2827499610f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-2409-59b12532aacc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-666b-89d3c79d7c58	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-665f-e702d235ae8d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-3be3-6e22f56a8149	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-ac32-e5e7f7e18035	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-9566-552dd43d0043	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-a207-afd59bb39137	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-6bfe-e4aada950d14	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-160a-172d5727187a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-8153-f4100e891e44	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-6a62-b39fd5b8d3e9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-c826-105d8fb1138f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-5d18-0625f6fe2c87	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-6f4c-7eed45468452	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-db08-08c24eff45ce	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-a9e3-bed97464de1f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-438d-43700159eb73	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-05a4-9683e71c9f0e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-81e4-deec9ff0dd6a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-35d0-4dceb3b29332	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-2bd3-feb424538a1f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-c319-dbef1abf1999	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-41e6-d1457ec1ab6c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-eb55-c74219ffd9e3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-1b57-89b3187b5ace	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-0d1d-99da9da1c71e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-61dc-c78880ade18b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-d463-62b6b6d62814	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-cd7d-762e5a79e5bc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-f845-119e8a380b32	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-9796-0506a77e1897	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-1897-6db186dc0a0f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-8686-c3175a7c7a57	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-1896-0dbcb34c459c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-7739-6e4989ee13f1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-d1c4-531617c89cd1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-ef81-20dbbc426772	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-4116-446f8b0a3118	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-3085-a33ab952e0d6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-0923-6c3c898bc732	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-06ab-a2f3e0c92f10	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-5b7e-9c33daf10eca	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-8762-4ed33fe626be	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-32df-12d45b854995	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-401d-cb104baba0f9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-c283-1b84fffb3943	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-b132-09c900cd1df6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-1186-7d59c500125e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-1c19-e251f045397a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-c039-0e6c0a87a947	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-a78e-dede518aa350	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-66c4-f3e744aaf3fd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-7840-f346a1c15405	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-f95d-9d6c291e3cc9	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-0645-a43a88052dff	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-301d-cfb5b35c92c4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-9182-d83954526041	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-493d-1f9cdd40e600	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-0eaa-e5a069798d7c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-a86d-f7673c0f7139	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-7a08-801d04cf836b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-09f7-d9018ca78fdb	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-f212-3c6e39188cc9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-e974-56bbe1acc013	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-8783-48de10ca9d64	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-e91d-7079c606bc52	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-f1f2-2e10b392f0ba	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-c473-9c0521687170	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-47f1-d6b3fa750c00	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-d9f3-31a16322d7fe	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-a3fc-8ae54794ec99	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-6e59-8d39c8638cd9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-1829-f354766dddc5	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-3277-bb4c283109ab	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-3da1-65cee16af942	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-868d-6824478799a8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-c844-49e6fc500b99	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-e7f8-77168b56a7f9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-2ebc-3112b5db1227	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-dee7-fd493996988e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-865a-6567633aa80d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-164c-bc3cc15ca9c3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-399a-b7a91346b9b9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-acdf-91b546af5d88	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-c4b5-110ba691d8b1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-eefa-5eae290fd8a9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-0d38-0a74d2db7694	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-d47d-5a116d54fbed	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-9b88-915a9c753cae	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-515d-7a6d1f96ed63	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-57c7-b2269d185094	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-881d-adc30a9e3365	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-0219-8723ca6ac8b4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-499b-4434dba68d83	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-885d-38cfb21c63f7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-712f-07bae7f79619	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-e307-0b5f08d11bb9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-fc18-73c7a16a47c0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-ab32-b48c2d01848e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-4086-1f460fe20d27	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-ec03-5ed7b14651b6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-6649-4971dc483faa	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-7dfc-e4211360fdba	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-4f1e-40c3f4e4c850	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-168c-d6220100fd06	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-b349-61172561d016	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-d2b1-07800fce18bd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-0105-0472454854b5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-050a-a48e3c1cdbb8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-0005-d3c0911586e8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-55fe-82eb478e3783	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-ecb9-2868a61b7181	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-1e82-14e3a78edfaa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-88b4-db190250a0c3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-6b44-38c6a8321107	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-c1ea-4a9fa80af661	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-4847-291fd4f4dca6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-e881-2e53c859394e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-d7a2-7de04e621725	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-7ebc-51c4b44d9623	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-278c-ad2bfc65748a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-d324-9f457a31c762	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-0d40-c7584262384f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-d233-af36876a0208	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-a069-b53a05295105	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-6b5c-aa4085616b91	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-f788-2099fb4844e6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-a490-82dcb1281dd8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-bee0-8f174030c1f9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-edf5-d6f06b5f1e0d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-2dca-7aec3192f970	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-a1ba-2c5ce638a5f3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-0d75-15a9367756a6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-9829-54b29c57b5d8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-2d5a-e651dd6b40c7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-da4f-158ee84b6b55	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-7445-9909979ce8a2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-5443-623e7a4b60d8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-83c1-6a71f664cf8a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-79ef-c77962c6d2a9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-2296-216b54ed74b0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-8465-7bfbd645a40c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-98c6-8dde6270b16c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-aeeb-91e40d3e3da6	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-9ed1-02d186cf9b47	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-3157-95c236d71b6c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-56ac-070abd2f327b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-1aab-b80c69d4bdc4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-2b34-9553ab06b137	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-61bd-62dbb6c88185	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-28ba-50845dafb9f8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-1fc2-1f905b2f937b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-ec35-777fbe7aca79	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-9243-1d0c1469c14e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-f673-4c8d4421c039	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-959c-46694603e3ca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-5d73-1214b662f552	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-a897-51b9225c103d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-544c-ebbaf01c9b9d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-8c55-0ec8645008e9	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-0c00-e48293ad50c8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-77bc-c7e1dc604ed7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-e700-a7a2403a0e9e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-540c-2236c16abb6d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-08f0-bf4b84bc2416	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-d86a-0f0ee9fd32d3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-88d3-9bde0cb3b415	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-6d5e-f3c5aba6c71a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-f233-4ba5e5183cbd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-a7bd-a7ba768bc9d0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-11fa-fa3707b4488c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-6afb-197f7cc1001d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-1a46-eb862006e2bc	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-57d5-ace57f1d42d1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-ac6c-2af248f65c3d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-ec51-1d04242eed81	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-4881-a6c419704a8b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-0db6-d7a43cb9b8f7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-5007-6bbc51e239e9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-adab-711bc4a43eda	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-4d34-ea2fd1c62155	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-935f-3e3589f24bb3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-07fd-a2eb311e9fdc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-598e-41fc03dcb9ee	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-a133-35c41a6cb307	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-f19b-f68f1972386c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-3e8f-9b6299b7e99a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-5890-8b3200da717e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-3c21-4796d78541ef	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-7c51-00995a125c86	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-d9e7-3cd2e59e04aa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-1afb-1dba1d900b3a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-910a-445a8306e921	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-40fe-e747f672803d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-ab51-5df65d2ad161	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-d889-0e8d64c8c1e2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-3be8-4ab95f06bf49	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-9161-f8cb4d30393e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-5456-89728e677a16	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-38b5-45d6fbaa7d59	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-874b-c2d892dee9c1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-79fa-e65bc47bb5c3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-efec-bfa05ce1b24e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-0419-fa89342d0c29	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-af43-5085f78d8613	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-5a7c-3468d485b407	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-a14e-7c93005cc830	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-ac4b-4859b08e85a0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-a6ce-93067defc96a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-c1be-0d81d2991d7d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-ded1-8a1311227a27	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-8ebf-056ca3855de0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-e1c9-1136ece077e8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-4c5b-9c16ebb41f75	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-4ca0-8d9412219b8b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-4540-ab4596842059	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-abae-7f8a23e0886e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-3c06-fdff8e037bf1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-21fa-d980c219f3d3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-40dc-047fd267f46e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-c3eb-d8d248947ff1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-fb1f-511073082009	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-93bd-2999f9348ff4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-02fa-4da11ab0f5f5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-07d5-091100cf535d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-a5a9-f6a4ff5807c6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-f373-3845dea83f86	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-8f51-2d0660678263	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-8441-823a02ddeb62	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-d352-ae937b55964d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-3019-5343ee9e38cc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-dd90-c82fc42fe625	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-ebe8-f2d6bfae015a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-028b-c0929fdaf193	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-884b-2f09a4bcf625	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-f8b0-4aafa27b753c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-37ff-8c452cb61a30	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-3d35-fbe0c0521ea1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-a3cf-75202c30bb75	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-b6de-400c6c8d57bc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-39f2-7747714407d1	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-33c6-9871cd06574a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-d49a-930f81be9ebb	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-ace2-4a8eb93f87e1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-8341-2ce8462d6155	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-17ac-07739da55d12	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-acae-3cb4e59b97be	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-e58c-df262fc8589f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-e7de-40471df3c406	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-fa65-081d36749a75	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-9e69-ae017ea5dee0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-bfc9-3cd3ac0476cc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-1058-9b33a3e27450	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-aba3-48f318f2a00b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-75ce-ac7e304abade	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-d21f-98a33f13e644	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-c74d-a775bc07f3c6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-be84-e9cad1384f83	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-6a37-1f1c0425eea9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-b3a1-74ca68ba03fe	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-bce7-f46b8e2ec105	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-bedf-0fdd9ed2f81f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-108c-1897fbfc2720	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-d9eb-1dc5824eebfc	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-e143-c52602d9fa76	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-0e33-a9dd55dc284a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-11a4-5975881a20ad	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-9e00-5983158d6319	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-a685-b85964770042	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-c561-1b536838885e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-36d5-29ce1a161e39	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-17b0-a50e1466ca9c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-7a6e-4ce867a2c689	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-d71c-b1b2a4d8d80c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-9bab-9f471bded3c7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-59c9-313c776fcdf9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-f78b-8b7720217b9a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-6d93-a2bdfd4b5ede	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-c39d-872d19e91dbd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-fd4d-67478db3ef4b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-ab9d-e2257197c479	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-0e5a-2a133dfad37a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-8e96-4795d8b6298d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-6db9-3a11dbb040be	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-1e9c-e5a6ce379757	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-11ba-76386d3b426f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-9b64-e90fe88d1d48	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-29b1-97c1975beea8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-9993-2e7c5c9eefb2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-d4c7-be87f52db805	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-443a-a55a89bd0485	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-1820-7ac201302529	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-2d68-38a121a7c3ff	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-28ab-2d1581ccf2cc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-9ab0-96b028312ede	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-d3a7-04f4b21e5cff	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-7c3d-75cc3fbd3aea	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-7275-2c88527ac021	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-4a10-63cd53485579	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-bac6-f64ab1dea404	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-4fb4-1ab54b97da39	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-b54a-3854c3a254dc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-128d-70317a67d4d7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-7998-56091b65286b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-bc2d-eaf5da472893	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-3575-16f2e542fbb4	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-336b-be19b6a30d78	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-b9c8-f11538d36404	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-e552-5ad242a00bce	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-a509-1199abcca914	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-8a84-a0b3f7f232fd	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-b3b9-83baf34c06ce	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-9eb6-b25fc07a5b2b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-d6ba-bbcea6f07a72	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-e276-2ad89d4e1ed2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-4e1a-7cbe5522ea1f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-4684-8dbc02da53f6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-f260-e13588dc8411	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-918c-ed676c660de1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-4c10-728feff92060	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-b372-1979e792ce4e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-b421-354263d60e83	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-4de4-b4d4bd681dc0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-1da8-c7e35853f3ea	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-f09f-9d710fac08ef	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-97e3-48859f34d15f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-2d2e-844272b54bc8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-d5fc-f0c0ee03b52a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-28d6-fe10b0cc32f4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-7c86-f0f33d6a9ac8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-d26d-5c27c4a8c9fa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-4565-cf5c4c7c854a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-0d79-9aa0fee1f0f8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-9106-5f7cebd9b48c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-38ec-f23171b98490	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-9c3c-3c174136756b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-01e8-bb7d3b0cf9ab	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-904c-4e4b39795cb3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-89f5-63e6a70dab46	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-63d2-23d594be8d11	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-42b0-12c4e015a5da	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-0e16-706003eae413	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-69f2-31f2a9c40055	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-3d5d-b7c65ead5ed1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-0404-23e14bbb44f0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-2a4b-416356e04783	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-55b7-da8a52628cc5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-8bf5-3dc4ac7f4d15	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-154c-d1b26f555d63	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-45df-0262826b7649	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-f510-029e41c9c162	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-b9ec-75f1b0223dc6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-0a67-ff67c6f35b18	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-a518-0badf0cce104	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-c1fb-2f9a5ced14a2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-de40-5eb86f88bab4	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-7556-7908e6f22e02	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-7869-641a2018b090	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-00e7-3deda9f2076f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-375f-4b94ba8093fe	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-816a-3c3383e1cae9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-da48-6450c522b30c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-e871-7015bd54f71a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-4b63-98083a50d5c6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-22a4-3acdc97692e7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-4936-765440703679	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-3140-c10edf10791f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-64fc-61844a3105c0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-4c31-7ac59fa13f80	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-6d5a-aee8ebde72eb	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-41e0-e28b42614ebd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-3547-8a9076b9478e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-56a7-65b01669d78a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-fb17-3f6665083c0d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-0d70-80016cec14c4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-12d3-34c4397fbaf5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-e64d-e489b0498952	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-546f-2d6fa1746e67	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-8b37-14396c7f6766	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-ec90-3b586a1bf66b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-cb6f-92656f4160ec	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-86fd-961f57928209	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-6c29-4e60cc440e1d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-128a-322a0f471c34	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-86f2-abd20839ff63	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-af8e-c1085f3e0b3c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-8772-bd0d5b0a2522	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-c5fe-596e6c85182c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-2864-7f597bdb9128	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-89bd-b9edd2dc22f6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-207a-cf7ed080fd71	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-fcf0-136a62d92b60	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-d04e-7f871e4e2dcd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-3f70-6462b7fd8a63	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-f577-f54e3a685d1e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-0b7e-a351b7a115d2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-a350-e53cf79b620a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-1319-27f49423a8d9	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-42c6-c878ca8cee8f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-3e00-b6ddd4d3e293	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-3790-e304736d36d7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-613e-c7ed22067394	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-2562-3047cb3618d4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-3ab9-044ae886df80	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-b542-be5d2a4a201a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-0dad-ebbc5c8f281a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-1e6e-a7264f9cba90	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-4e43-e916df839805	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-52cc-193f231f922b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-fe90-8b50d455343f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-91fb-7754f4d8009f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-f412-4682ad442a38	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-684e-1e2c91270b3b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-c253-109d01122034	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-8a9c-75d8ca735835	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-00d3-b37ca7e03495	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-f13d-da7fd15eb4f7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-162e-74906ae2feb6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-d0b4-274a709e3bc7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-236e-e50828f83c80	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-521d-1cfb9f62788c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-7e3a-2db2a2b40c11	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-edfe-c143e2925a51	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-edbf-cbc45a0137d9	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-da13-a5da3be955b5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-23a4-665565920081	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-0a76-f7124d266fe0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-fe19-8c24437a57fd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-3b42-870c915f3eae	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-1623-0a6d1f736942	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-ec69-67749596c3b7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-0511-8c2a682faeb3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-e166-d83278100f97	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-2519-470be25ebcdb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-b2de-e740be3bcd04	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-b1d4-14d3d2ab9d37	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-cc62-fb825d566b26	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-700b-54fa983e7c46	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-2b3a-a177694a823c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-3610-961f6dd8450b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-06d2-35bddf1f0f55	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-10a8-974325f69479	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-ce26-8eba130bd046	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-a628-026727a96373	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-9370-c00b66c9e6a6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-4d92-c842649075ae	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-a094-09619508cd7e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-03dd-05330126782a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-c358-a4cb7b9c0805	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-3e72-ad6a8162bfc1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-cc37-17d713fd5b65	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-52db-01cb5ba7f6f2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-8d71-1ebb38e82abd	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-66ba-994b2f68f6e0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-d44c-7c1b245430ed	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-8e16-00051bf3117d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-91f4-c92307bc6427	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-2f52-4062808cbeb6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-faee-20a00d2f1bea	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-8410-dea68cbb098b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-f775-683d3d4372c9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-8c87-dcf1ca2e9e02	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-76ec-cdbb74fcf7c6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-fb33-6dda8ddce28e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-9c68-87c824de5f00	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-ee75-b534d6250097	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-711e-84c2d5b722f8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-d7e7-12d2167fea56	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-e066-18eda54258b9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-904b-6c91aa66b9db	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-67eb-821df2b99730	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-f3cb-5d61fefdfd54	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-dd97-c7e6cdf6ee34	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-d756-7a0c7b28611a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-1bbd-1e8feba73789	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-ca9c-782546aa2d1e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-ba31-bb1aab269736	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-15d8-19c126a0cfc8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-864f-49cc32d3b765	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-c04c-41b305f70854	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-42fd-9474708b97d1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-4c29-2c928ed1c128	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-86f0-feec759fa9ab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-b7dc-b567b1c0705e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-03da-198aa6a4082e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-aa38-79d50d252e75	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-db95-5685b4dcbca3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-919e-15af0d16f6dd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-bdc5-c5c4d171234b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-288a-28af2d92e98f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-928d-81fb4bee187b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-9d4a-300ff54fdc5d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-5d98-065c826bca05	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-e7c5-b6ab8d6674d8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-5d17-9d7e55117e2d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-6c8d-639bb0e709fd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-66dc-d2993e42482d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-fae9-ea69628f9999	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-942c-34ca71d2d9d5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-dadf-9d8ae8f76398	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-7056-a6acb8b94539	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-5be2-498967976acd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-9270-526a6bfffc64	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-f3d7-098590f7befc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-a2c7-8a224b11fb00	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-e282-39c8d2360b8d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-e6b4-d4775c5ae54d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-7dfc-21b746612e3b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-91d2-a0fd7c7b3bfe	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-6c79-2f9358a4e119	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-7411-15bc750157dd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-6fe6-84f530a65efa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-82be-7d7936682b73	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-a33e-f93457495a0c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-a9b1-36e2bb04b1d3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-6658-82d3e9208ab7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-94f4-6bdc6024e7be	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-12d9-74c04840cf8d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-ec0f-b82159512e91	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-dfde-09d239775d3a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-4aef-01c96a6a2bdf	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-6593-d57015efed7a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-03f4-3b8efaf00048	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-d30c-08ce226b5946	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-b999-81889d286e5a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-0320-08b433341ee9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-b9d2-2e1ded4247ab	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-1d23-0bfc1c610566	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-faaa-900b804a83ed	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-656e-f7cde184f3cd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-5b02-456cc1a7cb0d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-e67b-3daf94ba1545	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-ec09-046a6a0594eb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-30d3-158774d76e47	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-0e75-b2568322b3cd	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-e697-a59fc85d7837	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-b492-55cc77b31b51	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-7a3b-cf6d6c4eded7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-747b-0e93b426e78f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-32c1-e16c7d5780b4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-6aeb-37679dba2eb9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-468a-efea9edb07a7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-ca16-7586c48889ac	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-9e7c-a12cdd7735cb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-4895-9c84045ded67	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-7f44-737662e115f0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-6fc7-0d236cd5546c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-4302-884523adf681	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-01f0-56790b58d950	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-9585-f3a2a0e55b5a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-9f07-13ade47b6def	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-7f04-bbcd9f645975	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-5380-05dd7c53417c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-f660-f584053a196b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-fefa-7027f254cc5d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-8ada-fa215354eb83	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-9d77-e53c983274cb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-e56e-753d0813f7d6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-0948-1307759ca946	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-1873-d8736d1cb0f1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-a8d0-2d3ec4e979c3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-94fb-259bf88fcee4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-3152-3c6d9a2d7528	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-9112-a789dfdf1255	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-3cf2-9c10318ae4a6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-e15d-aa14dee959a1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-cd73-6c8ac03b155b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-8d5e-56f7e2a58aca	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-7040-325d72d891b1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-6978-282268b85a4d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-0e06-76f3ad00b3d7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-c01a-8ab9bdff965b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-eec0-37bc6df2c905	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-1166-bc72b3f8df96	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-f2ae-079922fd297e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-58a5-cf5068494d9f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-0b0e-b2f1189c5946	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-36aa-4bec894c091c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-e19e-c6c5870a29a2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-036f-d463ddd69217	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-2045-3018af30a4f1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-7460-87c91d8e98b7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-5c5f-b974018c52d9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-d8a4-81866eefd2b4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-5a1a-175c69d11df0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-85d3-a225d3845b51	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-b702-78b2d9e8c1c4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-96ca-af0f3fea1ee6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-ea72-ad088fc22fb4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-24d3-fe3c32eb8d31	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-0579-7671ddd6c3ed	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-1854-1af460f4fdf6	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-bef0-6e1746adc2aa	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-29f7-350395b73074	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-e5e9-8a742fbf1e08	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-764b-a1489c86178b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-0c2a-841cd9e4bde0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-6b0e-88059e6727cd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-6a83-aba577fa7148	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-fc08-823a283dc197	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-77fd-508f7c265e4e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-55bb-e859798105dc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-09ea-9b7b9dac5e7e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-bd18-2400e05b1767	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-f724-cc94740c5233	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-930e-8e262b7b041b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-36f7-29b4db1a22e0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-a608-88a4ae2a4903	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-9162-2d38bddf4a34	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-8563-21e0361dd5c0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-cd81-573b56a83fd5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-1337-97b574851838	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-e537-61a1ed489281	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-15c9-017c1756465e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-3b22-747e5280fae9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-1bec-a0205c71e9a3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-9d3a-6e157a79ae08	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-f562-f39e8ae0428c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-eb8a-0ac21fc4b85a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-2f9d-770028b777dd	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-4c9f-b2cdb417e846	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-1f48-2961c88ee1c5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-f6f9-bacc29cdb003	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-73ed-5fa78aaae7a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-0adc-f887c29a0cd1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-c43e-11b8c428a3f8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-697d-0581480b4b6a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7eba-4cbf-81a85dd60662	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7eba-b194-9be76835c85f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7eba-caac-2240543ea7fe	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7eba-f8e8-82bb54978257	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7eba-98fb-a66014c35d8b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7eba-f88f-f9b9bea58e42	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7eba-9962-8b367f0b4b0d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7eba-5209-7403973b855a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7eba-838a-6baee62a18a7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7eba-8f57-ff5e2a5f9696	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7eba-79f9-511a92f01df2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7eba-5085-c02b66021d21	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7eba-5ad9-66add43504b7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7eba-cefe-d57f0b93447c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-8815-b2292e0fbb90	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-57c3-e7ad38bcad9b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-5769-93cc0ac7e4a2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-9073-902b4b65a5f0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-3a9c-6015c6a0b9e8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-7082-7a3e41bac01e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-6532-d06e73ec91ec	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-df2c-ad26125128ce	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-dcca-c93a5a85d2d6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-cddf-9869e7bcfd3d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-7ca5-71c013905cdc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-16d9-151ada1448c7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-f50b-7d10a666bacb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-e4d9-46620434c14e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-2620-646a550fa737	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-f028-2ea01902a1ae	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-c640-92eeb2888b06	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-dcca-ba23b98eb325	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-979b-48638375cec5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-4e8f-cb5d7d50d80f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-538f-08cf15601ac8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-297b-5d562456d823	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-d052-7f26990a60b6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-d376-32533cb41822	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-90a0-ebe1ba316d97	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-95cd-4499ff16bed2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-dd92-0305161ef399	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-61ed-82bc98295568	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-fafc-b488944f318c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-df6b-f4a0245133fd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-e923-c697cb4c6ea6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-1638-13136d1c9a6e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-402a-b5ce18cbaa8f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-e840-ebfbc3f2115e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-3728-bbe57b92468b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-2596-f021441c9840	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-9644-672219e8614b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-8c90-f69388f1cdc4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-9635-a803d2ad1c57	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-3a27-a70a8aa1b91a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-aecc-3e1c748a7b3c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-7a09-49cb8c266f83	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-3b62-745a665f4749	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-de0f-943ed8d9ff42	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-dfe5-dcf77f62bead	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-42de-ad4209f8b075	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-468a-c17f0e6b76a3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-f95d-9561b29e777b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-84e8-1a67a8822fc2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-bb8d-e8bca9033854	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-af54-55b9e63be08a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-2a0f-01c40a7bd7af	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-e528-8e488d474de9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-2e19-4b606ab6d51a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-7ca7-fcb05959cc8f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-256f-8c3a9839caf7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-1399-1aabdeb24fd2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-be51-21d5f9441f9f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-8c2a-e76672f19672	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-b085-4a3537021c75	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-611d-34ca494e59ec	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-d7b3-6ee67f11472a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-8984-5653f03a8062	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-d068-507517946f09	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-364a-197e92dc0bcd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-417f-5e11e483d7dd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-9b55-35702d8a58ef	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-ab62-548f8f1ec253	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-6638-4fce529f1776	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-6869-922cac59ba30	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-bb81-79aef0440e9c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-5c71-ea68e4a6f25e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-3dad-0145450c4278	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-beed-eea169917a9f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-162e-0e0b9724b82e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-6248-8c0d804bdf80	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-3c48-c330408a0942	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-0227-c81de9966b97	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-9ef9-18078f0cef96	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-a03d-6f1ef82d5ee3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-e4fe-60ca2005fe65	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-e4fa-6d1028ee446b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-5aff-baebeb11baca	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-3088-c2001ae75a6a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-6e57-7e66686f6fc5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-0d6c-872e864a908c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-095b-aedbe89f4d8e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-04eb-028ee9a9af81	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-b3f5-7fb6926f3157	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-39ae-ea7bb4fe285f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-cf9a-0b2e1256415d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-9599-9cc10f6d688a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-b3be-761497bbdb30	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-ea1c-886d8e907b44	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-e8ef-c01c22bc46c4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-364b-ced28b087e9f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-11a7-0e1d338a9721	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-477d-4a489ad166d1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-f8ff-4c2f30f148db	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-582b-b4a1af31f60d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-bbd0-bec5de7833cb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-6e52-bf546c4c8d59	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-1d97-9d92a9f5fdcb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-6893-02df41d130c1	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-592c-e721c104594a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-1b1c-9f44bb978487	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-75b8-7c2735e5c319	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-26fb-75073c2693da	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-f1af-fc949d4f9292	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-1f06-53bd8e0ce319	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-6931-a95be382fdca	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-f22c-b0d273ae550d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-b20f-ff2474a9bf0b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-ebdf-e3bacd25cd96	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-e045-c92961c5befb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-7e88-5bca2afc34a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-c0e9-c57df668c76d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-1981-209e49386118	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-abb9-3f3928393455	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-f001-89e2506669e6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-0426-425859ac0137	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-8f4b-801d4e822d9e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-5515-e812cbd10d8c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-49b2-c881f1a009b6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-d305-47b7f8ce0465	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-c94c-b9996954958f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-fedb-f59b5a27412d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-29ae-ca01b275e52e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-dd3e-73ef7f836dd1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-c61c-3ff64f33f3aa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-d580-c13747204ffa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-ea3f-2217e0933eca	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-6d2e-1f2f85c965e6	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-d4bb-75cd67574e9c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-2cfe-d8135282ee9c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-6248-23ffc6c37e75	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-c25f-4418768868aa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-9429-a62bfffd1882	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-1b12-f3f61b009f45	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-c6d6-2ffe10c6a052	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-d626-2486898d4257	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-43e5-63a08e047062	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-7c4d-c216be07000c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-dfae-9b7017b76388	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-5022-9183e9c41d80	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-dd83-106cc1422d4e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-2f03-15aa6ff3794f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-2d33-0cad6e59e75d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-66bb-71a720d84837	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-e1ea-ee7794cacc17	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-dd00-4b5689b06695	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-7b64-a431d253c36f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-470c-87cf0ba3d88e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-3784-cdae3724d80f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-6410-3d02adacca2c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-89bf-2f4425667e7f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-7339-f98308027031	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-1c04-19bffa458a50	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-933a-064eb72cf5be	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-074f-f14439a1a167	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-526f-daedda9ea7ae	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-ac8e-941ccfff1996	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-7858-27b861d9fa3b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-d033-91a04bac40cc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-cea4-95d30d2d80af	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-f020-69220e070d52	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-9080-5eab4de99a2c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-5eaf-0352e6c39847	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-87db-60dc74a507b7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-5b29-06644f4b1b8a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-1e05-1576292f0fd7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-eb98-0089bc267747	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-e9b5-926d0bd3dff4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-0e6d-67f7ba9b1001	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-dc84-8186d8d60519	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-3cf5-60b481eb87ee	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-8078-05e21e6b5291	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-a6dd-3cb1a5bd1612	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-3478-9fd1ca8c8903	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-54d0-014bf7d6f600	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-6a0c-e85d8bda2d1b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-2de5-1f058910e614	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-db7a-b19ffae4be45	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-c6bf-ac8e7d38fe93	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-2c9a-c6adc554000b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-755b-39fcbcdcba9c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-5aa9-4b8c19e62954	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-d331-7f861a33306c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-0ed1-fc24431a75a0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-5ef0-b78e57bb8778	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-f09e-5f2d50226644	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-ff2f-923052d50b05	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-b412-305faeab4097	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-6d5e-c65290796f92	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-b03d-eda2818148d1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-d092-e96c93896a05	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-ece8-60315a4806d1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-f74a-eda8a8b6f3f1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-e5b6-51fdfdf5774d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-afdb-b3804a2124b2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-bc63-df9a8ef20b54	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-4474-b5773cb2cf2b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-7243-11305b927120	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-3874-c7281c018c0a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-c747-de78e612d4af	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-10f1-346077656919	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-ba28-5bc69194ce61	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-00dd-a63b3361e7d0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-f3e4-6f3ca0741938	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-0008-a9cc40f228ca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-78c8-ab923740932d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-f1e0-4b5ffcb5b3eb	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-06f9-4a987d4519e7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-6db2-b87b604c0069	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-29b3-7f8258b48606	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-eaeb-7a8981feac45	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-9a2d-ab0d95d0ca00	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-b54b-2a3f91f36bb8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-6886-595d89d0e4d3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-08b6-24e09310d362	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-e4be-d2debe4cd388	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-7720-3e55ea4b60d8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-ff0a-5f0a0be6f3f6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-ea5c-247eb618c433	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-2dd4-86bcbf409c16	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-8927-bb1bd1e71959	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-e066-354ffb9493ae	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-02d0-6d6fbf2ac836	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-502c-75157b46f753	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-b27c-031f03295c0c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-8d62-53962ed4f6ad	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-1306-d6ef4e7c3494	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-9b2a-b6130d8da140	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-0005-d8be7f7d91c7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-633c-565503c683df	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-fed0-aac327848150	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-ac76-56119700fad9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-b0e1-030d76478d03	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-27ac-f58a0b5ccb4e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-cd4a-36e3845f0367	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-0ad9-f1ca30fad204	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-2366-40d64f513682	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-2b52-b3ec36e5c496	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-0671-ba331bb37306	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-50df-c06a3ac67459	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-97a1-a7c882d2d239	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-dfc4-d788f01fcae6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-8210-af7b9bca6a11	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-0f76-6787549d615a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-75c7-c073441f001d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-9c14-3a25c2d72fa2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-3777-e4402e29facf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-9073-d35379a689c1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-510c-00140c33f54b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-7ff3-bc41c0a04b11	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-9d79-71295d24ff19	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-eb69-d46517411c89	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-bd6a-7f92c7c51c06	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-3f33-963ad3cbff83	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-f324-f81f6d9844d1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-9fab-4f4105c72d74	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-04ae-e37dc803440b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-51c2-31b9c9ad5b46	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-2bf9-740a18b81c4b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-358e-ce152325213d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-6e9f-9a35bf878ae0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-d7d9-6cee72c55c24	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-5782-8f93d54a20d7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-b5f6-8fd419a100a9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-1113-e45ab87d3a03	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-e44e-0860760d470d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-db98-a74c7510825d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-3ca7-3c206c1962cf	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-837a-66cfa2dfe839	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-931c-d02d978731bc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-9dee-6e9220258c6a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-2528-7d731adace00	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-fe86-9b2fb6c61ce3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-7b72-f97c183f35c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-9cb7-dc1ab0cd644b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-4108-4493ca296986	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-4164-57249219b4f8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-e193-6dc4e1408c86	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-02c1-a7f60f2b4b00	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-32b7-2eb6ccc56675	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-5c88-74379788be8e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-0368-6ce405386d5f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-cfe7-e757016302ba	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-c768-92dd7c2776de	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-ad7f-0b81766496f2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-cf92-95023b82d2dd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-f66b-0741c230f3d6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-70f5-43096974769f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-3109-22bdff544d1b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-8c75-7aac98c0085c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-695e-24b77dd0d9e5	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-0433-2afc295189a1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-bf7f-191e030be7af	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-5799-d1e6fcfc2e5c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-8335-d95449cfde9e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-d771-48e2354bc77f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-674d-55a7d3c1032d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-53b8-3a5868ae8d02	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-4c7f-0356b7f93bce	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-bc45-f70bfac408be	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-af8d-6d49571afed3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-e506-d3bd78bfa811	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-ba9d-016118f1415d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-d8f6-3c1252f46612	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-2b89-1295d755aebb	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-e3b3-ea824bbb85f1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-b939-d8230cac4c56	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-fdcb-16dbc0e19b85	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-d8dc-b76b4491fdd1	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-1edf-07314e25f392	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-b028-aa5392fee729	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-c581-0fab48cac5d5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-cd4b-00ff1e2dc06d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-7e92-00ebf456d499	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-e6a3-65fa3f4ea847	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-74da-51bea41a6691	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-fec4-8c55b75b4c2d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-e15a-438e7d73ba2c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-da6d-74b3e8703885	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-fa45-8e0601f5b18a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-5ed0-2024a00503d7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-85d3-b87a20b449ac	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-d122-92d5e74f7b40	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-45fc-63afb13bb83a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-f541-8386e279933f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-c235-be8425c52afd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-7dd1-0f1a5616d4c3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-891b-1214da8220ef	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-01ea-e341165a7cd9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-83da-3731ee5238c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-7ff6-227bf98ff00d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-da1f-278ea12afee6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-999a-824faabe3cac	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-2710-6f05f1c3a995	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-5c3b-204af4b4331d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-6d1d-f8ec0d468bf5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-1dd6-3eafd8cec75e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-0f6c-d16f515a60f0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-0aeb-23d4a61eccda	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-a818-3f8e2ca35ece	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-9348-b8214b361e99	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-8ff7-de72a7f01119	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-f9da-83af0bca1af8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-0307-f999c16e0a5b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-09b2-86fe672b4b3d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-87e3-13abfc00b2fd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-03ef-a9521962c611	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-343d-bc133915ae9e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-b63c-d6fc8b2ff67f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-b226-17066f7491b6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-1321-90bb858b7c3b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-14d2-802f56f13039	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-dc94-fd0b125de047	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-bc68-a44cde26578f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-cd17-4d534d8c59b6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-864a-2e5bdef19dcd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-b5ab-363a08628028	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-9308-d81344b7e84c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-4bc6-89e2d9621373	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-f8c8-65ba764eddf9	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-fbd3-6f263a5bf5e3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-2fe1-e295fc890c8e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-fdfc-ab9f8f168aa1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-6898-6e556b6e09a3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-c329-00856ea1d2b5	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-603c-2c0f0cfb706d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-b1d9-d11472d6e061	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-b5a0-17b0f30cfe23	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-7a28-ef4f0ccd3cea	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-5cea-3cf9295bf2dd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-1ba0-80b397983b4f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-729d-baa6212081ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-afa7-119139ff87df	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-b88e-07172376d3e7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-3c23-035b766e2312	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-0a9e-5210094c1ef6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-2072-aa53b3a4c436	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-5a34-a52e96dab669	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-8be9-f2cdfb237940	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-e8bc-5c782697101b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-0ef3-18bfa67cf5fa	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-34a2-9e2a562d2a79	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-a3b0-1c37d3c16767	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-2224-7b2a31773049	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-6fad-fdb7f918c407	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-842a-c6c3e0c05932	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-16bd-623a1b6a298c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-ebe4-30f5017e586c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-08a2-49d34b1a3bfe	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-344b-ea17094cecf7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-b1dd-09edce9e658f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-06d0-73a6cd3143d9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-91b6-04b4fb01df2b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-2ff4-7c6bf3d62a48	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-c517-3eb8ae435954	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-96d1-a7b4f62743a5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-93fd-412b05e53fab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-9ee3-60f00991094a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-90ed-c0cb1f6dc5b7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-19ec-b0b4dfcf94ed	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-b738-b9bfd52e6320	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-e37b-127dbeee107f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-f667-4d0a8fd833fe	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-cbb3-e7eb3ff5c0f8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-3644-a0c689500029	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-3690-1c6f858dad05	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-577c-715da9fb6823	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-99dd-1dec2c3d5031	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-e74c-1abc28205c82	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-0135-5d1c6173e381	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-aedd-273ccdac9554	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-dc4c-d92d2346d98b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-42ed-3fccae9ba6b7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-800f-8edfc625ddf3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-4931-ff72a9e3d361	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-3f70-cf704d9d64c2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-b007-93ee44b83e87	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-a506-fb152f916898	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-3066-f1a51549bf14	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-ab66-41a7b84ecdbf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-22be-5fbfb78608ce	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-b1b8-0c32e9e38e11	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-f10e-d357be523e63	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-a322-60537ed0e092	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-f47b-59a5e4d8e93b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-28fa-4f1f13c90cc5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-7e2f-07b8c40351c9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-ebe5-ae6d316b0ae2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-dc29-591c1feb624d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-0925-8b8c5b0f3fbb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-840f-3012ca4f4b5b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-d016-e5175198b56c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-f135-8d0dc9947af4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-6982-b4af0985db1f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-62b4-206fb3b2af0e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-34c8-3a9579f030cd	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-b44c-9af85ea16ab0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-2334-a5e477be4f69	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-2283-5ebc0f584b20	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-b9db-95f5b2467479	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-fed8-f54764f38f86	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-19ef-4b01d82fc333	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-dead-7215f5d7409d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-2f24-72e1a5009469	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-ba9a-9bf8b0e9555c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-112c-6357aa3a4da2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-7872-4189896c9c96	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-9e75-1e3310cc73da	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-0494-b2696b461114	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-8fbf-ddf0c81f2805	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-8377-8854069c0b9d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-83c8-b84e7907f920	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-380e-e63e30f1cbcc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-d3ea-0ef66fadaf61	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-73da-b33978e1959e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-ba32-284db29384ba	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-ca41-3bd90b7ce001	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-6101-7b4a6035174a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-72a2-f8902b37d245	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-9804-b39bb2f743a5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-a047-7a8c94ea64b8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-bf05-5f13ebce793f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-aabc-1528782bd1ff	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-602b-718f450ea5be	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-6b22-f83eeb4a1dd0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-0fb2-a426e221ef53	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-022b-f35932b3d24d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-a55b-91bbac250bdb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-4966-9d3521388179	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-9312-51a1bfffd658	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-5841-d91081019b58	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-8fc1-c13d66a11978	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-4868-e7bfdc4f5aef	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-f859-00096c156b07	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-66f3-5069ea4a64a5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-8428-c17763a02d9e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-e8b1-68e93ab049f3	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-59de-23b464d64b17	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-0b18-b1c1f064c392	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-3d75-0818baab5ab6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-c027-0343456d2b65	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-d7c1-09c8f141fa78	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-2ccc-9e2c28ac97e2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-4188-6270ea785b53	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-81af-0ccd454dfaa1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-b5e6-ed76e1bbd86e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-8d05-d228658d1349	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-30d3-b3509a5e2a6b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-ed34-78ba51c076eb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-06e4-bf037d4fcf8f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-33de-b5a86d2c51c6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-1cc7-86cab305db07	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-7d3c-a896aa9f6f57	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-0924-b363bc19349d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-e5f4-b831746292c0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-e2ac-71dbf7b36f0b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-8426-030ade800677	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-74f6-b7d057a6dd10	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-6a55-d1a1c157c076	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-e230-b1a755eb0b40	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-dae3-d5436361600d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-8e4d-c2be8e80c058	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-ecf5-667dc336709e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-c0b6-2fd94e56152c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-69c6-84f7e388546c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-1f81-add5bab08384	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-d67f-8d76e77fbd20	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-54f7-4bcc0a865ec5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-61ef-2f168ad22885	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-4503-6791e8bae2a1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-372b-d8256b64e7d1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-4c20-ec00424df759	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-47aa-f5e70184cc08	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-1969-944f803db1d6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-44bb-1698020b7af7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-a200-4d45ca3ad42a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-a9f5-060cdeaebcac	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-d880-87957961489c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-b15e-fca7baa24310	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-8ea1-c17d7206cc70	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-f358-2a2d51d7fff8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-4707-ff8db8cf7739	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-3793-34a620dff8a9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-db01-2a7f8a8960eb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-c091-a2021c36153c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-5e1c-578dc3089abd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-0b39-bc8a93945c9c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-b0be-71ea57755a2b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-0810-59625d62d761	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-aad8-6c6f4841241f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-f289-739f4b8b4c54	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-14f5-4567a46c5f6d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-b007-c7ebf6c4f9e3	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-3edc-a38cfa2ef59b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-2d83-a7931034a980	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-206e-c806c75f219b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-4c19-9dc7862e6d2e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-9717-9e3f411a0e8d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-d25c-2ba454a30d00	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-b2a0-a7afee2eee41	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-81ba-9e526951979a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-b7c8-81ffc5298aa4	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-1e99-3d32422f4354	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-78c3-3ee3325604d5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-01a7-599d1956d6e8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-461e-babdb09a2a9f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-1894-0c7151374940	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-9830-58934fdaea53	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-a47b-499ec1da7537	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-1715-2d74f041cc43	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-c055-849d255fbfbf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-ff11-88180a338e2e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-8b53-5ae97668ad04	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-56f2-8c65418648e7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-357a-3681fdc412a0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-cf2a-a102c7c9e053	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-9ba5-967a4c069fa3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-4a1d-137e9ee831f5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-2868-9b99cdfa97fa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-ac09-c0dc56e53a5f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-2e80-11f62e604aa6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-2043-a92b60bcdfa8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-7073-42a9be4b6f70	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-2cb9-1d0cd1ec8d6c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-3c2d-bcd28dacb7f0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-8a2a-a9519e33f5eb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-b483-0aa7dbf278f1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-2035-38923f23ff57	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-ed86-8e256ffd00e5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-5632-1d0e795d8fef	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-23aa-eb7e18a21ae6	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-04c7-173f8093d971	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-025b-c0a54174558a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-b548-328e61c7ab08	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-a382-c16a987cbcbf	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-15d4-e74735a16bce	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-eff1-56a5a7d1f4e5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-adee-40d36b08d8a1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-cb30-4b373caf0e8e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-0374-da2c0973bb19	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-b347-07964cc3d7fe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-abef-425e76d485b4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-1f74-2c4a199ceb43	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-d72b-82fa2eb33d11	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-ab8c-5f9aa1270549	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-336e-3a8524b0c984	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-ca53-bcfb699ba6e1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-8544-1367c037bcf4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-33b0-b01fd558987d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-bf86-b2e5ee76c384	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-2db4-cfdb1e278d5b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-c86f-da8291467579	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-edfa-312be0c92f68	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-786a-57f2f5a9c2fa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-93cb-88a4591175fe	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-c1d7-dca325ec3c6c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-d304-8859d6ac9191	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-62f8-fc7203f12ea4	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-10ac-718ddfc44123	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-45aa-c3492f154274	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-37fb-566a70f5cb13	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-e785-fc6870b8007c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-c9ca-b4e641aeb023	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-1af4-4730ef9c10cf	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-60fe-76dfc638cad1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-7f6c-400cf1018950	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-41c1-d4eb547ef748	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-d7b6-80b515404fda	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-32c9-2c94e9bc0a16	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-58f1-09c58c1d4bdf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-826e-17e1310a6bf4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-cb8b-9f19db8da41e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-d290-1996c502c9dd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-59e0-783c23825e58	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-0068-816ceeec3ab4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-2c61-7938be295375	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-58a9-5e9ffd572983	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-fd7a-a582776aca0d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-0cf7-304653abbc5d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-b917-3eb25f83fe29	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-9216-702453595da7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-4c05-4af0f7defa61	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-4160-be512449669f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-0a7f-c52ba4235be0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-1732-0e2c30ac74bc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-9fca-85f6cdc15ca5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-021c-302f81af37ee	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-7b97-b6459782af2d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-0cce-5b1fdd4bf57e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-e339-37b848359037	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-fe34-5223624c8d6b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-103f-f27622d58582	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-6f53-baadb69752a1	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-20b2-e30962dff433	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-9783-18eec6e4bcd1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-dd96-04a2d5e7b9f3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-9525-d2bc5a84c6dd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-ab7b-117e1ff280a4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-2ad8-686fe2806705	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-e369-bf4e8bf4dcf0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-14b6-677b63f43e2d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-69b3-3b9eef85548e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-71c4-6be3f85cf851	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-5460-4ed080000e6f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-a68e-7dc0383e22f7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-59ef-6f7697edb0b2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-d4b6-1a71faa0163e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-a1d1-d394bd8bf7c0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-9e24-b5fe566324d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-0017-7d5f4bdb7120	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-0966-e7d9b6eb107c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-2af2-aaed8d8855cc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-fff4-f570b2024cde	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-8d17-353805278425	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-2db7-353a1df9a1c2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-8c59-3691ebdde93f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-e298-faaf9ec4f4f1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-6e1d-164a1ff4f5db	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-c045-78f8952de840	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-0580-f43910dfb50b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-4696-77ca3aa237e3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-80fc-130e5a4cffdd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-994d-593f9dc84607	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-dffb-fdb92c82289c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-2230-751fa1dac772	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-299a-47765e741a4f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-ce16-e41c9a247a3f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-0a77-3c691ff279e9	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-a0dd-b832f8ab4128	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-6a32-c8d81aa66a6f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-a196-a513cacee3a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-80e7-5ec5d9953964	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-c6b8-f6c1db96ebdb	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-9980-0e3b4629f9d1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-63f0-f7faf4ff5261	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-c06f-99061750b9f1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-478c-3d3d6d871bd0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-9eb9-8f968d1e2df2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-88fc-f4e9256ddc98	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-34d9-05733b2e326e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-2426-f59b02be6ac0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-df30-2eab7039c6b8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-7ebb-5adf-e218785a3c99	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-7ebb-95f1-6bc7fa66fcf2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-7ebb-6303-aeae95b67b86	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-7ebb-706d-aa18866bc168	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-7ebb-1140-84799d97e729	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-7ebb-cb7d-40f878486774	Role-read	Aaa - Vloga - Beri	f
00020000-553a-7ebb-20fc-eb9f6de49e4b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-7ebb-e081-de1fbb56bcc9	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-7ebb-2ed8-3ec350c99b26	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-7ebb-4225-045e73afe8f9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-7ebb-4b1f-6242beb22d2e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-7ebb-aff4-73d238ae6333	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-7ebb-6f67-be5604c96a99	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-7ebb-8664-f3a34b67cb95	Drzava-read	Seznam držav	f
00020000-553a-7ebb-a6d2-12fa6e7e68a0	Drzava-write	Urejanje držav	f
00020000-553a-7ebb-08a9-9b54133f09c0	Popa-delete	Poslovni partner - Briši	f
00020000-553a-7ebb-30ac-9676a5786af5	Popa-list	Poslovni partner - Beri	f
00020000-553a-7ebb-b074-c15e3b5d3d70	Popa-update	Poslovni partner - Posodobi	f
00020000-553a-7ebb-0627-64f04256c4d7	Popa-create	Poslovni partner - Ustvari	f
00020000-553a-7ebb-0a85-99859c19b238	Posta-delete	Pošta - Briši	f
00020000-553a-7ebb-2ae8-4010339d7610	Posta-list	Pošta - Beri	f
00020000-553a-7ebb-5645-f9f20064160d	Posta-update	Pošta - Posodobi	f
00020000-553a-7ebb-660b-3cd49b5e1e74	Posta-create	Pošta - Ustvari	f
00020000-553a-7ebb-5355-ddf4bff93037	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-553a-7ebb-c6da-719a8faf8a98	PostniNaslov-list	Poštni naslov - Beri	f
00020000-553a-7ebb-301f-5a4fac32575c	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-553a-7ebb-72e4-bd7b5eec0227	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2636 (class 0 OID 1413916)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-553a-7ebb-de69-9d6be0bfdee8	00020000-553a-7ebb-8664-f3a34b67cb95
00000000-553a-7ebb-de69-9d6be0bfdee8	00020000-553a-7eba-e38d-c5114c3b6e8c
00000000-553a-7ebb-ec4e-cee15a97f105	00020000-553a-7ebb-a6d2-12fa6e7e68a0
00000000-553a-7ebb-ec4e-cee15a97f105	00020000-553a-7ebb-8664-f3a34b67cb95
\.


--
-- TOC entry 2664 (class 0 OID 1414205)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 1414235)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1414347)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1413975)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1414017)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-553a-7eb9-f503-f637b73f9780	8341	Adlešiči
00050000-553a-7eb9-d631-a21b366b853f	5270	Ajdovščina
00050000-553a-7eb9-91ca-3fd25549a929	6280	Ankaran/Ancarano
00050000-553a-7eb9-da84-9a3eca53623c	9253	Apače
00050000-553a-7eb9-daec-9ceebfdb9ec3	8253	Artiče
00050000-553a-7eb9-c832-e2547aee33f2	4275	Begunje na Gorenjskem
00050000-553a-7eb9-0262-8caf6ad56e53	1382	Begunje pri Cerknici
00050000-553a-7eb9-2fd1-d6ebe8867527	9231	Beltinci
00050000-553a-7eb9-2082-ab95923cb56c	2234	Benedikt
00050000-553a-7eb9-ba48-e0ed3b10014b	2345	Bistrica ob Dravi
00050000-553a-7eb9-9a4c-41e673fe63ee	3256	Bistrica ob Sotli
00050000-553a-7eb9-21c5-4bb487577216	8259	Bizeljsko
00050000-553a-7eb9-4d20-2027b63cf65b	1223	Blagovica
00050000-553a-7eb9-22c0-23676f2d9c9d	8283	Blanca
00050000-553a-7eb9-b734-eda770ebe094	4260	Bled
00050000-553a-7eb9-025b-526ddebd370d	4273	Blejska Dobrava
00050000-553a-7eb9-9cf3-7e5517e0d91f	9265	Bodonci
00050000-553a-7eb9-9d8c-73812fa0ce48	9222	Bogojina
00050000-553a-7eb9-f849-a76f7343fec6	4263	Bohinjska Bela
00050000-553a-7eb9-24b9-5b5f3a2c7239	4264	Bohinjska Bistrica
00050000-553a-7eb9-5006-dd2288da5500	4265	Bohinjsko jezero
00050000-553a-7eb9-0834-68bc496f4e3a	1353	Borovnica
00050000-553a-7eb9-e5a7-3250a32ddc39	8294	Boštanj
00050000-553a-7eb9-53fa-e621c287f177	5230	Bovec
00050000-553a-7eb9-4466-41ae54ef11d7	5295	Branik
00050000-553a-7eb9-cf66-a07017f828f8	3314	Braslovče
00050000-553a-7eb9-6014-c865b99078b6	5223	Breginj
00050000-553a-7eb9-53d8-f6fee7cf67b6	8280	Brestanica
00050000-553a-7eb9-a0a3-92cf61c04d05	2354	Bresternica
00050000-553a-7eb9-2f6e-fadd75dee6bb	4243	Brezje
00050000-553a-7eb9-1895-eef7aa9420ef	1351	Brezovica pri Ljubljani
00050000-553a-7eb9-d570-5b978991f8da	8250	Brežice
00050000-553a-7eb9-428d-41f0a4a307b4	4210	Brnik - Aerodrom
00050000-553a-7eb9-6c73-a80aa40c32f6	8321	Brusnice
00050000-553a-7eb9-e475-3ca0cbc5542a	3255	Buče
00050000-553a-7eb9-cafd-c1e42b4e102e	8276	Bučka 
00050000-553a-7eb9-a606-7a15b39f09b4	9261	Cankova
00050000-553a-7eb9-c2d0-75a335c4d425	3000	Celje 
00050000-553a-7eb9-d388-a3b78dd39bce	3001	Celje - poštni predali
00050000-553a-7eb9-e141-85b0a0262e3e	4207	Cerklje na Gorenjskem
00050000-553a-7eb9-35ce-0ad0aa761cb7	8263	Cerklje ob Krki
00050000-553a-7eb9-009b-467e2cbf0674	1380	Cerknica
00050000-553a-7eb9-f69d-f5af1153035b	5282	Cerkno
00050000-553a-7eb9-7658-3a36ecdd3c1b	2236	Cerkvenjak
00050000-553a-7eb9-e0fd-d8aa9a6f79fc	2215	Ceršak
00050000-553a-7eb9-6e90-6d1272d06563	2326	Cirkovce
00050000-553a-7eb9-5e84-e486f7a2533a	2282	Cirkulane
00050000-553a-7eb9-8e1f-75058a55f72f	5273	Col
00050000-553a-7eb9-7cc8-6cc44d829244	8251	Čatež ob Savi
00050000-553a-7eb9-41c4-e1e99360b188	1413	Čemšenik
00050000-553a-7eb9-345d-d41073173e9d	5253	Čepovan
00050000-553a-7eb9-a322-47003f4d88d2	9232	Črenšovci
00050000-553a-7eb9-0c83-c61561b8b2d4	2393	Črna na Koroškem
00050000-553a-7eb9-c5d9-350760ac89b0	6275	Črni Kal
00050000-553a-7eb9-1320-d9d23c476373	5274	Črni Vrh nad Idrijo
00050000-553a-7eb9-f3ff-59ced7e9829e	5262	Črniče
00050000-553a-7eb9-9b08-30d59062ac10	8340	Črnomelj
00050000-553a-7eb9-eca9-fdcb17e9ac10	6271	Dekani
00050000-553a-7eb9-e6cf-7151fbbf9d67	5210	Deskle
00050000-553a-7eb9-f4d3-9f3018dff5ca	2253	Destrnik
00050000-553a-7eb9-3b77-26162c4bd695	6215	Divača
00050000-553a-7eb9-ff80-39f41f278438	1233	Dob
00050000-553a-7eb9-b9aa-7c00c4b41713	3224	Dobje pri Planini
00050000-553a-7eb9-e46a-a0ebd155474c	8257	Dobova
00050000-553a-7eb9-a638-d94be06c8f35	1423	Dobovec
00050000-553a-7eb9-5270-b7484c30c327	5263	Dobravlje
00050000-553a-7eb9-6a3f-5330ce350437	3204	Dobrna
00050000-553a-7eb9-8b53-40bf46060383	8211	Dobrnič
00050000-553a-7eb9-5e2c-6ea75d46007c	1356	Dobrova
00050000-553a-7eb9-e80c-1363252cf6e9	9223	Dobrovnik/Dobronak 
00050000-553a-7eb9-14de-366027c5d2ca	5212	Dobrovo v Brdih
00050000-553a-7eb9-0840-b7d1d51e7df9	1431	Dol pri Hrastniku
00050000-553a-7eb9-c398-c4b8a2369c06	1262	Dol pri Ljubljani
00050000-553a-7eb9-8bdc-55b0635a5f23	1273	Dole pri Litiji
00050000-553a-7eb9-09aa-529c4305eff6	1331	Dolenja vas
00050000-553a-7eb9-fefd-81925bf2aa96	8350	Dolenjske Toplice
00050000-553a-7eb9-417e-1ba5241907b9	1230	Domžale
00050000-553a-7eb9-b108-6bdbbf9e708e	2252	Dornava
00050000-553a-7eb9-8a7f-34d57ea9777c	5294	Dornberk
00050000-553a-7eb9-3b04-ea576418fe02	1319	Draga
00050000-553a-7eb9-937d-e596d243e908	8343	Dragatuš
00050000-553a-7eb9-57ad-36535504bbaa	3222	Dramlje
00050000-553a-7eb9-189c-39a03937709c	2370	Dravograd
00050000-553a-7eb9-f7ca-6f139041d0c6	4203	Duplje
00050000-553a-7eb9-c55d-9a70b7786fbe	6221	Dutovlje
00050000-553a-7eb9-1edd-accf76930125	8361	Dvor
00050000-553a-7eb9-798d-91e25c222866	2343	Fala
00050000-553a-7eb9-e13a-3090966a6d31	9208	Fokovci
00050000-553a-7eb9-ec23-0fe66fed3882	2313	Fram
00050000-553a-7eb9-da6d-65d2dc4522b8	3213	Frankolovo
00050000-553a-7eb9-8647-a3ba2aed86c5	1274	Gabrovka
00050000-553a-7eb9-3fbf-a41afc140ba1	8254	Globoko
00050000-553a-7eb9-035e-5a881b6ced5b	5275	Godovič
00050000-553a-7eb9-8ff5-8871011887f5	4204	Golnik
00050000-553a-7eb9-2f41-c6546c9caccb	3303	Gomilsko
00050000-553a-7eb9-b311-8cf9cb3bcb9f	4224	Gorenja vas
00050000-553a-7eb9-52bb-ccd1e2e789ee	3263	Gorica pri Slivnici
00050000-553a-7eb9-ac03-ac3eb8dfac20	2272	Gorišnica
00050000-553a-7eb9-cad9-dc4c6c33e451	9250	Gornja Radgona
00050000-553a-7eb9-336f-d75775eb37f7	3342	Gornji Grad
00050000-553a-7eb9-e282-bf78c7484774	4282	Gozd Martuljek
00050000-553a-7eb9-207f-05cdea95f36c	6272	Gračišče
00050000-553a-7eb9-9c92-66470a39757b	9264	Grad
00050000-553a-7eb9-df22-2e7e0674bc4c	8332	Gradac
00050000-553a-7eb9-cacd-ad1d05f824d3	1384	Grahovo
00050000-553a-7eb9-ba3b-3cd2b7b4e7ca	5242	Grahovo ob Bači
00050000-553a-7eb9-d52c-94fdbf8e8129	5251	Grgar
00050000-553a-7eb9-cafa-e52de21490b8	3302	Griže
00050000-553a-7eb9-8773-3a7c6a17c022	3231	Grobelno
00050000-553a-7eb9-a8b6-c5f47ff8b08e	1290	Grosuplje
00050000-553a-7eb9-da26-6da9f94ed782	2288	Hajdina
00050000-553a-7eb9-e7a1-226012a6473e	8362	Hinje
00050000-553a-7eb9-7085-923a20900962	2311	Hoče
00050000-553a-7eb9-08c8-f5f8ae9f4df2	9205	Hodoš/Hodos
00050000-553a-7eb9-1ef4-dc106ae64d35	1354	Horjul
00050000-553a-7eb9-adfb-93edaa7418fa	1372	Hotedršica
00050000-553a-7eb9-e2f1-d9e005020072	1430	Hrastnik
00050000-553a-7eb9-6f0b-a64bdec7ff69	6225	Hruševje
00050000-553a-7eb9-f656-bc9acd796c19	4276	Hrušica
00050000-553a-7eb9-3ff4-3f430d057dd5	5280	Idrija
00050000-553a-7eb9-618f-daae53020ed7	1292	Ig
00050000-553a-7eb9-5f9b-49601779b7d1	6250	Ilirska Bistrica
00050000-553a-7eb9-b22e-e6dd6f86bbf3	6251	Ilirska Bistrica-Trnovo
00050000-553a-7eb9-f801-5ade2e26fcc1	1295	Ivančna Gorica
00050000-553a-7eb9-edb3-27a4f5e6fae5	2259	Ivanjkovci
00050000-553a-7eb9-7ef6-97f1d49848e0	1411	Izlake
00050000-553a-7eb9-ff08-3266600a60ca	6310	Izola/Isola
00050000-553a-7eb9-5fac-6161278ab273	2222	Jakobski Dol
00050000-553a-7eb9-0cc2-85dd23362f6f	2221	Jarenina
00050000-553a-7eb9-48ce-05f7890703ee	6254	Jelšane
00050000-553a-7eb9-246d-c2b303f42b5b	4270	Jesenice
00050000-553a-7eb9-5476-1757ce3ad1ea	8261	Jesenice na Dolenjskem
00050000-553a-7eb9-b759-4ed22934bfac	3273	Jurklošter
00050000-553a-7eb9-f0cc-9ed013560e52	2223	Jurovski Dol
00050000-553a-7eb9-4fd7-306a347d43a2	2256	Juršinci
00050000-553a-7eb9-f17f-a74bb8c237af	5214	Kal nad Kanalom
00050000-553a-7eb9-f7b3-d4db8eac2080	3233	Kalobje
00050000-553a-7eb9-16a8-d255e34a540b	4246	Kamna Gorica
00050000-553a-7eb9-1237-4bb2ef559cb7	2351	Kamnica
00050000-553a-7eb9-2250-21c00e945364	1241	Kamnik
00050000-553a-7eb9-bdb7-091e79fd666a	5213	Kanal
00050000-553a-7eb9-5812-8722e7e6e25f	8258	Kapele
00050000-553a-7eb9-bb3e-6e7a013a78bb	2362	Kapla
00050000-553a-7eb9-6385-2854582536a4	2325	Kidričevo
00050000-553a-7eb9-1bb0-82a5833898d1	1412	Kisovec
00050000-553a-7eb9-a14a-d5e320b756e3	6253	Knežak
00050000-553a-7eb9-36bc-5131dcff7cf8	5222	Kobarid
00050000-553a-7eb9-befc-047c630c663e	9227	Kobilje
00050000-553a-7eb9-05f1-ad1e2255237f	1330	Kočevje
00050000-553a-7eb9-aa91-4f9889d9b719	1338	Kočevska Reka
00050000-553a-7eb9-ab48-592f4a8036f5	2276	Kog
00050000-553a-7eb9-75d7-79c1c1103393	5211	Kojsko
00050000-553a-7eb9-f31a-d8b07b2c3dd3	6223	Komen
00050000-553a-7eb9-06f4-0162fc1fa8ec	1218	Komenda
00050000-553a-7eb9-80e7-b84184fcf215	6000	Koper/Capodistria 
00050000-553a-7eb9-7b91-068f3a7045dc	6001	Koper/Capodistria - poštni predali
00050000-553a-7eb9-0985-cdb1de22cb47	8282	Koprivnica
00050000-553a-7eb9-21c1-a5edaa8ea105	5296	Kostanjevica na Krasu
00050000-553a-7eb9-5d93-2109b78fa1e4	8311	Kostanjevica na Krki
00050000-553a-7eb9-f309-1f5031aa2f86	1336	Kostel
00050000-553a-7eb9-74cd-a95666836d0b	6256	Košana
00050000-553a-7eb9-cabe-43dd425563a9	2394	Kotlje
00050000-553a-7eb9-58ef-7e291f46f99d	6240	Kozina
00050000-553a-7eb9-63c6-d0e9db304958	3260	Kozje
00050000-553a-7eb9-c83d-4da161afc5c2	4000	Kranj 
00050000-553a-7eb9-774d-65b052332ea8	4001	Kranj - poštni predali
00050000-553a-7eb9-8bde-50674e558d0c	4280	Kranjska Gora
00050000-553a-7eb9-8477-06ce81e340a0	1281	Kresnice
00050000-553a-7eb9-c8ac-b196153998a2	4294	Križe
00050000-553a-7eb9-0589-d90b616f536e	9206	Križevci
00050000-553a-7eb9-e242-da6b926612db	9242	Križevci pri Ljutomeru
00050000-553a-7eb9-6a86-43aea2071d65	1301	Krka
00050000-553a-7eb9-777d-5f195d3c5e5e	8296	Krmelj
00050000-553a-7eb9-cc90-4d8436d0de12	4245	Kropa
00050000-553a-7eb9-3dc5-ffc8d1ad5dd8	8262	Krška vas
00050000-553a-7eb9-8b8a-3047f893c4ad	8270	Krško
00050000-553a-7eb9-d564-927243e7392c	9263	Kuzma
00050000-553a-7eb9-56ee-7a327df00c2b	2318	Laporje
00050000-553a-7eb9-ab88-7f3a91fa6d27	3270	Laško
00050000-553a-7eb9-7200-1c96013c81f7	1219	Laze v Tuhinju
00050000-553a-7eb9-3c23-83d3fdb99518	2230	Lenart v Slovenskih goricah
00050000-553a-7eb9-4d06-0066e765ae3f	9220	Lendava/Lendva
00050000-553a-7eb9-bc8e-26a27663b5f7	4248	Lesce
00050000-553a-7eb9-f2cb-fd31e0173b0c	3261	Lesično
00050000-553a-7eb9-8575-afb348cec3cb	8273	Leskovec pri Krškem
00050000-553a-7eb9-a9c2-9d5e7e5af884	2372	Libeliče
00050000-553a-7eb9-050e-e613e3d1c346	2341	Limbuš
00050000-553a-7eb9-c4fc-e9d93bbdcac8	1270	Litija
00050000-553a-7eb9-a79d-e2da598a0d67	3202	Ljubečna
00050000-553a-7eb9-fa71-56371c8a7e27	1000	Ljubljana 
00050000-553a-7eb9-5f3b-bf633aef8bfa	1001	Ljubljana - poštni predali
00050000-553a-7eb9-ec9f-7ad934f32089	1231	Ljubljana - Črnuče
00050000-553a-7eb9-a587-7aaf251b0bfc	1261	Ljubljana - Dobrunje
00050000-553a-7eb9-a640-f8d4063f26df	1260	Ljubljana - Polje
00050000-553a-7eb9-cbb0-f1a9c8b6321d	1210	Ljubljana - Šentvid
00050000-553a-7eb9-77f0-440fbd39a5e7	1211	Ljubljana - Šmartno
00050000-553a-7eb9-9106-41b667f98876	3333	Ljubno ob Savinji
00050000-553a-7eb9-5ba8-8d471fd39d6f	9240	Ljutomer
00050000-553a-7eb9-bed2-f04b9b63f03a	3215	Loče
00050000-553a-7eb9-203d-65fd83ed2b62	5231	Log pod Mangartom
00050000-553a-7eb9-6f99-47192e3becac	1358	Log pri Brezovici
00050000-553a-7eb9-3628-5e4d72881d63	1370	Logatec
00050000-553a-7eb9-45d1-dc08a19be874	1371	Logatec
00050000-553a-7eb9-807f-c5da6aae47a4	1434	Loka pri Zidanem Mostu
00050000-553a-7eb9-40fb-96022dc61f3e	3223	Loka pri Žusmu
00050000-553a-7eb9-0c7e-1eb182e2f84d	6219	Lokev
00050000-553a-7eb9-ea5c-58e2f897659d	1318	Loški Potok
00050000-553a-7eb9-27f2-9288b9abaccd	2324	Lovrenc na Dravskem polju
00050000-553a-7eb9-74f7-5f2cd8b85d3d	2344	Lovrenc na Pohorju
00050000-553a-7eb9-9fb8-6d23fae4c23c	3334	Luče
00050000-553a-7eb9-0523-b0c6bcc37d23	1225	Lukovica
00050000-553a-7eb9-686b-dc227482e3fb	9202	Mačkovci
00050000-553a-7eb9-1a9a-d738b0fb38f5	2322	Majšperk
00050000-553a-7eb9-d3b1-6ebb1fbdae6d	2321	Makole
00050000-553a-7eb9-b8aa-f68744df8a19	9243	Mala Nedelja
00050000-553a-7eb9-3c27-85ff16cd06e9	2229	Malečnik
00050000-553a-7eb9-84f1-51066bd0595c	6273	Marezige
00050000-553a-7eb9-6fcf-f6931dc17f6e	2000	Maribor 
00050000-553a-7eb9-f106-a9c39ff512dc	2001	Maribor - poštni predali
00050000-553a-7eb9-9e83-8692d6f93c2f	2206	Marjeta na Dravskem polju
00050000-553a-7eb9-9166-43fee3e27a3b	2281	Markovci
00050000-553a-7eb9-2e87-05940e72c780	9221	Martjanci
00050000-553a-7eb9-760b-ab2fa7229834	6242	Materija
00050000-553a-7eb9-e2cd-fb3c980501be	4211	Mavčiče
00050000-553a-7eb9-1442-da719d16d520	1215	Medvode
00050000-553a-7eb9-ff10-b790ab15b637	1234	Mengeš
00050000-553a-7eb9-fdd8-6ac725cbaa0d	8330	Metlika
00050000-553a-7eb9-ed82-55fb8e6f80c4	2392	Mežica
00050000-553a-7eb9-8fde-575590bec953	2204	Miklavž na Dravskem polju
00050000-553a-7eb9-3fd9-df586c7e57f6	2275	Miklavž pri Ormožu
00050000-553a-7eb9-20e7-491ea0e13a1d	5291	Miren
00050000-553a-7eb9-b579-e9331ab2dfc9	8233	Mirna
00050000-553a-7eb9-f9dc-3ec00ab43ae4	8216	Mirna Peč
00050000-553a-7eb9-8224-0718092df45e	2382	Mislinja
00050000-553a-7eb9-a621-51cbbe2c2c8c	4281	Mojstrana
00050000-553a-7eb9-4453-8aaadde7c0fb	8230	Mokronog
00050000-553a-7eb9-df04-2b33e53b5c09	1251	Moravče
00050000-553a-7eb9-2d25-aa8f25f5362c	9226	Moravske Toplice
00050000-553a-7eb9-4254-ad7c5d9b9b76	5216	Most na Soči
00050000-553a-7eb9-0c98-7222a5fc9b0c	1221	Motnik
00050000-553a-7eb9-d003-771ab580e33f	3330	Mozirje
00050000-553a-7eb9-4913-dd89246ede18	9000	Murska Sobota 
00050000-553a-7eb9-99e8-15b59c0aab0d	9001	Murska Sobota - poštni predali
00050000-553a-7eb9-9247-4aa4de3afa62	2366	Muta
00050000-553a-7eb9-c4b5-5e5225679af1	4202	Naklo
00050000-553a-7eb9-6d2a-1f4d5f27e3d2	3331	Nazarje
00050000-553a-7eb9-e231-54e0f2b91c65	1357	Notranje Gorice
00050000-553a-7eb9-179c-d1d955784380	3203	Nova Cerkev
00050000-553a-7eb9-2dca-4b2adf4cd1fd	5000	Nova Gorica 
00050000-553a-7eb9-3c4c-a8eea266b1bd	5001	Nova Gorica - poštni predali
00050000-553a-7eb9-1f50-6800cb9ef489	1385	Nova vas
00050000-553a-7eb9-2cc2-a8ddc0d1475f	8000	Novo mesto
00050000-553a-7eb9-9e65-9da9628dbcf5	8001	Novo mesto - poštni predali
00050000-553a-7eb9-e429-e08f1d79addd	6243	Obrov
00050000-553a-7eb9-1ef8-a128d3fcad62	9233	Odranci
00050000-553a-7eb9-7358-972e887178a1	2317	Oplotnica
00050000-553a-7eb9-a76d-241c50c2b0ea	2312	Orehova vas
00050000-553a-7eb9-eb02-6471b4c28e37	2270	Ormož
00050000-553a-7eb9-9b2b-abb178477548	1316	Ortnek
00050000-553a-7eb9-9d08-e162d2a5e010	1337	Osilnica
00050000-553a-7eb9-95c0-e25f4c3d268c	8222	Otočec
00050000-553a-7eb9-0593-9f2fcee95534	2361	Ožbalt
00050000-553a-7eb9-99be-49feabbf9ae4	2231	Pernica
00050000-553a-7eb9-56b0-53a9319b5934	2211	Pesnica pri Mariboru
00050000-553a-7eb9-be73-c074bb279762	9203	Petrovci
00050000-553a-7eb9-82fa-aed297ac8a93	3301	Petrovče
00050000-553a-7eb9-c02a-a281e92888fb	6330	Piran/Pirano
00050000-553a-7eb9-6f85-2cfd4d90f506	8255	Pišece
00050000-553a-7eb9-e5b6-d77728d9c9c9	6257	Pivka
00050000-553a-7eb9-1e76-a9dfb85ba1ac	6232	Planina
00050000-553a-7eb9-e599-e898c1060796	3225	Planina pri Sevnici
00050000-553a-7eb9-00a3-907afdb6226d	6276	Pobegi
00050000-553a-7eb9-6115-2c00711c4b97	8312	Podbočje
00050000-553a-7eb9-73c1-9e9bcae88e19	5243	Podbrdo
00050000-553a-7eb9-2243-b055315adb70	3254	Podčetrtek
00050000-553a-7eb9-1550-f83f2d3af0cf	2273	Podgorci
00050000-553a-7eb9-9fe8-32b2af87b578	6216	Podgorje
00050000-553a-7eb9-1f52-df5157ac6a63	2381	Podgorje pri Slovenj Gradcu
00050000-553a-7eb9-dad7-5062a55e3f8d	6244	Podgrad
00050000-553a-7eb9-4857-ad55c377af4c	1414	Podkum
00050000-553a-7eb9-050f-329d000d22de	2286	Podlehnik
00050000-553a-7eb9-536c-f8293b80f472	5272	Podnanos
00050000-553a-7eb9-7c40-6f42418ecab0	4244	Podnart
00050000-553a-7eb9-5205-3b1dcebfb932	3241	Podplat
00050000-553a-7eb9-55cd-118d51d24469	3257	Podsreda
00050000-553a-7eb9-e164-ed284cb9805a	2363	Podvelka
00050000-553a-7eb9-092d-ff70deda2e7c	2208	Pohorje
00050000-553a-7eb9-fdf9-13904d31b2ab	2257	Polenšak
00050000-553a-7eb9-f119-0f85187a9984	1355	Polhov Gradec
00050000-553a-7eb9-7384-e04bcbf4b858	4223	Poljane nad Škofjo Loko
00050000-553a-7eb9-68d1-bf81dd486cb9	2319	Poljčane
00050000-553a-7eb9-4724-377a1355d068	1272	Polšnik
00050000-553a-7eb9-0696-59f7b5e26ed2	3313	Polzela
00050000-553a-7eb9-cb9c-14a6ebfaf092	3232	Ponikva
00050000-553a-7eb9-3cc4-182da87c92e5	6320	Portorož/Portorose
00050000-553a-7eb9-9559-2b8aea482a4d	6230	Postojna
00050000-553a-7eb9-c669-e4035d53e53a	2331	Pragersko
00050000-553a-7eb9-0d92-6318734e55ea	3312	Prebold
00050000-553a-7eb9-8688-0ba48da984cb	4205	Preddvor
00050000-553a-7eb9-6b35-ba9fb78877c0	6255	Prem
00050000-553a-7eb9-3fad-a95e004fa7c2	1352	Preserje
00050000-553a-7eb9-acdd-23134969c37b	6258	Prestranek
00050000-553a-7eb9-b91a-4530fe0f1984	2391	Prevalje
00050000-553a-7eb9-8c56-b546bc94c141	3262	Prevorje
00050000-553a-7eb9-7e11-deba22682a51	1276	Primskovo 
00050000-553a-7eb9-636b-0c40c4074218	3253	Pristava pri Mestinju
00050000-553a-7eb9-2184-b3a608e00381	9207	Prosenjakovci/Partosfalva
00050000-553a-7eb9-5724-58b90f665b14	5297	Prvačina
00050000-553a-7eb9-9d3d-e65917d7ef56	2250	Ptuj
00050000-553a-7eb9-628e-4789102dc94f	2323	Ptujska Gora
00050000-553a-7eb9-152e-97f51c2fd052	9201	Puconci
00050000-553a-7eb9-7356-3deebb6f9bca	2327	Rače
00050000-553a-7eb9-a5ac-ee2be6d63815	1433	Radeče
00050000-553a-7eb9-3437-253848771979	9252	Radenci
00050000-553a-7eb9-f169-af14438b6e40	2360	Radlje ob Dravi
00050000-553a-7eb9-7641-86031be5207b	1235	Radomlje
00050000-553a-7eb9-25ef-5c328d64c50e	4240	Radovljica
00050000-553a-7eb9-2e7f-dae55a6c4979	8274	Raka
00050000-553a-7eb9-e2a8-5f01f15de2e8	1381	Rakek
00050000-553a-7eb9-0d8c-13cea4f80684	4283	Rateče - Planica
00050000-553a-7eb9-0cf7-0a3c722fd9ea	2390	Ravne na Koroškem
00050000-553a-7eb9-9a3a-d1fb8ce3c3f6	9246	Razkrižje
00050000-553a-7eb9-2293-f88fe7f66ec4	3332	Rečica ob Savinji
00050000-553a-7eb9-e131-aed5f83451d0	5292	Renče
00050000-553a-7eb9-2a7f-4060d1a61409	1310	Ribnica
00050000-553a-7eb9-3037-c41ada410ed7	2364	Ribnica na Pohorju
00050000-553a-7eb9-3668-17770bcaec9a	3272	Rimske Toplice
00050000-553a-7eb9-672f-8a3c069f2532	1314	Rob
00050000-553a-7eb9-22db-4241d53e638d	5215	Ročinj
00050000-553a-7eb9-e82a-346d870cd07b	3250	Rogaška Slatina
00050000-553a-7eb9-b47f-a9ead0e32379	9262	Rogašovci
00050000-553a-7eb9-d56e-e0e28f5f1357	3252	Rogatec
00050000-553a-7eb9-b504-a1968652e386	1373	Rovte
00050000-553a-7eb9-6900-7572ae01c347	2342	Ruše
00050000-553a-7eb9-08e1-dadf5d095dde	1282	Sava
00050000-553a-7eb9-66e9-2ea0d08b3593	6333	Sečovlje/Sicciole
00050000-553a-7eb9-6872-4462f3c44318	4227	Selca
00050000-553a-7eb9-7ec3-2816ae2f5d16	2352	Selnica ob Dravi
00050000-553a-7eb9-7756-45d6ff10f8df	8333	Semič
00050000-553a-7eb9-a1b0-40299de89860	8281	Senovo
00050000-553a-7eb9-39c6-caa6dd99852a	6224	Senožeče
00050000-553a-7eb9-d28c-39ac29f1062e	8290	Sevnica
00050000-553a-7eb9-c3ab-7f2988d956e7	6210	Sežana
00050000-553a-7eb9-114d-7dfdd2c67569	2214	Sladki Vrh
00050000-553a-7eb9-5f48-d7e051cc2458	5283	Slap ob Idrijci
00050000-553a-7eb9-0450-3645b09e39b6	2380	Slovenj Gradec
00050000-553a-7eb9-8db8-f921de5d6210	2310	Slovenska Bistrica
00050000-553a-7eb9-65ec-e9a8a0b8aa4a	3210	Slovenske Konjice
00050000-553a-7eb9-1423-5371a7b2ef37	1216	Smlednik
00050000-553a-7eb9-a8ba-d01a1d2b10b6	5232	Soča
00050000-553a-7eb9-e8a6-b0b2374f615c	1317	Sodražica
00050000-553a-7eb9-b744-898df9f3be77	3335	Solčava
00050000-553a-7eb9-4f0f-45878dfa618f	5250	Solkan
00050000-553a-7eb9-0542-48e77be9c3c4	4229	Sorica
00050000-553a-7eb9-2e3e-99e7fea70043	4225	Sovodenj
00050000-553a-7eb9-e336-cd875d9ad9e1	5281	Spodnja Idrija
00050000-553a-7eb9-9ea1-af999ae36420	2241	Spodnji Duplek
00050000-553a-7eb9-75f2-d9d955518556	9245	Spodnji Ivanjci
00050000-553a-7eb9-adc5-e527511bc188	2277	Središče ob Dravi
00050000-553a-7eb9-76db-30882a11a233	4267	Srednja vas v Bohinju
00050000-553a-7eb9-f255-3ce63e02d815	8256	Sromlje 
00050000-553a-7eb9-f29a-49862afb11b4	5224	Srpenica
00050000-553a-7eb9-1fd3-9e7f5bddfe60	1242	Stahovica
00050000-553a-7eb9-1800-121082c96499	1332	Stara Cerkev
00050000-553a-7eb9-9756-8c4473539ba3	8342	Stari trg ob Kolpi
00050000-553a-7eb9-1c1b-c8e246300b2e	1386	Stari trg pri Ložu
00050000-553a-7eb9-adef-677c5ee00343	2205	Starše
00050000-553a-7eb9-ea11-df3e852c64f7	2289	Stoperce
00050000-553a-7eb9-91d3-1d19b740b15e	8322	Stopiče
00050000-553a-7eb9-2add-ed36cac1c70c	3206	Stranice
00050000-553a-7eb9-2b64-c933f2a8a2b9	8351	Straža
00050000-553a-7eb9-49f9-e80d27e28869	1313	Struge
00050000-553a-7eb9-5745-a168f6ae7bcb	8293	Studenec
00050000-553a-7eb9-1749-00381093c996	8331	Suhor
00050000-553a-7eb9-589e-9240cd7e1c18	2233	Sv. Ana v Slovenskih goricah
00050000-553a-7eb9-abaf-be668b6f8165	2235	Sv. Trojica v Slovenskih goricah
00050000-553a-7eb9-cb0e-05b6a3bc6ac8	2353	Sveti Duh na Ostrem Vrhu
00050000-553a-7eb9-b45d-876ca616b65a	9244	Sveti Jurij ob Ščavnici
00050000-553a-7eb9-af89-1049780ec144	3264	Sveti Štefan
00050000-553a-7eb9-84ec-9a1b8ad11a23	2258	Sveti Tomaž
00050000-553a-7eb9-e658-9068f3aa591b	9204	Šalovci
00050000-553a-7eb9-e5b4-7ecc4c289a9d	5261	Šempas
00050000-553a-7eb9-a792-9dae59b6527b	5290	Šempeter pri Gorici
00050000-553a-7eb9-73eb-e8ca28ec368a	3311	Šempeter v Savinjski dolini
00050000-553a-7eb9-29a8-a4dd1871359b	4208	Šenčur
00050000-553a-7eb9-c7d1-0104df6e25f7	2212	Šentilj v Slovenskih goricah
00050000-553a-7eb9-bae9-c0bc7de710a0	8297	Šentjanž
00050000-553a-7eb9-d98f-88a19df3c25d	2373	Šentjanž pri Dravogradu
00050000-553a-7eb9-dbba-dffbd4afc0de	8310	Šentjernej
00050000-553a-7eb9-0a0b-3735faeb4d70	3230	Šentjur
00050000-553a-7eb9-93cf-20633e0edbae	3271	Šentrupert
00050000-553a-7eb9-8515-d160214c81b1	8232	Šentrupert
00050000-553a-7eb9-6237-65c1689d015b	1296	Šentvid pri Stični
00050000-553a-7eb9-bd84-01480e971466	8275	Škocjan
00050000-553a-7eb9-eea8-6afb3f81d347	6281	Škofije
00050000-553a-7eb9-5fe4-763009ec0de9	4220	Škofja Loka
00050000-553a-7eb9-6094-dd638ab8a13d	3211	Škofja vas
00050000-553a-7eb9-5a4b-9cb524193c74	1291	Škofljica
00050000-553a-7eb9-8904-c7d122fe98bb	6274	Šmarje
00050000-553a-7eb9-dbd5-d08cef9d0f39	1293	Šmarje - Sap
00050000-553a-7eb9-9dc0-abacb9d21440	3240	Šmarje pri Jelšah
00050000-553a-7eb9-7ffc-8f0f847fdfdf	8220	Šmarješke Toplice
00050000-553a-7eb9-17f3-5b85b2d417b9	2315	Šmartno na Pohorju
00050000-553a-7eb9-47f5-ec1460608e44	3341	Šmartno ob Dreti
00050000-553a-7eb9-2ee6-e79a82c6cd0e	3327	Šmartno ob Paki
00050000-553a-7eb9-9dcc-cb164426c362	1275	Šmartno pri Litiji
00050000-553a-7eb9-ce89-eea7af84b0e1	2383	Šmartno pri Slovenj Gradcu
00050000-553a-7eb9-3647-a653cc82fb0e	3201	Šmartno v Rožni dolini
00050000-553a-7eb9-b865-358ae20e0c72	3325	Šoštanj
00050000-553a-7eb9-0cd9-7e9d962e79f0	6222	Štanjel
00050000-553a-7eb9-70b7-406806f63a87	3220	Štore
00050000-553a-7eb9-e8e7-be417d0aa7ed	3304	Tabor
00050000-553a-7eb9-e929-4584b84b1220	3221	Teharje
00050000-553a-7eb9-cb23-25bbc9e587d6	9251	Tišina
00050000-553a-7eb9-8dbf-082973c7a507	5220	Tolmin
00050000-553a-7eb9-94b8-4d162fd7f9d3	3326	Topolšica
00050000-553a-7eb9-9eae-6241688c88ab	2371	Trbonje
00050000-553a-7eb9-7b89-30561667136c	1420	Trbovlje
00050000-553a-7eb9-db0b-e1a94e561489	8231	Trebelno 
00050000-553a-7eb9-8f0d-f0b4f9db68c5	8210	Trebnje
00050000-553a-7eb9-ad98-abbee47c8c75	5252	Trnovo pri Gorici
00050000-553a-7eb9-078a-3ce905c71e58	2254	Trnovska vas
00050000-553a-7eb9-7768-093599e3f150	1222	Trojane
00050000-553a-7eb9-3995-255e5a445fce	1236	Trzin
00050000-553a-7eb9-cbf9-1e05e2b232a4	4290	Tržič
00050000-553a-7eb9-5ef0-cf0d676e5f0e	8295	Tržišče
00050000-553a-7eb9-cfba-0d35b7458556	1311	Turjak
00050000-553a-7eb9-3ba0-57a9ad45c36f	9224	Turnišče
00050000-553a-7eb9-f93d-17344905a155	8323	Uršna sela
00050000-553a-7eb9-ae21-e3afa7fd2297	1252	Vače
00050000-553a-7eb9-249b-641aa2b32ffc	3320	Velenje 
00050000-553a-7eb9-0d25-cd2cd2fe329b	3322	Velenje - poštni predali
00050000-553a-7eb9-fdc4-25ef084bbcb2	8212	Velika Loka
00050000-553a-7eb9-5e67-4ca2d279484c	2274	Velika Nedelja
00050000-553a-7eb9-f17e-028345360c40	9225	Velika Polana
00050000-553a-7eb9-0627-448feb39f10b	1315	Velike Lašče
00050000-553a-7eb9-5814-4cb56f93b2cd	8213	Veliki Gaber
00050000-553a-7eb9-f74b-f7fb06910ce6	9241	Veržej
00050000-553a-7eb9-0d43-4b656c49c66d	1312	Videm - Dobrepolje
00050000-553a-7eb9-9122-7c46cfd9da23	2284	Videm pri Ptuju
00050000-553a-7eb9-e58d-9fe805682387	8344	Vinica
00050000-553a-7eb9-db4c-d053740837a4	5271	Vipava
00050000-553a-7eb9-b25d-1b61f155bc7c	4212	Visoko
00050000-553a-7eb9-97cd-421f260b7eeb	1294	Višnja Gora
00050000-553a-7eb9-e1f7-cfdefc4a8ad3	3205	Vitanje
00050000-553a-7eb9-a66a-56f8e14d7c79	2255	Vitomarci
00050000-553a-7eb9-67c8-82e214c8f8da	1217	Vodice
00050000-553a-7eb9-412d-7be60746d5e8	3212	Vojnik\t
00050000-553a-7eb9-69a9-6f880d71215c	5293	Volčja Draga
00050000-553a-7eb9-3a81-d77d7d99566e	2232	Voličina
00050000-553a-7eb9-b0b1-42152e1c851b	3305	Vransko
00050000-553a-7eb9-0b62-12c82df436fd	6217	Vremski Britof
00050000-553a-7eb9-0b29-c7b0cbeb2149	1360	Vrhnika
00050000-553a-7eb9-8a3b-d1afacd228d4	2365	Vuhred
00050000-553a-7eb9-587c-ce4aaaad8f14	2367	Vuzenica
00050000-553a-7eb9-9682-965cc2af9bc1	8292	Zabukovje 
00050000-553a-7eb9-f8b5-43891fe9a970	1410	Zagorje ob Savi
00050000-553a-7eb9-cf42-7e5af3822c5b	1303	Zagradec
00050000-553a-7eb9-0ebe-918e299149d6	2283	Zavrč
00050000-553a-7eb9-2cb0-d7fdc3a4f5c5	8272	Zdole 
00050000-553a-7eb9-2076-19d575b32715	4201	Zgornja Besnica
00050000-553a-7eb9-fc66-cc3422510430	2242	Zgornja Korena
00050000-553a-7eb9-a533-d9c57b89f957	2201	Zgornja Kungota
00050000-553a-7eb9-1e05-591ea2e99695	2316	Zgornja Ložnica
00050000-553a-7eb9-929b-928c5a91f4b6	2314	Zgornja Polskava
00050000-553a-7eb9-2ac6-f9622e2b19cc	2213	Zgornja Velka
00050000-553a-7eb9-2858-e1352f2e6577	4247	Zgornje Gorje
00050000-553a-7eb9-a74a-84c574c646b8	4206	Zgornje Jezersko
00050000-553a-7eb9-592b-6d5bdff06910	2285	Zgornji Leskovec
00050000-553a-7eb9-4415-84e5cb2174fa	1432	Zidani Most
00050000-553a-7eb9-57aa-adc1d2404a94	3214	Zreče
00050000-553a-7eb9-fd1b-f742899eb822	4209	Žabnica
00050000-553a-7eb9-af75-6e6f00d55d7b	3310	Žalec
00050000-553a-7eb9-1a98-39f1937af389	4228	Železniki
00050000-553a-7eb9-c5d9-ed086563aea9	2287	Žetale
00050000-553a-7eb9-e2e3-2f6cd3c39c13	4226	Žiri
00050000-553a-7eb9-a94c-475df8b0a0c9	4274	Žirovnica
00050000-553a-7eb9-b36d-d0e75faa869a	8360	Žužemberk
\.


--
-- TOC entry 2660 (class 0 OID 1414179)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1414002)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1414068)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1414191)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1414296)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1414340)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 1414220)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 1414164)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1414154)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1414330)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1414286)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1413867)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-553a-7ebb-1f73-151134aea41e	00010000-553a-7ebb-eff2-7e3fbd60c43e	2015-04-24 19:34:52	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROCJX.bP./yRDASkOaClcdQ9tgayjwbL2";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2667 (class 0 OID 1414229)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 1413906)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-553a-7ebb-04e2-3d69ea70eb78	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-553a-7ebb-85a3-39452e6bc80e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-553a-7ebb-de69-9d6be0bfdee8	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-553a-7ebb-b378-42d7927a7977	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-553a-7ebb-0a4c-bea1024771af	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-553a-7ebb-ec4e-cee15a97f105	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2633 (class 0 OID 1413890)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-553a-7ebb-1f73-151134aea41e	00000000-553a-7ebb-b378-42d7927a7977
00010000-553a-7ebb-eff2-7e3fbd60c43e	00000000-553a-7ebb-b378-42d7927a7977
\.


--
-- TOC entry 2669 (class 0 OID 1414243)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1414185)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1414135)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1413967)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1414141)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1414321)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1414037)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 1413876)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-553a-7ebb-eff2-7e3fbd60c43e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROHQA4fZcmqW9cZaQUzptWN7dS09hOYcG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-553a-7ebb-1f73-151134aea41e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2681 (class 0 OID 1414371)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1414083)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1414212)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1414278)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1414111)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 1414361)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1414268)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2276 (class 2606 OID 1413931)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 1414410)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 1414403)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 1414320)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 1414101)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 1414134)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 1414063)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 1414264)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 1414081)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 1414128)
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
-- TOC entry 2366 (class 2606 OID 1414177)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 1414204)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 1414035)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2280 (class 2606 OID 1413940)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 1413999)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2282 (class 2606 OID 1413965)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 1413920)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2267 (class 2606 OID 1413905)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 1414210)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 1414242)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 1414357)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 1413992)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 1414023)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 1414183)
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
-- TOC entry 2300 (class 2606 OID 1414013)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 1414072)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 1414195)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 1414302)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 1414345)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 1414227)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 1414168)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 1414159)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 1414339)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 1414293)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 1413875)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 1414233)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 1413894)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2269 (class 2606 OID 1413914)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 1414251)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 1414190)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 1414140)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 1413972)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 1414150)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 1414329)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 1414048)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 1413888)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 1414385)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 1414087)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 1414218)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 1414284)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 1414123)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 1414370)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 1414277)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 1259 OID 1414108)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2288 (class 1259 OID 1413994)
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
-- TOC entry 2379 (class 1259 OID 1414211)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2373 (class 1259 OID 1414197)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2374 (class 1259 OID 1414196)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2325 (class 1259 OID 1414088)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 1414267)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2401 (class 1259 OID 1414265)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 1414266)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2425 (class 1259 OID 1414358)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 1414359)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2427 (class 1259 OID 1414360)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2432 (class 1259 OID 1414388)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2433 (class 1259 OID 1414387)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2434 (class 1259 OID 1414386)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2307 (class 1259 OID 1414050)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2308 (class 1259 OID 1414049)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 1414001)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2293 (class 1259 OID 1414000)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 1414234)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2343 (class 1259 OID 1414129)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2271 (class 1259 OID 1413921)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2272 (class 1259 OID 1413922)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2393 (class 1259 OID 1414254)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2394 (class 1259 OID 1414253)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2395 (class 1259 OID 1414252)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2317 (class 1259 OID 1414073)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2318 (class 1259 OID 1414075)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2319 (class 1259 OID 1414074)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2353 (class 1259 OID 1414163)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2354 (class 1259 OID 1414161)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2355 (class 1259 OID 1414160)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2356 (class 1259 OID 1414162)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2262 (class 1259 OID 1413895)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2263 (class 1259 OID 1413896)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2382 (class 1259 OID 1414219)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2368 (class 1259 OID 1414184)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2408 (class 1259 OID 1414294)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2409 (class 1259 OID 1414295)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2296 (class 1259 OID 1414015)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2297 (class 1259 OID 1414014)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2298 (class 1259 OID 1414016)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2412 (class 1259 OID 1414303)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2413 (class 1259 OID 1414304)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2443 (class 1259 OID 1414413)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2444 (class 1259 OID 1414412)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2445 (class 1259 OID 1414415)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2446 (class 1259 OID 1414411)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2447 (class 1259 OID 1414414)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2405 (class 1259 OID 1414285)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2359 (class 1259 OID 1414172)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2360 (class 1259 OID 1414171)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2361 (class 1259 OID 1414169)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2362 (class 1259 OID 1414170)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2439 (class 1259 OID 1414405)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 1414404)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2324 (class 1259 OID 1414082)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2277 (class 1259 OID 1413942)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2278 (class 1259 OID 1413941)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2284 (class 1259 OID 1413973)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2285 (class 1259 OID 1413974)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 1414153)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2349 (class 1259 OID 1414152)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2350 (class 1259 OID 1414151)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2331 (class 1259 OID 1414110)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2332 (class 1259 OID 1414106)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2333 (class 1259 OID 1414103)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2334 (class 1259 OID 1414104)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2335 (class 1259 OID 1414102)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2336 (class 1259 OID 1414107)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2337 (class 1259 OID 1414105)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2291 (class 1259 OID 1413993)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1414064)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2314 (class 1259 OID 1414066)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2315 (class 1259 OID 1414065)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2316 (class 1259 OID 1414067)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2367 (class 1259 OID 1414178)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2283 (class 1259 OID 1413966)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2306 (class 1259 OID 1414036)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2259 (class 1259 OID 1413889)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2387 (class 1259 OID 1414228)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2303 (class 1259 OID 1414024)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2424 (class 1259 OID 1414346)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2270 (class 1259 OID 1413915)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2338 (class 1259 OID 1414109)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2472 (class 2606 OID 1414546)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2475 (class 2606 OID 1414531)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2474 (class 2606 OID 1414536)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2470 (class 2606 OID 1414556)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2476 (class 2606 OID 1414526)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2471 (class 2606 OID 1414551)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2473 (class 2606 OID 1414541)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2457 (class 2606 OID 1414461)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2493 (class 2606 OID 1414641)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 1414636)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2492 (class 2606 OID 1414631)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2469 (class 2606 OID 1414521)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1414681)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2501 (class 2606 OID 1414671)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 1414676)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2489 (class 2606 OID 1414621)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 1414716)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2509 (class 2606 OID 1414721)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 1414726)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2511 (class 2606 OID 1414741)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2512 (class 2606 OID 1414736)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2513 (class 2606 OID 1414731)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2463 (class 2606 OID 1414496)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2464 (class 2606 OID 1414491)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 1414471)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 1414466)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 1414446)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2495 (class 2606 OID 1414651)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2477 (class 2606 OID 1414561)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2451 (class 2606 OID 1414426)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 1414431)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2496 (class 2606 OID 1414666)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2497 (class 2606 OID 1414661)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2498 (class 2606 OID 1414656)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2467 (class 2606 OID 1414501)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 1414511)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2466 (class 2606 OID 1414506)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2481 (class 2606 OID 1414596)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2483 (class 2606 OID 1414586)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2484 (class 2606 OID 1414581)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2482 (class 2606 OID 1414591)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2449 (class 2606 OID 1414416)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 1414421)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2494 (class 2606 OID 1414646)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2490 (class 2606 OID 1414626)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2504 (class 2606 OID 1414691)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2503 (class 2606 OID 1414696)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2461 (class 2606 OID 1414481)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 1414476)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2460 (class 2606 OID 1414486)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1414701)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 1414706)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2518 (class 2606 OID 1414766)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 1414761)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2516 (class 2606 OID 1414776)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2520 (class 2606 OID 1414756)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2517 (class 2606 OID 1414771)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2502 (class 2606 OID 1414686)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2485 (class 2606 OID 1414616)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2486 (class 2606 OID 1414611)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2488 (class 2606 OID 1414601)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2487 (class 2606 OID 1414606)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2514 (class 2606 OID 1414751)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 1414746)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2468 (class 2606 OID 1414516)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2507 (class 2606 OID 1414711)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 1414441)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2453 (class 2606 OID 1414436)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2456 (class 2606 OID 1414451)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 1414456)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2478 (class 2606 OID 1414576)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2479 (class 2606 OID 1414571)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2480 (class 2606 OID 1414566)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-24 19:34:52 CEST

--
-- PostgreSQL database dump complete
--

