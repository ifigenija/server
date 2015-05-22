--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-22 13:02:14 CEST

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
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 4683399)
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
-- TOC entry 225 (class 1259 OID 4683879)
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
-- TOC entry 224 (class 1259 OID 4683862)
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
-- TOC entry 217 (class 1259 OID 4683775)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine text
);


--
-- TOC entry 193 (class 1259 OID 4683565)
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
-- TOC entry 196 (class 1259 OID 4683599)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4683524)
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
-- TOC entry 212 (class 1259 OID 4683724)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    tip_vloge_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean,
    sort integer
);


--
-- TOC entry 191 (class 1259 OID 4683549)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4683593)
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
-- TOC entry 201 (class 1259 OID 4683642)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4683667)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4683498)
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
-- TOC entry 180 (class 1259 OID 4683408)
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
-- TOC entry 181 (class 1259 OID 4683419)
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
    datumrojstva date,
    emso character varying(255) DEFAULT NULL::character varying,
    davcna character varying(255) DEFAULT NULL::character varying,
    spol character varying(1) DEFAULT NULL::character varying,
    opombe text,
    drzavljanstvo character varying(255) DEFAULT NULL::character varying,
    drzavarojstva character varying(255) DEFAULT NULL::character varying,
    krajrojstva character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 4683469)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4683373)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4683392)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4683674)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4683704)
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
-- TOC entry 221 (class 1259 OID 4683817)
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
-- TOC entry 183 (class 1259 OID 4683449)
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
-- TOC entry 186 (class 1259 OID 4683490)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4683648)
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
-- TOC entry 185 (class 1259 OID 4683476)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    drzava_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    ulica character varying(50) DEFAULT NULL::character varying,
    ulicadva character varying(50) DEFAULT NULL::character varying,
    posta character varying(50) DEFAULT NULL::character varying,
    postanaziv character varying(50) DEFAULT NULL::character varying,
    pokrajina character varying(50) DEFAULT NULL::character varying,
    jeeu boolean NOT NULL,
    privzeti boolean
);


--
-- TOC entry 190 (class 1259 OID 4683541)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4683660)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4683766)
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
-- TOC entry 220 (class 1259 OID 4683810)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4683689)
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
-- TOC entry 200 (class 1259 OID 4683633)
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
-- TOC entry 199 (class 1259 OID 4683623)
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
-- TOC entry 219 (class 1259 OID 4683800)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4683756)
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
-- TOC entry 173 (class 1259 OID 4683344)
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
-- TOC entry 172 (class 1259 OID 4683342)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2688 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 4683698)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4683382)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4683366)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4683712)
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
-- TOC entry 203 (class 1259 OID 4683654)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4683604)
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
-- TOC entry 182 (class 1259 OID 4683441)
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
-- TOC entry 198 (class 1259 OID 4683610)
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
-- TOC entry 218 (class 1259 OID 4683789)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    dovoliprekrivanje boolean,
    maxprekrivanj integer,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 4683510)
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
-- TOC entry 174 (class 1259 OID 4683353)
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
-- TOC entry 223 (class 1259 OID 4683842)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
    faza character varying(35) DEFAULT NULL::character varying,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    delovninaslov character varying(255) DEFAULT NULL::character varying,
    datumzacstudija date,
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
    kratkinaslov character varying(255) DEFAULT NULL::character varying,
    maticnioder_id uuid
);


--
-- TOC entry 192 (class 1259 OID 4683556)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4683681)
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
-- TOC entry 214 (class 1259 OID 4683748)
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
-- TOC entry 194 (class 1259 OID 4683588)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4683832)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4683738)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4683347)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2634 (class 0 OID 4683399)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 4683879)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 4683862)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4683775)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4683565)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4683599)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4683524)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555f-0cb5-3827-e6cd246595fc	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555f-0cb5-b5f4-7fb80c8c6faf	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555f-0cb5-f6e8-ca6650bf77f4	AL	ALB	008	Albania 	Albanija	\N
00040000-555f-0cb5-92b5-e24c65f33636	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555f-0cb5-ad11-76d003f9011a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555f-0cb5-51b4-ebc4f4566ca6	AD	AND	020	Andorra 	Andora	\N
00040000-555f-0cb5-3995-4c04f1823c46	AO	AGO	024	Angola 	Angola	\N
00040000-555f-0cb5-7000-62f82a7abfbd	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555f-0cb5-0861-460bc6fa1b5d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555f-0cb5-63d6-9fcc5b71c1f1	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555f-0cb5-3bf3-8fc9428cd062	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555f-0cb5-aa67-21c6e6b59ff1	AM	ARM	051	Armenia 	Armenija	\N
00040000-555f-0cb5-db7d-da32521db955	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555f-0cb5-5513-af4d25c76e42	AU	AUS	036	Australia 	Avstralija	\N
00040000-555f-0cb5-2e7f-e87043977847	AT	AUT	040	Austria 	Avstrija	\N
00040000-555f-0cb5-3a55-e4f763b38093	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555f-0cb5-c670-0ac3d88cf954	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555f-0cb5-c3bd-946fdf9a95fb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555f-0cb5-eb82-404406e5adbc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555f-0cb5-64bb-4af5ad1ef38d	BB	BRB	052	Barbados 	Barbados	\N
00040000-555f-0cb5-1837-d12416cbe501	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555f-0cb5-6abe-900b9e360a12	BE	BEL	056	Belgium 	Belgija	\N
00040000-555f-0cb5-dc4a-de6fdfe71455	BZ	BLZ	084	Belize 	Belize	\N
00040000-555f-0cb5-0682-45a7ac5014eb	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555f-0cb5-eb1a-015bbfc57a23	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555f-0cb5-7d44-748b996681a6	BT	BTN	064	Bhutan 	Butan	\N
00040000-555f-0cb5-5347-06913ba2f3e3	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555f-0cb5-8f00-935f8eee41c9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555f-0cb5-6ec1-71ac1e60d10c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555f-0cb5-9cf9-54d056b0a6a9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555f-0cb5-0a3a-0d8bd5ad5c61	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555f-0cb5-cdef-d39aa8e88d94	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555f-0cb5-3035-e21c14090f09	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555f-0cb5-aafb-4cce79b21244	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555f-0cb5-1b56-3d75e4274c95	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555f-0cb5-0ca7-4ccb5243ce7c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555f-0cb5-2bdb-513a5e45c84a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555f-0cb5-9810-e8cb5c4c021f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555f-0cb5-502c-e65bbecc1eca	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555f-0cb5-52a7-7381edf1003e	CA	CAN	124	Canada 	Kanada	\N
00040000-555f-0cb5-8794-d5fef4cb48d3	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555f-0cb5-652d-cd997ba52cfe	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555f-0cb5-e60e-405ec395f848	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555f-0cb5-304c-d99933c779d0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555f-0cb5-e49f-278bbcc3eb62	CL	CHL	152	Chile 	Čile	\N
00040000-555f-0cb5-35fd-308e436b9a77	CN	CHN	156	China 	Kitajska	\N
00040000-555f-0cb5-2040-114c693a828e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555f-0cb5-1270-f53df08823f2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555f-0cb5-1c11-0f24cc24933c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555f-0cb5-5eff-04d012ed285c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555f-0cb5-8016-cf929359c17d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555f-0cb5-2e84-946f1d9fdac5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555f-0cb5-2306-f9a665ea517b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555f-0cb5-e96f-46a6fed4dd5a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555f-0cb5-913b-fd17202186dd	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555f-0cb5-cf06-62c1127ffe45	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555f-0cb5-aa98-52033a7d7fba	CU	CUB	192	Cuba 	Kuba	\N
00040000-555f-0cb5-78d9-abd6fc5cccd0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555f-0cb5-1990-943f8f233a02	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555f-0cb5-a595-c71db90fe746	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555f-0cb5-1a6e-5ac4b4366841	DK	DNK	208	Denmark 	Danska	\N
00040000-555f-0cb5-181e-3a77fbaa11bd	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555f-0cb5-1aaf-e10e2a0549af	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555f-0cb5-484b-14b73f614b49	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555f-0cb5-4480-393c91f67378	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555f-0cb5-092f-7f00895cdedd	EG	EGY	818	Egypt 	Egipt	\N
00040000-555f-0cb5-61a2-096087ec989e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555f-0cb5-c967-cff7b79c34ce	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555f-0cb5-00b0-e8a73aaaded1	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555f-0cb5-d408-28bf98910060	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555f-0cb5-499f-d83a0f3bf7c6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555f-0cb5-7d33-75b1053940a9	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555f-0cb5-ef36-7a8df30e35a5	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555f-0cb5-e8d4-5d1d4b6bbf02	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555f-0cb5-3bdd-72406e61d62a	FI	FIN	246	Finland 	Finska	\N
00040000-555f-0cb5-19fb-3e7fe73e9c98	FR	FRA	250	France 	Francija	\N
00040000-555f-0cb5-a0ae-9884e0eed51d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555f-0cb5-574d-0cf6bf653a73	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555f-0cb5-d3d7-3b2ab5f0e050	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555f-0cb5-6f5e-cd153c5982c9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555f-0cb5-5026-000254733c19	GA	GAB	266	Gabon 	Gabon	\N
00040000-555f-0cb5-bc6b-6bf3c1836429	GM	GMB	270	Gambia 	Gambija	\N
00040000-555f-0cb5-7df5-0cf52576e183	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555f-0cb5-d1b1-b362d760cc01	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555f-0cb5-fd72-5f94bb047a0f	GH	GHA	288	Ghana 	Gana	\N
00040000-555f-0cb5-e0fd-7deaac4d7cb5	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555f-0cb5-a1a1-778d2bb4d617	GR	GRC	300	Greece 	Grčija	\N
00040000-555f-0cb5-5cc3-ef720c99db15	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555f-0cb5-dab2-4138392d56aa	GD	GRD	308	Grenada 	Grenada	\N
00040000-555f-0cb5-b663-3bf104568b6f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555f-0cb5-49ed-825a9b570359	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555f-0cb5-d2f8-e14d13c85004	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555f-0cb5-5d7e-2c4235589b19	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555f-0cb5-737a-b64da3e69303	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555f-0cb5-d596-512862912db3	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555f-0cb5-5636-8e409b5c4ec8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555f-0cb5-5836-16bfd677bd18	HT	HTI	332	Haiti 	Haiti	\N
00040000-555f-0cb5-6841-d90aa6b4ccfc	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555f-0cb5-00f3-6a0d93e29c8c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555f-0cb5-3b20-5fd16b096240	HN	HND	340	Honduras 	Honduras	\N
00040000-555f-0cb5-3df9-3f4258634c6c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555f-0cb5-5511-71b828ebd780	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555f-0cb5-b994-c0c6c39c715c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555f-0cb5-6935-c01a99017b80	IN	IND	356	India 	Indija	\N
00040000-555f-0cb5-07c8-39513e35409e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555f-0cb5-80a5-deeb77e1fd89	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555f-0cb5-461a-7cfebf8c91ec	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555f-0cb5-8f01-4770b3633ff0	IE	IRL	372	Ireland 	Irska	\N
00040000-555f-0cb5-9e56-a435ada73e0e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555f-0cb5-7e77-860746b7c451	IL	ISR	376	Israel 	Izrael	\N
00040000-555f-0cb5-e9ed-bb8f7ea868c1	IT	ITA	380	Italy 	Italija	\N
00040000-555f-0cb5-2f04-779aa1e4acd0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555f-0cb5-728b-6884b2dfa116	JP	JPN	392	Japan 	Japonska	\N
00040000-555f-0cb5-6b31-c891c3b25067	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555f-0cb5-51a9-722aae0dd68b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555f-0cb5-6c9d-06c8bc49600b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555f-0cb5-e2ab-f21f9473a549	KE	KEN	404	Kenya 	Kenija	\N
00040000-555f-0cb5-f0b3-0328ffc33055	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555f-0cb5-4944-ee7445f2e25b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555f-0cb5-8a1a-370b118a6127	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555f-0cb5-5d34-0a6c596cef3c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555f-0cb5-2511-837cc37093a6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555f-0cb5-8315-d525990e7924	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555f-0cb5-7696-2065d02cd224	LV	LVA	428	Latvia 	Latvija	\N
00040000-555f-0cb5-1b2f-1675fc31b71c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555f-0cb5-009c-f3552eeba201	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555f-0cb5-ad81-6bd715d408d3	LR	LBR	430	Liberia 	Liberija	\N
00040000-555f-0cb5-dfd3-3401f2a87a2e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555f-0cb5-c518-04b1397128e1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555f-0cb5-b9dd-cd60b32df949	LT	LTU	440	Lithuania 	Litva	\N
00040000-555f-0cb5-2022-d5df8356a86a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555f-0cb5-a186-a9beca3d3e84	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555f-0cb5-dfb8-2db5201e72d1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555f-0cb5-1dc1-dfb5fc05c28f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555f-0cb5-7ca1-2518b33518b9	MW	MWI	454	Malawi 	Malavi	\N
00040000-555f-0cb5-601b-09c05cd7e52a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555f-0cb5-64f2-6eda9532d3b2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555f-0cb5-4917-0d85094d65cf	ML	MLI	466	Mali 	Mali	\N
00040000-555f-0cb5-21be-79b5e0229728	MT	MLT	470	Malta 	Malta	\N
00040000-555f-0cb5-28c7-0b03f947260f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555f-0cb5-1dae-7f033f8bab63	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555f-0cb5-c8fe-7b9d5b0e7adb	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555f-0cb5-dd8f-9ff540b55687	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555f-0cb5-3dc6-e0a403f6527b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555f-0cb5-8ffe-d49a4d084f4d	MX	MEX	484	Mexico 	Mehika	\N
00040000-555f-0cb5-99dd-63a4031f18f6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555f-0cb5-fae8-67924bede2f6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555f-0cb5-eaec-e46d63b7de2e	MC	MCO	492	Monaco 	Monako	\N
00040000-555f-0cb5-a889-240d635621e3	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555f-0cb5-985d-33e39fc88787	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555f-0cb5-7d08-e587a3a73b98	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555f-0cb5-ca4e-acc2157db815	MA	MAR	504	Morocco 	Maroko	\N
00040000-555f-0cb5-2168-14b734177bf8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555f-0cb5-9816-18b69b93ed02	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555f-0cb5-12d2-c17753853bd6	NA	NAM	516	Namibia 	Namibija	\N
00040000-555f-0cb5-4915-2019aafb3240	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555f-0cb5-b786-030ad1d21430	NP	NPL	524	Nepal 	Nepal	\N
00040000-555f-0cb5-237b-c6e2482d20f9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555f-0cb5-8f57-78f3e15559d3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555f-0cb5-eb75-670c2ac20e66	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555f-0cb5-8046-eef16a6c9577	NE	NER	562	Niger 	Niger 	\N
00040000-555f-0cb5-e4f9-eab1fa40937f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555f-0cb5-51d1-c177c44dc6fd	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555f-0cb5-5174-59a33b6df19f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555f-0cb5-abbc-fa835139d2c1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555f-0cb5-b0bf-8909cc5e971f	NO	NOR	578	Norway 	Norveška	\N
00040000-555f-0cb5-c058-019ad44a83c5	OM	OMN	512	Oman 	Oman	\N
00040000-555f-0cb5-9c5d-5f03ed070f5a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555f-0cb5-de1c-479d11bfa3d4	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555f-0cb5-8451-4c9ac662b262	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555f-0cb5-a103-58730f176681	PA	PAN	591	Panama 	Panama	\N
00040000-555f-0cb5-32cd-ad435de529df	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555f-0cb5-6b90-4808ac749f58	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555f-0cb5-c621-2e315d81063b	PE	PER	604	Peru 	Peru	\N
00040000-555f-0cb5-158d-675caac6c741	PH	PHL	608	Philippines 	Filipini	\N
00040000-555f-0cb5-f7ab-caebe2febd2d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555f-0cb5-76d5-aa3ab2e9a1ab	PL	POL	616	Poland 	Poljska	\N
00040000-555f-0cb5-4c28-e4479b7fe659	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555f-0cb5-5851-8927fd2d9d95	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555f-0cb5-1a9f-a681ccd70e13	QA	QAT	634	Qatar 	Katar	\N
00040000-555f-0cb5-eb41-51e3e5f52c75	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555f-0cb5-a7c8-c1ab0199fe18	RO	ROU	642	Romania 	Romunija	\N
00040000-555f-0cb5-9033-5c795514a441	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555f-0cb5-3460-91c45254741e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555f-0cb5-a2c6-6ec83eceddde	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555f-0cb5-3df2-ca85b176452c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555f-0cb5-1a05-b1cc251ea728	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555f-0cb5-a000-6ef42935edad	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555f-0cb5-0405-c8d585367750	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555f-0cb5-c900-ba37a662b19f	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555f-0cb5-13f8-23ed59e5d40d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555f-0cb5-c510-8e5ec69745d5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555f-0cb5-1ebc-61d8b9d8e930	SM	SMR	674	San Marino 	San Marino	\N
00040000-555f-0cb5-3545-c4b42240c6ad	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555f-0cb5-7955-f0eb659b4dd4	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555f-0cb5-85fc-c30b0d00cd6c	SN	SEN	686	Senegal 	Senegal	\N
00040000-555f-0cb5-ff1d-d45c83f33400	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555f-0cb5-7217-f8eda8353793	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555f-0cb5-e11f-b320a49fdce7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555f-0cb5-17a3-f081bb8cbdd2	SG	SGP	702	Singapore 	Singapur	\N
00040000-555f-0cb5-a457-5936f0deb17e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555f-0cb5-5208-4cf836090f3b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555f-0cb5-d4bf-034142d914a9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555f-0cb5-f582-2df2543b0c1c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555f-0cb5-bdb8-ae3ce4f46228	SO	SOM	706	Somalia 	Somalija	\N
00040000-555f-0cb5-fc64-9f17e3a4e58a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555f-0cb5-d2a2-a49f90014a35	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555f-0cb5-b53c-b2984bbd4f3a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555f-0cb5-ea93-2c0e63af514b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555f-0cb5-4b9f-bfbb6d3ef9f4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555f-0cb5-345f-fafdca576c16	SD	SDN	729	Sudan 	Sudan	\N
00040000-555f-0cb5-3e0a-666a57c19283	SR	SUR	740	Suriname 	Surinam	\N
00040000-555f-0cb5-9957-155f609d8fca	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555f-0cb5-bbef-63a85ef5a96f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555f-0cb5-1925-fb25d3af7253	SE	SWE	752	Sweden 	Švedska	\N
00040000-555f-0cb5-9978-024fb63a19a8	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555f-0cb5-0a51-7fa66c8b53f1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555f-0cb5-3864-d21ccc81eddf	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555f-0cb5-1b82-d085a27fecd0	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555f-0cb5-ba15-23be36224799	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555f-0cb5-fd0a-26ff36341a70	TH	THA	764	Thailand 	Tajska	\N
00040000-555f-0cb5-3665-e2383fa4c91e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555f-0cb5-ad83-c7dc5659f418	TG	TGO	768	Togo 	Togo	\N
00040000-555f-0cb5-adb9-ebb0a0bb8cd6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555f-0cb5-f1cc-e187acdb6949	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555f-0cb5-3986-4326df4c34d6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555f-0cb5-a641-3e7f0cb22a49	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555f-0cb5-b5be-f182f9508a35	TR	TUR	792	Turkey 	Turčija	\N
00040000-555f-0cb5-5f2b-9baf73604c7b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555f-0cb5-1e1b-ac0dcc0d1ce9	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555f-0cb5-e55c-638e2bfd632b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555f-0cb5-8f60-8488f54c3716	UG	UGA	800	Uganda 	Uganda	\N
00040000-555f-0cb5-431a-0289131e5a0b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555f-0cb5-482d-09b6b6fcba5f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555f-0cb5-3a79-b4fcf7dc8118	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555f-0cb5-f0b8-bb8603df8fae	US	USA	840	United States 	Združene države Amerike	\N
00040000-555f-0cb5-e973-47720aefac82	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555f-0cb5-d24c-435cc932bdc0	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555f-0cb5-bd49-ea4741bace5e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555f-0cb5-f9c1-023b92e1095d	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555f-0cb5-0e59-ae2b041dc2b1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555f-0cb5-696e-d222509f1780	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555f-0cb5-05e9-6154a467ca4e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555f-0cb5-efb7-7b0ca6c37a24	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555f-0cb5-0920-e06dcaac8c46	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555f-0cb5-a873-0d5c2230e4f6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555f-0cb5-8543-b1e5c0898d24	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555f-0cb5-e274-260637dacc33	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555f-0cb5-9c2c-808ba24de04b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2667 (class 0 OID 4683724)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4683549)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4683593)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2625 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4683642)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4683667)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4683498)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555f-0cb5-5668-ce5ef02f74df	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555f-0cb5-6cef-9ce1a75d1332	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555f-0cb5-ff8b-f9b35a18c0a7	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555f-0cb5-6db1-d2b132fc22ed	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555f-0cb5-c6f8-fc599396678d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555f-0cb5-e262-23cd45045df0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555f-0cb5-6989-61df7c2bf42b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555f-0cb5-6729-2d7f912827e4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555f-0cb5-7975-9801a57eb3db	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555f-0cb5-8665-39e032aee0a7	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555f-0cb5-20ed-4795587440a4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-555f-0cb5-5d8a-512e3c216f90	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-555f-0cb5-cd79-e541dce879a2	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-555f-0cb5-5d84-ca4600d136de	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2635 (class 0 OID 4683408)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555f-0cb5-e6c8-dfe77d5468d3	00000000-555f-0cb5-c6f8-fc599396678d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555f-0cb5-5c5a-149e2704ca43	00000000-555f-0cb5-c6f8-fc599396678d	00010000-555f-0cb5-060e-865f40824af3	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555f-0cb5-53a2-05be85b7246e	00000000-555f-0cb5-e262-23cd45045df0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2636 (class 0 OID 4683419)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4683469)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 4683373)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555f-0cb5-8458-8adf7a520019	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555f-0cb5-0706-d622667fc77c	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555f-0cb5-a2b0-6bf9bf458c60	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555f-0cb5-04a8-afc02f9003cd	Abonma-read	Abonma - branje	f
00030000-555f-0cb5-2f2f-75f412002ea2	Abonma-write	Abonma - spreminjanje	f
00030000-555f-0cb5-0ab7-ace461e081e7	Alternacija-read	Alternacija - branje	f
00030000-555f-0cb5-b02c-1a5039db8df4	Alternacija-write	Alternacija - spreminjanje	f
00030000-555f-0cb5-4be4-30f19186a885	Arhivalija-read	Arhivalija - branje	f
00030000-555f-0cb5-43bb-79b39d442bb6	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555f-0cb5-2a98-b0b94aec450c	Besedilo-read	Besedilo - branje	f
00030000-555f-0cb5-804c-20937f8b9d6a	Besedilo-write	Besedilo - spreminjanje	f
00030000-555f-0cb5-2a05-5cce0ae59e94	DogodekIzven-read	DogodekIzven - branje	f
00030000-555f-0cb5-833c-72aa5d023cdd	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555f-0cb5-1719-e2e542469c2e	Dogodek-read	Dogodek - branje	f
00030000-555f-0cb5-127f-4659b6b51850	Dogodek-write	Dogodek - spreminjanje	f
00030000-555f-0cb5-ad36-0e199a6ed5c1	Drzava-read	Drzava - branje	f
00030000-555f-0cb5-a4ca-7edf6edf616c	Drzava-write	Drzava - spreminjanje	f
00030000-555f-0cb5-7f60-256c4b14133a	Funkcija-read	Funkcija - branje	f
00030000-555f-0cb5-894b-c4f7b63594a2	Funkcija-write	Funkcija - spreminjanje	f
00030000-555f-0cb5-28ec-778a24508ec4	Gostovanje-read	Gostovanje - branje	f
00030000-555f-0cb5-882e-7c1e9a175d5c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555f-0cb5-25b0-14cc883536b0	Gostujoca-read	Gostujoca - branje	f
00030000-555f-0cb5-87aa-129547a61f46	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555f-0cb5-8539-05df53e1db48	Kupec-read	Kupec - branje	f
00030000-555f-0cb5-2bc1-025a3af115d9	Kupec-write	Kupec - spreminjanje	f
00030000-555f-0cb5-e1e1-4f2db42f5e67	NacinPlacina-read	NacinPlacina - branje	f
00030000-555f-0cb5-7f18-9cd673916246	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555f-0cb5-1310-9f24f7822dfa	Option-read	Option - branje	f
00030000-555f-0cb5-a1d3-654a4c259f1e	Option-write	Option - spreminjanje	f
00030000-555f-0cb5-5987-a2a20f752752	OptionValue-read	OptionValue - branje	f
00030000-555f-0cb5-9e4e-82c102d302fb	OptionValue-write	OptionValue - spreminjanje	f
00030000-555f-0cb5-c656-eb340a8578c5	Oseba-read	Oseba - branje	f
00030000-555f-0cb5-7c1b-91b88a3c1623	Oseba-write	Oseba - spreminjanje	f
00030000-555f-0cb5-0158-ebae60aab640	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555f-0cb5-8a89-a958db0e7e65	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555f-0cb5-9120-30400a211544	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555f-0cb5-a2ba-40f4d21e93cb	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555f-0cb5-a29a-e09a4909be3a	Pogodba-read	Pogodba - branje	f
00030000-555f-0cb5-c389-fbf6bf3c2b09	Pogodba-write	Pogodba - spreminjanje	f
00030000-555f-0cb5-7819-46d247cf4ef7	Popa-read	Popa - branje	f
00030000-555f-0cb5-5df3-67d15c8abe9a	Popa-write	Popa - spreminjanje	f
00030000-555f-0cb5-422c-b7f752fe8bb9	Posta-read	Posta - branje	f
00030000-555f-0cb5-0ddb-3f1742c15ef3	Posta-write	Posta - spreminjanje	f
00030000-555f-0cb5-dcd5-ee282021bf32	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555f-0cb5-019f-f076ba58bacb	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555f-0cb5-4408-4c630f4ef2aa	PostniNaslov-read	PostniNaslov - branje	f
00030000-555f-0cb5-95c8-edf19ec78338	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555f-0cb5-707f-6b2ae4917c5a	Predstava-read	Predstava - branje	f
00030000-555f-0cb5-e6e5-f66d07ea200d	Predstava-write	Predstava - spreminjanje	f
00030000-555f-0cb5-dd66-bd9039111d92	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555f-0cb5-c63e-456efd47a186	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555f-0cb5-143f-4377f3a02dde	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555f-0cb5-22ab-eafe54f14955	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555f-0cb5-1dc4-fba06835905b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555f-0cb5-fa93-a53b2f3ba6ec	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555f-0cb5-59df-6c9589709c2b	Prostor-read	Prostor - branje	f
00030000-555f-0cb5-871e-7a1ef358991c	Prostor-write	Prostor - spreminjanje	f
00030000-555f-0cb5-faa5-08867305bd03	Racun-read	Racun - branje	f
00030000-555f-0cb5-dd83-bc455becddbd	Racun-write	Racun - spreminjanje	f
00030000-555f-0cb5-b179-959ff0c96fc3	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555f-0cb5-9f92-4d19114fe4ce	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555f-0cb5-5d5f-0cb4e276dab8	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555f-0cb5-a506-23231d5d62f3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555f-0cb5-d8f0-ce678270cc04	Rekvizit-read	Rekvizit - branje	f
00030000-555f-0cb5-59cc-04fcad9527c8	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555f-0cb5-b290-58ff2dbc1a21	Rezervacija-read	Rezervacija - branje	f
00030000-555f-0cb5-9a86-eea72cd05133	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555f-0cb5-d094-bf5ad9543710	SedezniRed-read	SedezniRed - branje	f
00030000-555f-0cb5-d102-6d4a6038b463	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555f-0cb5-b047-65f713431f83	Sedez-read	Sedez - branje	f
00030000-555f-0cb5-b80c-5e028c7846d4	Sedez-write	Sedez - spreminjanje	f
00030000-555f-0cb5-c50b-fe3a24471a42	Sezona-read	Sezona - branje	f
00030000-555f-0cb5-1874-ce101a61f1b1	Sezona-write	Sezona - spreminjanje	f
00030000-555f-0cb5-a81a-5b102dc242b9	Telefonska-read	Telefonska - branje	f
00030000-555f-0cb5-e3fa-edf283700875	Telefonska-write	Telefonska - spreminjanje	f
00030000-555f-0cb5-9bf0-46913e8e9415	TerminStoritve-read	TerminStoritve - branje	f
00030000-555f-0cb5-da00-4ce3990349b0	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555f-0cb5-f35e-e6c88ad819e7	TipFunkcije-read	TipFunkcije - branje	f
00030000-555f-0cb5-8091-c4d9c90a6ae2	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555f-0cb5-d6ec-83e3aa7eeeb5	Trr-read	Trr - branje	f
00030000-555f-0cb5-00f2-10dd855bab64	Trr-write	Trr - spreminjanje	f
00030000-555f-0cb5-903f-d6c3d20a7cab	Uprizoritev-read	Uprizoritev - branje	f
00030000-555f-0cb5-128b-caee0158b202	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555f-0cb5-ab4e-06d8b79cd19b	Vaja-read	Vaja - branje	f
00030000-555f-0cb5-e0c4-e3d0980f27fb	Vaja-write	Vaja - spreminjanje	f
00030000-555f-0cb5-1117-e106a1a7c57e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555f-0cb5-d95e-55ce73e07d0d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555f-0cb5-652f-68d4a038aec6	Zaposlitev-read	Zaposlitev - branje	f
00030000-555f-0cb5-e8c7-de9be5479f3e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555f-0cb5-e9ed-beff886d7284	Zasedenost-read	Zasedenost - branje	f
00030000-555f-0cb5-3e46-8f8c0ec8eec0	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555f-0cb5-51e0-8ae26fcb6225	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555f-0cb5-5c74-4575db06c1f7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555f-0cb5-d123-7ef48df65e44	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555f-0cb5-5348-a1543e16ba8c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2633 (class 0 OID 4683392)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555f-0cb5-a204-2c2ffa82010b	00030000-555f-0cb5-ad36-0e199a6ed5c1
00020000-555f-0cb5-3faa-f3573c3cbff6	00030000-555f-0cb5-a4ca-7edf6edf616c
00020000-555f-0cb5-3faa-f3573c3cbff6	00030000-555f-0cb5-ad36-0e199a6ed5c1
\.


--
-- TOC entry 2661 (class 0 OID 4683674)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 4683704)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 4683817)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 4683449)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4683490)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555f-0cb4-b410-c9447f88dae2	8341	Adlešiči
00050000-555f-0cb4-fe62-2194938c5539	5270	Ajdovščina
00050000-555f-0cb4-e633-eccf9308abb5	6280	Ankaran/Ancarano
00050000-555f-0cb4-0908-646c96a16ca4	9253	Apače
00050000-555f-0cb4-3ee6-bb0dbc727247	8253	Artiče
00050000-555f-0cb4-ca2b-c5e696853b07	4275	Begunje na Gorenjskem
00050000-555f-0cb4-9775-598b7a7f9b12	1382	Begunje pri Cerknici
00050000-555f-0cb4-97a5-df4b1a5636be	9231	Beltinci
00050000-555f-0cb4-7e8b-35a4c24d76a5	2234	Benedikt
00050000-555f-0cb4-8d9d-c535e67bc93a	2345	Bistrica ob Dravi
00050000-555f-0cb4-1d56-cbb39e743aeb	3256	Bistrica ob Sotli
00050000-555f-0cb4-5536-b1920510f791	8259	Bizeljsko
00050000-555f-0cb4-e762-660c2288be77	1223	Blagovica
00050000-555f-0cb4-585b-6d53055797e4	8283	Blanca
00050000-555f-0cb4-61be-f03520c25093	4260	Bled
00050000-555f-0cb4-be35-500aca75842e	4273	Blejska Dobrava
00050000-555f-0cb4-99e0-3b1b87160dd1	9265	Bodonci
00050000-555f-0cb4-b5f0-81af3b20ab78	9222	Bogojina
00050000-555f-0cb4-fbe0-934f9641e834	4263	Bohinjska Bela
00050000-555f-0cb4-a2e1-aa827aa8c0e3	4264	Bohinjska Bistrica
00050000-555f-0cb4-168c-762a249d991c	4265	Bohinjsko jezero
00050000-555f-0cb4-4cbd-82a0412222d6	1353	Borovnica
00050000-555f-0cb4-de9a-d153d705f903	8294	Boštanj
00050000-555f-0cb4-11c4-adc807ec4782	5230	Bovec
00050000-555f-0cb4-3d63-4680ce276b49	5295	Branik
00050000-555f-0cb4-8cca-8e95ffaa6cbd	3314	Braslovče
00050000-555f-0cb4-c05e-6607a53e327b	5223	Breginj
00050000-555f-0cb4-9ba3-4d93c83b5485	8280	Brestanica
00050000-555f-0cb4-40a4-a857167c0ae7	2354	Bresternica
00050000-555f-0cb4-9b95-b63b4b46c745	4243	Brezje
00050000-555f-0cb4-d72a-a6a75c5a0f90	1351	Brezovica pri Ljubljani
00050000-555f-0cb4-bd99-a2c1aa5c76b8	8250	Brežice
00050000-555f-0cb4-31cd-b5d1723e78ad	4210	Brnik - Aerodrom
00050000-555f-0cb4-38b6-507c65bb07ba	8321	Brusnice
00050000-555f-0cb4-fc89-e45fd82ebc25	3255	Buče
00050000-555f-0cb4-8459-726f8792189f	8276	Bučka 
00050000-555f-0cb4-1d34-822c02332598	9261	Cankova
00050000-555f-0cb4-0d8e-ab255695316c	3000	Celje 
00050000-555f-0cb4-4d7f-9847894cc237	3001	Celje - poštni predali
00050000-555f-0cb4-20aa-48a84f73caff	4207	Cerklje na Gorenjskem
00050000-555f-0cb4-fcae-55661977cadc	8263	Cerklje ob Krki
00050000-555f-0cb4-e354-e59bd25d6d09	1380	Cerknica
00050000-555f-0cb4-5102-23dcfa259203	5282	Cerkno
00050000-555f-0cb4-72be-da77dca2bb60	2236	Cerkvenjak
00050000-555f-0cb4-2021-e3c978e4a407	2215	Ceršak
00050000-555f-0cb4-fbd6-96e5faaed81d	2326	Cirkovce
00050000-555f-0cb4-9347-1954e403a253	2282	Cirkulane
00050000-555f-0cb4-e5b9-741fe7aed5ab	5273	Col
00050000-555f-0cb4-5f53-4358a87c3671	8251	Čatež ob Savi
00050000-555f-0cb4-2985-6d4b02e8b2f2	1413	Čemšenik
00050000-555f-0cb4-e81d-b92655aeae6d	5253	Čepovan
00050000-555f-0cb4-5542-14a9255244ef	9232	Črenšovci
00050000-555f-0cb4-bd89-e65376e5c20b	2393	Črna na Koroškem
00050000-555f-0cb4-1c4b-93110971e73a	6275	Črni Kal
00050000-555f-0cb4-6b9d-d837bf7cfc50	5274	Črni Vrh nad Idrijo
00050000-555f-0cb4-72c5-6322950329c1	5262	Črniče
00050000-555f-0cb4-7a0f-4507c244ce5d	8340	Črnomelj
00050000-555f-0cb4-e63d-f6b8493536cc	6271	Dekani
00050000-555f-0cb4-bd5b-b5609d1fa7c2	5210	Deskle
00050000-555f-0cb4-992c-8843b7268af1	2253	Destrnik
00050000-555f-0cb4-2f70-d67f94249398	6215	Divača
00050000-555f-0cb4-71f3-5e8ef098a094	1233	Dob
00050000-555f-0cb4-c408-2c4f12479ab2	3224	Dobje pri Planini
00050000-555f-0cb4-8806-764285f9d929	8257	Dobova
00050000-555f-0cb4-9d1f-a78f5cbb4e42	1423	Dobovec
00050000-555f-0cb4-3a94-d7292267e6dc	5263	Dobravlje
00050000-555f-0cb4-bd5a-9a322a208b13	3204	Dobrna
00050000-555f-0cb4-831f-12532431e128	8211	Dobrnič
00050000-555f-0cb4-4c24-43028a420271	1356	Dobrova
00050000-555f-0cb4-e2d3-7d47d5873b3c	9223	Dobrovnik/Dobronak 
00050000-555f-0cb4-1811-f75d18cdbb57	5212	Dobrovo v Brdih
00050000-555f-0cb4-070b-4482004277f8	1431	Dol pri Hrastniku
00050000-555f-0cb4-2699-40f5b96b18da	1262	Dol pri Ljubljani
00050000-555f-0cb4-a52b-72ccd53c2648	1273	Dole pri Litiji
00050000-555f-0cb4-55fe-3459954ca622	1331	Dolenja vas
00050000-555f-0cb4-9537-cc8d710317ca	8350	Dolenjske Toplice
00050000-555f-0cb4-32bd-2c9364fb9d82	1230	Domžale
00050000-555f-0cb4-ebc3-523061daef0f	2252	Dornava
00050000-555f-0cb4-9b49-7b336bd9071b	5294	Dornberk
00050000-555f-0cb4-fd66-2233fef1601a	1319	Draga
00050000-555f-0cb4-ef7a-6e4b7bc24b23	8343	Dragatuš
00050000-555f-0cb4-0a88-18d3733bf034	3222	Dramlje
00050000-555f-0cb4-22a1-3fbac458a6c3	2370	Dravograd
00050000-555f-0cb4-8388-dd786acdacfd	4203	Duplje
00050000-555f-0cb4-73e6-9deccdd70e4d	6221	Dutovlje
00050000-555f-0cb4-1159-a84cc1083000	8361	Dvor
00050000-555f-0cb4-cb80-24c7bfb8b6aa	2343	Fala
00050000-555f-0cb4-4e59-342448ba7e59	9208	Fokovci
00050000-555f-0cb4-c76b-d7d488f872d8	2313	Fram
00050000-555f-0cb4-29ca-e1002b89a375	3213	Frankolovo
00050000-555f-0cb4-e17d-7b874d1aeaed	1274	Gabrovka
00050000-555f-0cb4-1ef6-2e21503b9bb8	8254	Globoko
00050000-555f-0cb4-d792-d63e0dedc92d	5275	Godovič
00050000-555f-0cb4-ed81-ea12ebd182e8	4204	Golnik
00050000-555f-0cb4-6b27-41e1eb44d097	3303	Gomilsko
00050000-555f-0cb4-631e-bf64a13ca326	4224	Gorenja vas
00050000-555f-0cb4-a923-17c32633740b	3263	Gorica pri Slivnici
00050000-555f-0cb4-0c85-b8b674ff3189	2272	Gorišnica
00050000-555f-0cb4-624d-aa5fc39ba2f5	9250	Gornja Radgona
00050000-555f-0cb4-3c81-7fb420e67a8c	3342	Gornji Grad
00050000-555f-0cb4-4db6-1b30542300e6	4282	Gozd Martuljek
00050000-555f-0cb4-d82a-b6a1ec82aa21	6272	Gračišče
00050000-555f-0cb4-086c-9a1b00639ec4	9264	Grad
00050000-555f-0cb4-df41-86a2ce1e1eb6	8332	Gradac
00050000-555f-0cb4-7ce1-f6ff9aff7af2	1384	Grahovo
00050000-555f-0cb4-9390-7229fe7d73a8	5242	Grahovo ob Bači
00050000-555f-0cb4-d1fa-6780889ae961	5251	Grgar
00050000-555f-0cb4-f5a4-9057d2cf618b	3302	Griže
00050000-555f-0cb4-17b1-d85a15adbb1f	3231	Grobelno
00050000-555f-0cb4-9845-2d21d48bb69b	1290	Grosuplje
00050000-555f-0cb4-31d0-870a93d730f3	2288	Hajdina
00050000-555f-0cb4-eeef-7b24197cc178	8362	Hinje
00050000-555f-0cb4-c065-175e8df9930b	2311	Hoče
00050000-555f-0cb4-505e-6741c3939983	9205	Hodoš/Hodos
00050000-555f-0cb4-d663-9b010866b6c2	1354	Horjul
00050000-555f-0cb4-1b39-4268080552ff	1372	Hotedršica
00050000-555f-0cb4-63d0-773922ade6a0	1430	Hrastnik
00050000-555f-0cb4-fbbe-842dfa0fc7d7	6225	Hruševje
00050000-555f-0cb5-9b71-275994de2309	4276	Hrušica
00050000-555f-0cb5-5516-62050e40c167	5280	Idrija
00050000-555f-0cb5-17b3-bf49bb0baf4b	1292	Ig
00050000-555f-0cb5-daee-1eee5e64e41c	6250	Ilirska Bistrica
00050000-555f-0cb5-3300-ac9c0751aee5	6251	Ilirska Bistrica-Trnovo
00050000-555f-0cb5-8dc3-8dff221b41ac	1295	Ivančna Gorica
00050000-555f-0cb5-e675-444ab05a966c	2259	Ivanjkovci
00050000-555f-0cb5-e195-6b1940c1c967	1411	Izlake
00050000-555f-0cb5-3788-539b458e98e4	6310	Izola/Isola
00050000-555f-0cb5-dc8f-cdd68c6bdf71	2222	Jakobski Dol
00050000-555f-0cb5-8413-68caa7f81085	2221	Jarenina
00050000-555f-0cb5-b8f8-1377451dcb1f	6254	Jelšane
00050000-555f-0cb5-de65-cd16961d3801	4270	Jesenice
00050000-555f-0cb5-4704-4c37787719f9	8261	Jesenice na Dolenjskem
00050000-555f-0cb5-3dd9-4b2f83eb1d1b	3273	Jurklošter
00050000-555f-0cb5-3407-2027a581408e	2223	Jurovski Dol
00050000-555f-0cb5-22bf-de021340a964	2256	Juršinci
00050000-555f-0cb5-b56d-7fd5962f7d0a	5214	Kal nad Kanalom
00050000-555f-0cb5-a64b-f5e9195d25e6	3233	Kalobje
00050000-555f-0cb5-9fe9-49c5d0770255	4246	Kamna Gorica
00050000-555f-0cb5-ed87-cc4c532880fc	2351	Kamnica
00050000-555f-0cb5-60a4-47c0020d8d6b	1241	Kamnik
00050000-555f-0cb5-c6ac-0b79ac2e4ba8	5213	Kanal
00050000-555f-0cb5-6e31-aea5dfecbf20	8258	Kapele
00050000-555f-0cb5-69eb-46df8fd5c5e8	2362	Kapla
00050000-555f-0cb5-5a8b-d924cfc40061	2325	Kidričevo
00050000-555f-0cb5-7b13-12578415ee5c	1412	Kisovec
00050000-555f-0cb5-1d7d-9f296d52aa4f	6253	Knežak
00050000-555f-0cb5-80f0-63d79dbed517	5222	Kobarid
00050000-555f-0cb5-a52d-c77cf5fba48b	9227	Kobilje
00050000-555f-0cb5-a9e7-d046e34b8a7a	1330	Kočevje
00050000-555f-0cb5-5ae4-9f0e5d777f92	1338	Kočevska Reka
00050000-555f-0cb5-201b-c3942b4a1f95	2276	Kog
00050000-555f-0cb5-5597-b30530b3d6f9	5211	Kojsko
00050000-555f-0cb5-9bbf-ec4225603fea	6223	Komen
00050000-555f-0cb5-ed7d-1c26b5d1ddf8	1218	Komenda
00050000-555f-0cb5-ef8b-90c6f491cb88	6000	Koper/Capodistria 
00050000-555f-0cb5-1da9-f882ffd262c1	6001	Koper/Capodistria - poštni predali
00050000-555f-0cb5-bbed-58a8ee5a6c61	8282	Koprivnica
00050000-555f-0cb5-0e0f-4a74d83e5d71	5296	Kostanjevica na Krasu
00050000-555f-0cb5-f72f-3ce09206814f	8311	Kostanjevica na Krki
00050000-555f-0cb5-36ce-68759bebd763	1336	Kostel
00050000-555f-0cb5-f3a0-38923f817562	6256	Košana
00050000-555f-0cb5-a0d7-7e8ebe642c2d	2394	Kotlje
00050000-555f-0cb5-641a-6aaffe23ee34	6240	Kozina
00050000-555f-0cb5-21c9-84fb66aca737	3260	Kozje
00050000-555f-0cb5-bce8-15113e624577	4000	Kranj 
00050000-555f-0cb5-5241-de4f4dfb022e	4001	Kranj - poštni predali
00050000-555f-0cb5-0d05-ac9e3eae3f8e	4280	Kranjska Gora
00050000-555f-0cb5-0bcf-a97479f1014e	1281	Kresnice
00050000-555f-0cb5-f5d4-0633d885ab7e	4294	Križe
00050000-555f-0cb5-9056-d27021b8a8ef	9206	Križevci
00050000-555f-0cb5-91a1-172c1f13e192	9242	Križevci pri Ljutomeru
00050000-555f-0cb5-f2e0-6d1a4ea5ed57	1301	Krka
00050000-555f-0cb5-706d-87950dfd1e09	8296	Krmelj
00050000-555f-0cb5-f9de-ac5d2a94d814	4245	Kropa
00050000-555f-0cb5-dd22-c404408c6212	8262	Krška vas
00050000-555f-0cb5-f819-d0d1e60c5340	8270	Krško
00050000-555f-0cb5-c0de-4a935546bf48	9263	Kuzma
00050000-555f-0cb5-de0a-5e4c624cb4c5	2318	Laporje
00050000-555f-0cb5-23c2-dfab2fb7d13b	3270	Laško
00050000-555f-0cb5-fc4d-13c4069aa178	1219	Laze v Tuhinju
00050000-555f-0cb5-3e58-796af651f523	2230	Lenart v Slovenskih goricah
00050000-555f-0cb5-0b9c-cf27c877d913	9220	Lendava/Lendva
00050000-555f-0cb5-0b7e-4cdd31d8df1f	4248	Lesce
00050000-555f-0cb5-eae8-c541652fcd11	3261	Lesično
00050000-555f-0cb5-3c1d-2f6b192d1a18	8273	Leskovec pri Krškem
00050000-555f-0cb5-8738-ff60da3f0b4c	2372	Libeliče
00050000-555f-0cb5-183d-b78befb93a95	2341	Limbuš
00050000-555f-0cb5-69c0-a7595b6e3711	1270	Litija
00050000-555f-0cb5-ab57-62264bdc9543	3202	Ljubečna
00050000-555f-0cb5-8a41-aeb3d81b0a19	1000	Ljubljana 
00050000-555f-0cb5-27df-d30aec57a552	1001	Ljubljana - poštni predali
00050000-555f-0cb5-c160-0f3e55e9ec11	1231	Ljubljana - Črnuče
00050000-555f-0cb5-f025-f4d73ab7a324	1261	Ljubljana - Dobrunje
00050000-555f-0cb5-644d-cb702b5333b7	1260	Ljubljana - Polje
00050000-555f-0cb5-6fec-776af2ced98f	1210	Ljubljana - Šentvid
00050000-555f-0cb5-9a20-429a25571f18	1211	Ljubljana - Šmartno
00050000-555f-0cb5-8924-4c94aab7c4a7	3333	Ljubno ob Savinji
00050000-555f-0cb5-554e-e7ca2d2798c4	9240	Ljutomer
00050000-555f-0cb5-332b-1787e871f02c	3215	Loče
00050000-555f-0cb5-7e11-ea237ff80715	5231	Log pod Mangartom
00050000-555f-0cb5-443f-2511d76843f1	1358	Log pri Brezovici
00050000-555f-0cb5-6dcf-a877d116e578	1370	Logatec
00050000-555f-0cb5-a674-6da250f5e6ac	1371	Logatec
00050000-555f-0cb5-7d7b-bc394e2a0e93	1434	Loka pri Zidanem Mostu
00050000-555f-0cb5-4927-979d5f3d1d47	3223	Loka pri Žusmu
00050000-555f-0cb5-d798-162414557560	6219	Lokev
00050000-555f-0cb5-98d5-768f7e8896c9	1318	Loški Potok
00050000-555f-0cb5-90da-ffcc6439ac60	2324	Lovrenc na Dravskem polju
00050000-555f-0cb5-25a6-8a0a990b4aa6	2344	Lovrenc na Pohorju
00050000-555f-0cb5-7142-16aeef4e8bd1	3334	Luče
00050000-555f-0cb5-29d7-3c06b6f511a0	1225	Lukovica
00050000-555f-0cb5-2fe3-d73292bf1f72	9202	Mačkovci
00050000-555f-0cb5-1c6d-b8fed68489af	2322	Majšperk
00050000-555f-0cb5-47c8-1f4103145871	2321	Makole
00050000-555f-0cb5-1169-ec822bb1653b	9243	Mala Nedelja
00050000-555f-0cb5-62a7-008243ee82c7	2229	Malečnik
00050000-555f-0cb5-9427-0728764af192	6273	Marezige
00050000-555f-0cb5-b542-ed5959b93e41	2000	Maribor 
00050000-555f-0cb5-a235-df22b380bc18	2001	Maribor - poštni predali
00050000-555f-0cb5-186c-3ad2d228b450	2206	Marjeta na Dravskem polju
00050000-555f-0cb5-51ee-cde3600d053f	2281	Markovci
00050000-555f-0cb5-d2d6-2f35e9a77125	9221	Martjanci
00050000-555f-0cb5-42b3-fbf2bff375d4	6242	Materija
00050000-555f-0cb5-a963-333bca018125	4211	Mavčiče
00050000-555f-0cb5-19be-434fe6073ff2	1215	Medvode
00050000-555f-0cb5-15b7-0f0d37bb8533	1234	Mengeš
00050000-555f-0cb5-5b7d-4293649c6475	8330	Metlika
00050000-555f-0cb5-1ebc-a6d7b71f09c0	2392	Mežica
00050000-555f-0cb5-1428-d37b25cea10f	2204	Miklavž na Dravskem polju
00050000-555f-0cb5-bc52-fb124b729c20	2275	Miklavž pri Ormožu
00050000-555f-0cb5-7edd-e1c2c269c62e	5291	Miren
00050000-555f-0cb5-80ca-74526c27629e	8233	Mirna
00050000-555f-0cb5-4075-f67b7769edc3	8216	Mirna Peč
00050000-555f-0cb5-f03b-b7779c0b9469	2382	Mislinja
00050000-555f-0cb5-3373-fc34891a0de4	4281	Mojstrana
00050000-555f-0cb5-4517-5f188e1e1d1b	8230	Mokronog
00050000-555f-0cb5-b1fd-119956ccf9db	1251	Moravče
00050000-555f-0cb5-648c-7225de763138	9226	Moravske Toplice
00050000-555f-0cb5-dac2-a49a8aa7eb79	5216	Most na Soči
00050000-555f-0cb5-2a20-55fbb8b4725e	1221	Motnik
00050000-555f-0cb5-1847-ead73aa71e90	3330	Mozirje
00050000-555f-0cb5-a03f-fa0434131b80	9000	Murska Sobota 
00050000-555f-0cb5-3e79-e9e1c93d67d3	9001	Murska Sobota - poštni predali
00050000-555f-0cb5-9ad1-6de622f31606	2366	Muta
00050000-555f-0cb5-42af-d146690b35e1	4202	Naklo
00050000-555f-0cb5-9a9b-cc21bd39ca84	3331	Nazarje
00050000-555f-0cb5-5ca4-f51f685f9d27	1357	Notranje Gorice
00050000-555f-0cb5-1efe-d387493c99b6	3203	Nova Cerkev
00050000-555f-0cb5-0785-fbdc0156a1c3	5000	Nova Gorica 
00050000-555f-0cb5-94d0-fcbc71fca0aa	5001	Nova Gorica - poštni predali
00050000-555f-0cb5-9cdc-6ce6195aa749	1385	Nova vas
00050000-555f-0cb5-bc3c-cf22e3618473	8000	Novo mesto
00050000-555f-0cb5-fac9-5f3f4558a625	8001	Novo mesto - poštni predali
00050000-555f-0cb5-cda5-34d2fdc31d3a	6243	Obrov
00050000-555f-0cb5-275b-f3bf4231d398	9233	Odranci
00050000-555f-0cb5-e69e-515cb3aa9f8d	2317	Oplotnica
00050000-555f-0cb5-5adf-e65b4f5c3b75	2312	Orehova vas
00050000-555f-0cb5-0df6-553470c1220c	2270	Ormož
00050000-555f-0cb5-5b52-4fca84e51817	1316	Ortnek
00050000-555f-0cb5-82c6-9e2292908f25	1337	Osilnica
00050000-555f-0cb5-1382-2df294cd9691	8222	Otočec
00050000-555f-0cb5-24a5-4b672edaa1a2	2361	Ožbalt
00050000-555f-0cb5-e2e3-491ed0e52764	2231	Pernica
00050000-555f-0cb5-cafd-f16a4a8aeaac	2211	Pesnica pri Mariboru
00050000-555f-0cb5-d0ec-00c47ad48eb6	9203	Petrovci
00050000-555f-0cb5-f050-3b6f908ac85e	3301	Petrovče
00050000-555f-0cb5-30e2-8fc05e2bd794	6330	Piran/Pirano
00050000-555f-0cb5-4ba4-2cb841cbd593	8255	Pišece
00050000-555f-0cb5-c663-ba27869e5212	6257	Pivka
00050000-555f-0cb5-fd2d-6d9e7469597c	6232	Planina
00050000-555f-0cb5-6d3f-2e31bda8ee07	3225	Planina pri Sevnici
00050000-555f-0cb5-3728-778a205cf97b	6276	Pobegi
00050000-555f-0cb5-902f-f60298885bd4	8312	Podbočje
00050000-555f-0cb5-17b7-0806fbf7e895	5243	Podbrdo
00050000-555f-0cb5-29e1-479e5d9213ea	3254	Podčetrtek
00050000-555f-0cb5-aa17-eb7ca00196c1	2273	Podgorci
00050000-555f-0cb5-e4bb-3cfd40174a0e	6216	Podgorje
00050000-555f-0cb5-9465-41f9551bc3df	2381	Podgorje pri Slovenj Gradcu
00050000-555f-0cb5-7a48-be260e8a0ae6	6244	Podgrad
00050000-555f-0cb5-5d72-1487b5c029c0	1414	Podkum
00050000-555f-0cb5-89bc-5d965acf6453	2286	Podlehnik
00050000-555f-0cb5-8ded-00dfb7d7d234	5272	Podnanos
00050000-555f-0cb5-273c-23b55e3b3e73	4244	Podnart
00050000-555f-0cb5-54c9-b1765154ece4	3241	Podplat
00050000-555f-0cb5-24b9-0623a5be3fd8	3257	Podsreda
00050000-555f-0cb5-69f6-26332257d9f4	2363	Podvelka
00050000-555f-0cb5-2d68-b1ee3c81860f	2208	Pohorje
00050000-555f-0cb5-77d4-373d22fe8b21	2257	Polenšak
00050000-555f-0cb5-dbc7-7f7205980db0	1355	Polhov Gradec
00050000-555f-0cb5-e586-b344ed69094f	4223	Poljane nad Škofjo Loko
00050000-555f-0cb5-595c-4a4fe240ee7a	2319	Poljčane
00050000-555f-0cb5-1016-c407d6f14e0b	1272	Polšnik
00050000-555f-0cb5-6d96-0baeea6ad872	3313	Polzela
00050000-555f-0cb5-7511-96c07c0858f4	3232	Ponikva
00050000-555f-0cb5-85af-702be242024b	6320	Portorož/Portorose
00050000-555f-0cb5-52c5-cec4ed0a595e	6230	Postojna
00050000-555f-0cb5-cefc-8ea4e9738eb4	2331	Pragersko
00050000-555f-0cb5-6aa3-ba4b5f04e2f0	3312	Prebold
00050000-555f-0cb5-8097-b576722ecb90	4205	Preddvor
00050000-555f-0cb5-5ba6-5517e4b5232b	6255	Prem
00050000-555f-0cb5-6fdd-594b20e1a64c	1352	Preserje
00050000-555f-0cb5-5269-409029de96ea	6258	Prestranek
00050000-555f-0cb5-cab8-10c0b900c8f9	2391	Prevalje
00050000-555f-0cb5-3c05-5f4b67d91a81	3262	Prevorje
00050000-555f-0cb5-88e7-6e92d4e99216	1276	Primskovo 
00050000-555f-0cb5-d5dc-cfbf11e33d82	3253	Pristava pri Mestinju
00050000-555f-0cb5-2e3a-569b69cb4b4b	9207	Prosenjakovci/Partosfalva
00050000-555f-0cb5-dee3-a0e6c6101c38	5297	Prvačina
00050000-555f-0cb5-c2b6-4bf105419d2e	2250	Ptuj
00050000-555f-0cb5-61ab-9fc56acf7c64	2323	Ptujska Gora
00050000-555f-0cb5-fd3c-9be7d117e56f	9201	Puconci
00050000-555f-0cb5-1300-aa661ea42721	2327	Rače
00050000-555f-0cb5-979f-c52afacc7780	1433	Radeče
00050000-555f-0cb5-bdd1-1bc479f718bd	9252	Radenci
00050000-555f-0cb5-ac3b-88d2d2d70130	2360	Radlje ob Dravi
00050000-555f-0cb5-d732-69b4ff594068	1235	Radomlje
00050000-555f-0cb5-ca52-3fcd84a843e2	4240	Radovljica
00050000-555f-0cb5-f9ce-f7f02d20482f	8274	Raka
00050000-555f-0cb5-76b4-e946b7fc2eb2	1381	Rakek
00050000-555f-0cb5-4805-a807e6305496	4283	Rateče - Planica
00050000-555f-0cb5-3418-b73841163455	2390	Ravne na Koroškem
00050000-555f-0cb5-58be-003f6ebd59c0	9246	Razkrižje
00050000-555f-0cb5-b3f7-5269f121271c	3332	Rečica ob Savinji
00050000-555f-0cb5-f0f2-da25a842542a	5292	Renče
00050000-555f-0cb5-928b-abcdb4127c78	1310	Ribnica
00050000-555f-0cb5-9b88-16e391c3decd	2364	Ribnica na Pohorju
00050000-555f-0cb5-e77c-e11a1a011a8c	3272	Rimske Toplice
00050000-555f-0cb5-c43f-099eeabee89d	1314	Rob
00050000-555f-0cb5-e2e7-8477cd200e9e	5215	Ročinj
00050000-555f-0cb5-c73a-169b34d2bd9f	3250	Rogaška Slatina
00050000-555f-0cb5-4508-7f7ab3bd5bea	9262	Rogašovci
00050000-555f-0cb5-477c-43bdeb889bfb	3252	Rogatec
00050000-555f-0cb5-83d4-9d11a0bf9e92	1373	Rovte
00050000-555f-0cb5-3f31-5b318b95ae0a	2342	Ruše
00050000-555f-0cb5-468c-cb3d4a49951f	1282	Sava
00050000-555f-0cb5-8098-bd925bbb7f9f	6333	Sečovlje/Sicciole
00050000-555f-0cb5-5eb5-c76ad4d45336	4227	Selca
00050000-555f-0cb5-51a1-d9c9cdbde13a	2352	Selnica ob Dravi
00050000-555f-0cb5-f7d2-6d2be21f0612	8333	Semič
00050000-555f-0cb5-ef63-b2f23e79c6ca	8281	Senovo
00050000-555f-0cb5-d230-99ece0a18e54	6224	Senožeče
00050000-555f-0cb5-b96b-9a8e6366d8f9	8290	Sevnica
00050000-555f-0cb5-8ad1-f34bc2b7a435	6210	Sežana
00050000-555f-0cb5-694d-3ddb9ae8ae2a	2214	Sladki Vrh
00050000-555f-0cb5-d90b-32df6ec11ce8	5283	Slap ob Idrijci
00050000-555f-0cb5-806b-ec609566126d	2380	Slovenj Gradec
00050000-555f-0cb5-18b3-f81f3150c664	2310	Slovenska Bistrica
00050000-555f-0cb5-9c67-968ab3b9c324	3210	Slovenske Konjice
00050000-555f-0cb5-cb19-bcd658a39e67	1216	Smlednik
00050000-555f-0cb5-36ec-5d0184179949	5232	Soča
00050000-555f-0cb5-f062-b5add98172a0	1317	Sodražica
00050000-555f-0cb5-7f39-a47c656be270	3335	Solčava
00050000-555f-0cb5-6413-7955f6094243	5250	Solkan
00050000-555f-0cb5-a627-51e2abc37238	4229	Sorica
00050000-555f-0cb5-02ed-f667a26b092a	4225	Sovodenj
00050000-555f-0cb5-a238-f36ddb49064b	5281	Spodnja Idrija
00050000-555f-0cb5-90dd-18b86e29fec4	2241	Spodnji Duplek
00050000-555f-0cb5-8fd0-25aa93aa2cf2	9245	Spodnji Ivanjci
00050000-555f-0cb5-ee92-65f501d6b729	2277	Središče ob Dravi
00050000-555f-0cb5-dc06-cb25f4d53c26	4267	Srednja vas v Bohinju
00050000-555f-0cb5-7e6e-1f3ac4928e44	8256	Sromlje 
00050000-555f-0cb5-3ffb-04dbcb2fddce	5224	Srpenica
00050000-555f-0cb5-45b6-ad665392d72e	1242	Stahovica
00050000-555f-0cb5-772f-512f19688f37	1332	Stara Cerkev
00050000-555f-0cb5-3695-4e530c594358	8342	Stari trg ob Kolpi
00050000-555f-0cb5-aa36-2b1ddc153bd2	1386	Stari trg pri Ložu
00050000-555f-0cb5-d6c5-807773e183cb	2205	Starše
00050000-555f-0cb5-34d3-5ca56e17c19f	2289	Stoperce
00050000-555f-0cb5-4d0c-407c9ab4a143	8322	Stopiče
00050000-555f-0cb5-5386-a24599ac26c3	3206	Stranice
00050000-555f-0cb5-5890-84be5fb5dacb	8351	Straža
00050000-555f-0cb5-f612-ecd908e70968	1313	Struge
00050000-555f-0cb5-b526-838e0ea7b0b0	8293	Studenec
00050000-555f-0cb5-7f10-4f7f422fab08	8331	Suhor
00050000-555f-0cb5-eb5b-71f01220d6aa	2233	Sv. Ana v Slovenskih goricah
00050000-555f-0cb5-1643-bbdbacde1217	2235	Sv. Trojica v Slovenskih goricah
00050000-555f-0cb5-25a9-78598d2716e9	2353	Sveti Duh na Ostrem Vrhu
00050000-555f-0cb5-7164-2c92bd01f34e	9244	Sveti Jurij ob Ščavnici
00050000-555f-0cb5-24bb-4b33adcbb493	3264	Sveti Štefan
00050000-555f-0cb5-ea64-c84f51c8f31c	2258	Sveti Tomaž
00050000-555f-0cb5-e317-c7dd9681ace3	9204	Šalovci
00050000-555f-0cb5-9833-2301b38665a4	5261	Šempas
00050000-555f-0cb5-f772-8eb73e6d8005	5290	Šempeter pri Gorici
00050000-555f-0cb5-61cc-fce6739f5ebf	3311	Šempeter v Savinjski dolini
00050000-555f-0cb5-bbd4-7b6bb357abed	4208	Šenčur
00050000-555f-0cb5-5d4b-813d2b556aac	2212	Šentilj v Slovenskih goricah
00050000-555f-0cb5-edc0-cb847552f536	8297	Šentjanž
00050000-555f-0cb5-ae0a-f1a8b9bc9384	2373	Šentjanž pri Dravogradu
00050000-555f-0cb5-ba6d-00e045931bf1	8310	Šentjernej
00050000-555f-0cb5-5dac-1272619a2dc9	3230	Šentjur
00050000-555f-0cb5-07e2-3396c2b11c51	3271	Šentrupert
00050000-555f-0cb5-85c1-d521599dbed5	8232	Šentrupert
00050000-555f-0cb5-2894-251dfe191709	1296	Šentvid pri Stični
00050000-555f-0cb5-1399-b48cc21182b2	8275	Škocjan
00050000-555f-0cb5-9317-ce5c07fabdcf	6281	Škofije
00050000-555f-0cb5-d002-224cbc7bf8c3	4220	Škofja Loka
00050000-555f-0cb5-97c7-e97edad3fd72	3211	Škofja vas
00050000-555f-0cb5-6251-0e999ee8a962	1291	Škofljica
00050000-555f-0cb5-1269-2137e64cdf14	6274	Šmarje
00050000-555f-0cb5-bc0f-9c6b14114384	1293	Šmarje - Sap
00050000-555f-0cb5-c738-671b6d33a621	3240	Šmarje pri Jelšah
00050000-555f-0cb5-0efb-f76e51c75672	8220	Šmarješke Toplice
00050000-555f-0cb5-905b-3f2f8a1c39eb	2315	Šmartno na Pohorju
00050000-555f-0cb5-c05d-0d87410540b8	3341	Šmartno ob Dreti
00050000-555f-0cb5-a569-4c5ade792dc3	3327	Šmartno ob Paki
00050000-555f-0cb5-98d8-8b2d5e0628ce	1275	Šmartno pri Litiji
00050000-555f-0cb5-cf5f-d5a7c5a2d491	2383	Šmartno pri Slovenj Gradcu
00050000-555f-0cb5-0efd-1b89b31d2d98	3201	Šmartno v Rožni dolini
00050000-555f-0cb5-3fcd-6256d52c4cbf	3325	Šoštanj
00050000-555f-0cb5-ca7b-57356c628142	6222	Štanjel
00050000-555f-0cb5-4a15-b5f223cb3ff8	3220	Štore
00050000-555f-0cb5-3447-30ebaae6e803	3304	Tabor
00050000-555f-0cb5-ddf6-37e9fa23c1e5	3221	Teharje
00050000-555f-0cb5-b6a8-0f2e9897cd80	9251	Tišina
00050000-555f-0cb5-8340-320c2742de82	5220	Tolmin
00050000-555f-0cb5-f2a4-d467deab6a8c	3326	Topolšica
00050000-555f-0cb5-00be-03f0e37b56e5	2371	Trbonje
00050000-555f-0cb5-89d5-28bc271d5ca6	1420	Trbovlje
00050000-555f-0cb5-d70a-4f34f6e6f93a	8231	Trebelno 
00050000-555f-0cb5-6cd9-beb50cd65986	8210	Trebnje
00050000-555f-0cb5-067a-fb3d2c6cb33f	5252	Trnovo pri Gorici
00050000-555f-0cb5-2319-47307bfd068c	2254	Trnovska vas
00050000-555f-0cb5-e832-cb3b5de08b10	1222	Trojane
00050000-555f-0cb5-c453-9d42810efd61	1236	Trzin
00050000-555f-0cb5-7579-dd9ea9ff236c	4290	Tržič
00050000-555f-0cb5-c275-76c2a11dcefc	8295	Tržišče
00050000-555f-0cb5-4d28-7a4a4b19c2f7	1311	Turjak
00050000-555f-0cb5-570f-56c0096653d9	9224	Turnišče
00050000-555f-0cb5-b8fd-df7248ba9ad4	8323	Uršna sela
00050000-555f-0cb5-3173-b8d26dfd21aa	1252	Vače
00050000-555f-0cb5-95ca-247b7d4f1c9b	3320	Velenje 
00050000-555f-0cb5-f1b5-32bc623b81e9	3322	Velenje - poštni predali
00050000-555f-0cb5-5f71-1139eb8f61be	8212	Velika Loka
00050000-555f-0cb5-e8ab-512baa1ebed3	2274	Velika Nedelja
00050000-555f-0cb5-6431-6628f6a052d5	9225	Velika Polana
00050000-555f-0cb5-6aa5-a59518317fb1	1315	Velike Lašče
00050000-555f-0cb5-c5f1-071589fcdbf2	8213	Veliki Gaber
00050000-555f-0cb5-2455-7b3e6eafc4d8	9241	Veržej
00050000-555f-0cb5-9dc4-2854ca09fb3f	1312	Videm - Dobrepolje
00050000-555f-0cb5-1ffc-b376dee28385	2284	Videm pri Ptuju
00050000-555f-0cb5-55c2-31b3b726c81f	8344	Vinica
00050000-555f-0cb5-a3a4-afd8b24f698b	5271	Vipava
00050000-555f-0cb5-5634-30d3f0721e02	4212	Visoko
00050000-555f-0cb5-e562-64eb0d0de746	1294	Višnja Gora
00050000-555f-0cb5-233b-2c2c8f9fc0c5	3205	Vitanje
00050000-555f-0cb5-ed1c-4663effaec5e	2255	Vitomarci
00050000-555f-0cb5-51f5-4632bb874868	1217	Vodice
00050000-555f-0cb5-e0e5-81a3ff29607e	3212	Vojnik\t
00050000-555f-0cb5-1d2f-68965ba2d955	5293	Volčja Draga
00050000-555f-0cb5-70a6-51e26778456e	2232	Voličina
00050000-555f-0cb5-e8c2-76929de80fe2	3305	Vransko
00050000-555f-0cb5-fc54-ed05986d3d04	6217	Vremski Britof
00050000-555f-0cb5-342a-6e06bc3478f1	1360	Vrhnika
00050000-555f-0cb5-ffb1-4804a08b3b25	2365	Vuhred
00050000-555f-0cb5-8836-1db06eab2392	2367	Vuzenica
00050000-555f-0cb5-562b-a9dee8230b32	8292	Zabukovje 
00050000-555f-0cb5-d3b8-476ad5dfa465	1410	Zagorje ob Savi
00050000-555f-0cb5-4d75-c24505f8226a	1303	Zagradec
00050000-555f-0cb5-d653-a097ffcbe090	2283	Zavrč
00050000-555f-0cb5-c6b7-d55a35bc64a9	8272	Zdole 
00050000-555f-0cb5-afb8-7621a2363e70	4201	Zgornja Besnica
00050000-555f-0cb5-2c23-065bbe8e5309	2242	Zgornja Korena
00050000-555f-0cb5-c812-77f494c0700b	2201	Zgornja Kungota
00050000-555f-0cb5-2521-4393f40ba71e	2316	Zgornja Ložnica
00050000-555f-0cb5-1e7c-64ded4971254	2314	Zgornja Polskava
00050000-555f-0cb5-1f6b-3c2d5c13006c	2213	Zgornja Velka
00050000-555f-0cb5-cc0d-4ed04d76a88d	4247	Zgornje Gorje
00050000-555f-0cb5-99f7-191f50f5f32b	4206	Zgornje Jezersko
00050000-555f-0cb5-b8e1-d2c1dd6b034e	2285	Zgornji Leskovec
00050000-555f-0cb5-be69-e5049e500860	1432	Zidani Most
00050000-555f-0cb5-705e-9dce6f6c0f28	3214	Zreče
00050000-555f-0cb5-281a-a08ec359bb57	4209	Žabnica
00050000-555f-0cb5-65ee-3399220f76ac	3310	Žalec
00050000-555f-0cb5-80a6-42eafe732ee1	4228	Železniki
00050000-555f-0cb5-2899-1afd14797c0e	2287	Žetale
00050000-555f-0cb5-791e-b72c75c96883	4226	Žiri
00050000-555f-0cb5-84a4-f852e3430fb1	4274	Žirovnica
00050000-555f-0cb5-477e-74449bc96a65	8360	Žužemberk
\.


--
-- TOC entry 2657 (class 0 OID 4683648)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4683476)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4683541)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 4683660)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4683766)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4683810)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4683689)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 4683633)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 4683623)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4683800)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4683756)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2628 (class 0 OID 4683344)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555f-0cb5-060e-865f40824af3	00010000-555f-0cb5-f57b-9ba2ac21c599	2015-05-22 13:02:14	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROchol2qvoPY0C.JxF.pWsfVrarAbAJNS";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2664 (class 0 OID 4683698)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 4683382)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555f-0cb5-0b32-bab4bc98c3cc	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555f-0cb5-c192-da666cc1cd46	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555f-0cb5-a204-2c2ffa82010b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555f-0cb5-1438-d38244d23634	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555f-0cb5-407a-4a87e9401486	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555f-0cb5-3faa-f3573c3cbff6	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2630 (class 0 OID 4683366)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555f-0cb5-060e-865f40824af3	00020000-555f-0cb5-1438-d38244d23634
00010000-555f-0cb5-f57b-9ba2ac21c599	00020000-555f-0cb5-1438-d38244d23634
\.


--
-- TOC entry 2666 (class 0 OID 4683712)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4683654)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4683604)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4683441)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4683610)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4683789)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, imezenski, podrocje) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4683510)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4683353)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555f-0cb5-f57b-9ba2ac21c599	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO57uIyAaU42OgV5265nPMRz/a6CT7kTu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555f-0cb5-060e-865f40824af3	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2678 (class 0 OID 4683842)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4683556)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 4683681)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4683748)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4683588)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4683832)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4683738)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4683407)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 4683883)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 4683876)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4683788)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4683578)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4683603)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4683536)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4683734)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4683554)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4683597)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2245 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 4683646)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4683673)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4683508)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4683416)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4683473)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4683439)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4683396)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4683381)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4683679)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4683711)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4683827)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4683466)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4683496)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4683652)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 4683486)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4683545)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4683664)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4683772)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4683815)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4683696)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4683637)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4683628)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4683809)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4683763)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4683352)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4683702)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4683370)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4683390)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4683720)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4683659)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4683609)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4683446)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4683619)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4683799)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4683521)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4683365)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 4683857)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4683563)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4683687)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4683754)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4683592)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4683841)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4683747)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4683585)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4683468)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2247 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2248 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2249 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2373 (class 1259 OID 4683680)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4683666)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4683665)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4683564)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4683737)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4683735)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4683736)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4683829)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4683830)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4683831)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4683861)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4683858)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2429 (class 1259 OID 4683860)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2430 (class 1259 OID 4683859)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4683523)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4683522)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4683475)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4683474)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4683703)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4683598)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4683397)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4683398)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4683723)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4683722)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4683721)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4683546)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4683548)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4683547)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4683632)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4683630)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4683629)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4683631)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4683371)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4683372)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4683688)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4683653)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4683764)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4683765)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4683488)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4683487)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4683489)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4683773)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4683774)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2439 (class 1259 OID 4683886)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2440 (class 1259 OID 4683885)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2441 (class 1259 OID 4683888)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2442 (class 1259 OID 4683884)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2443 (class 1259 OID 4683887)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4683755)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4683641)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4683640)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4683638)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4683639)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2435 (class 1259 OID 4683878)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 4683877)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4683555)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4683418)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4683417)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4683447)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4683448)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4683622)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4683621)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4683620)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4683587)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4683583)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4683580)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4683581)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4683579)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4683584)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4683582)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4683467)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4683537)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4683539)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4683538)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4683540)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4683647)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4683828)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4683440)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4683509)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4683697)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4683497)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4683816)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4683391)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4683586)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2468 (class 2606 OID 4684019)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2471 (class 2606 OID 4684004)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2470 (class 2606 OID 4684009)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2466 (class 2606 OID 4684029)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2472 (class 2606 OID 4683999)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2467 (class 2606 OID 4684024)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2469 (class 2606 OID 4684014)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2453 (class 2606 OID 4683934)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2489 (class 2606 OID 4684114)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 4684109)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2488 (class 2606 OID 4684104)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2465 (class 2606 OID 4683994)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4684154)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2497 (class 2606 OID 4684144)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2496 (class 2606 OID 4684149)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2485 (class 2606 OID 4684094)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2506 (class 2606 OID 4684189)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2505 (class 2606 OID 4684194)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2504 (class 2606 OID 4684199)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2507 (class 2606 OID 4684219)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2510 (class 2606 OID 4684204)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2508 (class 2606 OID 4684214)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2509 (class 2606 OID 4684209)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2459 (class 2606 OID 4683969)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2460 (class 2606 OID 4683964)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 4683944)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 4683939)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2450 (class 2606 OID 4683919)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2491 (class 2606 OID 4684124)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2473 (class 2606 OID 4684034)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2447 (class 2606 OID 4683899)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2446 (class 2606 OID 4683904)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2492 (class 2606 OID 4684139)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2493 (class 2606 OID 4684134)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2494 (class 2606 OID 4684129)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2463 (class 2606 OID 4683974)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2461 (class 2606 OID 4683984)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2462 (class 2606 OID 4683979)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2477 (class 2606 OID 4684069)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2479 (class 2606 OID 4684059)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2480 (class 2606 OID 4684054)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2478 (class 2606 OID 4684064)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2445 (class 2606 OID 4683889)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2444 (class 2606 OID 4683894)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2490 (class 2606 OID 4684119)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2486 (class 2606 OID 4684099)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2500 (class 2606 OID 4684164)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2499 (class 2606 OID 4684169)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2457 (class 2606 OID 4683954)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 4683949)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2456 (class 2606 OID 4683959)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4684174)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2501 (class 2606 OID 4684179)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2515 (class 2606 OID 4684244)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 4684239)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2513 (class 2606 OID 4684254)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2517 (class 2606 OID 4684234)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2514 (class 2606 OID 4684249)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2498 (class 2606 OID 4684159)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2481 (class 2606 OID 4684089)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2482 (class 2606 OID 4684084)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2484 (class 2606 OID 4684074)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2483 (class 2606 OID 4684079)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2511 (class 2606 OID 4684229)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2512 (class 2606 OID 4684224)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2464 (class 2606 OID 4683989)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2503 (class 2606 OID 4684184)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2448 (class 2606 OID 4683914)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2449 (class 2606 OID 4683909)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2452 (class 2606 OID 4683924)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2451 (class 2606 OID 4683929)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2474 (class 2606 OID 4684049)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2475 (class 2606 OID 4684044)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2476 (class 2606 OID 4684039)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-22 13:02:14 CEST

--
-- PostgreSQL database dump complete
--

