--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-21 13:02:57 CEST

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
-- TOC entry 2685 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 4430586)
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
-- TOC entry 225 (class 1259 OID 4431065)
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
-- TOC entry 224 (class 1259 OID 4431048)
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
-- TOC entry 217 (class 1259 OID 4430961)
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
-- TOC entry 193 (class 1259 OID 4430752)
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
-- TOC entry 196 (class 1259 OID 4430786)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4430711)
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
-- TOC entry 212 (class 1259 OID 4430911)
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
-- TOC entry 191 (class 1259 OID 4430736)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4430780)
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
-- TOC entry 201 (class 1259 OID 4430829)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4430854)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4430685)
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
-- TOC entry 180 (class 1259 OID 4430595)
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
-- TOC entry 181 (class 1259 OID 4430606)
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
-- TOC entry 184 (class 1259 OID 4430656)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4430560)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4430579)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4430861)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4430891)
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
-- TOC entry 221 (class 1259 OID 4431004)
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
-- TOC entry 183 (class 1259 OID 4430636)
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
-- TOC entry 186 (class 1259 OID 4430677)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4430835)
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
-- TOC entry 185 (class 1259 OID 4430663)
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
-- TOC entry 190 (class 1259 OID 4430728)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4430847)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4430952)
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
-- TOC entry 220 (class 1259 OID 4430997)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4430876)
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
-- TOC entry 200 (class 1259 OID 4430820)
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
-- TOC entry 199 (class 1259 OID 4430810)
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
-- TOC entry 219 (class 1259 OID 4430987)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4430942)
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
-- TOC entry 173 (class 1259 OID 4430531)
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
-- TOC entry 172 (class 1259 OID 4430529)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2686 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 4430885)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4430569)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4430553)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4430899)
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
-- TOC entry 203 (class 1259 OID 4430841)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4430791)
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
-- TOC entry 182 (class 1259 OID 4430628)
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
-- TOC entry 198 (class 1259 OID 4430797)
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
-- TOC entry 218 (class 1259 OID 4430975)
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
-- TOC entry 188 (class 1259 OID 4430697)
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
-- TOC entry 174 (class 1259 OID 4430540)
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
-- TOC entry 223 (class 1259 OID 4431029)
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
-- TOC entry 192 (class 1259 OID 4430743)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4430868)
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
-- TOC entry 214 (class 1259 OID 4430934)
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
-- TOC entry 194 (class 1259 OID 4430775)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4431019)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4430924)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4430534)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2632 (class 0 OID 4430586)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4431065)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4431048)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4430961)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4430752)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4430786)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4430711)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555d-bb60-dbd2-85dd81134e87	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555d-bb60-7825-baad3083f5fd	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555d-bb60-4c71-e9ccb09041c7	AL	ALB	008	Albania 	Albanija	\N
00040000-555d-bb60-76dc-8c426b6a7af8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555d-bb60-a620-8b6e020040a7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555d-bb60-9643-794b234378e8	AD	AND	020	Andorra 	Andora	\N
00040000-555d-bb60-4043-ea68428334e7	AO	AGO	024	Angola 	Angola	\N
00040000-555d-bb60-8f81-c2bb8fa3d447	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555d-bb60-09b9-fb3ebee94ea5	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555d-bb60-5622-dd54c5984e2d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-bb60-068b-cf68da9e34b0	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555d-bb60-9607-cbff3e486445	AM	ARM	051	Armenia 	Armenija	\N
00040000-555d-bb60-3042-d9cec7972f2b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555d-bb60-5933-b9b9d99bb59e	AU	AUS	036	Australia 	Avstralija	\N
00040000-555d-bb60-93eb-b5916e51eba1	AT	AUT	040	Austria 	Avstrija	\N
00040000-555d-bb60-483e-5ac3f31dc14e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555d-bb60-9eae-eacb3be73e12	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555d-bb60-d71e-82e446e1dfee	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555d-bb60-c07a-027c1ef98bed	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555d-bb60-794a-02fafda9104e	BB	BRB	052	Barbados 	Barbados	\N
00040000-555d-bb60-f11d-98da5559ad27	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555d-bb60-0352-b18c473b3b47	BE	BEL	056	Belgium 	Belgija	\N
00040000-555d-bb60-cf39-ec8a17e5a21a	BZ	BLZ	084	Belize 	Belize	\N
00040000-555d-bb60-051a-22d8d0c0f316	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555d-bb60-2a60-e9587d39d168	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555d-bb60-d416-fa3a1706b1ac	BT	BTN	064	Bhutan 	Butan	\N
00040000-555d-bb60-f43d-144b2db4599a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555d-bb60-4489-67fdb6522fd4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555d-bb60-1a8f-8c245beab3b7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555d-bb60-cc59-684aec84e1fa	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555d-bb60-3262-c1fa5c2069c3	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555d-bb60-0656-1495f147dab2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555d-bb60-acd9-848fed6497c3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555d-bb60-0f6b-23fe2be0f9f5	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555d-bb60-7bf0-e96ec62aae79	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555d-bb60-a5ff-80081d12fe62	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555d-bb60-5031-c7a42d621eb8	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555d-bb60-76aa-78e7dd0b3514	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555d-bb60-bdb4-40a633073c64	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555d-bb60-928e-089d969aa88d	CA	CAN	124	Canada 	Kanada	\N
00040000-555d-bb60-f794-57d258f22b31	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555d-bb60-6e4f-382133d884d6	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555d-bb60-ea64-54993e574f47	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555d-bb60-3298-f2f6b2aaf702	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555d-bb60-7869-f4f4e48ded3e	CL	CHL	152	Chile 	Čile	\N
00040000-555d-bb60-c7b4-b92b373ebb35	CN	CHN	156	China 	Kitajska	\N
00040000-555d-bb60-6216-6eb310e867e6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555d-bb60-83ed-cff125603593	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555d-bb60-1f28-42499b0b22be	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555d-bb60-bdd3-7a3d911c1675	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555d-bb60-089b-046f46c66884	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555d-bb60-9c58-f753e2973e06	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555d-bb60-7526-fde9d1c631a4	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555d-bb60-b47e-efdf30288526	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555d-bb60-2c83-9296bafb42d5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555d-bb60-4869-3dccb9c8df3d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555d-bb60-ea67-9e516e0f0e2d	CU	CUB	192	Cuba 	Kuba	\N
00040000-555d-bb60-ee9a-cf2a9d0f0810	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555d-bb60-a4e6-6781dabcaa84	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555d-bb60-8130-6fae6776c805	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555d-bb60-aca4-058e1fdedd31	DK	DNK	208	Denmark 	Danska	\N
00040000-555d-bb60-8dc8-403c96b4181f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555d-bb60-dc27-15b024ef71be	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-bb60-1955-990f3067d4dd	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555d-bb60-5a9b-b31dabf063b1	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555d-bb60-b672-b91128898530	EG	EGY	818	Egypt 	Egipt	\N
00040000-555d-bb60-7adb-52edde2c39be	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555d-bb60-8793-4fd474b2bc69	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555d-bb60-a8cc-11f4556cdf36	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555d-bb60-dc0a-85cf6ed18625	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555d-bb60-25bc-9da22e90c344	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555d-bb60-553b-04b6978d9e1f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555d-bb60-bd81-8f91a8701fb4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555d-bb60-4fb5-a4409844c15a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555d-bb60-d542-d7204218422d	FI	FIN	246	Finland 	Finska	\N
00040000-555d-bb60-db4b-ce4a64888ec4	FR	FRA	250	France 	Francija	\N
00040000-555d-bb60-68fd-f65badcef810	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555d-bb60-5d8d-bfd4081bae58	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555d-bb60-116e-f8289419ddce	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555d-bb60-81de-7692e3342daa	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555d-bb60-dedf-cf45adb28689	GA	GAB	266	Gabon 	Gabon	\N
00040000-555d-bb60-eb26-5cefbd35631d	GM	GMB	270	Gambia 	Gambija	\N
00040000-555d-bb60-84ff-8424d3e4fd23	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555d-bb60-9025-d110833b4138	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555d-bb60-3f74-dd2595bef7c8	GH	GHA	288	Ghana 	Gana	\N
00040000-555d-bb60-5697-adbc163fc7cd	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555d-bb60-94f6-bb9e60941fe2	GR	GRC	300	Greece 	Grčija	\N
00040000-555d-bb60-7499-e943148a9437	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555d-bb60-6123-54ec8e00b34c	GD	GRD	308	Grenada 	Grenada	\N
00040000-555d-bb60-fec5-63b86e5ed673	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555d-bb60-ad96-5f39f516208c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555d-bb60-0abb-a9aae01c2b20	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555d-bb60-958b-a5b04fa3511f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555d-bb60-75aa-f466ccf98480	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555d-bb60-097d-a323509aac79	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555d-bb60-e868-3736516d74cc	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555d-bb60-1553-27e1bce6bb9c	HT	HTI	332	Haiti 	Haiti	\N
00040000-555d-bb60-f213-7faa3b8f1f53	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555d-bb60-be58-bc3f6d74e931	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555d-bb60-6bb8-dbd76892b66d	HN	HND	340	Honduras 	Honduras	\N
00040000-555d-bb60-b81c-c2a78daa0c41	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555d-bb60-78ff-6ec9f5f2a527	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555d-bb60-8dcc-9c3cc36e22e1	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555d-bb60-199e-02dddefc0d50	IN	IND	356	India 	Indija	\N
00040000-555d-bb60-be99-64300ed2766d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555d-bb60-03ea-ac0e0ce8fd79	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555d-bb60-a1c5-29101998e673	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555d-bb60-d0c6-b959caa9a1a2	IE	IRL	372	Ireland 	Irska	\N
00040000-555d-bb60-6860-6dfe31826e8e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555d-bb60-7301-578680ed25bd	IL	ISR	376	Israel 	Izrael	\N
00040000-555d-bb60-3519-c75fd01923a1	IT	ITA	380	Italy 	Italija	\N
00040000-555d-bb60-0f4b-518a4283fc66	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555d-bb60-bd6c-a9c83b5ea93b	JP	JPN	392	Japan 	Japonska	\N
00040000-555d-bb60-1824-b93e63da47d0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555d-bb60-2918-64f926bc491d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555d-bb60-caa7-90792586baaa	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555d-bb60-dfc0-b14513296a3e	KE	KEN	404	Kenya 	Kenija	\N
00040000-555d-bb60-8555-09bfdc5dcba6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555d-bb60-54c9-f4f6f91fd257	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555d-bb60-0f43-09780dbdcd64	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555d-bb60-0cbe-a705772f7a23	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555d-bb60-42ea-6cf21cbc110b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555d-bb60-c601-28af7ab791e9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555d-bb60-7077-1554c9be4d21	LV	LVA	428	Latvia 	Latvija	\N
00040000-555d-bb60-c16b-cbfeb3290a67	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555d-bb60-9122-d966697126c5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555d-bb60-2e59-fca616805ce7	LR	LBR	430	Liberia 	Liberija	\N
00040000-555d-bb60-159c-70e01d6c21ed	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555d-bb60-bec1-edcf4d35ab4c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555d-bb60-a559-11bcea7c38d9	LT	LTU	440	Lithuania 	Litva	\N
00040000-555d-bb60-106b-109473678f65	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555d-bb60-fe85-8f252568796f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555d-bb60-f5aa-b3994688b30c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555d-bb60-389b-010b7300160e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555d-bb60-32b1-a1c56200fa9b	MW	MWI	454	Malawi 	Malavi	\N
00040000-555d-bb60-2a1b-368454e68c18	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555d-bb60-e463-bfa6a4595f4a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555d-bb60-b8d5-0fc1e27d6e0b	ML	MLI	466	Mali 	Mali	\N
00040000-555d-bb60-7ffa-e133732dfc69	MT	MLT	470	Malta 	Malta	\N
00040000-555d-bb60-2db5-15cf90c7f4c6	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555d-bb60-0377-e098965fad34	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555d-bb60-338b-58f70ba95c74	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555d-bb60-625d-aff06b402d0b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555d-bb60-8b2f-66e9fccc545c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555d-bb60-fcff-45138b316f7a	MX	MEX	484	Mexico 	Mehika	\N
00040000-555d-bb60-35ac-8835a1f83675	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555d-bb60-057f-5720ab8f444d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555d-bb60-70ed-c8477df9b630	MC	MCO	492	Monaco 	Monako	\N
00040000-555d-bb60-0484-7427e1fa2d4c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555d-bb60-da7e-b973aa9c3ae8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555d-bb60-e97e-ab61dd23ed50	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555d-bb60-b734-5c6bbc20c020	MA	MAR	504	Morocco 	Maroko	\N
00040000-555d-bb60-5982-1ad9d646e5ae	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555d-bb60-f4dd-954592b1413d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555d-bb60-1d58-b51bb18f158d	NA	NAM	516	Namibia 	Namibija	\N
00040000-555d-bb60-72dd-8b0cf700ebf8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555d-bb60-8534-f830598fa088	NP	NPL	524	Nepal 	Nepal	\N
00040000-555d-bb60-ea66-6c22d13e7043	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555d-bb60-b9dc-99bbe85f3fe2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555d-bb60-8f3b-43da6d839842	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555d-bb60-f0b7-b7bec2aefe1a	NE	NER	562	Niger 	Niger 	\N
00040000-555d-bb60-3128-0d021af64b99	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555d-bb60-c81f-b8c3ace5edc2	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555d-bb60-4e1e-2a853b3ffee8	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555d-bb60-8730-05f57149a32c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555d-bb60-e4f6-13eafa923f63	NO	NOR	578	Norway 	Norveška	\N
00040000-555d-bb60-7245-48511ecd8527	OM	OMN	512	Oman 	Oman	\N
00040000-555d-bb60-edd0-b1c89971fb3c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555d-bb60-9266-a535ecd7abd5	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555d-bb60-5052-5c9e9c55fda4	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555d-bb60-b853-97f88b7b17a6	PA	PAN	591	Panama 	Panama	\N
00040000-555d-bb60-d9ba-1741519690b7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555d-bb60-e9c6-405eed4b0bfd	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555d-bb60-adbf-015142df7e74	PE	PER	604	Peru 	Peru	\N
00040000-555d-bb60-2c12-abef5a29f677	PH	PHL	608	Philippines 	Filipini	\N
00040000-555d-bb60-ccce-33a3abcff1c4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555d-bb60-9874-a4f28a750949	PL	POL	616	Poland 	Poljska	\N
00040000-555d-bb60-8795-bdf182035d35	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555d-bb60-8330-d74aa9bcb2b6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555d-bb60-99e1-a00acf482dfe	QA	QAT	634	Qatar 	Katar	\N
00040000-555d-bb60-6e3d-8803eaac4096	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555d-bb60-d1d2-2df0a1ec2124	RO	ROU	642	Romania 	Romunija	\N
00040000-555d-bb60-6ac3-fc81ed19169e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555d-bb60-9281-abb9ca3a0624	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555d-bb60-0954-bac87a5805e3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555d-bb60-b952-4233f51edf3f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555d-bb60-07e8-ca67dd61284c	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555d-bb60-9ba1-57aa573cf7f7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555d-bb60-2540-a024178dc2b1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555d-bb60-7042-6d25bc79e168	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555d-bb60-1db0-d061d5b04580	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555d-bb60-b800-5ccc0b86b123	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555d-bb60-7515-645e77fb132c	SM	SMR	674	San Marino 	San Marino	\N
00040000-555d-bb60-526a-9a31c60e08c0	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555d-bb60-ef5e-2723a0c9794f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555d-bb60-0491-d591899f6bdb	SN	SEN	686	Senegal 	Senegal	\N
00040000-555d-bb60-a031-58d7cdbd6e08	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555d-bb60-3958-35434b3c7eac	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555d-bb60-aa58-f5f7ba445b59	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555d-bb60-8ff7-e36ce6f40950	SG	SGP	702	Singapore 	Singapur	\N
00040000-555d-bb60-d0e5-14dc39aa0802	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555d-bb60-cb83-9d55b3d69644	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555d-bb60-d18a-c66cacddb1a8	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555d-bb60-02ba-c915ca0636d1	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555d-bb60-d4f6-a1ddd393458f	SO	SOM	706	Somalia 	Somalija	\N
00040000-555d-bb60-dc69-07b0c438f723	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555d-bb60-3efe-ecd325f8fe3f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555d-bb60-98e9-316a67794e34	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555d-bb60-52d4-77ba4b3feb1d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555d-bb60-1f4f-74b981f6e2a0	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555d-bb60-5df2-f532944916e0	SD	SDN	729	Sudan 	Sudan	\N
00040000-555d-bb60-c57a-18baa9a1e85f	SR	SUR	740	Suriname 	Surinam	\N
00040000-555d-bb60-e033-42edaae85c19	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555d-bb60-dcbb-7ba74d968fa3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555d-bb60-7b7f-0eab4875e3d8	SE	SWE	752	Sweden 	Švedska	\N
00040000-555d-bb60-3a8c-e262d4701101	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555d-bb60-d7cc-68b4138102f6	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555d-bb60-2ba7-af924ddb26bb	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555d-bb60-eba9-477aed7c7aa1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555d-bb60-173b-00cefa6098d4	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555d-bb60-aaca-81362f48d35c	TH	THA	764	Thailand 	Tajska	\N
00040000-555d-bb60-d0e1-50362ef5c44c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555d-bb60-e96a-bd9cca9d86cf	TG	TGO	768	Togo 	Togo	\N
00040000-555d-bb60-0d26-5e71dbee4455	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555d-bb60-8b6e-46342c331132	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555d-bb60-f617-706b779c1a40	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555d-bb60-2829-5e6f8eb2caae	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555d-bb60-bf39-80d92262c053	TR	TUR	792	Turkey 	Turčija	\N
00040000-555d-bb60-52c9-0f733af446e1	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555d-bb60-b18a-98246b621bb8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-bb60-a2fc-ff6be07ae20b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555d-bb60-e1ef-ea44d9de7d79	UG	UGA	800	Uganda 	Uganda	\N
00040000-555d-bb60-9bd4-196f3fd9f63f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555d-bb60-41c2-792c13e5acfd	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555d-bb60-86e2-a54cf8b10931	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555d-bb60-98df-6fa427eb8e11	US	USA	840	United States 	Združene države Amerike	\N
00040000-555d-bb60-2082-ff6dc8becde6	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555d-bb60-9a60-ae7d255fa5de	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555d-bb60-07b7-2ba3b9571788	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555d-bb60-6e5f-f72814e2d62b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555d-bb60-da6b-0d491cc41177	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555d-bb60-9dc0-55780f652664	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555d-bb60-1df4-a6b89f32b330	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-bb60-ee94-e4b871cf7260	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555d-bb60-8610-4db881e3f831	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555d-bb60-1032-5589f4e64be8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555d-bb60-0f4b-adf4f0864076	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555d-bb60-5c15-8acbc80b6859	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555d-bb60-6295-51a742ebe6c8	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2665 (class 0 OID 4430911)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4430736)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4430780)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2623 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 4430829)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4430854)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4430685)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555d-bb61-6d55-ef815e8e0860	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555d-bb61-533d-b3082e9c63f3	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555d-bb61-a02d-a9e455e2d241	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555d-bb61-9c50-e1b31b841a39	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555d-bb61-3ece-b5c204e24ad2	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555d-bb61-a61b-6d1aaae04e1f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555d-bb61-c6ff-934dfaca2a57	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555d-bb61-eb59-44d9e9d57919	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555d-bb61-67de-a640cb5a59ee	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555d-bb61-330b-c33dc6ce26cc	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555d-bb61-15c2-d2cff2e61319	uprizoritev.faza	array	a:5:{s:7:"osnutek";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:4:"plan";a:1:{s:5:"label";s:14:"Predprodukcija";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
\.


--
-- TOC entry 2633 (class 0 OID 4430595)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555d-bb61-72f9-88c76c738419	00000000-555d-bb61-3ece-b5c204e24ad2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555d-bb61-a22c-99434e24c9b8	00000000-555d-bb61-3ece-b5c204e24ad2	00010000-555d-bb61-9d47-987a215efcff	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555d-bb61-00a8-e83e3d81897c	00000000-555d-bb61-a61b-6d1aaae04e1f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2634 (class 0 OID 4430606)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4430656)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4430560)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555d-bb61-af19-805815e791b9	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555d-bb61-033a-4ed90c70eb3b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555d-bb61-f057-60bace6ba744	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555d-bb61-b55f-79487930e1d9	Abonma-read	Abonma - branje	f
00030000-555d-bb61-0338-ea7a2551be39	Abonma-write	Abonma - spreminjanje	f
00030000-555d-bb61-ae15-39118db2db5d	Alternacija-read	Alternacija - branje	f
00030000-555d-bb61-56c5-5ef05ef643e0	Alternacija-write	Alternacija - spreminjanje	f
00030000-555d-bb61-5931-85f25739e65e	Arhivalija-read	Arhivalija - branje	f
00030000-555d-bb61-91fa-cf1efab65801	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555d-bb61-b163-465bdf255fd6	Besedilo-read	Besedilo - branje	f
00030000-555d-bb61-e6fb-991810f4c98d	Besedilo-write	Besedilo - spreminjanje	f
00030000-555d-bb61-06eb-3863936a893d	DogodekIzven-read	DogodekIzven - branje	f
00030000-555d-bb61-e987-9b455ee45df2	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555d-bb61-b8a0-fd309fe0fb78	Dogodek-read	Dogodek - branje	f
00030000-555d-bb61-affe-70b9c66e36cd	Dogodek-write	Dogodek - spreminjanje	f
00030000-555d-bb61-237e-ed709b42ca81	Drzava-read	Drzava - branje	f
00030000-555d-bb61-5045-d0d45a7ecc6a	Drzava-write	Drzava - spreminjanje	f
00030000-555d-bb61-7c1e-3aa66d343f96	Funkcija-read	Funkcija - branje	f
00030000-555d-bb61-f9c6-95fdc3c76433	Funkcija-write	Funkcija - spreminjanje	f
00030000-555d-bb61-073d-9212b571c8bf	Gostovanje-read	Gostovanje - branje	f
00030000-555d-bb61-9930-a4ddb18f4439	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555d-bb61-15ed-6aae78ec1cc8	Gostujoca-read	Gostujoca - branje	f
00030000-555d-bb61-8c0e-bb6c0d3f88ee	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555d-bb61-ddfd-235e0b80517c	Kupec-read	Kupec - branje	f
00030000-555d-bb61-f846-774a1d6b7710	Kupec-write	Kupec - spreminjanje	f
00030000-555d-bb61-1ec0-5e8d4deb726f	NacinPlacina-read	NacinPlacina - branje	f
00030000-555d-bb61-6011-06e044e47e80	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555d-bb61-1cff-b3a284ebdf0b	Option-read	Option - branje	f
00030000-555d-bb61-761b-d6cc65110627	Option-write	Option - spreminjanje	f
00030000-555d-bb61-ce46-29865466df92	OptionValue-read	OptionValue - branje	f
00030000-555d-bb61-c2b4-52c5d018ed3b	OptionValue-write	OptionValue - spreminjanje	f
00030000-555d-bb61-b041-b3edb6f1ffe8	Oseba-read	Oseba - branje	f
00030000-555d-bb61-ba23-9f69b4aabc62	Oseba-write	Oseba - spreminjanje	f
00030000-555d-bb61-da8b-c156fef1121a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555d-bb61-0db6-32ba592d288d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555d-bb61-acc2-e4902003db2b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555d-bb61-86ca-3667d9ec3136	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555d-bb61-d324-ae1a344c5da4	Pogodba-read	Pogodba - branje	f
00030000-555d-bb61-a712-084492e66bf7	Pogodba-write	Pogodba - spreminjanje	f
00030000-555d-bb61-96e8-05f6c7654af5	Popa-read	Popa - branje	f
00030000-555d-bb61-af60-2b8f7b59405a	Popa-write	Popa - spreminjanje	f
00030000-555d-bb61-9000-dc49e9254daf	Posta-read	Posta - branje	f
00030000-555d-bb61-75c6-495dff8675b6	Posta-write	Posta - spreminjanje	f
00030000-555d-bb61-26a7-451e885b4383	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555d-bb61-a4f4-998f30ce3e6a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555d-bb61-1f11-ff6e092cea03	PostniNaslov-read	PostniNaslov - branje	f
00030000-555d-bb61-9da5-9177e54a2f17	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555d-bb61-4418-02b301240051	Predstava-read	Predstava - branje	f
00030000-555d-bb61-6dca-a46724ae3212	Predstava-write	Predstava - spreminjanje	f
00030000-555d-bb61-6aa2-adefcc3ff475	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555d-bb61-79ed-131ba576e8f7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555d-bb61-acfc-7055ea8a0d67	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555d-bb61-edc0-cd90607b3bbf	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555d-bb61-b4d2-4a959eb739a1	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555d-bb61-5743-0435910970c0	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555d-bb61-f8b4-bdab0553fc63	Prostor-read	Prostor - branje	f
00030000-555d-bb61-8614-226cf3190016	Prostor-write	Prostor - spreminjanje	f
00030000-555d-bb61-07bb-1974acd82112	Racun-read	Racun - branje	f
00030000-555d-bb61-2c68-fd5852c3d474	Racun-write	Racun - spreminjanje	f
00030000-555d-bb61-0ac0-c3553f6b5eec	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555d-bb61-9411-3c7d09238b28	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555d-bb61-97eb-8b4fa6fc73ae	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555d-bb61-6b22-1303499b1faf	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555d-bb61-798e-c0ef46b39f2f	Rekvizit-read	Rekvizit - branje	f
00030000-555d-bb61-e0ea-a9c89604cb35	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555d-bb61-904e-9b6aee3d0f56	Rezervacija-read	Rezervacija - branje	f
00030000-555d-bb61-d729-73b886f954ec	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555d-bb61-aff2-0bf7c5bf15d7	SedezniRed-read	SedezniRed - branje	f
00030000-555d-bb61-5e77-7220adcdd91e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555d-bb61-c155-db888c0dcf60	Sedez-read	Sedez - branje	f
00030000-555d-bb61-74d8-c9f033a4029e	Sedez-write	Sedez - spreminjanje	f
00030000-555d-bb61-dc98-bc5266181a35	Sezona-read	Sezona - branje	f
00030000-555d-bb61-26f6-c5604250d37e	Sezona-write	Sezona - spreminjanje	f
00030000-555d-bb61-48b0-b19e3b6b117c	Telefonska-read	Telefonska - branje	f
00030000-555d-bb61-8105-bac7dde58b4c	Telefonska-write	Telefonska - spreminjanje	f
00030000-555d-bb61-b3e0-3d0f135bc84e	TerminStoritve-read	TerminStoritve - branje	f
00030000-555d-bb61-17f9-c178d6f44ba4	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555d-bb61-c8d9-85706d5f1358	TipFunkcije-read	TipFunkcije - branje	f
00030000-555d-bb61-1735-f1f7b4029146	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555d-bb61-dde8-758a7ce460e0	Trr-read	Trr - branje	f
00030000-555d-bb61-a65d-8d1ceb154abc	Trr-write	Trr - spreminjanje	f
00030000-555d-bb61-e385-0aa1e16acb3d	Uprizoritev-read	Uprizoritev - branje	f
00030000-555d-bb61-8c81-fdc6ecdd1827	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555d-bb61-2876-26e8513cd253	Vaja-read	Vaja - branje	f
00030000-555d-bb61-f5d6-50b5d194364b	Vaja-write	Vaja - spreminjanje	f
00030000-555d-bb61-b965-212c187f08dd	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555d-bb61-a9de-98e444812495	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555d-bb61-3472-8b5b5d0638cb	Zaposlitev-read	Zaposlitev - branje	f
00030000-555d-bb61-b2f8-a764f22c5dc2	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555d-bb61-2926-afc9a23edce4	Zasedenost-read	Zasedenost - branje	f
00030000-555d-bb61-3362-90c39ccfc713	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555d-bb61-1001-4bf971098cd6	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555d-bb61-cc80-50cccdcd9727	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555d-bb61-ad7b-9f04885840b4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555d-bb61-9b9d-8f5e07a4333b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2631 (class 0 OID 4430579)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555d-bb61-f785-bcfc45794fa4	00030000-555d-bb61-237e-ed709b42ca81
00020000-555d-bb61-ce1a-3ea5b3518ca9	00030000-555d-bb61-5045-d0d45a7ecc6a
00020000-555d-bb61-ce1a-3ea5b3518ca9	00030000-555d-bb61-237e-ed709b42ca81
\.


--
-- TOC entry 2659 (class 0 OID 4430861)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4430891)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4431004)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 4430636)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4430677)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555d-bb60-fae1-626e1701b075	8341	Adlešiči
00050000-555d-bb60-fad9-0260e7a7c4fe	5270	Ajdovščina
00050000-555d-bb60-760d-e2c62bba6044	6280	Ankaran/Ancarano
00050000-555d-bb60-b5d4-dab606cf8ed5	9253	Apače
00050000-555d-bb60-dfb1-b3dc1e70485f	8253	Artiče
00050000-555d-bb60-80a3-a0bd48693438	4275	Begunje na Gorenjskem
00050000-555d-bb60-6ad7-867738d04ba1	1382	Begunje pri Cerknici
00050000-555d-bb60-5e9f-d39c494d1e0f	9231	Beltinci
00050000-555d-bb60-eecc-6d79138337f4	2234	Benedikt
00050000-555d-bb60-8dd0-23e70b026243	2345	Bistrica ob Dravi
00050000-555d-bb60-e21e-f831c7806653	3256	Bistrica ob Sotli
00050000-555d-bb60-eb86-ce76f86e63a9	8259	Bizeljsko
00050000-555d-bb60-6df8-d1f8fdea17dc	1223	Blagovica
00050000-555d-bb60-8d0a-d0dbce7f20ed	8283	Blanca
00050000-555d-bb60-ceab-77216cc5ff24	4260	Bled
00050000-555d-bb60-c001-f34eeefe9ec9	4273	Blejska Dobrava
00050000-555d-bb60-7f62-c9f6262ddb93	9265	Bodonci
00050000-555d-bb60-9466-6902c90c7999	9222	Bogojina
00050000-555d-bb60-1479-abf0423e8582	4263	Bohinjska Bela
00050000-555d-bb60-2be6-410bcff30516	4264	Bohinjska Bistrica
00050000-555d-bb60-1d4f-da09234bddaa	4265	Bohinjsko jezero
00050000-555d-bb60-208d-ee135fa465a1	1353	Borovnica
00050000-555d-bb60-f7e5-0ee3acf9465a	8294	Boštanj
00050000-555d-bb60-37cb-c8e0ba56aa01	5230	Bovec
00050000-555d-bb60-45be-68b097567843	5295	Branik
00050000-555d-bb60-1fa1-bbc9c08c93e9	3314	Braslovče
00050000-555d-bb60-f75d-a0bf29e24bc1	5223	Breginj
00050000-555d-bb60-a1a7-464262b78e4e	8280	Brestanica
00050000-555d-bb60-b476-77e8d187307a	2354	Bresternica
00050000-555d-bb60-d949-881777792614	4243	Brezje
00050000-555d-bb60-03ee-77a4f91a3f42	1351	Brezovica pri Ljubljani
00050000-555d-bb60-fff4-4c489c774f10	8250	Brežice
00050000-555d-bb60-d361-532e7ae374b9	4210	Brnik - Aerodrom
00050000-555d-bb60-a5cd-3536117004c2	8321	Brusnice
00050000-555d-bb60-aed5-6bc9c7d145a7	3255	Buče
00050000-555d-bb60-3acd-19edb06a0991	8276	Bučka 
00050000-555d-bb60-0b9a-63b5205872ee	9261	Cankova
00050000-555d-bb60-e593-1b3a0dd59898	3000	Celje 
00050000-555d-bb60-3fd6-34fe29aba049	3001	Celje - poštni predali
00050000-555d-bb60-5d55-fa344c39c89f	4207	Cerklje na Gorenjskem
00050000-555d-bb60-2535-738966b9c9d3	8263	Cerklje ob Krki
00050000-555d-bb60-4c67-5c73941d68b7	1380	Cerknica
00050000-555d-bb60-3fc9-98ae32e5ef76	5282	Cerkno
00050000-555d-bb60-641c-c1da79cc3e59	2236	Cerkvenjak
00050000-555d-bb60-69be-e70ae06a94ad	2215	Ceršak
00050000-555d-bb60-83a7-bbaaaeb5d511	2326	Cirkovce
00050000-555d-bb60-581e-603ff01d18cb	2282	Cirkulane
00050000-555d-bb60-4106-c077eca98520	5273	Col
00050000-555d-bb60-35c3-6f773619b564	8251	Čatež ob Savi
00050000-555d-bb60-2365-0a144a430b80	1413	Čemšenik
00050000-555d-bb60-dfd6-f422211e3838	5253	Čepovan
00050000-555d-bb60-0016-ebd737ff0dd8	9232	Črenšovci
00050000-555d-bb60-2c87-f829f4cad377	2393	Črna na Koroškem
00050000-555d-bb60-8416-a4393cf63469	6275	Črni Kal
00050000-555d-bb60-eddf-28c69e94ef27	5274	Črni Vrh nad Idrijo
00050000-555d-bb60-dba3-b0e5ef563e36	5262	Črniče
00050000-555d-bb60-198a-3eea363f1d70	8340	Črnomelj
00050000-555d-bb60-f6fe-883655ef1e68	6271	Dekani
00050000-555d-bb60-9510-2fe73fd35a04	5210	Deskle
00050000-555d-bb60-2c6b-84861a3a9572	2253	Destrnik
00050000-555d-bb60-4b54-56e8e64e6f19	6215	Divača
00050000-555d-bb60-af91-f6eb187c9f05	1233	Dob
00050000-555d-bb60-cf04-b7178b6c7b9f	3224	Dobje pri Planini
00050000-555d-bb60-e4d4-5b2290cfc2ce	8257	Dobova
00050000-555d-bb60-6fd9-1a372b808343	1423	Dobovec
00050000-555d-bb60-62c8-9fc0bdc8a803	5263	Dobravlje
00050000-555d-bb60-336c-3688893490ba	3204	Dobrna
00050000-555d-bb60-a012-4fefc321fc01	8211	Dobrnič
00050000-555d-bb60-235f-63b41443d7e8	1356	Dobrova
00050000-555d-bb60-3eac-58257387aa53	9223	Dobrovnik/Dobronak 
00050000-555d-bb60-383b-99c8b92cb3a8	5212	Dobrovo v Brdih
00050000-555d-bb60-d70d-ef35e4b58583	1431	Dol pri Hrastniku
00050000-555d-bb60-acd8-c3ee8eff1810	1262	Dol pri Ljubljani
00050000-555d-bb60-4b4e-79393d7533ce	1273	Dole pri Litiji
00050000-555d-bb60-3f76-b1dd15e6ec45	1331	Dolenja vas
00050000-555d-bb60-1622-ea771e3e4e03	8350	Dolenjske Toplice
00050000-555d-bb60-accf-ea010242f370	1230	Domžale
00050000-555d-bb60-8809-be851730198c	2252	Dornava
00050000-555d-bb60-79fa-c414c732b613	5294	Dornberk
00050000-555d-bb60-90b8-98369ec15394	1319	Draga
00050000-555d-bb60-35e4-e18f413b1033	8343	Dragatuš
00050000-555d-bb60-266b-edcc20da967d	3222	Dramlje
00050000-555d-bb60-455b-7d281ab5585f	2370	Dravograd
00050000-555d-bb60-2fed-711363aac377	4203	Duplje
00050000-555d-bb60-8b27-69de19396cc8	6221	Dutovlje
00050000-555d-bb60-a084-ddf7fbe172b5	8361	Dvor
00050000-555d-bb60-b879-1a7a1f5bb4d9	2343	Fala
00050000-555d-bb60-3e49-f196ff755156	9208	Fokovci
00050000-555d-bb60-79ba-038e2cf26ab0	2313	Fram
00050000-555d-bb60-3d33-ea84a7e21380	3213	Frankolovo
00050000-555d-bb60-92c9-1a32d3108d65	1274	Gabrovka
00050000-555d-bb60-28e4-206ea3db694c	8254	Globoko
00050000-555d-bb60-5180-82d77fcdef49	5275	Godovič
00050000-555d-bb60-0d31-b3874c2c717c	4204	Golnik
00050000-555d-bb60-8102-b19cd5d06262	3303	Gomilsko
00050000-555d-bb60-447f-ecc8275820da	4224	Gorenja vas
00050000-555d-bb60-ce38-50660d0c88a6	3263	Gorica pri Slivnici
00050000-555d-bb60-ee34-ad9ecf9e41e7	2272	Gorišnica
00050000-555d-bb60-61d5-0346ff01e157	9250	Gornja Radgona
00050000-555d-bb60-7f49-64b3b5004a12	3342	Gornji Grad
00050000-555d-bb60-1acb-60b75a447e07	4282	Gozd Martuljek
00050000-555d-bb60-0e1f-38c07e42c630	6272	Gračišče
00050000-555d-bb60-b9a3-d7952862026d	9264	Grad
00050000-555d-bb60-2ffa-8aa6cef9048e	8332	Gradac
00050000-555d-bb60-55b3-87b2c3fd61b5	1384	Grahovo
00050000-555d-bb60-43f7-dd57b65107b6	5242	Grahovo ob Bači
00050000-555d-bb60-11dd-1fcf4160ec54	5251	Grgar
00050000-555d-bb60-9be9-fcc1f670aa06	3302	Griže
00050000-555d-bb60-45cc-f4f54836c381	3231	Grobelno
00050000-555d-bb60-f13a-ae9c0b64c693	1290	Grosuplje
00050000-555d-bb60-e05c-ca17f71eff0c	2288	Hajdina
00050000-555d-bb60-6cf0-f4c5de609e56	8362	Hinje
00050000-555d-bb60-02c9-9de0d624f1d4	2311	Hoče
00050000-555d-bb60-1357-1372f8a86b48	9205	Hodoš/Hodos
00050000-555d-bb60-6458-0e1646a762e9	1354	Horjul
00050000-555d-bb60-97b6-79beb7e79bbb	1372	Hotedršica
00050000-555d-bb60-4d06-160475674baf	1430	Hrastnik
00050000-555d-bb60-8e9a-0e6762459cc0	6225	Hruševje
00050000-555d-bb60-0293-55da966039af	4276	Hrušica
00050000-555d-bb60-b2aa-663224496b3c	5280	Idrija
00050000-555d-bb60-083f-89e643f68ae0	1292	Ig
00050000-555d-bb60-e588-05d3a5bbe3fe	6250	Ilirska Bistrica
00050000-555d-bb60-fef2-e19c8d063436	6251	Ilirska Bistrica-Trnovo
00050000-555d-bb60-8f71-8b44765ee296	1295	Ivančna Gorica
00050000-555d-bb60-9119-0642ef9ec5d9	2259	Ivanjkovci
00050000-555d-bb60-18f9-a1eca58032c3	1411	Izlake
00050000-555d-bb60-edb1-f662efe5a2ee	6310	Izola/Isola
00050000-555d-bb60-f001-13c91176a6d7	2222	Jakobski Dol
00050000-555d-bb60-4230-2ad25d12716b	2221	Jarenina
00050000-555d-bb60-488c-1f81956b089b	6254	Jelšane
00050000-555d-bb60-3f42-764f439ccd88	4270	Jesenice
00050000-555d-bb60-cf5b-d27fff7e5c6a	8261	Jesenice na Dolenjskem
00050000-555d-bb60-c1a7-4bc3348c108a	3273	Jurklošter
00050000-555d-bb60-cb4a-dedef8eff2d1	2223	Jurovski Dol
00050000-555d-bb60-0a62-eea6c56adc67	2256	Juršinci
00050000-555d-bb60-2657-af12a0dc09a7	5214	Kal nad Kanalom
00050000-555d-bb60-8854-258b04575b6e	3233	Kalobje
00050000-555d-bb60-86a5-f7e63dde4f70	4246	Kamna Gorica
00050000-555d-bb60-0718-9c3a746b66c8	2351	Kamnica
00050000-555d-bb60-ad2d-1a7fcac09e6c	1241	Kamnik
00050000-555d-bb60-0972-1bb50d62dc4e	5213	Kanal
00050000-555d-bb60-e22b-ff6f77bbeece	8258	Kapele
00050000-555d-bb60-7770-9c71f00cac80	2362	Kapla
00050000-555d-bb60-0e4a-4d0dec18d8c6	2325	Kidričevo
00050000-555d-bb60-01a3-813b6d96a9a6	1412	Kisovec
00050000-555d-bb60-6611-bbebd3c4b67d	6253	Knežak
00050000-555d-bb60-84d5-9e6ac1b9f4f2	5222	Kobarid
00050000-555d-bb60-a796-18a82ade3835	9227	Kobilje
00050000-555d-bb60-0be0-12e4b2b0d613	1330	Kočevje
00050000-555d-bb60-ad37-9087981d514a	1338	Kočevska Reka
00050000-555d-bb60-4d40-8e0ef5dc31fa	2276	Kog
00050000-555d-bb60-5926-580dd3fcb5a8	5211	Kojsko
00050000-555d-bb60-003f-95d2069229b7	6223	Komen
00050000-555d-bb60-b361-7e7187f13817	1218	Komenda
00050000-555d-bb60-44c0-9ec05907fdc6	6000	Koper/Capodistria 
00050000-555d-bb60-1998-1dd30d7f2a66	6001	Koper/Capodistria - poštni predali
00050000-555d-bb60-3ef8-110063933f64	8282	Koprivnica
00050000-555d-bb60-61f5-00719038c62c	5296	Kostanjevica na Krasu
00050000-555d-bb60-ef30-a5b5285deddb	8311	Kostanjevica na Krki
00050000-555d-bb60-8130-5fe27c9e8a24	1336	Kostel
00050000-555d-bb60-ac93-6ecfbbab3fb4	6256	Košana
00050000-555d-bb60-ea45-6bbe73b4da7f	2394	Kotlje
00050000-555d-bb60-292b-5e3d348e6971	6240	Kozina
00050000-555d-bb60-c350-9af77dae3ca6	3260	Kozje
00050000-555d-bb60-788a-904105b9c066	4000	Kranj 
00050000-555d-bb60-ae0d-bda28f962f20	4001	Kranj - poštni predali
00050000-555d-bb60-2204-a914cdf9e5fd	4280	Kranjska Gora
00050000-555d-bb60-539f-a1a7abf8f173	1281	Kresnice
00050000-555d-bb60-ee25-be8e9e6351a8	4294	Križe
00050000-555d-bb60-5fa7-3bddffdb41e4	9206	Križevci
00050000-555d-bb60-bcd9-1cd3d603406a	9242	Križevci pri Ljutomeru
00050000-555d-bb60-a344-025aed4a7995	1301	Krka
00050000-555d-bb60-4654-ddc3f414e307	8296	Krmelj
00050000-555d-bb60-d1ca-7c24cb38bfc0	4245	Kropa
00050000-555d-bb60-c401-dbce551f7f10	8262	Krška vas
00050000-555d-bb60-b080-38c6946c3870	8270	Krško
00050000-555d-bb60-26e4-4fec780cea4c	9263	Kuzma
00050000-555d-bb60-777f-cffb373198f7	2318	Laporje
00050000-555d-bb60-dac1-af45eda0957f	3270	Laško
00050000-555d-bb60-dde7-afcee5beb502	1219	Laze v Tuhinju
00050000-555d-bb60-13c4-4be81788dca3	2230	Lenart v Slovenskih goricah
00050000-555d-bb60-d0db-b7d688144433	9220	Lendava/Lendva
00050000-555d-bb60-2c0f-3ed825ecc7a8	4248	Lesce
00050000-555d-bb60-d5ff-023f4518f8c7	3261	Lesično
00050000-555d-bb60-697b-c809a7db07e7	8273	Leskovec pri Krškem
00050000-555d-bb60-b9a0-959fa8a6705b	2372	Libeliče
00050000-555d-bb60-8076-69acfa771027	2341	Limbuš
00050000-555d-bb60-7032-c4d917e98010	1270	Litija
00050000-555d-bb60-97d8-8833643e0a4c	3202	Ljubečna
00050000-555d-bb60-e077-5d1e9fb2e36d	1000	Ljubljana 
00050000-555d-bb60-76d9-34b62d7c8651	1001	Ljubljana - poštni predali
00050000-555d-bb60-2c50-1179bf55dee2	1231	Ljubljana - Črnuče
00050000-555d-bb60-581d-f3422079da39	1261	Ljubljana - Dobrunje
00050000-555d-bb60-7545-42bc4aa9b2f2	1260	Ljubljana - Polje
00050000-555d-bb60-a9d1-a6c02cdc1209	1210	Ljubljana - Šentvid
00050000-555d-bb60-c3ae-3559557e15bf	1211	Ljubljana - Šmartno
00050000-555d-bb60-8a48-2b30f4ced217	3333	Ljubno ob Savinji
00050000-555d-bb60-335a-6095fbcfe6e0	9240	Ljutomer
00050000-555d-bb60-2dee-e2627c00f4e1	3215	Loče
00050000-555d-bb60-bbf4-8ca061e852cc	5231	Log pod Mangartom
00050000-555d-bb60-3143-b00fbedac0e3	1358	Log pri Brezovici
00050000-555d-bb60-0b36-e2a58e4d6d31	1370	Logatec
00050000-555d-bb60-962f-1c1e7a49b5bc	1371	Logatec
00050000-555d-bb60-14bc-2d61365caf83	1434	Loka pri Zidanem Mostu
00050000-555d-bb60-a8c1-1090e7cd82d1	3223	Loka pri Žusmu
00050000-555d-bb60-56e5-9d3b3b6296f9	6219	Lokev
00050000-555d-bb60-d549-610a543088fa	1318	Loški Potok
00050000-555d-bb60-9a5d-6d7d91976867	2324	Lovrenc na Dravskem polju
00050000-555d-bb60-128d-726f0efa1417	2344	Lovrenc na Pohorju
00050000-555d-bb60-bb9e-ba005280c6f3	3334	Luče
00050000-555d-bb60-3df8-e647ebcd7ea6	1225	Lukovica
00050000-555d-bb60-2600-9d39ca572cd5	9202	Mačkovci
00050000-555d-bb60-43fa-c9f6ed6a7186	2322	Majšperk
00050000-555d-bb60-7c65-69e60b70403c	2321	Makole
00050000-555d-bb60-164f-477a55e5b0b5	9243	Mala Nedelja
00050000-555d-bb60-c1d8-815135ecc6e0	2229	Malečnik
00050000-555d-bb60-5c5d-211607ea8b5c	6273	Marezige
00050000-555d-bb60-d77c-b6c9334ff6d5	2000	Maribor 
00050000-555d-bb60-d3cf-f6bc0aad480e	2001	Maribor - poštni predali
00050000-555d-bb60-7597-810fb2e90fca	2206	Marjeta na Dravskem polju
00050000-555d-bb60-8150-fddf26e0d199	2281	Markovci
00050000-555d-bb60-8152-a1947700075b	9221	Martjanci
00050000-555d-bb60-3e09-bd8f396bc6cd	6242	Materija
00050000-555d-bb60-2e34-9b656259bf3d	4211	Mavčiče
00050000-555d-bb60-86ba-131b16c7b11d	1215	Medvode
00050000-555d-bb60-1175-381628d03fc7	1234	Mengeš
00050000-555d-bb60-bba3-3fb65a6f7144	8330	Metlika
00050000-555d-bb60-e5c2-088b20ed160f	2392	Mežica
00050000-555d-bb60-5d31-9fdbd2155e51	2204	Miklavž na Dravskem polju
00050000-555d-bb60-126e-0770f1e14cf4	2275	Miklavž pri Ormožu
00050000-555d-bb60-d323-7698fb7ceac5	5291	Miren
00050000-555d-bb60-6a6a-c825c152a8bf	8233	Mirna
00050000-555d-bb60-1b31-c98948af3d1b	8216	Mirna Peč
00050000-555d-bb60-83d3-9abb5686f5b5	2382	Mislinja
00050000-555d-bb60-b6a8-27802e855f26	4281	Mojstrana
00050000-555d-bb60-dc95-92a8ae039abf	8230	Mokronog
00050000-555d-bb60-c7c6-903b1ecca8d7	1251	Moravče
00050000-555d-bb60-426f-8fa8ed7d7a81	9226	Moravske Toplice
00050000-555d-bb60-4e00-65e30374b3ed	5216	Most na Soči
00050000-555d-bb60-1bf0-2a37353f455f	1221	Motnik
00050000-555d-bb60-16d9-9a1f3c90b804	3330	Mozirje
00050000-555d-bb60-1564-0e5a7c166365	9000	Murska Sobota 
00050000-555d-bb60-b426-57c57507483c	9001	Murska Sobota - poštni predali
00050000-555d-bb60-82b2-fd6243b029d1	2366	Muta
00050000-555d-bb60-df6b-6e2ae10e0b3b	4202	Naklo
00050000-555d-bb60-906a-aef34141abde	3331	Nazarje
00050000-555d-bb60-3917-ce56fdd302b4	1357	Notranje Gorice
00050000-555d-bb60-aa67-66b465fd5746	3203	Nova Cerkev
00050000-555d-bb60-8c24-d566f653cfad	5000	Nova Gorica 
00050000-555d-bb60-58ef-fdfd217bb1f0	5001	Nova Gorica - poštni predali
00050000-555d-bb60-bc6e-67bcc9292267	1385	Nova vas
00050000-555d-bb60-b859-d033c22e763e	8000	Novo mesto
00050000-555d-bb60-cd44-8753e6176e45	8001	Novo mesto - poštni predali
00050000-555d-bb60-5e99-eb7e2a9eabf2	6243	Obrov
00050000-555d-bb60-754f-093d7d672f9a	9233	Odranci
00050000-555d-bb60-7355-6da3c7dd7b35	2317	Oplotnica
00050000-555d-bb60-0654-8737a43544b9	2312	Orehova vas
00050000-555d-bb60-c1ca-c8ff412b82bc	2270	Ormož
00050000-555d-bb60-3ce8-7f32252cb75a	1316	Ortnek
00050000-555d-bb60-1159-05c52cfa0560	1337	Osilnica
00050000-555d-bb60-b1e2-efbb6edc6243	8222	Otočec
00050000-555d-bb60-8f39-a1a68ca40351	2361	Ožbalt
00050000-555d-bb60-8857-08117d559a49	2231	Pernica
00050000-555d-bb60-61c6-ad68478e44dd	2211	Pesnica pri Mariboru
00050000-555d-bb60-4226-624a732bcf87	9203	Petrovci
00050000-555d-bb60-3ce5-30f45f5e21f5	3301	Petrovče
00050000-555d-bb60-f6dc-085ee18d7fa9	6330	Piran/Pirano
00050000-555d-bb60-a8e9-133a789f819a	8255	Pišece
00050000-555d-bb60-c2c9-651730867406	6257	Pivka
00050000-555d-bb60-178e-ae328a1aff85	6232	Planina
00050000-555d-bb60-91d6-f722101a407f	3225	Planina pri Sevnici
00050000-555d-bb60-8e12-b9458fa3bf77	6276	Pobegi
00050000-555d-bb60-cedb-0a890fcf42ca	8312	Podbočje
00050000-555d-bb60-73ff-18353a4c27bb	5243	Podbrdo
00050000-555d-bb60-781b-0923525477f6	3254	Podčetrtek
00050000-555d-bb60-9d77-c7bef9277c1e	2273	Podgorci
00050000-555d-bb60-031d-4e31cd9f976f	6216	Podgorje
00050000-555d-bb60-d36d-6a310639a087	2381	Podgorje pri Slovenj Gradcu
00050000-555d-bb60-e6b3-b862448bcfce	6244	Podgrad
00050000-555d-bb60-2aa2-1917baf89465	1414	Podkum
00050000-555d-bb60-e954-640045d91a5f	2286	Podlehnik
00050000-555d-bb60-638a-9dffb7b22dfd	5272	Podnanos
00050000-555d-bb60-45a0-aceb980c87c4	4244	Podnart
00050000-555d-bb60-6262-8579eda7e6fc	3241	Podplat
00050000-555d-bb60-50d0-c860aabedab9	3257	Podsreda
00050000-555d-bb60-cd1d-0910521d6d0e	2363	Podvelka
00050000-555d-bb60-5f56-1bc015160b1e	2208	Pohorje
00050000-555d-bb60-bf0f-e89be185fc46	2257	Polenšak
00050000-555d-bb60-480a-db50c83293bd	1355	Polhov Gradec
00050000-555d-bb60-dad5-733f21342542	4223	Poljane nad Škofjo Loko
00050000-555d-bb60-5bcb-d32354ed115f	2319	Poljčane
00050000-555d-bb60-1e41-1769a002a024	1272	Polšnik
00050000-555d-bb60-035c-00decac7a1d6	3313	Polzela
00050000-555d-bb60-b7be-03082ffadae2	3232	Ponikva
00050000-555d-bb60-8712-4ecb6c400e89	6320	Portorož/Portorose
00050000-555d-bb60-d315-b9afe6d0fb94	6230	Postojna
00050000-555d-bb60-b5cf-9cdc081fe6f7	2331	Pragersko
00050000-555d-bb60-b53b-f5cc422c527c	3312	Prebold
00050000-555d-bb60-320d-74150f74256a	4205	Preddvor
00050000-555d-bb60-b9ec-2d5694e7ccc4	6255	Prem
00050000-555d-bb60-eadb-0f1bad54b349	1352	Preserje
00050000-555d-bb60-f432-90c12a799dd0	6258	Prestranek
00050000-555d-bb60-3415-c12257371398	2391	Prevalje
00050000-555d-bb60-8264-998f936f8788	3262	Prevorje
00050000-555d-bb60-add4-ea59cbf31ab2	1276	Primskovo 
00050000-555d-bb60-b16f-526e37f87499	3253	Pristava pri Mestinju
00050000-555d-bb60-9cf1-0b39868f9fc4	9207	Prosenjakovci/Partosfalva
00050000-555d-bb60-74b4-fb07012942fd	5297	Prvačina
00050000-555d-bb60-899f-818e876f2c4b	2250	Ptuj
00050000-555d-bb60-ab0d-0815ed768489	2323	Ptujska Gora
00050000-555d-bb60-9ddc-b0ec264de15f	9201	Puconci
00050000-555d-bb60-9e2c-4984b8151f88	2327	Rače
00050000-555d-bb60-63dd-da25ed2aae27	1433	Radeče
00050000-555d-bb60-f756-9121f31b9c8d	9252	Radenci
00050000-555d-bb60-3862-933a4ec2dbf2	2360	Radlje ob Dravi
00050000-555d-bb60-f47a-f642d669149f	1235	Radomlje
00050000-555d-bb60-5869-83d9815b7996	4240	Radovljica
00050000-555d-bb60-e33b-274808717c09	8274	Raka
00050000-555d-bb60-02d1-da89fd7d6fbe	1381	Rakek
00050000-555d-bb60-6571-fe48223d0191	4283	Rateče - Planica
00050000-555d-bb60-a298-f6f2a72e2ba4	2390	Ravne na Koroškem
00050000-555d-bb60-727e-f1abd533367a	9246	Razkrižje
00050000-555d-bb60-8915-b99d3907a531	3332	Rečica ob Savinji
00050000-555d-bb60-adea-6e9e2774e50d	5292	Renče
00050000-555d-bb60-9ab1-b71f908d1d5d	1310	Ribnica
00050000-555d-bb60-eab5-cc0b2513625d	2364	Ribnica na Pohorju
00050000-555d-bb60-96a8-3a8dbccde8b6	3272	Rimske Toplice
00050000-555d-bb60-98ac-8a6d85de4314	1314	Rob
00050000-555d-bb60-bce0-4da6fcad00a8	5215	Ročinj
00050000-555d-bb60-3ad4-625cee56da7b	3250	Rogaška Slatina
00050000-555d-bb60-5629-6f7e2ffe8127	9262	Rogašovci
00050000-555d-bb60-d500-af6c5fb17aa3	3252	Rogatec
00050000-555d-bb60-54a1-4c4cd2e202f9	1373	Rovte
00050000-555d-bb60-48f3-44ca514f5859	2342	Ruše
00050000-555d-bb60-6771-3e25de780b60	1282	Sava
00050000-555d-bb60-31b0-fb7d08ad5701	6333	Sečovlje/Sicciole
00050000-555d-bb60-2987-f3762ff59af1	4227	Selca
00050000-555d-bb60-8dce-efb5b46d86c5	2352	Selnica ob Dravi
00050000-555d-bb60-f6bb-623ae3c04cd2	8333	Semič
00050000-555d-bb60-c05b-6674f3aad9cc	8281	Senovo
00050000-555d-bb60-075e-155f195cea2e	6224	Senožeče
00050000-555d-bb60-8bea-8e4f0b365158	8290	Sevnica
00050000-555d-bb60-dc17-bc295c488c0c	6210	Sežana
00050000-555d-bb60-478a-51c8fb30b43a	2214	Sladki Vrh
00050000-555d-bb60-dcaf-7f5464ec344e	5283	Slap ob Idrijci
00050000-555d-bb60-af23-7b9c1fca718a	2380	Slovenj Gradec
00050000-555d-bb60-3116-d328b40e3c75	2310	Slovenska Bistrica
00050000-555d-bb60-d1dc-31db12a42493	3210	Slovenske Konjice
00050000-555d-bb60-f08f-3302aea178f3	1216	Smlednik
00050000-555d-bb60-2f8b-385cd35d4fd6	5232	Soča
00050000-555d-bb60-3a18-b0518976720f	1317	Sodražica
00050000-555d-bb60-fff9-6e864dde3d43	3335	Solčava
00050000-555d-bb60-d1e3-d326dbb7f442	5250	Solkan
00050000-555d-bb60-38ea-f58c0ad96975	4229	Sorica
00050000-555d-bb60-2ece-ba77e90fc267	4225	Sovodenj
00050000-555d-bb60-a67e-19449cef0a0a	5281	Spodnja Idrija
00050000-555d-bb60-4b69-350c327a5dda	2241	Spodnji Duplek
00050000-555d-bb60-b6e8-eef0005e148f	9245	Spodnji Ivanjci
00050000-555d-bb60-5e08-bbb54a7457ee	2277	Središče ob Dravi
00050000-555d-bb60-ff4a-7b1a03929f6d	4267	Srednja vas v Bohinju
00050000-555d-bb60-7a46-59fe98597eed	8256	Sromlje 
00050000-555d-bb60-2f8f-f740e4590155	5224	Srpenica
00050000-555d-bb60-1466-76a40c693d48	1242	Stahovica
00050000-555d-bb60-c761-567cbf90de3c	1332	Stara Cerkev
00050000-555d-bb60-6546-768a234ef5a0	8342	Stari trg ob Kolpi
00050000-555d-bb60-0d23-8763e912e72b	1386	Stari trg pri Ložu
00050000-555d-bb60-8497-7387095a8dc0	2205	Starše
00050000-555d-bb60-6a65-349d495d15d2	2289	Stoperce
00050000-555d-bb60-d704-65c556c73ec4	8322	Stopiče
00050000-555d-bb60-1c6e-12890b60cb79	3206	Stranice
00050000-555d-bb60-7ff6-d4dd08ac4e3b	8351	Straža
00050000-555d-bb60-218e-ac2e180ac8fc	1313	Struge
00050000-555d-bb60-6d86-1e1cd97d831c	8293	Studenec
00050000-555d-bb60-e760-14448e959ca8	8331	Suhor
00050000-555d-bb60-9f92-2fab35d2abf9	2233	Sv. Ana v Slovenskih goricah
00050000-555d-bb60-ebce-4c4414b4616f	2235	Sv. Trojica v Slovenskih goricah
00050000-555d-bb60-9f65-3d21ea256a4b	2353	Sveti Duh na Ostrem Vrhu
00050000-555d-bb60-9216-d9502a4300b4	9244	Sveti Jurij ob Ščavnici
00050000-555d-bb60-770c-4c603a9d8e08	3264	Sveti Štefan
00050000-555d-bb60-2482-4df2ad14517e	2258	Sveti Tomaž
00050000-555d-bb60-5857-0cc2f8d67d44	9204	Šalovci
00050000-555d-bb60-6190-67883fc88fee	5261	Šempas
00050000-555d-bb60-be83-e920148f851e	5290	Šempeter pri Gorici
00050000-555d-bb60-1ba8-11b9e70a50ab	3311	Šempeter v Savinjski dolini
00050000-555d-bb60-8ee4-825e902ff9de	4208	Šenčur
00050000-555d-bb60-51ec-3d0ae80a74af	2212	Šentilj v Slovenskih goricah
00050000-555d-bb60-b09a-14d54159eb0e	8297	Šentjanž
00050000-555d-bb60-5cc4-3e809d43924c	2373	Šentjanž pri Dravogradu
00050000-555d-bb60-190f-946f7b1133e2	8310	Šentjernej
00050000-555d-bb60-a79a-fbde96c21bfd	3230	Šentjur
00050000-555d-bb60-16a5-6ce3fd1d9a92	3271	Šentrupert
00050000-555d-bb60-671e-c5e7f5c013ad	8232	Šentrupert
00050000-555d-bb60-9a33-7e4adaff449b	1296	Šentvid pri Stični
00050000-555d-bb60-c75e-cb7227a8a5d8	8275	Škocjan
00050000-555d-bb60-7a23-d0860dcaed89	6281	Škofije
00050000-555d-bb60-7abd-54c81fd4ec36	4220	Škofja Loka
00050000-555d-bb60-d2bd-180e331345d2	3211	Škofja vas
00050000-555d-bb60-a32b-b423d0a78f07	1291	Škofljica
00050000-555d-bb60-a83d-592e853d9a63	6274	Šmarje
00050000-555d-bb60-9280-e23018c556bf	1293	Šmarje - Sap
00050000-555d-bb60-dad6-c0b59027cac2	3240	Šmarje pri Jelšah
00050000-555d-bb60-15bd-fde941d5a1a3	8220	Šmarješke Toplice
00050000-555d-bb60-f95d-7bc6471a58f2	2315	Šmartno na Pohorju
00050000-555d-bb60-12e7-eb8d76bdf0ea	3341	Šmartno ob Dreti
00050000-555d-bb60-fe65-0760f13bfeca	3327	Šmartno ob Paki
00050000-555d-bb60-1123-b1f58251b187	1275	Šmartno pri Litiji
00050000-555d-bb60-7ee2-999080b77559	2383	Šmartno pri Slovenj Gradcu
00050000-555d-bb60-c2d2-0003a5168d0d	3201	Šmartno v Rožni dolini
00050000-555d-bb60-8dce-3a8d0f5e6d39	3325	Šoštanj
00050000-555d-bb60-0e0d-8d1243b3520a	6222	Štanjel
00050000-555d-bb60-2575-ff7638f4b13d	3220	Štore
00050000-555d-bb60-81b4-a1783d5419bc	3304	Tabor
00050000-555d-bb60-d4a6-7490ff6d9411	3221	Teharje
00050000-555d-bb60-ec28-79e4461c2933	9251	Tišina
00050000-555d-bb60-f0b7-4dbb6b3f4bbc	5220	Tolmin
00050000-555d-bb60-c7e8-ba7db474c684	3326	Topolšica
00050000-555d-bb60-8f84-9e371a113807	2371	Trbonje
00050000-555d-bb60-ce01-2722ab159708	1420	Trbovlje
00050000-555d-bb60-f97e-5a2a283b7ec2	8231	Trebelno 
00050000-555d-bb60-687a-db1a8e3a9ae7	8210	Trebnje
00050000-555d-bb60-35c7-40b4a3c19124	5252	Trnovo pri Gorici
00050000-555d-bb60-fadb-0797ae61e60c	2254	Trnovska vas
00050000-555d-bb60-7a0c-15852a5914b4	1222	Trojane
00050000-555d-bb60-63a0-c74268f7d709	1236	Trzin
00050000-555d-bb60-d142-714d71f71bc7	4290	Tržič
00050000-555d-bb60-1b8e-47cdc97d971b	8295	Tržišče
00050000-555d-bb60-3cac-de92543b1ce8	1311	Turjak
00050000-555d-bb60-c661-c4fb886484b4	9224	Turnišče
00050000-555d-bb60-7a73-85ca398be7ac	8323	Uršna sela
00050000-555d-bb60-6da9-ef00a798ff8f	1252	Vače
00050000-555d-bb60-657e-e43810e8da8f	3320	Velenje 
00050000-555d-bb60-0295-e30383346867	3322	Velenje - poštni predali
00050000-555d-bb60-3582-264ee26781b5	8212	Velika Loka
00050000-555d-bb60-4abd-fa52366e7263	2274	Velika Nedelja
00050000-555d-bb60-2ef0-5abee4f32e38	9225	Velika Polana
00050000-555d-bb60-8a3d-4385708d7266	1315	Velike Lašče
00050000-555d-bb60-e38d-2a61d9a37b8e	8213	Veliki Gaber
00050000-555d-bb60-dc13-d0d68bef7992	9241	Veržej
00050000-555d-bb60-5737-280b45d2c4db	1312	Videm - Dobrepolje
00050000-555d-bb60-a65c-918e0586b4ee	2284	Videm pri Ptuju
00050000-555d-bb60-c255-4d83ff22f8a0	8344	Vinica
00050000-555d-bb60-e077-a1967708dc34	5271	Vipava
00050000-555d-bb60-0510-1c742d50fa87	4212	Visoko
00050000-555d-bb60-077f-ce5caf5b724c	1294	Višnja Gora
00050000-555d-bb60-175a-f9737b74f6f1	3205	Vitanje
00050000-555d-bb60-eaa1-4fd126caf3c3	2255	Vitomarci
00050000-555d-bb60-add3-87dc62bfd7fe	1217	Vodice
00050000-555d-bb60-fd44-f12d6d833978	3212	Vojnik\t
00050000-555d-bb60-8eb7-5a8ab499f943	5293	Volčja Draga
00050000-555d-bb60-bbd4-b1239698dbe8	2232	Voličina
00050000-555d-bb60-7c4b-8822bbf829b9	3305	Vransko
00050000-555d-bb60-5a9b-291373d7a073	6217	Vremski Britof
00050000-555d-bb60-8cfe-44ef7e7cd707	1360	Vrhnika
00050000-555d-bb60-12d3-d7e8c0afe31e	2365	Vuhred
00050000-555d-bb60-c8a8-67ebbc6dc2f1	2367	Vuzenica
00050000-555d-bb60-bb48-c11f5dd9b900	8292	Zabukovje 
00050000-555d-bb60-8340-872dd6b60c04	1410	Zagorje ob Savi
00050000-555d-bb60-c483-2a34892e4a56	1303	Zagradec
00050000-555d-bb60-0f55-373c55a31c38	2283	Zavrč
00050000-555d-bb60-27ca-0f69c0912915	8272	Zdole 
00050000-555d-bb60-97b5-162e37a25b21	4201	Zgornja Besnica
00050000-555d-bb60-4c7f-7093fe5c322e	2242	Zgornja Korena
00050000-555d-bb60-32cf-20733dc59950	2201	Zgornja Kungota
00050000-555d-bb60-cda7-b692a68d4430	2316	Zgornja Ložnica
00050000-555d-bb60-4eda-1aa6aee0b621	2314	Zgornja Polskava
00050000-555d-bb60-18b5-d3aade78ae31	2213	Zgornja Velka
00050000-555d-bb60-effe-68c73b00c401	4247	Zgornje Gorje
00050000-555d-bb60-de56-a4b4d7807bbc	4206	Zgornje Jezersko
00050000-555d-bb60-7561-40f36a7cfd83	2285	Zgornji Leskovec
00050000-555d-bb60-0a46-1e074b5e233a	1432	Zidani Most
00050000-555d-bb60-199b-12bb34862120	3214	Zreče
00050000-555d-bb60-014e-cc7c1898ce80	4209	Žabnica
00050000-555d-bb60-4bc9-8e40c2c408c1	3310	Žalec
00050000-555d-bb60-9ad5-2ac36f12a486	4228	Železniki
00050000-555d-bb60-dd28-e509a90553e9	2287	Žetale
00050000-555d-bb60-47cc-134ab69f160e	4226	Žiri
00050000-555d-bb60-cf8f-390b4966800e	4274	Žirovnica
00050000-555d-bb60-3ef4-1c6d7a076637	8360	Žužemberk
\.


--
-- TOC entry 2655 (class 0 OID 4430835)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 4430663)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4430728)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4430847)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4430952)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4430997)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4430876)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4430820)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4430810)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4430987)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4430942)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 4430531)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555d-bb61-9d47-987a215efcff	00010000-555d-bb61-be6c-d4a0a5c4d8a5	2015-05-21 13:02:57	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROZIC6K6/bcU74AGjI510rkil6UQ5Qz7W";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2662 (class 0 OID 4430885)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4430569)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555d-bb61-acb5-e9be872a5f5f	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555d-bb61-06f4-4ceee1d531e4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555d-bb61-f785-bcfc45794fa4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555d-bb61-da3f-c056206be4c5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555d-bb61-54b8-756fbc2b7b5e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555d-bb61-ce1a-3ea5b3518ca9	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2628 (class 0 OID 4430553)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555d-bb61-9d47-987a215efcff	00020000-555d-bb61-da3f-c056206be4c5
00010000-555d-bb61-be6c-d4a0a5c4d8a5	00020000-555d-bb61-da3f-c056206be4c5
\.


--
-- TOC entry 2664 (class 0 OID 4430899)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4430841)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4430791)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 4430628)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4430797)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4430975)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4430697)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 4430540)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555d-bb61-be6c-d4a0a5c4d8a5	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROOTZcMuc06t4AYawSRw1NP9nb9CyaHQi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555d-bb61-9d47-987a215efcff	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2676 (class 0 OID 4431029)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4430743)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4430868)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4430934)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4430775)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4431019)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 4430924)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4430594)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4431069)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4431062)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4430974)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4430765)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4430790)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4430723)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4430920)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4430741)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4430784)
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
-- TOC entry 2360 (class 2606 OID 4430833)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4430860)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4430695)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4430603)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4430660)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4430626)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4430583)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4430568)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4430866)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4430898)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4431014)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4430653)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4430683)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4430839)
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
-- TOC entry 2294 (class 2606 OID 4430673)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4430732)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4430851)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4430958)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4431002)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4430883)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4430824)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4430815)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4430996)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4430949)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4430539)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4430889)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4430557)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4430577)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4430907)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4430846)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4430796)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4430633)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4430806)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4430986)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4430708)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4430552)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4431044)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4430750)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4430874)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4430940)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4430779)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4431028)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4430933)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4430772)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4430655)
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
-- TOC entry 2373 (class 1259 OID 4430867)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4430853)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4430852)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4430751)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4430923)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4430921)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4430922)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4431016)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4431017)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4431018)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4431047)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4431046)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2429 (class 1259 OID 4431045)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4430710)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4430709)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4430662)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4430661)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4430890)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4430785)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4430584)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4430585)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4430910)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4430909)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4430908)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4430733)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4430735)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4430734)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4430819)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4430817)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4430816)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4430818)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4430558)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4430559)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4430875)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4430840)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4430950)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4430951)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4430675)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4430674)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4430676)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4430959)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4430960)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2438 (class 1259 OID 4431072)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 4431071)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2440 (class 1259 OID 4431074)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2441 (class 1259 OID 4431070)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2442 (class 1259 OID 4431073)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4430941)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4430828)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4430827)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4430825)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4430826)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2434 (class 1259 OID 4431064)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 4431063)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4430742)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4430605)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4430604)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4430634)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4430635)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4430809)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4430808)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4430807)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4430774)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4430770)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4430767)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4430768)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4430766)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4430771)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4430769)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4430654)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4430724)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4430726)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4430725)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4430727)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4430834)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4431015)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4430627)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4430696)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4430884)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4430684)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4431003)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4430578)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4430773)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2467 (class 2606 OID 4431205)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 4431190)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2469 (class 2606 OID 4431195)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2465 (class 2606 OID 4431215)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2471 (class 2606 OID 4431185)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2466 (class 2606 OID 4431210)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2468 (class 2606 OID 4431200)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2452 (class 2606 OID 4431120)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2488 (class 2606 OID 4431300)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2486 (class 2606 OID 4431295)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2487 (class 2606 OID 4431290)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2464 (class 2606 OID 4431180)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2494 (class 2606 OID 4431340)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2496 (class 2606 OID 4431330)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4431335)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2484 (class 2606 OID 4431280)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2505 (class 2606 OID 4431375)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2504 (class 2606 OID 4431380)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2503 (class 2606 OID 4431385)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2506 (class 2606 OID 4431400)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2507 (class 2606 OID 4431395)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2508 (class 2606 OID 4431390)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2458 (class 2606 OID 4431155)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 4431150)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4431130)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4431125)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2449 (class 2606 OID 4431105)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2490 (class 2606 OID 4431310)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2472 (class 2606 OID 4431220)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2446 (class 2606 OID 4431085)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2445 (class 2606 OID 4431090)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2491 (class 2606 OID 4431325)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2492 (class 2606 OID 4431320)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2493 (class 2606 OID 4431315)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2462 (class 2606 OID 4431160)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4431170)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2461 (class 2606 OID 4431165)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2476 (class 2606 OID 4431255)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2478 (class 2606 OID 4431245)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2479 (class 2606 OID 4431240)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2477 (class 2606 OID 4431250)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2444 (class 2606 OID 4431075)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 4431080)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2489 (class 2606 OID 4431305)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2485 (class 2606 OID 4431285)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2499 (class 2606 OID 4431350)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2498 (class 2606 OID 4431355)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 4431140)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 4431135)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 4431145)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2501 (class 2606 OID 4431360)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 4431365)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2513 (class 2606 OID 4431425)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4431420)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2511 (class 2606 OID 4431435)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 4431415)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2512 (class 2606 OID 4431430)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2497 (class 2606 OID 4431345)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 4431275)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2481 (class 2606 OID 4431270)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2483 (class 2606 OID 4431260)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2482 (class 2606 OID 4431265)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2509 (class 2606 OID 4431410)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 4431405)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2463 (class 2606 OID 4431175)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4431370)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2447 (class 2606 OID 4431100)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 4431095)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2451 (class 2606 OID 4431110)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2450 (class 2606 OID 4431115)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2473 (class 2606 OID 4431235)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2474 (class 2606 OID 4431230)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2475 (class 2606 OID 4431225)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-21 13:02:57 CEST

--
-- PostgreSQL database dump complete
--

